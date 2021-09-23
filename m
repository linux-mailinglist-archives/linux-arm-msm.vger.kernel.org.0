Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F754160DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 16:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241467AbhIWOTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 10:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241308AbhIWOTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 10:19:36 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A1AC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 07:18:04 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id s24so7286656oij.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 07:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qtSma9q9BqHYrVg9rCdNIMKY6V64T/6gLqQcxTokY2M=;
        b=PYEK0I2XVXfutbxezOSYeATdb6rGXwAQHfSEx+N+ml8euVsQ8kga/0pN+nOjlvvY/w
         UgJZvbGfxXV0iwfmvBl5e0XNqLt9EDs9AKmhmJrnhmvadPJGnbmXN+FrQyyFL6afSo1D
         phey5q9KL58F/BEuggCvEAymjdshEo8iSFy2wF0hunrH3RlkfbIKgM8sbuD6g/2XEMhL
         zwdACGRNdghy0ZPg+e9B4Tq5FLw0Z32dEjeLt7F2rfc3GQ7VbeG34OmfJrnlZQXNPiKi
         /ksnhOEMiFL/K4NKcBRrb6U9lwIQcNRfL/BkBMJdtDS3m2q+4hRRUoa3r83F4fYAHmd4
         VEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qtSma9q9BqHYrVg9rCdNIMKY6V64T/6gLqQcxTokY2M=;
        b=EbPIPjBRCtclcNyo3OkyNKYqj8K7OrynGjMOFCKKrogj94lhEd5TSYcn9cHP+X9zdw
         XYJzVRTHB1YEja84oOfVX9HemSR0LxRQNKzVzgGqQWXVaRYCWP4dS0hLTqXKK9PpKEsS
         eDmarbUjqox/Mjz3CgjsLZsHXITSGaagVK3CHM2LNp6nuSUjnYQU37i6QkbecrM1sEpU
         jRjUAQ/MtEu4PFadBDiwuoWTb5X+4Q8WOGny/pzImPJWZyIZvBlYpm5o6REshi3Hn2zc
         T2b+U71oBW+bHsKcodHUFVtf0aww7Sk8xF41UilwUVMUOpwwhM/EQQohiTFoJh9VeQfV
         iyIw==
X-Gm-Message-State: AOAM533ju8h2al3oj2k89HjElWVyqnRP1eIjKXABnSv+gR6QBh72mU98
        tZ6B/oPpRTG02Zj5JIjH+XVA7A==
X-Google-Smtp-Source: ABdhPJxsgwpyvgQak9HZi9WjKrznb7X1aRRESpUMtD9ho2g2JDLxjinqTHA6WvSWzVpXGwyE2g0KnA==
X-Received: by 2002:a05:6808:14d6:: with SMTP id f22mr12790454oiw.132.1632406683800;
        Thu, 23 Sep 2021 07:18:03 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g5sm1401986oof.29.2021.09.23.07.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 07:18:03 -0700 (PDT)
Date:   Thu, 23 Sep 2021 07:18:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2] phy: qcom-qusb2: Fix a memory leak on probe
Message-ID: <YUyMw9QqjKFMOEf1@ripper>
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

Should have read your two replies in opposite order and missed your
reason for not going to the newer API and the fact that v1 still leaks
the memory if the read value is 0.


So, this looks good and as you said, we should follow up with a cleanup
by replacing the nvmem_cell_read().

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

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
