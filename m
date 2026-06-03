Return-Path: <linux-arm-msm+bounces-110941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uPfDAI8QIGptvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:31:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92776637142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:31:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HZf4Kq6U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G4yQZeoI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110941-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110941-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17143306CA36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C211245BD6F;
	Wed,  3 Jun 2026 11:26:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9C466B47
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:26:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485989; cv=none; b=bJfMI5+Hc3JHpzCYVs3DT2gZWA7zUJkGllvudQm7yJPlqyYzkgAIeZLsK87r8epXmIAliif9kBvqD7mxdHbepIgv4BkT4UxTGk8UUjpIfZtptS5c4TaDeKqW12zVEtPDChtpCV3Fy/GEidP9kxwcGMgVTLqnyZn1+7NQezRNyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485989; c=relaxed/simple;
	bh=PVw3Afa18eTteU7MbnxPaIJ5xPkN0RyF8DKAzlYuhfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OE8zdiaD5usu+eccYWE4l22oQosyiVbbw0J5BNjlp/myxhSG67YqeKzDB4WhjCjz4bKrOomFL2eCtJxu67XDSUHB+/ikTSaiZlukMnDm32u5m82ID5n25oGFaOGys91aq2oKmoi3aPlGlzOTxm7mZsIT1F5dN2XTk9t82vUNzzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZf4Kq6U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4yQZeoI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395u90780758
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1C4N5T38gImYpF1rGgzh327+DSXhT8qjbYdTa66Ap70=; b=HZf4Kq6UiTgJjYOf
	YRGgtG/dBZKZNdyZViEhDjRKR0saXq5viJxRcrRawcVVCa7YAj9a5cBYuvDCTut3
	dB9teF3qQVbG5ENwP04XxftN81ErCmYwmG7dmNavqNKjZBTRwcrxL0Q+PxldecZq
	tX5EmVBtrTpPh8kF+GLgnlwg8t9JXiZIqXQDfCZXEKDIz3CHtLh7d+VD7f9MlTq7
	IK7jM8qRAo7W49ANEvfQuFf7KnSN/G64QKPF7waQH/L86/THJuFvhvEV8pRd+7Pe
	qgxBcmliIhOk7bQkzFkhShJfbnJufX6y0uxWYVVNaXCjTJ9+GE32pree5emGXKxH
	Vxs2Yg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0jcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:26:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32faa62so65921615ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485986; x=1781090786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1C4N5T38gImYpF1rGgzh327+DSXhT8qjbYdTa66Ap70=;
        b=G4yQZeoIraCDp+2V2Qucto+aCER+D/spBvTYtXgOGwqb1N+Fqz2lwKD0+pf4VYp+kT
         h9NBtum+KCb2+pId5qAivHtvJmmtDwbrHIIiDVlXEnw6hQDQ/jGQ0iGDCpiAnPDTsKE6
         Xxynah/IgFy26AWo8EjVC+oDmjSVk1tSXLBliSMmXA30KUwhoMkqBoNhk1Ma66wh/QOo
         PJSRj++O5Ie3hy8pTUDKv6o9sak5wKFm1YSLDES77ShjCTWn9OJl5cNxfg5f1cH3/rEn
         TK+mRGMa4YoeEcJmx65qaumt4ita7gFdC2r9IiqYjMxNhYFRkXE8XKYWNtFtr6dsGHIj
         CAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485986; x=1781090786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1C4N5T38gImYpF1rGgzh327+DSXhT8qjbYdTa66Ap70=;
        b=XxburQDqZyyj5BiBLUXMCoL/0X9T42Hh9jneHORidDuyS61LFGz29dAZZsaOJT8E/C
         y9T3Mlr9YJFw09kOnS/iicBDsZui1tGWPZfOygAZGJotG+1N/0ZZQWjqq91PDth/CPdA
         B2krzxvOwlbVu1YlF02WwFVD2WG4gXzSuqs6e6ulKFy1hTNhTlcvsyBnsbLPPACg3C8X
         4Af05Gx60F9EXeRGaARWdmGFldIQmVEDyCdis8w2irvoE57esgFNJESO+PS2y3PMN1Dx
         X9Sc90I6ig8WRgFcCVPfui33aeQfzNOk2/yYbWs4EUCYHTUIxmoSLFlMaOtpYeA8cDt3
         +0QA==
