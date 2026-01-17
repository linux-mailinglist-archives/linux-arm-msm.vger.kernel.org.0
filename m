Return-Path: <linux-arm-msm+bounces-89490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E42D38C1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 05:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 516FD30443DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 04:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6F731A7E1;
	Sat, 17 Jan 2026 04:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igKi+hxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE530DD24
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622810; cv=none; b=pbiCI916Mwxe5K9R0/Es6+BCnFpiSvzBeZdtara2xMf7kDC1uKV6UU4kuM8YAP/kdoL14sQ95qzq7HKp0TvhvwNFDiSOb8oG32vN5ozjQjt1m6mA6a8dJTjuafWHxNh2xTZYYp81SYbGgHWBmzIT2yH2cedJYHoCZI8C2pQyDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622810; c=relaxed/simple;
	bh=DLYTLurhJa/dsUPjZdKrouNuDeRcN2aGY2f/dIS8jn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zs76O58GeDqPiLXFDmvo36VzuzRE7BGhfrL3XYFerX740fxMQpr1YO4suAhcUn/Y5mjtDZdVuJnPhDMb3QOGZlAsUmmwNkwRXVaWAfdM9vS7o/3s/+kiynf38FkfyvvDV7wvVNOO8wWsvPNecJLMbAAGojIbYA7yn9YAweQL23k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igKi+hxP; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88888d80590so39673786d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 20:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622806; x=1769227606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqibFg67h3gtAqqjjlrzNhRlOJB4sCD3HtefP226Fgc=;
        b=igKi+hxPM9Zg2tfIg2I4VrZ0u1hW6UKupSJUjpLyO+TpUW8QWCPbchJck8sKAXekbg
         +kzhO/8R8vOMzjL5W38rCN0G1HQldV8alZSIoUAwgKt68tLXuTfNVaVRmca8sqpFJTgW
         vi0XmoLAWY+5je3np1sTFn3iyEsy2BWOSvolnDN+hJS8UX1b6Sa40dEjHPjiKZxaTjZ+
         iloTm2TXPa7IIMbi1LP2z6jTBXJ200sXKYlYb0mRs5V0micHWeJ4CryD5EUu41oV7Fly
         211ttRk/89iEJxlofynrOSogcBDc3PkPXGbMhF1U97gnun7vmFHLtE/7Uw/qylOpnf5K
         AVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622806; x=1769227606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqibFg67h3gtAqqjjlrzNhRlOJB4sCD3HtefP226Fgc=;
        b=Yci67KYenrmHolpRA7XaQiDr9TmcUbLSkaH4A2XVCgS1MId3tjyEunQYlqeD+8M96u
         qazmS1Eq/oscSAbRXJDjSfKpCvhaW5VJOuShHQwmkOOVN1MK5jefrFryIol4CeYvJ09L
         XWfHnGIaSmJZ4wrIyGdOCI5bzvMwYAmCbZgKRC4zL42p7ZhG+4FpCCtlhOVFtmwfEoSi
         JSPom6sf6T0ErIW/tLCKw7QJqXZYww7uXL9IjcgrI72UKyxm/6SImm/9/H7QcpZV6d3n
         BO3Qr6+WRxpf1XxhlDEAhCHR6w2l7gUFeGK70dKAoRwGdTFz0A2yyWSYPBDwvEdLdCKp
         BowQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE+xK7Hqaa2OSU34WnoDT7SDPgSQboO44P6LUdYjX8c8j5M1qeUTA+XF+cEVr060XuhSfwJnAYvFUMaeiP@vger.kernel.org
X-Gm-Message-State: AOJu0YzTXQ3Q07cH/UKKS/Rr2B+Xvcw/UhePdTkywVfILoG447/rfac5
	QgIPxojbjci9EXJIADUG3kbjTLUcvCDhEY7pWLfPfbTU1u83Aka8k0ZE
X-Gm-Gg: AY/fxX59/r2ZT4h+IEY/5K7T3kPgdMYBKAv4Q6WQnKADy/TwZVAHclnsu8x+BWS1++J
	KMXoSBFeWMehgzWrQVZH6AKPyEA457V/3rTMKK7spRCWt/1CxetFkENBox89Cz9A3oIn1tnmttY
	sLNf4CPu1TrbDzbBmEq5fznw06zsjbuphqnu0WCw1raW9QfOBk8iKDimIHP9nq2D3/6CetNs6EY
	VCh7lHf8Oei6Xpa2TzzTaPQue/FXq1oKRm6sQkOeX55lfL/qByYdY+Y/IJ6ljKsYNS0YHPMKEcX
	uzkmKKY5ex2b79xsxPsQu+Dszxl7bQwXVS/PzSAiL0KXLCDuhS/lgUm7qhaqne1Tpgo9vqbr5np
	QKrEbX9tAf7vpM1iJNJwz5L+UJVX8KqFRh9rh2UesKZLD9qncwkb2NkHIUfkzC2UDOYO06qtXdE
	X6MNjnaxyFD7OnT3AOb3VZaKHy6xtSAPfV+foAE5KXJ8Cbjpolachd4IZvTrkbgXpIjbrm8p1y1
	q4t4Ox+gplUKg==
X-Received: by 2002:ad4:5aae:0:b0:88a:2c78:d62d with SMTP id 6a1803df08f44-8942e47a66fmr63179296d6.26.1768622805841;
        Fri, 16 Jan 2026 20:06:45 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d6366sm43908776d6.51.2026.01.16.20.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:45 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 3/5] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Fri, 16 Jan 2026 23:06:55 -0500
Message-ID: <20260117040657.27043-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since dcf6fb89e6f7 ("media: qcom: camss:
remove a check for unavailable CAMSS endpoint") was applied, probing all
endpoint nodes and requiring them to have a remote. There is no sensible
remote in the SoC devicetree because camera sensors are board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.52.0


