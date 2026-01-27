Return-Path: <linux-arm-msm+bounces-90794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJuFN/jSeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:00:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 034229631C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0218B303CB4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD0235EDA0;
	Tue, 27 Jan 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N92zrbjI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlAty32k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487235B642
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525025; cv=none; b=Iajyf7xayRUhS6LF/AKTC8qsJYytKm1ucZA+PxnXws1edp6Qho3FbE1+azWHOuiAMbEYRal15S+yytdrXDlxA+5v3//+LwrIZVwvn3AoGWdqntQGmgLj2o9h9Su+ycC0FCHX0VhINiNZTmWOZWEfn2uPsWnWPPKBdh3s6+FjMP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525025; c=relaxed/simple;
	bh=vyv8fKQPWdGDf8aD7XD6RbqM4+uBXlFvZe5G/2aLC4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IkWw2GD2wDKp+Lm/XFkXbwASDaRglAoRhS/PCR1vgreWZarU00hR3Jd8bF+fSVud32bHtlwNxF6E6e3y0adKW9JHcnDxZ2j/rzEqk/X5oVaKz+jKJiDJSS5yys4Q1u+7SzngETV5ig/4sZAmgB8e8+zNmBKUCOT1OfveMijscT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N92zrbjI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlAty32k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87INa2379234
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LoALNBdHJ3AqIM70FiPeAeqSkeYeeXNi4Md
	ldW3kusg=; b=N92zrbjIlnxzPXyvesynzB24arNjD1rro1N9AraFDj4pdpV7yh/
	5C+kCJURZs3TS9PKegm59gR2L2Q3u5fUAwBS+uxjfHLWRD1RV+H9xRveNOwLicia
	AV+A/jaGaV/BLvT7bWEgdVLhAQiMfz/+hd88MnFAESKzxFliwVlbwZ+IdqBzi1pQ
	RZKUvIxVkDIiH79XGFwW3pMVbXk5uKcp9l2kXnME7IpP+hE0X5Z6i1kf6vbAyvqJ
	sljafUIuncrzos2LFPvFvBG2ig4dcD7JEzSDHENJ2wGzl0xjNxwliObVt1InL9KH
	9uv7tYuchXMNLnJK07JyfSQpYUJmTIj1ASw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr980q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:43:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7701b6328so18312825ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769525023; x=1770129823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LoALNBdHJ3AqIM70FiPeAeqSkeYeeXNi4MdldW3kusg=;
        b=RlAty32komG82uGMFpeKVCRwG6Mh7jnphXGjBgTp6EWm8SP+bPt+7OcY4FB0GCGjh+
         I9LV1gCFWFOJHoO0cgXKk69fu6U7nQFOJG+nEmxmESA69GIVjkxluiZK/0p9bsHy9n4R
         RPISjvq8zi42djmGRz3m00+Jnm++86Rz+AuZT0OfMHFAQ4TXqt7rdV84oZaw0B66am9K
         zRMkAiKwfI/6JBJq30A+V0v2j56SWvUnj95Mb4z2hrc1KcGBL1DXreqoXY/nqeeGqliI
         XMSAHyCa1qcXr3DntLs3QW+48UBY0wLzqrbwLwmjdzvz9wZiK/nmUZQghVid96wNhkBg
         VrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525023; x=1770129823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoALNBdHJ3AqIM70FiPeAeqSkeYeeXNi4MdldW3kusg=;
        b=n3CROJde2/Mw47IE4lYAx248wiVzaRrcDPx/aWhW524Ork0pf2MkPtfbFgH2N91TK+
         u3KQbI0/g5kX18I93T3MK9X5PWplD+FW2c3AsYZiR198vofJvWFNjQMqHGqtKvFMI+tm
         vINnIaF9RRWWzC6PTsMlJhrmVD00HcQVQDsAOUoGESWf/YQ6iZZYzRNPQrIbo3qukvvK
         Ti7YKV1gz7ja8BoE2hneXTFoV1ZyWHxUykApjbSGwMiyevUJ8oDG6BfGBjvGkaSG9Ndu
         DjUvpPgNfJnaPkLILK3fHvm5j9X4YkhzKiqxrpQszHSCDlkoKEVL8ypLE+HKLLPJIXit
         zZVg==
X-Gm-Message-State: AOJu0Yyx97vGWL/Fgl19dbznBcImjrO2K591gcUfI19+UUAuJgUwJlqi
	xQuxfsjC5knC5JWYzZNoSDv7sDnn0EsfK1fGDruL8AgQ9LQjp+j9sIAZK3mu16VSrfqwa5WZsVk
	M11Vdnwe3Flu4q5WIIcOlEfcTPz9gH8DuT7pO9zFgcV90aS2kHHAEBtqJl2mbxlhn0TAr
