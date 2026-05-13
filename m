Return-Path: <linux-arm-msm+bounces-107300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPnVKtN1BGqdJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:00:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2E5337D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8DD13124F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADE448B37F;
	Wed, 13 May 2026 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/gZlQy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpYXdq2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7047ECC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676583; cv=none; b=T41qsizgLhagjLrfb02DAAyADlLmr1Tt3T4Lr6pcOqltFDfencTtQvYVMazDDRbZi6FUjO94U/ChCj5RDKnEaKqWKRvGo86XDTpnmaw1IMxf4CUn8kkvE1D79ffyToAPY158q1ktP3TXIHcxpYrIZlB9U87LzP3besTTR/E6z7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676583; c=relaxed/simple;
	bh=meJeOGC9Adf/PUbg6XCNyvrgECBd7eveB7tX76HF7r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lftjj6OC7I2ojcZocrug0nEULMeYSWUhf8UUDLQdbl/cx47z78jumPq+1cA7F2OzvrWTYSa1u4INm7a/IImUnQnd2TzTSngaqoiNXvReJifdYYSPCfAWAiNclS/x9cQJ/ccHMECoxFrFSgjbdmfiq/41pmAvCFwYPhV9i2XS9Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/gZlQy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpYXdq2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCU6cF2965303
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=; b=Z/gZlQy7PbIStwmq
	AjIUq/tQOUp3KBfEiMyznFR3aaiYfcnConYxAmLAAxsvt6SktT6PEzYezoTlv2ly
	pVQd2y2hpav/6QJLVDUsu0bItjIaPZKbPRNunCAmJXqi8I+qoL1NdooVF5mUF+D6
	8GxnHXNhlxhTZ0/7S/l2GQK+2+VRn5jHr9wUwC1OpAtf9SsmtDPLg8Bdbj1vi09J
	lEMfSPJVGsw3rN09lzSMT4VnWWX9IY5LSJgCFFw5c3WjamAKaZachb/apmMbyRX5
	NNSP3JmVLuZaPV/n1zK2PVu2zPmjvSGb1qPY6RcbXtK5XrNoeN+kai+xckzz4HIK
	kEQzSQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59c39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso128038761cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676577; x=1779281377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=;
        b=jpYXdq2ZXRK2iMcwhz7NP73YE7Uq1WAcubVXdVr1zhstESVfk4ZGE6FxYG1970PHJp
         XRLXWKIkXPml3SeGiJxcaAJazzOPRjhCfefVS5NrBIKXxHMBzT/kjDkqm9md4wLF/7Uf
         41ZflvPWpbO6OyaYkV+2xHTBvQIQJdxUMclgSQ+DqeOfQb9HXyuOLwj9d2x0R7UeRNGX
         mVCKPQ+jh9qqG7vMIpqHaJmdxpG6WC6ub2O4WKMe08RbCSPrW52MzbeY8ZCqwqmsfRnO
         e67xOBH5hTqQ6kDzTFMhHe8322Ge5olPruPJz4rbN1FVOBdD4ECNub3S9S8juJ/ODkEG
         xZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676577; x=1779281377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=;
        b=oy6VNr2ibeM02+39kVB3vUlRPBCnmEE70XXIrLzW2N+4q3hmnnHwPBu7vxjl44TYZE
         YRQeWzWzvsEDiUJLjldlBuhESqIyvzECLsl+/JUcVZ7ILUFxWNFKTtw8FHiZSqS/qP18
         FwqaDxawOeLAAPSZF1Y0T1T5zd63OtxqiR6Pv/dFunZgOUaH+Akbdi7HC5si8wj6Z1wl
         zDLpsK2LJz7sHfkTWA/7Ev6Djj7LTgK5TFfJDna+rQ6bKuFt3TVU/wvF5T/Dt13rXUuR
         Yxo9UyctGc4W4OiSC/lpAsznwjITk2MRcl204ZJ3IK0rWU59/5pTkq5v3hKqVgtqdQHj
         C1Rg==
X-Forwarded-Encrypted: i=1; AFNElJ/lYiZIa93u/D/lzxmVdRV6qrhUdOApBfj76NFunIuRLASuzX7LFt6ZX41ocyf6CxS79lGpDOo+wuYIzMJK@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPIR0evjn66mEQ7mAqKF3EcefYMQbcoYfpaMv4yTrOZ0TLk7V
	foOXmMOycisIqplltqGnMc9ah99qXSOaRpTG3NhVrnN7FGPum7SziP/tTzo9lxxGOWRRgGgVGV2
	k2USdJ2BhUqmLOm2VMCUa3TmOKRobl/e/xLF8606JUR0Clj20cfLzM7JMkMyhETYJPDwT
