Return-Path: <linux-arm-msm+bounces-84503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E8DCA861F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 17:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD5D03026306
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 16:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E1533DED6;
	Fri,  5 Dec 2025 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STVK9w5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5E230BF52
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764952226; cv=none; b=SSxou2Z09R32uzLeU7wZyY/Ia0SS7zmt6STbDsg5dx7HQAjY+NBN+/ULZIh5CERtgW0eyTDlvTbnL/x2oYCTTgV1hX4ja9s6m5oPzz51UwmLktdA2YXwvG7rKXGeDqiLNrNGPiK+PPLgLzNcc/A3nA0fY1ZPgbdrpNeflavCLPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764952226; c=relaxed/simple;
	bh=AyEqQ22oQW2AxaUzXlKSXJWBg5IK4qyI3qo453YylAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbOwaPoFX8ZiMPlu9cGdiRMDpyLhbBTMPRXO7kLT2yMIV98JzgBVgcU+Gs7pEXBbi5kOzbFkM+b8jiTiCPb+MtIBUcOfDX9fBck5T4t/nteYYsRQWesRyEZObTLrRiI+/dDOkUZO6Odbv1u3rkMh1rKraE5NQVCh8ipKmKesNzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STVK9w5c; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7a02592efaso143247066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 08:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764952220; x=1765557020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyEqQ22oQW2AxaUzXlKSXJWBg5IK4qyI3qo453YylAc=;
        b=STVK9w5cLpyk0wvAtDA6mFq57i+C7ObStvMny7iv4jPHL6Kge9U+ymwMm4P1+faNVs
         Dey8a+G0a5miSlnbZeQHKYB6fZrKSRENd0iPKbxpeNvJiUjpAbCF1+zDSqwyDtDjH/bX
         aLajfs/FKihef98u1E3msIO9iz3Uxj1YWvVDQwOBFqAuPZUPDBdS5nImmaoeN8Y4brpr
         UhWDggb/wOHM0tmIwaJgMaaV7G00EUK23VveW43LIUL0G0U/yI3UP/JPcjRZqGeh0cu0
         xpoAhAy5LV63rzdCyEUb4k/HTg/f19o82gtxvf0wg1pasJZWV3G33o3P3Ol0wLJUZgxw
         zKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764952220; x=1765557020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyEqQ22oQW2AxaUzXlKSXJWBg5IK4qyI3qo453YylAc=;
        b=AWIM3ZsOdvVXa9U4P/UhPVWceh9dMJBczKR3ZQcrqR1fUkURQUxiC1CE0WhQDPZi13
         V8iNNxXC8oAjOEBDz952Ax/yBQKk8UQUe5CmQ5LKdLiumZ455C+VVHh//DcYz5siyXwi
         2mb7jIR1w90wvQASpDIgq9G9fZaWZXadEwGvVMguRrqcgjynyaOWuaCZT0t+YS9qkGTo
         s1gXCM06qok+Om6zNGfs9cx/nOGhkhBb1tjSZ6sZGXTMg/7g3JCsLprFo/0YG7kIDM91
         5nBMntp/uF0miQJqpF6rdWeGv2ZHc2zlDyLdK4efyZHfTgMUrtVgClS6oBkfyTd+WRVt
         5GcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT4Wzif2IZ5O3Ebn/d6pJCB2T1gb175JU9EYIpTNPsRUgDl/Y3umzCE2ntPhmsWc9jN6CBZIjt6B53txeS@vger.kernel.org
X-Gm-Message-State: AOJu0YzpE5LCRGMPdQbbeo/TFskFex/x6BwzhvOc2kvck8t4NROYLI7L
	Nxh+TI7dWe7yJwNE87aZL4sHQh2e6Xe+ZBHuJlq1nVvkqY+9hqBAXK+z
X-Gm-Gg: ASbGncvR2y8hgPyvmQdybxE2Khiw9hFIDuN/FlKy018ubyvf7E+KdLYRKdiu3YXPgdH
	tf5zkCS4ACAkVMgP9f516j1QhleFStj1OIriuhgvFmk79BrbZ1v/ZZ2QgGQIptwDTV8Ypn9hI6u
	b56s9g5MimpO6e2+xKwXtGW1vVC18Y8l3/6xTTzvk5JoMCC/ACopou85NVPu5KTEtT0R0tRje5t
	+BZwHmkHAWe/0uJEAaFApH3kxOBRB/YsYv3Q13voVPodJdNUL4rwPyc8kVY9n9b8eI/jgjq+fxc
	voo1m1FybAPrWDzRYNhSmwulCRBd1uIgA4yKe9y9xKuOAV/XbxN2pXq6jv47WtMi5aKO24ptkLD
	vEDQRrqPrqvXnWlvEP51UWM00RhGtPB/BxpAJPhgw1D1eZE5pw9Hh5wT7MsA4VseVzIB7XfKr/P
	MEdRNJE4iG0OeTVaKvfSU=
X-Google-Smtp-Source: AGHT+IEeDHPpfUgYJWf2ll0+1AfsrzSpWoZY5OWeKfS4OoSjSHurxojt3+dBMiMCGkDmWisqS+lV+g==
X-Received: by 2002:a17:907:9625:b0:b76:d882:5aaa with SMTP id a640c23a62f3a-b79ec3f0908mr670737566b.3.1764952219257;
        Fri, 05 Dec 2025 08:30:19 -0800 (PST)
Received: from crusty-box ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f449c375sm419408266b.24.2025.12.05.08.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 08:30:18 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	xerikasxx@gmail.com,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
Date: Fri,  5 Dec 2025 18:30:14 +0200
Message-ID: <20251205163014.51395-1-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <509d5d7d-b7a3-4dc9-b3e6-c3e52abe040c@oss.qualcomm.com>
References: <509d5d7d-b7a3-4dc9-b3e6-c3e52abe040c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I assumed only data for 25C is necessary.
I'll add the rest of the tables.

Erikas

