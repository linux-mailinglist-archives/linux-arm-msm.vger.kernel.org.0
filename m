Return-Path: <linux-arm-msm+bounces-70337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB65B313C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43EB8BA06C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACED2FC004;
	Fri, 22 Aug 2025 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y14Wo9oF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419612F3C0D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855578; cv=none; b=LgerCPvb6KRU/n0KH9lBgQ4iZOSGqA5xUl/D0oU7uGq3MlIww/BgT3WzSHsZUN1EB7HOOoSiCyxGYM68GiUSLSFpYWy5Y9/m/on8gV2Vn7euP9cc/slGnP/J16yHbhvciQ+jkyyKTn/1UaMs6wxw81nctGyOlh5rwkT2nZR3Vos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855578; c=relaxed/simple;
	bh=MDumoLPRgnG21ddAMdGM7mX8aev/cn1X2NDxfYOafS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6knYODO2jSI3OaMeX1pt9lAD3AcgCZrP+IrwtbThDud99tJ7XcNiN+mNbNplj2iLsZ4i24WPUryGDDt/A+olbDLLbRb9nuoGVhbyiLBd6ml1oVJ2aCnMqxQM+oqlLLG89Qpo1VYYJawt4JJRkP+GfNj4cDGOntuuc5KIilQ06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y14Wo9oF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso13998325e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855571; x=1756460371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIfb8GDKSVhuere/D9IHS19GORsd7FWNJn8vZfvPhkU=;
        b=y14Wo9oFUO0HpP3mKwZfbmxTOqD7SW9X7vrAfx2JLzdcRHMR21RKlmiSvvY33eX+qQ
         njNU7ZEdahfrYJkyj+71qd9xWbVPfbEZX0LkPY/LPEAwvaj67Y0XTvZCODlh+VXztb70
         X+1O6RKb9kC936/Kqudbv5C+/dUD5K+J2RLGPpnABRrlb9iKqH0O7ghwBjjEpNzNAU8/
         NKp2ghqobH4fljSq//NBly1d6rY0hOJHuhudJNKpjEAhgRrxypes6qEiWHM/sZeLpLTy
         kb49DnUHGFij5a48/acvrmqMfEsCVIajxaUAEPac15cJSbMScFsvOasYJaDgv7zTFgYV
         Jrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855571; x=1756460371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIfb8GDKSVhuere/D9IHS19GORsd7FWNJn8vZfvPhkU=;
        b=fc7cW4wG6U4TTeWeEU4BriSCxMIKKb4//tTkaG5qX93QuV7X8NEVlFMLKxc6Z5SEpg
         1GVREl8H5dvrGNbJsi5AgPMhnz44deqS1sBt3roCCCLz0mrVjq0b27ZjIROkQXio8pud
         e/2lHIL+Vm1W4L0vG6qwqLtjafiN5R+YpOH2g8ucARA3Ah6U3/N6rdZSzOpZdcZ4Fo6e
         w7OgEdevsGqi0POkZUmfmXDJmVW+plsNeBJdVmahqRkAUdOJvwchlwGt63N0Upx5D8KF
         pvZmHEuPBZhQ5K3zxPWua/MRlOeGC+huRl4O/optvhePY57nqGLLSGX3NnSZqS+Vy3hV
         5Sgg==
X-Gm-Message-State: AOJu0YwFXYz09gNPTdz/CefmWHImLycImVuueDisyzsLaxRNpYEMNm9I
	S0SaRDzQe6yglXJJcu1KiHjXdPi1Gw9i5B2FFJkL3b5QNkG/hAQmUmgdmzy9GbIl6Gw=
X-Gm-Gg: ASbGnctq0Oz8eV0kT+9egPGvAUAV4Qzoe9LMEIXYfL9a4829g3fA+ItKML6SE0d0bAn
	x1/BlLxJQTkjh7+6iZxMkIm4o1PNC5egke9LL+FdTw+mk7Jn4ClVUAwzORksxYDlKdqhGaXoCsD
	REryIutB/br7QMrm0+YR6VWoSysEZtVQB9B2QCEwMHmbqwS2MciLChRKZKwh14GPJFk/n1OB8YO
	EWVX3Ar5dT63PqzWWC7++1D2B0IT75KnnwgtmsJRa5lUHThBJQXFWDCT15VbXVXQQVDXmE4vcnV
	cg+GkrZnh50fgfwqG4FC+bJSl1QurfSn/ObnzpEgKa3LiaCwlu5LfaeXdBeVamBGPotrEmc2Gc6
	BmFL7VGgUT4ObbyQi4T+rLVbJkCJ482frXKKEohG09XA=
X-Google-Smtp-Source: AGHT+IFoKTLOYhDt3PTl/n+f3CKcuSmeM7jGgZBUkdVz5yVzfkToUJoani4v20jH4Z0DfCXTMeNwgA==
X-Received: by 2002:a05:600c:1f83:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-45b517ad803mr18321795e9.10.1755855571005;
        Fri, 22 Aug 2025 02:39:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:26 +0200
Subject: [PATCH v2 14/16] arm64: dts: qcom: x1e80100-qcp: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-14-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MDumoLPRgnG21ddAMdGM7mX8aev/cn1X2NDxfYOafS8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrHH8gYUWgjyRxXWAlc6NwOQsNikN5CjyJHHJRj
 7mO8T0qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6xwAKCRB33NvayMhJ0firEA
 CXlBw2+sjPbfJ9AE+u0gkBdyA3eAslnWVP68kQjIjX8ZEtJLGBZDs8qYEdycWKOVoTXz6TLF0BtX+U
 oQoPqB9Dv15OGheveKI+7Ek5Z9AOcwUBpzPxPIMyjsewA9w2nogyQgXYJRUfdkUaviGvnluphV62X0
 QTfB3hB1UWpPHjTiK5sqtBiN/+y4dIMl7gT68E+C0sajHEeftZUzfhuSvDQRhkf46KnZueJ3+Lwm75
 prTEnYqtt4v56nRKF9hnYtRYtmkgvFAxmwyqNf1rvJUrQVodi2RClyFACCC7P8yQg4L9hZC/AmunWE
 eLC5Yhqp47wqdt8yHCYjfeiv4I8R0nEJUYtebjPeNrE7F2f78VDUlJQy/mvJRv0wW6TU/HlIxxQ/v6
 0csKQno6gKkIeEsO/uo+SeKiHWGHQMX+gfJ/M50stQtk95419IeUmBGhOErOktmtqGbyA26+b0yFMJ
 HPh+XnWzoHzodi9ddCbdgWGqI5JGwDuYFTtPbpw3onSHVVJqXKoEbtwuMuL+EFZHv+AuDonLzdQj4o
 6iXIv4zPVd70fTY5woWHH5PJT9nRnPu438nx2Eg/D3DGjAYWyJlQJQyjVjBs+k5Hr/ksYerK8JJ3JF
 Okz0MkFlU3A9SwTBimiOwDeJcZleu5lzXTbyEdagDS3pqq/J/U1bsTrwNaXg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9369b76c668b5c008fefd85d5ca18e87ab9ce93f..60a0318b696abd8748f42f1e53597fa710df6f7c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -890,7 +890,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -899,7 +899,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -908,7 +908,7 @@ &mdss_dp2 {
 };
 
 &mdss_dp2_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


