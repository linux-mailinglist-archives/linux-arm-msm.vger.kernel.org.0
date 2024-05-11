Return-Path: <linux-arm-msm+bounces-19740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996E8C33F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 23:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98CC281B4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7991847F58;
	Sat, 11 May 2024 21:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAcaYS67"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E261F29410
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715464572; cv=none; b=Q2F5viU+4QTubac64lD/Y72H5O77ztddavXDgAyIZqsQhJ3ICqAsgs2lMSGnvPuht7sNtQS3wG0TXskK3vA3VDCwdGVF4+Tra06L0AtGcYZ8kvZ5ObPoA46g3iMCCAq/A5xDrcRKrFxByj2H4Qo4QW8YIdztJcdPvvCpeTpYF+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715464572; c=relaxed/simple;
	bh=yQDs+0Fh1pwN3+9Sn6IIpcqD4wSdcFS6BiLOBdrJtGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gYNgcRDkiFPPWCzM43lhf3YPUozWtQd6HUa/mjBPo5p27Us4fE6XnK+olAEzyE9vwmhXI5Ey4u0aKINwM6Ng34/QxaK62yBKhiohy5R06QxG+rhIdTrhwpYQkFu1vfSZ27zXEkL99tglhiummUbuTyzKpO4rwqAXo/nai04NVgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAcaYS67; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f174e316eso3754645e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715464568; x=1716069368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcqYAPPbozgrojXydFWnsOuCPYDao3lghxJWHLuDCDY=;
        b=DAcaYS67HoGMXFczs09ny7pO4K15MztKh7appqxVNlVGL6n4DOsTJU/Adjyt8jfjHy
         +zmH/WkdJQYFy9vbk9joEhRfN/9OKd0A/VXaVCE+qAtLhO1G0MApQ7vvtJA7SkfLPak+
         pXdfh9qRNdtaZTArKW5sF/gYfu3lhUO7pFxL+j4Ihn5JiA/8PoaB3ngkBHKJeicaSpYD
         SLMEcxk35L5JgqtKUq/8uAiiD32OH/l5PiBbYMfceMVoPQbkNk+DZrEe2fmT2zI3qlt7
         1eo+Zf+kH8H85iNKrZInn8H6Kxk3OeReyXxRF/eh8EGzhCnim4YNxiCMqCI5fIgTdjYT
         OiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715464568; x=1716069368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcqYAPPbozgrojXydFWnsOuCPYDao3lghxJWHLuDCDY=;
        b=nV+8k4jJbQXPlzTl2FElg6cQ1eg5BAn69UEoqoKn+N0N7YlZ8kHMzBe86vB894Nkm7
         8ZU69u5d3kN/TZ6tnwUrZpBtsWz2V0dOx5DmM+dXb2qz4UHqhhX1Ox1qVZbCORMR+JGP
         oJzv3EOCOjeu+3zQfF4p7EQDE1C7fqu3ocVqgrNLZIi65rXF0xjvBA3RJNrfX2JxSxog
         E8t1KClrh8Z1TcddILfwm84CbbWDRH3P4238g6oTqmogR+Pt7RDJGoR9BxYk9KiL4b3s
         p9Pbn+5zifwX7FLU22IS6segeqnKq8EcEwPy9Ep5lSQ2V0eWBAVwe0ZL5cRqH8D0nHZF
         s2+g==
X-Gm-Message-State: AOJu0YyUJyppHaikPy8lqj4eWNH4P/pQWapVLARxo/HuuwGxXBe8JteB
	uCoQc2OJ4+H2z6DQUu4Lviqa3j7wWZ4iTTxODVNPAV7SzBjS96VOQmNQ0PhuQQw=
X-Google-Smtp-Source: AGHT+IHXNbAZeFQp7yXipE3qIsRY873plvAZgirFF0oLvKlajzcszqKU8R842fkFdOfaKmzo/CA3ug==
X-Received: by 2002:a05:6512:e97:b0:522:3551:35f5 with SMTP id 2adb3069b0e04-5223551366emr2660902e87.14.1715464568076;
        Sat, 11 May 2024 14:56:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d31d1sm1127576e87.286.2024.05.11.14.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 14:56:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 00:56:05 +0300
Subject: [PATCH v8 3/5] soc: qcom: pdr: extract PDR message marshalling
 data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-qcom-pd-mapper-v8-3-5ecbb276fcc0@linaro.org>
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
In-Reply-To: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21949;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yQDs+0Fh1pwN3+9Sn6IIpcqD4wSdcFS6BiLOBdrJtGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+l0AnGTyUB3hBUh4NPyWIsOXyYdZfTdf+qM4
 RmQjN0a9USJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/pdAAKCRCLPIo+Aiko
 1Yh0B/49WONU1NMzmfoex3mnCwWhLgPUF1YmtWZU7KcT0Woz+bF5bLl5XlIaUdmFkSDubv57j5p
 g4WC+tozTITI3jbdvlhZHrILRLm1vP9WvJuisytpkzip2eKtDXF4WIBqVYe0saWqYxa1Uf8yVXe
 Q+Mf/YTBF0prn1eFsf33jiXrYtaYnjW+bRnufIXlqSIaYXDe06rs+joiB1g7loyVmBOTG9ocQZO
 huM6/wjiJLZMcQV4es/iCvQf5UM3DSggvgPnMtGxbWKF752IgGoynJmqSAJvNqoRTxu51icMiao
 ml95CfaPNayu2tlfoc00KykL1qlKrS3GOpvaeU7FRNYi3Ov+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The in-kernel PD mapper is going to use same message structures as the
