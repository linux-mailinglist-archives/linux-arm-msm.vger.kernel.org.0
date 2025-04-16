Return-Path: <linux-arm-msm+bounces-54483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE5A8B5C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 11:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60BE43A63E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 09:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175C422FF58;
	Wed, 16 Apr 2025 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jV2SWUF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D43223373F
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796570; cv=none; b=pO4JgQlal4IIlGlJkx7bPmMGKsz9VhPWh+l2YcZ6jaOBUBOJR9ny0NUOBpezIpc50yNEsApkWRn3YImU6dffogy1nnXSaUdfFW4kbkXPDsTPI1j/u+MycWRBNCt6/oAjWH4KrBFfJOWvo5WeBEJJ8dZKOAJRLt0GBkhGh8Fw8C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796570; c=relaxed/simple;
	bh=joXhwY6sYcNm/tHWtZiox99xSvecyLlxL3fyWaP6GCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuMEEB+1N1Y6qq+7BWnURZOF1x8Py1SI7q0l/NmPrp47bNAH3ED/G/pDMXjpgFa0JE4TP9fal9etaKwoX95atw92XehNsamQWiGu6VwuWcHDIbJ6XksF3weCJakGYsD2ecfueEz6k+oc9uYlfARAGIw/2aH6jqrFG8Ev1PYj2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jV2SWUF3; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BF0763FB6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744796560;
	bh=luxCLj+tQK4OIUVASojgpuBNRUz4uNC+3lDnRXiwNtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=jV2SWUF3yJQPRzlp2STr2ueDGXCgh24t4+ZywgRM96+cMqDY54QhqwEgbNwQjZr3S
	 Bh6SC2QppToWjFqsaUpMDtzgx8b3sSl3T0t14c2ipzNH29kMn3zP1ao8QNYp+gbl4I
	 QZz5mdzkwb6W6+bQLGVXT5XZ2BAs3FsHYJ+QWGTOmimEDZxLFdWqV9YCpNvxzQFmMq
	 KBCmcsppDMDAbZmR1fGkgaur1q8oFuSoSCu5dhMKmquN1FNDwzUVtXzqZebD0lrz5h
	 4gF7vit7myAPOaL9pyDRm9N/9W2q/fWSLlKk44RE2aatDlB/Hg19xlBfcA0iJ/P27W
	 ON7l6TTjEdzJA==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac2aa3513ccso503691966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 02:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796560; x=1745401360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luxCLj+tQK4OIUVASojgpuBNRUz4uNC+3lDnRXiwNtk=;
        b=DJsTGAt+cRED/vDX03Fp9u95k42U9fsV00IPcPYLM7XsyVNxtX4weVJWYZGHIY+lrL
         fQP/zsXYGMVIAzIdoX4fviZfmhQMgCo97eyoN589wu+LB09Hy0WVMAX/5dTZtxUCrftx
         Lhh2Alx/gP5aMxpy3aVIidPm2ood6Nwrpt5OzrDdAylbRoq/sEqRJ6AMyTbazn4n4kpI
         DGB6wWUpmsRO1gEhLfubnPaY7J/RY0IZ95mrjMpGamSNqS7TXPi9z4f86Ii2lXlNqurS
         LjCXRRZka+98icNxUAWJL8bdKqQmhDMUSt3GS95sgQxlN7f79ltNlbsAtS2s6mObd9xL
         V24g==
X-Forwarded-Encrypted: i=1; AJvYcCX1lIgXyCCroD4cq6xu4rTTG16RMxLELvqieP8mKK82fK+egfgchSubiK2s+BNVaxhUXhpuSr5ga/kWNg2K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/fGqBJpaptkSfX/LX2kFt2GkZmq4I88XrAY4Nc//Fw+3l95h
	aVcYRz4ZPT0SuwRnBhoVAovPE9LbgKXZh4FBVO+QDz+He9u4R10y69AIB/ttoHT7p1NQp2aGqGB
	fban+ZLdr6JFtNJXv/5o1JUS5dVoBLpHrbjq5k46ssfYmXl5RxMJYJj3v4npr5B7nTINoy6Ey23
	nKY3M=
X-Gm-Gg: ASbGnctbUp0EeBkmAz05QK97mpOEHZkFJ5jqSN7a2U/Nyd7OqJ++uUvKAYNcXHfigp8
	fi5vhkxPDtR33PfVCzA2rbVoiwwqv26/QXKYs55+R4EjM/FjLCxxZjmf5Io0moJI03/YoaD8B+y
	yP/FT2ew3oKRBhDkOKylQ5l8dvoroyzleIPaP2dHUmJbDUofK+xlRzgGlVuuLuKwBtKD7EC+JBq
	eYIYT2u44QTdK4NL1TyEcFdpPFpFm+IWdfswocGrQYf9dXC3R6i5sAtPWJKxhEyLb+VknbItwva
	YYOdXjToEiFXG6seNZp+51+O/prZS1+2NTUC8Qp04f1oUUTz46MdI0dW
X-Received: by 2002:a17:907:3cd5:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-acb428f9f8bmr84151466b.14.1744796560250;
        Wed, 16 Apr 2025 02:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGloZCVTcizStQEncptXd4CPcpgv6Q7I71rXkznCplkatmt7MFtPBthKWOn58dpevVzm4CyJQ==
X-Received: by 2002:a17:907:3cd5:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-acb428f9f8bmr84149266b.14.1744796559891;
        Wed, 16 Apr 2025 02:42:39 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd629absm93643366b.3.2025.04.16.02.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:42:39 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v3 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label and pull out the model
Date: Wed, 16 Apr 2025 11:42:34 +0200
Message-ID: <20250416094236.312079-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416094236.312079-1-juerg.haefliger@canonical.com>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a label to the sound node and pull out the model name to make it
explicit and easier to override it from other nodes.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index cd860a246c45..9595ced8b2cc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -174,9 +174,8 @@ linux,cma {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-HP-OMNIBOOK-X14";
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"IN1_HPHL", "HPHL_OUT",
@@ -1691,3 +1690,7 @@ &usb_mp_qmpphy0 {
 
 	status = "okay";
 };
+
+&sound {
+	model = "X1E80100-HP-OMNIBOOK-X14";
+};
-- 
2.43.0


