Return-Path: <linux-arm-msm+bounces-44368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B995EA05BE0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E12164558
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56ACA1F8691;
	Wed,  8 Jan 2025 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhncitLX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A9B1946C7;
	Wed,  8 Jan 2025 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340324; cv=none; b=VKV1tZEXbgr5sMG+3DCN4AuVE5ay3xzf/k2nb7yzoRtBxnleP3wnBjICqfZc5tmhMJOUNf2WJ+GCDLFedxlJdl8ie7+QrIxAJZWa/MUzTwoFz6E8eL3yk/daOulXPHprjhQop9/sXDDpLpi7fmbZm8RsnltV7Y/KYsHZUKemcXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340324; c=relaxed/simple;
	bh=xDffL7I4zP60NzwZhT3EsyuBAbK0h0Bui8Anc3dYd1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lnJBXd0Fvu+0GdQmVKj3x5BXjuUkj5srCKgoG6pzUL3uYdUWJhvyayEh827JEvBYOWEqvgnlaoWeFJ7nLi3UHUJlSLfY6I6LyTd3SdmNCgbGvWbPzF7NRKhb0TArZn7CU+jjennF3O1RC4+w4srTBCsOs9votmk2YRgtWIOWNhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhncitLX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21634338cfdso36011655ad.2;
        Wed, 08 Jan 2025 04:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736340320; x=1736945120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NS0zCaqHSR4UKthxTXJbmTUY5W1FXh6tTvznmf7zhHI=;
        b=QhncitLXIGqM4YpjZryLsBmH6LUNrLw+tdBU2Ez6+n3I3MLfFEFXrHDHiFEteoECOL
         7TRTM0Sgmp9jG8cr6GD/IsD8ziJ9XXQt4IP9kuJPN8Xsi1+T7Mroa57XTZjtER+Pqxnw
         nt+pNuN4MfU1+6chfizG1V8BIzRA/cBIYLAd0RmKOkMG/1o9CR/eleaj7+vOdp3pSQLe
         D9sTItc91JZmr1kWTrWa/NUHcntkqHNAdUZ9yD5H/PxP76dzumLVA8CF6qPQYMxXiuIg
         tJE5uJ5S2Vj/gGHlMG0n8kZ3I5mG5ZMU9eOSq1fyaRYpGWZMhciODpz0dgGmwNzqpJr+
         sNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340320; x=1736945120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NS0zCaqHSR4UKthxTXJbmTUY5W1FXh6tTvznmf7zhHI=;
        b=I2q7oz1OqJNt1mhRtrDbU46C2qNul+viKQWIKqwQD/S0mTmJaNuumSLUGZVdqQa9yn
         rOoDjzjCkwT1GFIafs1T8vGDvWZqyFUBQPYrQumqQV28moQoBTTHZNSC/aU9Jdp+xzHR
         mOP9bQWMGuvlNySIYT+0UX+9LwNv0mH/bfsNLDgrUtXAfmP2FqOEpD2uCksmdy46osOI
         8tSleAE96oJPfhEudk0/ycPr2Z008Wg9PbnCwv5/BXq57s6S33ENb4/qHnUYNR4ZYQth
         VuFVtpNV4o/F53/FHnH5ienYtXKH+pogzqYLlw3dmV63fLwaxhSCNPT7daMJ6OwSrjxE
         TtEg==
X-Forwarded-Encrypted: i=1; AJvYcCU//X9Ui2fSr/1CanMp7zETNioUKobEojMCo0oPEN+OOkNez2LMhAnSlx+kvV3pV/fmpX2piUUljVL8Rl4H@vger.kernel.org, AJvYcCVQS29ubduHAgWzdNcR1I0mFJnHnJ1hZ3xnEXztI5AGoDAzW89qG7tXuso6AuWob7iq1cS8VP0BHLIE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5DnedmOa1+aCrI2pJO8nReSgg+iM0uyC2BnGgBaB7O8VAQIH
	3WrX9vmJacJhUdn178fntQazeljS3jSJt8Yz7O4fCubBVenDEXKraIVI5Q==
X-Gm-Gg: ASbGncv0A0NPcEo+VESQSnt8gCeg3FUQFxm14/R5rieaxNh4uraiTZOx+SBk4jSkZQT
	0HFW/RldCSax5ysm4gl5jeDuV+IuiWlGGj26a+TcbTutiirsyYvj4WaiAaVi+UHY+JV34hD0jRD
	m+HCrfPFz51+38oRsOuqe5Dv3KVUiVPpb2QsCtWAXGvZWJ5U6EL9KlgXB4/OODwyRgNvy1q84Ex
	W4tJ/WDrGYwGEyq3k61ANvzYO/y0+CO5ZD8QLEsHFNu4/CT+FbAXA==
X-Google-Smtp-Source: AGHT+IHn7lP/SLxVfbfgdHpZlvTVvtpdTo8QNCv3/xfPgqjS8NglLtOSURUpuBUKwAZM8zqrcdLU4Q==
X-Received: by 2002:a17:903:1106:b0:216:361a:783d with SMTP id d9443c01a7336-21a83f6609emr44146335ad.28.1736340319567;
        Wed, 08 Jan 2025 04:45:19 -0800 (PST)
Received: from renaissance.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96ead1sm327174085ad.91.2025.01.08.04.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:45:18 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: qcom: romulus: Update firmware names
Date: Wed,  8 Jan 2025 23:14:59 +1030
Message-ID: <20250108124500.44011-1-joel@jms.id.au>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Other x1e machines use _dtbs.elf for these firmwares, which matches the
filenames shipped by Windows.

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Tested on a Surface Laptop 13 where the firmware appears to load
correctly.

 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index f01eb5ab7dc6..85d28fb8d878 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -706,14 +706,14 @@ &qupv3_2 {
 
 &remoteproc_adsp {
 	firmware-name = "qcom/x1e80100/microsoft/Romulus/qcadsp8380.mbn",
-			"qcom/x1e80100/microsoft/Romulus/adsp_dtb.mbn";
+			"qcom/x1e80100/microsoft/Romulus/adsp_dtbs.elf";
 
 	status = "okay";
 };
 
 &remoteproc_cdsp {
 	firmware-name = "qcom/x1e80100/microsoft/Romulus/qccdsp8380.mbn",
-			"qcom/x1e80100/microsoft/Romulus/cdsp_dtb.mbn";
+			"qcom/x1e80100/microsoft/Romulus/cdsp_dtbs.elf";
 
 	status = "okay";
 };
-- 
2.45.2


