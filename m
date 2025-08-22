Return-Path: <linux-arm-msm+bounces-70336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCCB3140B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A6885C592B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616882F549F;
	Fri, 22 Aug 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VeQ7zF8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8722B2F3C38
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855578; cv=none; b=SY0lFGODGYZ3Wusv9BZgay0JHFpt3DDHyDgDFCzwEEsUsku+9dTDF7cth7DcWj9ncaJMhKE4TwFaUA0jOilur3bTqKvsiBMQTlOj6qs1i+M+/rBAbPk/o8jtgjLhUj5LRKVtveLi5chB77UEec1gPaBhvJotoa70yLbTS098g2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855578; c=relaxed/simple;
	bh=wmzjNwtbPDzXn5IM5fkxNWkDbiWg7Ro64u8oJeeFyCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uN0seVCJFOsaoX0C/LYzHVBvG3l6lWIsAtn2LltJ66DhGTPw4/4Cj5STiBg62X68taoETExexTycPnCSCrWAnd0oQMeDodGSAgn5mZScKtEUcGl+7Mmb/cOM9mPoGs15hhQRbikaang0Su+1h4houNXglZyluqSdB3OCszQzYwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VeQ7zF8E; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so15564385e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855572; x=1756460372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEmuIeZ6/IYxSE+UTu+gLu2eWH1NxivZBlqnLHRbiqg=;
        b=VeQ7zF8EGqRgbdF6irFo6btQhB/oV+ex+cwtH35JJH8BiIcihbZJQ1NlWlp0ULZeu4
         2C8wvH06F8hmaDI5x2+TEOQrULXuZq4mvlXTgHTTjCajWCjixkA3FEiS9nR6+5Hg0WkR
         QVr2kzrMbpsfOywyHPHCGJKbd5XsTTbveu4VwdNF2OoqbuN4ybwY6oy7L0YmgE9Sedsl
         lSJAOXsPfzRuWE2m0yFN6OeJFJAjkex/vunFkNpCTk8zcbICi5UfgZEZ9gm1sf+JeHS9
         gxSJUfFlAqUhZEnW5hQTSFigIEfhWaUdJjz1N9MNXZsPE3BiJxtBys/Zq6p8643JLiJl
         NFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855572; x=1756460372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEmuIeZ6/IYxSE+UTu+gLu2eWH1NxivZBlqnLHRbiqg=;
        b=O3mDlvnRA0o5Pg+fIsRDFl7FyVyGIn1u4eFK7nw/IlpoXibHbxtvl1hyOQiH8FMimM
         h2DVl9HWnpaCXkJCTdNipKZyGAo4E77Hid/SgfVUwzqbbqilijbqA9gbi8VMWmmF9ZLy
         3ljW04NmOJzH9HXGFbXGl73U/T5ywYSBfcX6c8wAh3Nb1KcoY1SlaS6O5tu3CWvhwpkX
         PXTrt/1npPOEyNrCXL6UqyMvFVTwfx875gq8uRbzQOJME22xeYcl/Q+ZDAieBhCpFmsS
         rom0+i04TKLDSawD6YnR8peZipnitXPAacdDjBCFrD3lUtDhSTURZwY770dibKO00gCU
         JmJg==
X-Gm-Message-State: AOJu0YwQVZDjkLbmyU4ainP1x0UNQCHEZXMzewZpkxnSY40GXnP8nyk3
	ezsC5+OSM+BeyFfb5V/0bzyIVUSbzrVduQ5TZAYafyfHA7DyGFlYORj1lxz7I/2mIe0=
X-Gm-Gg: ASbGncsxZrThgUCD4p60i/w8fqNvffEYx36qFI6kTSzbMQQ2BjkcvYiUkXVFTm9yBCY
	eNdOVVrVbob7Vo7pllJ/W8EzWReVxOwpsx0HK3vbgfE8kveebt5LuEXAMjBn30PlgaRJFFxDyL8
	qWzA5ajrgh4hkyCJbwwrjMIzbqkRZOR7ov7Ek2lq5rX7dApuQ6ruliA2GprSgiO4+TEA8eEApYL
	4gdwVwC8rnpbGdDPp+WxoOm3FSt1zIbyJel38q4wIqoKJuF8uxbTQVYL+W8eZ+ZHPFvMJo/PWZ8
	4M3vrqvtJZHDE8rxwx2bDobmbiqk5/xqrNGQY2S3oD8EiICiwnROKEmsnjHlfN3i1YdxZ7xa7nh
	VVK2Mm1Fmw9/OwK+2qcBnMit1t4Zc4hw1ssXQhEhvwvQ=
X-Google-Smtp-Source: AGHT+IEmrBiVDce5dK/MsX7hfYeONFYrVzdXczwtf7nMkkeCrNPFnghFaxiCcJKrmU7onQmjZthwmQ==
X-Received: by 2002:a05:600c:a48:b0:455:f59e:fdaa with SMTP id 5b1f17b1804b1-45b517c5db5mr17236495e9.21.1755855571660;
        Fri, 22 Aug 2025 02:39:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:27 +0200
Subject: [PATCH v2 15/16] arm64: dts: qcom: x1-crd: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-15-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wmzjNwtbPDzXn5IM5fkxNWkDbiWg7Ro64u8oJeeFyCQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrHIj+bd0PdFS3o5YiDImXzNPSjyNfdgAd+kyQV
 Dw38ReOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6xwAKCRB33NvayMhJ0SCeEA
 Cn9I663Wx6DrgMa10V1maK/X15rx3p9u14jmoUdV9KXRjtdwNEZPnxHn7PLQ87AlluvZj5VW4iJIAI
 CYbOMmA4BIEDXY0qluGwFRUbtNrbKr00swq+/YKTjVGGVI1MxRwvoAILvbLsdVQJyqFU6SeveCip+o
 gUT5OUCVhskKSwVtl/hcvPfRGHaZTCxUZZBA/uJpGW9jyoq0CMQL8e/pc0HuCiaNjptbLaUYo1SBzL
 YRvU5pJB/+J16NwyfTfwHuVxDLuXzWsdywBgnSxyNsDs9i2cN1eTaYGjZyaislaYOQ6CvCsqxAg7A0
 Xczf4EktsT6tuvN6Ehj5t6kmtjUHzcERN1+bwrjCKx0RwwdknSChUNPIvK2ctmujYlw+w4DYzcYCBY
 qJF+4cMvRK41Ed4XmJTGp4bxwos5v8Kd/o+zoqxxrh3Eu7/9ZchEoYn4jMModf9GkvJe4reM4oLNya
 37PStR0uWQm4J6oK3bxY7eCW12xCYVQLd7X2n1ZYdEYVIEuuYE/YnS/g6fBWTyOPjVwcmfiJIZwyCJ
 e3BxfXhKRkx1ZmslXpzyinGKr5G3vcY/DImwT5yVh3mNkWKZmnY9kAcocBLVqCDN7JFT9D+pkncV6c
 9HVHiluG8aJ6ZApN8bQddltiIWSXPPtp7/Vo+jzdqNuQKDTd4TTYKp+4tq7g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index e3d2fc342bd184473b37882f3bc4f9c4d23135bd..ba8a2308714a45ecfa3a0fa0f5b213d9fc136d0d 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1149,7 +1149,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1158,7 +1158,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1167,7 +1167,7 @@ &mdss_dp2 {
 };
 
 &mdss_dp2_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