QCOM_PDR_HELPERS module. Extract message marshalling data to separate
module that can be used by both PDR helpers and by PD mapper.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig        |   4 +
 drivers/soc/qcom/Makefile       |   1 +
 drivers/soc/qcom/pdr_internal.h | 306 ++------------------------------------
 drivers/soc/qcom/qcom_pdr_msg.c | 319 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 334 insertions(+), 296 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 5af33b0e3470..95973c6b828f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -75,8 +75,12 @@ config QCOM_OCMEM
 config QCOM_PDR_HELPERS
 	tristate
 	select QCOM_QMI_HELPERS
+	select QCOM_PDR_MSG
 	depends on NET
 
+config QCOM_PDR_MSG
+	tristate
+
 config QCOM_PMIC_PDCHARGER_ULOG
 	tristate "Qualcomm PMIC PDCharger ULOG driver"
 	depends on RPMSG
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ca0bece0dfff..3110ac3288bc 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
 obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
+obj-$(CONFIG_QCOM_PDR_MSG)	+= qcom_pdr_msg.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 03c282b7f17e..7e5bb5a95275 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -28,83 +28,12 @@ struct servreg_location_entry {
 	u32 instance;
 };
 
-static const struct qmi_elem_info servreg_location_entry_ei[] = {
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct servreg_location_entry,
-					   name),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct servreg_location_entry,
-					   instance),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct servreg_location_entry,
-					   service_data_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct servreg_location_entry,
-					   service_data),
-	},
-	{}
-};
-
 struct servreg_get_domain_list_req {
 	char service_name[SERVREG_NAME_LENGTH + 1];
 	u8 domain_offset_valid;
 	u32 domain_offset;
 };
 
-static const struct qmi_elem_info servreg_get_domain_list_req_ei[] = {
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_get_domain_list_req,
-					   service_name),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_get_domain_list_req,
-					   domain_offset_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_get_domain_list_req,
-					   domain_offset),
-	},
-	{}
-};
-
 struct servreg_get_domain_list_resp {
 	struct qmi_response_type_v01 resp;
 	u8 total_domains_valid;
@@ -116,264 +45,49 @@ struct servreg_get_domain_list_resp {
 	struct servreg_location_entry domain_list[SERVREG_DOMAIN_LIST_LENGTH];
 };
 
-static const struct qmi_elem_info servreg_get_domain_list_resp_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   total_domains_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   total_domains),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   db_rev_count_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   db_rev_count),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   domain_list_valid),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   domain_list_len),
-	},
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = SERVREG_DOMAIN_LIST_LENGTH,
-		.elem_size      = sizeof(struct servreg_location_entry),
-		.array_type	= VAR_LEN_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct servreg_get_domain_list_resp,
-					   domain_list),
-		.ei_array      = servreg_location_entry_ei,
-	},
-	{}
-};
-
 struct servreg_register_listener_req {
 	u8 enable;
 	char service_path[SERVREG_NAME_LENGTH + 1];
 };
 
-static const struct qmi_elem_info servreg_register_listener_req_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_register_listener_req,
-					   enable),
-	},
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_register_listener_req,
-					   service_path),
-	},
-	{}
-};
-
 struct servreg_register_listener_resp {
 	struct qmi_response_type_v01 resp;
 	u8 curr_state_valid;
 	enum servreg_service_state curr_state;
 };
 
-static const struct qmi_elem_info servreg_register_listener_resp_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_register_listener_resp,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_register_listener_resp,
-					   curr_state_valid),
-	},
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum servreg_service_state),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct servreg_register_listener_resp,
-					   curr_state),
-	},
-	{}
-};
-
 struct servreg_restart_pd_req {
 	char service_path[SERVREG_NAME_LENGTH + 1];
 };
 
-static const struct qmi_elem_info servreg_restart_pd_req_ei[] = {
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_restart_pd_req,
-					   service_path),
-	},
-	{}
-};
-
 struct servreg_restart_pd_resp {
 	struct qmi_response_type_v01 resp;
 };
 
-static const struct qmi_elem_info servreg_restart_pd_resp_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_restart_pd_resp,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
 struct servreg_state_updated_ind {
 	enum servreg_service_state curr_state;
 	char service_path[SERVREG_NAME_LENGTH + 1];
 	u16 transaction_id;
 };
 
