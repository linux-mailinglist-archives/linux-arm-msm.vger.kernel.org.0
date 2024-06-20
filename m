Return-Path: <linux-arm-msm+bounces-23394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A330910AE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 18:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA6551C23810
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 16:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A5E1B142C;
	Thu, 20 Jun 2024 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TaeLsr0E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65A1B14FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899271; cv=none; b=p9dZep8QzwEqan5rSTolt+l7ibUsUq0KoMPyh6Ly2HQfcZSAgPUzDXBFt8JRvK3Q843bnLqNrHuHM+0xJRO2R0FsMyCg5ASl+dq6WB1+4/Wnk73AnGHRMyQFk5EebVC52eRzNfSsvH6Cqe4SZYVqxrSXNPwRRjV80AXwamquJ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899271; c=relaxed/simple;
	bh=hTqdjQ7Qi7hrrGxMOL3oVhnoPLode3S8RCGjK7+oaGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0+ge2LPeStlGJL8IOfs8qpqkRUAV8D6eQg2Iy7s0pQFjhfDpoPA6MN+CO3o0lbBSA79Ge5dADJ5FAHHlVHmCB4DO1PQ5ciru6N0Nn7eP0zXemmMKt18fRRRr9ydElPJyMbf09B0J5WsoH3Cqo0hVx3+BS2Q01465KRTmrA9koY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TaeLsr0E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718899269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ge9wVg87VaRL3PDUR6ZA+JS1REZ5t326tgMiEDsgJFg=;
	b=TaeLsr0E08nc0bGKQvvjvkOPJuGYAzQcpgw8gQsVaFkZ35liYDRGkh4Gn+Fw1cm3Qv8HDS
	G3T6UcHPkt61JIKY5ki+M1ac42za1oGwimOc0NeD2psWEaVFbCLxdC2l85IzhnR42iaYzV
	YYhSKYJ3fRF3aDRAzWlzbFCjgmJaT/I=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-EMJWUgZDNb2z25VTIZOI1A-1; Thu, 20 Jun 2024 12:01:05 -0400
X-MC-Unique: EMJWUgZDNb2z25VTIZOI1A-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5bad2fe768bso1085050eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 09:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718899263; x=1719504063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge9wVg87VaRL3PDUR6ZA+JS1REZ5t326tgMiEDsgJFg=;
        b=wpKRc40zlwIL9xm0s6sStzV99M9VrB2M9GcHSGETl51V8lLxXtZ0Fg3D81F5pgUjKL
         oJbrK4DmhU4pdRyg10SWPicoeWHgw8Oi3lCqAVEN1e8mw2N+2oHhZwzC+uUXVufR9wpO
         7qlE3xbwbP3C85gLmU0p8D5idy8lxmCiIpiONCCFdynm7mcrR2WnFxdwFytGl/kNvG/H
         EQPLWbJoOvUPrbcWqh8T2YRTiu57iNohDKofTWK+X/n3M3polEQSNcgoVTlhqmsxNijY
         +EL92+gbjpwFJUraeuGB0LiHs7gan/MXSTdortp7sENYjxL+Gd7/gRT0UXticL1gFEfX
         K3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTZWmZtaLDWaEG8FxlL5au/vRiSCc7a15yHH/y2O0Q/Lace42rt2EeGFNmrx56//ypz54VJRHm284pzBNWv0WGK2Ohhap2NBXhk95miA==
X-Gm-Message-State: AOJu0Yw91XEt8vZ2yTBe2LQdna8OEsV4F4B0QPKWB5c6jRZbcNHuy0E0
	xY2SXk5MoGcoJf3zX8gDYXJ45nUQmlrqYWg7dTFKAUJnhrFjTM1hVOHua+VJUbgibqNSNYLutRM
	0ktP9dxGAIHUv3qY2pd6cdxnuo9zdi4Bt/eJsjvpkCvnUpM/59F155fOFXRvUcAA=
X-Received: by 2002:a05:6358:6f19:b0:1a1:cbe8:be76 with SMTP id e5c5f4694b2df-1a1fd657194mr718534555d.28.1718899263419;
        Thu, 20 Jun 2024 09:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrAQoubwE9GNV7F+9zyFogOGxSttJFumzX4SRRsenGs0mNCuRfVp3c/qRTDLVFFmBItzi0fg==
X-Received: by 2002:a05:6358:6f19:b0:1a1:cbe8:be76 with SMTP id e5c5f4694b2df-1a1fd657194mr718497355d.28.1718899258167;
        Thu, 20 Jun 2024 09:00:58 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe2773dsm708132785a.99.2024.06.20.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:00:57 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:00:55 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sa8775p-ride: support both board
 variants
Message-ID: <eewxzrpcvwodj2ntiopezcjud6hj4fhi3ct7w3tdrin3ds3jhb@evuaplkq3477>
References: <20240619183255.34107-1-brgl@bgdev.pl>
 <4df2a52c-c21e-4da0-9ca0-13f28e81018c@linaro.org>
 <CAMRc=Mf4dZHMyexj1Xaw1dMVw0OT3=1t8OMfpHCB0xGJ9JdvSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf4dZHMyexj1Xaw1dMVw0OT3=1t8OMfpHCB0xGJ9JdvSw@mail.gmail.com>

On Thu, Jun 20, 2024 at 09:07:05AM GMT, Bartosz Golaszewski wrote:
> On Wed, Jun 19, 2024 at 8:50 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >
> >
> >
> > On 6/19/24 20:32, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Split the current .dts into two: the existing one keeps the name and
> > > supports revision 2 of the board while patch 2 adds a .dts for revision 3.
> >
> > Are both gonna be actively used?
> >
> 
> Yes! This is the reason for the split. I initially wanted to just
> change the PHY in the original .dts but then I learned there are a lot
> of r2 boards in the wild at QCom so we need to support both.

For what its worth, I've got access to _only_ the r2 boards in a lab
right now and use them quite actively... so please don't pull that dtb
:)

Glad to see some movement on supporting the newer version I've heard
about but haven't seen!


