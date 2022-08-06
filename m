Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBE658B622
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 16:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbiHFOfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 10:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiHFOfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 10:35:39 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF13DFCE
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Aug 2022 07:35:38 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id u133so4548750pfc.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Aug 2022 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1D/80i9Z0nZkycuUkNoAcEIyiKHwsYEJG9bfZe9RA6k=;
        b=Oy8rIZsIwYOxTINnlEQ/wP6W+gHg55yQUtXB1EmEw9aBCIPIaF/ZdE8jqBapGNxi4b
         QjD009j2OxcYZwnFJIZULyKiMjooSxv5d5IabX0ltoSJHISNjq6dhtCWKMH0rQVdB48l
         ZTz6Wb5ZYLwrFOtpa655fEa9LfX+4Fucae0cqtzggvTJiT6sHpoYP13JeXz1UgIQvetG
         Wa3WG09iZL0YdRi5Yw+J4cnb7jTa/KFFkDNlXnFwOQYAILDjL9HqJIFuFyMGgbM35mD6
         snUZVan7Yvn4kpxmBRQcI3Wxiws9QVeLlep0zYEHGxgOLz20X6Vidoz8uR2JvGEWrvCd
         X0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1D/80i9Z0nZkycuUkNoAcEIyiKHwsYEJG9bfZe9RA6k=;
        b=vLBT5pAfLz6Y4DbwH72SuhQCgJZVWjm1BQAyAtKDkeMMiMbO5GqKQCVAhVRFz0d85c
         hPj67wSDsU8bA+RBclCDjJBIXM/4o17nJbxTkUzrgvMBOITTg4QHUXeLKgv0RU4arRQi
         DtJ5COtgsnlh1VylfnrOA2GLHr18KqbS7oDZQzxK2EJubeOigmXGn1SHpsnhZI+cSy4z
         8nKrBtaUcj6uxf9RrGUkC+AW1BH7hVtAsmiqnAqqFDxI3+I/0+qAxQVWKStIn1F1mN53
         9v6P+b9HftSHMO0ePYIibTV7+9TX82u/5VlIqNLlDMOYZIwYNXFfYz1+cm6eYvjVLx0w
         gI4Q==
X-Gm-Message-State: ACgBeo39lG5NH7Uj7CAVIWgutHSzpaPT83Ute8U9U9XyjvLSzgQBadh/
        HuHgaJLa4s3vMFsaM2pmpq+O
X-Google-Smtp-Source: AA6agR5WB0gMQVi/j7aZbv3bvTE6aBfq2g85CHNUCRmMU+FdolPTbBfM9RTyCSvYwZQy0jfkrqYK7w==
X-Received: by 2002:a63:5650:0:b0:41a:dfa4:bdee with SMTP id g16-20020a635650000000b0041adfa4bdeemr9583170pgm.515.1659796537541;
        Sat, 06 Aug 2022 07:35:37 -0700 (PDT)
Received: from thinkpad ([117.202.188.20])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902c38600b0016d27cead72sm5029259plg.196.2022.08.06.07.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 07:35:37 -0700 (PDT)
Date:   Sat, 6 Aug 2022 20:05:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] usb: dwc3: qcom: fix runtime PM wakeup
Message-ID: <20220806143529.GF14384@thinkpad>
References: <20220804151001.23612-1-johan+linaro@kernel.org>
 <20220804151001.23612-6-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804151001.23612-6-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 04, 2022 at 05:09:57PM +0200, Johan Hovold wrote:
> A device must enable wakeups during runtime suspend regardless of
> whether it is capable and allowed to wake the system up from system
> suspend.
> 
> Fixes: 2664deb09306 ("usb: dwc3: qcom: Honor wakeup enabled/disabled state")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 6884026b9fad..05b4666fde14 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -397,7 +397,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq, 0);
>  }
>  
> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  {
>  	u32 val;
>  	int i, ret;
> @@ -416,7 +416,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  	if (ret)
>  		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
>  
> -	if (device_may_wakeup(qcom->dev)) {
> +	if (wakeup) {
>  		qcom->usb2_speed = dwc3_qcom_read_usb2_speed(qcom);
>  		dwc3_qcom_enable_interrupts(qcom);
>  	}
> @@ -426,7 +426,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  	return 0;
>  }
>  
> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  {
>  	int ret;
>  	int i;
> @@ -434,7 +434,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>  	if (!qcom->is_suspended)
>  		return 0;
>  
> -	if (device_may_wakeup(qcom->dev))
> +	if (wakeup)
>  		dwc3_qcom_disable_interrupts(qcom);
>  
>  	for (i = 0; i < qcom->num_clocks; i++) {
> @@ -945,9 +945,11 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
>  static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
>  {
>  	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
> +	bool wakeup = device_may_wakeup(dev);
>  	int ret = 0;
>  
> -	ret = dwc3_qcom_suspend(qcom);
> +
> +	ret = dwc3_qcom_suspend(qcom, wakeup);
>  	if (!ret)
>  		qcom->pm_suspended = true;
>  
> @@ -957,9 +959,10 @@ static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
>  static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
>  {
>  	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
> +	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom);
> +	ret = dwc3_qcom_resume(qcom, wakeup);
>  	if (!ret)
>  		qcom->pm_suspended = false;
>  
> @@ -970,14 +973,14 @@ static int __maybe_unused dwc3_qcom_runtime_suspend(struct device *dev)
>  {
>  	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
>  
> -	return dwc3_qcom_suspend(qcom);
> +	return dwc3_qcom_suspend(qcom, true);
>  }
>  
>  static int __maybe_unused dwc3_qcom_runtime_resume(struct device *dev)
>  {
>  	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
>  
> -	return dwc3_qcom_resume(qcom);
> +	return dwc3_qcom_resume(qcom, true);
>  }
>  
>  static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
