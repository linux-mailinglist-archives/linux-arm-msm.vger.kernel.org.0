Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8586B1FEB76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 08:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgFRGaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 02:30:18 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:60301 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725898AbgFRGaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 02:30:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592461816; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=GoNXgc7+2d91O+hXVI16Z9u6/tuLTSjOHfmUUPsJg5M=; b=ob8cOLRafpX+DcI9a55Mri6DUq1dWC8u9loVRF68E9B4bPwVOd4RN5tf5cEiIvMYgvWZ3BkB
 5Yko97dkbsd695bllD/aASE6/NPP3mkn6b7LxeMKJPTM8m3j6/5aN7LjcwSx6/Kt+hpxGZga
 WDt2BnXniizx9LPpL4HlcgY7wOk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5eeb09f5c76a4e7a2a990374 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Jun 2020 06:30:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3240EC433CA; Thu, 18 Jun 2020 06:30:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [183.83.66.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FD31C433C9;
        Thu, 18 Jun 2020 06:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8FD31C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V4 2/2] mmc: sdhci-msm: Use internal voltage control
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Andy Gross <agross@kernel.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1592321779-28556-1-git-send-email-vbadigan@codeaurora.org>
 <1592321779-28556-3-git-send-email-vbadigan@codeaurora.org>
 <CAPDyKFrvvhQPio3FRQmoBgMm1Euvsma_dgGzxA=R8rm0aQgDMQ@mail.gmail.com>
 <40b03630-cdbc-50ee-e483-8ff919f76fb5@codeaurora.org>
 <CAPDyKFrf3rxA-_0wB=bNby2dVSxTwZHSTXeNO5OayQ57Eqiphg@mail.gmail.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <541c95a6-0b89-fdc1-4707-e0a1eef1bf91@codeaurora.org>
