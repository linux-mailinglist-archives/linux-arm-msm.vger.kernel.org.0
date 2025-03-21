Return-Path: <linux-arm-msm+bounces-52211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D6A6BD82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC8A3AEE96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2A01DDA09;
	Fri, 21 Mar 2025 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WDvwZhNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508E11A256B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568354; cv=none; b=naNGBWh7mTjUVh/QO9K8MI6bFgkgnKEnuEdRPxCi64oGUTpS8wwgwLGWwSTuu1XzNGlFBAM+lN8TgutRi5Ef/mwaJ4yXDDrU0SkjE9K+qGGGZpRpuBuF3ISwIptsWk2g7w+B/Drpg14129aqW1qdxn6WriIna1QXoq7YnRAna6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568354; c=relaxed/simple;
	bh=fBxL88tfFgu4vPWkBQ8cd2kEnZv6myN9L9eGEfufx8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZGALV0t4vTSp0e0XUSr65UgArBYynzzodu30izNhMWOAKSluoDGvcT+loDUoORG+B1tmegnQhueIUpXQhyXy7RdYABnvRskQ4ljaYUv4AcFYNej4MpqR2qfFr0dc/nF3seaQUH4P6NRFUg+nWrtYWwqLyFTKVnboZ9/rKZH0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WDvwZhNp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac297cbe017so558189566b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742568350; x=1743173150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhNOdkQVVIt/vsEdwwj+oY1HmQH9nhKvG0mvmibQd4s=;
        b=WDvwZhNpsJb6BbvFCAM8o5mO/cHO1kPWkTMYi6YWlhOrReYiI106WddcOwvB32k+p7
         cRoSsHCHgpXbrIElznEMSHUNzn9skdzxuSvSYlpqZFYZmIi+lL26OZXYCK008sRiFaaI
         dcigaJFLuRHbGVGHXKXRd2gP4x4xFDP0o27qo15SFRMsBEi/Ey43J6R+ezzN3dd23xrW
         6gu1OT7MUx5CeRcN8UWuuUKax7UmNpa4TmFac+NemSAi+Oi8oupIoqxI0uRF93rb15fq
         tVNekQHdkEjNV0VfEnpHCFJRRc8tE7eoQD0m3Q1OeiPzNaK+DULdIWstjBf4FqLxylib
         nTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568350; x=1743173150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhNOdkQVVIt/vsEdwwj+oY1HmQH9nhKvG0mvmibQd4s=;
        b=k4MGa5b+VIRsFROtond4LGF7NrjFbFttEkpVBQUKd9agKuGTfc/aUPP8Hd+5VEWsza
         oojBRtSF5ClA/VR0CutHCqEEeEJO8aHoC8AiVIGbz9a7cMf6y7/NT6tu7WuJ6pJ/h7k/
         itHAxdgX3/mxtBhkxZeFWZcJ01IHp43qojsFDGAwJEa09ZUdu7mzGJKILV0vgy5BnSy+
         5kfRoOIbgvcGjiSqwDVlYxbM9W4EJkfqwmg/hSWvSNH9XV1IyJCH19V1O9Fo/E1uLr9a
         E4KmwPmBlVN1XADbEeIFPiOa/4MyoP6cod9eyixzY3vgS+zJhCQ/J9DKPEIDV/YFChuz
         xSzg==
X-Forwarded-Encrypted: i=1; AJvYcCXeRBh4Cu03lYoe6H+uMwtQG9NmNEd0NSzx9YFmFMC32ITUrDLW/fjnyc4tdHsH1gYjmg22ieWBdaa0oVse@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tQYsvXGsYJwGh44lB0B5gyzZ/MPXKFimMhR35y0O/YyIHnkC
	iFr95Nt4vTfK3MwrWgs9fG3gUvyzRyaKjKjUbmvmWRhdPtCbFy7oP1uzPlfjVMc=
X-Gm-Gg: ASbGncuT/wkyuyb8aVADo24mQeGJMZta66VievOqF1rPBPgojm9HA7rvRXui6DC9MnG
	yH8d60PfwrJIu0bG368XqUfNQJk5sV8L+myndvo94mDBS6memJOnNcDsSRGPFYoltS/0YbSHz63
	tpVKQ3EUWzVROzpdSYE9SYan78ySuxCzSYqRymtF7Axe/3hhN8aSfIv/c1GORylrMqyWDc21QKD
	akSKyAIUXnFFnCuwV0gVEsIzD8CbGouYS5BM9bpbiXqvXAGaI+P8vgJXgQsFb8I7zwjozAGYNoN
	00M5/KToaUsAziBcXvoKw8sK09UF2Rc877dtOdd8/KUVOb7ZavGr/mkG0s4DkUZiOnXG8F4aEdL
	o5akLnXwXDNJNQtLpjg==
X-Google-Smtp-Source: AGHT+IFrUo+XVApUPF24P18d3jsX7lNPxWfJoO0tS8bgXcfA90A6ILqy0CEkprg7D7hHpF5FLLZltg==
X-Received: by 2002:a17:907:d84d:b0:ac3:4228:6e00 with SMTP id a640c23a62f3a-ac3f00b2ef4mr438441866b.6.1742568350254;
        Fri, 21 Mar 2025 07:45:50 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb648acsm168092466b.98.2025.03.21.07.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:45:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Mar 2025 15:45:01 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm6350: Add video clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-sm6350-videocc-v1-3-c5ce1f1483ee@fairphone.com>
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
In-Reply-To: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
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
index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..ab7118b4f8f8cea56a3957e9df67ee1cd74820a6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
 			};
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,sm6350-videocc";
+			reg = <0 0x0aaf0000 0 0x10000>;
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
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.49.0


