Return-Path: <linux-arm-msm+bounces-75074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF32DB9EE7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FA883A9477
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C7D2F90D6;
	Thu, 25 Sep 2025 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r15s5vts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE5D2F7AC0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758799763; cv=none; b=n2/xVgEs/rzd7e42+6t7eqzSk7sOvc7HXMYZ52PTylAoSJoBo0VMKidS6tUaXBAxkBdBgNw8qxPlD4uF3zwcwBvtNoDf8HRR8Ep40rSsvT21a4gEYGDWBUtmQ+m0I9CaJ4LE5yeOtMPKx8/OjAzsRC9/wS0cSukgQCkK+6WQALc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758799763; c=relaxed/simple;
	bh=spYHYnkrSSHwtTKTP6qwxijxAXFvaPMhOoJbbi3y1G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I43r5PJnLZ9lnx180wj6tXvZM7P8x2fmja986coM/YXlB1UQXpcs2nNHpemX9PIx3n7ii7Y1Yw6MukqF5jGNifFJ5zf0s2xJOR5snyHB2JOpbqJ2B5HpFcI4L/WLhaBboMpa7uBR20q/t8FJmRCx4YUYEjbCBvUd3k/fGnDEAl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r15s5vts; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b2b4096539fso155954766b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758799759; x=1759404559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6tx3wGYofCquH8IJZF9cxaNXEG6TMvxnaVWQMdTML0=;
        b=r15s5vtscaa03tiCNBbv4gRWbMb66XAVJ+ZiMrTqPDeBwkmn4L576yLh/tFosJLJL4
         8civHZtp5Q5gmeQKDTeJuS58mVFae8bhR5EsrHQYtewoej1lGm2HB/m6Z10HW6DMzWCS
         TJyBU5V9o4L7uV4/tWcUzxLjZi06H0JwswHHCu8OdGGB08CR44AUqi8sLje5D8KuqcZt
         /LemIprCECiVzF0cLsHbD1KH6UhablHdjNYK/FeVeKxfd/CWJthx0qxJ9rksrqd+0CAO
         GCpMASmZZE2SMKaC8RuYPb5AZcp6ssFepOOVnNkVkdMavKVzkZBo/1SYaDQVx77iSrad
         7o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758799759; x=1759404559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6tx3wGYofCquH8IJZF9cxaNXEG6TMvxnaVWQMdTML0=;
        b=nCtJIxDob/EDpQaGRH7QCmv28qCEJxSqxBpWEBws6n7WksioSggbgQB4rPHzjqxP/O
         uDkhgWFdMV6kulXmzI7jGIetiWPf+0UC2dQMizaREzUJGtkxOcwm8U9/WXZsM/nSAkva
         39jqein37ptZI79yfoRraVVS46TAE3tXUqtbIBFDdHhcdEJyfsZTglC7H7DRYEuhVAMF
         sOCPfqdZi0PV5GNCaBhLn6qQVODPdVRjLFTC7rKR2fgJIBycJ0GUMCNKwa/baOCOEpTD
         6KR/wjUVPtk9VeeT/RhIH22WZXwQEdmiDvDfY/LfLXAupC+vfJip2eCaIn0yzXAyQxdp
         Uy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4crnvSfcFPxiimfA2aDQTY53NwyTTLi96PBWnEX2lM8mBWuy0asJ+n6OH+ATH+7aanobnwHJZHE6ozQwm@vger.kernel.org
X-Gm-Message-State: AOJu0YwTteG4RfzvVjhrnm4NoOMCxw4dGXOr2J8pmy27cEhin2yOyayd
	qFtBE93nSrREBmFIZBQv+ARGINY2aPX9rMY14dU0qjd5EJAnHnTpF6p92v/L9SDx6JM=
X-Gm-Gg: ASbGncsNKCT54fu9DpiNqHne2lwZlBjQXDQmCjnW07bfE5Eba6mI0FwwUoH5WA8gqjQ
	Di4C99VguhxzYkffl8+yCjP46/M95jlRnn7uBhARFFQ+S3EoP/yAyHSsqxsEGoAN/dQzRg6eXJn
	0ouaaKrODYS0JY9zA5LLVnCj3rCiKobIcJ0q8ZU1FzL9ixRCP8NaFMq90dvFBEk2OEYCBMMGjig
	F5te7aCzjvXay0pBeMns0+vXxqT3R5n0AlfewSpzJBEfyAczTF0/7LykRn7U6l3KNuG6CILbFfC
	u0GWW5FQjnOwDt2r+lI2Whr57/844LtjihMPSRO6jgZuWlg1uqRaAe0kmth6DZsCP5PsA+Nk0no
	arq4WWvOBPQ7VBNjap46/5A==
X-Google-Smtp-Source: AGHT+IECd6eD0NG/1EjdBoivaaCFD3fdU9kTeEF04JLjXlrzueCjrWn5Mmy5qgRiQjAwXUsp8liKjA==
X-Received: by 2002:a17:907:f1ea:b0:b04:6f77:9cff with SMTP id a640c23a62f3a-b354c83d684mr239529766b.27.1758799759330;
        Thu, 25 Sep 2025 04:29:19 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d1643sm147578866b.22.2025.09.25.04.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 04:29:18 -0700 (PDT)
Date: Thu, 25 Sep 2025 14:29:17 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: glymur: Add USB support
Message-ID: <keashhd5gvckff75a4ot2km3saivdetaaxmag5fnp7dnoiisxl@u7tmkokpfdmu>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-23-8e1533a58d2d@oss.qualcomm.com>
 <dzjj344c6zlkg4rvi455xoedhd4d2kjvodi6yftv7svhvvmxbz@kwq7rkq45tms>
 <66a5084e-3f7a-452d-ad5b-5867528f57a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66a5084e-3f7a-452d-ad5b-5867528f57a5@oss.qualcomm.com>

On 25-09-25 12:59:20, Konrad Dybcio wrote:
> On 9/25/25 12:54 PM, Abel Vesa wrote:
> > On 25-09-25 11:58:29, Pankaj Patil wrote:
> >> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> >>
> >> The Glymur USB system contains 3 USB type C ports, and 1 USB multiport
> >> controller.  This encompasses 5 SS USB QMP PHYs (3 combo and 2 uni) and 5
> >> M31 eUSB2 PHYs.  The controllers are SNPS DWC3 based, and will use the
> >> flattened DWC3 QCOM design.
> >>
> >> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> >> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +
> >> +		usb_1_ss0: usb@a600000 {
> > 
> > This is usb_1_ss0, but then you have usb1_ss1 ? 
> 
> I'm in favor of just calling it USB0/1/2/MP/HS because that's what it is..
> 
> [...]
> 
> >> +			dr_mode = "peripheral";
> >> +
> >> +			status = "disabled";
> > 
> > So you have the glue defined above, but not the actual controller (compatible snps,dwc3) ?
> > 
> > I don't see how this would work.
> > 
> > Same for all other controllers.
> 
> good morning!
> 
> 6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")

Hmm, missed that one.

Fair enough. Scratch that last comment then.

