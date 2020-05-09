Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C949D1CC1BD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 15:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgEINVZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 09:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgEINVZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 09:21:25 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F24C061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2020 06:21:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so5149372wra.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2020 06:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A6TtVR4HE6unY9v6nCG9GU0OO2uKkjUi5+GJSeht1Ng=;
        b=ruggBVJsEWvTdphLmqej/bZXdJgDfpZjVhXvl3qWfq85fSHiil8HO7jVDNm7nOLMO9
         EQiIRD06gSlwFsnnukEK/I8R5yv+5bzI/yyAqeX5he5GIuTbcKz+rvii6sL+8riHBtaG
         8CPrhPuWmZ3kBZzRoMJtuQg3VJekst2BRgcR/cB69Kw3JqvF35+rTyYabw1W9WM4szLW
         K7dh3NcpXEKQgEzvjJgqKHzKAALEE7JovkN0zOj5Mh+9hLacfq/WZb7flnh0+C69yzUA
         weQ0/mKCVzEtF7Hc0WUyL2LcnR/TGER8XEAUguoQ19+TkPgaLEQrmlOCWNiyMi2DUcVK
         LpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A6TtVR4HE6unY9v6nCG9GU0OO2uKkjUi5+GJSeht1Ng=;
        b=O6NKCGeVnM+YBfLFnIYrV8uCrOOD2JQr7cV+TO6k5pXCVhdP2tZD2qFnuKJU3jdSm2
         b/Ko5NcUTwVaHR6ZE68KhIL67H3bll3dS511XoUoee+veUfEGksWi5bjIUSCvi2jHddp
         wv8qrbZn3IeGr8nUuYBkEvseBlL841R2UthNf8bliU+QYyZPmMMScktKGVGyy2+EMajM
         NTMWxviqs/tCU87W/B9c4y17siXhINuqEpN4718s+kcMShMEzcxw64A8WlKQLSulQDGC
         Ab1aX9BqSUeAUJzwPQ/oW3bvU4FiGFIVXzLYAzzcywrrZaTe7hwxFc8q9itWM4lUE7Hf
         BObQ==
X-Gm-Message-State: AGi0PuatgPW0TfV+cjlOQxTJ9ZrV2BqEUTf9un9sI7OhxLdX4p7jfx2/
        Ucz5Ht9VRpFXG3l5WkskidStLQ==
X-Google-Smtp-Source: APiQypKwBnfH8JXEfGcRsGXGOXgWr5/woVC4Th/Pwv3GchrPzvPNHSUozdj3z3hAEoNItxBUWDeXjw==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr9110301wro.201.1589030482524;
        Sat, 09 May 2020 06:21:22 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-166.ip.btc-net.bg. [212.5.158.166])
        by smtp.googlemail.com with ESMTPSA id a187sm18029715wmh.40.2020.05.09.06.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2020 06:21:22 -0700 (PDT)
Subject: Re: [PATCH] iommu/qcom: add optional clock for TLB invalidate
To:     Shawn Guo <shawn.guo@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
References: <20200509130825.28248-1-shawn.guo@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e8150781-6000-dedc-ca10-6cee232c4364@linaro.org>
Date:   Sat, 9 May 2020 16:21:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200509130825.28248-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 5/9/20 4:08 PM, Shawn Guo wrote:
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

IMO, devm_clk_get_optional() would be better.

> +	if (IS_ERR(qcom_iommu->tlb_clk)) {
> +		dev_dbg(dev, "failed to get tlb clock\n");
> +		qcom_iommu->tlb_clk = NULL;
> +	}
> +
>  	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
>  				 &qcom_iommu->sec_id)) {
>  		dev_err(dev, "missing qcom,iommu-secure-id property\n");
> 

-- 
regards,
Stan
