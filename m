Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F690257A14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 15:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgHaNIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 09:08:48 -0400
Received: from mga18.intel.com ([134.134.136.126]:21885 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726984AbgHaNIn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 09:08:43 -0400
IronPort-SDR: epgQ2NisbhrzCux6S+AsxqKKo0r2JuYgVrgHJoA52YXrxBLO+RTr2BoGjUcU63+LBM75XG59qL
 3rYMPH2nMGzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="144643457"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="144643457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 06:08:34 -0700
IronPort-SDR: EohOby+7M8jiGk+t8vzztTtibrfD4QbKSTQq1hGxL18iqul7w31+Wm23G0lKBK+P+i0d3SJVq3
 VWCHzD9m0qhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="501331763"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2020 06:08:20 -0700
Subject: Re: [PATCH v1 1/2] mmc: cqhci: add new cqhci_host_ops pre_enable()
 and post_disable()
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Mao Yong <yong.mao@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>
Cc:     kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <1598520783-25250-1-git-send-email-chun-hung.wu@mediatek.com>
 <1598520783-25250-2-git-send-email-chun-hung.wu@mediatek.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <9c0dd5b4-5d9e-e559-81f5-fbf6024b67bb@intel.com>
Date:   Mon, 31 Aug 2020 16:07:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598520783-25250-2-git-send-email-chun-hung.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/08/20 12:33 pm, Chun-Hung Wu wrote:
> Add pre_enable() and post_disable() for cqhci_host_ops.
> Add hook functions before cqhci enable and
> after cqhci disable for platforms need them.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/cqhci.c |    6 ++++++
>  drivers/mmc/host/cqhci.h |    2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
> index cfa87df..697fe40 100644
> --- a/drivers/mmc/host/cqhci.c
> +++ b/drivers/mmc/host/cqhci.c
> @@ -376,6 +376,9 @@ static void cqhci_off(struct mmc_host *mmc)
>  	else
>  		pr_debug("%s: cqhci: CQE off\n", mmc_hostname(mmc));
>  
> +	if (cq_host->ops->post_disable)
> +		cq_host->ops->post_disable(mmc);
> +
>  	mmc->cqe_on = false;
>  }
>  
> @@ -580,6 +583,9 @@ static int cqhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  		__cqhci_enable(cq_host);
>  
>  	if (!mmc->cqe_on) {
> +		if (cq_host->ops->pre_enable)
> +			cq_host->ops->pre_enable(mmc);
> +
>  		cqhci_writel(cq_host, 0, CQHCI_CTL);
>  		mmc->cqe_on = true;
>  		pr_debug("%s: cqhci: CQE on\n", mmc_hostname(mmc));
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index 4377001..89bf6ad 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -206,6 +206,8 @@ struct cqhci_host_ops {
>  	void (*disable)(struct mmc_host *mmc, bool recovery);
>  	void (*update_dcmd_desc)(struct mmc_host *mmc, struct mmc_request *mrq,
>  				 u64 *data);
> +	void (*pre_enable)(struct mmc_host *mmc);
> +	void (*post_disable)(struct mmc_host *mmc);
>  };
>  
>  static inline void cqhci_writel(struct cqhci_host *host, u32 val, int reg)
> 

