Return-Path: <linux-arm-msm+bounces-3252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76F803388
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6E7F280D8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0822E249ED;
	Mon,  4 Dec 2023 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I88nEEOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A40DF
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 04:55:48 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54c77e0832cso2635757a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 04:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694546; x=1702299346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYBJZvf16al31yAEkvLrTZBLEk08fvZeDLHzDDQHdx0=;
        b=I88nEEOKAbsbAQrSA+jpKZxAnGi1l3XoSJblEP4/ZlCghoBNlT0zzVaRAv2O4JRB4J
         q9JkTwvlRCMUklID80Xx/JUhqjLDY4Nt/S2TuuvJKygmZf+DU1Ee2yNzfYexrkY6lf/F
         osZF5Qr8Qq9I+AqyfDZ0b6DgCuuKxA1OE9YTTGfJW5U0xCEi0D/BFaycea/lNPdrO+9P
         ew1CAHiw5NhkzILRVwfWMoIi43n9645npT5sML8v/L1GCWGOho4zFhsKd01BDfM1PUCu
         zcMLxzwUiPeozJkWj+zCBkdRSHBWiw5EqzWPr8bKnD3fOAmaZLi83vOacLyzHumYDrS8
         dYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694546; x=1702299346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYBJZvf16al31yAEkvLrTZBLEk08fvZeDLHzDDQHdx0=;
        b=bYwMh+axCorAFPMnTaB9diIN3FbHqQfAAom+LsTC03QQr/t7BepQPwh9OhdjlxODml
         i1FRMDB0Nj4F9sLfIdnfZ/UeSMO+5yok/WVGZXGv5rpioiBMVzSq3mNJgX6CsxpH8cKy
         Qj4v1u4ILzAePwl0yMZhKfhaVk6Dnwbo1vgxcWaAl2+j0ZziUnvgvfrivMiIeF/Ag+GM
         tCXPiir96tmBJXnqHUeRmOAOL8y0noAzPJy0w5RCXrnk+iPh97X46ALqOIe/akN2e9Ec
         REb5DMiEa6x1t7Q/tiLKnSLspMMlPBVdl3WbqNRCV3/RGbqaJFzMcorw/2x/h4awGvcN
         zbjQ==
X-Gm-Message-State: AOJu0YxYrs46a2AcOnGboBOWBN7XND+/O6/LDj9pBJGUOxAwjhatyKTQ
	x6EgUMcCOaJ7dLNAtYSvHEFLiw==
X-Google-Smtp-Source: AGHT+IHoHO9TKConiwiagXCkku3lVT4S1J8QynxoRRmySDKBpuPSv9oHBFS3wp7AR1UsVLO+J4Qu9w==
X-Received: by 2002:a17:906:da04:b0:a19:a19b:c72f with SMTP id fi4-20020a170906da0400b00a19a19bc72fmr2953051ejb.127.1701694546652;
        Mon, 04 Dec 2023 04:55:46 -0800 (PST)
Received: from [10.167.154.1] (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
        by smtp.gmail.com with ESMTPSA id ay22-20020a170906d29600b009efe6fdf615sm5241373ejb.150.2023.12.04.04.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:55:46 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 04 Dec 2023 13:55:24 +0100
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8550-mtp: Enable the A740 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-topic-a7xx_dt-v2-5-2a437588e563@linaro.org>
References: <20231127-topic-a7xx_dt-v2-0-2a437588e563@linaro.org>
In-Reply-To: <20231127-topic-a7xx_dt-v2-0-2a437588e563@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701694533; l=725;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9FJMq5XZXBPBjP7KOy0b1q2lfGMXMmYwfkQChVXyG58=;
 b=dZQFJAa43yRKRFVuhYC59lVTywRwiU+Z0ruBiOuzMDG984BZCFwibm30OYopXSQz1iEUiR2Kv
 fnvSNpONBQeAECiGUNL/pvHsWJ8Izr1Y1LW3p+shWU/3y27ivta91tX
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Enable the GPU and provide a path for the ZAP blob.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 9a70875028b7..52244e9bfdee 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -512,6 +512,14 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8550/a740_zap.mbn";
+	};
+};
+
 &i2c_master_hub_0 {
 	status = "okay";
 };

-- 
2.43.0


