Return-Path: <linux-arm-msm+bounces-52444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46988A6F451
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 12:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F354B189610C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 11:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C35E2566C0;
	Tue, 25 Mar 2025 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+r+GtQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E66255E3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902536; cv=none; b=RrH50jSln9lIXDNiEcG9IyzHNcwskd+CmNDh7OJjFKK2Bq8AqglNeVXyAGbSj4cIHzepCs27hZ3TSFxYwHQP1PIZg1MxS4Nt55cs4y2kzq/IhfwG8rkU6b5pK+1OnDvZH9ZZBUYnVRZRdnI9n5qVAlLSUPyykznudFb3Pamh/To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902536; c=relaxed/simple;
	bh=axTyly0sCljhfwwpNOgHFHjTCGh51MkgyOh1E0/Iq9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgkcGcO4Ex6p5JIsrDFO3XqdPmYkWvBMlXIwm+aIKU4PSOPIrMH0uQDq1PbFyQXWPBNDNZEp2LXSlR6VqWoO4HrjFRhKW0U5vd4y/80Qmp26s8y6tMNAe+kCudUy2PT1KMbX2brebydFnEQt6KdMH+DAQ96A5DlHmYIHJQMsp5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+r+GtQX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7430e27b2so1139933166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902532; x=1743507332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ona5OctVpUFMXPABaOF+C6CD5ocYKvVWSnGYTcvi3Ao=;
        b=h+r+GtQXpnstt+dpx91SPRhxJK+ciZQbkP/kAR/PPsE8hEIhQ0ZpdykjVXTcItvQCI
         wUJmlUs0ePLMrv1a3IfCn0DNwBhrA7w77wVIMXxdv2oVYkBt02TL0QYkDUZh4tGG1Pb8
         71P2ZYp2wamyXKTNYf0MWC3pPYEIRHhi3WPcsXrS8eEr0pUT+iRfDHuQioLRFtB8vylJ
         4JA7Nfnj3zNfv9+Q/IW61CoPeZEi/JAJQjU8nQ/jIxsM5E5LDcyQj2t7iLKwDUSCV82U
         mXFWxL7YC7p9yapECODixfe2Jic1x72RpS0swBCpQylapWHWFWCU72fuBXkabYSw2R6y
         ngoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902532; x=1743507332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ona5OctVpUFMXPABaOF+C6CD5ocYKvVWSnGYTcvi3Ao=;
        b=MUK5kcCXHQU/AUlJTqyYYBQaq/OyurbKOxYFCaOnFDnjJktrWfNL8coQdIY2mdczvW
         RfelgOu/MqE09HGdtfyBmb5odKUaCkm0teOX6oexjPYlWYKzAuUVelKcKpKW/VM0As26
         f2b51nNdq1vwSpsW0E1TOKPPHrTx/NJ42GkjTgBKc8+2MOooKNp5CZArJkm81VQ0YuOS
         IVTBJNYQZcxpC/3HO/V2RAgusBSbpwvkCCP9/qM2m+o8w6vjuG2zE45odjHpbGO6DxLx
         WHtFc4EBmtFBiYEzsvljAVosP1as4DfaQYHjwayK0C6U5vpaiynbTc+958Q6Cweaynpo
         B7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLYshfeHKnmMoc0MyKaX3fotafqaMx9PbR6sVeIWkUAaQlzhY30+whOjrMGp+feV49XCikxr8/3b4xGGur@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7zBARtGqCT3RalgBmpaAn+JwjuIK16+XEMFZ/EC3oDj4+aB3
	yHCjoIZzsq55UYd/bOGCm7106Yp8ysLKMs4DbQHPfHAtfi59IFVgy9QQnme0tNg=
X-Gm-Gg: ASbGnctgFtNNwTsjKTJS13SYiWoxLLl+igcFsPwR8pKqVHcfQpvMHNi87/WKGWHYmas
	XYrf8JIQtt6dT95o7PluBXWSe7RdPg/iyqvfnTqKWu2TQ0JvfURtV9HeeUneehVdjokb7wdhI6u
	ATjTgfGsuryEWGX2BdN+plhHxoCIHb4o/FAtj8/2GsOKbQL76lGsG/QBx+MH3Pdd2QpYkJfy5f/
	QNd+K+X+khHf8R/V2bhvQ/lK7s6cU5llas11b/RyvIPr4tLzZiFDbQtRtMeMeuaCxq/9Roizn2e
	mhPB8lVRPjP7m+vTdn+xGn7usy/CazQWhaXelNxPHxFkUpYjL3r036w=
