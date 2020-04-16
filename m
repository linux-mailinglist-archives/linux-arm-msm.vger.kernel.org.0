Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEB31ABD96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 12:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504714AbgDPKGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 06:06:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:56743 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504705AbgDPKGr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 06:06:47 -0400
IronPort-SDR: Nq05mi+w52VvGnBb8n1S98bRJjIY+6PXI3tyr3uuNTt01kiMiH3PqEx/7awwGfrgIWCQkYJj61
 8JBzyzKLY9Pg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 03:06:46 -0700
IronPort-SDR: Vr12MW/9ZzBxLfye5tyxFa71gfrlZA0G9NYn1sGmSqimIZipgDH53n1pWA5b17dmbXuu5MNac8
 gEj5Xkj1ruhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="363941609"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2020 03:06:43 -0700
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable ADMA length mismatch error
 interrupt
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org
Cc:     bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>
References: <1586706808-27337-5-git-send-email-vbadigan@codeaurora.org>
 <1586711302-3552-1-git-send-email-vbadigan@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <07a122bc-06a0-05fd-cec6-9f7ca31beb9d@intel.com>
Date:   Thu, 16 Apr 2020 13:05:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1586711302-3552-1-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/20 8:07 pm, Veerabhadrarao Badiganti wrote:
> ADMA_ERR_SIZE_EN bit of VENDOR_SPECIFIC_FUNC register controls
> ADMA length mismatch error interrupt. Enable it by default.
> 
> And update all bit shift defines with BIT macro.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-msm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 482045b..7d744f9 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -56,19 +56,19 @@
>  #define CORE_FLL_CYCLE_CNT	BIT(18)
>  #define CORE_DLL_CLOCK_DISABLE	BIT(21)
>  
> -#define CORE_VENDOR_SPEC_POR_VAL 0xa1c
> +#define CORE_VENDOR_SPEC_POR_VAL 0xa9c
>  #define CORE_CLK_PWRSAVE	BIT(1)
>  #define CORE_HC_MCLK_SEL_DFLT	(2 << 8)
>  #define CORE_HC_MCLK_SEL_HS400	(3 << 8)
>  #define CORE_HC_MCLK_SEL_MASK	(3 << 8)
> -#define CORE_IO_PAD_PWR_SWITCH_EN	(1 << 15)
> -#define CORE_IO_PAD_PWR_SWITCH  (1 << 16)
> +#define CORE_IO_PAD_PWR_SWITCH_EN	BIT(15)
> +#define CORE_IO_PAD_PWR_SWITCH	BIT(16)
>  #define CORE_HC_SELECT_IN_EN	BIT(18)
>  #define CORE_HC_SELECT_IN_HS400	(6 << 19)
>  #define CORE_HC_SELECT_IN_MASK	(7 << 19)
>  
> -#define CORE_3_0V_SUPPORT	(1 << 25)
> -#define CORE_1_8V_SUPPORT	(1 << 26)
> +#define CORE_3_0V_SUPPORT	BIT(25)
> +#define CORE_1_8V_SUPPORT	BIT(26)
>  #define CORE_VOLT_SUPPORT	(CORE_3_0V_SUPPORT | CORE_1_8V_SUPPORT)
>  
>  #define CORE_CSR_CDC_CTLR_CFG0		0x130
> 

