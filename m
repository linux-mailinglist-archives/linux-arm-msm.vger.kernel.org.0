Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4026858B0DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 22:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbiHEUfB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 16:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236812AbiHEUfA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 16:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 25D24A9
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659731698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uKM+wW8lwiBI5lrbvhYvc3Xo/UJeC+U/brqFsws6/U0=;
        b=MwnNqsuGDUW5IjxA4C+P4lbONGetwlrclJI/tusBooJ5mfBZxHvpEY6xcX04cYXJJsPREV
        dmU/G9ynjEuxQTPx13RypukLj9CiO57jtg8dvlzJ6VaW4FS4O1qjIlaByAvO0J+gIE2/eU
        e+pYEqYZUEGORSMWoPGBDYRarMoo4hk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-WDQak3Z_MFafpj6ichEMJQ-1; Fri, 05 Aug 2022 16:34:54 -0400
X-MC-Unique: WDQak3Z_MFafpj6ichEMJQ-1
Received: by mail-qv1-f70.google.com with SMTP id cv14-20020ad44d8e000000b004760bec67a8so2011016qvb.14
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 13:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uKM+wW8lwiBI5lrbvhYvc3Xo/UJeC+U/brqFsws6/U0=;
        b=ypkTmjT4fRhy9K0wZRqA/pKOSPCPQUA3kZMWr+hHwnXg3cDBJGDZJWRGg6tWhSL50S
         Ec17fRQuoZv0fWP98+lpmN355qSb96498zXG/p46qLjsyxvgeXi+1I2Oo6Z88aHhcydl
         +K2SlXNR0qa6o1bMJQx9tctJsWbM+kwUwIsUxF5/usOoen/3YDe+BANVbg8mTQNGMqFh
         AeE/A2mM/EgGLOmY4uSZRkd7BalocE5kXYKbgaKZOXfU7DqZpyGIiutaE5AP4xh3ZcDq
         7oIlIPolP7WjouUd8MGl0k69L/rSVb0NIK1KIJ1vEK6qHJtaHfxjJWFN/p4k4+XqcgkG
         GC0Q==
X-Gm-Message-State: ACgBeo2GAAVRZ78qipUnKr6REJ5Wu7MUVrb7J1l24r/JmrdTFbMj00LL
        QvUURHouHQl56OR54hBUBA8RvxucFpjpwbMIAYSVGT9SAHP2Zz9bJqxJk0jE1W+qa1C2jnOcR5v
        /JDf9kIkZOSfnmmtApxYSy+3bSA==
X-Received: by 2002:ac8:5ac9:0:b0:31e:eee0:3abb with SMTP id d9-20020ac85ac9000000b0031eeee03abbmr7542036qtd.359.1659731694248;
        Fri, 05 Aug 2022 13:34:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41nT7or3WH7eao2rcwikW4vn9zTHCmxKFs25GqOXhqzJGWKHNEd5C8Ceg8re5deC1Zz6riZw==
X-Received: by 2002:ac8:5ac9:0:b0:31e:eee0:3abb with SMTP id d9-20020ac85ac9000000b0031eeee03abbmr7542017qtd.359.1659731694025;
        Fri, 05 Aug 2022 13:34:54 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id c25-20020a05620a269900b006b55036fd3fsm3796781qkp.70.2022.08.05.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 13:34:53 -0700 (PDT)
Date:   Fri, 5 Aug 2022 15:34:51 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: dwc3: qcom: only parse 'maximum-speed' once
Message-ID: <20220805203451.phu6mpzyipzj6jmf@halaneylaptop>
References: <20220805074500.21469-1-johan+linaro@kernel.org>
 <20220805074500.21469-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805074500.21469-2-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 05, 2022 at 09:44:59AM +0200, Johan Hovold wrote:
> Add a temporary variable to the interconnect-initialisation helper to
> avoid parsing and decoding the 'maximum-speed' devicetree property
> twice.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 6814861bed6c..196efa9f2545 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -243,6 +243,7 @@ static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
>   */
>  static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  {
> +	enum usb_device_speed max_speed;
>  	struct device *dev = qcom->dev;
>  	int ret;
>  
> @@ -263,8 +264,8 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  		return PTR_ERR(qcom->icc_path_apps);
>  	}
>  
> -	if (usb_get_maximum_speed(&qcom->dwc3->dev) >= USB_SPEED_SUPER ||
> -			usb_get_maximum_speed(&qcom->dwc3->dev) == USB_SPEED_UNKNOWN)
> +	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
> +	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
>  		ret = icc_set_bw(qcom->icc_path_ddr,
>  			USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
>  	else
> -- 
> 2.35.1
> 

