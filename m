Return-Path: <linux-arm-msm+bounces-84148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD35C9DB6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 05:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFFE44E0558
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 04:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEF627056D;
	Wed,  3 Dec 2025 04:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcOM/WNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F126F28F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 04:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734760; cv=none; b=HKk5twCfiHD3xkastVN9utLM5IhcrSRq4XdQN/gpR29mHQHdzCWvRWKNNn57RZJcTaMKyxaAvi0A/rJ/w0t+Gl7SAZ2IKzyTc/YFIKGjVTzsKtUDDXPsgf/0DuYi5uouwYzo4Keh5w3sgoJ2bEMpPrDzaFtIhmA1qOpIFKsVRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734760; c=relaxed/simple;
	bh=2xaGFWIsUm0cfKA6LAaLgYTTnY+9WHjhg5Sq/qWOVps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcWJO1NCllA+JBvSzYp503PK/YQ6VidO46drHFcJEtqzIHsWVeE751Wfst0WyMVBod/kY1TJ39uhAZkzV6+Jfejuvf+yDrAh5HrM38GPykNfIng9H090eZSyoW3ALIqGoWN+Mx3FifL4jmunbYeYfosjb7F1SgYS9WvtRkzLuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcOM/WNv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-597d319e0acso78635e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 20:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734757; x=1765339557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7juq+nFojneUyWGV1iiTe0acnQ5/jJnXPDq3Sa5NV0=;
        b=YcOM/WNvSKFlF2NLK9CqpDg1L/E0kmiEnm30PiAj48aQBLBanaQe61hO5DqWZ2fo9R
         fcsgzDcn5u46uIROcjHuWgDtLFjhCJ+5z7YRx/+Jp/djz3ogqpxKMomZdmmsQgVUlOtF
         YPKrTQOMuyItI7+0GH8xH1BQ6u8oiMXqDa2qa6lx4cz6codnNSnxj5yvnyJluLOm36gY
         DBEALMvbUSD0SlRQtqdW2ggGfWHQ+4vt55Azdp1PLUdh54hCQlTrNsxSEoCkrAsgoFOO
         s1L+vypDRFmdAfAVu7QFOCtw3MR0e5ixvC0UEHS2dYRITeGWKUMlKy4fflSEtMY6xa6W
         AQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734757; x=1765339557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7juq+nFojneUyWGV1iiTe0acnQ5/jJnXPDq3Sa5NV0=;
        b=p4ldJoWgTbywuPij0rD6NFd0nUGsgYmgdkR39ej6CFjk3Q9AUgfSJRzTio7Brs3iVy
         zk4zNg8pe/owuP3M10gTzhj2Pr8S5lOI4rdLQuFSl4lk2gb84VNFbCLcxW7BD6VlQeIu
         JEYlGnlSZPto2g/u8CCLLtynAua0h8vgA0Jrif4jeaIwIoQrruncOf0FkRf2xqDlXYck
         oulGaeW1S6NMxjYgjifblHoy5bv2sP2yoU5S4hGVsYalLh6nDZxC8iu8A8g+RK33hijF
         ZbKevQ0mE88bhgbeBxgWHS4aw7y5LyhJ723SHKAwMvrDnwQHm6UHiuZmnWdm4JOMGIB3
         jCpA==
X-Forwarded-Encrypted: i=1; AJvYcCWuyBc/G2TdFoKaBwDuTJz6Gx3NIcpdIcmW+whtlNYjUXoYFMCO905YozdlSAiwG7M4HDqDbSbFSMgQvZB/@vger.kernel.org
X-Gm-Message-State: AOJu0YzHTl/99Fhuc5zKEWNZ40VzqWV22Up4AZBbpzNhDaFkOZfG/a5J
	tZ7ffFPZPlmEEGgLL4XM2CJdoozvGOY/wiuVQ/BAQQwCuQ6lFHExTuAhTtcvdXKVWEY=
X-Gm-Gg: ASbGncs12/n6aTWrINvJEje7sWTRWB2j/VW+9k/uDPV8gb7XTeQXd/TR5GNKf4IRSV2
	WKvxtdjb94ZOoL5HWJd3A1Bi9D0h3HqHYpFf3txQW6uN01hhSzG+7y7Q0pj8JHL145X4DMFUjRQ
	2CKRHJaM6p3vjzpq/ER/XwnoZdXglb+vv0ZVMEAY0UDQAHPn6yet1/qBgKY/qoxai34g45tqVRQ
	00OfdSx08xAZsbPCw5/Kb55CmMxfV8s1qs0a6jpS3sPr3IiR0gqBXQIMkT3Zwy10nLFay5ykFbi
	T0t2nZsrnhjylihPXKekF0wpMKmG6p8iIDcde+ymbVk9TQv3BhsBK7F07woqy4/+LHBlyQXGjAY
	zcg+4apnLLPTTTkriAK7G2nfBgiw7EfIYeynLrUVx3hvRQoXBzNciiIkrWmy3qfJlS2JQT7aHcq
	Qo1GV23YM92BmOjlimLQH0K/nt2cU12az7SLkclLDsnxvlyaRVpSFCxg==
X-Google-Smtp-Source: AGHT+IHez6UxKEeGqshs+KN8jSKMIEH6G2gfFkdcufoIAuKX6Xj8dObhL1rRLTptedzYzL85xpm1lQ==
X-Received: by 2002:a05:651c:41c8:b0:37a:407d:632f with SMTP id 38308e7fff4ca-37e66d588b5mr169791fa.4.1764734757271;
        Tue, 02 Dec 2025 20:05:57 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d240981cbsm39505631fa.24.2025.12.02.20.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:05:55 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: sm8550-hdk-rear-camera-card: move camss status property
Date: Wed,  3 Dec 2025 06:05:38 +0200
Message-ID: <20251203040538.71119-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conventionally status property of device tree nodes is the last one in
the list, move it there.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
index 21bfba6a1182..544cec93353a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
@@ -13,10 +13,9 @@
 /plugin/;
 
 &camss {
-	status = "okay";
-
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	status = "okay";
 
 	ports {
 		#address-cells = <1>;
-- 
2.49.0


