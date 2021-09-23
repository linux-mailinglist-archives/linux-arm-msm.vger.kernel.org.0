Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8153416093
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 16:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241583AbhIWOI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 10:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241480AbhIWOI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 10:08:57 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D4CC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 07:07:25 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w19so9772751oik.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rl01Ta80Yr4ByQxSLkYQ7H+fLAzMAWO93dhfRjw2UBs=;
        b=r7u1PwpwArC9EAvuU3cKy1s11clM2dr6mzAczapPC7cfvKFhrz8nAQMlomqzRe1N2k
         68ElptbGuwomurTUpjy0/gJRS4hU0mmdTsmgriUoyh8WKA+SLGeJC1Jcb4bSSIyjWE5P
         NfgM9Vedp9PZoOlu5pc7vayw8N1RIbOIuxExmuGIIrtqiYa9F5kL+vhPQUPRs2uz4Sc+
         2RhtSZsRuuzsm5RnlCGdSEJJB7s8Rkb+xTdE2YT7ZZR5KZ/2yQ2gPv+aMA8pNErHFRZZ
         YTyU6+xa3FLABE2GFpQz7LxvdlXSBvNhY/M0MH5i+VCt7ynf+/VN1QQ/BHc5DVcoxoES
         ZzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rl01Ta80Yr4ByQxSLkYQ7H+fLAzMAWO93dhfRjw2UBs=;
        b=uWB30w5w+QPiC/yeluVgH0pIWzQje3gdOTqgsMbrXKY6hielz2AJzXIcJppa+zyeYY
         NMb5vWGnPd98nJlKkEQN70zGiePvFGwbasCZfg4cnXSBnOcuRuBTrHlYlgrniZpbQCQN
         VvgDXNN35kwmvRt3hwCe0plF+YPsyn1s7OAK6kYSOHP3Hk0xWGt/v+BJsA1uNjBX387A
         uSx7Y6z7pDEkjMQSlomfAKH1af/FvxDnvKZZspQRY9mHjAkPjLqBxe2wFtc7+yXzfW4d
         4DWWIDtzmcRvbFXRRdPpqI8mrLM/5oPvkT9641/Wd0BBuLnFmVgKNmeIAtp4GGB8lcjy
         LWFg==
X-Gm-Message-State: AOAM5322CmZlgm6Wk0dCxxbNx/obbGRKL0YMyCirQ9stWpBPbWdAyUt5
        B+DZRR20Lid5oQKqVnTFcNYDc0S4fpE2jw==
X-Google-Smtp-Source: ABdhPJylXh2NQzqJ/PBHEG9jhjm+DJT6YzzUeNPQGad7rheR/BDfVigl0ZRlbVf7Q2A+tNrZQzi6SQ==
X-Received: by 2002:a05:6808:2113:: with SMTP id r19mr12357957oiw.69.1632406045189;
        Thu, 23 Sep 2021 07:07:25 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r23sm1275221otu.54.2021.09.23.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 07:07:24 -0700 (PDT)
Date:   Thu, 23 Sep 2021 07:08:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2] phy: qcom-qusb2: Fix a memory leak on probe
Message-ID: <YUyKRTemi7A1bqTE@ripper>
References: <20210922233548.2150244-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922233548.2150244-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Sep 16:35 PDT 2021, Vladimir Zapolskiy wrote:

> On success nvmem_cell_read() returns a pointer to a dynamically allocated
> buffer, and therefore it shall be freed after usage.
> 
> The issue is reported by kmemleak:
> 
>   # cat /sys/kernel/debug/kmemleak
>   unreferenced object 0xffff3b3803e4b280 (size 128):
>     comm "kworker/u16:1", pid 107, jiffies 4294892861 (age 94.120s)
>     hex dump (first 32 bytes):
>       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     backtrace:
>       [<000000007739afdc>] __kmalloc+0x27c/0x41c
>       [<0000000071c0fbf8>] nvmem_cell_read+0x40/0xe0
>       [<00000000e803ef1f>] qusb2_phy_init+0x258/0x5bc
>       [<00000000fc81fcfa>] phy_init+0x70/0x110
>       [<00000000e3d48a57>] dwc3_core_soft_reset+0x4c/0x234
>       [<0000000027d1dbd4>] dwc3_core_init+0x68/0x990
>       [<000000001965faf9>] dwc3_probe+0x4f4/0x730
>       [<000000002f7617ca>] platform_probe+0x74/0xf0
>       [<00000000a2576cac>] really_probe+0xc4/0x470
>       [<00000000bc77f2c5>] __driver_probe_device+0x11c/0x190
>       [<00000000130db71f>] driver_probe_device+0x48/0x110
>       [<0000000019f36c2b>] __device_attach_driver+0xa4/0x140
>       [<00000000e5812ff7>]  bus_for_each_drv+0x84/0xe0
>       [<00000000f4bac574>] __device_attach+0xe4/0x1c0
>       [<00000000d3beb631>] device_initial_probe+0x20/0x30
>       [<000000008019b9db>] bus_probe_device+0xa4/0xb0
> 
> Fixes: ca04d9d3e1b1 ("phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v1 to v2:
> * fixed a memory leak in case of reading a zero value and return,
> * corrected the fixed commit, the memory leak is present before a rename.
> 
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 3c1d3b71c825..f1d97fbd1331 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -561,7 +561,7 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>  {
>  	struct device *dev = &qphy->phy->dev;
>  	const struct qusb2_phy_cfg *cfg = qphy->cfg;
> -	u8 *val;
> +	u8 *val, hstx_trim;
>  
>  	/* efuse register is optional */
>  	if (!qphy->cell)
> @@ -575,7 +575,13 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>  	 * set while configuring the phy.
>  	 */
>  	val = nvmem_cell_read(qphy->cell, NULL);
> -	if (IS_ERR(val) || !val[0]) {
> +	if (IS_ERR(val)) {
> +		dev_dbg(dev, "failed to read a valid hs-tx trim value\n");
> +		return;
> +	}
> +	hstx_trim = val[0];
> +	kfree(val);

I don't see any additional value added by the introduction of
"hstx_trim", compared to v1.

However, it certainly makes sense if you change this to:

ret = nvmem_cell_read_u8(qphy->cell, NULL, &hstx_trim);
if (ret < 0 || !hstx_trim) {
	dev_dbg(dev, "failed to read a valid hs-tx trim value\n");
	return;
}


In which case you don't need the kfree(), and you can drop "val"...

Regards,
Bjorn

> +	if (!hstx_trim) {
>  		dev_dbg(dev, "failed to read a valid hs-tx trim value\n");
>  		return;
>  	}
> @@ -583,12 +589,10 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>  	/* Fused TUNE1/2 value is the higher nibble only */
>  	if (cfg->update_tune1_with_efuse)
>  		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
> -				 val[0] << HSTX_TRIM_SHIFT,
> -				 HSTX_TRIM_MASK);
> +				 hstx_trim << HSTX_TRIM_SHIFT, HSTX_TRIM_MASK);
>  	else
>  		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
> -				 val[0] << HSTX_TRIM_SHIFT,
> -				 HSTX_TRIM_MASK);
> +				 hstx_trim << HSTX_TRIM_SHIFT, HSTX_TRIM_MASK);
>  }
>  
>  static int qusb2_phy_set_mode(struct phy *phy,
> -- 
> 2.33.0
> 
