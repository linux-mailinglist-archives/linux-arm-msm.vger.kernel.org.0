Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C031CEC8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 07:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgELFwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 01:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726008AbgELFwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 01:52:46 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DE8C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 22:52:46 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u15so968747plm.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 22:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CfP4USWuf4jsr8CxicWGhxjxXRopIo0RKfZ+1QBlcmA=;
        b=tKsnlfhUMIet6mwNuBSJVB/HOvSFdB1or5wKLaQq1TqOaLuQIfz6J40GgOHgJYvstQ
         9bZwNbUfiLMUuAPK7keXo0oTrslKfZhuRUScTHyo8PGrC0g9oszz2b0HZPVIBl0Wf1kZ
         ThI6Pfvky1G8iy1fmIxO8HUo5Urt01uf+SCWIgpTTRxlu3zXOHVog55oV/qJSSXImz/0
         hcZ6uwXEvvZ9grqy5whyYu8TqNLwcL75oBYY8OQF7BoOGciQ3Er6BGcoOBPViij7bwJE
         tIoK17AnSaPBZzw9UKrPBfIuxpZrVtfjiPYOWjXGEXWtghhGSDoTRMUAFNOgV0YBS8L1
         EWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CfP4USWuf4jsr8CxicWGhxjxXRopIo0RKfZ+1QBlcmA=;
        b=XOR7xOGZkKBZvkcDZDFoHQsdFb0xIdB3/DOg17G/dhbUn42CrvYRsU/bckDoHCBWN6
         HufrEn9u8AnFOv3Y0+lYUOJsmjmVgqVsC67FEXwh14w6ksssXAY/h/KdpyiEcpAe7U9B
         zGsTWD5h5drzJF/e626/7bqVwt8qYm7RCnBacIKUwtrFXk3hB7tWsaZdEt4g3d3KP+Co
         fWDDURHjgYZY3QJWk2FJTUBfEd9dyGfKd8pFerrGjTPL/IZEQ05q2ZJmXHpfkU7uNEzA
         TLwu9kcGlrBJZopy7CzHGyKv1HHcgYKtq3M7HeAQ7LPfkF4wnOLk9aTuMfEkzv9WKvVi
         Tudw==
X-Gm-Message-State: AGi0Puatft40X4YtXeDj+1oPTJiuqXSCgq1fa+zMEJQzgLacTrOlvopk
        6Pg5boZgJ3t8xB8rMA0oho3WXw==
X-Google-Smtp-Source: APiQypJJ96PeWAU9UnS8z/TMfYOhK8mhlaPNvQrINPQBZdi2Yjt4mmGXCCToUaVU4ys48UnSf1li/w==
X-Received: by 2002:a17:902:a5c2:: with SMTP id t2mr18385800plq.151.1589262765889;
        Mon, 11 May 2020 22:52:45 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm9268767pgl.7.2020.05.11.22.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 22:52:45 -0700 (PDT)
Date:   Mon, 11 May 2020 22:52:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu/qcom: add optional clock for TLB invalidate
Message-ID: <20200512055242.GJ1302550@yoga>
References: <20200509130825.28248-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509130825.28248-1-shawn.guo@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 09 May 06:08 PDT 2020, Shawn Guo wrote:

> On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
> needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
> will not be correctly reflected, causing the system to go into a bad
> state.  Add it as an optional clock, so that platforms that have this
> clock can pass it over DT.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/iommu/qcom_iommu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 0e2a96467767..2f6c6da7d540 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -45,6 +45,7 @@ struct qcom_iommu_dev {
>  	struct device		*dev;
>  	struct clk		*iface_clk;
>  	struct clk		*bus_clk;
> +	struct clk		*tlb_clk;
>  	void __iomem		*local_base;
>  	u32			 sec_id;
>  	u8			 num_ctxs;
> @@ -643,11 +644,20 @@ static int qcom_iommu_enable_clocks(struct qcom_iommu_dev *qcom_iommu)
>  		return ret;
>  	}
>  
> +	ret = clk_prepare_enable(qcom_iommu->tlb_clk);
> +	if (ret) {
> +		dev_err(qcom_iommu->dev, "Couldn't enable tlb_clk\n");
> +		clk_disable_unprepare(qcom_iommu->bus_clk);
> +		clk_disable_unprepare(qcom_iommu->iface_clk);
> +		return ret;
> +	}

Seems this is an excellent opportunity to replace
qcom_iommu_enable_clocks() to clk_bulk_prepare_enable() and disable,
respectively.

> +
>  	return 0;
>  }
>  
>  static void qcom_iommu_disable_clocks(struct qcom_iommu_dev *qcom_iommu)
>  {
> +	clk_disable_unprepare(qcom_iommu->tlb_clk);
>  	clk_disable_unprepare(qcom_iommu->bus_clk);
>  	clk_disable_unprepare(qcom_iommu->iface_clk);
>  }
> @@ -839,6 +849,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  		return PTR_ERR(qcom_iommu->bus_clk);
>  	}
>  
> +	qcom_iommu->tlb_clk = devm_clk_get(dev, "tlb");

Wouldn't "tbu" be a better name for this clock? Given that seems the
actually be the hardware block you're clocking.


That said, I thought we used device links and pm_runtime to ensure that
the TBUs are powered and clocked...

Regards,
Bjorn

> +	if (IS_ERR(qcom_iommu->tlb_clk)) {
> +		dev_dbg(dev, "failed to get tlb clock\n");
> +		qcom_iommu->tlb_clk = NULL;
> +	}
> +
>  	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
>  				 &qcom_iommu->sec_id)) {
>  		dev_err(dev, "missing qcom,iommu-secure-id property\n");
> -- 
> 2.17.1
> 
