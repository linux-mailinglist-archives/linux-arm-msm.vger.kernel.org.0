Return-Path: <linux-arm-msm+bounces-35142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42FF9A5440
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 15:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52D3B282942
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 13:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD12E29CE7;
	Sun, 20 Oct 2024 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PdvTe2dj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB019149F
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2024 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729430123; cv=none; b=XmNvUEr1YwW1rO8khc1w6nKFGGasQZ/SLt/vPkMBMB09t01lOCfnU1ZGm3+UxkQJEuWg98fzJOQp2NKyZhmPhJU1RIGZ3fwSU5Bkp0hhz9dF+/OiE6ohPtwuj0qwqtid+JgMW/jVmG2WFmLCRV8TQvmGGNtCyJwjiHDN+NAwD38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729430123; c=relaxed/simple;
	bh=poO/hwuPggMCfKMtN6J/IKMRK8KmxYpxlq0aLtC6rXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fkhc8zFLRa7EsAh50dOzfDBFM0W4s+Qs/8163rPS1Zgf/29j9z2XqrQdiQ5bVLWLcbR53nO+vBOqLU1HRmfj0UpFuUZtT3ZG7yGWXZOmdjNPjGLTojRuMNMCuzvkDfol0oTK35hzUw8fR24m26PXbawpIDk4eQx7DpDeFqS/4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PdvTe2dj; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so48970511fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2024 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729430119; x=1730034919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gXL56oVVchWDXVTsVXRD1GEhyc86fnULmJY57/IB98=;
        b=PdvTe2djFMDCmA4Y8a0ThWYOIEWy78iCaAORlTJhhmrdcDG3u8CZAOD/bD2KSaQQ8T
         2RWrnVdtcD4p1ghxOyxphjWX/LH3KSZ71UtQFeLv8A0wD4Sd5zVu/81jGWC1NqJjlmq8
         MqhaD/tEKGXYekiRZNSZ5Mu77ctdba2sQSLNIOP8f1A/JwoQuT+ujG9Pp30LJXM6xTWc
         e5LfinwG8eUMVRMZYShAAV1yi7Gsdjymj9TdjLkGfv4FJPHD1v6DXPlN5ylDjR39U58j
         sb2+fvo5fQlRo24rSE1bCKlU63mAYwvwrOzdzPntJtfrOA5djJBtYNfoK4C8UG4VhtZt
         k+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729430119; x=1730034919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gXL56oVVchWDXVTsVXRD1GEhyc86fnULmJY57/IB98=;
        b=OXL2+E4rXQr+FAyzvygBJRFVsZKxjXS4l5ikQ7/1LclJW7NTcmDj9pNPeH1RXPVP09
         PJ0ngcgX0/yR67haPc2JjEqwHpYYvVNCGjriJcNWAapd1m0NwLRgqlWOHhkXmo/4HUQj
         T325mVH/hVnYF6jqrN7jV+ydUKgKr2z3SRr90duqllm1zspbNXo+7t3aQ1uCQBNyOavE
         2F56YYBR8D3S7lWmumrTKiWcE1n6Xqoqh5frhuheToF3TwuwpcyCWJvBnHhauISN2tU1
         SmPe3mT6jdQHxeMqiwxwxIYL1UANm/gPd1BkX1jEMtBbNSTnHiYEIoUTogLNpwp5TfGS
         6Zlg==
X-Forwarded-Encrypted: i=1; AJvYcCUelbOMIhbpN06fm0LHMomL9PIzqtVhOD1pv8wPKbClZiyuzH8qoXHQMzM0gwrs2gAlthvDbxnAvAk7akZT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3gAByhwq4My75XVA0DGqb38oNwyMginUyrX9OV/xCm5I2aVL
	Y1IuMtwV6i6BCPM4P4XTb7ss3EIwcO/k4rFTfccneUeYX0RQQ+AfdJeUfG7rbHI=
X-Google-Smtp-Source: AGHT+IGuzJyisFPDCA07ZQb5NEcQD2ZqMQRQA//tQSzjdBOhWj0uTeILAHaOSrId8jri4G7h0VDyGQ==
X-Received: by 2002:a2e:80a:0:b0:2fb:5ae7:24e7 with SMTP id 38308e7fff4ca-2fb82e90ee3mr44660631fa.4.1729430119150;
        Sun, 20 Oct 2024 06:15:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae24b58sm2270571fa.128.2024.10.20.06.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 06:15:17 -0700 (PDT)
Date: Sun, 20 Oct 2024 16:15:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: typec: qcom-pmic-typec: use
 fwnode_handle_put() to release fwnodes
Message-ID: <upegry45eqmt6nton6whtvlbg2wjoh5uvocmq46rlv5xhg5qf6@pacgknliknsx>
References: <20241020-qcom_pmic_typec-fwnode_remove-v2-0-7054f3d2e215@gmail.com>
 <20241020-qcom_pmic_typec-fwnode_remove-v2-1-7054f3d2e215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020-qcom_pmic_typec-fwnode_remove-v2-1-7054f3d2e215@gmail.com>

On Sun, Oct 20, 2024 at 02:56:34PM +0200, Javier Carrasco wrote:
> The right function to release a fwnode acquired via
> device_get_named_child_node() is fwnode_handle_put(), and not
> fwnode_remove_software_node(), as no software node is being handled.
> 
> Replace the calls to fwnode_remove_software_node() with
> fwnode_handle_put() in qcom_pmic_typec_probe() and
> qcom_pmic_typec_remove().
> 
> Cc: stable@vger.kernel.org
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

