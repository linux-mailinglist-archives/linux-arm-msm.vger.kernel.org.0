Return-Path: <linux-arm-msm+bounces-52297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221EA6D67F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 09:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6481891F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC0125DAE6;
	Mon, 24 Mar 2025 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BQOc0eox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680725D8F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805673; cv=none; b=ZXu2mKuSVKo/EiG/h47afTflw7FbmFgEiX73lBuCtdwBL0vKPad+HlzpDwmQPcKieIUzRP/FtSSnmmVHlNTAd63PHGVoYSjiSn4cMR39xqAjhYPxLv3icKNB70/6C9YgwNqJic6JeeBkQfr8PafWHk0MWcZw0sKFcaUIBKmRfSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805673; c=relaxed/simple;
	bh=AFOsIAC6SS0fPbzq7D7EjSpe/9E/6d/qhu5Xf6WqtyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzJaa6ymDOiEKVQsuDZi8Cm3/bR8+BSxLCFcazS81MBWVNJZ9Utn5Us4MMe9p47hOQc+MD4sH1QRDE93hjomTWjSqx+cyb0ihQd1aOmvqvMYi9ya7CxmjLnh0OVlLffGCaRx9HarRaxtQIaJg30oA2AtxkTPF3qVeG9lz/0T84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BQOc0eox; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so730879966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742805669; x=1743410469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqyxDkKBXP2Up3UhH96Dx8TXoOJgbv9o3SaMoIVWQrE=;
        b=BQOc0eoxoA4tl5p+pK+LyTEKozxCWGMFmUZJttxNB7EXcd/fD87YBvEC5EoYL2vJWm
         HqJI/UTP22aCeaVl1igHjzTiKxb2A9ntxdH3T80xYpl0pNrLARnaNBZlfJkaX0Zqw/G2
         aoC2OPFkt4yJdQsEleObm0TGqPUWa4591somJ2ggRKwzIz+IeTpz6OcIaa717Fxnsqbu
         HAaf5sDwcgxW4ED7KdUZ6V5sAYDSE7PacQdlUxkLpk2fQRm4xH4YKDj6oyze8grtT2gf
         ZUV4DsYLKBrRIMpuUpwqDe11Nl92a6XNE4saUkcMjZ30DTSWsi2W+UtI27HuTEfv09KO
         t66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805669; x=1743410469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqyxDkKBXP2Up3UhH96Dx8TXoOJgbv9o3SaMoIVWQrE=;
        b=MWCqiAKJ8roTeWc7pg7OIK1AJSw080gnYUcko78dIwirIAjgL34IWWq1hdtnriEC45
         DVh+3v58vEu1oBzhE52C4qimNdZ9CyJMzQEZOHFDrYgWg2BB1R29HgTdbU0B69sXur+s
         3QqkhfoKQExS3GzUn4SiZPe6e+ZRGGxOjGcVIy6Jg0uqrv3l7AOq0ScO1cUOFbwhVxtU
         NJD4d4VqoMbUkkNjKIHoU1+cwtm6ycku5F8XXUebjGk8tFm5lXBUkS3MFH7l29nD8dMi
         2Ae562tBqIrWhia7d+sBzdXwZSjLfMTjxBBKE5Jgae7ixModyMxow1Ni9MAP5ez+Cd6H
         tKCw==
X-Forwarded-Encrypted: i=1; AJvYcCWRFm6+45VrLwQiu9k4oqrE0NDAf5TLBOkYWsSz7GyxkiauBrdaPyqjYkjRwQQnVmlmvj6frfInPaWQ/fhe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3BnYo3JqfQEXWpiGGqAwO4MMehTGbr7dhg0rxic7Jejy9Dngu
	ONjug8D/nkwPX7BWWPDc7yCB5VHhD4A7eJGIYfjWYsPObFyPodDqI0t47pwYTUs=
X-Gm-Gg: ASbGncukTCw90rOT7sKBbYyt0kjEDBwq4GMXXP/xkk3RZ4NxCAIyKjHF1wiALVaKYfR
	RnMwG/u6gy+8KHJyC2XxjFX7QpcbD/TQajm+JR75QP+KpMOE++TBGVN9lPrFm4hJBHa7BHre5/D
	a6lZuYHpAourhMeGo5nMxw5v6b7EV9xd6nBbkUUlF/MSm4F4fPtyrTVvkumrqa7XGhG23lPGzzT
	cfj+6Ycxh/oMf+m8TUCUsHOrtBsJpZWymLyDu0qxSv8BZiTa7NMCnThlckmrM1EiVmWahb9kXGK
	oU/DCRhI4Oz04eoFsc0WLy0m3PUM3UDwz1u+UgRui1uVEQQ1Ox3ps8WDlsA4JiPNOjPGNqj0ZHB
	N7PNRoOS6mjXD+FfJTQ==
X-Google-Smtp-Source: AGHT+IEIbECex1u2sz3obxMBVg9MXWDK5ZdDdAZm5/qlaOXilZZG6R+6m05Bcoh0lt+nXYcl9z01hQ==
X-Received: by 2002:a17:907:d88:b0:ac1:e31e:de0a with SMTP id a640c23a62f3a-ac3f20f7101mr1341850266b.12.1742805669049;
        Mon, 24 Mar 2025 01:41:09 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0dfb33sm5715937a12.68.2025.03.24.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:41:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 24 Mar 2025 09:41:04 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
In-Reply-To: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the videocc found on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
 			};
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,sm6350-videocc";
+			reg = <0x0 0x0aaf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+			clock-names = "iface",
+				      "bi_tcxo",
+				      "sleep_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac4a000 0x0 0x1000>;

-- 
2.49.0


