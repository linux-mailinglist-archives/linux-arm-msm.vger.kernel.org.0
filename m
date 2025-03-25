Return-Path: <linux-arm-msm+bounces-52439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1ECA6ED00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 10:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E423B01AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 09:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CFA1E521B;
	Tue, 25 Mar 2025 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFTeD1wo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573F1DE8A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742896037; cv=none; b=WfR/midUxVBz4k2Zpd/4hCwQV6sMIVfjFaU4WCO0ke5+T4yXNLU79KIRflmLBI3cYuRZm7jrWBPQSxHB5Pu6uu3gp5QTcJTaFL8S7dPsQ+8Jgi7gdejRutU3NWS1Z5VIhyKZOaMFR68aK549pTI0YiI4EU3ymOAOhTBLSwOlIHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742896037; c=relaxed/simple;
	bh=SNDPAvCzyENxbPBoezdd21XOz3T+pKTYqMc05BuJ9vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkB5KyVUYt98bqnsPrdfpbwUedE2GMXWOWCi2F31uzpCz7ifHX45NLoO49jJ3yT9MF8Z1zqtiYaWGi/TK2NHZU4vlBvj28Z9n+IF1cI/XzWrv+swoN7264q/Q6TRLU3iYCudZkSMo+XV0XUP9KV0+F8hVzPhlEe29vCFBYRvYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFTeD1wo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso37536435e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742896034; x=1743500834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rqrVjDy71pJJydCBHqV9OfKr55/ixkBk/o+Dd196ng=;
        b=kFTeD1wo+gPftVrCwYS+Xh/8h6xXX0V4enieL1ek+zTwUMhMpzvc7LwnJ75s/NDTF4
         y2/8JNd9i0+troATyRQEMbF/vjMl90Ncj2LjJmYJUyi4UtZlVNXdE1CeHmMj0xihjJ/i
         zvbWDarPBhYGfyruMjW4nfR22QbaMX+4koJuhvXY/YIFWiun/udpRzvTKgwHWupQlqR1
         CpnjScY0oowg34EYstUkY7AnqPfOAmkRt6QGEQrhD4SC5idW+qGQ+X4V93QUiLsgPZhh
         EN/S1rjaHSiNDYKjMBkEBnL54Wc8kf4iX9MRQvImE8OpZw0hQ8cvr1Sc5FTHg+0fZzvp
         dUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742896034; x=1743500834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rqrVjDy71pJJydCBHqV9OfKr55/ixkBk/o+Dd196ng=;
        b=MbqFozGzLJc8KXouf8kFsE6fly9xPCQX592xFy1uRLbdAdvY6ffiUZQ3fN/RW/DlxW
         QoWnvRZcjX8tf29frxBNCYj9skWFsVmDje4SqDAAa7hByDpTDNTEG3vitmDDIoTNdQme
         yNzvuHH6TzVhEH2ZETeA/Hl7vd0fSULaAUxfL7ZVuVZFClxHX3GHvT6L5jLcoSptbNh5
         B+Q5wqURP4v2sltuN36iLaS41Qm0ZnHet6SEyDL0WHg4Je28C+GrpjYpNNpC921FBGsX
         RuaW5g5gy5gMT08WYA95XpNucdFIKbYupp8rekKXGpYkHpGVWIv6YlekTmQNoAhHQWAg
         OI5w==
X-Forwarded-Encrypted: i=1; AJvYcCVtLcAlNMiWdtL/tt0DyvGRPcr+dzBedsVUgNzCQnQWLNVPX0Fgku9/R4W/knoeTqglTiSxRxuJ0Rur0fua@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfGu61Fvc8Xq3u/EuLsSfSNwJEP5QbZufQmpPDpnD8zmhnljY
	AGyOA/puD/DtVu5EG8CZxC5/AguGF1gW3mepNXZLpIzTqhRSaZJgSFFFIn0hbkM=
X-Gm-Gg: ASbGnctFIWDcC2wAB+Yjy2HuZH7fbU22XBoeMt7HNcCjOEMSgMyRT2r7TBDoYa87AjD
	cV9al7sHYwCAZOoOvOjiWiTDcRoNcse+24hnawQVGeAohIMtd9B2cb0IjurRGG1WyJgHbCireQQ
	JEU/Wo8dTKVqi/psSrYDrSMfC6GC0MHgJKyVfPJDEm3hEW0JiZ24LHA+u+3jZx4nm5C4cu2Jb8P
	vwEv6gb40QSvhCwsn2m0Bm+/Dg7ZAxO5Rjq20IMQxsC/eq4KGgy/woFPQSRKlk50ch9UGywVRSN
	hHFBO6X5Df/Rh/JJgfaBD9jXDH/d30/3534h6QdBzq9IokvLEZ7QK5A=
X-Google-Smtp-Source: AGHT+IEo8PzsmSUnbZnC42KObh8p2MImAXpa1n47kc+VRaNDGFKnj63udLOSJsJipS5XFi95tgzn+g==
X-Received: by 2002:a05:600c:1e18:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d509f64b8mr171291605e9.18.1742896033632;
        Tue, 25 Mar 2025 02:47:13 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:f88a:e8d5:82b:cbb5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d53678dfcsm134713535e9.18.2025.03.25.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:47:13 -0700 (PDT)
Date: Tue, 25 Mar 2025 10:47:11 +0100
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
	linux-doc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v36 28/31] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
Message-ID: <Z-J7n8qLMPVxpwuV@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-29-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319005141.312805-29-quic_wcheng@quicinc.com>

