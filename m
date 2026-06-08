Return-Path: <linux-arm-msm+bounces-111754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FBykE16EJmqmXwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:59:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 999836544D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:59:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iYBf6MzX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Owj0dQ0t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111754-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111754-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A3323059A67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B103BB9ED;
	Mon,  8 Jun 2026 08:42:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7713BB124
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:42:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908126; cv=none; b=Vo1vhW4KGPgajf2XUAjeL4x85MUphq95jgIo4l8ALknxhnjeGc/txyUXRREHgU1uDXz40wNys9IFkvZ4FFlG8cZ4j3UzabUnTAwHjNtTAUcJDCFCF8oWLfcP01BwHw0XjClvRqFNav/kZqbMetnMjeH/RicvE2yfzHBJg32fCys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908126; c=relaxed/simple;
	bh=i2VHhPqPU9CB7AYdnn1m0I1xw/cLNauNNCKV5k7WU/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TIijZgJWyqrmWh3lGNIyDRmSqRuOR20UiI3Id6Z8oAQacRKJzhZtPt1MH+GNwLfF3cXNh65h+rUjHjgcnGU8O2trNgjMI5wABX7AdyAuMDyhqlDdkLU8FfKqm8igaAqsMaPa2NmGv9TbQR2oqEkiLJG4ue3HHQEazTMJGzHSbdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYBf6MzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Owj0dQ0t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OtTV2384526
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CILPnuKv26Y
	fvC2pAzhWH0t1V4UfIovAVfFmCzI5F2M=; b=iYBf6MzXpxTW2EjkwX5mO6ms4dP
	qXHksWrUfpirEvvUmkrIyDOYyyysk1UBBFzYu5fuUM/yiAtQe4iJEkPss0ODOYpd
	V8GFYE1jWAcRj07r4nieGaISDbbV2/soqt+nBUNUFb6S+JsW6dXkGgqQwwdfJkNN
	iQXbB9IRgGhPC1weXhf2efKmfaCUyNHQT0D23wfZ0GpjJ6BRQok3RjyG3KlgQbpm
	/SMkuLUDH+lxyWNlTZYj8sme73/G8d2maHzhc4dtYAF0c40muEsBfov/W4sfsXro
	Iaug7UMf6WnhtDe1DkzzQUCah3iayy/N5CssjR5If7itSQ4thtE0IQAm/3A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1erqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:42:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f24dcedso5157085b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908124; x=1781512924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CILPnuKv26YfvC2pAzhWH0t1V4UfIovAVfFmCzI5F2M=;
        b=Owj0dQ0tgHWOj2jeQtWqDQ4gkd2T9IAa7/Oic5W/k7n6g1r9JqlJQy6Wisiv5Lem9W
         TfWLwpQAwBmf8uC17N9hScYiSFjxhmu4wWJgUCVV8BZzf+7rS8inqljoDTyqag8tu0DQ
         gjxilPAyikr7VqS7FkUbINUG1J3xYsqgo2zGQyjKPIv5GWLZPMUBe4dYUB3fC99JVS+R
         fUHAw3LggkNm9bxyTVIpiaOGcN/Ef85QunHoZHUUMA5SBydLaXEnXOs71yIFcNWx8PR/
         p4R/9UE9xWW4kNxvp1jKwIYQig3DwiHivAu3xxa/0L9kwPcUM7RTViS1B2eHSAnLlm3m
         X+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908124; x=1781512924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CILPnuKv26YfvC2pAzhWH0t1V4UfIovAVfFmCzI5F2M=;
        b=kG+NWQwkFaWsKwiTVxEJscCAF/BMDd+Mo6ghofmwSAyd0igDo7dG1eEXct76zgXYYW
         GSLyuyCxMYhn/CPheJTIE89XEpsMGKbMsM4Lem+ZNaMQRCwAooIgFBe5/D4q3m55Eb24
         QiL9TTAtAKMQaRBwHw1kgk+JkWXO55wfixBT1eawX8zppe6UHkbMdNm4Z3D0q6VHhIxE
         eao7eWWy4RMDYLtP9VQB4+7MCM7rJej7LahG/0Df0kvtYCGArv0VCiu3BiHirG2PeEmf
         IOQxGF1eAo0bxgUaszyUV8Ec3vyCujTt3ewNapl7ajar08ISuJFby4UHZAqg2uXiZnTp
         U8Hg==
