Return-Path: <linux-arm-msm+bounces-92265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGLMAnrhiWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:30:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8A10FB7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C330302BE26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2768036F434;
	Mon,  9 Feb 2026 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnJiucP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1O8v6S+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93E836F42B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636648; cv=none; b=awBZu8XhMnvV7N1KRCXI6GqJLBMEvrc6OI1QoCiTR6pTjuVoMr12msCWyPCpANSeKaUYG/G/KTbc7E1UTYJVUPMjqltoKM2Xe3yhwcjHzsId2VNhwNHhnSvA8qob+X5SfiIUCaJBvQ0a3Bjytup0MGT5Y3+R0X2r9U+7NcgDBXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636648; c=relaxed/simple;
	bh=zglPL0PSIBm3djPFyYqwAsocu1ocCnjOxsf6XNtYwQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EenEJlalbPDGZidky6hNzR+hVgvD/q1BnwnsK6TSbmVl6AZCONRnBsM1RJzhouy/xNYxivBw2M60OCEPPnamyBgsriSIS0roGdZJLp4L/+f2I/9Pd8xx4EZKbtkuAQ1UbXzo2E9yworvKWmQlbw0aUFWh9p95117e1dHQ1B+G8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnJiucP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1O8v6S+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6197iJu31519576
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 11:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wyqNOBjt+xt
	spSOoRk7R8UkhkcEfHJteafuj61mEIag=; b=bnJiucP7boxFrViQ3hxZQCyaQNL
	0qEmJ0FdLs+7W3qMi+LDw7yJLV3hYj/oixCeTDalI0GCTbQi4IKgLAX63sS2oC+B
	+Pb9VszYVly1ZT88RbQk0CSLv0OoptxCRUo6aQ2tkX2u7gf9jgpqgiKtdzsqQjVp
	viNk5kzxaVK45ciZnYC3hcSlCtSoAaKtyRy+8a78r/dLxVK7HmDTmwnIRQ8ChqDd
	eqrLdlG9cP690AwoSeQK/6uuwXyFkAvYxMbxbw23YOF81cqthboPuQukZpRT8LoW
	6lB5CmcYcL1GicJQFuO/Arbw5nKP3HL6zJdOl8Rp1dRjb7GVZN5+Hl5SZBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xhrd0ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 11:30:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so5704092b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770636647; x=1771241447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyqNOBjt+xtspSOoRk7R8UkhkcEfHJteafuj61mEIag=;
        b=e1O8v6S+pY5eSjdkQdo2vgZLn/rqZOCTd5Q+rwjmRPVZZaBqhL3z9hNf0aI2Otkrev
         mn6YtswXmXWVaiGwwD9fWC34xJKbg8la+CgargbjwS3/C1XR0G7ruFLhRd0Xxj85ZiJb
         uqdm2R4x+rbGJX6p/VCbnW8qVx10hTInYd1c2H2aK0eXYFp++unGLai9BrlCFO+JrYSE
         ex/uXhSzhIIike/X2jE0Ma2D6k15uSoL7K/S7ryWudv8cLJ2U5FPMZws3ifz3HoaMsSF
         MQHMrpSSP/pU6oJddkcqpfmYRgSq1U2qRx8Zzb0UPX/H8Gb05YojE90hHvSIdiLGvnnD
         Tzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636647; x=1771241447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyqNOBjt+xtspSOoRk7R8UkhkcEfHJteafuj61mEIag=;
        b=UJYy9s/c0krdSlrGEDtz6n84aRTspCCg++CvQPGa6s8RmZ5JDuJHCSiBvhx8o4eHol
         Pigx6bNKmOGOQmpRDR/LxtnP0Eo+tvTv/IMChTn1Q5TOLi+/mXNSiIVXvFtaoEBgz/AU
         pfTL69RV/PjdbVt6jpfEe3xmfg7cbcdVKcdEroD+k4q7jFz0jw3PB+mIL24TtXrMbyZr
         86wSpR1y7Vpv/IwhYSw7uz0IG+j/ew1XzEXgA2Ks0Hsl1oyph9MFBHIpr67VaLsSUCuS
         j0v5hW9DqhSGUygdlrJMKjgQOFwmKaf3g3F6t6vODMJ19JeujgAVq3KLaHQSiEXNbtEP
         NbmQ==
