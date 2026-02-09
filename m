Return-Path: <linux-arm-msm+bounces-92266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDEnC3jhiWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:30:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF59010FB6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68374303456E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A5736F40D;
	Mon,  9 Feb 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GM/b2D6q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9y8Zyxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72F436EAB6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636650; cv=none; b=sWggO16ecfyvBoaY86kp2X3UIi0qm4vZvA6NokqCm9nC7lxf3aRRL6PvzXIa6VhksfjVCbR7uvt8CCjPfJbRp62IaNMcFPVKdmbhrdnLkxfAh8zfQmJJQxAM1fZaFvDCHud0fa1iJ3WI5TqJlv3u2OvvgJbSqcVJ8K5ImwQoP/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636650; c=relaxed/simple;
	bh=NhKR3UHkb3hepnI9j9XOAsfN7xWshiNzbM1jBTz1Au4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=evo1p79ATZnY3kXGr31BOz/bp2VBF23ku8RnhKKijqi/qaIrM/DJyRtvBagajcX2PVJAX1J5MFo9W+uKaDkc/sf9vqVAPhN+sZFecPax6HgGibm9owI2oaBgzj/+1dHhASnBKRQIx0OGhGS5ck/YqqOymkRE3MlogeuleZ7dCw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GM/b2D6q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9y8Zyxu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BIBja3252134
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 11:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jqnzAO3AXBX
	B/jlazODgMrKWlVLPcXZ7zsaA7yjsbzE=; b=GM/b2D6qOFJvquHDLSHOR3YrFP2
	JaEatbrxggiJj5/MFKOA7YpJ4syBoMqT/pU4ggL5BSzbCdsevwL8nD9SM5gRvc2h
	ekUGFUaWw6ft4Txn/f6TL5o85E0nK78zsdeFUZBLiSY+q2EwvZE3QPvc11vFLjtt
	9bosnS49tLWMXkix7lL+d08ZwmCthg4IQPI6/FcVQFTV9L18KXbyWdlxL7huIDp+
	XMO1Yn/Jgv7cbUsTKDtIpJhlZ+VGOhRScaI4b7xAyrCnVe/M15f15Mx/UvkQhbyC
	XITMK8gVDQDyAamcV7U0IJEO7s+zXluiclIC4z5XqTUe73zQELvLaGdCCFQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f69745-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 11:30:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6de18907a0so1205215a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770636649; x=1771241449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqnzAO3AXBXB/jlazODgMrKWlVLPcXZ7zsaA7yjsbzE=;
        b=T9y8ZyxuldD1Xx2JpMOLOzI8cYrOrpbYOuUhLLpClY4BXhsbyIMUsEO5r91M9f40mY
         dIna6Q5TDwFil8RGPgvJs9aNZaHDriJOGdArPVL4fgpnGZnb6vGpuLgXlsVFMNOU2Yh1
         xQ1TlDEWPXXSKyQwXOlCYT2KEGQGvBhWrJ2tith/GK8xYHNolBSgNKlkrZDcv8vAomLa
         Vdfg5atSBizpR0u/VV/pWbC1pgQ2aHxIT6lkvQXvOR1jfZIe9umS9Feln7xz73UY9yKA
         0ycdjI5LrUCJjmcV225OM0Ukz/l6dpBJc01zBe7IeX0BKTvNi3PGLugFV6U/h7CpzfJA
         nJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636649; x=1771241449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqnzAO3AXBXB/jlazODgMrKWlVLPcXZ7zsaA7yjsbzE=;
        b=pQBSO/cIjxQb+H/wId60owfgSKjvTGigdULZ6BgkC3m2rmiglt5tm7KSMKgUXdxKUp
         mtzHol5JYW1uqVQMhy2SgT7cseCUbwlwOjPtdWzQGHh/4n1fa0SuamgjwIFn9gxx9dL1
         NvNG3zW0HmgZp9ENmEfJhnDkESUDnRT17puvXsXWl34XQwbmhpP1B9RZbnmZi7blcMsc
         VG1Z7V3wHY7bvPTkQZQuG1tlGPekk2ZBYqNkOtKr6uRARAFGMdUv/+UNvCkjZnhIojR9
         uM3Jlhmw7r/BZEokecHwzynaSjemvEiG2AoOiJK7CKLtX2mc0IyCIskogHsdlJfc48e1
         SwkA==
