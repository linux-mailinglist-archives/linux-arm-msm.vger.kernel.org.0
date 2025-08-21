Return-Path: <linux-arm-msm+bounces-70062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BC3B2EF4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EFB11CC3977
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 07:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7F02E92D4;
	Thu, 21 Aug 2025 07:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nW//MayP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04BD2E8B83
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760608; cv=none; b=nqmC3/pW0LoaKFGOMh+c1GPg0dHxMJ2P8EcqWYwCfSVGC7UXU2vTwTMvDBH/5MXaLBOL5S4xZ1LNa91ZzrNb+TU6liWRL1uj625LIW/0IMtta7bBktgvGg1z8VpLNOqZ/zQwYB/11ad5cW8mkRvZFpEvrYL1+kMdrQVS7eClt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760608; c=relaxed/simple;
	bh=PyUQi8YMEtw07ZLmRCK8btCo2t5iTXXchMaxMmTMsLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DacxbPdCho4Vlo3JH7FjecBYcygbxQ4jzQlYkpLnvVCtPL+qqMiCsDzm3YST/pAGxPvJc4y7Fel2JFWEvgB7Nn2OM6dsM9KD7kfeziEo/DvDsgA3xdtfTwrzowfEQKXyF+L9ZmzPKRFjhMRPXuSVf+GQuZcGDixq5zz0kFlzbeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nW//MayP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso443650f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755760604; x=1756365404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPn06geqbCWQqNy693X8sDc8Y17mZtLy3S+a8W9CJcY=;
        b=nW//MayPB+uCamdM65U1knydA52i8ibbFo83jMxLmSSuDvC/ggN8yj3MweFjKNMxoA
         vDC3K7ZgOUamcLU/atiasBi4GbpzBTG8jtZswDrLYTIKlXiUYbehAtRe1lQ3e70soERK
         ev8hALedjraUosMjQcx7c5aIKvYokE1odjH1ldJNv6ZxcbgOFwpnlIAFZO5jF21ESxiN
         E7sI4T+BOFcaAGhqQzwH6N5iAS607ZhV5cBqVvlqlATPtzYnNPFie8VaR4vEtZeT/gpJ
         AXRmsfVvK1obUNlucd1MvRQm3kpCXC0w2hmCpTcTNge7sNCGjHhXjN2KDpxGW84aKizm
         NBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760604; x=1756365404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPn06geqbCWQqNy693X8sDc8Y17mZtLy3S+a8W9CJcY=;
        b=GZCG8M+riadHIJQqe1kMq1nn4ETZ+12bwiDR7yzl5PGy5Cx09WPkXIeb0ABVolPV/V
         j0wHzJNJ98p93bljUQaKu9HUUT+2iVvx5H3ExTrb/oByoIuD2RWhOcmcyqJd+yDUESFu
         yUMs+tyesZCpr2BH1aCnJHMnLxtikRm/D5sN0F5K6rbobMz3YNGXnBk/vEkX9SwGCnup
         4DsMEECdWOcr/zmfn3rTbn46jcpDPGF0taBHHo5dL8004N0PbaAd6NjyZFVuGKP8cLSu
         BnvcTuEw42dopsWJITCbxjBnLvZyFHrt1iokXFu4+xs9WvOg0oalWG+Pwh8+nxve3sGx
         fHWg==
X-Gm-Message-State: AOJu0Yy6s0mUqx8k4KqrD5qsCwuz2dDqP6lSpBk5/0PWwHPZI5X43Imf
	+o4jWDYvTny5lk6Ie+oGzeUd2fEHrOiIP4CORSzRIedAZ+tX8bJpik9uzhLKf48Df6o=
