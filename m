Return-Path: <linux-arm-msm+bounces-75398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D253BA681D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 07:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3D741899FDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 05:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BD728DB54;
	Sun, 28 Sep 2025 05:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdRHcTbb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6912D21D5B0
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 05:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759035797; cv=none; b=NShJb5GoC/RCs//BCEyiRIwXxMJFF/foXWY6pcFSElgABTSDNvNPfJw3B7SYzHmdkroeUbjx/RnsjmTbtJoqRyY7W+POR6G7D9j8szmpXdiADPXjb+fYxFkGI/MUUWzx8il3Zitq4HLwhjFcEgFcVLiaKtoqGtwqzSB+0YVF+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759035797; c=relaxed/simple;
	bh=QMtV6OGFQw4H+Fr4qxLekLxCa2Qt7VL//D+5G2Q4PA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0sFgZP2+UxIY6TEsZ+dpYHQwGitDoiCdFCnK0CY7V4HoL2Fg7pfjvU94i268Otx7UcV3itLoewBzEIPP+QzxVaV81OJhOpOLHIpZGm18ksMw87RpXGJzYHiFrLMcKwWGXUltoFBRFTweQgxPB+Ha9ECLBgORNLhM+/WwwaOXFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdRHcTbb; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b593def09e3so818322a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 22:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759035795; x=1759640595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xm/OUWyFAO6MekzNliwFbpLwUdv2bsJ5HXnGJgKstlA=;
        b=TdRHcTbb5LaW1+g2m1lt9ldBrNDJGsGIymDK4SnGNBrNSMjpTzwyl+fx6PFd196tda
         vzJRSJ4i6MxfNzSh28mi6NeQ7pTD+4MxOKiqMZdi8ohM6hw/esAlq47ZwMK10Nkva2bK
         /jN905kgffqE2BYeitRKEz7O0StMJ3enIxwZgmHEDfPAGUQKJ/tUjBQzQwqkRMGUYPZW
         o0cSdm9w4dgHZ88NNWDgWFaDmjeCVbAk/GrjhR/l6cHQ37Ve2vp4jb9UXey9YVeP4OTG
         TT2MMy5nLjyYjpgD/w8KjNNg8euIYhVrTYODvswpaNvsPyyNPiJGGziGzPVWAn3z/LXK
         MTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759035795; x=1759640595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm/OUWyFAO6MekzNliwFbpLwUdv2bsJ5HXnGJgKstlA=;
        b=gCUoohduuBh/qZiAjD4Ts3AF9S3WUh3HfEOSV8dyewL+Sq6G8SLsy5eXZO2h+2tA4r
         cvTh51rmmC4TuW5O2DaAiUrfR81fsJ8R5UtFee22KqzZK5ImBolrq1wJ1cdBnm7bQ/kx
         tuO7poa8zGN2gfMf5ztLJIMk9zYUQXibK6vMNbNS1KIB7LCjQ26eT8WPsuNJdoDkt1FB
         FSGxCwFtkRRf2/3sXBcUnipXDCdIuu8U5QZqtrcKRvVd3rRaILw5osh/8wnzhUMbopSZ
         sYRRGJJO9CNs2CvCPa+cCr/o9Se5BVy0iuKsp/bxN45OTZv52sBZ8YVjn/8fXH65tJ6E
         WNqw==
X-Forwarded-Encrypted: i=1; AJvYcCWH2NJL3Qq8+C5GGkkxTywJZpbqZTpx4JjUgeV61i/OvqnBieGcAeh0TaTmTehiKEzpsXEy/VliymZ1qeQ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8LTLa/n5uWEZpKwmnsRWUml+U14KksgzuDPUrd4wftqeERig
	YsMPlTbk3Xf4/OmN0Vhzz8RQRlGvkhoecL2q6zb1YsVDViCWpgIzHs77
X-Gm-Gg: ASbGncuoj4+ebZpRY4hxNKYY37pQScVGJXieXCjJvR10BbERsruOEMwTD+9amZHjsYd
	oihQR8Kn5S+XEREPLq5FfXbIUmOV9cy5vVsz2yExDfR9P7zTH0EzQBs3m56cEpxR6yjHIO6wT1+
	gnLo1Frhlol/SlJVhtsDQX9iEaq7i3S/Ch5tviXn/i1yVWkajR5XRnCwTBXF9nvZNo/znEAw+7+
	1Rk+SYAe1pQCSnP5S+/DNodpAXhbRWDqOYg0c6/3O7VCMO1rfTLNdI1tSY2ItKog6Xf7eYnBGBm
	vNSUdLjjGv4LNKaybtbVoSXy6dVnSOj3j6reBY1Un+weiUS92vtdZq3WMvvHVD+b4wXRFqSEkyF
	OE1a9ktviEqC4GJlFz89A0qjaQllKh4hlDnaEN5cy5VB3/KECth/K5EoCJMYfvv+dPnQNOnmJhw
	==
X-Google-Smtp-Source: AGHT+IGM7HTl+rp2pt0cDMfA3KNGD3nZVxhzYLkjSlK2EgGIN6LujG//pIftIad7lmbGXj0A54imuQ==
X-Received: by 2002:a17:902:e805:b0:267:b6f9:2ce with SMTP id d9443c01a7336-27ed4a465cbmr132772135ad.41.1759035794491;
        Sat, 27 Sep 2025 22:03:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:22dc:7b49:8c5d:38f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bf9bdsm95854355ad.127.2025.09.27.22.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 22:03:14 -0700 (PDT)
Date: Sat, 27 Sep 2025 22:03:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/3] Input: aw86927 - add driver for Awinic
 AW86927
Message-ID: <gswz6zhukprs6q6mrv6pmzcitxrvzktubylhan7knjcs7tjbxf@325gvpk5cyt7>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
 <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>

On Thu, Sep 25, 2025 at 12:07:29PM +0200, Griffin Kroah-Hartman wrote:
> Add support for the I2C-connected Awinic AW86927 LRA haptic driver.
> 
> This driver includes a hardcoded sine waveform to be uploaded to the
> AW86927's SRAM for haptic playback.
> This driver does not currently support all the capabilities of the
> AW86927, such as F0 calibration, RTP mode, and CONT mode.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

Added missing header, changed uint8_t to u8, changed some formatting and
applied, thank you.

Thanks.

-- 
Dmitry

