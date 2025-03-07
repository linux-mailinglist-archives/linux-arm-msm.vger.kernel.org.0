Return-Path: <linux-arm-msm+bounces-50619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65301A56107
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 565DC3B0A1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0030919E7ED;
	Fri,  7 Mar 2025 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6VcyteD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5E19DFA7
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 06:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741329699; cv=none; b=IEKNhhcdMPbvS0ZComn1ywtkHrWlh4NflIz9JxzYHMWfDA8tu7QvLqlQT3gmy+ni1pKqfneZl37YH6xKCnV5Qnyx3JEtC8IWnV+K1mkWhxw/u3EtPeFK1Q3J4Bgde68ugWYin4FLkGL8h4nJzAfIAyHr0J4ZnF4IDL3ZtEKOvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741329699; c=relaxed/simple;
	bh=TRWtes6REx9fpjvGKBezR7PGkeZGzXkctsT928ul9Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJnYpcH07bjU31wROr12X+Se1N6cDJK7w73p3PQlWFhS0HUGdgEgk1SRy10f/nfSAKq1QqiU0mCFnbH+G0PclKkH1Fkanu1AOJ04licK+Ju8sozlS4QzHrqYIYpdXHfF4Z+mtBBKd7vGjQuuInjgudsBLi4P4CeThWcHZ0UwqF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6VcyteD; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bf8632052so1313151fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 22:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741329696; x=1741934496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sg7uo0UiAnIp5rbGvtSfWreO0/p9lKiVld9AZeLT0t8=;
        b=q6VcyteDk9TFpFCf3kl6wr/ZR0BCpfwMFVyJgCMVxGp+6sdIHYEQAqt0GroYcIpff0
         tqsSnNdWmbtqGp7x8DRBrkwLk+5V0gOrlFVzI7/V8sMFQUaJ5Zk/g94AFTjhhAUbAvzE
         Yi9cPKflulYwSI3LnjGLQS7a0rDz4/2hMByuwvV8EnnUOb8uCIu8XAtx9JFXEpZ9/KED
         4ZiP2mYkDWm9t4XNObRM56iqPskCXqwu8oe3dySGwIxdOgJmxK7tp2yu+TBEDZ5g1iT/
         2MCiio3X0V3JsI265WML92NTNvfX2es1el+TbGwlfn4c/au71g1gCf5LYFJ7whlDbao+
         JknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741329696; x=1741934496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg7uo0UiAnIp5rbGvtSfWreO0/p9lKiVld9AZeLT0t8=;
        b=mrgIIieZ1lYSmh8C/WAfJaBMqvhuDUWtYPN3alvPMVWPvi0ktm6onCigUu2Kv66ctd
         WRKW4DQSPPC6a+9jEWmqSaF55y5GuJoyaddIzVNZq74bOcSElBazmPztQMPE7xOD57YQ
         60f7743KQhizRPnd/2YvVUtaqV4M+AVjm0t8Ptqs2NCwmwHnMbb+5SwyMVIz2fm4+BFL
         vWeab36074aN7G+JDiJ6T201Kie/5MkTanybYKBM5WTYzsHrioP9LTlbGgP/+AYmi59o
         NZjka+L6Q5qtf316x5dJGy+vhGzEzUITSwKaWa8jDrtl/Pg3ZpMdWXfx7YysYye2xDEU
         4Vow==
X-Forwarded-Encrypted: i=1; AJvYcCXu1NpkCFuwmaxguoATxJPmDciU2Q8MhTWrlB3Vm/nd/t7jDTXmdHUeixL0wCKdtz7TB5W4QfT1/plTjWXt@vger.kernel.org
X-Gm-Message-State: AOJu0YzchJymELE7NHBIlnrV3BHrbAPviviIlCoK+QRTlEJHVxQD74gj
	nxQZW1goknTS4YftorqImI7UvU3fLqXOgpn3s+RDmqPg0xEi4h6Sz38zEsWGdPo=
