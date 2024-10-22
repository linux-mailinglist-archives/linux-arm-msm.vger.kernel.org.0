Return-Path: <linux-arm-msm+bounces-35313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0BF9A94EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 02:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 353B4B232DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 00:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1898E43ABD;
	Tue, 22 Oct 2024 00:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnCU435l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D39A81E;
	Tue, 22 Oct 2024 00:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729556688; cv=none; b=EgOdu2VrWZtx4SHa1M99UqYNeFZsKsu3zKeTz7ewIaAlxHYvNPBoV+dNSWccIXM0vKy7rcmHCACrbhUbXg+SnZLxeXyonwnXWaCHZ6R79qwGF3nZTrxlEzlp5rn5JmcWEfGM+YOnSYWdxsb8HquPV/DwVHAdATiajkctJ++ZXaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729556688; c=relaxed/simple;
	bh=qn3tvKKrV+MkKEEtP/3mSVOXcf1hvH6DKKf2Olq8c1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AWPn4pa5tV9vyOB8BknSJ0ItsUHPwsIgMT69OQ6SHBY2n7pQG2ayy1sKKEerJPahYxSCCtfNCksLe5Z1hGuuXbpoPH3dhefXAT3hBvJY02IQ4g4NetTB4sB7nUa2ZQK6UH46EM2oHZVCtQDRM7lx3aL4AQY40woaqagmdSPDePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnCU435l; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so3396381a91.1;
        Mon, 21 Oct 2024 17:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729556686; x=1730161486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpkTY6F2uSC04DqIi28SIb8nyKa9ghdEbA6ivtVMgTg=;
        b=jnCU435lSqZ0TLULb5/6bA/1BQDJ4Nk6et64W1ETKuFzbddXVOCe2Nsq89dV4bBpUq
         mHMphqqb4p3yzn4WLLCpA5LDoScuiVmZYXH4Og4xGWZjgzJKsC17qUQKFZHfcb6cyy+k
         hvPVRNhzkRPz1EHNuCzRQBY6Y3j9s0z3fenRM4rA+wzbh4VzfuytmfEQc+ycEbq8IJiF
         K+czXiEWdy/ImdM12q5+zKmYhURJsywJuCciKPstTsEj7xUpv9+Fa0a5SDXHQn5fuYdr
         icgc1X7Gf8aBQvq3bR92DD4wbRBJDJWH0nqGR1LjIiFXStTN3Sh7Vy+qTu4mi1UtZtpJ
         Q4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729556686; x=1730161486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpkTY6F2uSC04DqIi28SIb8nyKa9ghdEbA6ivtVMgTg=;
        b=rugC9zq6oEF7bQTI7vLxYxtUSWQJ1XeFPEIMBk/+8VTruvwA/6LUd0sXAorIxHPSaD
         pgne+5MbCooYbPt3dV1QBGiyknkWIcOYvCIukK0m3oAjxNCmePxusqjDNri3m5xhTtH0
         7mkqqtVowtHi0GfhpsOcpSXufqS43Lxchm4ozcS82Fzx7zCQHobuUT0F1T88WlvVw72S
         EJly1i/cCZNqWYRFkxaB3f4frEP7OyAdFRGdAT2rqeTtXOFDjYNbvbRZp5KJS3G7zokv
         fam3DzYzNCQyVMTi6bF4yDWHompfq3RtF6veh0mQgvh3DMzxZblei/nE4hMxKuqXmkWi
         ej2A==
X-Forwarded-Encrypted: i=1; AJvYcCXHEKbz0GLvAivROpHd0/tQP+DURO5zVyELSF4+f6xz1CoJixVCBlthfJujT2hEsY1qT82DRCbFN/9R/Fer@vger.kernel.org, AJvYcCXHxhfwUjx/H2DfrDV021INqeU4oU08H+yeWlQs+2Bjuoe6hNl8J5o1kCC17m8Si8zveC8w75sR4ijEqEwn@vger.kernel.org
X-Gm-Message-State: AOJu0YyAm54FqKWfBtUBPNkyaUdPUeiyw6B5A5Ofe5P+aeH8TUUQrjA0
	Bw6N/SnKFpYc+5Ugx3NH62wzpK2Rit3LVqDkcC2MjIzxpoO+eEsozq3DHHqG
X-Google-Smtp-Source: AGHT+IGUblBWPgHD/8lMJnzINTEdCpZFULIYDgQjz+bUtbwE8Sk2RHAni7w6SRxPq05zY/2T4Ljb7Q==
X-Received: by 2002:a17:90a:b781:b0:2e2:f044:caaa with SMTP id 98e67ed59e1d1-2e5619f8409mr15213589a91.37.1729556685785;
        Mon, 21 Oct 2024 17:24:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed78dsm4618714a91.40.2024.10.21.17.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 17:24:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: qcom: ipq4019: use nvmem-layout
Date: Mon, 21 Oct 2024 17:24:44 -0700
Message-ID: <20241022002444.843484-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
index 0d23c03fae33..a6d4390efa7c 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
@@ -166,16 +166,19 @@ partition@170000 {
 				label = "ART";
 				reg = <0x00170000 0x00010000>;
 				read-only;
-				compatible = "nvmem-cells";
-				#address-cells = <1>;
-				#size-cells = <1>;
 
-				precal_art_1000: precal@1000 {
-					reg = <0x1000 0x2f20>;
-				};
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					precal_art_1000: precal@1000 {
+						reg = <0x1000 0x2f20>;
+					};
 
-				precal_art_5000: precal@5000 {
-					reg = <0x5000 0x2f20>;
+					precal_art_5000: precal@5000 {
+						reg = <0x5000 0x2f20>;
+					};
 				};
 			};
 
-- 
2.47.0