X-Gm-Gg: ASbGnct3o6Sdjg6gBlIq75S24vEzu7f44ewFjXO4fzu1IUZgsbUyCoMoUjtkqYmCXSG
	akL2TbhFeWKTbfxjSpE8rdVuZuQYBBXcQ/7pmuzwzvcwYLRJunT/Nuz9BfotRiZIWQ/NxAqVCAh
	2zA85Agk9f49+8CAvrL8/ES2Pz6T5eLSDgV8bEvORRB/slBRRRJZ4KYZ91/UIDrXyOaVDUC3yIN
	oJ4bPThDbYykcy6ez4VnDfcXP5yWIDuMRZ4WATwp4oksdG9/A38NCeyDlW3OW/rEC4hiQqbZNnv
	mI7tTz7tUv6FSJTrAqw4bjaZdaHMCgFZcTeAjEFpkunQVq12Vd1H++gnPozn5YOFn62aml4aEJb
	qNxdtAZliJ4LrvcM+Dj1+jdyRLXUg0eiP52/8YWdLOEIbbTlBCtbWnA==
X-Google-Smtp-Source: AGHT+IFpHS77wysF7sSxitfSc+cWkgFQSjGLTrZBx8pZCjnrHd/xkGW1pOgXBqORgCCrp4pDOEJT5g==
X-Received: by 2002:a05:6000:2509:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3c4b0c15702mr728369f8f.25.1755760604126;
        Thu, 21 Aug 2025 00:16:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4de5b52esm14411455e9.20.2025.08.21.00.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 00:16:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 09:16:37 +0200
Subject: [PATCH 4/6] arm64: dts: qcom: sm8450: Additionally manage MXC
 power domain in camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-4-a510c72da096@linaro.org>
References: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-0-a510c72da096@linaro.org>
In-Reply-To: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-0-a510c72da096@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8OWok+mQJ6cMYBBRb+TGH/dRfH3HUvGf9YkBq8GS3GY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopsfX/sIxqn8XI3H09gENW6VOxz6kf5JX+t30K/+c
 Il3yFUKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKbH1wAKCRB33NvayMhJ0Xy2D/
 4tIgycF36KsaJIDdije2iePK2eztQluDrZPwIM4p2ruecs1Ds0vSWPyzy39QnukeFsrXgkQOKOwp9D
 K0S/gD+vJpi9pFYZGbLhnHSIv51RdBeDE0GUU9s5oaIz1Fu7Hb16VfxBFw97w8SZ3fHqRyyk4nyotd
 WCHW54Xs1rNgRNE8KmplL+HZB71xZum2pDa9sqCUdYe2BRY24nBtbwL45o8ss8bIWwrEc9+ehGJKPg
 2Qw9hSBMtxp6bEBqvjYggoOwle86X/YDaF8WoJebSjSuP4ruJvfUquEPggN3shJmQmThlgcPaAPU2y
 c/dvB6iaDTeu1o6CqFvGBs9vS0HzcNGLCMcTQcZfMO7myCJOjahRoyTtMYgmqmk1hfLEkg/B+pEzaD
 2k/GXO0RJgle+du68HIuGSl97KZi0o/ehpeYuslhDQ3YnLDNJD/IVKGrp//IBu5L+EXP6Ye9lpJheo
 kf71d7pOZGgo+rujK9SEaZ8Dkh6qkjCe9lZS1dJ/Ss6c/85bN7UI/wbzLFKqQJZgt7WFNwXBrKc31m
 9JsLuWV1GyqF7+gz3h7I6bFVnkbnUNtEZ3yLbhXGrIl+7Vfscyphz9vzq+kBZWq0ErBOhRzC9ZykGF
 O9GPVCxSVEYfXANPPXl/Xo48ZAbtCrzMn9O97ms52woxk2QuxIn64Sgh11bw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Jagadeesh Kona <quic_jkona@quicinc.com>

Camcc requires both MMCX and MXC rails to be powered ON to configure
the camera PLLs on SM8450 platform. Hence add MXC power domain to
camcc node on SM8450.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f6db0d78f738b14c776735d6b3ae9233b165026..dad1395c8c6712d233e5acd558e67f1e53d678ee 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3293,8 +3293,10 @@ camcc: clock-controller@ade0000 {
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd RPMHPD_MMCX>;
-			required-opps = <&rpmhpd_opp_low_svs>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


