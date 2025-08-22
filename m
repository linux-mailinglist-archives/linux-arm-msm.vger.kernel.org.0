Return-Path: <linux-arm-msm+bounces-70438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FBB31FF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 18:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22DDAA282E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 15:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C106254AE1;
	Fri, 22 Aug 2025 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6zFiOSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D560A202F93
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755878222; cv=none; b=kNai6RcoWhhpqFI0L+YVPmEN3fYwGFZaaD5EweTREbMYzsLxQLrn8dX8X+2o5L3D0eAMKy7r38Zpf9mVHKmr1JJEK5+T6INaCoyYh0sShrknrrLBBHVoez2ATLYaRITozj+ZZ2Ete3GCcmq8+1wTSrx2TmYOq6VDmOSoSuTtWPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755878222; c=relaxed/simple;
	bh=rr71+BBtnhxoI0vp1gh26EB5RHubOusDekfjzEuTCME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YbWeMnKxlpoAh8VXzCiNTTRp2taNB+mUR7kv4Zf33f9gH5zv8eE3xScGkuwLBDH5OfKEu4QP31KF27zPr90IpFesApI8UCgxTzTfhEz3ruE2YsPdrEcieYIcrx9CMEuX94wuEsjxdZhcxgqlCuIzoFnq/AGIMxojsmvPoD68cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f6zFiOSw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a286135c8so16734115e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755878219; x=1756483019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8BLkvgVSbp7ucpmwzFe6L0udmC1CeuwZxTZJh2EA+8=;
        b=f6zFiOSwsZ46ZqvO4yZhBMZU5pBJSsH6auQJgrZM7HK5vp7NIcYY+ir+k0KMhEFBTS
         xHAnD+PtcKjtRUER8TLznyT4NnRcLjr5iLJsz39BGs1c5vHTpU+J6NL3m6qFQ9DtGQ1+
         D9hU7dNe/qmyWT+VY0NGNI2cYnavvXe8CMcDmYnC32tdWD46fiduJp64uStOVnewaOCM
         W4jrcNy2bIJCPV+S6monKdbFsTWy5ge9pSEXYoYUy0h+9Zup5MvGQ1y3me8VhEy5ToOB
         GD1zYf8w07Wut3yN8mVKd40tOo+P0R7knsrftnpc2StEcT1FXzN8OeA5aaxB4PkSDrE3
         GRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755878219; x=1756483019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8BLkvgVSbp7ucpmwzFe6L0udmC1CeuwZxTZJh2EA+8=;
        b=BwLWXXI2/K6aCLJ4A7rR0p4NDZhDRGyt2oAliFmerG1VAev404NW4p+IElgkFjoH6q
         DvC2bQs7+zpyaR1U9lELAHLPyIBItqlgKtv+0nu4pKwr707ZI3Wdj1yOe2D46dhJjlz3
         eAjJ267pUJ+MuQvWUC6mnnXtmYVSlyOW568FZRm4r+jVwue2P/PBD+PJnDrII52fw8kI
         lTrSCbnABzS0E0z0HOkQAwvfaLM3I7J2HytVfmHF0lt1s8agMM6/G/kGL26oxr0sUDKH
         iOxt+M83HVszYmLRNOAbNjbqkASoG+b79Ojrc30P4hCh1chgivJUE1D+Jj8WkiSlLFza
         P1Bw==
X-Gm-Message-State: AOJu0YxYDBos1V+5BXPKC6jewygYgapycStcVr6ooQBAKunv/Lj0NXgk
	UjwVnJHhsFZO3wvEg14amPViQSewp3vLXrZEmIxGUEE48OfQTKxKr6oAydDoRnUXFM4=
