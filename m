Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBFA257A19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 15:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgHaNKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 09:10:01 -0400
Received: from mga12.intel.com ([192.55.52.136]:59593 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgHaNKA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 09:10:00 -0400
IronPort-SDR: fWuo1xYGFKCMaCjvr9b4sZIWxDvM3knl6K+vUfHsCYJY0apWLS7v5VWLupU3xhXv7Wm+QjbNPR
 g7Ce9wFsdjTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136494485"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="136494485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 06:10:00 -0700
IronPort-SDR: qm9FbLBXaIcybQOvam8eKnyKCl+WY/QLxKdVBWNIhQREYbX7phv9e3DVpQHTdb/nA8aLocV435
 qeYEwmqJtKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="501332255"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2020 06:09:45 -0700
Subject: Re: [PATCH v1 2/2] mmc: mediatek: add pre_enable() and post_disable()
 hook function
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
 <1598520783-25250-3-git-send-email-chun-hung.wu@mediatek.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <29d14e57-a016-af60-374d-70a6c267833e@intel.com>
Date:   Mon, 31 Aug 2020 16:09:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598520783-25250-3-git-send-email-chun-hung.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/08/20 12:33 pm, Chun-Hung Wu wrote:
> CQHCI_ENABLE bit in CQHCI_CFG should be disabled
> after msdc_cqe_disable(), and should be enabled before
> msdc_ceq_enable() for MTK platform.
> Add hook functions for cqhci_host_ops->pre_enable() and
> cqhci_host_ops->post_disable().
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/mtk-sd.c |   22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4e2583f..f53e11b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2282,6 +2282,26 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>  	}
>  }
>  
> +static void msdc_cqe_pre_enable(struct mmc_host *mmc)
> +{
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	u32 reg;
> +
> +	reg = cqhci_readl(cq_host, CQHCI_CFG);
> +	reg |= CQHCI_ENABLE;
> +	cqhci_writel(cq_host, reg, CQHCI_CFG);
> +}
> +
> +static void msdc_cqe_post_disable(struct mmc_host *mmc)
> +{
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	u32 reg;
> +
> +	reg = cqhci_readl(cq_host, CQHCI_CFG);
> +	reg &= ~CQHCI_ENABLE;
> +	cqhci_writel(cq_host, reg, CQHCI_CFG);
> +}
> +
>  static const struct mmc_host_ops mt_msdc_ops = {
>  	.post_req = msdc_post_req,
>  	.pre_req = msdc_pre_req,
> @@ -2301,6 +2321,8 @@ static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>  static const struct cqhci_host_ops msdc_cmdq_ops = {
>  	.enable         = msdc_cqe_enable,
>  	.disable        = msdc_cqe_disable,
> +	.pre_enable = msdc_cqe_pre_enable,
> +	.post_disable = msdc_cqe_post_disable,
>  };
>  
>  static void msdc_of_property_parse(struct platform_device *pdev,
> 

