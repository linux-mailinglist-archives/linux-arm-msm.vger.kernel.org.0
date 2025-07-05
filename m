Return-Path: <linux-arm-msm+bounces-63810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AFEAF9FDB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 13:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9241B3AE060
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 11:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69ECC19259F;
	Sat,  5 Jul 2025 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWLLHDfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024CE2E36F8
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751715723; cv=none; b=odvn4WL7E6OCc2Fg9D15Mux300mwg+GERxtU3V/UjYohwzWnO9CoikJovWbL8/Ys7eCA/0Ju6yCB2hh73hBClIJro5ySlSx00c9HTqo51vlWvAEU4sySvVgZeuPHG2qTyy4SZwmT/1cus6s/vT2s1qam9FhS7qUZHIxMKnXMpsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751715723; c=relaxed/simple;
	bh=ff0/oJ9UUUSlrxlEJamXr3dbSQP9gWJvg4OpXlkzpqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OsEF86W9ISdQh/uwj6NEWCVP/YzH5L0I55ij8UbPwUI4xgarBPzIFlJYhQQZkfqYSSm+nMaYVylWeyx/FHgXbSvepnbejgSa4Cd9twNZzFxNA+sY6nNqIfgBdNLUiDLfiEEeP0u/P+ayJCmj6/EWTaDWANanKUkHrSoPVG7J70g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWLLHDfP; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso1746081a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751715721; x=1752320521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAHTjxoRg/FIv4SevXrkhfjFjbI/gmWYaIWd5Qxa8aQ=;
        b=kWLLHDfP4+YM/dTdSRLfuQV0LsCxYFaG20hXVPxNgXqK9yFxm1S6Me8/Hu1MboFC/h
         mlXK+MPV40okF6qGlBW+B5svt6hHf+pvvL9ueIrc9YYLvLF9xVafROjNAdFqWdZ+Z3bw
         f3Si3Fznwy3Vy7+lwjLSo8GwQrtmzUR3ZxfqA/ALer4zD7D35PvbNGSCHV4bnn54Xd4E
         o87otywyY9FMQ4gUd9LxGGpPnIpubg3uTE/OyH+rzd+nnxbMaUOvsjyCdsOuo1LmkvZO
         hKyuVCGo+XnqSc5zqC2pTBSC66rhdiD4mG6SAYEHDonflPLe9MVvvghH5D+JEVTjb8s3
         DyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751715721; x=1752320521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAHTjxoRg/FIv4SevXrkhfjFjbI/gmWYaIWd5Qxa8aQ=;
        b=DKkQBcbE4CpZ6R3NSLTpZSBTaf/yebie9aZ8tXJE32BeBLo8rTJtV470sKfDNQ2s7y
         /g/MsAEXleCo9jbS49wLmd6B5Iy7+1Hp6A9VcrQyhG78XUCIoZVbHFdT8PyoHxj3/2yp
         R5qknIk4pDu04wAHbTHMGYUFcqr0o+kASuMuh7Dt90WOFWJwftpg0f6TV1lBOdR1J/jJ
         rfQKi70v4Os2mKN5UCxGfQ7CcJ8e8e4POevtSTga7z2bH5WPz8q3wS8Xv9zGZglaYkT/
         cWBTxJVSx1Hk9Ojl0J9fUWDGOxYm610B1mBAdHe2oZ8FwUO2pHyspfurDE3RD1t2TBOQ
         jzkA==
X-Gm-Message-State: AOJu0YxTkVkMdT3es/O3wtPJUI17fbODkMGwRnrbgQEGoRYD28wtkQYK
	Ve9FnmzcJqCjyyOLoNtYO5+GRc7/2Q6khR9lloK5w0kgtUKQOQhXjS0IjwWt8QLIaOY=
X-Gm-Gg: ASbGncv74WJSZe6xsdOdGa9p9A6iNhzJx1Tiw+E2By42/z2y+3u+rPeJGe106OtdzEn
	88oNuyjoL+2Cr52zxhyuItuXc+0eMqD02gdpE3lnQqwlDBJq0Yt+ShoD9vSQqf+MY4AQxuczPWa
	C9wh9MW3VT4jokr78McQrXtWHqAkC3xNJsKOtrYTq5gQbG/umJUXeWM2eOL7Ppq1aGBuToM1fUd
	T2ISQNpvRfi+bL3bBZzz0KRrFAy4MNkmJ1oVCt5MpODCCQ8Hgv2vjnwTxujFTXj7ymmiPGzbRXs
	3ZnvHM+krPgiCahxi333iF2Xktst5V2wzarBbdifAjAK7daFW28r6v+GXlVP2CLuAPpzchw/
X-Google-Smtp-Source: AGHT+IHCgah7jluYP8xO8EHAE5TOYiIgQQl3okpkeDHpge1sCVxgoCBTqpB3wdWxp1vRDV2LJBpySQ==
X-Received: by 2002:a17:90b:52cc:b0:311:ffe8:20e2 with SMTP id 98e67ed59e1d1-31aadcf47f3mr8175090a91.4.1751715720751;
        Sat, 05 Jul 2025 04:42:00 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaaf2d16fsm4432532a91.32.2025.07.05.04.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 04:42:00 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Coia Prant <coiaprant@gmail.com>
Subject: [PATCH] arm64: dts: Make the IPQ5018 bootloader reserved memory area modifiable
Date: Sat,  5 Jul 2025 19:41:34 +0800
Message-Id: <20250705114134.1615729-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reserved memory area size of Bootloader and TZ of IPQ5018 SoC is not fixed

TZ and Bootloader reserved memory can be 2M or 4M

Make it externally overridable for some out-of-tree devices (e.g. routers)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014..479982728 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -105,7 +105,7 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		bootloader@4a800000 {
+		bootloader_region: bootloader@4a800000 {
 			reg = <0x0 0x4a800000 0x0 0x200000>;
 			no-map;
 		};
-- 
2.39.5


