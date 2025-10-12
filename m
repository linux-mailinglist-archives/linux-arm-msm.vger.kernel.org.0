Return-Path: <linux-arm-msm+bounces-76859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D47BD0786
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 18:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A4023C3047
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 16:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E402F261B;
	Sun, 12 Oct 2025 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwXl+PEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7D2F0C71
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286248; cv=none; b=ORsn2URZwbTp9ckHySR3fG8nI0iMgAoDD3qEq/0Wt+Ws9MvSEWR/pDrePbqDTwHsFw6QxEmBF37NEQa7QNlnIOXrXb8wsvVSePpU/AlM+P2zd6hlgy+/xLd0yGesCdqxkxjE8DifPXDqVMXFQlcLgXk3gaYZWOnlfOjc/KSltNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286248; c=relaxed/simple;
	bh=2L4dIKk6ZY/FJ9FIa3pJYnA0sfqUGLbJJFlrdXMdCOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhMi883zOAxYjvnmX7vPQXTC6UOlYBv0FRebaEmDNrE03fX1tgIW643aCRmR9HCSSbEVAyEjc5s6huIyLzg0FlBdJ+/RkMzkNZCWxvWV/UPUBCf3AMvfwGqyrMOJbsotYPnqQJPIjlLM/ILOcMidVh+OVqLJ84Nti7X8F3GQ43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwXl+PEc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CDFaPn031630
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWabY8gftkzC9JrOZ4Ek/4oJxm6WnV5RvqX/3ANhZGs=; b=GwXl+PEcEJAhO/22
	6IN7Qz/2hKct4OuaVhg7qdrfuUHsyOjxtJVpp5J/QzRUorBm++8TbyhWMbio1wS0
	auXhSpOJ3Y5EIGGGFu0hmyhs6ySX2Vk07jYmHgRxQwtH4Vf50sv7BQ7ZEnRmtM9q
	hpSAmFn+NlqbBwnBxRsxZCzNX11YvTSNmOzXiky64q/ppzZR29zR0xFl8GgGXnFZ
	K09guX3vKc5ivPeqzQhbHHTWJhWYZ3Z9jrV/7RCwnsSJiRZyh9LK0/Ddv1zP9jPt
	I28uqf+XSkUHP0mKGVLT60Z0diG/b82mAkGllcN5qRW5bwvJkopq6aVo5H5vWsSy
	z1Xj8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfert979-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-829080582b4so2046847585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 09:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286229; x=1760891029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWabY8gftkzC9JrOZ4Ek/4oJxm6WnV5RvqX/3ANhZGs=;
        b=LTrscoLsHXCfC+uQbDQPuCX6cmi3RkLdZrLlSyAzfaza1finyNlt0O7udFwMcnbB34
         cy/jxT5CVpw3htp0gOlpxCMGIRPZhogONhF//zqFQLSVUd0F3iEYFmlcb0Zz7NKmgGv/
         vKCoERDL9evx2abAgnj/N5VR9OxPNqrojUVdk7FKG0cX81feAUQFtqIBjc/j3vv+zEkv
         gePGg94f9D9sHR5djyBI+yE4A+LMP39m3RfwjaP+4gLhtGonrpl03D5m4t/gL7RPHu8H
         qVHKOU/nTwkmYgITGTYOTybBWAdmv+LM7cR6PoQYs0X0fMim++lq2TQVG3k0QLS+ZZi+
         mm5w==
X-Forwarded-Encrypted: i=1; AJvYcCW2p8AqpdXyqGQf7z19kkQFdyj9xIZUZN9F9qUkMbszyCr1X/T2WP1oVkKZdRpIcALFSGEtNpWmOSlDOt4+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8cj/d8DbZnqGIIv08TbwHdvd2iAIIH0ESxBPNJiMkfgqhPT8
	1+gPfL9o/tp6EYwOao+gvK8FAFTKfUNhYpvfNgkjaHQs0dR4d/e4dnYXHesldWiFkjGIpcPHzlS
	pNQkA/rlJG5OximaFH0qRsfJE9kUSbUWtiQ+23czbhfitNkZh0V4feZz/wNtCkWKCIrL5Y3WOWM
	lc