X-Google-Smtp-Source: AGHT+IFKpEsb4p3LWlHWOKvoJwQ3AF5kC9F/GUq8MdsIh3ud5GODZ+3OVezWTIFKtb7E9DO2qBLkNg==
X-Received: by 2002:a17:906:c144:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-ac3f2117cb7mr1775900066b.15.1742902531711;
        Tue, 25 Mar 2025 04:35:31 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:f88a:e8d5:82b:cbb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64b06sm848323766b.94.2025.03.25.04.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:35:31 -0700 (PDT)
Date: Tue, 25 Mar 2025 12:35:26 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v36 30/31] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
Message-ID: <Z-KU_o_LE3PO6J2y@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-31-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319005141.312805-31-quic_wcheng@quicinc.com>

On Tue, Mar 18, 2025 at 05:51:40PM -0700, Wesley Cheng wrote:
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> and PCM index the USB device is mapped to for supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.
> 
> It is expected for the USB SND offloading driver to add the kcontrol to the
> sound card associated with the USB audio device.  An example output would
> look like:
> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> -1, -1 (range -1->255)
> 
> This example signifies that there is no mapped ASoC path available for the
> USB SND device.
> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> 0, 0 (range -1->255)
> 
> This example signifies that the offload path is available over ASoC sound
> card index#0 and PCM device#0.
> 
> The USB offload kcontrol will be added in addition to the existing
> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
> the USB audio device specific parameters are still valid and expected to be
> used.  These parameters are not mirrored to the ASoC subsystem.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/Kconfig                  |  10 ++
>  sound/usb/qcom/Makefile            |   4 +
>  sound/usb/qcom/mixer_usb_offload.c | 158 +++++++++++++++++++++++++++++
>  sound/usb/qcom/mixer_usb_offload.h |  17 ++++
>  sound/usb/qcom/qc_audio_offload.c  |   2 +
>  5 files changed, 191 insertions(+)
>  create mode 100644 sound/usb/qcom/mixer_usb_offload.c
>  create mode 100644 sound/usb/qcom/mixer_usb_offload.h
> 
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 6daa551738da..7d8833945711 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -176,9 +176,19 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config SND_USB_QC_OFFLOAD_MIXER
> +	tristate "Qualcomm USB Audio Offload mixer control"

This looks like a "bool" and not a "tristate", since the ifneq in the
Makefile below ignores whether this is a "y" or "m".

> +	help
> +	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
> +	 This exposes an USB offload capable kcontrol to signal to
> +	 applications about which platform sound card can support USB
> +	 audio offload.  The returning values specify the mapped ASoC card
> +	 and PCM device the USB audio device is associated to.
> +
>  config SND_USB_AUDIO_QMI
>  	tristate "Qualcomm Audio Offload driver"
>  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
> +	select SND_USB_OFFLOAD_MIXER

And I think "SND_USB_OFFLOAD_MIXER" (without _QC suffix) doesn't exist
anymore after v30? I see there was some discussion around that there.
Is this supposed to be "select SND_USB_QC_OFFLOAD_MIXER"?

If yes, isn't this option always selected if SND_USB_AUDIO_QMI is
enabled? In that case you could just drop the config option...

>  	help
>  	  Say Y here to enable the Qualcomm USB audio offloading feature.
>  
> diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
> index 1eb51160e2e5..1efe1b90be7a 100644
> --- a/sound/usb/qcom/Makefile
> +++ b/sound/usb/qcom/Makefile
> @@ -1,2 +1,6 @@
>  snd-usb-audio-qmi-y := usb_audio_qmi_v01.o qc_audio_offload.o
>  obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
> +
> +ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
> +snd-usb-audio-qmi-y += mixer_usb_offload.o
> +endif

Thanks,
Stephan

