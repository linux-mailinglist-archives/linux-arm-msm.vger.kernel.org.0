Return-Path: <linux-arm-msm+bounces-48347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CCDA39C89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 13:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DAE516F8BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 12:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8658A25E44A;
	Tue, 18 Feb 2025 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR3OERlx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712A25A35C;
	Tue, 18 Feb 2025 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883129; cv=none; b=j+zjbhiwFpLEL0OBGC7XS9BAkjYffzR16+/vpngPEiPynx0jdOzEpy+mM8Ir5B0Q4kXGK1nYC+LqedPBlIbajJqF652d1mz502CUGGcV7gJQU2ZaGbWPykTLPALve9aVLq/oUxS9mx3r5rka4o+GyQuMni0/8oQXpFKJlg4Xxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883129; c=relaxed/simple;
	bh=WZCqNOQCx6zO8+iDsOvyi+ZcmH4P3OrAmCncVdzCDts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKI21xqnS3V9pJeOX7V5Cxxq0af7u1Dj3/B5fgDaKjNaeYNxB2ypWhbdKQKPYbO+FiUncFnyiUxMWHCCgomSm51KfifF4f18kxqN6VS8a23O6LvNFhvUBFId7d+Oxg4TRCe5A1SlvmmkDlmBA5IK5AMULKkHS0R2lJbPJYAdipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SR3OERlx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43971025798so17473555e9.1;
        Tue, 18 Feb 2025 04:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739883126; x=1740487926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T00F6m62eOnON9Sf4S3pOg2h4Ua/j/4d10PkPsHZ+/k=;
        b=SR3OERlxei12QHBRk0Gp/BfB3jUHP4GWZGSQeYNue+qYIp1bG8wXWz/VcaA5lZDdyv
         jyVY6+hEaOpfJMtriOe7KR4H1sL2EBNLcxfZ/fMka0TxBjputn4R0vE+Cs6GEV7uOSll
         WVi16OVu+98j/NZZXtQCxJDgWrfhJ+xHMcz3fXVik2km30AiooP11YOc+LWqTvln4V/5
         ehbjcvGHaCs/R2/Cgu/OL7pv/rYbAEhGhCvSY03GrkrnM5u+46c7JX6qYzWSGxZA+mjG
         K4ARSJTRCxXbfnBUGK1GuXVC6EcPOrmXQselOkmLX8jFSie8OJUK+nOr0etOIqRh7G/x
         SYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883126; x=1740487926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T00F6m62eOnON9Sf4S3pOg2h4Ua/j/4d10PkPsHZ+/k=;
        b=S3gpGMgyOL28TV3F96VntR2HTs6SJE/QKK/SITpxlQhvTROd6twuEhoG5FgE0gGjwS
         94VEvo4nND65vo5wJn0j2vmEDI3yareYbpOW9X7SFZcQF/XLE9bnOXvXoxCTQtyKlVzF
         AMRwk6gCcVDvXxN8fJFH/TtfGavlVXnuNfxsy+cPiAuZs4QWIWe4cVM/hKhCOzblvoFR
         ttDRTqB39Qtpgc5TNB3fkfFTm7aSS9NSv7CM2yakBBJ2OxKF7zFrBP3o8i9+k8X6GVUu
         f0aWQ+VyaH5H5vubXUMivKSlL760eKjsGCi+RSLZc1gc5l2FTHj1kC28Q78IGbF79HoZ
         7rWw==
X-Forwarded-Encrypted: i=1; AJvYcCVGOFDnYKVOZhxxfqy1QRV876jUDZIjjOT62JWQ8B1LgwwSTvwTLbdtKNWPUt729vTvOnpy/oFInflR@vger.kernel.org, AJvYcCX+ADsUJeEydefzIpuqtRT2m7gY7jjvYXgX3EgJeAGhKUm5geBNtmWSvk3+ANcKCyp8jVvmAN1Mjm0csiqB@vger.kernel.org
X-Gm-Message-State: AOJu0YxYyynHnkH0syuaR+B8kmx9rA7LrPty8sxzB2SCC1Yg8lMacI0R
	hbdy2Ex53GT9CrmpQWGVH8bg4B1BPPSdVh/OJePA/65BozZA6Gs6
X-Gm-Gg: ASbGncv19Nn0GKRH0RDDCMEHBmSGgZ/CnhOv4vTiZclcIZ1FwBrFWvzzsoBK7syodXB
	YBv5TZkof2FjQqPlFVHbp0baAvNfnl1jmQBBeHV+LweYCpxaaZhTulrFarw10Wg/83YkXZQhJmY
	svULJlDbPz0s9HsB+9mysC2pMlHKU/KymE1uakq4/v/hgrbHaS1ZXSNFSer988zU42gu7yvi1tt
	cuqhZYDO30mz99A7vXETktThjgzAMHxCyWxvYBrXYcVcjvZDPB91b2X8NlrTbH5BIvGXbk6V2Dg
	HEmHhXSpCUdICuwZvUs4rn0MRA8=
X-Google-Smtp-Source: AGHT+IEmUMaihQHu0knpO02wdP9d0VNbrRbAmiSUjS7OIoELcuwHR+y40zRhkum98y6zzAK+5vJKnQ==
X-Received: by 2002:a05:6000:402a:b0:38d:e48b:1766 with SMTP id ffacd0b85a97d-38f33f118c8mr11517057f8f.6.1739883124714;
        Tue, 18 Feb 2025 04:52:04 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fa2dsm14747720f8f.101.2025.02.18.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 04:52:04 -0800 (PST)
From: Lad Prabhakar <prabhakar.csengg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] arm64: dts: qcom: Drop `tx-sched-sp` property
Date: Tue, 18 Feb 2025 12:51:57 +0000
Message-ID: <20250218125157.412701-1-prabhakar.csengg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `tx-sched-sp` property was removed in commit aed6864035b1 ("net:
stmmac: platform: Delete a redundant condition branch").

Therefore, it can be safely removed from the device tree.

Signed-off-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts  | 1 -
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts  | 2 --
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 2 --
 3 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index b5c9f89b3435..af75350f59b8 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -257,7 +257,6 @@ queue3 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 177b9dad6ff7..11663cf81e45 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -225,7 +225,6 @@ queue3 {
 
 	ethernet0_mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -302,7 +301,6 @@ queue3 {
 
 	ethernet1_mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2d..eeae4f071274 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -411,7 +411,6 @@ queue3 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -480,7 +479,6 @@ queue3 {
 
 	mtl_tx_setup1: tx-queues-config {
 		snps,tx-queues-to-use = <4>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.43.0


