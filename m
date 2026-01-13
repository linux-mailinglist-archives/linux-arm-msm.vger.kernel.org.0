Return-Path: <linux-arm-msm+bounces-88790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0C3D195AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC7173019078
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BDF392C4A;
	Tue, 13 Jan 2026 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkK2yDQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037CF39340E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313647; cv=none; b=SvhQfLweeJyvWMBz+OcdXmRm6YrY07JPs+17ukuRuualAquyDTeIxZv6ac+Zg5XA4HCIi4evwjScNsSz+C4rhrXkcGucypywkMkOt9ytEdyXEAGn+JNKw3BpXL4iQ41dmGbFH80x4QhXEVvfHbkl4yOkSxuv7SZ6EG+oNqOGTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313647; c=relaxed/simple;
	bh=Yh/skuOQuC/zZ/fQfc54UBUifN3ebScHgpu0xUQPYSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSEFOHL9RfGZU7f+80sYEJit5kXdYVU07+ybYPGP+CZxQYVHHYHBwqvyWGvO+3U22BsPdxJ2/gHD62xH+QnsrWyRBibdKc3LzX+A/u1CoBAVPHrgQNse6KtRposnlov1QV7JXA5uGVb2Qx8tyXU11hX4ZrhsES41QUDCJlzVKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkK2yDQ0; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c026e074373so3565774a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768313643; x=1768918443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh/skuOQuC/zZ/fQfc54UBUifN3ebScHgpu0xUQPYSk=;
        b=FkK2yDQ0gdrvpsMBaScW+qvQ/ok3On1tPM9wAIf9HZvAfV+wz8Cg0/AeF0+qhQ3zDj
         J8pLhylFsLI76gMWMb/tTQ2Gp4WGPQ/Rhvie5wfnhWQ0GF+XgEFs6O80iSSOpyGdEmbh
         ECrhFW/bDJrpJzYCDk7Vhde2GE6Dl7qxnIndtsGfGfgR/7ryxFIJSMSAmqyt5FEEAjDD
         Xbkesv9BQ1mPoHIc4OGx5GyoIrxxWc1cWXJPcCwlw3bYE4mq/XRMBVLITr5e+DW4mlhz
         RZxeNxUmaA+bgbGVXI4gTWAApRStrrLRoTJi+GIAt36sC+yWxiJD7ie7FMg8Ffj1/Rry
         NRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313643; x=1768918443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yh/skuOQuC/zZ/fQfc54UBUifN3ebScHgpu0xUQPYSk=;
        b=CtazxTwKqZtEoEUzmPV3iZxa1sSfTZ8T6qTVlNVs0TMkAPexomd0YfqBpddKaVRLwW
         Z1Ve2FtHDjomVQVxD+KfR1JZ4aaLtATTLP2U6+R9UKxy34NfTIZgnqvc3s65KZkHdJSI
         IgZK4RZy5tOP6bvRozH4Nn49USlDsIaprcqG/tltnQ65ab0MIp/B7dUVIvmxRptWThJZ
         LO2npF4dgNbws9DCa/Tokg6lTlb9/Nvq6g3yUPXbiP4ue94tMHA0S6pahQj/icTHqmAZ
         9xz+uxY+vnLS/eHXn29b1zjXAwHEqlEtUyMIcrsnpCCJ+P/0HM1NCMapsu65m54WenYh
         R71Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXiVSSeNLBq37mGYXkB9K0ZUMa2FQDHkePSC9T3xCo8YI70fs3fPfpGeAVkq/8ErjajJvSAh5m5s9H+UAa@vger.kernel.org
X-Gm-Message-State: AOJu0YyDhOz0k5z1dcXsIEpRwxZKEXYbksjHaGESGo7JrWBP2XLOw73b
	wEGCLbLCiLJZKgxIOyrYp0HqxIpJGslmKsPyACisbnJbhvcGfGcJy3zv
X-Gm-Gg: AY/fxX5c5eCVhgpn9FsAlUItzPLotCVvIp6NAsbF1R3dmbkezf9fkDId73MoOadrKlK
	rV1LV2HofAXORBz4saDhO1NG0djafYZ+O4ijWv9eFSxZ4OT2aHs53v9aQ6ZZ/7D7Krmkz61vAsZ
	hCUv+H64pQYFk6YybUhkOV4nSRgzhWGPp50e3JwyMvYsXII01Z8ZymniXImeNlEZd8V5cqxk9ro
	6VB/CWKRzXxhIzRnV0u5QyjCCEJ02ka0uBx7dAnjuzJKA2ujXpFL+mwqSSQJx0u21dKrkgHupim
	tKhl11QIg9EsZWvybJgXb6yAXWDyylQR83rAHy7d1HjDkhhorYnJdGycWJoraYN8hgudAEJVRCa
	nrOM6YSFd4e5W1kuIJkL0/u69GOn/pE0djnb9eUmXsT3mdUOdAmcGheQf6txNg2dZvREhCtVrjC
	N0WPqZhEjH8g==
X-Google-Smtp-Source: AGHT+IG7buq9CzX9ZRTrAw60UgkpwZAGNd7i/rZuf8pczHAcg2auSyZzQR/xxashE4pdHuR2UKZuqQ==
X-Received: by 2002:a17:902:da8d:b0:2a2:f2a5:4136 with SMTP id d9443c01a7336-2a3ee45b2f6mr207785705ad.22.1768313642789;
        Tue, 13 Jan 2026 06:14:02 -0800 (PST)
Received: from ArchLinux ([45.113.100.103])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a3e3cd495dsm205884225ad.96.2026.01.13.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:14:02 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	barnabas.czeman@mainlining.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabriel Gonzales <semfault@disroot.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
Date: Tue, 13 Jan 2026 14:13:36 +0000
Message-ID: <20260113141342.11057-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <e4f9cdc4-1b3a-44b0-83f1-315c934985ba@oss.qualcomm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Jan 2026 10:45:02 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> I was referring to the NFC eSE (embedded Secure Element) which usually
> has a separate connection to the SoC

Yes, gpio 0-4 are connected to NFC eSE and gpio 30-34 are for
fingerprint scanner. Here is the list of reserved gpio and their
functions according to the device's schematic.

0 - ESE_SPI_MISO
1 - ESE_SPI_MOSI
2 - ESE_SPI_SCLK
3 - ESE_SPI_CS_N

30 - FP_SPI_MISO
31 - FP_SPI_MOSI
32 - FP_SPI_SCLK
33 - FP_SPI_CS_N

Though Redmi Note 8 does not have NFC, kernel crashes if 0-4 gpios
are not reserved.

Tested-by: Biswapriyo Nath <nathbappai@gmail.com>

Thanks.

