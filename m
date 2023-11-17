Return-Path: <linux-arm-msm+bounces-1002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF38E7EF7B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 20:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8881F23E81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 19:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803DD43AAB;
	Fri, 17 Nov 2023 19:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DtRo4upe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C727D4D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 11:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700248192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hpxsXLMOh5JybuE462HK7tCO92oncuL8g+hgD8Ou5d8=;
	b=DtRo4upey3e21f36LrrZ2lD9D17Ul/H+fN7+gjyW1lrcdQgKr6hPhY7JE65VD5iHKoHZYi
	EwNsSdRbW6wl4RR5HhEs3dnDTgyZJ3/qyYKJ9epjfWp2ch7PSApNQ7QOyzhbaTapzRqwrp
	jsTwPew1EjxdbhnoZ1uWN26LwqzjXbI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-QNWaOsOCMnSP_9Oe2JSrgA-1; Fri, 17 Nov 2023 14:09:51 -0500
X-MC-Unique: QNWaOsOCMnSP_9Oe2JSrgA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-421ace48f00so24801601cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 11:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700248190; x=1700852990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpxsXLMOh5JybuE462HK7tCO92oncuL8g+hgD8Ou5d8=;
        b=qhE8kRZ5VJYZepAg0h14TNcy8VQ2BGQGeCDpHfelZElyaN1S9JqvG5rsNBqrzckY1D
         B97Jyw69ILq7xTC02Jqw2WcMYlRNXhFp2+iNooKsw3QO1MpFj2Gw13Hm9pLUHPg3oE+a
         9HNLMdZujI+wIxVRtK0jBI0d+annl8FTGkyvYRtzYQHQVIcUA2Vnb9jRk2b0Z61aOXKf
         oW5gaVe3cJ9EgqlJy/ePY96VlANWk/onQzc8SRsTg6nMr+InYb0CVh5bBW4jaaeBzKA9
         KW5SX9Nh/bBaL0b9gMamdaXDZnClAcXBxwa8/qjkD5HIbf63dFqoeRM5NW6dPFsmTws0
         N7kA==
X-Gm-Message-State: AOJu0Yz5g+ZRil3Cys0X1sdX8denXN2VseHVkJFLlCoyhZTR9MzhdYQI
	Z88SYW4Gpj3IPHAsg5YC+6/lI3/kjUlH7SH72M+GkZD8OdBMw+emmigFtdY2GnP5EO4aKh4sysL
	Ik718OCdBudpZQiI8qEEy4Q4hwZAFHBwa7Q==
X-Received: by 2002:ac8:5c09:0:b0:403:eb5b:1f6 with SMTP id i9-20020ac85c09000000b00403eb5b01f6mr624107qti.63.1700248190187;
        Fri, 17 Nov 2023 11:09:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlvdvwGKHUH6kh6AfHGMsjzT8Ii5VyQWe+IyIfRxw35V00JsB0JULxo2khiOl3sAAFk7zK0w==
X-Received: by 2002:ac8:5c09:0:b0:403:eb5b:1f6 with SMTP id i9-20020ac85c09000000b00403eb5b01f6mr624087qti.63.1700248189946;
        Fri, 17 Nov 2023 11:09:49 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::49])
        by smtp.gmail.com with ESMTPSA id x8-20020ac87a88000000b00419cb97418bsm776100qtr.15.2023.11.17.11.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:09:49 -0800 (PST)
Date: Fri, 17 Nov 2023 13:09:47 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 2/3] USB: dwc3: qcom: fix software node leak on probe
 errors
Message-ID: <lufc4csmbtkx2plvwxce32tofon76x6jmk4tbwjkwqqffukrka@pygyjtb2kiv5>
References: <20231117173650.21161-1-johan+linaro@kernel.org>
 <20231117173650.21161-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117173650.21161-3-johan+linaro@kernel.org>

On Fri, Nov 17, 2023 at 06:36:49PM +0100, Johan Hovold wrote:
> Make sure to remove the software node also on (ACPI) probe errors to
> avoid leaking the underlying resources.
> 
> Note that the software node is only used for ACPI probe so the driver
> unbind tear down is updated to match probe.
> 
> Fixes: 8dc6e6dd1bee ("usb: dwc3: qcom: Constify the software node")
> Cc: stable@vger.kernel.org      # 5.12
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Acked-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 00c3021b43ce..0703f9b85cda 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -932,10 +932,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  interconnect_exit:
>  	dwc3_qcom_interconnect_exit(qcom);
>  depopulate:
> -	if (np)
> +	if (np) {
>  		of_platform_depopulate(&pdev->dev);
> -	else
> +	} else {
> +		device_remove_software_node(&qcom->dwc3->dev);
>  		platform_device_del(qcom->dwc3);
> +	}
>  	platform_device_put(qcom->dwc3);
>  clk_disable:
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
> @@ -955,11 +957,12 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	int i;
>  
> -	device_remove_software_node(&qcom->dwc3->dev);
> -	if (np)
> +	if (np) {
>  		of_platform_depopulate(&pdev->dev);
> -	else
> +	} else {
> +		device_remove_software_node(&qcom->dwc3->dev);
>  		platform_device_del(qcom->dwc3);
> +	}
>  	platform_device_put(qcom->dwc3);
>  
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
> -- 
> 2.41.0
> 
> 


