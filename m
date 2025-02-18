Return-Path: <linux-arm-msm+bounces-48329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C82A39654
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 10:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFB1B3B1E09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C2622D782;
	Tue, 18 Feb 2025 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcKf2uAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013301E25F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739868731; cv=none; b=gyXWJ+scm5HhS4/ACk1CYu2MT8NwTe6DraszTe9+7HBsKaIQWC14AusS+IbXca3lJhf9sPIXeIC5WRxYcwACjzO6k2ago7p0NYY4MFpBqq20leudYRPShgG8db6+/1ufHnympa4Fgb45g2mLx55iG6YtPvHCHcVDSnxEAItixjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739868731; c=relaxed/simple;
	bh=hohWpCiWYl0GtjqjZvwmp0qm84o88J+U82iLURk3iYI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nqKW75yMOYNDTzL+PD7tL9AY6KSkHZsYbdG5zi1lT1LCC0DOHW6pAwClhGPwh+UM+g8mpal9qtIweu3iHV8r/FuREmJUQH4/1XcAgfNxKeo5u7tv3s3IJkc8Il82bfRASmzTry908YnGCH2cQBhjwQhB/N8OyWf6acyUrRpT348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcKf2uAz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43964e79314so47428875e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 00:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739868728; x=1740473528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5BxUQzEBXqVbjM46JfdgSswKF0/4bTgi+k8v6ADAZU=;
        b=IcKf2uAzJdixDAPIRJX20sttXX4Zh50YvEtuaXY/RyypRMLu8k++/tNOZpNzSpCJgg
         XFSfIO0RJaQy0y4Odxa1Ds2VFsanooUgDFqERNeC9VbosDQvZGa42i9dY89QdO0RUU+X
         zswOLsO9VPk2zZ6ELQHO6s497EJiTLuGgKq/9TgLKyHdLkNj4OZ/hbp2/9sNIlaWNMkf
         PlqJ1QH0pA+8QAZQrNseJxV+KZLYNawLehV9967xJqM4wTKJfutc1egHwFG95SyGClyl
         liq91RmRAO50rC4ChEcZ6U4FlrW82QQZivaHN8JNdCQFm1GKU7gvUCRnH2P9q36kl6Gi
         Q+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868728; x=1740473528;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5BxUQzEBXqVbjM46JfdgSswKF0/4bTgi+k8v6ADAZU=;
        b=IDWuxHM94YwCi72SATT3d+8mfqrXl11gGwkb2gJBzunVLH276KfeEmgz43OM5NpWj/
         um6uTT78tIgtNY5ykC+jvDEjC9DE3Wfw9vwOoy/AUlOs+lzi0SWwmf58AU2iHdtlCLZe
         CKpYkJB6lxGX578XeVTspiSi++45SSUxhcI3M5cGW8yEKU2u+8fW474/ezbsliyWI0IQ
         1g4V3bEwbfBDP3gEj3iok6CjiASIiYUcXiKreOXSHbArY1Mm12wSCXmwJi7wcUWY7Msl
         J2e4ooo6SX4c4op/4bjUwoZhVHMP/gn8pmBfhzPuLvXsk/Tzuf9kCLEyDzzSUvAUcXc/
         pwIw==
X-Forwarded-Encrypted: i=1; AJvYcCVAzp2WWrBxE8SWqsXzywtr1qQdbFlt4MRT3YRRGSji/Z5M2kv73zXEfCQ6mVo5hXiTVpkuHOwjVlADsfde@vger.kernel.org
X-Gm-Message-State: AOJu0YxZb8MQN+ojTD+ohVmefZwNgc3utH3pMzq1rp5Mvfp/Lx9rA3PU
	/5A64B3uToTANAvhgFOgqBY3eqM4ooeuGKqPD7qc8xOgiQKeZTsqAIGI0lt1L1s=
X-Gm-Gg: ASbGnctmfqJUV4YHoCv99KDm5UHqKg7ldfGj/ihQsasrmxJt8MfOZzXdIqtvdm6qHMt
	D9Zl3EDSx2sRDrO1s2Y/gD5e57o31dZofpvVoOOiSxhHDM2k5gSZ49mMccRhWtGVhZeWmDSKNMH
	XNla90oYiyZFCuFgRWgjpCyVje3U58FOwb5tCy1favvvkPx9wrRVU9CBtbLDpjIaADiSQSbSjge
	uOnkXT9As77ecLlIYrRb86ECP1lNgS0p9jR5fUt/oFQANdt5RDaQe63dOBIwbh9lxnN6QxSdkfK
	sRbN160Sv6yiAU0QFQjinVnrgim3vxm5bQ==
X-Google-Smtp-Source: AGHT+IHQey7aBKjO/+bZ8evsTyt3LBHAHH8MDbvNvER7wVei0OIq3d9tcLNdJqfWdMZRdCMypqcS3Q==
X-Received: by 2002:a05:600c:3b1b:b0:439:9595:c8e7 with SMTP id 5b1f17b1804b1-4399595cbb1mr12314565e9.0.1739868728258;
        Tue, 18 Feb 2025 00:52:08 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439872b5a46sm43381535e9.32.2025.02.18.00.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:52:07 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250217-sar2130p-nvmem-v5-0-2f01049d1eea@linaro.org>
References: <20250217-sar2130p-nvmem-v5-0-2f01049d1eea@linaro.org>
Subject: Re: [PATCH v5 0/5] nvmem: qfprom: add Qualcomm SAR2130P support
Message-Id: <173986872682.63312.17862303711697418550.b4-ty@linaro.org>
Date: Tue, 18 Feb 2025 08:52:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 17 Feb 2025 18:33:17 +0200, Dmitry Baryshkov wrote:
> Qualcomm SAR2130P is one of the platforms which require 4-byte reads
> when accessing the QFPROM data. Fix several omission in the NVMEM core,
> rework the QFPROM driver to use readl() instead of readb() and finally
> add compatible string for the QFPROM as present on the Qualcomm
> SAR2130P.
> 
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: nvmem: fixed-cell: increase bits start value to 31
      commit: f5175dd69428ab517c8d68e772c4d287b6570d8e
[2/5] nvmem: core: fix bit offsets of more than one byte
      commit: d5d9e982a0886a1a99a1a8ef5320c57e257b4fb0
[3/5] nvmem: core: verify cell's raw_len
      commit: 11ccaa3121119eeff9ab9d537e0cf6be3b10698b
[4/5] nvmem: core: update raw_len if the bit reading is required
      commit: eca73df072715efb5e880514bb8395e0a4e74a59
[5/5] nvmem: qfprom: switch to 4-byte aligned reads
      commit: 4770132f37dbf327d25455d226e54fafbef6a5c4

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


