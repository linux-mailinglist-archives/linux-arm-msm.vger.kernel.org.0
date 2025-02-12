Return-Path: <linux-arm-msm+bounces-47808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE0A32F8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F27E188AAF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 19:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB02262163;
	Wed, 12 Feb 2025 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwA/s65P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53B41DEFDD;
	Wed, 12 Feb 2025 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739388318; cv=none; b=DC0UTjYnXQdFbN6xO07925xfXDJze2y7iUhCBvl4cGTskN6omj22sLtLTUGEqUUVXpiiE88LHv6Lr4W538bxwOKjbLhnbZ2/51ausnf9Hs9Rm9a/JWSXqPwu0X6CVTqbqVNwrO7M99frwjRGOuvw8zL0H3MUO7wHlN60glvQwhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739388318; c=relaxed/simple;
	bh=sSKn3cAe8vJOx2Ub9060X3L9Kew3cuPp2yioPFziWMo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E+FJwCIhfF4KiWs2aluq//baI4btIXpw+Oc0iDdMjGflCO7j3EAsyoofp25kKjFvXkd8Nv6fCi5fpCXPZETxF66HUoGO/CCsOCOOKxR7Om2/UtoUWtUTnq4ZKq8fXSLJXR2crdiUbnu/M5VoGsBshbjWAswKV1gDWXyp7MlaxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwA/s65P; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f6022c2c3so21685685ad.0;
        Wed, 12 Feb 2025 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739388314; x=1739993114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHuwhzhUtmjes/uvYM9YoGu3wUSPo/UpEOhuRs84cMs=;
        b=fwA/s65PtA9lp8lXSWfuZBHo6j68lGSJpYdzRzB2Qp/V9YKCojDuRnJ6D/7/CKbRRt
         xnHEbMTEfIeXv4vivxpqGbOrccfLbMZft9ruJABNhVnC2ypi0NROy9Ki1AxDARE9VOYh
         yAoXArAuZW7dk6tr/4tRyr32OfWEFukxx+ttv+w9ovHRtEA1hLZ011HhT93/TVH318TV
         USP44ziZtCFbBfgAbiVFV7PYpcUMgIBCT/MjA8cRE4B9XzP8MP8BFn2h0xxTogcb7flc
         IaoxBSD+Q55KeAQQKpU3+LHbZsmoDcWXJuJz3s1XJ1kcHSKTj286nN5xDkTmUTlijzVq
         QLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739388314; x=1739993114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHuwhzhUtmjes/uvYM9YoGu3wUSPo/UpEOhuRs84cMs=;
        b=xSe/v5q4/H5xHk2Wb3U29XS4HI2Ft/btgBZRX2mAVYBKCrtCRd1nk18P/6wZOSgIxY
         F+G33Nk0/EgFPw+2odmO6Jk9NUdvhI602suKt3NdIS1Dcbh9ipSeQ7T4LYElA0emhMbU
         aHkCvF3Dng2opYh+Fm4wGCXylgkPEDDpdoTxYk/09TMb0+26dVDMwAyvm9s0af1quhjo
         dVdPEbygxlwpDWE9iqdojyRj6n8wnXEaxJIKvckE9Qk1A3BkZWaT7zH/pPPaSt8C9Jvx
         tE+yWG/fHtuyLbMcsajX+1Vm1fs+g9CvMFyI5TbQki1XsmduX0tjXzWJtB3NWU09hK/k
         e/zg==
X-Forwarded-Encrypted: i=1; AJvYcCUPdtIs5Jv4/9Nshw3I8rUYipwnfNCQLQgGgMuEe7GSWjiYuJMW/VGyfv+HDy4tlA6fCsf/3Q3jW6CWFldX@vger.kernel.org, AJvYcCVWtpWjOIaj0RTGibtalUJPk+7ISMFQIHSBfLP+siznJmTdGjdLW28FDCCAiRh2kItmPdApq0Vuteu4@vger.kernel.org, AJvYcCXfcFeNf2wE7Uy65upSaknVQ1KskMvBYL6XNHT7dPAAGgLuQi0A7vDg9Nw1bjnPjIvYakh7y/ATjaOhAx2WQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9ctOLJz3ddwJbW0I+FXKloyaZGDrTfS1nypNa8ZV5y667qv+
	lc7tnLqy91HtmJHUL3tSPjiN3EkbQuG09Vevk89wzUcnPUlJN/cc
X-Gm-Gg: ASbGncvDX0rOaiLI294MTT/6v0M54E2351HPFWwKmF5nEFzVJDyMU9/jtBI17C7EvNF
	AEdLq4NCymjP799nVSiisyftUmFXn/fRJxkRL5khFSCpBmMQYhmLJN49Yr+e5pW5L+7sASjN2Cn
	MIv61aZcxuRN8Rlpq09AVujHT+ZMwXFj6fM3wDmlL/s8EMrRCUj2Uyt4t+eY5NNo55oNHsVrskD
	mhdYsn06Uc2+XFAWg6SOZMsPmWWwsT6S0uR1EV2m1z8VmQVEAWV6ezcxvL8EWP0pVMp22EOlZed
	vtopmqXDsTIi1YG30lp1CvWJmp26bp7FntOmr3qBmw==
X-Google-Smtp-Source: AGHT+IHcOBqjiEVfR0zTy4OMDsmxuaWI0odaMLRy1ZKtdCOvuR39+L0kvGf+nTVb3puyRgCGvWhYkg==
X-Received: by 2002:a05:6a00:458e:b0:725:ce39:4516 with SMTP id d2e1a72fcca58-7323c7516f8mr253668b3a.7.1739388314052;
        Wed, 12 Feb 2025 11:25:14 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7309709027bsm5115955b3a.44.2025.02.12.11.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:25:13 -0800 (PST)
Date: Wed, 12 Feb 2025 11:25:10 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, quic_wcheng@quicinc.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lgirdwood@gmail.com
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
Message-ID: <20250212112510.2c7140a5@jamesmacinnes-VirtualBox>
In-Reply-To: <3e8d6cb7-43e3-4375-94be-c6b28331da76@linaro.org>
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
	<20250212010744.2554574-3-james.a.macinnes@gmail.com>
	<fcf907a5-9fb7-4988-a30a-a555740ca817@linaro.org>
	<8ec05fd8-1623-457f-a3b5-1095acd62cf7@sirena.org.uk>
	<3e8d6cb7-43e3-4375-94be-c6b28331da76@linaro.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Feb 2025 16:09:01 +0000
Caleb Connolly <caleb.connolly@linaro.org> wrote:

> On 2/12/25 15:37, Mark Brown wrote:
> > On Wed, Feb 12, 2025 at 03:29:54PM +0000, Caleb Connolly wrote:
> >   
> >> I would suggest implementing a proper .is_enabled op to poll the
> >> status register for OTG_STATE_ENABLED and configuring  
> > 
> > No, that would be buggy.  Implement a get_status() operation if the
> > device can report status.  is_enabled() should report what the
> > driver asked for.  
> 
> Ahh yep, that's right. it should implement .get_status() (as per the 
> polling code in _regulator_do_enable()).
> 

I am happy to implement the proper get_status() operation, but the
other half of this, the type-c driver (that is functional on the 845),
is managing the status portion. With my testing so far, I see the
regulator resets the USB hub when I remove power and then supplies from
its own battery. Is this the expected operation? As of yet, I am not
seeing any failures and the original Android driver lacked the
knowledge of the output is status.

I can dive back into the original driver and the documentation to
verify. 

Any other thoughts?

Thank you,

