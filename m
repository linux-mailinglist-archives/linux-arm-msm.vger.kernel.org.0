Return-Path: <linux-arm-msm+bounces-52518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D30DA71475
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 11:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CACE43AD7FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 10:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8441B4233;
	Wed, 26 Mar 2025 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0aKifaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8CE1A3BD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742983760; cv=none; b=eg6WpAjPHyX7zeO3fHeb0Abo4RFiTjTLUJO/Jup7afFoUcWHTXVVLMDL1Z/Y6YPlbJ+HWQVxeqS/WF5A4iACkdZFrO/qQoTdY3CAsA3KoFlcmUFefeIcDTZ/LNDnDKqJyFgKYvzou+OEieNSgxbXrwIbTMSXe/QZrpQq3KjUFxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742983760; c=relaxed/simple;
	bh=P2ErozGc1YzloiYKFY8XVll++8O7M+IJCl8ipftI2Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDD9AEGu5M453JrhCpoaTpJpHj3tKcX8XPotOJa9kX4hOfeh7eFDrVcHt8rdosrmT6sCCSwmsVYYOO3/X6E9GRyZmcbjOIJdRLxfJ1jQZBl1wIMO9PfBd9onUaXDxpbvZ6l/nw8d3UKumBApXlfESaoSn8L2QtoFaVvI8cQiqJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q0aKifaQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaecf50578eso1197061666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742983756; x=1743588556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxE8mSuQFba5USugxIRzMPXLK6rZ2IlU479/J4S7RRQ=;
        b=q0aKifaQ2qy5v288k5NA63z5aNi0UvdiSrsQXvU1PzWFATC5wn/+uaFX05IL5Gi6Xl
         T6wSSwD0/qtdTxQtx83rT/9A+LcCPNWK7UO7v8wZjF2Wet5rLDWIoUKvKMrttpByUuUq
         QQegCzmu73TDiurY1QJNV1ry+9zjEpxFbViPQoQ8s0bjCvOdcQgtV6+OY2Mt2qQMUXqK
         2ag+iKc1VemK1wWwGLGjoEU5pLGcN8oSQwn1E3tshfHMEcgGdPDVG7sf/HFXs8+pDVVs
         QtsTg4UEBke3wDZs9YJBrJxPemcBwfulTiZETMnMC8Rimp/YWcHdnrOaPXipVIgkqTJN
         Ggbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742983756; x=1743588556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxE8mSuQFba5USugxIRzMPXLK6rZ2IlU479/J4S7RRQ=;
        b=uPZlAhZVQTsQyNnFSNISwl/eLO6gWd3QR0qhcc8SrJ/TjYiMipvE3ILzBOzbbC4IrM
         0f9p6m0giZiYeHjkO4tErv3KcMZDBmpIWXOmsWJlmDDxMWJbUF6zZ1nPBgyIvIGpJZY9
         aciyQQNCybFy/UTxy4pGjtBDk7QEdZZ/3Gzs6arDyGPG8Bm+AkITiw46Vmb1bSyvZXJY
         +D1WC8xXw+nPvTEyRutxzJq2e0F/Gl2mng2oZGIiFUeeviFDrK6o9g9rOB5XAFYew5qd
         OxzpnCacMVZqfRSysJVUHIYaqbbWqABSLvyuak9xg87oL0ohKF9LIw56bnmuDhJXcq64
         BdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7nW63QQCuL9d86bkTml5VRGlsY7KorcVgjzgPn3uX+WPVbmzRygt0y8HU3V6rFlZpKT0Ij2sQB8w0ZCXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YykTnVJBPMMv47PnTRyfKeXG8yKmX3VwdZx7NY64E53NER/QSxE
	weTxPWeSicL3zPjKBCTeAdDjFf+5vNblPKboCjLJPGd2pDLydsRb0BDAiX3Mwj8=
X-Gm-Gg: ASbGncsHIxRtkYEmydOjr0MV2y+M5NQKuCzwCllSMm9dO+xIrFwVhFbe/xs6fKmWMGK
	gEm3h24KRRyJ8Suz3LhpJVJrmp9K6QGgiSGTzPwUNqBq4CwalEDUD7Pb0VNRHFdMlaanfVQWpRk
	uzKWQOAwqbtcWWqpB0mL+idnMqL68OXKRNUlzNiJB1RZHNFSS+WNvxEHcey8daxx6ks3pBwTHJe
	AwQHdmqb5SBpiyOZd///ZUNt/zOCJBi7d+X8n98efRmv7IDZ7+l+tj0mYzAydjRuxU+ClGvn1bM
	Ootk7qCg77xsAl6+6ixJ/aWxMIzyjKqnP5HDiXprvSbUXBf3EKw/jng=