X-Gm-Gg: Acq92OHy3nWn2psENrF0jUv90eSVDRLY3jPogxl3uEqYBnKTc56HYjaAYL6u51SLf6C
	CObASX0K0fw0Ssd4uB3Nlm+rgjHErtwTzDWUaiPWAKZ5IuKULeVc5mQX9wf6u5xjCN3hga4mTOD
	8a9OPxTQoZMc2DPAqdiyOkJBtTdjd63odyhK2Ufda3mDd6DZmDtewCM/ZsBvk/0lMcvSJCplQ+N
	yZxpKWboIg+3B0CHBLYvWeKcgh0j3eWMX/c5P7dm9/Ui485MiWsFvjWjXtBzSbuFJ77i0dpcj9n
	W72oO7drDCS8+2uf58q9l2b5M3wenm7QscRTu8jlv6SToU4DMJtYb17GgWQ2SAcuBzOEjeAkq1d
	4KmBh/+TL0H/1ZDiekXxO6F+KdLjDSxGoCMlUSUA95uKAvwOTFjRaK3yE7fDPU/J/o7UJMJR/2Y
	7mdjCtXXRbjTXAG9ZZOK2z/kXzDtA6WPwAhgA=
X-Received: by 2002:ac8:5cd3:0:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5162f4f3e7cmr40521781cf.26.1778676577421;
        Wed, 13 May 2026 05:49:37 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5162f4f3e7cmr40521371cf.26.1778676577015;
        Wed, 13 May 2026 05:49:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:49 +0300
Subject: [PATCH v2 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-15-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=meJeOGC9Adf/PUbg6XCNyvrgECBd7eveB7tX76HF7r4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNCqDkd+/my+4Zch5WrbQGUhtinV7vQ2iMJK
 aI9jiLyywmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQgAKCRCLPIo+Aiko
 1XA8B/0aFQviITS2/29twOQtDjV5eET5d/nFw8fkKm/wkjrCB7yhkkDeZY5KZuzKcg4jsg+V6O5
 QUqasSCemq8H6HSaF3x3Y/MxlkGlIijcxWzSPHyRyO7qmdIOSkzAoNV32UTj7KQU9RjWp2h/QuN
 +iY+viGXFR7vGTK3Z0AuM2DTeyG/ryvEDbU1cvhJKEfdLFfwXCA605iqR3ehhcJR0TtFS5Uz2VU
 qMvdB9jBrFSuoACAc4vNWoN0e6Yic2FQS8v6tmmbM37s7Qk89tsD93VI8HZWz+OQ3eaFfauQ7og
 Nz3bKCkpqxSkpQG1tMyF4l4iVGxNgqlbG+1qaAclLxBhiKx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX943IWw8SAxdR
 v+qBCP2eRuCNanX4IQv7NlpcHfS/jBcVkKvccZ384xxvfqf9/2Y3IQ6jx1lhI4B6FQAqdlX6wsm
 2Cah1MM66geukY+rvJnZkOy026lcGnRQrgxnfD5c1g1bDV5CMt15m5K117VGOG/0m+bWph5rjS8
 Q1lIbb14C0MdFnUCpNP+uzC8BL1w2Go2+N7pTSxTBuyJCFt1vOScd5waIMYDsEsgnv/MxXQ0GQy
 VkIHpYE1X4UU17hCIGHWC95rqBHciLJA7GWT+5qMUnNCEaqYvX8v+oV2MOoI8SBu84c9haIa4sb
 ZRsTcMr3z6AI8N2dpB7P4HjY4r9mL/r5T/2QE4DhQQE531jgc3SGcQ+9lkb4OxpCBbeP3XJsjKu
 cKDeguC7+Xpm5L/lsSrTPdQFYMFZkWYYhrlCB3Ej9s0v5eH2xpI32uquSllsSVfiPyRN1uSAM+p
 elDN6oPubYxGoB9A8Xw==
X-Proofpoint-ORIG-GUID: 3n4c5-KZMwdJ7d7Jz9Z0NbJpIdrj4KIw
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a047362 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 3n4c5-KZMwdJ7d7Jz9Z0NbJpIdrj4KIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: F1C2E5337D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107300-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.30:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..8838fa958571 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,7 +1074,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,12 +1124,15 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


