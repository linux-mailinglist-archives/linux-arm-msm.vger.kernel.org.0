Return-Path: <linux-arm-msm+bounces-6273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E082210A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 19:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E1E1F2342F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 18:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B69C16415;
	Tue,  2 Jan 2024 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWcnYTO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A25E15ADB
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2821884a09so101850366b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704220213; x=1704825013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cp5GNYs8COIpVS3xr0MHdRdJQ4iBxaqmuCTnKQzb9HQ=;
        b=vWcnYTO1HYUYJviMjPW/Omttgckm6yu/65N/K/836mrO/+6fo5Vg6ZSXbV4GcRtDah
         0AFYeoLi3J/YIzfEyQtRvWpoDB/giitUw9ln9w1T4duMJbqxQeHgRioLbA2oZOwIkk6D
         iJOJfBFIy/PR57nwxHTHH8xj86R8X1KUZ1FOUcKITx0ctMD4VXmSKTxIHwg2mZ5deUQF
         YphfV+nN3cS+pBTDYxTZlD48yLKlDq/1IM1rvcG3ISlvGei5COmuvfs8FrXdCpjRDFwy
         v3EUpGd9Kj9JSnEbrm3xsFR1J/g5wbU6SBG1V3KKYptKzH1ai7911xxG7CuwDMDpPHOY
         v17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704220213; x=1704825013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cp5GNYs8COIpVS3xr0MHdRdJQ4iBxaqmuCTnKQzb9HQ=;
        b=bmfLt2huyKPpZDhYihOr6780zPyC/XrASdufXPLGTNdB4ysHXlBpt6NHEQuaKAQ9ds
         dyKnb06Ejit3FbGkYAGUkbMm7SKaxGnbqD2ug/KcSvbsP4mlvx5xx9LHOyyYVG/1LsrO
         kNqjuRjr37dIzBnvqW3BD0v7TKVdikm4wZNv5btACUAczHUhwoITcQyGTWw33c/pg9uA
         PlMHoaUsuhOU2Nvcbzv2ZJeNWkhqhQh0EHm4i25vfIjgciyGbl93Lo/oeJmX642NCc0d
         BV7FchChTacwGUeinYTWbO2XosmDnkvUrYRDG3YwyjoypeGRIEOMGZtwqlcEZoBIAVPv
         r1AA==
X-Gm-Message-State: AOJu0Ywb/2ny2Ymh6xNJz1dXXu/rlEgUosDZQT2/xbFwEzPKAUR1PYdm
	yIpLsiLeulSHukVZC4GHTzQ7MPRsL0wR/Q==
X-Google-Smtp-Source: AGHT+IEtrEeyMfPqrNLa3Jtqiv9w2sKozdJ2TbgYHjpAJW+k52RxgM/5dlUFCx+gNLIZkLr24Jpv+w==
X-Received: by 2002:a17:906:413:b0:a28:2165:7c74 with SMTP id d19-20020a170906041300b00a2821657c74mr1307851eja.13.1704220212903;
        Tue, 02 Jan 2024 10:30:12 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id et10-20020a170907294a00b00a2699a54888sm11968835ejc.64.2024.01.02.10.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 10:30:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 02 Jan 2024 19:29:50 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: x1e80100: Flush RSC sleep & wake
 votes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-topic-x1e_fixes-v1-4-70723e08d5f6@linaro.org>
References: <20240102-topic-x1e_fixes-v1-0-70723e08d5f6@linaro.org>
In-Reply-To: <20240102-topic-x1e_fixes-v1-0-70723e08d5f6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704220203; l=982;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZMHte+R+v5WQ2x6Ng6sIhmvNpiEdoapaHW4wE0VSFZ4=;
 b=7um3uB/1kZ41KjjEu9/1KhmrD49Zm4CmzwAHeG/8u+R44ad6kRC5yv6KeqQ8a44EBZeBZKKAG
 sZ5DqheX/UACWzaZr8mqKzg6SQO0/ZNgd/wLY4Ks6b0ACbRoShImT3b
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The RPMh driver will cache sleep and wake votes until the cluster
power-domain is about to enter idle, to avoid unnecessary writes. So
associate the apps_rsc with the cluster pd, so that it can be notified
about this event.

Without this, only AMC votes are being committed.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index fc164b9b3ef1..2a14e8e39b3b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3334,6 +3334,7 @@ apps_rsc: rsc@17500000 {
 					  <WAKE_TCS      2>, <CONTROL_TCS   0>;
 
 			label = "apps_rsc";
+			power-domains = <&SYSTEM_PD>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.43.0


