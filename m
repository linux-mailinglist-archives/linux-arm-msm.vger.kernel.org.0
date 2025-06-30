Return-Path: <linux-arm-msm+bounces-63125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BCAEE897
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 22:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 047F63B2FFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FE2224225;
	Mon, 30 Jun 2025 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCLipoCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25A1E32D6;
	Mon, 30 Jun 2025 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316921; cv=none; b=Biyf3Se+CUlindablECHSqbMT2KGDsECCnQwgPA9CU4n2qjknnCk9R1M3x7+jOD25KMDM4gbtXBbQyEzMk2ft/utx6LyVu8IXFv8kTbYceFijGlIdYvc5SrpkMh76N4pCEtU0kvjacFZsvXUSdE2xLS5u7cqMU7vxn1MFoGjizY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316921; c=relaxed/simple;
	bh=YAy+RYbvkjFNXj6qRy0vOgUuY9yZY7ywM3hdS46BqJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjH7E5lPkKfIvm8mQNXRwP3M1o7UgR12EpXibu7D0jRqtqRAN11ktWhnyQyuL5lse06Uc8JgC2feBkGiiuGn7OUQP1g2kBF6InyrozN+mu3kqN98DWyBkhArJrRXGS/xo8DfAbEFbQT+q6nHF3suHC/UjL7kdTWlJt9Us8Ge1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCLipoCC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso2813008f8f.1;
        Mon, 30 Jun 2025 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751316918; x=1751921718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zd3aDNyOIB9wHWaZVV19V4mFjMaaumQH2H9cWTuStEg=;
        b=dCLipoCCFPg1Ui7RhXIp8nxB2Nc6yHRJnKFkcKs2LG9Fzso4g/f0z9tVCN2v5k+/BR
         FhWIZuAkP1u5MIvW3JUMSjYc9r/o0NQT/OuXEO7s27OUKVP4RUJx0Zz1koBz4X92Y78s
         ogMv2J3zt4UXeTdkVyrc/UK1myIJ+f/1at29D/XZjhmXTXCb/9fRFTSbUjqQGDpjPnH2
         tTLvxpW6GK6/SaV8tHgyRVKuUnAzhMeeBUp+9WVBj9Evn5Xp/kd2ebNBIx+aiyjBwT7m
         6cOQms4ckiQw95taPeq2d17M5r6WAJUFGlT3VAkX9Ogl22NHDFvwuc+L4/aXu09WKiam
         GF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751316918; x=1751921718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zd3aDNyOIB9wHWaZVV19V4mFjMaaumQH2H9cWTuStEg=;
        b=JpmikVxol+8zASabby/4ED4dr/4zsGnMotklFp5//CHVaZo+fMxpamLBugc8WIKwQq
         dySWmHA2MsX27JjctCjR7O6oo7TdGRUAVx6kqqfd6bBHDFhzM+mmjIPw/gSt2KtN+l4o
         0kP7rkDzBjHzrISt/qlEhJnIAROKh3HyRZRd1mVpn+Qhh8vA5RLQmMUDV4+KaiLuY09+
         IACGHagwWnidy6tvfTXR9+w0HlN10hY4GpOyD7jMKf9XXCAFnDLC6dExdcGNTm/AOD1c
         dnFzopqjdeq7l/zXqP2aOy1D5O2SbUl3e4XU2zBfHmIuiJRD/Rq35i5Y9lp9mko2lkwF
         0DUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE5KLj2xFVDQbGV0UThTDwAAsGSW6Su331DbsL2ksFvjq3tu95QpgB/CBK8dGA5OBKixkxzJRy7mdRCSb6@vger.kernel.org, AJvYcCWJXv8fb+xo8gQIAvzWte2ZdXbevskMU6jVuyYh03JBPAN5V7El2ycbM1850P6Myxz95vnPZPxu5+9t@vger.kernel.org, AJvYcCXWn0jGpjG8ddrjtmfJYh30KuANsstvxppKngdRr9w3eigxFWViansFqCh34JNnR4ByltyMI23vKS2kcN8tdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5Z29PaqrYRRRiimYLckjvrfOmOpfG/0SbMmU9jP4AGZpw4JS
	C4EM+c1q4u5O1BAJnOFHSaQBKhhKhlF4Xn/A/C6ufND0hevZpaVGSVw=
X-Gm-Gg: ASbGncunvgIXfMI2gTsEvTiW/vHKfOKepDnDJPzWL0VsullZ74YpZbgIqu8U5GaZ4fd
	HFm3Ztjo8XjyYZNd7iYRUehUPVsjOTcRJgHBd7Tx9G9syrTG0FUft8WoPut1R1UMyIsiHsAUERa
	tPL/2Ffd/WGl3oA1NHrxWDBk2oZggKwZy/BLSOlraFb0rl+fIjnXFZtwI+V3WoFx2T1kuerLzvM
	zmq+5vx/b3vhL+6Nt60UmBVLuy+380MJjQASmTbQRjxJYGu9NKVuhlfdH0cDCVgBp+MmRjZ/m+8
	DV2u0jdxCxhevpgXbe6wNKxVuqIqm0n6ch4PVSwB2kT47XdimYtEf7NDBWwjERiisKP5Hi1GCEB
	8DDr9Dw==
X-Google-Smtp-Source: AGHT+IFrE9HwofGcor97Y0FzWUP+kIRDDKBiMV8P13HhAHJMChp80FEEZPsKhaYmNfzTzCdBYzAEwA==
X-Received: by 2002:a5d:5e8f:0:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a8f482bc23mr13759664f8f.16.1751316917626;
        Mon, 30 Jun 2025 13:55:17 -0700 (PDT)
Received: from alex-9345.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec6aesm11322814f8f.5.2025.06.30.13.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:55:17 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/2] arm64: dts: qcom: x1-crd: Enable HBR3 on external DPs
Date: Mon, 30 Jun 2025 22:54:10 +0200
Message-ID: <20250630205514.14022-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250630205514.14022-1-alex.vinarskis@gmail.com>
References: <20250630205514.14022-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no link frequencies are set, msm/dp driver defaults to HBR2 speed.
Explicitly list supported frequencies including HBR3/8.1Gbps for all
external DisplayPort(s).

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c9f0d5052670..bbaa1f34b804 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1129,6 +1129,7 @@ &mdss_dp0 {
 
 &mdss_dp0_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp1 {
@@ -1137,6 +1138,7 @@ &mdss_dp1 {
 
 &mdss_dp1_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp2 {
@@ -1145,6 +1147,7 @@ &mdss_dp2 {
 
 &mdss_dp2_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp3 {
-- 
2.48.1


