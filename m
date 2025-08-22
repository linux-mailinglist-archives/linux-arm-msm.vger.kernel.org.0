Return-Path: <linux-arm-msm+bounces-70300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC104B3131C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9F09606D80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127042EF657;
	Fri, 22 Aug 2025 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkDTW1Yv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4852EF653
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854808; cv=none; b=nwpH3VTiNGZ7ySPnshmKWT0W2RNEhW/JwZ5eES1dSBY+xi7BK2q05daQ5edTw1T3+VHwONhyMIMFzr6bMx5d3QRIndZQKTJ+iiX1Z+ZXq+CmljozAmbnlelYnVpKRugeYURyl26nCoiZFwX9fSYtZMdg8kzv0EoNpQRnV2lCys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854808; c=relaxed/simple;
	bh=wo+28rzLb9E7nLBgQRSXIPSdalCHv6JNOeyFv5zLcqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6GlYBjVgWOIeUKEIRyX3J52TxKPsrzIf1F9n4tjC4TAybADYsGmUGEcal9Oai6tbKbtXLu3ID4Cl9tMbhIkK4ZGQMgK618zoTudV721NH1/tcCJdQW0L78p3RXgQReOek5rccNWXtLzFqV+/58Ly86ZHC9kJ3Q5rcPoD13UW5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkDTW1Yv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9e4193083so1466832f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854804; x=1756459604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4iYMHLc4WfPh2tAiIuQ5o+Q2It/ACAsF7CETw+1bqM=;
        b=bkDTW1YvcK29cGzpP55tDFOXzUvgae+IgN0QGSwmRKMwel1L8ABecAuMgylvqy9K8C
         GTUWnd87XgNxp8X8zp3FnUVe4tQAsP5FG8Mvl4jauqnXNSWy2cSQ4T+tB4y6X1Lezjmd
         Cn+tpA7yQpUQnCiOlreLaXhiFYJ0AZwMlfOUow/iJtCifnH7jsANDQ3/lyQczASWe4uH
         ysKdlZrw7cStzc6xSb50azZGqpEAkCi+Z5zU1njvXAKHjb8SIC1oe1pg3KrIERnWgAhA
         aYjdI50YjMda9isvPTGpv0JgCcKRECcO6jtDE6qU8uVceUKc0Jpcj0cjI9uCypK7Sg5D
         A0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854804; x=1756459604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4iYMHLc4WfPh2tAiIuQ5o+Q2It/ACAsF7CETw+1bqM=;
        b=GzfBcutGVWYNpYkZsYqgYYcvst3Upp+YV0eceVeSksewbN9U05mPvnMXZfmAVfLM1v
         KvSFe2AIJcItH1bYzTopSUuFu3PP7UNjt2I6U5rbk7Qz6GqmbhveRlqn83TX3PKfTfvx
         DBamLDEUwsW19NKtK0d8IZP43FTtYVDu5gszNmLc8IgzfVn0BBNSzMFGyNB/NPdYmNUo
         K9at0Swg14e1e0py8b9npktHESLniABwHg15Nuv+Q63jXUQcqvYpbohc6ueCPpYAeqjt
         jqXDcBadAfkAU71chhPBcTPjsjD1K83WxdkxvVb9HuApEBsAUjib49SELs9+pba5GrDq
         AM4Q==
X-Gm-Message-State: AOJu0Yzpxofuv6YbSrl/ns+9nozqFOgQqBC4ZduvOoWHfRbzNqasquXF
	m3caFvMOcY0yw9GAZ/IkTbmtYf9CCScC+gQOIw+OQgSKZww24Zjk3j/lcQpp2NfLngQ=
