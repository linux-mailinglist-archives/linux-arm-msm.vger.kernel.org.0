Return-Path: <linux-arm-msm+bounces-7209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E43CD82CD3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 15:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF68C1C21510
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 14:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AEF182C7;
	Sat, 13 Jan 2024 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qr3JPy6n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3718057
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5578485fc0eso6349438a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705157471; x=1705762271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ls2aUMbVxdc/7lozE+p30ZeM7lcweE8oneLXZx5wYg=;
        b=qr3JPy6nL8VgsjuMl7iefUhFk4obn3UKo/IuBKnxm9g7qfPTy7uBIceVXzrnijlPbw
         lRCh3UWI3e4ETuoIiik2K5apXK9LCULysmxkIbYuzeqdMdxpCjCDFAsEZ55c00S2mRHo
         8PeRtgKLsryjIzpZII5XSOxL4jO6AwXaolzzGoOM9Rlvq3HXjI7m5UE3YxC/IHDigLOs
         slGxN83Y2V25fPB/n9Me0g6c/I8EmwOPED1KIOJhdFNRFx8ZoDMFX8tTAa3aUrT54tCp
         tDWm5+ARCqePHd56DF3T8ddGLjRtQFUhwkFP99DtQaNiHeJb3dM3Pk3zBW+/etBrKMkI
         Eb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705157471; x=1705762271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ls2aUMbVxdc/7lozE+p30ZeM7lcweE8oneLXZx5wYg=;
        b=Nc5DTDOONCVlS5moQIUk6ROM4I+sOkhNU7yCx2oW76jMR4Y5BbAuJ/gR4ybN0gHnjO
         LuzcgdR7Oy8V318iXJp1FDCc8QvozFgUSkPGS04qwPmAd8ZGHlHuq/aK7hkzbLnreaU3
         as/eTui9kNh7jIZOLb7VKJmNjuqbjitUL/O7Ei1JbL9qWiBFHaeKaA34909ca42IiP7K
         RDEc00f1qoM7b7HNC/YB7g8JEDWTOrmY90Oa8xnupJbmVJVsvp0aRpYxiIoGYuz9bCev
         zISHphdfLaQ6hks/My59gfujYlycwYDHIjSXtBeBQi+/wWwPglCueQu3PS4KdubAS9oA
         AaMw==
X-Gm-Message-State: AOJu0YyGMPwI/9Abl/KCpZ9MvNEkalTkJmSjxgJ3+Wkf3P/+NNXqd+v3
	CTYpMSWijD7xk32lhMkdonG9TyippVv9Cg==
X-Google-Smtp-Source: AGHT+IHyZQcGOyPfUoWQXxK99+REdpGDJOI0hvYXEStNkC65RdE+R2HJdElnbDhR/dhM80qquKDFBQ==
X-Received: by 2002:a50:fc12:0:b0:556:e2a6:e683 with SMTP id i18-20020a50fc12000000b00556e2a6e683mr1612550edr.79.1705157471718;
        Sat, 13 Jan 2024 06:51:11 -0800 (PST)
Received: from [10.167.154.1] (178235179017.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.17])
        by smtp.gmail.com with ESMTPSA id es18-20020a056402381200b00554b1d1a934sm3014593edb.27.2024.01.13.06.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 06:51:11 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 13 Jan 2024 15:50:58 +0100
Subject: [PATCH v6 09/12] arm64: dts: qcom: sm6375: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v6-9-46d136a4e8d0@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705157455; l=718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Gc/yH23ZENvzGFFViZ7/qVCV3FeiRMp+LehbPO3k6Xw=;
 b=86Y6jsKpcQ18sYal3Sp2bgI3EzGdyaVzQ0SdqKkhquJh1U19a52aWW5Z78Iz2gydwopmhuQUk
 bV1u+K9XqfuCQ8u0ROtbZ7F44chBxbV9h/S5B2rNjUgi4UUnxb1C5qd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 7ac8bf26dda3..f578d110f36b 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -954,6 +954,7 @@ gcc: clock-controller@1400000 {
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&sleep_clk>;
+			power-domains = <&rpmpd SM6375_VDDCX>;
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.43.0