X-Gm-Message-State: AOJu0YyoQmhOzeEIgBdrvo+RhOdVg0HEo1Asat/zFN43V8wmtjEK++fO
	+DaRoEAdfAm//qa39PcdNk9Amz/moRany5U3A8H/gder/CtMWt0pWhzkG+MVxUIXhMmSjgrI5wt
	3dEkikH2c/7eZq48VNWETLJa876hNifW5Y/GYlzLAgGCwrO5uwe1kAjcn2QQp+nySKzuC
X-Gm-Gg: Acq92OGZeIZ/p1mBN8vNE8MqPyVDWGMDoLMPjdCIuC063VXJquJBMyu8A0Prgr8UZmG
	1ikEQ380Lm82/ir1y77aT6u96K3nDpaOWxflzAa9+y9f0SX2+QP0BvCKNJcGBpYY1n6y6TAOEC8
	2gIuYXkSO94AoT0mr3RY/trBIAK7AzyZGUfXe1PI+8lz2pDythqfdZTOIZdAJ+yci1EKoOLWGsK
	S3TVhWrwe4Bz9y5gU0eiU6AtcNRMe09lOZILjhgB4z/F3eteaU87v2mDfmZyhqoogQs+InoVeF2
	nTg1jUXlFa/qrcpNKYTWZsNZTdl8xlaUfwGeAUxCqctVApvV/TAe1lOpykiVcJsI/gjusSE+Ucv
	95gPxfjz6M5VmTcwnCCkTmUK0t7l9GmftAGX0PckadyykDT30gop9oSg=
X-Received: by 2002:a17:903:2443:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2c1644dd3a8mr29617495ad.41.1780485986212;
        Wed, 03 Jun 2026 04:26:26 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2c1644dd3a8mr29617285ad.41.1780485985800;
        Wed, 03 Jun 2026 04:26:25 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm22704275ad.45.2026.06.03.04.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:26:25 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 11:26:13 +0000
Subject: [PATCH v3 2/2] interconnect: qcom: Add EPSS L3 scaling support for
 Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra_epss_l3-v3-2-3c2e0b796e78@oss.qualcomm.com>
References: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
In-Reply-To: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: t2RNc9aE0Ac3i9ej-rqW8ZdnQHfeXFZ7
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a200f63 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Fbz4Wi_67QZ2LtXvWa0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: t2RNc9aE0Ac3i9ej-rqW8ZdnQHfeXFZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwOSBTYWx0ZWRfX4BgNal2t1VCr
 WHkwgb/S749fhnif65vcQGirI+2OTiCFsC5g6ZcOM9Tl3IK9/vMMS53181yxnIYvE8YBIKCjZL+
 89RT1Y7En7vHzCwguJiXDmbtvs3pGzOb6YVHjaMwWJVOnYd5p/ULiMmQkYuDm9xMUvAaPTE4epd
 AwTov+plfhWtNWR0q/A7tmpa1A5Upzz1PFmmotDwlAy5Z665qSRTfBN9r2Mm1sulA9ZewbXYtFJ
 qW0ITXcbetrTZcaq3brAK0EV/oF3u0ESvBjC62WWk7hnwNpKuYhrIqJbIPAGZASFUkpp3M6+ZP5
 FbJsBl350rzRIb3IE0/4BPSZdntoPGyd+fwCm9KBIzZJigI9rTah0uf+8i5erPdWC8LrIz40jt9
 /RbTsYmis56ZpHoGEWcDloimhyKDabyMLB1DPrOLULwEXGG1fqG4kRgQPY2MEqn51DUB0fH63pr
 7zoTjpMb0/2QeJi2hzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110941-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92776637142