Date:   Thu, 18 Jun 2020 12:00:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrf3rxA-_0wB=bNby2dVSxTwZHSTXeNO5OayQ57Eqiphg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/17/2020 7:46 PM, Ulf Hansson wrote:
> On Wed, 17 Jun 2020 at 14:46, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>> Thanks for comments Uffe.
>>
>> On 6/17/2020 3:04 PM, Ulf Hansson wrote:
>>> On Tue, 16 Jun 2020 at 17:38, Veerabhadrarao Badiganti
>>> <vbadigan@codeaurora.org> wrote:
>>>> On qcom SD host controllers voltage switching be done after the HW
>>>> is ready for it. The HW informs its readiness through power irq.
>>>> The voltage switching should happen only then.
>>>>
>>>> Use the internal voltage switching and then control the voltage
>>>> switching using power irq.
>>>>
>>>> IO-bus supply of eMMC would be kept always-on. So set the load
>>>> for this supply to configure it in LPM when eMMC is suspend state
>>>>    and in HPM when eMMC is active.
>>>>
>>>> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
>>>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>>>> Co-developed-by: Vijay Viswanath <vviswana@codeaurora.org>
>>>> Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
>>>> Co-developed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>>>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>>>> ---
>>>>    drivers/mmc/host/sdhci-msm.c | 208 +++++++++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 199 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>> index 15c42b059240..8297b2142748 100644
>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>> @@ -37,7 +37,9 @@
>>>>    #define CORE_PWRCTL_IO_LOW     BIT(2)
>>>>    #define CORE_PWRCTL_IO_HIGH    BIT(3)
>>>>    #define CORE_PWRCTL_BUS_SUCCESS BIT(0)
>>>> +#define CORE_PWRCTL_BUS_FAIL    BIT(1)
>>>>    #define CORE_PWRCTL_IO_SUCCESS BIT(2)
>>>> +#define CORE_PWRCTL_IO_FAIL     BIT(3)
>>>>    #define REQ_BUS_OFF            BIT(0)
>>>>    #define REQ_BUS_ON             BIT(1)
>>>>    #define REQ_IO_LOW             BIT(2)
>>>> @@ -127,6 +129,9 @@
>>>>    /* Timeout value to avoid infinite waiting for pwr_irq */
>>>>    #define MSM_PWR_IRQ_TIMEOUT_MS 5000
>>>>
>>>> +/* Max load for eMMC Vdd-io supply */
>>>> +#define MMC_VQMMC_MAX_LOAD_UA  325000
>>>> +
>>>>    #define msm_host_readl(msm_host, host, offset) \
>>>>           msm_host->var_ops->msm_readl_relaxed(host, offset)
>>>>
>>>> @@ -278,6 +283,7 @@ struct sdhci_msm_host {
>>>>           bool uses_tassadar_dll;
>>>>           u32 dll_config;
>>>>           u32 ddr_config;
>>>> +       bool vqmmc_enabled;
>>>>    };
>>>>
>>>>    static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>>>> @@ -1346,6 +1352,88 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
>>>>                   sdhci_msm_hs400(host, &mmc->ios);
>>>>    }
>>>>
>>>> +static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
>>>> +{
>>>> +       if (IS_ERR(mmc->supply.vmmc))
>>>> +               return 0;
>>>> +
>>>> +       return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
>>>> +}
>>>> +
>>>> +static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
>>>> +                             struct mmc_host *mmc, bool level)
>>>> +{
>>>> +       int ret;
>>>> +       struct mmc_ios ios;
>>>> +
>>>> +       if (msm_host->vqmmc_enabled == level)
>>>> +               return 0;
>>>> +
>>>> +       if (level) {
>>>> +               /* Set the IO voltage regulator to default voltage level */
>>>> +               if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
>>>> +                       ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
>>>> +               else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
>>>> +                       ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;
>>>> +
>>>> +               if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
>>>> +                       ret = mmc_regulator_set_vqmmc(mmc, &ios);
>>>> +                       if (ret < 0) {
>>>> +                               dev_err(mmc_dev(mmc), "%s: vqmmc set volgate failed: %d\n",
>>>> +                                       mmc_hostname(mmc), ret);
>>>> +                               goto out;
>>>> +                       }
>>>> +               }
>>>> +               ret = regulator_enable(mmc->supply.vqmmc);
>>>> +       } else {
>>>> +               ret = regulator_disable(mmc->supply.vqmmc);
>>>> +       }
>>>> +
>>>> +       if (ret)
>>>> +               dev_err(mmc_dev(mmc), "%s: vqmm %sable failed: %d\n",
>>>> +                       mmc_hostname(mmc), level ? "en":"dis", ret);
>>>> +       else
>>>> +               msm_host->vqmmc_enabled = level;
>>>> +out:
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static int msm_config_vqmmc_mode(struct sdhci_msm_host *msm_host,
>>>> +                             struct mmc_host *mmc, bool hpm)
>>>> +{
>>>> +       int load, ret;
>>>> +
>>>> +       load = hpm ? MMC_VQMMC_MAX_LOAD_UA : 0;
>>>> +       ret = regulator_set_load(mmc->supply.vqmmc, load);
>>>> +       if (ret)
>>>> +               dev_err(mmc_dev(mmc), "%s: vqmmc set load failed: %d\n",
>>>> +                       mmc_hostname(mmc), ret);
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
>>>> +                             struct mmc_host *mmc, bool level)
>>>> +{
>>>> +       int ret;
>>>> +       bool always_on;
>>>> +
>>>> +       if (IS_ERR(mmc->supply.vqmmc)           ||
>>> White space.
>>>
>>>> +           (mmc->ios.power_mode == MMC_POWER_UNDEFINED))
>>>> +               return 0;
>>>> +       /*
>>>> +        * For eMMC don't turn off Vqmmc, Instead just configure it in LPM
>>>> +        * and HPM modes by setting the right amonut of load.
>>> /s/right amonut of load/corresponding load
>>>
>>>> +        */
>>>> +       always_on = mmc->card && mmc_card_mmc(mmc->card);
>>>> +
>>>> +       if (always_on)
>>>> +               ret = msm_config_vqmmc_mode(msm_host, mmc, level);
>>>> +       else
>>>> +               ret = msm_toggle_vqmmc(msm_host, mmc, level);
>>> I am worried that this isn't really doing what you think it does.
>>> always_on may not always be set for an eMMC.
>>>
>>> This is because the mmc->card doesn't get assigned until the
>>> initialization of the eMMC has been completed. In other words, way
>>> after VCC and VCCQ have been turned on and changed voltage levels.
>> For the very first time, i have to enable the vqmmc.
>> And second time on-wards I have to set load instead of turning vqmmc off
>> / on.
>>
>> This condition helps me in doing exactly the same.
>>
>> This gets invoked first time when  mmc_power_up() is called.
>> Yes, by that time card won't be initialized. So this check fails and
>> allows to turn on the regulator instead of setting load.
>>
>> After that, this gets invoked only next time mmc_power_up/off() is called
>> which is during mmc_suspend/resume.
> I see.
>
> That assumes the initialization always works at the first attempt, so
> no re-try or power cycle gets done in some error/reset path.
>
>> By this time card is initialized, it allows to set load.
> Okay, I get it. Thanks for clarifying.
>
> Perhaps you can add a small comment about this in the code, so we
> don't forget the reasons why the code looks like this.
Sure. Will update comment with this info.
>>
>>> Moreover, mmc_card_mmc() is also about legacy MMC cards, not solely for eMMCs.
>> Okay. But on qcom platform, we have support for only eMMC/SD/SDIO.
>> So this mmc_card_mmc() meets my requirements!!! Allows only eMMC not SD
>> & SDIO.
> Well, eMMC is fairly similar to MMC, from a basic functionality point
> of view. So, I am quite sure you can get it to work with your
> controller, even if it's not officially supported.
>>> If you want special treatment of an eMMC, I think it's better to use
>>> the DT bindings Documentation/devicetree/bindings/mmc/mmc-card.txt. If
>>> you have such a subnode, that indicates that there is an eMMC card
>>> attached.
> That said, if you don't like the pure DT based solution, as I
> suggested above - at least extend mmc_card_mmc() with checking the
> MMC_CAP_NONREMOVABLE flag.
sure. Will update it. Thank you.
>
> [...]
>
> Kind regards
> Uffe
