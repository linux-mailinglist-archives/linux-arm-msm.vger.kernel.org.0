Return-Path: <linux-arm-msm+bounces-70060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D86FAB2EF38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E10E7B2D52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 07:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66382E8B9C;
	Thu, 21 Aug 2025 07:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YiMMBro8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808422D97A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760606; cv=none; b=eB+nBlYsrPxuBNK1+59Cf2YfbuaOz7cPk7p42uNToAVuz4ZIDy3/NNCrUG8QqyYVXGYmcvZcHhR1Fj8fBF/Uadw6XV66LrtJgMtCi9cBoWgXXjFTWmhIG+c3AvwT2stHWYZDVhBVd0sOIH7WP4yV4/b5AIXAT/+7BTno3Qv5pL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760606; c=relaxed/simple;
	bh=odok1NB/os6Op96Tw20uQsfm8O8IHcGhS2hw5yQh51U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nl7jyWeV8LUaSXTklcSw4ZDGKmhK7Xk89x1Ltun+TcUUk0ZfvNGyMI4BEzC2Chc8MR3/uFdCqHp89YA+uAchXga0q7ICC5EqE91zcfF0l/WRT2v59EbAVnSQy1er97gxJW5o0xsrkb0YdEAxziSy6HgrOGzoFgX8pIJ2WmKPRkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YiMMBro8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso2883545e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755760603; x=1756365403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqy2gm0eQAUZyJWlOlSTZmK8sdI8rKYK24OGN8Pqm2g=;
        b=YiMMBro8IPvcGM47jLfP2+FhCFsBIzDIfM1vof2HKfTHJaV8OdtyISwA8i5gAIzW5R
         ARszkHk6TlhO/jZpC6VCfdqaZHxdwEFU/1zMyz5UWCLE7F9J7DeayFpEdMSFOOqLRhLK
         aDnc7pA7OW5AHv8oalM8WVdihkDk3MV+OG9fnsLazMdgaWEhrOkTBEqqIoW3XqHvvx9m
         lFUyotK5c6BZ9C1ubFipV9FAIIzFowBFFUEuz81cemU1w40uj8MJLD33Z8jMgLWLfXTj
         dJtdru7/XwUvvfSGmA98w7k0eNcX5AD8/BBIDF3tKllDWafDf8jxvFfs+gpn8a+zVDOz
         8iSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760603; x=1756365403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqy2gm0eQAUZyJWlOlSTZmK8sdI8rKYK24OGN8Pqm2g=;
        b=VuxlecNP8kDsTGwnIncL8uVCRsaVAEpOpV2gJ7cA6SItAxUVfLutoSTpiaqOHp4v7Y
         Cgu0PloIH7Be/y/TK8bpkz1lBFc4Uy4rQgftrlVGBrvBbm5j1iLjRUjlDhDr/tR93oR5
         Eq+s+jNGAXu8tyVf2ACeFa9FgSX29B4vg93POjDMbl+5blhjGl4YTINxWhlZaqzZcsMR
         vdqMCArzayYaThecu9pGveGsF1BY3jYawuE7w4UtBiFuhWgblP7kKjwg1OQlBQrayNDZ
         eAR6/4f6upwmtk6XcIE/kWC1qspoLHxbWl1O7fe1zFJUZtVBl80fhKKnPgHLPxcrovor
         uD2w==
X-Gm-Message-State: AOJu0Yz63MsrQ/98QjT2cNs67+WHyA8Yp+cKO8M5Dy2P6z+ouO1hIb8T
	ob9FApwzgNDh86DOKZOH3+aoft9OpM8P7P1uIVuk53x6f4wgfv/1XBRxjVaOtz2PeHI=
