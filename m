Return-Path: <linux-arm-msm+bounces-67096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC202B15CA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D05BB18958E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935AA2980C2;
	Wed, 30 Jul 2025 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kDk3dYCg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE0296160;
	Wed, 30 Jul 2025 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868629; cv=none; b=j11PazkVQRrSeQ+/sep2b2jv+Bx0MffNQrAoplD7aLXZTKTVNSq3dWQ7X1n4HsRiCBrIEjY2RITTakzqVkSpQFeKvm/XVA87uXKgN3wNoL3chZaNQ7nYbs+Zg+Gki4Lb8mwMRLNERa61aW9BtESkONefQqayOmNlC8xwnWLaNDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868629; c=relaxed/simple;
	bh=EGFlnuVzPU/MCb3uGavxiA6M9+FIo8sh/pnBzB3nVPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jbSWMXGFxZh2pMRDzZ5LUalnk4Yxt5k2IdE59JdpWOQpkaP10TnrDysYHWIHWCjK4toAY/uj+qLARnohXkzV4C631Tn/oJsGFT2TBnLrv2CEmNvZWh2YTcS2h8j9DWDHlNeeitru9aIExgtksnDTkB0UCiCQ782WjVz+LOQfi2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kDk3dYCg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U4F23U013440;
	Wed, 30 Jul 2025 09:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNWpd5hzCYXFc6INoaGE1csh/flCx43DQC8QxEVUaSg=; b=kDk3dYCg7NqG6MPz
	PZgmnzMdubWz69OQ4b7aN5JHX5L8glrynD2hUoIkiueh79EbdE9LwPjYZwzVLP7e
	sFNdJQIeleBptf6cGtuQ4iJCtm5nrizBxNosc2aRgvYIZsh6FRSwsCzk1h3vnZR2
	S/u3ivrtrr4xN16taY6YKulmwLnTTBRgyff4xQsp3kNrrg7EQfSetE7Q3a1NkVNf
	gcdwTcst7WKeRXtjC6m1RLV8/vQUxJLCBc/MK/rE2LWS9f5M/rKKYXaH+uGnF9Su
	X03qsWkLa4Was5McLyN8JSaQNhlalVn9wL5SP4t0SJSJlIyitBjGqkTvA7x7kVug
	8P0Z6w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xu6sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:43:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9hY4Z009236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:43:34 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 02:43:28 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 30 Jul 2025 17:42:30 +0800
Subject: [PATCH v5 5/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250730-mdssdt_qcs8300-v5-5-bc8ea35bbed6@quicinc.com>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
In-Reply-To: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868578; l=1587;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=EGFlnuVzPU/MCb3uGavxiA6M9+FIo8sh/pnBzB3nVPA=;
 b=vszfHmPG/JREJtaZnT+euc+tCo/oml0hi1Pd+P78w/oR6W5+J9moRQYvVHBEWy3hepWj7jWX+
 BnoNE161zx6Bg/uau/psRODuFsb46w3x695OrYSFbhIyVZnHRQh29ey
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6889e947 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=2VydLR8uY93yoHhY48MA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yI5lQ3h3kaNQ_-ZUG0Turp3byLq4VcrL
X-Proofpoint-GUID: yI5lQ3h3kaNQ_-ZUG0Turp3byLq4VcrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2NyBTYWx0ZWRfX8EtxIGFvVZDY
 iFRKggYSdXT/+Dje6My2weE4DUs3XrIp4xhEsX8p1decAo1F583QWmgRlHudoq37qGAb95vEecx
 luJwTZRsVFpAV0oPtGjmvyJDq+j7abC2l7hnJ9vHozjTJZD8xDYn2Zy86VckP7poh93ypNuh4bW
 Qn8to3Uv1wkVDaXuC1SeAwtcABBOIAyngJNMT0qCNp+hh2MIFMcdP1q8WYhmlc2LX6LqjOvl4Bl
 ktbBpNbhEJJq8maKPi/a8u+DO6m4gx7KDAWVc+T7O91XQuz6hJ+V78TDw4El2OwhxwHTB56bbuM
 as42QgtLM85ahYGJD5hOaW77yR0CC8vUkz37tCE1Dfmquim4sSOy4jGEKRAa/rLJms9+38ABI3v
 yt+dKB5rpKrZbRPWkVQJNYMtDF4LtPeKY5OKxI+YWmvsPMOLUa/Z14as9Ko+4VofzfPKDFKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300067

The QCS8300 adopts UBWC 4.0, consistent with SA8775P, add 4 channels LP5
configuration data according to the specification.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..389fb871018b65987295db60571c063b4d984d70 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -35,6 +35,16 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 	.highest_bank_bit = 15,
 };
 
+static const struct qcom_ubwc_cfg_data qcs8300_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
@@ -225,6 +235,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &qcs8300_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.34.1


