Return-Path: <linux-arm-msm+bounces-49569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B7A46F3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 00:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DACFB16D730
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 23:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EAA224246;
	Wed, 26 Feb 2025 23:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hssd/Mkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4482702BE;
	Wed, 26 Feb 2025 23:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611697; cv=none; b=eKOhuofeSm1pCnZct2PrsLLGyQb0yqwZh4oj/GY55pAT/dDUQ++env/iHmeOqBP71zecN9LDesjgKqry+Dpe4mx9dc2yfZuViIHe6GJbAOXGAfcc0kfdrzYNhJlEkMtBJ9VC/ITMgsd18OUdtERdG8VkXNQMhhRk2iUZka334rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611697; c=relaxed/simple;
	bh=zW+H7P5IKjbJZPGN9dPXew7VhpgPI+p5L5I4cgEgEqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3LENyjVWO7ULV76/XqfIZbxx9kA3JiBWV7nqU6n4C5nCUBG2tJATyorFiUzxZmkdri61yoNzeJ4LskkVAePJTv5DWiFf+HTylUKx43OcMsWe8rsY6+8428eHndjomt3qJgMSqnCYwvMf/++tiUDYp6ly9kwLnCv7Rs1pVJRc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hssd/Mkt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43994ef3872so2278595e9.2;
        Wed, 26 Feb 2025 15:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740611694; x=1741216494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIvfW+NmqH5rlTdQIS+riXhcUCtCuuIMgWK4clEm8PQ=;
        b=Hssd/Mktq2qfLCVXds572Fn016uH5nuHKK8p9hYnqi0n/CAfYO6LPZWtVDcy89hdlK
         bUp+O1nKolm6rKG33feVnlFQOlGzE3j1ZkgkJMAcmPCOe6hqDeJbzKNfTqqs0mbeAgS8
         awUXBUWT6wE2o2VEGlfRspuKltdauNJQetBiF2pHn5n/uXdOKppVynNdYyA1yWzHNnXo
         9bzyZRa2xctF5PeJR9AQ23CO+di3LySl/ITkrw9e3nGhDRGzKQfgs13ZdhazLJW8I5FK
         3av6yODiEjacrbknEQN3Igj2J5mRduKHKhL3S/rL2F/4buBUiJJi6hjphCM/Q97f0DC+
         pr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611694; x=1741216494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIvfW+NmqH5rlTdQIS+riXhcUCtCuuIMgWK4clEm8PQ=;
        b=w5awBzJ5XRzPN/yuGIIPh72ds2aNdyShDGtr4McqkhMkT0aa8vsVmTcUxvqvFoTNNj
         Sa/xYiS3KR2tB2AtQ/3NFYQw3JMyWjoRRYqtmuB7mtGd2v3fso2OEoT+PuKSOXU3pUvu
         rD9SGzMVkOndRD3QL4KUE+MjFP4YWlNEUCyXpuzpAPGiRBjK0ZCt9X/pX56H2EaxUudz
         VIPYU1rrvLpsdo+nf5aSkqrCwLLiML5JZp9r7ufcpgpnin2He1RTv0O4ZUC447iPv3gA
         YsVB6Fp1t2f3LoZa1sFexSa91IgIdakn1m4UVZViz90pZ4JdmYyx3uXobkLBqv6M9tsZ
         Y5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD0a2iEcwXk/0Afd7EleGszl/wezZQJU/lTavR0heMv/c8paSBUsTeomIA1F3Zbm6Otosk9J/YR9Ksc6DTDg==@vger.kernel.org, AJvYcCVoiskwDf7T1Phco2yfPyhrhtQMhaTNJyVJUjZK3p96wLGovIHdEvrLmCtL4+GKuyufgxa0IuculCo1@vger.kernel.org, AJvYcCX/6g7gJWcLuBDBCgBlqoZxgRUcBLcbJkaeyZtcnvzuEQz/DddjBWvfwqD9fMqAdgOwqhPpUxyGGVt/rkyK@vger.kernel.org
X-Gm-Message-State: AOJu0YxLX8pRd2cRgHuaIvXg64qFpUZXbBzClbAB5YTJLCgKxp3ZiRbc
	klG8NA8/oMYhMuywYRoI3HRUG8yxqrshwpeyur9n+VgzhJplrNw=
X-Gm-Gg: ASbGncvEnLaRCXPwX8jdpUxf1lvvzlcGucPvC+9Cj5zzoYKmnHhHPOVinacX4e0QbJS
	Fy6saP0f7JO3uy27tlw9Hy/Tu2lqQY6NCoCNqwWp+TsTMD7l+pksS/AB1k8SCq9n4eOxdq2ZrBb
	T9cRPn32e5r+bRl24BLKgDLxpMaeabafKkaGNWytPnvOjmawheiDAnOKV8yH9IbrDpF5+pdA6yo
	eHCbIlsFH3HZ7jzCJMhMaG9YMKddWYC7UA5AjfKATG0i27QsPGOdZSbCnsdlAa3HjrriXe0TY02
	14DRMfXavfq1fwWk1GYL3OXeUfHWHSRdbmy2x6TaYw9n2LwIAz19sVJikptd/RpQklSz86VQag=
	=
X-Google-Smtp-Source: AGHT+IEDZ+3dET74wrhpaDhmARRw8R9QkBcag+v31n2ixbT4gBpWqxUp5FCScX4vqNlA2OhEMyRr7g==
X-Received: by 2002:a05:600c:4fcc:b0:439:9ac3:a8b3 with SMTP id 5b1f17b1804b1-43ab0f426d2mr83294125e9.18.1740611694146;
        Wed, 26 Feb 2025 15:14:54 -0800 (PST)
Received: from alex-XPS-13-9345.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm238134f8f.5.2025.02.26.15.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:14:53 -0800 (PST)
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
Subject: [PATCH v1 2/4] arm64: dts: qcom: x1e001de-devkit: Enable HBR3 on external DPs
Date: Thu, 27 Feb 2025 00:12:10 +0100
Message-ID: <20250226231436.16138-3-alex.vinarskis@gmail.com>
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
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 5e3970b26e2f..602bd793e09c 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -942,6 +942,7 @@ &mdss_dp0 {
 
 &mdss_dp0_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp1 {
@@ -950,6 +951,7 @@ &mdss_dp1 {
 
 &mdss_dp1_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp2 {
@@ -958,6 +960,7 @@ &mdss_dp2 {
 
 &mdss_dp2_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &pcie4 {
-- 
2.45.2


