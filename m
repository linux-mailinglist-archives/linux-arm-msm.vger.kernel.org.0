Return-Path: <linux-arm-msm+bounces-94617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD13NTYJo2nY9AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:26:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 832AC1C3E75
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0E873083DF5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087E847B41A;
	Sat, 28 Feb 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ml+5kW9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeNBG2b1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1CC47AF7B
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292398; cv=none; b=QlhJC/oOSvUHt2hZ0X00dhyHw/7ftUC7Jn+cO2e6I5fbsh/NEXCfWmq+6kcmAlvCBnVAwVHD9JWarWFaQDagKRXYwdRSDrdskZ+Ed/YdJiC0r9SCKkmmW4n52F6nVGqtVuv4SxgL27w7+/HX4KXoGbD5tjRhCsswkldjyANouiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292398; c=relaxed/simple;
	bh=cozHaXyel6vCnb2b5CRPNm/bE4FmckiolWb20IIUyEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHgNXhMqDDuMcAmgDvDna+tJtc2sBQuGNGfJjnvAjLiOuF2hhkT+/zV7bdu5DvxvPve5X3RIWgqaGsytIORP1watTcM8H0QCvyDbYp5iCt533Gh0JjKXTMqsUbsl+C7GlwqdTvKZStS4Ne0duaswf519EtXtnHjgA0Wt4AnEFt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ml+5kW9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeNBG2b1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEOGm9591222
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zBOTIVuC5vt+qq5eN9os89kcIjnyYdPrkuDKQfByL0=; b=Ml+5kW9JxP5y7FAE
	gRZH9/eD+67CGhU4oHAWVuuGPIavOVeS+LvAO41lni90vbOfI52FQfrkHBjJoIVB
	zHJjNj2skBGI65I/rPCVae0kfs++WPpq+A1s+BvIfM+v0o8S4OK5IwLnpRBSRJld
	3bXwPRiZw11OO/JwVuP7WG8kZE2CXakN3gBildGBidpn6z8eXz+hPt/fP7rYcXUu
	b6CunkdfecRTPr/coR2jNUMA/R4DtpaL4+9GgzbFHRNRiqr+ExuP4eQoxl5fsOVR
	delfWAFeVvNaYmxHWIdxQ10JHfKMXwZPPdDxsxUFjbKEAi4sWKyjyp+C4FlK3oN9
	tB8eqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8h6fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c881d0c617so2309716385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292396; x=1772897196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zBOTIVuC5vt+qq5eN9os89kcIjnyYdPrkuDKQfByL0=;
        b=DeNBG2b1HcNuO3/VCfxSImAjSSM+LUPtS7TUb4L5wyLcwtQ6lhpJ7ufP0nq+0s4fiQ
         IQl2u1EitcndcSMfdNCvOZ1FCS1Uxa9tgvtk+vwKohFWSb6FGbZGL+VFuVeESdD1+LFh
         B59laWK+5XPTC6a4vOWTiR4mSOW0WUFFTNnrjYOqS4N4YoWh9SEuXRJic2C+KQp8k5mW
         Uo4aG/2GppWUbXk1vUgJWagi//MJM3dw8kkWYu5tezaaOcUHEs7UNxviNbDp0eKdbZMw
         3Kv0iYwJwKyr9nhtpuez4oHJzUSv/KDg74e+JxwrvgZ0+O9D0tEgpesJd3DqGGHem254
         yKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292396; x=1772897196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zBOTIVuC5vt+qq5eN9os89kcIjnyYdPrkuDKQfByL0=;
        b=EjeX60AKg475R/MdjWMVQcjJWpQkNb2DY1hSjCyza8rc7OniCQQwMrp9uqVPXpeElU
         YICpsC2LweVQAcLFh6rRZzJuKDad58KCFSMd94F9/R9tzKx+sJFSQgJDEuJLji5RPJ/S
         n0U9FeZV94X/OFhZZmivQHeL0UBuQz5sgmzHmZWDgJll/W2gFDFKD27o2VcdqughBWAP
         edZCb3OMl2VeXkHRo5+jG86Ea0g90E7X5zgLg+Xmx2V6AGPgAmC3PXWGCDAkUFuSBaFZ
         Z/wKNDVITFR4VrN9l6mNxEqQQIqPiJUJLFeFyqkZw+iYdIfRZaJ7dH+TxHpclfK/aBlF
         tThA==
X-Forwarded-Encrypted: i=1; AJvYcCUNgY6SruXa/oYQJmEReW+wgxPSWgH8Qt66BAGZzFMuBcToYlpZStbbxw0yujyzmjpI+3f242FfGsjQj4zC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+sqd51iS4AVit9DsgY4TS8Pl7m4Z2uTrIqewR507RsYhXO4LA
	x9ayMvq0uApaDSgu3kGXHlT0uAC+0qG9l/n6OQ24raMqdF48a2saNH0aZmLzaYfKjgaJ2u10Nvn
	BuMB+YySfeDWLT8S+J75JyVklS8sNdQMiqwgM8499uADc3ezinPtLTCqovQDaQ9oft5GJKH4U4J
	Ws
