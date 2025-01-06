Return-Path: <linux-arm-msm+bounces-44015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E3A027DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 15:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECF057A2DEB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FD61DE3AA;
	Mon,  6 Jan 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EI3iFYAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018C1DDC06
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173453; cv=none; b=MrT0J8paH6VEp6vKqckKkT9plaI2svYoUhis1pn4MJxhb6xA8sTBNjMtq4La9GZHVykjJMMyz7MbDgFV/CtxBrDXVfWDpruxKX9t6idUacSdp7VY64c2tRjWmOd7lEcQWiEZjiJMP0W23nCjIQzP1h7pyQRukVYHuZebc32Q830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173453; c=relaxed/simple;
	bh=3QY2uoS0w9qo6V3kkieOs3n2GA1/sB3obmGRLcrLb/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnaeGytWtGd3R3NokrhK4mFT2730DkcI47a7Gy4rODhBAYIHeAzLpekuoLQ+B/AEhe9Ssx/kAYKlxNV4APQyYLX9E/VPoDp38NiqRG+WvOds50GvzLgRH+PJzwvSVNR1fO1Z3R+8At0JuqWaZLQjXLrr5rxLmjy3gWgLGMxAnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EI3iFYAM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e2880606so10481859f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 06:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173450; x=1736778250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pd6df62WwHwD+vu9tEl8fPUc4jb543mAbr3HwaooOnY=;
        b=EI3iFYAMRhy3Q0YBvij2tQrebVKvMVPOw8VYFBDHy7NykbdBdYS8FhUlR09KyjakbA
         9X8doRtliFtc/SKpNqf6gIituxv8kVrrS3giTuOGit4sKlK0KilPmS/l/mkg1JIcUQLT
         +6aXdfyL+VJSnkY22eWPDyjimDr9f0+l3ly/caYyzvXoGUtzm7Ul+NbNKvclCon7j/AB
         ReCHRSIkw48m3314OinHFsbzAQS+/LJ6gtilUIRb7sFNcGgGNRBeXD+WXpXp6jPMD1bv
         NeVmsIMxrUCmsCBlr6UEFr36nLxzrtLtdTcUlyOYQJpkX1H3yKg+H531FphVPwbiIm66
         gbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173450; x=1736778250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pd6df62WwHwD+vu9tEl8fPUc4jb543mAbr3HwaooOnY=;
        b=DaVLrWEwKbV/U7qRaYcu2b/y5U2Uq/+cPlG64rNKJUpifJBbM+k4sd8Lr2Q83ci8De
         kzDPbk+g4fz3s469ZBynt3PdYo4bt5Mwlz2uzm5lFDDKJyUnewyChXAfnQ0StvC+sqk3
         oyd8o2Uwq/jdfyFlV6EI46vor+q9TRPHjTlxq5wDTNI7R9msCkHbhtuxeKZVCdWI9ZHK
         JuQwUMdwaFim0SU5xqKXB/WpcJa3FvnvBB0devGxQgVfMQRB3iJVuKUt7NOS44VAc2GF
         IIid6S3vwXFgCc0oU/ZN1yU6fAnhAek6hE1lbl5csEsLPG0ewF6yAOM1JDBEb14E/cRH
         exJw==
X-Forwarded-Encrypted: i=1; AJvYcCWsr6p6ulS2cKxHjPT+Yv6LZLLdqsc/OC7LApo/bHI6PhKyrXtmd/EyIeqhl5rVhqLIJB9+Iv5R6cXaKGSz@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgSH7Bd95KzOiEpA3TOeM0sGORqaquJHYSMAAAMlCHUqo8P1u
	+HB6CkIUzFyqlBX6QNPoYDR8vnbi3872vmSgh2W6SXUpoFeZexvONcXicTpJM6U=
X-Gm-Gg: ASbGncu95UL6/LaerG3HR/KDbeet/nNycaPSxYUFPeCFuyRgeYR/xiZwesd/OAAD2K3
	q4EIGoOPKAd9r93kXqtB3b5Ata99TCtwGCwRsQqT8jD2+x/gq9s3DkJi5oK0nTN5LEYr14qSxMV
	Z/KkgKvI2RajXwHb62qd2TIGgmzQ8USgHZ+d5+o6uzVjovzLjf6VDOwC7Mnarm0oCYsU9POzZBL
	mUVroJQUuJj8/4ELSLolbbrBd4J6nUBxwpyBaH8WbUnaCqDRNo/c7g=
X-Google-Smtp-Source: AGHT+IFyA2cQ10QBXurgm+EzR87lUbaz02Gbz7Wpu8Hy8EEKJWLGVQzbD4hUWxuZKDFzGj91ZDa9sQ==
X-Received: by 2002:a05:6000:4023:b0:385:e5dc:e285 with SMTP id ffacd0b85a97d-38a22406d4emr51330517f8f.58.1736173450246;
        Mon, 06 Jan 2025 06:24:10 -0800 (PST)
Received: from linaro.org ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1646esm599419505e9.26.2025.01.06.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:24:09 -0800 (PST)
Date: Mon, 6 Jan 2025 16:24:08 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: x1e80100-crd: Enable external
 DisplayPort support
Message-ID: <Z3vniJSY154rznQh@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-4-4ad83af4d162@linaro.org>
 <ZzOK2Xz1QQvugGnG@linaro.org>
 <2024111341-platter-disk-8238@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024111341-platter-disk-8238@gregkh>

On 24-11-13 07:03:38, Greg Kroah-Hartman wrote:
> On Tue, Nov 12, 2024 at 07:05:29PM +0200, Abel Vesa wrote:
> > On 24-11-12 19:01:13, Abel Vesa wrote:
> > > The X Elite CRD provides external DisplayPort on all 3 USB Type-C ports.
> > > Each one of this ports is connected to a dedicated DisplayPort
> > > controller.
> > > 
> > > Due to support missing in the USB/DisplayPort combo PHY driver,
> > > the external DisplayPort is limited to 2 lanes.
> > > 
> > > So enable all 3 remaining DisplayPort controllers and limit their data
> > > lanes number to 2.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > 
> > Please do not merge this specific patch.
> 
> Please do not mix patches that should, and should not, be applied in the
> same series as that plays havoc with our tools that want to take a whole
> series at once.  Stuff like this just makes me delete the whole series
> from my review queue, and if you got sent something like this, I imagine
> you would do the same :(

Sorry about that and for the late reply.

Will send the patches that are for testing purposes only as a separate
patchset.

> 
> thanks,
> 
> greg k-h

Thanks for reviewing,

Abel

