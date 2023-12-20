Return-Path: <linux-arm-msm+bounces-5473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC3819580
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 01:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59606B20FA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 00:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128B91CABE;
	Wed, 20 Dec 2023 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+YI46tT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889F15491
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cc3f5e7451so62090391fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 16:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703032273; x=1703637073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ls2aUMbVxdc/7lozE+p30ZeM7lcweE8oneLXZx5wYg=;
        b=t+YI46tTHIYcgwERFwMKxuTeA/QmRqxFcLYCbn2OeMPG/Pt7RkQvbgRdTw2ueOulIj
         wrnUVfgQVt+IEcks04QWUWcnuFkKNCzXS41ihHZY2VlBaLRacr86YB5mHS4kxZqGYKrp
         Lhszni+G27qR+jGQeA4BQEyhe/JPF8FaLglduymoX517qyxUrq91VDD5NCJKUQNka5/m
         KR9OKyqWyjx+ACdx8uaCNUTzqlYtH4esYqQLnXz+q6xOSMv/8nKKz5H+QwfoNt5AfGQl
         ZC/McPW9admSmCBbwpMsXCq+G757WpMED6QvPyLja+QGWei7yRBbU/rc00YqC3OpE/kG
         PTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703032273; x=1703637073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ls2aUMbVxdc/7lozE+p30ZeM7lcweE8oneLXZx5wYg=;
        b=SneUzssdSGI7mSUb2elKaZqzLrVngZ3I2+OK7gcB1KOZ8f+pktFMM+dy7pExXYwUoG
         sYOFZhjs9TFN0cHtJOuu8M2oZFdBzc7KIA7ykIh1pY7RK7+CTtJua5eN9USdTHRX8Evt
         MLZgVcUgAXgPGaDuOu+5pgGg9B77UxPO76AOv4YVItvky8OVcsL+iU7lrAls4ozPD3sh
         sDFiP2/lkhFXn9/HwRvRg3njMFghLuDywEO3bCjcI4kbl+5vSdUpex9RsQf8xPY2IfgN
         BMCSsf7GsEvOxfQoW02F17pMChuNHMRLKSoUrYLfhfPVrpPty5d+I5ZgBEUY04nRcZCk
         nYFw==
X-Gm-Message-State: AOJu0Yxns25BsIVQiDaaplu0Tl1Z/Ll6xWSD4XBCEuah/JRXYMRcQEhp
	XvKTMOpmblszDIOAoygD2VzRTQ==
X-Google-Smtp-Source: AGHT+IGVs9JKAowhjn+b7AGbiUGfGCugR7sKfc3mf8G2XtwNNXY08ZkD8Ot+EKxsKM+HzoibkNZOXQ==
X-Received: by 2002:a2e:300e:0:b0:2cc:7b78:a4b9 with SMTP id w14-20020a2e300e000000b002cc7b78a4b9mr1298603ljw.1.1703032273686;
        Tue, 19 Dec 2023 16:31:13 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id k16-20020a056402049000b00552d03a17acsm4824397edv.61.2023.12.19.16.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 16:31:13 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 20 Dec 2023 01:30:53 +0100
Subject: [PATCH v3 12/15] arm64: dts: qcom: sm6375: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v3-12-3e31bce9c626@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v3-0-3e31bce9c626@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v3-0-3e31bce9c626@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703032250; l=718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Gc/yH23ZENvzGFFViZ7/qVCV3FeiRMp+LehbPO3k6Xw=;
 b=LpPP3sYjj29DdeD2Vc6CdLOLcwYNezXrAnQZUt5BWyEjmp2mTGBc7njoOaySLt1N2SXJq5YV0
 lfl88WAVSTwCh79WLhi3C4+SqgGLOo4sYa6Bkgg2kBksp2aCurg9l2D
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