X-Gm-Gg: ATEYQzxBTZ059fSlEh1r8c5cUUlEWOs7tGBjmW/1vk7ABmnf8dn293+Z6gbuiIlQslm
	EwZVW5jEOYtZBq2z+kp6VV68ixeKk5T6nkKGsnpmdn8jePhHlK0ncMq/IA5P2cY85R3ot9zCLcO
	UIYkEmGqM50gCyJCyNByT252Yn4cPb+qaQvq1YV/sgchAAcTZNOl5+EHMrrxgJtAsvpLQ9/DeKL
	w7Ap3jnd29bfsOkIvKAOct+wNvotCAcspYejJpk0a+je1dMt1acrc02twZzsfSrVn+OXyoZb6zC
	i3VZur1PMQ1SF4PmXRWi3clUXf3hqXezeaWzSLF6F8XC+mBZzmj2iy4BLoRNkyfT1qN2uondINm
	kqzXEKtHfkxOyZs8/9mv6tgtL5vOniCU4rTPmQQZ0mecQKNGGAdJFulQAYJEWigJmqGrRSrDaxJ
	7EfQ+fx0E21pOBfD2HB7/h2KK1ycxx2bb64iQ=
X-Received: by 2002:a05:620a:28c5:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cbc8d7345emr827980385a.2.1772292395711;
        Sat, 28 Feb 2026 07:26:35 -0800 (PST)
X-Received: by 2002:a05:620a:28c5:b0:8cb:72b2:2a05 with SMTP id af79cd13be357-8cbc8d7345emr827977485a.2.1772292395223;
        Sat, 28 Feb 2026 07:26:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:29 +0200
Subject: [PATCH v2 02/11] media: qcom: iris: extract common
 set_preset_registers function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-2-acf036a3c84c@oss.qualcomm.com>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5636;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cozHaXyel6vCnb2b5CRPNm/bE4FmckiolWb20IIUyEw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkmTaHj2gM+eOMF0djIbpJDd7s5WlEmFtE9A
 H7lsYeElGSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJJgAKCRCLPIo+Aiko
 1dNSB/9hGaQ5l4ara/jaUecIEv8kxqM7/68hFhxBA/l68TmHvQGvvHluIzyG5IZ5xxAI3qBnibW
 wcf53+J7mqdnlg9Bmo1PZuReGdYYt+ixcHbnyrOYtwtMTbr+pRLb6RKPUjvVlgDDUDm+QqRkkEC
 t1WHLb5KdRwsBXXXU60gH+M8K12IxQ6ygmAqyNTPKfPapA/AwD0XLg9p+TpDvn/rqk0Rp6E+MYP
 1d3YDr10sY2i6SVNOFRXTwpnSbHCW/7CS7XX5YYE6QiHcaRqdeUyapOvlCQCDm5lp1irsxFCN9v
 Mg1850k6qlo2+O8JEy2VV2iTqYzZNssTDAV/77nZ8OzdpoyN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX77RESvVmUPre
 GfXX0S3z5oc9INAAR6jycUaotSUMwX7aefcYbBu2XAEblXpD3Y+MPurGMylrYL8xfdJvm62dv2Q
 1300T+1GtMQbPYVRfyaUMKz7Znb++JQGBNzheG08mH0xcwttMjYlEdiaLSzQ/YnSta9Vg2ptBOc
 46agd262K1MNBY4k10pw4QIzZBx6nUSnOPidGW+6ukwEK5eGlZXK2urYazAJ4ZRZrMDX41VGlZp
 eVtzHd1wUfxHg99U6osWP0kosSgluXHhunf1EuOdYoC88FsPytKPQstqWspIXA7lHFKFxngFVpC
 ep3rD4ocKWyDX8XmnO78yKT2DyBQAa/SZtnIjkgAczjY/gCqwBN9Xu7wWCeUj1vr8RRYzsWDgL3
 aqfKDjIbPwT5gyEYgCfuuc0CGyG/j97gIDuG24caK3nfIJ7nE//Q4jQ/lQsNxGu1h7494wwnQQM
 kSy8BAn5VaRKiG7RbeA==
X-Proofpoint-ORIG-GUID: wLpt6Z55sH-hE90QHvAfcj2JVU2UANiF
X-Proofpoint-GUID: wLpt6Z55sH-hE90QHvAfcj2JVU2UANiF
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a3092d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=h-rriOPNHJBWU_5FlFgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94617-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 832AC1C3E75
X-Rspamd-Action: no action

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_gen1.c |  9 ++-------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c | 13 ++++---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c    |  5 +++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h    |  2 ++
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 1bbdefc48d71..a3eebcacba7b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,7 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +392,7 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..f8754451ac18 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,7 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1013,7 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1109,7 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1207,7 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..e07e47dc9977 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


