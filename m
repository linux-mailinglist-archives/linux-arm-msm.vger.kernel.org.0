Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A84204AD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 09:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731249AbgFWHRw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 03:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730957AbgFWHRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 03:17:52 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049E0C061795
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 00:17:52 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m2so15550122otr.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 00:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OrQkyvC22e1MwYWC4yiJoh4JThum+qbMQLILKSvLEQo=;
        b=RShs6dv7sFJ452LX+nOtFOcGZusftsuBQMDT8SzDKmgtVEJts9p2PoLcI+A8LIbvEX
         vQBxpR0ooCDzmoXbFw6HlwU7lgGudcAjrrQe5PhR0yDUc7OuEb+rUIa+0tjQbAQBLibM
         fDIrAfL02eLpmnYqcsE9vkqs/Qq2jYweRTP17/7HMOhsZkH2HHobrQyr0pt+Sq6Gi697
         40Rli9mSMsWDSnSZAizj8DZkhuwYPJ5A1k9vjER/qUpuYSTy2trHVu6q5Ad50lJ6voGS
         TR/rnQQu5FopflXbMBbO4Q2tohc85ETIOnqGPVlb2M4k7vU6T4LOF1MK6aqYpNxk8o1e
         665w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OrQkyvC22e1MwYWC4yiJoh4JThum+qbMQLILKSvLEQo=;
        b=G1728R6qir2jGY7q/XwXXPDIR/5Ndl7kTvlhVNaWT06bYBmQsRDQCHwvRaymrkMa/R
         0GZ5W+P6+2iqjsNbZM3ib3gGORK+IK8eXlEpiz/inPAkTGAPr7vB20fGR9yoE6i94r3l
         YLS44/iX7DLaj0fqRbxsrxbliZCITLROW0jQBzLt1WUHMfbKfBiA2/OBNTKzdFjRawfC
         E3/P4rfO+Md7phZDXt7W6Poauho2Io5YTbHYb/kUlpk6NP/dqUuOwFzAySf//0PmFDax
         CrhUgG+MBjEUDshhhG4sPZy/dp2h+6nMrXcbQV+iCPRJDiSpMlDOW69qe4V/cnLcV16G
         ofMw==
X-Gm-Message-State: AOAM53106hCqeUNUcZKQjMTSP7Xl5L3WRtk0b7R3aiJBjT7CT5d2v/TN
        I3wLOdxnRT5XQL/2m1OTRooFQbgLgVE=
X-Google-Smtp-Source: ABdhPJwp+BnWQ4Ps7xLiLjdxtbq87IaPZN18D99VL8cgp/knyF5k0izryN9gIZCA62v1cv85sXBA5w==
X-Received: by 2002:a05:6830:130b:: with SMTP id p11mr17321671otq.293.1592896671350;
        Tue, 23 Jun 2020 00:17:51 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q10sm3877909otl.40.2020.06.23.00.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 00:17:50 -0700 (PDT)
Date:   Tue, 23 Jun 2020 00:15:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     sboyd@kernel.org, konradybcio@gmail.com,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] drivers: soc: Add MSM8936 SMD RPM compatible
Message-ID: <20200623071506.GW128451@builder.lan>
References: <20200613072745.1249003-1-vincent.knecht@mailoo.org>
 <20200613072745.1249003-4-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200613072745.1249003-4-vincent.knecht@mailoo.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 13 Jun 00:27 PDT 2020, Vincent Knecht wrote:

> From: Konrad Dybcio <konradybcio@gmail.com>
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Patch 3 and 4 applied.

Thanks,
Bjorn

> ---
>  drivers/soc/qcom/smd-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index 005dd30c58fa..8f290c67cb47 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -231,6 +231,7 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
>  static const struct of_device_id qcom_smd_rpm_of_match[] = {
>  	{ .compatible = "qcom,rpm-apq8084" },
>  	{ .compatible = "qcom,rpm-msm8916" },
> +	{ .compatible = "qcom,rpm-msm8936" },
>  	{ .compatible = "qcom,rpm-msm8974" },
>  	{ .compatible = "qcom,rpm-msm8976" },
>  	{ .compatible = "qcom,rpm-msm8996" },
> -- 
> 2.25.4
> 
> 
