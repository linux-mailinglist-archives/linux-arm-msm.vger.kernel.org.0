Return-Path: <linux-arm-msm+bounces-36904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1D9BB13F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84E96B20A65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52151B0F39;
	Mon,  4 Nov 2024 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0483Qik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B92C1B0F1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730716692; cv=none; b=PalOk1G+cmMPW1K1pxVezPnEEm6T707CvW6M9s1rxbc1mP/XZNBqO+LQ6P8y4jJe64EHXmcsijzsBKLoU+gQn8UFfYbj+itYzIDzn8hYlx/r506yO3h4i/kqHzBXRGK4i0PvchCgfrlnqys/XNibn/u9eWFOe7Rw7/F3aFcS638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730716692; c=relaxed/simple;
	bh=xwWZwwcn51jaXtwKmzPbEuoR6+YElHj+lA2wMMF6TWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/h0nQOBzUDAj0JRuytaT+VszIHy7516aekEeZpKcdyDlSSvs9A/FWW6fq+hQRzhIX2bcsdsZPjQhaksR414osK07M7xSijc9yuHWsHw6P+iXucF3EH8NTprupIVZEl59xoLey7MVM2xTQrUeK8EM4szW7SeRpGQnsxSd+qHLZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0483Qik; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so31373255e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730716689; x=1731321489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GagFwKjABVTIe4HYHRHjXXNLM2jLeWvrTaqq4VcplQ=;
        b=A0483QikxR+eaNoOwXEDgIopWHeHuLwnl6s4aO0rpz/0ja/KeFf8j+cTdPuRR9OFF9
         Cg9BsHK/YvX1vkPLqXhri5I2cgnXxxGfHkT43qtDP4CUxmEjOo2yIFlkS7R3R9lm2D9X
         3Vf+fACsYrO5aVzeuMpfaom61Es3YSj0UaVnCnRy60Mp1kximXgCP1uI0hu/gP9+fg28
         TxS/TYt4udukXQpxfeGWWQQSBZg/2SBCPNcaj0cQChFbRZ81toSYhp8m+IRALKcoRTkR
         PmeK9tPlEZ6RnrD6+5TPjtvF3eo5T1tYc47f/HawHYltnpUqsgXvZJitbdsuVHZZomO6
         IQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730716689; x=1731321489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GagFwKjABVTIe4HYHRHjXXNLM2jLeWvrTaqq4VcplQ=;
        b=mdgdaCr8KIOCrjG1R/0ynXsgep1dzr5+D4qlnwWQPKBXHzTZcPaD8rfP2SCBJ11K2v
         sDLo5VTvEJ5JcC/yZUJXeFRyoY19YN4o8NRjpDl2OSHOKjNpEUoWOSMx/g9E4EKYlkv5
         AT+UJZ9s1rXW26lkchPoVE0POLKb15CgJlubNIo65Ma41ghb6iVjoV0Ftc2y1dL/JuV9
         5M7R9Lg1b2xyzPqk/59JsZoVLkKmEkYSqZn7kri+m7nnJVDU9og3HyzgPVSKxDOG7lpP
         vYVnK5RmLfnQXBBR+djB+2lTJZ/A0U8bAE2s47c5kjU0xuWoNjjGb5zkLbrxqs/SVvO1
         wB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU234pGASXCeOND7cI7DUUfepJx8MjZbFHTBvqe8OKlS2GSte8E0Oc8YcB+HFTwl7cjfbs8XEPU+PCmIj4+@vger.kernel.org
X-Gm-Message-State: AOJu0YxFx+uI2yTXLl16dGl9Og4XRq1ZjMLMen9/o2C9+iHr5WwjOJKC
	DXcparf6Qf4PkRmDBVLPXmxMBVRp8047E//57fvnt0mIXghjVR85bzKoarLDiSg=
X-Google-Smtp-Source: AGHT+IGDv+BWsToa2qebbIIuESESX63daj1rU//RwGBiGESK5sCmhKnPNAI2XHtTuUedj85ZPP7IYA==
X-Received: by 2002:a05:600c:4215:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-431bb9e6031mr165238775e9.33.1730716689615;
        Mon, 04 Nov 2024 02:38:09 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a9a53sm178662105e9.30.2024.11.04.02.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:38:09 -0800 (PST)
Date: Mon, 4 Nov 2024 12:38:07 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <ZyikDytdk0mJSD8A@linaro.org>
References: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
 <20241101-x1e80100-ps8830-v4-1-f0f7518b263e@linaro.org>
 <fzqkcpmww65ubqluyy42q2hl6nwhxabwchcaul3ocqjdwhuuo4@dcychynbcstc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fzqkcpmww65ubqluyy42q2hl6nwhxabwchcaul3ocqjdwhuuo4@dcychynbcstc>

On 24-11-02 09:58:12, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 06:29:39PM +0200, Abel Vesa wrote:
> > +$id: http://devicetree.org/schemas/usb/parade,ps883x.yaml#
> 
> Filename based on compatible, so: parade,ps8830.yaml
> 
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Parade PS883x USB and DisplayPort Retimer
> > +
> > +maintainers:
> > +  - Abel Vesa <abel.vesa@linaro.org>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - parade,ps8830
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: XO Clock
> > +
> > +  ps8830,boot-on:
> 
> I don't see previous comments addressed/responded to.

Urgh, sorry, this should've been dropped.

Will drop it in the next version.

> 
> Best regards,
> Krzysztof
> 

Thanks for reviewing.

Abel