X-Gm-Gg: ASbGncvSXd+OFBoayM+MV426p8q0MleAKfCpsTSrhIwkwIMA5wVx+D0MbvAprYsMuo+
	0nrY4Koiwi9V10lnXuQM96Dtgyz3/x8LXCZIEEtgRBidEBaQtFWcpW+WmO3/Jbcly2W/Wgu5kSu
	Imwtj3gqIOCaIq6zfC+6dDaxhXgNgvFL/v+iln7NEtocvvGgRSUkH+tM1HoeVrUkN4Qdf8YJnge
	wAC9CPndr935fwLyROTMWyPJkVy0kWbys15Dl4MXpwF0ZLY8p/ZqMo1jNPRiUwRD0T+4O2KzXiJ
	+QKNpl+Op/gY3fAOB770CCTbpHWzwT+gc533unEIsNOHLqOBw5dAGGnAxUIx5dyLLtNIlIkXtu/
	//maqls6zzVVovx1hObQhIMa/jYUv+ZZ5w6jMEZo423E7xttZ/uk0
X-Received: by 2002:a05:620a:f0e:b0:850:222a:817d with SMTP id af79cd13be357-88350f578camr2390383885a.37.1760286229301;
        Sun, 12 Oct 2025 09:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgdeRrEX0yLdgYYQ8HSehyJ8d5qNPjcgLygT+LVvxqCHcYKm3OAktK/rV05nQTDX1XGIfGnQ==
X-Received: by 2002:a05:620a:f0e:b0:850:222a:817d with SMTP id af79cd13be357-88350f578camr2390380885a.37.1760286228799;
        Sun, 12 Oct 2025 09:23:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:35 +0300
Subject: [PATCH v2 8/8] media: iris: enable support for SC7280 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-8-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10303;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2L4dIKk6ZY/FJ9FIa3pJYnA0sfqUGLbJJFlrdXMdCOU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo69YE1I7MKbUtgytMB1QBmrtLRktoKRifhEjEB
 hT6H7bWLs+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOvWBAAKCRCLPIo+Aiko
 1cQYB/4iJ2DhE/kLf6VGQH3aW6IkH2RKhsXPvmDjbY5NFy/80lvgn/RC5hqiQVxYLI671mqxe8a
 fmJVubPZOEtJJEWgHgpB10EdGplr7Gtl5Jzh/Vj4VAsHqFwu/A6R6/3pmH5l/XYPOH2DyZ+B3kE
 Hs+DnUNL6I3d+8QJ3Yt5JQ0mLnjlijhBV45mpBu65aC/16UyVosaBE/Mq5qlhFElG5Bbk+8Rl6D
 /GzmgIzKTlHchVtSBmaq9URtvFVcnpbNTxg6T3D22pFsS26YrZkE86QfWeAmHX/XrLnstQybRQ/
 4tcNqz6xeOTtdt7iWFsAF5uM3KspbtEaQg4VNzmpmaAQcbRu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ebd617 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=5iJXzg3vIJBiWc8SjKUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: OjLcf55mOlzojpCze-ocCtizpth-HF3n
X-Proofpoint-ORIG-GUID: OjLcf55mOlzojpCze-ocCtizpth-HF3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+ZUGG0agLFOo
 M5TpKcSWha3e/qHztPfrLeZ5/bfIWR2qElWh3bVLbTwBPwagj+t0imN8+dSw9f3EVj6EZMgJRJ9
 odQdCz6BADpfcnETGRspAvtDwwASNoEqvVGGpCeirat6xk+X4C+d6U7h+XX6Pj6vWyFmdbMNevb
 WRfY7fIHM8BAYn1jNv84BS3Ccj+u09wc/7bo6+ugP6HV3VrCZuFXHaMBLJZ8vj137yo4uA+TF9E
 wnU4GsqREs6z6DiTFg3mCiD6VlzrTTVdHHgg5H8WgGyjSZkxH3CJN51k8qvt6GkiUinxOcXlrh1
 jJ4dv+eID7JxMRTRi7uV6LT4xAajFL42asgA9WwfKoj/YKhhRenK6nS5qlOrE+5RHXl/piFjncs
 jLY96VOR8hZ0D6ulQ/RIIjARwQr9cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

