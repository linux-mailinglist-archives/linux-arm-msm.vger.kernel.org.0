Return-Path: <linux-arm-msm+bounces-1001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FED7EF7A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 20:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B189281058
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 19:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91865358A5;
	Fri, 17 Nov 2023 19:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XiwYQeO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9D2F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 11:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700247834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X+KCXQbIarVw8dFpyS/S6NmCYqtvRHzg1KlSXBjGlMw=;
	b=XiwYQeO4fhaR3b0JA3o53rclKNdPfm9CODon0eQSnJGAawRCvj1eTeD8V8HObCC+wR4bYr
	+0HHbtpblejv8+uu86sJGHphleWocDL3sUWxS2zUm1UE03LgpEIpT3ceyTpjxR5UpA5h/I
	2RORWGmbgenFcIPAkEH23As/TeVlcBA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-pZUQRSpvNfqQLU1TKWve6g-1; Fri, 17 Nov 2023 14:03:52 -0500
X-MC-Unique: pZUQRSpvNfqQLU1TKWve6g-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41cb4d6744bso27961171cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 11:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700247832; x=1700852632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+KCXQbIarVw8dFpyS/S6NmCYqtvRHzg1KlSXBjGlMw=;
        b=eunhB/XT6uEMs6L7W6qi1rGs4jtHOMTv+D7XbOQVQobBOXKLhc5/N9RaY1CjBVFK6q
         j1AWEW2V2HAdiOX4l2cI66L2BM64tplijhkofa2ZXcP+DJEwjQiqgIiNpOWfBh1bmlaG
         Atu6IgyiIeMhzvfezqSoZTn3m/gvZ0NB0NHApbHI9bk8e6w6MAz8xHG+GQWxnobE6o+z
         R0jY9Fn3/C2jCeu7rrNs6BebtCFgQy5b/68XzWRCchPyoUp+0pnGATg8j2tV+Wl0lRzc
         8R7lUYnbfNgIOGrlC1D17NEzb5yAUBDym9Z1yPaCmXND16spTYlt0my2Hvuor0DqP2Em
         lf+Q==
X-Gm-Message-State: AOJu0Yx1Zdo/g2xtHqDNPd+bKQweKYEl3rxo2scBefgtvzneQ2va2egO
	o1s6Q32Zx4tWzaRyrZgpK3iOY/2sdcCAXoGHVVKytdopGqxNP6HGjoVULvlEuYisP7gQmH7TRCo
	lQe4xdvOzBfAnUjG4mg1tuC8gIw==
X-Received: by 2002:ac8:5d09:0:b0:41c:c045:3ed with SMTP id f9-20020ac85d09000000b0041cc04503edmr527676qtx.68.1700247831923;
        Fri, 17 Nov 2023 11:03:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgrKAJm8oEake3WBQPoR8ynpL7SEnW6LA4DrAoArIRr8hwun119GSAFcqC7ATK0hCExElHWQ==
X-Received: by 2002:ac8:5d09:0:b0:41c:c045:3ed with SMTP id f9-20020ac85d09000000b0041cc04503edmr527648qtx.68.1700247831507;
        Fri, 17 Nov 2023 11:03:51 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::49])
        by smtp.gmail.com with ESMTPSA id c14-20020ac8660e000000b004198d026be6sm775588qtp.35.2023.11.17.11.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:03:51 -0800 (PST)
Date: Fri, 17 Nov 2023 13:03:48 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 1/3] USB: dwc3: qcom: fix resource leaks on probe deferral
Message-ID: <uof6ti3ula3gfijsucp5yjp6bxldjhmyek77xub5ybifrm3g3b@d3qd4jqusvix>
References: <20231117173650.21161-1-johan+linaro@kernel.org>
 <20231117173650.21161-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117173650.21161-2-johan+linaro@kernel.org>

On Fri, Nov 17, 2023 at 06:36:48PM +0100, Johan Hovold wrote:
> The driver needs to deregister and free the newly allocated dwc3 core
> platform device on ACPI probe errors (e.g. probe deferral) and on driver
> unbind but instead it leaked those resources while erroneously dropping
> a reference to the parent platform device which is still in use.
> 
> For OF probing the driver takes a reference to the dwc3 core platform
> device which has also always been leaked.
> 
> Fix the broken ACPI tear down and make sure to drop the dwc3 core
> reference for both OF and ACPI.
> 
> Fixes: 8fd95da2cfb5 ("usb: dwc3: qcom: Release the correct resources in dwc3_qcom_remove()")
> Fixes: 2bc02355f8ba ("usb: dwc3: qcom: Add support for booting with ACPI")
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Cc: stable@vger.kernel.org      # 4.18
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Lee Jones <lee@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

I foobared the review of one of the patches listed as being fixed by
this, but for what it is worth I think this makes sense.

Hopefully my eye is better this time.

Acked-by: Andrew Halaney <ahalaney@redhat.com>

>  drivers/usb/dwc3/dwc3-qcom.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 3de43df6bbe8..00c3021b43ce 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -758,6 +758,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	if (!qcom->dwc3) {
>  		ret = -ENODEV;
>  		dev_err(dev, "failed to get dwc3 platform device\n");
> +		of_platform_depopulate(dev);
>  	}
>  
>  node_put:
> @@ -899,7 +900,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	if (ret) {
>  		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
> -		goto depopulate;
> +		goto clk_disable;
>  	}
>  
>  	ret = dwc3_qcom_interconnect_init(qcom);
> @@ -934,7 +935,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (np)
>  		of_platform_depopulate(&pdev->dev);
>  	else
> -		platform_device_put(pdev);
> +		platform_device_del(qcom->dwc3);
> +	platform_device_put(qcom->dwc3);
>  clk_disable:
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> @@ -957,7 +959,8 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  	if (np)
>  		of_platform_depopulate(&pdev->dev);
>  	else
> -		platform_device_put(pdev);
> +		platform_device_del(qcom->dwc3);
> +	platform_device_put(qcom->dwc3);
>  
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> -- 
> 2.41.0
> 
> 


