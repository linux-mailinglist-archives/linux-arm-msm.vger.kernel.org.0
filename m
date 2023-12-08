Return-Path: <linux-arm-msm+bounces-3990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08980A683
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37DCC1F21461
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C57208B2;
	Fri,  8 Dec 2023 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7CDpz9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED3210DE
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:04:48 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b27726369so23601705e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702047887; x=1702652687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bz0o75W9MzjWsPmoc4He/MB+sZajR/qnjzvhwV4daA=;
        b=d7CDpz9aXxCvxs9kUGV8eMwpf4b1Qb4xGWUJViLGBdOZEGI2waYOIqCQDNKlF/rFU9
         7nbGHvQy5UYNeIfI4oGyrX6+nVykdDrB0+MzXmSS44Uyn3GhYp5wt+4dC4duJH0KYV+Z
         6e/RjvZii4YjjzT2JR7/3aUz7X0PTQgp59CzgTHUkXOItIrna/ITJ4QAWSnJAzYe8DvM
         xKnr3VXMMh4osy2op6jCeRLoXK6JpP7Mp20QyctxYXb6ZrZ3+MNg9uqcgxgoLopsbP/a
         Pz06amljag0/R7whj/HRg4idZM6d94Fi2yt6gokEFALLC0WMg6VAfhIDfzdztqq9LYJ0
         glVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702047887; x=1702652687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bz0o75W9MzjWsPmoc4He/MB+sZajR/qnjzvhwV4daA=;
        b=sjPnAL3LwYpEsSV4lNoeh+1kThksRmI5os1fRu7TdpMgCfTQXbgJvn/RQ9m8HC4Cs8
         sbrLo3ngSyfA2EeqCF2oI8jw3RUCesibvNCWLfqyLolhfZ4KZ7qnV/mKxKOPShuITYCZ
         bEw3aeCNEPd/9d1sBNQj/39xGu8wWiXzkS056LPqwceJ6Nsy9yKjBldLWL1hQQu7EW6q
         eRspIrT+fSXHLzeClUuulC3lMuc27Zs+JdJXU1tH7osc58gl2q31R3w1QxuuBYUJb4lr
         uiugQYOX4hsvwAmKTJxKmer18VYOcc1mBiDYDpyOGvAjwpmmJCxbTUViHHCVyk4u1Ffm
         4uLg==
X-Gm-Message-State: AOJu0Yws3FOgFf0dmF1viegC2NrMPpfUIcYTFcDmm4IpDVcrqCFMbKWR
	v8Bo8LtKF2GIGNAyMK73Qd85aJdCD/cYkYfHlCjwdnFm
X-Google-Smtp-Source: AGHT+IGDI2fCx+vZCS3lHiLW7ZwS3gdvHKJv1VeClxkJuterxZyNMowaDAqMfBLEYM7ikZbnserOYw==
X-Received: by 2002:a7b:c4c7:0:b0:40c:38dc:f6bf with SMTP id g7-20020a7bc4c7000000b0040c38dcf6bfmr46253wmk.113.1702047886472;
        Fri, 08 Dec 2023 07:04:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm2000403wmo.16.2023.12.08.07.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:04:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 08 Dec 2023 16:04:35 +0100
Subject: [PATCH v4 3/3] remoteproc: qcom: pas: Add SM8650 remoteproc
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-topic-sm8650-upstream-remoteproc-v4-3-a96c3e5f0913@linaro.org>
References: <20231208-topic-sm8650-upstream-remoteproc-v4-0-a96c3e5f0913@linaro.org>
In-Reply-To: <20231208-topic-sm8650-upstream-remoteproc-v4-0-a96c3e5f0913@linaro.org>
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
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Yr+xJnX3+hDxJJC9As0bT7NBW6HwY0A1wunSQu1QjKk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlczCEjBeer/jq4rycqvkHab/25ZaCLwFZijMUPLxW
 dVHZp6eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXMwhAAKCRB33NvayMhJ0XmmEA
 Cog4G+a3m9hGo96czS42RFwcYU/MSAY5+joX58uUmp/5yklIEomWX9L+6SCd0EpJXvlLSP8VPo5BKK
 xbUqwv6oJNqZTAhgDtP+9VIc0N/tk1J13+ePDfxOVDrKDbLxnyLGN8CDo3htAlVQingyPFX2Z796RF
 iSB1HBT2HzzkorwT9M6X0QItjJbq5xec4SfGqV6jcy7wbp2/QNo2u60VXKSLzXyb+B/lLWIv7K74k0
 sEa4we0DBcAJO0dpE6FLW1N6VDBBOi+sXR0LORvRjyZNpybylQpjyF+RlkkM6WnA8gmsxNoxQSZWt+
 oCdeK7khSCspP1XoWmtrWzyeXUfBnvF0V22vmHduZ0b1qE97J1Fj71tnTx2w46jTj/6NtikqwcWeq/
 P2L0wnHrKxhmFhFrq7d2QujXsehF5bV0miJnkIR7QDmjUk8fGoQyZyzzrGtRUn4QpLUIIbsBI0SwH/
 S/u0lhUC+lYRUb+wcwcQlfRmN5DBsgQZvxGYYXtIXW7NY0H2GorFShV36O5jUNRtmPFDPGpm7mevEf
 ZkABNf5nwwqb1AXkwfey8Tb7rrumjb8i+RKF9MK4CnXzGP2z3k8MSCblDSg5nUXOxL5J2OzsclKjne
 15lChqz4Kt6gHxJ/NkpjMAtMJtXPRwxQ6TBVqora2s7AwrNC9G/5vTLfNmtw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add DSP Peripheral Authentication Service support for the SM8650 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46371f1ad32d..01effbd969a5 100644
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