X-Google-Smtp-Source: AGHT+IGuB/epcJCgNqpypGqs/8PJnFxUfea7pF2X+I+R3S5XuLqn/BDqdYJIFIeL24XP+sXSUduRlw==
X-Received: by 2002:a17:907:7292:b0:ac3:8895:8e99 with SMTP id a640c23a62f3a-ac3f20ba753mr2011787766b.3.1742983755500;
        Wed, 26 Mar 2025 03:09:15 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b2cf:5182:7604:e8d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef869eefsm993244766b.30.2025.03.26.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 03:09:15 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:09:13 +0100
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
Message-ID: <Z-PSSXt8WY3yVFM4@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-29-quic_wcheng@quicinc.com>
 <Z-J7n8qLMPVxpwuV@linaro.org>
 <5a7442c9-493d-4c23-a179-128f02a29f73@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a7442c9-493d-4c23-a179-128f02a29f73@quicinc.com>

On Tue, Mar 25, 2025 at 06:32:14PM -0700, Wesley Cheng wrote:
> On 3/25/2025 2:47 AM, Stephan Gerhold wrote:
> > On Tue, Mar 18, 2025 at 05:51:38PM -0700, Wesley Cheng wrote:
> >> Several Qualcomm SoCs have a dedicated audio DSP, which has the ability to
> >> support USB sound devices.  This vendor driver will implement the required
> >> handshaking with the DSP, in order to pass along required resources that
> >> will be utilized by the DSP's USB SW.  The communication channel used for
> >> this handshaking will be using the QMI protocol.  Required resources
> >> include:
> >> - Allocated secondary event ring address
> >> - EP transfer ring address
> >> - Interrupter number
> >>
> >> The above information will allow for the audio DSP to execute USB transfers
> >> over the USB bus.  It will also be able to support devices that have an
> >> implicit feedback and sync endpoint as well.  Offloading these data
> >> transfers will allow the main/applications processor to enter lower CPU
> >> power modes, and sustain a longer duration in those modes.
> >>
> >> Audio offloading is initiated with the following sequence:
> >> 1. Userspace configures to route audio playback to USB backend and starts
> >> playback on the platform soundcard.
> >> 2. The Q6DSP AFE will communicate to the audio DSP to start the USB AFE
> >> port.
> >> 3. This results in a QMI packet with a STREAM enable command.
> >> 4. The QC audio offload driver will fetch the required resources, and pass
> >> this information as part of the QMI response to the STREAM enable command.
> >> 5. Once the QMI response is received the audio DSP will start queuing data
> >> on the USB bus.
> >>
> >> As part of step#2, the audio DSP is aware of the USB SND card and pcm
> >> device index that is being selected, and is communicated as part of the QMI
> >> request received by QC audio offload.  These indices will be used to handle
> >> the stream enable QMI request.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> ---
> >>  sound/usb/Kconfig                 |   14 +
> >>  sound/usb/Makefile                |    2 +-
> >>  sound/usb/qcom/Makefile           |    2 +
> >>  sound/usb/qcom/qc_audio_offload.c | 1988 +++++++++++++++++++++++++++++
> >>  4 files changed, 2005 insertions(+), 1 deletion(-)
> >>  create mode 100644 sound/usb/qcom/Makefile
> >>  create mode 100644 sound/usb/qcom/qc_audio_offload.c
> >>
> >> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> >> index 4a9569a3a39a..6daa551738da 100644
> >> --- a/sound/usb/Kconfig
> >> +++ b/sound/usb/Kconfig
> >> @@ -176,6 +176,20 @@ config SND_BCD2000
> >>  	  To compile this driver as a module, choose M here: the module
> >>  	  will be called snd-bcd2000.
> >>  
> >> +config SND_USB_AUDIO_QMI
> >> +	tristate "Qualcomm Audio Offload driver"
> >> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
> >> +	help
> >> +	  Say Y here to enable the Qualcomm USB audio offloading feature.
> >> +
> >> +	  This module sets up the required QMI stream enable/disable
> >> +	  responses to requests generated by the audio DSP.  It passes the
> >> +	  USB transfer resource references, so that the audio DSP can issue
> >> +	  USB transfers to the host controller.
> >> +
> >> +	  To compile this driver as a module, choose M here: the module
> >> +	  will be called snd-usb-audio-qmi.
> >> [...]
> >> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> >> new file mode 100644
> >> index 000000000000..3319363a0fd0
> >> --- /dev/null
> >> +++ b/sound/usb/qcom/qc_audio_offload.c
> >> @@ -0,0 +1,1988 @@
> >> [...]
> >> +static int __init qc_usb_audio_offload_init(void)
> >> +{
> >> +	struct uaudio_qmi_svc *svc;
> >> +	int ret;
> >> +
> >> +	svc = kzalloc(sizeof(*svc), GFP_KERNEL);
> >> +	if (!svc)
> >> +		return -ENOMEM;
> >> +
> >> +	svc->uaudio_svc_hdl = kzalloc(sizeof(*svc->uaudio_svc_hdl), GFP_KERNEL);
> >> +	if (!svc->uaudio_svc_hdl) {
> >> +		ret = -ENOMEM;
> >> +		goto free_svc;
> >> +	}
> >> +
> >> +	ret = qmi_handle_init(svc->uaudio_svc_hdl,
> >> +			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
> >> +			      &uaudio_svc_ops_options,
> >> +			      &uaudio_stream_req_handlers);
> >> +	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
> >> +			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
> >> +
> >> +	uaudio_svc = svc;
> >> +
> >> +	ret = snd_usb_register_platform_ops(&offload_ops);
> >> +	if (ret < 0)
> >> +		goto release_qmi;
> >> +
> >> +	return 0;
> >> +
> >> +release_qmi:
> >> +	qmi_handle_release(svc->uaudio_svc_hdl);
> >> +free_svc:
> >> +	kfree(svc);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void __exit qc_usb_audio_offload_exit(void)
> >> +{
> >> +	struct uaudio_qmi_svc *svc = uaudio_svc;
> >> +	int idx;
> >> +
> >> +	/*
> >> +	 * Remove all connected devices after unregistering ops, to ensure
> >> +	 * that no further connect events will occur.  The disconnect routine
> >> +	 * will issue the QMI disconnect indication, which results in the
> >> +	 * external DSP to stop issuing transfers.
> >> +	 */
> >> +	snd_usb_unregister_platform_ops();
> >> +	for (idx = 0; idx < SNDRV_CARDS; idx++)
> >> +		qc_usb_audio_offload_disconnect(uadev[idx].chip);
> >> +
> >> +	qmi_handle_release(svc->uaudio_svc_hdl);
> >> +	kfree(svc);
> >> +	uaudio_svc = NULL;
> >> +}
> >> +
> >> +module_init(qc_usb_audio_offload_init);
> >> +module_exit(qc_usb_audio_offload_exit);
> >> +
> >> +MODULE_DESCRIPTION("QC USB Audio Offloading");
> >> +MODULE_LICENSE("GPL");
> > 
> > What will trigger loading this if this code is built as module?
> > 
> > Testing suggests nothing does at the moment: If this is built as module,
> > playback via USB_RX will fail until you manually modprobe
> > snd-usb-audio-qmi.
> > 
> 
> Yes, it would only get triggered on a modprobe.  I think the more important
> part is when snd_usb_register_platform_ops() is called.  This is what would
> register the vendor USB offload driver callbacks for USB connect/disconnect
> events.
> 
> > I think the easiest way to solve this would be to drop the
> > module_init()/module_exit() and instead call into these init/exit
> > functions from one of the other audio modules. This would also ensure
> > that the QMI server is only registered if we actually need it (if the
> > board sound card actually has a USB DAI link).
> > 
> 
> It would be difficult from the perspective of USB SND, because if we got
> rid of the vendor ops, it would be messy, since the USB offload vendor
> driver will be specific for every SoC.
> 

What I meant is calling qc_usb_audio_offload_init() from any of the
other drivers that are involved, e.g. q6usb. Or register an auxilliary
device like in qcom_pd_mapper, so the modules don't need to link
together directly. That shouldn't get too messy.

There are several reasonable options here, any of them is fine as long
as this module will get automatically loaded for users that need it.
Anything else would defeat the purpose of the generic USB sound
offloading userspace interface, because you would need to load the
QC-specific snd-usb-audio-qmi module manually. :-)

Thanks,
Stephan

