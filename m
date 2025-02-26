Return-Path: <linux-arm-msm+bounces-49570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769EA46F3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 00:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA7C17A7E9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 23:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B170225DD02;
	Wed, 26 Feb 2025 23:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5WbExaw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0119319597F;
	Wed, 26 Feb 2025 23:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611699; cv=none; b=VMNDGs1BF4mJkeVVvaWheiTu9+3auFUiNRPRUMyBD1VPWmw8mvvxHy89Toi4lUCH6TuoCuwkrGis6Fu8EYeXiVX8ZTygwRH3Xhccam4ZORPutpegiwEt4nsg7Haouv4xoCwOqYdBuoGfNOEDEGRpsnbl5lRZyRqiRJyW29WaxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611699; c=relaxed/simple;
	bh=hrIy9ff4rsKagoLpag4pZf4QmZykFvxMFRx577Yf3mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiuIzCYsM/O2awK76TRJFmTa/HNR5D/gGCa7dTkX2bk/gTsAK+cxcRZDrPSVxwe1Tp/QlS0dZfFeZ7tSQqK6hbC3N7LXMSfUWYtAxR+97u9YHl+6iYyzfJxL/NxzrwsgQ1LvxU/EJVVVZJqmBZb7tFJwra49nnOnA7sXxhFodYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5WbExaw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so2247655e9.3;
        Wed, 26 Feb 2025 15:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740611696; x=1741216496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUDcacrnNv0xO5p0QU6mzzt1LBsLcYXAxaev1cZmIWs=;
        b=M5WbExawzEz9UDvmstB1+ak/V1HcxLubjLPOeNLjVy/xKSrqpXSrYRfp/0cYMLczaG
         sk9wTULdNA5/zIAFD4d7Oo+x6rxXmCostshk+Xm1CTq/B8sf6wjiLAtYud10moV2xuNn
         hGatTotdDDNs6IuPMdkXB2GMDN4Qv8N24MZaHqFV8MQvxkIeDxz4MvNBEylCvFvWgzgM
         +CAN2KowqFrlSt7IWGT1vBpubdgxRS7ipzYDlKamxqE0wHkwnpgbjR41X/v6HkACGPZf
         ZpcgXdR0bYNDKa8DZcVqv9Usb2NdbjIwltpHVgTkyjJJnH5C6yFr6u0SopddIw4wO9c7
         qeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611696; x=1741216496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUDcacrnNv0xO5p0QU6mzzt1LBsLcYXAxaev1cZmIWs=;
        b=DfGnfUvuXRPACLIqvWsShDrxuqvKC76vdpCXwsjobGfV2J2vEcSyTdLljz90MA5C7s
         7OYmR5p6uIG6StGj1q752ViTt0mkAkvI8JJcFLdd1O1deIdeky7bhhiAI1EBGjaR+qxf
         HPy+VM7zTSuR9oiI6Oq67vm7A5dMAmup8YU4/ArwmHts8URN0Ppld+MH5UWH0pHZTtdh
         GWupmiFat80ZfiMZ+fn4lxkv0tv1NGz0h4VH0q5Gk6OllpKkND6rKUdwDV3L3RjRI2R6
         AFNNF21bzDKZzuZxhVtJcmyVJ//0iNRP3BSwNhkm5f7ywSpy1DK+gym8SYUHH2hI+GAI
         6wcg==
X-Forwarded-Encrypted: i=1; AJvYcCVhSsQfjkEWDSejH+9C73nqwwdHZx7yEftPWI+O4fBXZDeC7/G2Z8pUcLg40JDkhBTOphphOkfmfhbxKMhI@vger.kernel.org, AJvYcCVqwr9frT0Cfye/2K+YPy2G9LFBzjynMBlp7/oAz1Zo5mxNFdO2sjQOzCA56KimPHO0+RlsrRXgCvqm@vger.kernel.org, AJvYcCWB/adguOfLNZozIiG8TOPBT7YJ/PeWpBA+rTW9vHKMzKnFp9nJGGsgHyRSTNKvS0scm799rN0L2dXDykeYPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww7cd7JOLLumJTbXS60gx50m1wVm1860QEfY4FhwwtCQpd7Dbn
	AleOX5nfKjMh4CxkxV1UCtmsvvXxXhIJgPSU1GEelDyP81AM+TveviBFjYU=
X-Gm-Gg: ASbGncuITqudnZ0pYou5VlVM+FSzOl6UkDyeXWhfSxR53neq0GvKoZva9cZpx3mmBsd
	pJc8/O7efv+WzHDmE20gDUixjcn4/KKnS87DeSKZdJ94F04mcuhas36F9ziyb5yTGmzXc/NrpEJ
	VX1D1gzn6jFoea6WqiiTkq/Maaib4mXlReNSaKuu4jhW940HpBCdxHSBkx/Ft9jjDJCsLY+hCDq
	j9/NLmSsLAt99HxHTY9z6kvTWM5uJjBzWa7DOapV5vwjnOvIm5Mh5r2Xk1U++Sz8Vvn0/VLUa0f
	OYMz5WPWXy8PAtDTqN0pV0tbZCidCC9ao+R4xgo+5nF7CfjkWtXmTTP+U0vqLpsfLgm+Uz743g=
	=
X-Google-Smtp-Source: AGHT+IGd35qebdfXqaPr9iqPGUz6fmjy9LOA6/ykoklWzj/Q4MbatsCVt4TApXWxHrkduJHYldrvbw==
X-Received: by 2002:a05:600c:1e15:b0:439:9274:81ed with SMTP id 5b1f17b1804b1-439b03246bamr162641065e9.1.1740611695785;
        Wed, 26 Feb 2025 15:14:55 -0800 (PST)
Received: from alex-XPS-13-9345.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm238134f8f.5.2025.02.26.15.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:14:55 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 3/4] arm64: dts: qcom: x1e80100-hp-x14: Enable HBR3 on external DPs
Date: Thu, 27 Feb 2025 00:12:11 +0100
Message-ID: <20250226231436.16138-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250226231436.16138-1-alex.vinarskis@gmail.com>
References: <20250226231436.16138-1-alex.vinarskis@gmail.com>
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
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index cd860a246c45..569748c48200 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1139,6 +1139,7 @@ &mdss_dp0 {
 
 &mdss_dp0_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp1 {
@@ -1147,6 +1148,7 @@ &mdss_dp1 {
 
 &mdss_dp1_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp3 {
-- 
2.45.2


