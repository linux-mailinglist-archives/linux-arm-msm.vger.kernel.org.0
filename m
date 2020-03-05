Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D458217A1CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 10:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgCEI74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 03:59:56 -0500
Received: from mga09.intel.com ([134.134.136.24]:57937 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgCEI7z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 03:59:55 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 00:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,517,1574150400"; 
   d="scan'208";a="287609667"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2020 00:59:51 -0800
Subject: Re: [PATCH V2] mmc: sdhci-msm: Disable CQE during SDHC reset
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>
References: <1582890639-32072-1-git-send-email-vbadigan@codeaurora.org>
 <1583322863-21790-1-git-send-email-vbadigan@codeaurora.org>
 <da449444-1878-e387-6ebf-4ddb282a9b71@intel.com>
 <1430237a-9dc5-f046-1dfe-1d5c09c16ead@codeaurora.org>
 <3a1783c2-e8bb-f5af-4d3e-f4a45b487f0e@intel.com>
 <0e737f52-767f-05d4-829b-4f76c084062c@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <460b7cbe-71f5-4bea-673f-2075ee5c5d6a@intel.com>
Date:   Thu, 5 Mar 2020 10:59:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0e737f52-767f-05d4-829b-4f76c084062c@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/03/20 6:50 pm, Veerabhadrarao Badiganti wrote:
> 
> On 3/4/2020 7:40 PM, Adrian Hunter wrote:
>> On 4/03/20 3:10 pm, Veerabhadrarao Badiganti wrote:
>>> Hi Adrian
>>>
>>> On 3/4/2020 5:58 PM, Adrian Hunter wrote:
>>>> On 4/03/20 1:54 pm, Veerabhadrarao Badiganti wrote:
>>>>> When SDHC gets reset (E.g. in suspend path), CQE also gets reset
>>>>> and goes to disable state. But s/w state still points it as CQE
>>>>> is in enabled state. Since s/w and h/w states goes out of sync,
>>>>> it results in s/w request timeout for subsequent CQE requests.
>>>>>
>>>>> To synchronize CQE s/w and h/w state during SDHC reset,
>>>>> explicitly disable CQE after reset.
>>>> Shouldn't you be calling cqhci_suspend() / cqhci_resume() in the suspend
>>>> and
>>>> resume paths?
>>> This issue is seen during mmc runtime suspend.  I can add it
>>> sdhci_msm_runtime_suspend
>>>
>>> but sdhci_msm runtime delay is aggressive, its 50ms. It may get invoked very
>>> frequently.
>>>
>>> So Im of the opinion that disabling CQE very often from platform runtime
>>> suspend is overkill.
>> It doesn't look like sdhci-msm calls any sdhci.c pm ops, so how does SDHC
>> get reset?
> 
> With MMC_CAP_AGGRESSIVE_PM flag enabled, it getting called from
> mmc_runtime_suspend()
> 
> Below is the call stack()
> 
>    sdhci_reset
>   sdhci_do_reset
>   sdhci_init
>   sdhci_set_ios
>   mmc_set_initial_state
>   mmc_power_off
>  _mmc_suspend
>   mmc_runtime_suspend
> 

OK, cqhci_suspend does the right thing, but it is not an
appropriate function for this.  I suggest introducing
cqhci_deactivate() as below.

From: Adrian Hunter <adrian.hunter@intel.com>
Date: Thu, 5 Mar 2020 10:42:09 +0200
Subject: [PATCH] mmc: cqhci: Add cqhci_deactivate()

Host controllers can reset CQHCI either directly or as a consequence of
host controller reset. Add cqhci_deactivate() which puts the CQHCI
driver into a state that is consistent with that.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/cqhci.c | 6 +++---
 drivers/mmc/host/cqhci.h | 5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
index e2ea2c4b6b94..d8d024a1682b 100644
--- a/drivers/mmc/host/cqhci.c
+++ b/drivers/mmc/host/cqhci.c
@@ -298,16 +298,16 @@ static void __cqhci_disable(struct cqhci_host *cq_host)
 	cq_host->activated = false;
 }
 
-int cqhci_suspend(struct mmc_host *mmc)
+int cqhci_deactivate(struct mmc_host *mmc)
 {
 	struct cqhci_host *cq_host = mmc->cqe_private;
 
-	if (cq_host->enabled)
+	if (cq_host->enabled && cq_host->activated)
 		__cqhci_disable(cq_host);
 
 	return 0;
 }
-EXPORT_SYMBOL(cqhci_suspend);
+EXPORT_SYMBOL(cqhci_deactivate);
 
 int cqhci_resume(struct mmc_host *mmc)
 {
diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index def76e9b5cac..8648846a0213 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -230,7 +230,10 @@ irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
 		      int data_error);
 int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
 struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
-int cqhci_suspend(struct mmc_host *mmc);
+static inline int cqhci_suspend(struct mmc_host *mmc)
+{
+	return cqhci_deactivate(mmc);
+}
 int cqhci_resume(struct mmc_host *mmc);
 
 #endif
-- 
2.17.1


Also, it would be more logical to deactivate prior to the reset i.e.

+    if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL))
+        cqhci_deactivate(host->mmc);
+    sdhci_reset(host, mask);


Also, other drivers using cqhci, should probably do this too, although
some of them do not reset cqhci with sdhci so perhaps do not need to.

>>>>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>>>>> ---
>>>>> Changes since V1:
>>>>>      - Disable CQE only when SDHC undergoes s/w reset for all.
>>>>> ---
>>>>>    drivers/mmc/host/sdhci-msm.c | 9 ++++++++-
>>>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>>> index 53b79ee..75929d3 100644
>>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>>> @@ -1823,6 +1823,13 @@ static void sdhci_msm_set_regulator_caps(struct
>>>>> sdhci_msm_host *msm_host)
>>>>>        pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
>>>>>    }
>>>>>    +static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
>>>>> +{
>>>>> +    sdhci_reset(host, mask);
>>>>> +    if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL))
>>>>> +        cqhci_suspend(host->mmc);
>>>>> +}
>>>>> +
>>>>>    static const struct sdhci_msm_variant_ops mci_var_ops = {
>>>>>        .msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
>>>>>        .msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
>>>>> @@ -1861,7 +1868,7 @@ static void sdhci_msm_set_regulator_caps(struct
>>>>> sdhci_msm_host *msm_host)
>>>>>    MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
>>>>>      static const struct sdhci_ops sdhci_msm_ops = {
>>>>> -    .reset = sdhci_reset,
>>>>> +    .reset = sdhci_msm_reset,
>>>>>        .set_clock = sdhci_msm_set_clock,
>>>>>        .get_min_clock = sdhci_msm_get_min_clock,
>>>>>        .get_max_clock = sdhci_msm_get_max_clock,
>>>>>