X-Gm-Gg: ASbGncv1ij9Q3o3Ft8gXEdz3eEWMYs0t5EwpaHuDDw/SnawiOfQhE5TlJRsQEizWgze
	bLmIjvpO3KOvEN04Sj7/I6golXGWx1xbiy2VYXdIuQ94Npih/hB7oAh5OsV8i4oHbX4GCLL5mMe
	vDxEAeFjHzDJPSHTwX4NBI5BYPRUhHa24uiXYAT/dkWEfdRF4uofR5a0pAGIl95fsBUCeFLYCF3
	cysA+hJiB96mXhWDSSlON/iWrDRb6Llat2cZO8bcnx4aw/UU4bJcjZUGRB3AOS2kV6PKrTT/0TT
	5EYnGgdQbuT7x9ctjiwh/olfsSBU17XxlL3jwPVlrSaV6bnPKNK+8W7CQFXtLVx/C6csciHzvwT
	FGf0jLfEiSjE7pv+7BCBXf+NteOUKuvW4P6CIOJVqYxN5FrXNitQ2nQ==
X-Google-Smtp-Source: AGHT+IHAILKrrhMvJu48FiWHPRG8716NLCNwe3tEtNvBbBHTI+z2zVqFWz27jthYBBeiNsEZWQPBWA==
X-Received: by 2002:a05:6000:22c1:b0:3b5:e6bf:f86b with SMTP id ffacd0b85a97d-3c4af1eac36mr6361861f8f.11.1755878218965;
        Fri, 22 Aug 2025 08:56:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c3c89cd4d4sm10095765f8f.42.2025.08.22.08.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:56:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 17:56:51 +0200
Subject: [PATCH v3 3/9] arm64: dts: qcom: x1e80100: allow mode-switch
 events to reach the QMP Combo PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v3-3-5363acad9e32@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rr71+BBtnhxoI0vp1gh26EB5RHubOusDekfjzEuTCME=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqJNFbUhzX06708ww/e/e6JH9cTNeaP3B2cc3BJ/E
 XhddW3CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKiTRQAKCRB33NvayMhJ0QmGD/
 9pLmigNnG9TysBzzxMStx2SNu+d5YJGoNHS18cGAveMXZlfKm2pQoIaqdHcKupxBIxaADkeCBcm7sf
 r2bnFdKAZgIm1TiFAP0/KQGjGpgxibBD6DrE0las0M0ic58hxM1WchpupU2Qucp9IQYytijbyC/INa
 nb37R2ufDMcL/AbrjN8NNSh2NaSEvsFufzS4bHah8GSOFlw4vdbXn3vXwYbdx4CTnEfQC0/1ysveH+
 F/LQuzCy+sJI97yWdgzUDRJOMpk5cfr19ipZgAPGa2cLzfAFEhPXlLbxalLUrcbH1dq9tWIjsUBcit
 JtBbZ/1v3y5u/MWUPmdOKC9WzBqstqRhugcQaYufAkvssyvgVDfHcTve7OEkRwGHm2Adv/femssUBx
 f4vyszXIFIQcX9a+FFNizuIWZS8tIDLogbw1idn4l5TiKuYF3ofTRiv630GcZrdJxxC8hR4Ehs6rns
 lI6EiCUi4m4yK5UZ7pAHZNFSZCn6VE+fbIab1aV6MfkcP2vsvAeXDC/ss9jV/Mzt40VXZ6L6xkoWYT
 JLwRVTYQniXZMyLFbMkw1hg3dFbhoMwcndCXU/AhElw8X2evyB4m/Hymt3kzzEvsYiDSALnfmMBDoP
 Y5jgslHU/v0CJ+B9e319bKZdD0H2/UAVDf+4Ec8n8PzLryyq/e27MOczo/EA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow mode-switch events to reach the QMP Combo PHYs to support
setting the QMP Combo PHY in DP 4Lanes Altmode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f293b13ecc0ce426661187ac793f147d12434fcb..48c715e9ada33d4909049bca28c68a6b24ca0b0a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2857,6 +2857,7 @@ usb_1_ss0_qmpphy: phy@fd5000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -2927,6 +2928,7 @@ usb_1_ss1_qmpphy: phy@fda000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -2997,6 +2999,7 @@ usb_1_ss2_qmpphy: phy@fdf000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";

-- 
2.34.1