Add Epoch Subsystem (EPSS) L3 interconnect provider support on
Qualcomm Shikra SoC.

The EPSS L3 block on Shikra SoC is similar to existing Qualcomm EPSS/OSM
L3 providers, but supports only up to 12 frequency lookup table entries.
Reading beyond the supported LUT entries can expose incorrect frequencies.
Add shikra-specific EPSS descriptor shikra_epss_l3_perf_state that reuses
existing EPSS configuration with appropriate LUT entries limit.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/osm-l3.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index b33f00da1880..ecad636b53e0 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -60,6 +60,7 @@ struct qcom_osm_l3_desc {
 	unsigned int lut_row_size;
 	unsigned int reg_freq_lut;
 	unsigned int reg_perf_state;
+	unsigned int lut_max_entries;
 };
 
 #define DEFINE_QNODE(_name, _buswidth)					\
@@ -90,6 +91,7 @@ static const struct qcom_osm_l3_desc osm_l3 = {
 	.lut_row_size = OSM_LUT_ROW_SIZE,
 	.reg_freq_lut = OSM_REG_FREQ_LUT,
 	.reg_perf_state = OSM_REG_PERF_STATE,
+	.lut_max_entries = LUT_MAX_ENTRIES,
 };
 
 static const struct qcom_osm_l3_desc epss_l3_perf_state = {
@@ -98,6 +100,16 @@ static const struct qcom_osm_l3_desc epss_l3_perf_state = {
 	.lut_row_size = EPSS_LUT_ROW_SIZE,
 	.reg_freq_lut = EPSS_REG_FREQ_LUT,
 	.reg_perf_state = EPSS_REG_PERF_STATE,
+	.lut_max_entries = LUT_MAX_ENTRIES,
+};
+
+static const struct qcom_osm_l3_desc shikra_epss_l3_perf_state = {
+	.nodes = epss_l3_nodes,
+	.num_nodes = ARRAY_SIZE(epss_l3_nodes),
+	.lut_row_size = EPSS_LUT_ROW_SIZE,
+	.reg_freq_lut = EPSS_REG_FREQ_LUT,
+	.reg_perf_state = EPSS_REG_PERF_STATE,
+	.lut_max_entries = 12,
 };
 
 static const struct qcom_osm_l3_desc epss_l3_l3_vote = {
@@ -106,6 +118,7 @@ static const struct qcom_osm_l3_desc epss_l3_l3_vote = {
 	.lut_row_size = EPSS_LUT_ROW_SIZE,
 	.reg_freq_lut = EPSS_REG_FREQ_LUT,
 	.reg_perf_state = EPSS_REG_L3_VOTE,
+	.lut_max_entries = LUT_MAX_ENTRIES,
 };
 
 static int qcom_osm_l3_set(struct icc_node *src, struct icc_node *dst)
@@ -189,7 +202,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 
 	qp->reg_perf_state = desc->reg_perf_state;
 
-	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
+	for (i = 0; i < desc->lut_max_entries; i++) {
 		info = readl_relaxed(qp->base + desc->reg_freq_lut +
 				     i * desc->lut_row_size);
 		src = FIELD_GET(LUT_SRC, info);
@@ -272,6 +285,7 @@ static const struct of_device_id osm_l3_of_match[] = {
 	{ .compatible = "qcom,sc7180-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sc7280-epss-l3", .data = &epss_l3_perf_state },
 	{ .compatible = "qcom,sdm845-osm-l3", .data = &osm_l3 },
+	{ .compatible = "qcom,shikra-epss-l3", .data = &shikra_epss_l3_perf_state },
 	{ .compatible = "qcom,sm8150-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sc8180x-osm-l3", .data = &osm_l3 },
 	{ .compatible = "qcom,sm8250-epss-l3", .data = &epss_l3_perf_state },

-- 
2.43.0