X-Gm-Gg: AZuq6aJocWlKd1hsO4AydQRfb1AALsLltcYRdsCKTBmq5hQybRkjeTZzm7iN9AhXZzz
	ri8Ihom7ULtK5P3yEyV6sLsYUx9ngz6c6h/QDP/ZIuSM6Tq54jPFjpNTq9vOpb84PrQPkT024A4
	b71Bsg6afnp76UYnIff8Gqbn3XshvsndblgZlBEVPc+VxKLwzvLj+JBTVaJ22VQIJPJCrxZx4N7
	YO0DX9n3CwTfQzHWSyXEJoqLnXLYUnU8RcfoxGBl3dqQYMUFgq1ShTMpFzhtHJxJ61D5MQimW8k
	bQpdrgSQNZiTdT+JC9GIgKKGVRIjxF1Yg7daTQvHRIWDuDQhaLDK1EgmAK6HCxK5tT4M/65/ZQf
	G78v5AokpRzm8qPM1NIXg84PZyrGyvR3VmvK7buqFc4djpA==
X-Received: by 2002:a17:903:2301:b0:2a7:3db0:6e1d with SMTP id d9443c01a7336-2a870d7af50mr16305055ad.9.1769525022794;
        Tue, 27 Jan 2026 06:43:42 -0800 (PST)
X-Received: by 2002:a17:903:2301:b0:2a7:3db0:6e1d with SMTP id d9443c01a7336-2a870d7af50mr16304775ad.9.1769525022141;
        Tue, 27 Jan 2026 06:43:42 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fae9b5sm118111105ad.80.2026.01.27.06.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:43:40 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: qcom: pd-mapper: Add support for SA8775P and QCS8300
Date: Tue, 27 Jan 2026 20:13:15 +0530
Message-Id: <20260127144315.4125110-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UhNZ7QCK_pWTMJosxNF7a6TmSDy8i-6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMCBTYWx0ZWRfXy93azA65rSAt
 yBl4eW07l5yfHRiD4Z2wKt47CWmZcPhvevMRgYwrpnho63OOdbLZVO7C92VS64GZyQdF8PJLukz
 Phx4LDPnXI44qSH7lPqeo7WANiLck4jZSt0URq1eAdbuuaWKw1ru/anMeEO0XgsyvRWhokOoHuc
 cjfsLsUV48U5E5AObn90J9Eix3MhNLlE/vh94w8dKMaYcUlJgUCmRDEqAzVF6LO9HzKevxUHW6z
 eYA/rkxMZAQgMU1vwClctUtgB4OX6a95gflzooO6REqY11HI0QeBaG0aMpTkIOFFWtB0f7fD5Of
 KEA3FLCStSUbDr2gammoNMNNBNwzLf2gPCbyX6TfjQNnAjt6R5I6+AwOEvUCteGnuvxatE2Vj+m
 qHhJEOY90dIOOPtkjQSHFc5L+TaB26UsvFdeIXnypMHVu2tgL50Xal01u2LYP53qMOU6C6p0onM
 xiuNdzaZMxi6WyIG/DA==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978cf1f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jV0hG2LTTy80qQuVMQkA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: UhNZ7QCK_pWTMJosxNF7a6TmSDy8i-6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90794-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 034229631C
X-Rspamd-Action: no action

Add support for the Qualcomm SA8775P and QCS8300 SoCs to the
protection domain mapper. SA8775P and QCS8300 share the same
protection domain configuration as SM8550 with an additional
gpdsp domain, except for charger_pd and mpss_pd.

Add an entry to the kernel, to avoid the need for userspace to
provide this service.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
changes in [v2]:
 - Added missing GPDSP power domain configuration as suggested by Dmitry.
 - Link to V1: https://lore.kernel.org/all/20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
 drivers/soc/qcom/qcom_pd_mapper.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe6968..aec7ff054 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -305,6 +305,18 @@ static const struct qcom_pdm_domain_data cdsp_root_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data gpdsp_root_pd = {
+	.domain = "msm/gpdsp/root_pd",
+	.instance_id = 192,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data gpdsp1_root_pd = {
+	.domain = "msm/gpdsp1/root_pd",
+	.instance_id = 241,
+	.services = { NULL },
+};
+
 static const struct qcom_pdm_domain_data slpi_root_pd = {
 	.domain = "msm/slpi/root_pd",
 	.instance_id = 90,
@@ -401,6 +413,16 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&gpdsp_root_pd,
+	&gpdsp1_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sc7180_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd_pdr,
@@ -572,6 +594,8 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
+	{ .compatible = "qcom,qcs8300", .data = sa8775p_domains, },
+	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
-- 
2.34.1


