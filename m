Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357021B010F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 07:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgDTFik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 01:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgDTFij (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 01:38:39 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0DEC061A10
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 22:38:39 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id q18so974575pgm.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 22:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8DAiM3FZELhORq/Bkh+uGmRYVoaeDncRDNKlRNgM+4Y=;
        b=smlPb7p2KjV8mhZbGKmTb4FX3kZIhWgjjinJsbrd9ObCjFQk4dwr/dBChq1xnFdwQJ
         mO3M4fRuYB/26Gk/5Z2TaacEs7BOqzeHo1G1LtMSoEn/Ex4Darq/MNVOWTmsK/EcIc8+
         84Re3GZDzlIFY81FVHvn8p39jLDuerjdsdvtBbikdCBKCTl6TRl7A6aS9xp7/5FpbROb
         tBt/0mGhvCQn4gqrzZR75FvBziVFzEFb8B8vQYLF3r+xbMxmUfwq/kWLUNSEt1ZLyjIG
         ZrJa67PV1D8ORryty0/ydOYC0IQHGaC1mTkRq53u60Q4n4AnAAYz0QJkNyjd7ZYMyCph
         3LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8DAiM3FZELhORq/Bkh+uGmRYVoaeDncRDNKlRNgM+4Y=;
        b=BQoGFgXj/aZthdg5S44HR/JQ0M6jv0vUkwRaw7tPOF/+flT1Fv+iZlyZ/5sjZ/9gE7
         oTuPXYQ5uqXdqppT0a4raz9A7jTwg68o5HfGNAEe7C0WilWlcccekB1RtKLFyhLY6iCy
         ZcXdz0iHWlrTXGtXfApCf1E41YSj3ydIS5QzKN24zweFTGW7cCWEKmhlzoc7NvHarteu
         R5+0iwM/sl65yPZM4ppo+WDWfIBRV58TXycOKIcFPGeQ8kuA8axRdu6pFOjmnpzn7o/r
         3nJ91cDdk2vLlSbbaAj+0OS3NvocjDv94e34BOshBzvn03WckMgUsa7zQBLrUTzxllZw
         XDhA==
X-Gm-Message-State: AGi0PuZIynV8IyHdITXDsvOWoduDA2wjKgeOLJYcaj57rFoy+w7t5B/p
        Rm65WEXNLcsH/JknVM9R9oXDpw==
X-Google-Smtp-Source: APiQypIcQ5RUUaAcPqXTbhFsBCZvKcSGvCrv59l6EnBYvnD8ONdi4RqBSAZ23H/8nSSkv0dtZ1OXhg==
X-Received: by 2002:a62:1801:: with SMTP id 1mr6338097pfy.230.1587361119235;
        Sun, 19 Apr 2020 22:38:39 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r13sm31317pgj.9.2020.04.19.22.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 22:38:38 -0700 (PDT)
Date:   Sun, 19 Apr 2020 22:39:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] remoteproc: qcom: pas: Add SC7180 Modem support
Message-ID: <20200420053901.GH1516868@builder.lan>
References: <20200417142605.28885-1-sibis@codeaurora.org>
 <20200417142605.28885-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417142605.28885-3-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 Apr 07:26 PDT 2020, Sibi Sankar wrote:

> Add support for booting the Modem DSP found on Qualcomm's SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 7a63efb854052..33b0bff770a7f 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -637,6 +637,7 @@ static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> +	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
>  	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
>  	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
