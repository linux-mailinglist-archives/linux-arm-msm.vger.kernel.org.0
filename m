Return-Path: <linux-arm-msm+bounces-2140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3867FA62F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6980AB21347
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047A536AF9;
	Mon, 27 Nov 2023 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXjPfRLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6F3D4D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:24 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a04196fc957so645796066b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701102022; x=1701706822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gQ6YImSRCbx+1xRUL4mfy0bfTlxIzI8pSH1DPk4t6M=;
        b=xXjPfRLMdBVIbfdX2XNa/4RviGs4Dlcw+PuHq6+k4yZcD6aDPRW74yAlAtr6EyE3Pd
         HEju+KFkAyjSo3TExljeFoe3c5I3SwfPQ8c8uu93h7uqTt0xD2ToIWI6DUduI235Hcd3
         vMZIV3PKBuprlfyyRjXrHFkcISbB8nh69ck/07DA6OssCZ4C83HfNBQG1DqR52WwKWb/
         60R5N2lIFMDjHfsog8PgK5iV2INiqN3/i4/Md3sByEPFrQ1zOc6YqvlG6MirQ44m34kT
         Vfe1+Tp4MzZ01uRyPkCofaHg0KVnuj+saOqhJbEEeXDqm9QASmv9+2/lfRY1qZ9DdyGK
         f4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102022; x=1701706822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gQ6YImSRCbx+1xRUL4mfy0bfTlxIzI8pSH1DPk4t6M=;
        b=UIpV4nA3uB+ZLgEeFOpKcMZOTELzZyBz73n5piG5QFrlZ3hfWVYPXwO6F6id2yxy6M
         4NXwP8ZP4kBRmCVhA1WBfwaaKJ9wRzJQv1kFH+TLy5Uss6PwjEJjb4CzSUAQWyHpyxy1
         qfk7kkPTY23F0iPkW1DUdrHpqz3cKVNZCGe0ZpwBTGE89z9SrfNKuj6enYbcf5DWTBKO
         dXPA0Tf6hobzFT3BHqGlSu0BOfCWZezWZfBYn1uuhXM/HgdtBpW8ZI5emqlVsx8EZC+t
         POQUiaY80kFePd2LU1le/+EQl+NnbBRM+DIS1J4lJtMCKxQdWLceqdVI1I9stNzFQWQe
         C6Mg==
X-Gm-Message-State: AOJu0YwWrkyqoIu2vhnkzUtXsE/VfZZspKcy2bOz2HbqRU3S6gkTTw65
	eQqRT4K9Kp278ip6CIq0DS+ieA==
X-Google-Smtp-Source: AGHT+IFPmWmSTHMcfL1yecPUgSq8wRk41FMgkXe1PITU3Isy6yZrSpKslVtSqdOYlcbiQ944Gj61HQ==
X-Received: by 2002:a17:906:3e0e:b0:9c1:edd8:43c2 with SMTP id k14-20020a1709063e0e00b009c1edd843c2mr8518492eji.42.1701102022689;
        Mon, 27 Nov 2023 08:20:22 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b009c3828fec06sm5734760eje.81.2023.11.27.08.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:20:22 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 17:20:08 +0100
Subject: [PATCH 6/6] arm64: dts: qcom: sm8450-hdk: Enable the A730 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-topic-a7xx_dt-v1-6-a228b8122ebf@linaro.org>
References: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
In-Reply-To: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701102008; l=685;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZUlIcXR6hgLx+DM+J1BHsWNt1eWJies/ihFtsM1lhWs=;
 b=Cedfa+rVMp6sij89sdZZMlPzRmUJXcuOfEsRWBEN2D21fqvMOO59apxBjB3KBAs4/TDPO0Kqr
 SYlvJAJGZQ/CbFapt8rBADbCSma58YbPuNklA1x7+9wefmw9suo3yzI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Enable the GPU and provide a path for the ZAP blob.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 20153d08edde..a20d5d76af35 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -580,6 +580,14 @@ &dispcc {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8450/a730_zap.mbn";
+	};
+};
+
 &i2c9 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.43.0