X-Gm-Gg: ASbGncubTrkTRtdg91kQukbrWM8cnsDaIYvxkze87iDAhQBQjLt2FdbESVHejNFVYdp
	e4LgKCSpiIdX8FG3b6IC45SsmSfhMHtkMiFkw/Jr/ZJ3l1TBm1DdhuUNXjzRexgtIBmTdBX6icI
	Tpl5c95mM2xGnjrkOp8DjnxB3vTJBabomT0xL5l5aFeX2R8BtVWFDa/ju+hc7hm187EA5jD5+pl
	426KcEjZ0lScOx4aH7WFy26jFWyLAhq8R0rMIHmDXv277/PpRrD5yUtofuyRkKs0V+fVsAt60SD
	P0MmOaVewO95KrZfbL/hhZKq63NhKlRS/1QuJP5RSpIJ0PBAOtA+02b4yzorQ5lxoPsFdRGoYyp
	CYBDM0ANL/c/woqqCmcNCmCGw+Arn3CE7NIZxUzZ7DNQ=
X-Google-Smtp-Source: AGHT+IHzbUAV75WSogK4Pv3zx03XLL4XoYH95UfASntxLUKqS1E46YzsaLND4uwGq75KTeDK4DA8wA==
X-Received: by 2002:a05:600c:19cb:b0:456:db0:4f3d with SMTP id 5b1f17b1804b1-45b4d8281bdmr10337405e9.24.1755760602701;
        Thu, 21 Aug 2025 00:16:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4de5b52esm14411455e9.20.2025.08.21.00.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 00:16:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 09:16:35 +0200
Subject: [PATCH 2/6] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-2-a510c72da096@linaro.org>
References: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-0-a510c72da096@linaro.org>
In-Reply-To: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-0-a510c72da096@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EsER8r1zfXvJMrf+Uq1BesZ7c/Gb0QgKo2HXPPO6s9I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopsfWVqM43/Mfgde6RmFu+FEM1Rs25ES2r9805py6
 ivio18GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKbH1gAKCRB33NvayMhJ0VcAEA
 C84PaUfHP6NWQ/Q6bwnTDqQHLd/5kBtAcTw2B3uR0mJ9egrFeMdzEyaBPv2eFq0j4dSdZetnDbR1x2
 NCL72/bYqXEDbFp5gjkVp4MT8Ua9s63Z2N+/fBeCFokue5Vlj+Yz4EAdmH6yEYFGIi9rAYu+RiNCnn
 POwtG8513KAY1oMyAPf7m5cTs8Cnet5j7EazLTQBwSJaz0M/N/kXb7kWhImEO0/pRCyNKXoG1U5wRp
 ID/f4TdunWe7L1zWVixhdI0LO+1um9+6CaJs35bVvoAWk6WL8yjjLgIqph09obzKxWJnRIFGrvKUFu
 vB0o4tadS9WmdVpEw7o1OYWsCS+gmWY/eCf0eQgJFsSI3vHY6F+IGC1JeWj+DU9qRJb4aMZpG6Q/w0
 UOqINlOM2lx13qhlv/hizg8ZmLd7TFvHd5uUy/seyUaZn2hJi9a5llRCeyo5jcVL4YztMKDFyiLV4X
 SyJz4RycCNUyz4Qw6Im4699Se/uOHfux8COaXqjw5N+pxJNRNKAU4TOZhMb7ouQJ97A2Ejo3vj+B1G
 cmao8hHbgBt3p7thEr0UpsX6F0GcbwWjCA7/WS8S/uaCWDAFeTAVIbz80El9Tz18mDZbCF3mlbL62P
 jV2NhM6Ie8nUPiX//MM12Kw6fuEDwx9SdCr1aM5PUVykqaRnfYvLqVfk3DAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Jagadeesh Kona <quic_jkona@quicinc.com>

Videocc requires both MMCX and MXC rails to be powered ON to configure
the video PLLs on SM8550 platform. Hence add MXC power domain to videocc
node on SM8550.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 38d139d1dd4a994287c03d064ca01d59a11ac771..d4bffcc244c98e87464cb2a4075c21f3cd368482 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3307,8 +3307,10 @@ videocc: clock-controller@aaf0000 {
 			reg = <0 0x0aaf0000 0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
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