On Tue, Mar 18, 2025 at 05:51:38PM -0700, Wesley Cheng wrote:
> Several Qualcomm SoCs have a dedicated audio DSP, which has the ability to
> support USB sound devices.  This vendor driver will implement the required
> handshaking with the DSP, in order to pass along required resources that
> will be utilized by the DSP's USB SW.  The communication channel used for
> this handshaking will be using the QMI protocol.  Required resources
> include:
> - Allocated secondary event ring address
> - EP transfer ring address
> - Interrupter number
> 
> The above information will allow for the audio DSP to execute USB transfers
> over the USB bus.  It will also be able to support devices that have an
> implicit feedback and sync endpoint as well.  Offloading these data
> transfers will allow the main/applications processor to enter lower CPU
> power modes, and sustain a longer duration in those modes.
> 
> Audio offloading is initiated with the following sequence:
> 1. Userspace configures to route audio playback to USB backend and starts
> playback on the platform soundcard.
> 2. The Q6DSP AFE will communicate to the audio DSP to start the USB AFE
> port.
> 3. This results in a QMI packet with a STREAM enable command.
> 4. The QC audio offload driver will fetch the required resources, and pass
> this information as part of the QMI response to the STREAM enable command.
> 5. Once the QMI response is received the audio DSP will start queuing data
> on the USB bus.
> 
> As part of step#2, the audio DSP is aware of the USB SND card and pcm
> device index that is being selected, and is communicated as part of the QMI
> request received by QC audio offload.  These indices will be used to handle
> the stream enable QMI request.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/Kconfig                 |   14 +
>  sound/usb/Makefile                |    2 +-
>  sound/usb/qcom/Makefile           |    2 +
>  sound/usb/qcom/qc_audio_offload.c | 1988 +++++++++++++++++++++++++++++
>  4 files changed, 2005 insertions(+), 1 deletion(-)
>  create mode 100644 sound/usb/qcom/Makefile
>  create mode 100644 sound/usb/qcom/qc_audio_offload.c
> 
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 4a9569a3a39a..6daa551738da 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -176,6 +176,20 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config SND_USB_AUDIO_QMI
> +	tristate "Qualcomm Audio Offload driver"
> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
> +	help
> +	  Say Y here to enable the Qualcomm USB audio offloading feature.
> +
> +	  This module sets up the required QMI stream enable/disable
> +	  responses to requests generated by the audio DSP.  It passes the
> +	  USB transfer resource references, so that the audio DSP can issue
> +	  USB transfers to the host controller.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called snd-usb-audio-qmi.
> [...]
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> new file mode 100644
> index 000000000000..3319363a0fd0
> --- /dev/null
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -0,0 +1,1988 @@
> [...]
> +static int __init qc_usb_audio_offload_init(void)
> +{
> +	struct uaudio_qmi_svc *svc;
> +	int ret;
> +
> +	svc = kzalloc(sizeof(*svc), GFP_KERNEL);
> +	if (!svc)
> +		return -ENOMEM;
> +
> +	svc->uaudio_svc_hdl = kzalloc(sizeof(*svc->uaudio_svc_hdl), GFP_KERNEL);
> +	if (!svc->uaudio_svc_hdl) {
> +		ret = -ENOMEM;
> +		goto free_svc;
> +	}
> +
> +	ret = qmi_handle_init(svc->uaudio_svc_hdl,
> +			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
> +			      &uaudio_svc_ops_options,
> +			      &uaudio_stream_req_handlers);
> +	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
> +			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
> +
> +	uaudio_svc = svc;
> +
> +	ret = snd_usb_register_platform_ops(&offload_ops);
> +	if (ret < 0)
> +		goto release_qmi;
> +
> +	return 0;
> +
> +release_qmi:
> +	qmi_handle_release(svc->uaudio_svc_hdl);
> +free_svc:
> +	kfree(svc);
> +
> +	return ret;
> +}
> +
> +static void __exit qc_usb_audio_offload_exit(void)
> +{
> +	struct uaudio_qmi_svc *svc = uaudio_svc;
> +	int idx;
> +
> +	/*
> +	 * Remove all connected devices after unregistering ops, to ensure
> +	 * that no further connect events will occur.  The disconnect routine
> +	 * will issue the QMI disconnect indication, which results in the
> +	 * external DSP to stop issuing transfers.
> +	 */
> +	snd_usb_unregister_platform_ops();
> +	for (idx = 0; idx < SNDRV_CARDS; idx++)
> +		qc_usb_audio_offload_disconnect(uadev[idx].chip);
> +
> +	qmi_handle_release(svc->uaudio_svc_hdl);
> +	kfree(svc);
> +	uaudio_svc = NULL;
> +}
> +
> +module_init(qc_usb_audio_offload_init);
> +module_exit(qc_usb_audio_offload_exit);
> +
> +MODULE_DESCRIPTION("QC USB Audio Offloading");
> +MODULE_LICENSE("GPL");

What will trigger loading this if this code is built as module?

Testing suggests nothing does at the moment: If this is built as module,
playback via USB_RX will fail until you manually modprobe
snd-usb-audio-qmi.

I think the easiest way to solve this would be to drop the
module_init()/module_exit() and instead call into these init/exit
functions from one of the other audio modules. This would also ensure
that the QMI server is only registered if we actually need it (if the
board sound card actually has a USB DAI link).

drivers/soc/qcom/qcom_pd_mapper.c is a similar driver that registers a
QMI server. You can also look at that for inspiration.

Thanks,
Stephan

