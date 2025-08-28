Return-Path: <linux-arm-msm+bounces-71185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1FFB3ABF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA243A58F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 20:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040A2289E36;
	Thu, 28 Aug 2025 20:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaW0as3o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708327B330;
	Thu, 28 Aug 2025 20:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756414196; cv=none; b=k01QTYJNvH+AxKjPtgtP5YWpZ2+YRvQVya0MHcP5dLkAWK/V8Pc+58vWGK2aGpVLkYud5BPkl4Grn3iEJG1LJIFMuMjFy2VE68RS9ZeCnDIytW1hVFuq6FFEL1h/v79BXqrMMU0uIaz6sq0nxFGyMQr1/K4koZyFnnQB6VYmOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756414196; c=relaxed/simple;
	bh=veR2SQh2z5y+h+WW1lnue1B2yyXYDzqgFVL48myKhm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oIPlhbHVTaVoZtA38Km/SgPo54P0grUovhiZpolqBJO/eRnLxcCNVvHGVoDyVCKOuWElkbChtIr9UEzEcl+S7Aqsh7XBhPv1zbgdGj5wEJSSMaTuL4Cf4ao//jENPmgJFjcOcmo63ixExab8GlxGuxhzU9M8EMV2EL09sSh5Ubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaW0as3o; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89436ff60d8so163748241.3;
        Thu, 28 Aug 2025 13:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756414194; x=1757018994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZpI0BRZvxKAohM5OkqdJ9VFIBo5CJBt+2/fgm3a/D0=;
        b=ZaW0as3ontrxP914C+8q4sir/MDV0NSrQ9kxN2zVwxd+kqfDTILKGfnu0cDRwvI9B7
         ztEvcvI+38JKYfMeHBrTHY2rvFOcIfZvnSBhwPqQUuvZEzhzH4n4Pp6h9uPWa7yoxedd
         OXU4FgHMWm/Zvunlm8DWhqbB/uk3HfEolwJ0bw8t9jra3Q1QCFwmtXP9rm9jPP2I+B9U
         ZdJq+rIyvEfPhn72kEGLPxpbSV07gVMfWsXsGMjG1QtjicR1xEmP8xdq1TvmtXccUZoO
         kno93ujOxfcg13yr2teQ6p+4vqh8uFh0RMHEtglpf+2B5tFGq4NY5gC2O2JTPvxFNeYj
         vcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414194; x=1757018994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZpI0BRZvxKAohM5OkqdJ9VFIBo5CJBt+2/fgm3a/D0=;
        b=Ujf2JcdzD6MpoEbnbjEc2Dd8dWo8Rw96CiSjdwAiN7m5y2oVrmUTKJgWVosyH/ykJQ
         7wGKvh2rSAsHe782UdL/pBQtTJK09lP0Z4l2xMWoAmIGOaGcz5lWXHwe96PV5fMVmNbB
         qYe1GkgngE8rzP5diHVRWalZkry5rnJ5FoTvm6Y2NjORBmTYCyjEpc9RduaICjoDxAY4
         0YvGY7oSsqRXgcQGbvkP0LUJ5WNAZSfNc0rgkbQQDQf8DFaK1G0fvk+Xp/7qVrUG0mYQ
         HKbBf/B4kaIIakwiuRUAXNBHbquwWwtv4VSxp65dH4SiKSISFF69c8oqv9pRCA/giMns
         n9rg==
X-Forwarded-Encrypted: i=1; AJvYcCVSXpMSVa8rzBZPjv3p77gI7vKFNKvf3O6g9TCMS9le2wmXCbDbCP1Tvv+p5A8XWY8Xb4nCyt9SvqS1@vger.kernel.org, AJvYcCXo6Nz1LaX5YCLZHC0we7yLqfkI4YloTv1e3zcVChSBVaM50727MdzRCnhLMByOxlm862XV8vAyz8RJVvsv@vger.kernel.org
X-Gm-Message-State: AOJu0YzV1kFJZsSRHZA5vukBl9TVHXpcd9lAI+Q7rK3RfsVbuMumOsOS
	1bDDcD8oL+xFXc+uHesO2D5DTMBublX6vZD4xVtJ1ZHmfypnUxrFeipBE8IuJ9pD1oQ=
X-Gm-Gg: ASbGncvuK7UGYGWaGXPMyNF3kYq7aM7tvk8l45GVR3FNm8DFjC57WkVkBNCPEDAo5Qo
	J0/70Nz8h1BXpI66dsJIkmKRi34rlrIKdNRpLVZlyvd2rRcfAabTuexsBzTXAlmSLNqYZMVeU2/
	w1tKWVS4G3o6vVaJPnWoJxS9s8xRIh6C8Bi3R01uTWs+Spp58N7DR/yYX9pGeACjLR9S0J0PCJq
	fKnNTZtRSIiNlVEHBVR5HWpr6ZkR1zER4YzRMuSFt8WzVKUSmjKdltJjJpPLDXfL+48GpBcaleX
	TS/WcTffE1sE+J/Fgb7B8LZ0ObtGG2A4An75VU+SOMXGluuL2Nvabie6JYajC13ezs+3oWs/1Kd
	HUJDzV5QYGo9u4vUkeZ0c+mRdHft0pICy
X-Google-Smtp-Source: AGHT+IHWG58zfchGNc3M7OQVL2FeGr6cH+l+BtTZKb9NbWepXyoxVvPBHnF2ABxCrOAu849XBO0kfQ==
X-Received: by 2002:a05:6102:3e27:b0:519:534a:6c34 with SMTP id ada2fe7eead31-51d0f712858mr8805746137.34.1756414194237;
        Thu, 28 Aug 2025 13:49:54 -0700 (PDT)
Received: from archlinux ([179.110.125.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89438a05fcesm232134241.10.2025.08.28.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 13:49:53 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH] arm64: dts: qcom: starqltechn: remove extra empty line
Date: Thu, 28 Aug 2025 20:49:28 +0000
Message-ID: <20250828204929.35402-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove empty white line ine starqltechn device tree at the end of
max77705_charger node.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 03b63b987a18..9eeb4b807465 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -633,7 +633,6 @@ max77705_charger: charger@69 {
 		monitored-battery = <&battery>;
 		interrupt-parent = <&pm8998_gpios>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-
 	};
 
 	fuel-gauge@36 {
-- 
2.50.1