X-Gm-Message-State: AOJu0YwpHUu51V/tnJnEkY9I7HXBHqqzI5ohWURP/XK6H8hUIdahgP0s
	pVF4oSMKA2vfszj4Wxv0mCpVGFDXgteIY/ojY8wOz8p53//5z6xI7agqKXBmRLxtxjdig4QHEzF
	9v9Zp0I1pTY+AYX0RekcrTAJO0UiKKYTBdgntP47Vijh5hbqh1xPRdDbMiIwj5aH5u7yv
X-Gm-Gg: Acq92OF8U1vRIh5XbTKUzLYJnMN33h9BoLibD3cYoVlSCncjm4z9MffZVaat5tiv8eV
	5cVVD+scjN4H1V769UYgH6PxrlPQBARb/H5LgEGRuHphVxj7RakFXmcFH2IFRNUFxMxrqpQOtYr
	Pa993vQf/VcCgq4WnDEDmYBxUjnDI9C0zcBKOZ9uQWwhaBY5refY2QAzWwgysJwfWBUQF2ji+GA
	q2NwOIypa62ynFPMlnKoVI3g7ptzhPKEo520tq7sDeKvqCnlTptHLgpMsVykg5TD3rH46wWKi+7
	ap02hIUiTtChXOBA+XSC6El4qKQI/bI5jFqW6OuMto7a/zNYjhD4+9ddCvM9mO/H+80al+bqnv+
	VhR/nfw0zbJn5Dn5Qk09I7oIadE4ZTycLJiWViLU+Vfw2MMlwkP28JyOKhT/t5/7VyG00
X-Received: by 2002:a05:6a00:1c8f:b0:842:6c02:2fa3 with SMTP id d2e1a72fcca58-842b0d6046amr14604861b3a.15.1780908123785;
        Mon, 08 Jun 2026 01:42:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c8f:b0:842:6c02:2fa3 with SMTP id d2e1a72fcca58-842b0d6046amr14604845b3a.15.1780908123312;
        Mon, 08 Jun 2026 01:42:03 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842822222ccsm20520980b3a.3.2026.06.08.01.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:42:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] soc: qcom: pd-mapper: Add support for QCS8300
Date: Mon,  8 Jun 2026 14:11:39 +0530
Message-Id: <20260608084139.1468000-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608084139.1468000-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608084139.1468000-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX1hVOVcmEvScS
 QBEHqJaZyDGWhEyA3KmoEq740MEtvqhGwj1If50nhMpMb+5Bj4ItVTOKRG/0zCGwy4uJC3gFBqS
 QJo+4aelp7NkvtLHxJjhCiZEjcWZaBseE91OWdHDIE+imyr4b0ME2MnWR2IA3L30H7azHrQVBpg
 m/8oIAb71a94ToFfMvY9JK5P98yoEnmR8X+szCGyDy0zUMi73UjfcX2KitGz/Waf6+yx0M4qYnr
 NPZuX1fSAGW8hKNQlUj/hZa1X74fEq/1ujnmeKipw2t4fM/92wIX4ev2JuoT3bYpJDdWYzkPodj
 VNu4R+6ktfqzXoUuDFDnI4Yci6z35HGRdfVMabTMMqmCT2/6a69NT9OSKzGaS3koR/Gv8SwcTJi
 GL200ausA743DpWGgfmQVxoFB3gsPOwl5v8H/U2dCsb5Q+xL24y5YpC/2KmQ0YS9C5JNuvF+OuS
 ZlLxyUqRL1VvZVmP6Pw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a26805c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=c23kUuRnC6VDJmZd65gA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: uUrQrD-BaqvUO62X3-jMhtRPo24G8bR9
X-Proofpoint-GUID: uUrQrD-BaqvUO62X3-jMhtRPo24G8bR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111754-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 999836544D7

Add support for the Qualcomm QCS8300 SoC to the protection
domain mapper. QCS8300 share the same protection domain
configuration as SC8280XP, except charger_pd.

Add an entry to the kernel, to avoid the need for userspace to
provide this service.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 03a5a3a73..d98c6df52 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -444,6 +444,14 @@ static const struct qcom_pdm_domain_data *qcs615_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *qcs8300_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&cdsp_root_pd,
+	&gpdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -631,6 +639,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
 	{ .compatible = "qcom,qcs615", .data = qcs615_domains, },
+	{ .compatible = "qcom,qcs8300", .data = qcs8300_domains, },
 	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
-- 
2.34.1


