Return-Path: <linux-arm-msm+bounces-70338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19DB3140E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90F18B03991
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5DB2FC011;
	Fri, 22 Aug 2025 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9lRCpnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D492F3C39
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855579; cv=none; b=P/bjVWUyGsQuKxdhK6a1goNBvKdaIJmnhMBCvRuKgooM5MY9vP1khRW0eRXwbn3DAzFqVXLSQ+Zv688OgEorspHJo3FWJ1Si1BTyf8OEX4WunE92nywgodwTrHG2ZtTgNOgoZ55eKadq5LuEk5yPzLyFY/PWP0cnx2jBLg1g/fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855579; c=relaxed/simple;
	bh=5ko4i4L9tA8qVtd54b2E1E9lIKYVWTon4MYsfOsVvK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRMd5Ux6YfiRamfbWxF9oItwTNHL6gq+XtjLq7pO2uVep8zUzPc1sApdb6layTlIMSjAmWi2fRvDnkvz8tETPgrP8YG7nXPmryB9E7PQturU5ioe546nu5Sy3qoLCiUz72etEHcxmnbIdZ73URl6q/6p7C7BEfjC/vuiZ41/bI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g9lRCpnS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b916fda762so1307792f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855572; x=1756460372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5nP/yrQ50t33Iy9TEWN0uWVEKysr4CKr2N4UpsQQsM=;
        b=g9lRCpnSA/yPfhmjatxY352YyW4Arpc04Ec1wAalOyVruBO4EoJ5iZkU+hzo4uPlwv
         62zExCAY69CcWVZJFk/JurA2eBSN6J235mLwVLKB60IwSDHzml9da/nnaPutotUb2JcT
         KKDZsSKsdQ/JfSW5HAqK/2/LWgV8YgnR2OifQxsh+uiOxvmQQlxkNMXnwOt5nouZvIz0
         b+1/rNhahJ8zvaIwF29B+pb2eEnCUy7qy2l51eEZ40L6xvbHGU9oy0to4gjN0wR0Z+p3
         Fv6QY9bC3ObJPA/lVXLPXV8Bj9MPOXrC/E7fGuInqK0NjHvxkFcc/G2tmqL3y1A95gN0
         tiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855572; x=1756460372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5nP/yrQ50t33Iy9TEWN0uWVEKysr4CKr2N4UpsQQsM=;
        b=SQUqG0mspKFpMYZcboK68uzaxTlIqJu32VRghLeS1UpBYFz9hpEzbYuMcksSQ9wgLM
         JUpiX+MNHC8zvRcQkDjb3Kc4yQ54hsIjzBy32vVFG4N70Rh86SsxwnOBNULiqfX5Aiop
         KgFTD8Q8piclEWmeiFLOHt5OQt87XQKoiGGlPOo1Li5nsUEBMPiB8pm+f8cvLqjq2CcC
         ocXAkoEX8EML1Ix0/O2nQBnAmX1LL9vOrzEj985yBYybVG3UaH/7Xn+p31BdfdRMG4OJ
         qTJH8252Rlk7rg2g89dc0vYSaDsEMT9xeXa/EIDvCb6A1FX/9kGqS8xEjDfDJyvReJRR
         YHqQ==
X-Gm-Message-State: AOJu0YwA60Dk/OSWtAvEP2If+OEpx6yLBi+XC9K9S4FdEOeTHTjZPhQ/
	pHRo+sa9ea3LDaTQ+xkO9cVKN7H8MWzLEt0QklejiZWOC8JNyPp8MvbUHS0ZCwQ0MuE=
X-Gm-Gg: ASbGncsFHfo5w1OfVLrrWpV9ooWhILxVZyQ9ggqVXGXQzYMlrVZho1bbxZ4P8mIpp+J
	+mUXi4/d0Cm9fbe9QLh3y8zskdEimDexOHlNhDKEiiHxPXq7b0E7oAGyegKzsgjiNtCzfmDYfni
	kCc97my3FRPFO9Fu1dudrJBmXmqAwPj6bvdexi9Lqs8exF61wnTPVln9kWrTk+03uzpIZZkxDLB
	2j5NZA4f5hl5zWcZk2zHqqezmQwUf3SgXzITtVHDlWKeWhtkoR8XT+Kdzw2l/CNMzueDCu0nuxe
	dMJ9/hujBuAA1P5Yr3iUP8VyfxmWI/yu7zrDs4w1OmnmcHtsF4h+IO6RyAFtlxJvM8ogXg459Tw
	SWfxxqHaS9FlgUd1dE/d4gsIsgG58jAN6/O7sB9cH6is=
X-Google-Smtp-Source: AGHT+IEU0ZUZLyLdx2+COkkvlLe7/dUlq5SYoy/50RXWriFyXY4/HDi/2kJhLbJPizYCI0PL6F6uFg==
X-Received: by 2002:a05:6000:2481:b0:3b4:9ade:4e8a with SMTP id ffacd0b85a97d-3c5d4806aecmr1800904f8f.21.1755855572323;
        Fri, 22 Aug 2025 02:39:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:28 +0200
Subject: [PATCH v2 16/16] arm64: dts: qcom: x1-asus-zenbook-a14: Set up
 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-16-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5ko4i4L9tA8qVtd54b2E1E9lIKYVWTon4MYsfOsVvK8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrIXGgP2D4oSjjrI9UcNQFgc47mx0ehtbx5VSjV
 WmgsdWWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6yAAKCRB33NvayMhJ0WVRD/
 9gFM6gcQF4jbIYLwAGLmD/wkor19gBmDRUf6jpl3v6MN3lFzeQE4S8TI4n9O80DdtL61qQNlTOI5Cm
 1W+LzIvnDFC6yU43tbaQfWGHMV7bTVLC4VmzZ+xzCzgIcKO4cscDdLPmpeDvmzS1VmgJRjNHbHX3cy
 Hjvlqb8qp/DOWkzHXNQA3INGfFykMg3cn24TGxiYpeEec2MLMYbDs7cvNzhMxRtOHqHmGGn03fBZE5
 CnbkKpSFijhpvz6zea2UFmzZPChJGsbKWxzqW56F7YtCsuPSAEz2vsYCcjsOetEIEF2xCC6vq8YSj1
 Sq3L3L58cRoh2kj/ap9rqRgQU4s4/UZvfyStNeEayq2JGc7vpAqhE5r5/n0ihwKrfmaHIvHt0peHpO
 MyAInWMh6RHtQkDhud4px2ciIRH4DKGFeJ5jIraL+d/5V7ag0fowgN4iNEl1FvtB/eW4Fx817E89Hv
 6HMq0MpxTsH5h/umJaQd1hB/jPzaHOMstH+sqKmzmU558DN/0P0yF2pUnG6NKPThd9R4B6m+RRGMUG
 8tjjCTziEbEWwbMR7OAXyoHJZTNv3T4+ZES8q5AoqriRu8PBl13JnLhEboeeAxZ7hvEzs1FNGhiLFR
 oYDV9CZ4lM7UTgZvUIJ/6HxaHfT5hMOs+t86JubErXxGM/GxShLD8Rn+0QWA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 16d045cf64c08c02c420787e000f4f45cfc2c6ff..14045f91393fa91b2e78802dfc53bcbe2c7d514c 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -985,7 +985,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -994,7 +994,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