X-Gm-Gg: ASbGnct6U1yK3peQa58toKhe3KD47suslS9Rk3MqasZnJMxKeh35fCqk8pIcNUy37rU
	WcTtN/tGgglpbsoY/xmumtRZx8Uo2Sxk1bzLhM9Oo5Ku9biCkh5AbU/325wgJydwNth7vfenfN6
	hJQc3kcRqYvzUHuplEGfeQDCGkmTM17BykvWJ5lQ7HSKodBk+2dRcClODvwwVrmaDfg+bk13wDV
	EvDVKri0v74snqoH42QzjAJ3BM9bSxXYW9uBddJTgUQiah4V/5V9PYkTVkesOacnDXwTVWkLlyN
	8OFFR6TurSDhDbCaxj16Qt/HOYSif8V5PXm1Jt2DBL6lOIM8Gf3MzXCVDBK8bwNAV732l0bOWNs
	hFzoC0s4F+gR9cttOflM0VHf2
X-Google-Smtp-Source: AGHT+IF+MTb9tXtu+1OgKMNSWIWoZ7U3qjuft/CpkXtvP8nnazpT685yA6mq2aNmwtQkuAkDdTf0IQ==
X-Received: by 2002:a05:6512:3993:b0:549:792a:a382 with SMTP id 2adb3069b0e04-549910b59bdmr679603e87.32.1741329695881;
        Thu, 06 Mar 2025 22:41:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae59084sm394476e87.74.2025.03.06.22.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 22:41:34 -0800 (PST)
Date: Fri, 7 Mar 2025 08:41:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] usb: dwc3: qcom: Transition to flattened model
Message-ID: <vn7nrxpga7ewyqr7hpiczsn63qo2z4qzenif6powryqrtmnwjs@23jp6c7qdvxt>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-6-4415e7111e49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-dwc3-refactor-v4-6-4415e7111e49@oss.qualcomm.com>

On Wed, Feb 26, 2025 at 04:17:53PM -0800, Bjorn Andersson wrote:
> The USB IP-block found in most Qualcomm platforms is modelled in the
> Linux kernel as 3 different independent device drivers, but as shown by
> the already existing layering violations in the Qualcomm glue driver
> they can not be operated independently.
> 
> With the current implementation, the glue driver registers the core and
> has no way to know when this is done. As a result, e.g. the suspend
> callbacks needs to guard against NULL pointer dereferences when trying
> to peek into the struct dwc3 found in the drvdata of the child.
> Even with these checks, there are no way to fully protect ourselves from
> the race conditions that occur if the DWC3 is unbound.
> 
> Missing from the upstream Qualcomm USB support is handling of role
> switching, in which the glue needs to be notified upon DRD mode changes.
> Several attempts has been made through the years to register callbacks
> etc, but they always fall short when it comes to handling of the core's
> probe deferral on resources etc.
> 
> Moving to a model where the DWC3 core is instantiated in a synchronous
> fashion avoids above described race conditions.
> 
> It is however not feasible to do so without also flattening the
> DeviceTree binding, as assumptions are made in the DWC3 core and
> frameworks used that the device's associated of_node will the that of
> the core. Furthermore, the DeviceTree binding is a direct
> representation of the Linux driver model, and doesn't necessarily
> describe "the USB IP-block".
> 
> The Qualcomm DWC3 glue driver is therefor transitioned to initialize and
> operate the DWC3 within the one device context, in synchronous fashion.
> 
> To provide a limited time backwards compatibility, a snapshot of the
> driver is retained in a previous commit. As such no care is taken in the
> dwc3-qcom driver for the qcom,dwc3 backwards compatibility.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 138 +++++++++++++++++++++----------------------
>  1 file changed, 69 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9d04c2457433..63e60f15ceaa 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -4,7 +4,6 @@
>   * Inspired by dwc3-of-simple.c
>   */
>  
> -#include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/clk.h>
> @@ -14,7 +13,6 @@
>  #include <linux/kernel.h>
>  #include <linux/extcon.h>

As a heads up, would it make sense to also drop extcon support while we
are transitioning to the new driver / DT bindings?

>  #include <linux/interconnect.h>
> -#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/usb/of.h>

-- 
With best wishes
Dmitry