-static const struct qmi_elem_info servreg_state_updated_ind_ei[] = {
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_state_updated_ind,
-					   curr_state),
-	},
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_state_updated_ind,
-					   service_path),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x03,
-		.offset         = offsetof(struct servreg_state_updated_ind,
-					   transaction_id),
-	},
-	{}
-};
-
 struct servreg_set_ack_req {
 	char service_path[SERVREG_NAME_LENGTH + 1];
 	u16 transaction_id;
 };
 
-static const struct qmi_elem_info servreg_set_ack_req_ei[] = {
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = SERVREG_NAME_LENGTH + 1,
-		.elem_size      = sizeof(char),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct servreg_set_ack_req,
-					   service_path),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_set_ack_req,
-					   transaction_id),
-	},
-	{}
-};
-
 struct servreg_set_ack_resp {
 	struct qmi_response_type_v01 resp;
 };
 
-static const struct qmi_elem_info servreg_set_ack_resp_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type	= NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct servreg_set_ack_resp,
-					   resp),
-		.ei_array       = qmi_response_type_v01_ei,
-	},
-	{}
-};
+extern const struct qmi_elem_info servreg_location_entry_ei[];
+extern const struct qmi_elem_info servreg_get_domain_list_req_ei[];
+extern const struct qmi_elem_info servreg_get_domain_list_resp_ei[];
+extern const struct qmi_elem_info servreg_register_listener_req_ei[];
+extern const struct qmi_elem_info servreg_register_listener_resp_ei[];
+extern const struct qmi_elem_info servreg_restart_pd_req_ei[];
+extern const struct qmi_elem_info servreg_restart_pd_resp_ei[];
+extern const struct qmi_elem_info servreg_state_updated_ind_ei[];
+extern const struct qmi_elem_info servreg_set_ack_req_ei[];
+extern const struct qmi_elem_info servreg_set_ack_resp_ei[];
 
 #endif
diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_msg.c
new file mode 100644
index 000000000000..9b46f42aa146
--- /dev/null
+++ b/drivers/soc/qcom/qcom_pdr_msg.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/soc/qcom/qmi.h>
+
+#include "pdr_internal.h"
+
+const struct qmi_elem_info servreg_location_entry_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   name),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   instance),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   service_data_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0,
+		.offset         = offsetof(struct servreg_location_entry,
+					   service_data),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_location_entry_ei);
+
+const struct qmi_elem_info servreg_get_domain_list_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   service_name),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   domain_offset_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_4_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_req,
+					   domain_offset),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_get_domain_list_req_ei);
+
+const struct qmi_elem_info servreg_get_domain_list_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   total_domains_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   total_domains),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   db_rev_count_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x11,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   db_rev_count),
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list_valid),
+	},
+	{
+		.data_type      = QMI_DATA_LEN,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list_len),
+	},
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = SERVREG_DOMAIN_LIST_LENGTH,
+		.elem_size      = sizeof(struct servreg_location_entry),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type       = 0x12,
+		.offset         = offsetof(struct servreg_get_domain_list_resp,
+					   domain_list),
+		.ei_array      = servreg_location_entry_ei,
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_get_domain_list_resp_ei);
+
+const struct qmi_elem_info servreg_register_listener_req_ei[] = {
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_register_listener_req,
+					   enable),
+	},
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_register_listener_req,
+					   service_path),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_register_listener_req_ei);
+
+const struct qmi_elem_info servreg_register_listener_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   curr_state_valid),
+	},
+	{
+		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof(enum servreg_service_state),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x10,
+		.offset         = offsetof(struct servreg_register_listener_resp,
+					   curr_state),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_register_listener_resp_ei);
+
+const struct qmi_elem_info servreg_restart_pd_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_restart_pd_req,
+					   service_path),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_restart_pd_req_ei);
+
+const struct qmi_elem_info servreg_restart_pd_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_restart_pd_resp,
+					   resp),
+		.ei_array      = qmi_response_type_v01_ei,
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_restart_pd_resp_ei);
+
+const struct qmi_elem_info servreg_state_updated_ind_ei[] = {
+	{
+		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   curr_state),
+	},
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   service_path),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x03,
+		.offset         = offsetof(struct servreg_state_updated_ind,
+					   transaction_id),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_state_updated_ind_ei);
+
+const struct qmi_elem_info servreg_set_ack_req_ei[] = {
+	{
+		.data_type      = QMI_STRING,
+		.elem_len       = SERVREG_NAME_LENGTH + 1,
+		.elem_size      = sizeof(char),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x01,
+		.offset         = offsetof(struct servreg_set_ack_req,
+					   service_path),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_2_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_set_ack_req,
+					   transaction_id),
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_set_ack_req_ei);
+
+const struct qmi_elem_info servreg_set_ack_resp_ei[] = {
+	{
+		.data_type      = QMI_STRUCT,
+		.elem_len       = 1,
+		.elem_size      = sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type       = 0x02,
+		.offset         = offsetof(struct servreg_set_ack_resp,
+					   resp),
+		.ei_array       = qmi_response_type_v01_ei,
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(servreg_set_ack_resp_ei);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Protection Domain messages data");

-- 
2.39.2


