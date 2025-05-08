Return-Path: <linux-arm-msm+bounces-57261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74856AAFC8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BBE53AF8EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9ACA253F21;
	Thu,  8 May 2025 14:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kD/TP8Dc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A52441AF;
	Thu,  8 May 2025 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713472; cv=none; b=EJx04hp/F2pn7vgn4CUu1SiScw4MTrmvQrDAQkgYQZDRTumsd4vv6OlQcNg0Nq7fQUCLUf5Lb0IXuYhjOGJ7NJYcneDE7K+GGbo7QquYXt8xLCEW0Fkj8aVHRZz8vgSKiQ2C214K+m0jE0DjqQAXiI1pXs3bfn2F212P5HCCrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713472; c=relaxed/simple;
	bh=P97pxFBa0PGapt+u/u+jF+7T4Zbl6K/7q6zpAEC+eZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TI0epEkuV6yjaEF5izMbSv4jFczQq7XYnxNRnc8YOsKvFhBZPj5CmQKqgjlF2yA+K3z3sVBNBzSLHWPhzzbjmSz/DoBXV5yafPh3+WY7/6+191bMRTVJgHBD0Z4b6bmLlchF3lybtmzVNijd7F11yvyNraOxxi7ENkX/bSa+KGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kD/TP8Dc; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac25d2b2354so171705866b.1;
        Thu, 08 May 2025 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713468; x=1747318268; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ua4V92NoIFfsZQXFItvUEVFE3bhvGaNwUwjEPfQYZs=;
        b=kD/TP8DcY9iayv8D1bVA5HaIdDqo8qNQRFCFTp9vP9gVRoY1qzTgPck9pq/fsP72NZ
         hpjTLPD/cYKpPcq11ES6fFLaFztxa/bhLrsuXSsRjA+yK0+SKDOuvXYzh1SSsFwONT6F
         xA5yTeAk8J9TweWeOGB5dhb1LbaZ4T1czmv1E4tkinjLpI3xMDTHkpbBDSYMI4Zd6n8g
         IAyvj4lb2igqJWmHT5wtjISJdykol/PxrtPYalst2YofCuchHI3aJuvWnonAoCVXqSYq
         Zale9z1Ncz3b+epXoTD8WtvR2SzqZ/Ar6qFplpLVwzdkJUQgLLjhv8G0tKJkQxYVxVCE
         suUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713468; x=1747318268;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ua4V92NoIFfsZQXFItvUEVFE3bhvGaNwUwjEPfQYZs=;
        b=qGmwgW8hPXwoDNSiZaY2d+s1tkn4kGfiS+Cc2xWsNM8WrzbsYLNp6+o7SOa7aS08xc
         cow7ftRIxNVJOrOy8J5OPnpUuWXZjikVZKoZegoyOzLZTFZiTCugU38d1HneK8GtXmc2
         4145BQ3X2nFr1tuO+cXm/tfZJ/WNxwbiXUV/OvAYdW4tcAY66zF2xxNh79tpWCEX8x53
         aioG5UrizUhFFrH89aUeJ3c4L/xRoQBbIQln25lwvuu6mVtef34w3ao+S9Fgjs/Yakcw
         hxl5IXemccbHJBRq7R2Svv31oWNDtlzUe9a7xnYz5ikuoDzTAPcYtpTRGKoZWOoqncv4
         +gBw==
X-Forwarded-Encrypted: i=1; AJvYcCUfUponH/dtDlAMkn6SDQvqqjwJEN2vi/Kj1p3LvsGzs/mAFk73Xs371ZygAmLsOZboX0M9Vt9iArNowMY=@vger.kernel.org, AJvYcCW5Hk4YCep4s14SEzkHCLct+kh3M43MO8AVHl40zlNnb2KB2KmifvBQSx5vP7zoABmXrN3RWW56ojs9@vger.kernel.org, AJvYcCXGi1teV/g4dHW6Ks/Jy6M4MjNlNTa6ZJi3JGRO0NsB62YyIwIuCn7pjj2EtRe6fGruFh2d9MtUXF8e3A17@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOY525dbLXTzFanWQx+TF7r1OEvp6vyXzhman8Whp9PzeRokm
	me92bbEGMvbdhQVzWf9Xjn2lyFOSxxaM2S+YFkkC+dnFRj74Mm2/1B0hjQ==
X-Gm-Gg: ASbGncti5gEgeexz3srAz3sRcWwLBWxHCDt1Moebb7nBJ1V/ihRPCFff4yq6cCgAZsZ
	2ZXSRIZ33fwC86RNRynieDJRJ4/froaIFgf8TK4zQsZ4DMnzXINNctXZoJqJYPWjjJZWEj4uGIb
	wxK3eZn7hqHpFJuU68LkU57iW1Jng7JEwZHvj28zW1St0QYYMFR/P/ai2DXe4kcg6gQm5C4oIQs
	dCH34N2gWOJEKTXjo0vn9MFG+lXxM+okrlRv3Kcabp6zdOp9h1Bx05BVRTr6HiqrI65S+T7rc4P
	hgYFUq8/4Lue+hwAkmifORWZqbRXNaos+YNqY1z/N//LVBz/WnPw1AiIw9bPm+kwLobo0tvZqmZ
	FJ+wW
X-Google-Smtp-Source: AGHT+IE74nCsMrjWx1sNhOE7r+vEsthDSCktjhOI0HzucndfvBuhDWWhOESu2QR7Rl7L+nmpxU8msQ==
X-Received: by 2002:a17:906:9c94:b0:aca:e2d6:508c with SMTP id a640c23a62f3a-ad1fe9e3cecmr334933366b.56.1746713468106;
        Thu, 08 May 2025 07:11:08 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914d031sm1090262966b.20.2025.05.08.07.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:07 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:05 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Moto G (2013) DTS updates
Message-ID: <cover.1746711762.git.stano.jakubek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series improves the accuracy of motorola-falcon's DTS.

As a side note, I wanted to ask how to describe the Hall effect sensor's
vdd-supply. The sensor's currently described as part of the gpio-keys node.
According to the schematic it's powered by pm8226_lvs1, but I don't see a way
to describe this as part of the gpio-keys node (maybe it's always-on because
of this? Downstream describes it as gpio-keys too). Any tips?

Stanislav Jakubek (4):
  ARM: dts: qcom: msm8226-motorola-falcon: add clocks, power-domain to
    simpleFB
  ARM: dts: qcom: msm8226-motorola-falcon: add I2C clock frequencies
  ARM: dts: qcom: msm8226-motorola-falcon: limit TPS65132 to 5.4V
  ARM: dts: qcom: msm8226-motorola-falcon: specify vddio_disp output
    voltage

 .../boot/dts/qcom/msm8226-motorola-falcon.dts | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.43.0


