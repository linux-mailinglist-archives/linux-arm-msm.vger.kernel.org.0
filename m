Return-Path: <linux-arm-msm+bounces-70180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51983B2FB04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 845C31BC0A31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0136334DCD1;
	Thu, 21 Aug 2025 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HTuTfv4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB23469E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783460; cv=none; b=gweoISBIpQKS6ZhHT1FXY29QPRjxbActWxm7lZ3AN1M1jNPp/k+gD2e38Q46QlNdyPF4wzvnYkAK61wQeAobGrqvFK1teQ1rSEtY+xwAs/lKYLSPYf+wL04NZArbDmWbLm0xcVVO0Oj4CkZKIQdXTxt/TdOcqdz/Yg6a5k1D8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783460; c=relaxed/simple;
	bh=CBHmMHHtxlm10+qeAMc8aYam3qMzlCk22/bbwKvrU/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qN/QZ7mImtBYidyllTAB6xyHIVGm/VucGKrqrNG1XJZQOcx/IRunaLzJtlq/aLDW7ulq1fQC+y36RZq7a/QZtgNBPgtSVnX4zAjFU5TEW/w0khX2hBQ310i4JyBob6rmAgK2jt58SCaYfCkUh2r55JbFF1QMBQ6bKd7Y+SxbSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HTuTfv4a; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso769934f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783457; x=1756388257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wtFtCOZAL2gp20b+62S3Bdf9VL3D2oi1QDgtuJyRDc=;
        b=HTuTfv4aYuoiKCF7QFp6APO4jjWv8C0iGerOsBbMUKfNPsftYpoy5Rv5CsA7L6kHBZ
         I67a8OoxBcrkF2NTiZq0y3sXHw+EHiQHNl2/RbOWzjuMYyoqISf7OTeKeFrvn3KbuC4k
         reHh3oycEblp1rJuUlEZ0Zek2mNcS8NZT7+znnllHNS9FFUYSbzhtaHSjTdHywL78kjB
         DyuksBuKYmeafhDb0oPD6iOq16BVHFg2sjRYFZa7wD4iQmRwL0BxPmNCTsPtPqdJjhYU
         qeBloqm1iC8VBm2IwbB4FQWGFxB/gbIem/6yDvB6xLC//jYBGslJxc8iMZo6ix7Z9Te5
         +pyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783457; x=1756388257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wtFtCOZAL2gp20b+62S3Bdf9VL3D2oi1QDgtuJyRDc=;
        b=flT+8sJKpMyE0ihsXCppokYOK5oB4wlbtRGEuhyz1hr+RkvG+rTtkp1idXYtFTKuD/
         OPgMTZIaTYaQ51t+teGHUtInP/z+Rb7cDD489KPwWkTbT8mncWY09buxL0/Uk1eX7Oj6
         jVjurmYVMDHYnrUZQFYGNCB6oq3gOQq9nxM31CUiJrDKbRGjdth4tpJiQR9YXy6b4328
         v27gYxKpirYvR7jSzYA6AF7VpmhoHEgEvQ7tsPIGg9g/7NkyGBzCFz62KoQbqYA5VXUt
         FLd2D3to6r/31EvrLsaZ4QG0C4bdVbMMMTd+WYIUWSU6o3O1TOmTtYIS/VNI+53cuteL
         fQxA==
X-Gm-Message-State: AOJu0Yz+wXzDWl5Ks8WVd0Ach3fit4yBLAFZ48VKWexPopkIJ6qvvE9T
	2ecjUEciIRqMXPzNU3xg7foVS+E5zQgx0fHCkUpkM4fljYzAUp6QPHN0cIocF3ph6Fo=
X-Gm-Gg: ASbGncswVr/QKDEotNMgKk4EH4nPB0RC5tYBmjrOqy7EvinMTrDFAUb3P4zmLHfLcc+
	H9SODUX9F6XHSSlnMHsU91pl2jzcCD/Mjxg0CkU7Mkakh+YUYYigDfvItxThYPYVua+nOehkV8f
	yOBAFrYzf/9VQK1kJc4yxlzjC0R8mNSbVVf3XcCqE+Ku+L4Pw55rTpJq1oXQQFE+TcbNEaRMCca
	b/TeaspSL2npojV9TgmqUIaIv6DB70n3lXuzQ2kIN1rPIv/4Q/4tbytQ4gYYKQC5bmqbJpJHoyj
	Kx3X8MRZuyj0Vha+DCDrkERIIMR8c/n0TqwhuV/XXyvYyirsSKX4BLil9dQenfI6B1CWw4DSDnY
	luxEwOXnnNvY3A22GyYjUkTX8xpPaT65WLCnTBf1tFTg=
X-Google-Smtp-Source: AGHT+IEy3el9dJ6T0DOmLFIF1DS7krS8sHRU2HPR3XquNbvcEO8/WCjXHebCzaRTbLThFau/+7Qbfw==
X-Received: by 2002:a05:6000:2c0e:b0:3c3:ae31:7189 with SMTP id ffacd0b85a97d-3c496f92d65mr1680240f8f.30.1755783456842;
        Thu, 21 Aug 2025 06:37:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:37:25 +0200
Subject: [PATCH 06/14] arm64: dts: qcom: sm8650-hdk: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-4lanes-v1-6-0b1a0d093cd5@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CBHmMHHtxlm10+qeAMc8aYam3qMzlCk22/bbwKvrU/Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEY7+kEh2F/gI63IFBpyGRw0jK386+oe1ZgDyRp
 n2S4b/uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchGAAKCRB33NvayMhJ0el6EA
 CSG3PPSjObo/BDCu7kBBD1blql+NMchwlsxrrPQ6IausuRpPfPht+qcQ232xPmejhpdBIckZmIjqcZ
 Uuk/RLkBB2vZaPElNgMqOaW4ETvpsmyGMRHwV0zf5xLuWW/8X0LEcbz61KRwLO2YNoPUZttTO4LBe/
 LdOXKslWGG/kvWVXwRUfy9s2W2elESOiQbYicuhV1MfMhRBglDeNrzOTGp/F2uiW0wxT/MjzA/mN04
 /iT9K1pUhRINB22SHBFtZoCifhHlgnTj31eSesWTDgqwle+ggoiheSa1aINuVL1GmPiiboGrFM39sR
 NppwgBq1kMQd3NlYbJ/TwDmP53g2EsjBZ+kqKPqArGaTywujl7cMifDG0iOSspMkSf596eOb5Slskw
 V/pd/vdXfT1esvre5smfjU8n9X0zxk8MtmLyBNiJmCtBwLjy05a7+gth+onA6WGhUFiaNGRtSwmTjU
 iRTKiiPko8HGWqaERtDkCVw28+e+goDUzJiGcgqZ8OW2VYYK3zBBsGp9wAVHTG2lT0eoMnZZvNstFO
 sGUdGUmP3mNs14DRxU5SOVvVFta+8HlThH7KcFAY0ytv1Lk0y0iXD/rHTwptL0pLXXjAKeO/NY9X30
 OszhzEQ8wXvgjKwKLwVGTtZHgerVyzSp0m/dwhc8SIUOoP6E9QzE6+r26Xww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index a00da76a60620b998973cab189f12eeaa0a448fa..5029c8bfec5921074ae6e1171bc3685ed9407278 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -942,7 +942,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pcie0 {

-- 
2.34.1


