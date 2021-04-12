Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05FEF35D365
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 00:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343861AbhDLWpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 18:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343845AbhDLWpo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 18:45:44 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F90FC06138C
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 15:45:25 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso3742981oto.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 15:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=saYSSeNUB6f68qHbPtH0lWIscbgYxiJh/N21MR4VVmM=;
        b=plFvgQqlpcEZlby5QGnwVmREibuowaQLgHzWBNoa/mTnoRU67HMFunVGQFFEhnLMKz
         NZ6WyPOUM+oi3vGnS4FXCTkj610vgq30Yj39v+Q0JP50Yqfu0ZNGO2XrIk/3vOjSDpt9
         kXEbIeDIAUX00IVZQEfISNrhd6OFoMhP+oD+Gx2li1w0iX7pmM2R8N5wGtiNc/8jEFrd
         tGO//Bu4OTfw+W8oBf+LPYL2Vx5f8yZhRCqIs3HH+6HLAyX7SsWd8jY+97DsanA2pK+w
         7Cwglg8h7wtKoF49dd0za6rbt7H7OWybqtfAJFhSibWg8eoG4bpGwMfk1IX/iL2Q5xMv
         9lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=saYSSeNUB6f68qHbPtH0lWIscbgYxiJh/N21MR4VVmM=;
        b=D0/mRTwwcK+7Eww3g5VZ5RJg9fytXan/zi75t8RJLQAdOhI/qFe2bZxwyyAk0iBivy
         9sRA6YYEJIX4n/IHB6bjOjvITD2j7IQQ8KQWNZabA2Zxap70Y8DSRhYfyUkT+k2l3MqO
         4vRGKT0YHVf+/BvR/9aG9qO6eku0+0Ic2afTwgEdc7Ge/ZdyEVSh0rTYBaJkaZ0Sc0xk
         Vf1+k4xSB57Y2BTBbcTv25rQhOS7lQUCc8FDO/cHhjV29FfrmsSqcKqki9G+h9TmSGjy
         1D0KwtdaZKQxDSWuZqkkHuBIa+6cebqJaSZaSmJLLXARTC9Owaw8+ABo5Qeyr6yPcCc4
         tkoQ==
X-Gm-Message-State: AOAM5338Ex5TP6/jb5Sh6gQtax/VoxPOIDFBmV9C4cHFJMG9gVlCb7W7
        bo+lT8XlaOskw6eeA41TV7U0Mw==
X-Google-Smtp-Source: ABdhPJwSrXb3rCW0eBQ/8ooZbCrX0MY2r8U7shLWpwEX/QnDafcbmvQ1e6C+mwZA1aTioz5PkSkJKg==
X-Received: by 2002:a05:6830:109:: with SMTP id i9mr25724854otp.47.1618267525004;
        Mon, 12 Apr 2021 15:45:25 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s84sm2539988oie.39.2021.04.12.15.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 15:45:24 -0700 (PDT)
Date:   Mon, 12 Apr 2021 17:45:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     Andy Gross <agross@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] usb: dwc3: qcom: Remove redundant dev_err call in
 dwc3_qcom_probe()
Message-ID: <20210412224522.GD1538589@yoga>
References: <20210410024818.65659-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410024818.65659-1-cuibixuan@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Apr 21:48 CDT 2021, Bixuan Cui wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index e37cc58dfa55..726d5048d87c 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -774,7 +774,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
>  	if (IS_ERR(qcom->qscratch_base)) {
> -		dev_err(dev, "failed to map qscratch, err=%d\n", ret);
>  		ret = PTR_ERR(qcom->qscratch_base);
>  		goto clk_disable;
>  	}
> 