X-Gm-Message-State: AOJu0YzCiNufGBzHeCTT+PNC4NdPlNNfdqPJTpb7DpqZlwU3D+MmC+wS
	147Nev4xRmlVTmoAeqp6lcEf8AnOy7az96t6tBanQIIGR2WZpwGGti0wlGAjb9KRopZWeHDQ0IY
	bE5uKujj3sRGruwjMXWf9Kd2X7AmC2Zj93IvNI0HkREUfM/V0PKo4zmrtON4EBrPA9aRM
X-Gm-Gg: AZuq6aIy+2o+2nyR/kTWwC6KQEywG+I7/CG/SmsM83xz780hluQJARcgFUo4K4McT48
	SIVdNRi/Q3ss5yeSCk9O4H+2rs29MCGKq3yXtHNo9+hxbEMHvyQhWfgQddnJ9GHE4sZDYS1uFHo
	LFDUVNdG0VhbuJ8I28+i8LcbDdu4PyzKq0i3HAmgP9a4EHczsD5To2giPjXq+SlsbGfAd11LYr9
	NKVrkZHyFlrPFzPwuH6T/oVpYARYg8zAeL4TB/ksv10dh3Vvam8/Ni7/nMk7amECaOSIhM6XuJZ
	ebGYEjJ8gK88OlmjcLwhw3A6e0wrty8iwmKc0M7Vmt9+EG+EcVbPQDcq5U0nQpaP1bC80S0yg1d
	DIB7Ug4ohABPk97Nt6SKNozatfLrtW12P4I83UGgYj2/f7Q==
X-Received: by 2002:a05:6a00:a22a:b0:81f:b3d1:2d17 with SMTP id d2e1a72fcca58-824416f79d4mr9738823b3a.35.1770636646528;
        Mon, 09 Feb 2026 03:30:46 -0800 (PST)
X-Received: by 2002:a05:6a00:a22a:b0:81f:b3d1:2d17 with SMTP id d2e1a72fcca58-824416f79d4mr9738801b3a.35.1770636645963;
        Mon, 09 Feb 2026 03:30:45 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441690235sm10399467b3a.18.2026.02.09.03.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:30:45 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] soc: qcom: pd-mapper: Add support for SA8775P
Date: Mon,  9 Feb 2026 16:59:46 +0530
Message-Id: <20260209112947.930853-2-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-GUID: FIXTQpAwtf5O2Zf43kXs-eDKWKNtdrPW
X-Authority-Analysis: v=2.4 cv=AJ+v8NAg c=1 sm=1 tr=0 ts=6989c567 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=GJhC-LizenwalLGVfMwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA5NiBTYWx0ZWRfX5BeCYAHhKK44
 nAcmqXy1XlweWxe+Ozsxsj9CHiBzivFeAydVEcw82Xkv7tKbmVSt/dtiFuzlbmlDwHz9jxBNF7Z
 /T6KUYW2CImF3b3daIi9J/80WxJpb4YdNqx4VABYUbTPaZi29JzwvZ7H2owHJRNtLIxBTtdKm1/
 zkEPAL6Y9M8pNqrd3Jym2NB5SQPtdEyCHBIkVrbJwEC6FXkYHzIDTC+enJh19hz600BkesqlopM
 d2JxryrSk284u1KbtuqEC9KJEMaSFSNGiaggNe/gAEvEQgUIopLtD/o8577mLg6pLiGAALpBcFL
 S0fIEzNkuMBfRaoed5hsyrnt/O4YTFV5ebGTLDkNf/2DdQezc62cM5mfuoifvMoM9TwoaeBgHUR
 P66gqZkgxLYRxX6F+B1kTiT9CqBj7/6MWOPTRg9kJlY82Db8hCyZaoQ5B5VDN6wbmed6h2+fLej
 JlhPLI6dtZtffZyITog==
X-Proofpoint-ORIG-GUID: FIXTQpAwtf5O2Zf43kXs-eDKWKNtdrPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
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
	TAGGED_FROM(0.00)[bounces-92265-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: A3A8A10FB7F
X-Rspamd-Action: no action

Add support for the Qualcomm SA8775P SoC to the protection
domain mapper. SA8775P share the same protection domain
configuration as SC8280XP with an additional gpdsp domain,
except for charger_pd.

Add an entry to the kernel, to avoid the need for userspace
to provide this service.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe6968..8b899ec7f 100644
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
@@ -401,6 +413,15 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&cdsp_root_pd,
+	&gpdsp_root_pd,
+	&gpdsp1_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sc7180_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd_pdr,
@@ -572,6 +593,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
+	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
-- 
2.34.1