X-Gm-Message-State: AOJu0Yy8aKs9O86MF89156yVbSU+ZrT/WHRcQGbR8AmF61+RCYujdX96
	2E5NTrWajW/ONlfDe/OEBd3xCU3UqLUy1JmdWBb7QEc6B8aGng1ydzAOfYDrnwSe6tRhUf6MCtq
	F2vikJs5QqIiDuZV3srnWWclLDc12o30eXVZ6MAxaQrOWtoSZyK6UDScsuce3dkbaoUpV
X-Gm-Gg: AZuq6aJBh2jTV3PkDj87AuQTPu+brU5WiF0597kNmj6JwJiGVGOilhN5v5FIXj+WeFY
	JxI/cBDn6FYCTgGqH5yepJlCn2u7+E1FDZ4W01vrC/Xh4TlTQatlDTvkaKK22EMKBJ/1U8u3ebm
	g9fZFoR9QzEc+/QcLUVqKET6W8mnWx4ADpQ6O6HdqIWGZEiBecJSjNq+E/+LpC95sYbH4KP33ky
	BHmaU5PR//e3OR2YmM09sxj1mpZYLDlGsD1zqSBmuSVqXGQUGYDfghF1lz9Tmv6UQ8g+ZIMjIRW
	GdHiKSKhj6s5IZM08VlCJMCzQ9abs2IGTdow7jIN1HKXiFLUDv5AQhRWn6Y9+9NSGUFwo7CxlLs
	12A7vMBjSL9Cl3xTr3sctUwMIpj3cS76vwXmpHQWaNqDocA==
X-Received: by 2002:a05:6a00:3010:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-82441773056mr11838938b3a.61.1770636648618;
        Mon, 09 Feb 2026 03:30:48 -0800 (PST)
X-Received: by 2002:a05:6a00:3010:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-82441773056mr11838916b3a.61.1770636648114;
        Mon, 09 Feb 2026 03:30:48 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441690235sm10399467b3a.18.2026.02.09.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:30:47 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] soc: qcom: pd-mapper: Add support for QCS8300
Date: Mon,  9 Feb 2026 16:59:47 +0530
Message-Id: <20260209112947.930853-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q4xuf2Dvsmokxmutq4LhHQHZ2RZsaTEI
X-Proofpoint-ORIG-GUID: Q4xuf2Dvsmokxmutq4LhHQHZ2RZsaTEI
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=6989c569 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=c23kUuRnC6VDJmZd65gA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA5NiBTYWx0ZWRfX06ljJDiHlYXl
 OrQkYBKukXFq2FFrIouZK51g6imBXq1PX1O8e4fMPZsGz80hrNlND/B1Wu0Kt7C3/1onFGBt2lC
 gvBOWv8m0z/EtytxTnF3Qqz3I2ocVQTGwmUoVofUTV2vvorkwxHilxn2RWGckkqM09E7z+8uw2J
 aXaVi+P+7U/z4byuBPiDLcg3nPZznZl0mpUv47RFh2vR/oyqk7aUcRgFXw/ohVZwhhzemw3NQK/
 hGx/pWikIzDQ1BUj2YR6KKDBBmcDR1OOKPcE8NGbarvQSPUf3E05JBP7h6mu++pD+w0Jm80QXFp
 Uhbzp+yXHbn5YXhjgjP0rqjOTra7425NT0xc7Bne4mnnRVKnflDL9CfNQcEyAxr5M+Yoyil1dYw
 ohsE2CWtfrRvIeRRu5baXfebJo4ZVYNiqfEndfs6+qHNA0SX5/DvR3qSQ0rvOtrmtmUh8Cavn5T
 +fmKydoVl2NYu8V5v+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92266-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF59010FB6E
X-Rspamd-Action: no action

Add support for the Qualcomm QCS8300 SoC to the protection
domain mapper. QCS8300 share the same protection domain
configuration as SC8280XP, except charger_pd.

Add an entry to the kernel, to avoid the need for userspace to
provide this service.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 8b899ec7f..32538e659 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -413,6 +413,13 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *qcs8300_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -593,6 +600,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
+	{ .compatible = "qcom,qcs8300", .data = qcs8300_domains, },
 	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
-- 
2.34.1


