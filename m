Return-Path: <linux-arm-msm+bounces-47985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C987DA35728
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 07:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ADB33AD5FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 06:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5583B201032;
	Fri, 14 Feb 2025 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDgazr/x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9E1FFC72;
	Fri, 14 Feb 2025 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739514835; cv=none; b=HPfwDFxeCnKJgW0rILfMNkxT3mjjcnP6gk1VoOg3/aow3sEJB42kERDQTvjYNiTdXdzeLQGH+vK2afu/qXm6nKXhHadqq44MPhI8re474NR8gt4zbJ3S67iVDmKbS4LVumvrDu5JRasC7o32z8ZAvQWKYihb8DSj7IcTIBOjLZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739514835; c=relaxed/simple;
	bh=3YylV6a5qke/A59cwLco3GMGBxueUouJ9ac0mNKgY7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CohSr68cZd3KIRFhHeHILrJ9jXF4rC6W3yxZbujK7gjh7kd0+xMPVJi7MkmmIbN32v9DB4D6/mSdgMAoyjGRX8/9wE8uJ+M7D1w5fwQZtAkL3guvsb/2Eo8Kl/wr5/Jeda0wgIZGE/nUHww2yVsUdskqK7dj1PWcnZrP7/B9Kds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDgazr/x; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0848d475cso34069685a.2;
        Thu, 13 Feb 2025 22:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739514832; x=1740119632; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3YylV6a5qke/A59cwLco3GMGBxueUouJ9ac0mNKgY7k=;
        b=dDgazr/xH3SB6czOXpyVffW3oURGABWAU4ls+D29ISnweizCJx1/CoAi6x3sylxckq
         yTobocN3wcf+rTQ61UQViKPOMyuuoe+SXNfRbwQP/SuKNxMJcNjaitgC/qvezTRxxJqK
         Vs0QM11qlbcFQ+3aBNHU4G/pB9EH2OW6pUSVbTZoTNQfONCIHkMICXC/gQkX9zzBO+IM
         lxyu8SCBff0hwAiL6OpX5Oho3Pz+3uTx3BwgJ4YFUSD8h6iSWL+CoTSROBffCSp/AdaQ
         Ae589gdlN+l2ZnIqgkNnTetwAqnWZmflMo2Sg0JVoU40qd10AqNQApE8AJjk86YeOGV2
         2n0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739514832; x=1740119632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YylV6a5qke/A59cwLco3GMGBxueUouJ9ac0mNKgY7k=;
        b=J/tPSf2SqpQn+RlGkv2VnS8hc/Jx7GZMbp8nsrpXLn2zfDFAG8kmVB/GWTCf6VxpQf
         6WTHolNeEAMhgSRaB0XSBywvbfeTTOIOopkvQo0/XavjyB+ocVr+FSziZQ4sHztZngoN
         CBzOT2HWjtsqPNFAJRBvaOigU/a2sHL9nbJSWFdir/UTTfrCHevPnFyXQnFG2VYfztdJ
         Cd2DGxrrLwhXs8CgY6SBJgnlcRG8YwtFB3xgody0nuj1NMu50Eu/YmKpq1zTbF2Kg1in
         YFTjcYzLKGw7Swp1miuaZsgrnDZi+RUdWiVjURNZHLtDJswCS3H4QjqwPg5Z2SfcriHy
         K8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/iTkYHzG2Tee3WMOhSBn89jzalKnzY2DlYTtkpl3yUQFDqaf6WtjPHc084Mezufv+eJWLMFiKmbmWlK/81w==@vger.kernel.org, AJvYcCUg8tL4zsRUA7OSkggQj1zjGKiC+0KCjFNXknxr4Hgi8iSGqg0GFPYjr9KOFYRU6qGC3ej8J0iM15TOYXZB@vger.kernel.org, AJvYcCXPmChGiUIVWNXdSHnsXQH3AkVmdW+gcd098vgEKmrZKpyG56enTBGKTMIOWaWOU6coXta2mhXlNtL+@vger.kernel.org
X-Gm-Message-State: AOJu0YyB4Q8jSkwUXPj4e0ee0Mxcgl3BZ+hfP2STQwl5DmjYSQkCT3fj
	WqCyj60zuo4a9leNSxjs2CUhk6PFeBSVhadOIwi1rlbV7wS0i2F49ync2N9XxHnevGVQVuFokfE
	lWlLFaQMzBUHwiNskbTMm/z/YSVs=
X-Gm-Gg: ASbGncvuO4889HOaTSRBfXS3LEhzrIfzRRUU+bMjIm5uERZTFXaDxlqxNvIA8ymPjD+
	9GczTj1WgDAqRbSy0hpFtw7uoJ5uCI7zd5KKR4+Q55bBgb9SoneII4BP7vAL3dLlPx3ShkWBckX
	pTTAu6Cr4c0ghjTt24DM0wXx9YsSuK0A==
X-Google-Smtp-Source: AGHT+IGyVXZtFFDe8q4nyybwQyqyryUw5IPXa64vnFzvytCZMtXTGbRuiT7JwooJr/+vv7fe33kyUdisx2JLKGcnroc=
X-Received: by 2002:a05:620a:4154:b0:7c0:6c5b:d6f8 with SMTP id
 af79cd13be357-7c07a14ecd7mr863405585a.30.1739514832447; Thu, 13 Feb 2025
 22:33:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com>
 <e0ef29dd-afe4-4ad7-95db-d21326744c92@oss.qualcomm.com> <CABhZbsXo69FL-xUfg3a20RybO_uRmsOKyMJ2w3qnpk+8pYyUqw@mail.gmail.com>
 <e2b31450-c428-43c3-b25c-3ec130171011@oss.qualcomm.com> <CABhZbsVUY5n3bL-vbzO-xdDH6amC7FYmZHuRTh3Cb3OiQSa-3Q@mail.gmail.com>
 <v5eipkz7daurxueft66f5kxzm7fnjamtzivzoldztxjy2f7vbv@2ju4jvcrpefc>
In-Reply-To: <v5eipkz7daurxueft66f5kxzm7fnjamtzivzoldztxjy2f7vbv@2ju4jvcrpefc>
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Thu, 13 Feb 2025 22:33:15 -0800
X-Gm-Features: AWEUYZmtpnj-SIsHTZyHh0UJeT3TrUN--0DgW9XOgFOXYfPWLU8iJ946RgxJ85o
Message-ID: <CABhZbsUo309c5OePr25tD+W_vp3HcAXMt2fc=yjij9wHx0wQnw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: Add BAM
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sam Day <me@samcday.com>
Content-Type: text/plain; charset="UTF-8"

> Konrad asked you to increase the size of the BAM devices. You've
> increased it for both BAM and SDCC controllers. Please revert the size
> of the arm,pl18x devices (sdcc1, sdcc3) to 0x2000.

Oh, I see now, thanks! Seems like I took Konrad's words literally. Sent in v3 :)

>
> >
> > >
> > > Konrad
>
> --
> With best wishes
> Dmitry

