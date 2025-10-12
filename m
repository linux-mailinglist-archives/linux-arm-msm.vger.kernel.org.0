Return-Path: <linux-arm-msm+bounces-76855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A80FDBD07A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 18:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 378F34F29F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 16:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741372F1FD9;
	Sun, 12 Oct 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5eL70qF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B12ED16C
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286240; cv=none; b=Z+uYZCUOajCbWsFEOxNCA6YmUukJQ2ZVtiNcYdzzfebHMqF5oDj3SU1C4+4K5Xg9lok8TLANbQe7S9TQJyhgkFQgQOLQL/mi/BsrTQYqkJdWuPNyccBMIZAGp+BYxcybyIddYQCgbenW5wtA6ckx1F7kVISYm4CwvwhoWIOjq2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286240; c=relaxed/simple;
	bh=uoVbn3VVUUigPywid2f2V13SpTXgIyshJR5BshILzqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeSRmSEdk/0zSenmPb9CdAs/uNKf3oYVf9iQNbQ3nqlEk2gMBPN5S95bwmU7mIlisfdquMNIMK7dujcXB9hwB0+Y6GZtEwVWTqkZmnHSW5+s6ubIn1/sZzN/mwDEYIzwv6vc4OIJ0oYtOakPNyMaV68t4FayxcbI4O5xQp8yktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5eL70qF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CCjvwH009529
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7hD3U2/iftBn6nPxqDaD4P+oLTZnUv6Tt0CD8XpPOk=; b=O5eL70qFkIZJJHx2
	LKM8LAHfZ7xBoGhdxxtnrgg+uejcAa2fH3g72YIDv5T7Gv6n8vjs1CK1RKPlo55x
	vlakk6ufvK22DylNEKhPiXD1+1CkBDUd6ekpSAu5L33TbuELn0tWpertDcKNfgAO
	BReeBZrNHTgXQnbi5yiNS8bjiw/y3YFom01eJee+U2zi738oVWGUw+86pN4OMO/Z
	Fw5js+4aOKYhkHqMoAKcQashiCLVnSkla0cLD+ZRx4Znrl3eNY2dn4wCVdw3jxUE
	F0yOv4ESKnE1G6NPWgTNYr20iHNtFa3WNx1dBU0j5l2mdbbrircWY/cnZGlJ7Vms
	1D8qSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5a96m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8645d397860so3329496085a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 09:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286219; x=1760891019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7hD3U2/iftBn6nPxqDaD4P+oLTZnUv6Tt0CD8XpPOk=;
        b=LWaLmZ+IOB8NasIbvPDApZuP1cGPFXrh9UjudcWTv7cRbpvq4IRKN1U7WILJOAGmS1
         0sJURYzmgMBfB6MMZBRmRAQROBl4ESGEWXlOl2c0gKDbH4VsDBchIdMaFX5g1VigGvJ4
         O9+jBCNZr0VT4BUpG4WRSAbB62cUWkMnjG3sZkZPK7wDhTMZdsUFJn5kUuJOj1PAntx+
         QyXEKdi4EnPxNkf2kdyz0OnO5UnrF46c9jLsQYAQD+ynTLPgEYqRrm7dJz5cveStTMtu
         /vy5pQ3H7cBuikmrd6WhWmCZmFLL0d6Jqt5fZEgQ2qZhi63B05OBm68cSfLkY/RTziJt
         vpQA==
X-Forwarded-Encrypted: i=1; AJvYcCXv792RDfey9ST3qcCraruA9nu+IawA1C+nJOEBwQxQ/cPsp/rjDA9DQqAmOJpv5YH7VYCHptmaP6weUOMb@vger.kernel.org
X-Gm-Message-State: AOJu0YwvE1HdrLBs0HVfAHcuZgTqKLf+qU2hFhXmT4ByFF5FwQKMvEpD
	Bf5q+7rY/jAMHDhA2q238dSZufFLLtfQS9M9XLqccQtUoZyFoThxSQ4414OhA0TXxT7rF7+W5g2
	5F8AdHWxSTp0MGiVA4cF1XUx/qg64jbQ8Y0C9GycUu3W24+kBxzCZS3VdJAnsCrC6tzN3ghfLe9
	PW
X-Gm-Gg: ASbGncs5GAfe0GPItnUCg6Dr0vC3isLdvIneTLo9DfcEfQhPqLJnbsQGxuxgDMxwqU1
	U3iVjROouVxDvPEc+kV6fBJJcapvqiKQYp8BQk8+TDjxPamZxRmaN6sNyF0qbsSp6DhV7Gt5Up4
	7drnwl5nI5UfKRSBo5NKhN8T5alT5r1Kg7TUyhR5464OoxHZcy3PWOQMW2JHeU3TnCAyUEMSlV/
	gwtnDGK9lhiwgd2/1HNUS5zakz4UIOq7tXrOvgNtlfKZHebXbzfEgl3rmWZpBb0rTD2qPfLvd4B
	SHBU3tIx5IjkaI8vMZOvgTVmi6kq3VthAEc5W8xwuCdMw7+2Izx3l1jDMo48eOdbUExHC63kANe
	qcfDxwZbsibenbNCZq2vomw3oUCNVwYqP66bQKbSuOZSn7uYF7tGB
