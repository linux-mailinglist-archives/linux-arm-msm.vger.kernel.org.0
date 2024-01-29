Return-Path: <linux-arm-msm+bounces-8862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DF84071A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 14:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB573292D4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 13:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9306B657D8;
	Mon, 29 Jan 2024 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OfNsJ+Bt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1325651BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706535298; cv=none; b=rYvzqT+7MNH7mU7d4h8bBZBjqeV0kGa+LIYEuiC10GS6IgZWH2E8XzhnAFIbopFC6WTwTY78yxda6T5+APbWpBMZDIsYaNI3NBUqfogLLipT/mWUEK2f1v1EXrdf71qI+y0C7M0YbsjfNlf+8yKeCL2UbnMAd9X0HTKwtD0fIXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706535298; c=relaxed/simple;
	bh=wdn/wZ9b8W1bnANHx+6S/tiPBkRJBhyN5YhjHpYlMIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/xBASxdbBwUrAt5TJerLUrGoNSBcDTFTNqdzyVrhyBql891o9bTcgb+GJCPA0BQ650Uz6caPdP3EcMKMzaJuuBVvA/PY807GCyoK+1jx8jwfhxJ+FRMpi0Lh4ASha1aLX14UreoaMKRBNnPKntnRZQf/T0xGRnPwufT45TNM2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OfNsJ+Bt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a353f5407f1so218178466b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 05:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706535294; x=1707140094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdcXCLzd9KOe5SpDxhfl/e/wMVJJon4JM9yQ3cbHbSo=;
        b=OfNsJ+BtQM7tDbRNuhqyDiU8dZKuLmaGVe6L8G+FKYDjEAQg8BO7S3A3YYw8agckoA
         qs48OHIWAIXrTTcJbIUMdH/OvAixjaEoQ4RHPRWpaK169FnYYs+g17fjCAuKxcEkiUbW
         SnjCOkfktmUyT1IN81kwOnWkWXOmQCQHDbDeY1Wp8mJnOiHBCH4PJCiGqurpQ2av31oM
         pR4XhwZ/tGL05qu1xCgkkFaicDuv4DY/3Pk0iUWTYsMrAhUXXfQ9mpKtjJ5ijXQGRX08
         +rznb4pOlt3rCuuJrstHN13w8yXY256EjU4OIA8PYi/cCVr4H7vYPCwNUuC0kfIR675J
         t40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706535294; x=1707140094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdcXCLzd9KOe5SpDxhfl/e/wMVJJon4JM9yQ3cbHbSo=;
        b=vMxtMdEIIIoKcgBHiMkISPStCNgWY/aOVeMdYPFO/1TJCq3HO2LvV+9uEl4ibkrRX/
         uoc0hIBIya7jtep4isNGhdUtWfEQ0EnGxDt+RdCmGlFCfsxIFgyRdzoPbw8l9D5GXgh5
         NvrgLp/iyx3hOuX3SyDFaohs78V4YmUiYhr2WzwdOxdWJd6IGAj1XTwTQTJHXn2fKFcG
         z9fOzR/E4Nk7o+Qd8XzI8PsQdDZOMwPneUINmRp/PddB66UnfB7+yIMYdp0tOQB0q2VZ
         PNuo2NEqVYvFS63JzfBNFCnvNSHN06Ya0P/CEjE7Skid3ps54zPpyRw9tyHu4TAOaBbr
         CFIg==
X-Gm-Message-State: AOJu0YymHzvOKEACxBJm4/daWyZGBDK0J1HSMljn72VV+m49EAH3HWwV
	D1lCkbOUf9ENxwgCwW1M8253xN4IBTZVMuy4Gug0ss1o4QlNX21tiDihqFSNM3Y=
X-Google-Smtp-Source: AGHT+IH7saOUr5yw9rn3nQFRoV0+5ssv25l14Q+BJByJ2Y5p3G1BeymX/xM8ALx7bWDIKPF139miQQ==
X-Received: by 2002:a17:906:13d9:b0:a35:fdf9:e7e4 with SMTP id g25-20020a17090613d900b00a35fdf9e7e4mr106370ejc.20.1706535293850;
        Mon, 29 Jan 2024 05:34:53 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vi1-20020a170907d40100b00a2f48a43c3esm3911483ejc.7.2024.01.29.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:34:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:34:38 +0200
Subject: [PATCH 2/3] remoteproc: qcom_q6v5_pas: Add support for X1E80100
 ADSP/CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-remoteproc-v1-2-15d21ef58a4b@linaro.org>
References: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org>
In-Reply-To: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=/QJcyc/EP4tWWsxEgO8p8lnXcW7ZNTZEWA9LmIq7uW8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6l3UxfLaKsr8EpmNZGbkK8EyLVlV9KbulUZO
 gLOUZfUOqeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbepdwAKCRAbX0TJAJUV
 Vku7D/0fk1XRNqJSxuFkAMSfSThIUyb15qheSIaoRDXT/NlJVlCaIHs3JhIcbDbaXcIKp5hY3uN
 vj6BsHuGD/HERNJtdVtV9tY+AE6CP60aZ03Vg2BUEPjtvw0yOcE5RI7dYLlHpDu/YYeBTdcA8ew
 Ej4HprEwuNNoHhySKRVD29jTGcdNFVATLvOAML/0cXrOiNb9D+XBFFk+jUOwYh1sqhWHBfWTLyp
 s6Xyeh+czuB8/Vx1GJoQxlhFApitK0xpD27l+Pe64uQcX+KW1H368wcE0cJJEqFwVD075+MolCN
 cpnJP/h6V4tGGQIzskGdfJCt3cVaLCeU+m94r3ym3i/sHmH1RTAkoHiPjhAtyMHG+nozo7qx9e5
 PNpVh7+vNPud0nKhLzg8H8k8Z2EFj1yJ2Rsp/9lEwmlOpUSE8nz2HiFd5ejdC5Aac2o4jLR0lzf
 GhrO2MNf1JGXu8qzsGVpKQYFKR9HYEOBsEzd19F9H6PmreXkoLHB4e7Ryox1iImDBYI4aUFIsPE
 2S3niPvs78Qf7OjGERUdulzLkYvxP2v7vriW2hnrW29xLfzYLH6YYFW/guhrbaRcFBXUavYXsy/
 cpWR4ptT51t3qxOkt5E/W2kJff+i6l9fQWhNZAXGref1/IAfBwSUlVBpb9S+/LvDJV8ERb1xWZx
 eeF7sA0BdfqL4Rg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

Add support for PIL loading on ADSP and CDSP on X1E80100 SoCs.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a9dd58608052..083d71f80e5c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -984,6 +984,45 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
 	.ssctl_id = 0x20,
 };
 
+static const struct adsp_data x1e80100_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mdt",
+	.pas_id = 1,
+	.dtb_pas_id = 0x24,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
+static const struct adsp_data x1e80100_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
 static const struct adsp_data sm8350_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1236,6 +1275,8 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
 	{ .compatible = "qcom,sm8550-mpss-pas", .data = &sm8550_mpss_resource},
+	{ .compatible = "qcom,x1e80100-adsp-pas", .data = &x1e80100_adsp_resource},
+	{ .compatible = "qcom,x1e80100-cdsp-pas", .data = &x1e80100_cdsp_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
2.34.1


