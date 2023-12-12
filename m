Return-Path: <linux-arm-msm+bounces-4351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699480E691
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C4BD1F221CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23C922338;
	Tue, 12 Dec 2023 08:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ib6MRxWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12783ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:45:29 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9f85eff28so80625331fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702370727; x=1702975527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Omz/DgpKUeGQilLLhVjXFEyh0Z9R1EKXUyzxBMs6J7A=;
        b=ib6MRxWIL6rcsVNiLs0MzvX7Lah9Ouj/7I9hxsARoR6+2FR0r3xQ8YhmIeFC6xrjzq
         AtlibE6fZddGgE43fiRwhBcMmvyBmfCVrGNu5ZuB01GSvfJpbN/Qy9PvJMxGatcSCSHr
         HUV6SjIUttnXfSFIX4OnRsaKfzmYMtbm98TycLD8KNfLZRIgoTHfa89tRKFMQKs5lGOC
         Pq8oomORwJv38mYaBGJ+TOpEFngYknY2469FfyoxmQgl6KQy/10dF0bU7tsTc3BB788J
         vYuKnvxP2BH8v/5b+twYKxMFID6PL3xh7mG/4d9MZT8zX8fZF3hu2DUivtp/vyF8p8ie
         nXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702370727; x=1702975527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omz/DgpKUeGQilLLhVjXFEyh0Z9R1EKXUyzxBMs6J7A=;
        b=LDU4oFWVR/T8Mk9Kai45XT+MDjcfDiXoksXT/+fq9phQD8QM7qXvAn1mlNkVS2DuXo
         4TkKT5OjXoR/PJ964IJJlz32w3U3oaXvpPypK4yMOJGb3g2LNChoFZUw0fro5Ycbr8D5
         Q6UYxjWMtFA+ani7rh127yeCHet+W9rIZWmH5zd2TROcapxL6ywKI2k5RoTnQ3cllORY
         alypSxXkIRz8P0CPzuZ9dYf3ckIj7xXbZHGD5yPp3bY7l46IJcngd1TxYNHBR7GGQAyq
         oHqBKLRnUTDKMkXaYeyjf5sglyYSBo6BpNR99NMM0BSDLW7xGKe/iKYCmXTa40hARpVS
         oYGQ==
X-Gm-Message-State: AOJu0YweICpMtyt8AC/3JTDOvQUa8ZhrUXyRBwJpuHomcO24vbtHTaqq
	dpY1bjrNN2MgN6s02OyCMQuBbg==
X-Google-Smtp-Source: AGHT+IHMmAjqRoFuJlflIFweqSIshflAgg68eCfZzlldRID0DuaOj865r76XRIm+aaLf+ki8Cy/CUw==
X-Received: by 2002:a2e:a883:0:b0:2cc:1c66:5de7 with SMTP id m3-20020a2ea883000000b002cc1c665de7mr3241908ljq.36.1702370727197;
        Tue, 12 Dec 2023 00:45:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c27-20020a50d65b000000b0054c9bbd07e7sm4650471edj.54.2023.12.12.00.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:45:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 12 Dec 2023 09:45:19 +0100
Subject: [PATCH v5 3/3] remoteproc: qcom: pas: Add SM8650 remoteproc
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-topic-sm8650-upstream-remoteproc-v5-3-e749a1a48268@linaro.org>
References: <20231212-topic-sm8650-upstream-remoteproc-v5-0-e749a1a48268@linaro.org>
In-Reply-To: <20231212-topic-sm8650-upstream-remoteproc-v5-0-e749a1a48268@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rcCMAhKznACH/kVnuoo9vdWWRW8gyLT1bcz1jsoDm8U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleB2hQh4l3ez5dH/Fy4acIk6r7JJPBD0Sk8rMok+E
 Mqixxc6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgdoQAKCRB33NvayMhJ0aznD/
 47ng77aB6Y9baLrDGX4/bd8O72LboU3vWD4/mB6rxaa+3p8cJ/0K67eNwKRkiZnqQZRfzsYKhj4GXB
 jOBpDGHiZ2OLds8CJCrlksNmzRU4T4YPc4W6+ZytTMQ6998IxX/F8iAsytGaDKNkP8ol1tWGkTrblG
 JnjjAkr6oxN5+eQFMnoYn3xbEal8xsKt/zE+I2dKcHkf8oTTbM2xWQL0sBgoRTI+0sDtPEvg215MiJ
 mLZVe9zUdr0FhN4ZFHz2qUcl/+bqfquuq9uDksDOfthkXwAbZaCOMJmT+J4baqVVOgZRfTK7gkX6fB
 D11yZxX7OxoSiayxX5b9PKiRFXNhCi55CJjEHAK3lS1wPXvrASwmCZz3LBP3QXWhOVH2jqeQEhxUwa
 yRmAjGPBleIRi4NLLlPwR0Hqf4x5n2lVYCm/QgL8iFm7h0dAtcRYnube/CujZUCnMPaTVFHnhdBGBT
 Zk+iCe0SBrJ/8U2z0Ib/XVJVRdlgfw/ZL5btaLpMTFQoszGzff7382GJCypjSsrNt2NyyMh4k5EFPL
 X1h40u1u5otDmBUI86Jar4hHKAOvUFPzd3kBXibYTqSSaTpZF13J9VtjEKmqEeUBVCEB6V5/ocqmgd
 VXMpyreoTwOmRPElManJpF6wWs1QSaaUT9ZJGhOaZwyprXWS5wydh727DVIw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add DSP Peripheral Authentication Service support for the SM8650 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46d744fbe8ad..83dcde2dec61 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1197,6 +1197,53 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct adsp_data sm8650_cdsp_resource = {
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
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
+static const struct adsp_data sm8650_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.dtb_firmware_name = "modem_dtb.mdt",
+	.pas_id = 4,
+	.dtb_pas_id = 0x26,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.decrypt_shutdown = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.region_assign_idx = 2,
+	.region_assign_count = 2,
+	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1249,6 +1296,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
 	{ .compatible = "qcom,sm8550-mpss-pas", .data = &sm8550_mpss_resource},
+	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource},
+	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
2.34.1