X-Gm-Gg: ASbGnctTsYsapFMIS8/jz21KTQ8DguUc+NmVJT9tp2DZVq8DB0jhx6216U/3+Bdmqti
	eAE9pboBHtLKgla7u2v6u+rmGfRcTpS9CVRGe6w4sp7E3x/GOFG5Jh+ocEmTsZKqg+dJ4cyyXJL
	VPK7c7lTEL+r6p3f0VtKFSaY18EKr8Zt2Rn3h8ohw6mPq2buhqNWWuI8Rk340BFh8YU+ms8OOSI
	CzrUzm71BQE9qS1naWTXO4zhbkbEdMsC8+y0Wd+GhmKsPZywBfCeFShSNmeH9AgA6W86mb3GZ8W
	ORmJnB2CmmtSubYFCfx8R6sqruQALX5RUGiYU9FZIz6o9kkwTdiSZpEHw+nueEU27PP++PJqpVY
	Tl1VQAm377HcljlzwA6LlFKNEOqlZLgkJy5F2MGTgiUkTUmvLL4MgbQ==
X-Google-Smtp-Source: AGHT+IHWimNmhX2D+e0rAbr+oUyeChnSAW/pbGvbaUpaR6zi2utB6mY/Z10H3CaZcm5CXc2OFCrfew==
X-Received: by 2002:a5d:5f4b:0:b0:3b7:7563:9d59 with SMTP id ffacd0b85a97d-3c5dceff114mr1593265f8f.57.1755854804453;
        Fri, 22 Aug 2025 02:26:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c5826751d5sm3297007f8f.14.2025.08.22.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:26:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:26:38 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8650: Additionally manage MXC
 power domain in camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v2-6-28f35728a146@linaro.org>
References: <20250822-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v2-0-28f35728a146@linaro.org>
In-Reply-To: <20250822-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v2-0-28f35728a146@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZndUBUupjU+OOdgcN5TmqiL/eMh2uIr1+LmbccinqKg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDfOCJnAzwaebLAVtkSCcABycmAsCAfOcMDIVLyn
 YLAXinaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg3zgAKCRB33NvayMhJ0bqbEA
 CsT1D9Ow705PLEPkKSK32uNTf42QVbKH3pGRSRr3VOTfhNZCRpnnkRh1+1FoCjLI3ZGjG+RmZmrO0Q
 qvi/McXqk0bXsnKLoVnE5+uHivcz/qSlb7iRG/FkBMdqHjbNI+vlHIiKlB7l3sEZSWV5/3RGnXExdA
 fGwgEXVqitPMcRXA75S1EtBJl0E+8j1zL+wwmjYAgf7Cu6qT+KRgGk7ZvMv2YE9HodC743cEZxWuGg
 g6wnYm3gHXBBN175LvSn91VhNrb+UgbvtLT/LQBOxo3KKEFVgYth2qJj9rG1AkHhpX3LpksdlRquxe
 U7cklzUA64WnqwxZ95lv3gksSUK+kh/A+dGhwKKpZF9Q4YFi+FoTRKqnYNYMvUDO/zYbTrtoaBvtOX
 SlboOQ5kiQS9HsjX8WFlZoYMlVeEEC2MAYJ8BDpTCdNgmwbivA9S1RQ2I485ASdBZW1VzArproZiKO
 tI0357El2XZvb/119I6zpGj0oEUDrR/jPzubcOX7aOZnJhtHOKk9WY3hNBc+MLs3n6Uczz8JWFcm9q
 zXnaBW/6ewLiZTauMdpaud4c1Gjn9lgJYQigtrw0p+ZKGbBZg6/SiaLi/nb/SJ4HDIhyWNWw3XsQt3
 vKMIRGIRuuhBawqMsOiZDtguEXn+Vxbz3RhRduo5be8xC4/7ktBI2fC5embQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Jagadeesh Kona <quic_jkona@quicinc.com>

Camcc requires both MMCX and MXC rails to be powered ON to configure
the camera PLLs on SM8650 platform. Hence add MXC power domain to
camcc node on SM8650.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99b7c6603f284df54b0a4e0ed554817fa8ce6f35..890c4341179a471416bd63308d13b0e313188142 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5349,7 +5349,8 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