X-Received: by 2002:a05:620a:40d3:b0:860:f3ab:4456 with SMTP id af79cd13be357-883546e2a79mr2547042385a.86.1760286218702;
        Sun, 12 Oct 2025 09:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4JwPUtFhk/OK+gKUxoDCRRYqjs5hT7RmTfQr2W2axCdZhIUnAOsYkGsUpxa3h0v3qPQj+qA==
X-Received: by 2002:a05:620a:40d3:b0:860:f3ab:4456 with SMTP id af79cd13be357-883546e2a79mr2547039985a.86.1760286218242;
        Sun, 12 Oct 2025 09:23:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:29 +0300
Subject: [PATCH v2 2/8] media: iris: turn platform data into constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-2-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uoVbn3VVUUigPywid2f2V13SpTXgIyshJR5BshILzqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo69YDgTsZHb567g79+2iwK084AvbAnhqxEjRm9
 9NSmPXpVzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOvWAwAKCRCLPIo+Aiko
 1buZCACRMQ45/h9HldMZ8AbFLfBfgzhsCceXbmGXXavOhjnpjKg4FrOFRTBU9XXnVsD9BTio0eK
 P83GzPA6fvIdkatxBq2TAh7eo4i8swWVvo/Gc6vowoa0DYpD5cI9iYBmPck+rBJBV6o60VHMer4
 k1RYT5/Xc4HG04rtwCwCspqVyEiBmzB00KkBfSOyKSYNoCUFsM+HGwZYANnE6EQgNEKbooS+pIU
 34oW2hALsgWjXFMLOgUAYyk2QrfIfbk49Y3vBPKEeImLdKBvJ11VWer70Vg11uWnq0wxtaKOriK
 T/vo3zmaejBudwRTzdHBsJqPZcppFYTGM2BL9v5pu2N+pGRY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pwsl4Azs4OGSsExLVEYms_sLxDCugFUb
X-Proofpoint-ORIG-GUID: pwsl4Azs4OGSsExLVEYms_sLxDCugFUb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXzbHsOvzCNxzT
 rQbOohn4ZLvg8y6HHIE/52yqPM+vFIS6wapWdZkzmgGXdvB2hnqZY4vE4DHzhaetaVAObimrhdd
 7jp8AFf+/kecIt/YbL5eBAA02ljQBEeXy3xJZkTmFb7MOYZG3aMHJYkEQ/eghB5sXSZhFfDFQ3U
 s+b1fz2hgJ2W9qivyB3fSB8QUUizu6mYDsBu38FgnsGqtKhygZ6+SsrQnUxIy7Nt98cakbyF6o5
 63Ky8jMLX/NQet5fnP6nXsmAuVIwUpLkWRXZPqGA11Dx85dRpZo09Xas2D/XNHIFb0eVlW7oNDK
 FzYNw0bb3bNN2JItDxMvaocQCBfIr7TZWM1P9kP0uGAz9LCntJNutfpPgI61XM7eV+qWfVAFM4X
 1rL6rM1WVQX0gnEFx4pOqPQVRLy3AA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ebd60c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vHBkZ3WG4vhFy3QD8MgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Make all struct iris_platform_data instances constant, they are not
modified at runtime.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 17ed86bf78bb3b0bc3f0862253fba6505ac3d164..5ffc1874e8c6362b1c650e912c230e9c4e3bd160 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,11 +41,11 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
-extern struct iris_platform_data qcs8300_data;
-extern struct iris_platform_data sm8250_data;
-extern struct iris_platform_data sm8550_data;
-extern struct iris_platform_data sm8650_data;
-extern struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data qcs8300_data;
+extern const struct iris_platform_data sm8250_data;
+extern const struct iris_platform_data sm8550_data;
+extern const struct iris_platform_data sm8650_data;
+extern const struct iris_platform_data sm8750_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index cbf38e13f89e5c4c46e759fbb86777854d751552..b444e816355624bca8248cce9da7adcd7caf6c5b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -737,7 +737,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-struct iris_platform_data sm8550_data = {
+const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -827,7 +827,7 @@ struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
-struct iris_platform_data sm8650_data = {
+const struct iris_platform_data sm8650_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -912,7 +912,7 @@ struct iris_platform_data sm8650_data = {
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
-struct iris_platform_data sm8750_data = {
+const struct iris_platform_data sm8750_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -998,7 +998,7 @@ struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  * - inst_fw_caps to inst_fw_cap_qcs8300
  */
-struct iris_platform_data qcs8300_data = {
+const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index e29cba993fde922b579eb7e5a59ae34bb46f9f0f..66a5bdd24d8a0e98b0554a019438bf4caa1dc43c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -314,7 +314,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-struct iris_platform_data sm8250_data = {
+const struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,

-- 
2.47.3