As a part of migrating code from the old Venus driver to the new Iris
one, add support for the SC7280 platform. It is very similar to SM8250,
but it (currently) uses no reset controls (there is an optional
GCC-generated reset, it will be added later) and no AON registers
region. Extend the VPU ops to support optional clocks and skip the AON
shutdown for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 52 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 drivers/media/platform/qcom/iris/iris_resources.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  6 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 34 ++++++++++----
 6 files changed, 92 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 104ff38219e30e6d52476d44b54338c55ef2ca7b..43cd6bf94ab600e53f983c9e11b63dc0a572e6ad 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -42,6 +42,7 @@ enum pipe_type {
 };
 
 extern const struct iris_platform_data qcs8300_data;
+extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
@@ -50,7 +51,9 @@ extern const struct iris_platform_data sm8750_data;
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
 	IRIS_CTRL_CLK,
+	IRIS_AHB_CLK,
 	IRIS_HW_CLK,
+	IRIS_HW_AXI_CLK,
 	IRIS_AXI1_CLK,
 	IRIS_CTRL_FREERUN_CLK,
 	IRIS_HW_FREERUN_CLK,
@@ -230,6 +233,7 @@ struct iris_platform_data {
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
+	bool no_aon;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 2b3b8bd00a6096acaae928318d9231847ec89855..828864902501aef072d60935fe57019a70dcb9f4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -12,6 +12,8 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_sc7280.h"
+
 #define BITRATE_MIN		32000
 #define BITRATE_MAX		160000000
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
@@ -364,3 +366,53 @@ const struct iris_platform_data sm8250_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
+
+const struct iris_platform_data sc7280_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8250_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.bw_tbl_dec = sc7280_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sc7280_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
+	.clk_tbl = sc7280_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p1.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_sm8250,
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.tz_cp_config_data = &tz_cp_config_sm8250,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
+	.no_aon = true,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 00e99be16e087c4098f930151fd76cd381d721ce..9bc9b34c2576581635fa8d87eed1965657eb3eb3 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -357,6 +357,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.data = &qcs8300_data,
 	},
 #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
+	{
+		.compatible = "qcom,sc7280-venus",
+		.data = &sc7280_data,
+	},
 	{
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index cf32f268b703c1c042a9bcf146e444fff4f4990d..164490c49c95ee048670981fdab014d20436ef85 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -112,7 +112,7 @@ int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk
 
 	clock = iris_get_clk_by_type(core, clk_type);
 	if (!clock)
-		return -EINVAL;
+		return -ENOENT;
 
 	return clk_prepare_enable(clock);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c..9c103a2e4e4eafee101a8a9b168fdc8ca76e277d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -3,9 +3,15 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
 #include "iris_instance.h"
 #include "iris_vpu_common.h"
 
+#include "iris_vpu_register_defines.h"
+
 static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 2d6548e47d47967c1c110489cb8088130fb625fd..f8fd120873ccdcb5239985d0d6a8bbda144a98f6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -179,12 +179,14 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 
 	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
 
-	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	if (!core->iris_platform_data->no_aon) {
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
 
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
-				 val, val & BIT(0), 200, 2000);
-	if (ret)
-		goto disable_power;
+		ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+					 val, val & BIT(0), 200, 2000);
+		if (ret)
+			goto disable_power;
+	}
 
 	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
 
@@ -207,6 +209,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
 
 disable_power:
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
@@ -218,6 +221,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_HW_AXI_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
 
@@ -251,11 +255,17 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 
 	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
 	if (ret)
-		goto err_disable_clock;
+		goto err_disable_axi_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
 
 	return 0;
 
-err_disable_clock:
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_axi_clock:
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
@@ -275,13 +285,19 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret)
 		goto err_disable_power;
 
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_clock;
+
 	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 	if (ret)
-		goto err_disable_clock;
+		goto err_disable_hw_axi_clock;
 
 	return 0;
 
-err_disable_clock:
+err_disable_hw_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AXI_CLK);
+err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);

-- 
2.47.3


