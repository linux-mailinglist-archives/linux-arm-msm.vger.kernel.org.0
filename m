Return-Path: <linux-arm-msm+bounces-111753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M2JqC6WEJmrMXwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:00:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6465450D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:00:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VLIQQUDW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CU7xzZr6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111753-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111753-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32C2931507F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2BF3BAD90;
	Mon,  8 Jun 2026 08:42:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F873B9943
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:42:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908124; cv=none; b=cbOelpzyZ4ffXmCaJpV6LDd72m2sKP1gvHoQ4PoXvDBs9jRGi//hV8AxccmzaKySKIlHPbe4F/G7bxUy5PhaZ+2SkgaS/c+cZzKRYFZ/CEkWnvJXfFGXqK1AIpFr2ot8d6arclHghbayfdbtZz0u6zSQnBL0XgJWF8jr9QMdiHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908124; c=relaxed/simple;
	bh=RvLgZelepe+xP7CKlJmyhbMohqae/sD5lsHrw5S6zuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ij1n3wNg0/tuGHv7K1tO15fwhO8ARBnY6Z5zEqfM1H65MgUrH8IXDpl5fh93XnD6pDmT5X3a4OTYdnmVMzPryX8L/23zuIEhK46jo+IUTvup/5dI+CcfswR7jtFdCK+WLyrlQlbJBRA2/gCWlD7USUpKvyqYVqjZMDvE9pyBwgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLIQQUDW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CU7xzZr6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PkbD2733104
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SBotY3CTE2f
	J0ZmbEQkqNcbhBQXH+zcryEcB5+enMI8=; b=VLIQQUDWaJVZmni9VGSVUfm8Z5N
	AkqoiWE0Lyc5QdehN5c/atB3vVhEQbo4wy1ICFvxox8Q3ImuvxL2VxxMkIwc/4bj
	/m41RTNHdfHv8yEEJUeKkmODSgGTE7Oq5EMVTyG8yPtat+vfAxXlIHAXkNoAAvLe
	oobPNehjJvfdsJqWlCtaq9FW+Ha5qLgLOokcTYBVJYZmBdjYlcfKVsURqOFzqqso
	Gb15XI+KoKCF8TCLjmdLqbhkZrl7ex14NoFf8TQ+y2u6QGfDVZ4G8Fez99K5LQFn
	NgcyTVeeNBG2UvVAO/eqZQIYvGc3Wj7NIs/FQDnDyXGszxnhUNOTCpC+KUA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6yuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:42:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2cde332so2075894a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908121; x=1781512921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBotY3CTE2fJ0ZmbEQkqNcbhBQXH+zcryEcB5+enMI8=;
        b=CU7xzZr6LsuY5OjAToN4O3uCD/4QN2LCOx2apa5NIw4UNsVS2GeFg3kR84E0F4aLm8
         ATnOBjLv3YUX0f98RBgM8umqBe1ErYaTX5ChU1l2QX536ulFRFVeuVSCijOahIYBaoh8
         XtL/sWAhuu52McEIZYkAgn1ZXtdM2SW6B+1QWR84k/ekxpU3BMOQH0QmbJ6UnIEfgfP5
         rhkAOufI4s9nGpTJs58JN8cWHvRJ7a+RpUK3pDWRljvvpIvzH4jToOGjqikkOOSWCD+j
         03TaT7IK73mA1Rxj8LzKz9QIgYb3AtKw8u87KloqWFH4glP/iJsiP55pTqmqUmQ5lYd2
         86Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908121; x=1781512921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBotY3CTE2fJ0ZmbEQkqNcbhBQXH+zcryEcB5+enMI8=;
        b=q7anzc/pW0pfhTZRfGHPXe1quaEh7fQrhSPqglYNdsJapIPSHK4C3U/SOdh+Foxjer
         ZcOb5K6J5t7wv/m9xLXQl4JqEZs2Hvb2CsGHPqhtGGHImmQhqdUZZhS7vYwpV+zHZRhb
         I0JNAbVEun0WnTqCwEi1yMhSAzJU+gHRe8a0pz4PNRxslvTbxGeVIgg6QrvZ7X+GvxHV
         rYWlA4dUI1W0vQgP0d4kxw4g6IsWbASQHnDrW+BTayz+1L6BqAGs1jywzZ6tRghuqLBH
         AfBU5z3JMZHccUuPtHsxDk2UizAZmsClrTdMdP6FKBJ3F3S5RiCez+aJyENFN33W1toD
         ZDJA==
X-Gm-Message-State: AOJu0Yxp+T2fG3T6CtIhRdNkb6yPiJXGbTxfjoYS8ef3MBSawvNoaHNx
	RAyRIRdCODDgm7qwM/dlfLx5w9QASIxETKQxgSWLaPf9XSkV3mu6oGN6oQyx1hZyAciTcAVLk06
	lYlYGtszTPtwpChv25hA+qpUxDgLunIQngK4xYPRpdR9BQgRXc8pczuYAFu732PY7Ovvi
X-Gm-Gg: Acq92OHmufWfeaLjmUqTuuu4+XlVEpIijWM/6fsA7MuZ2Nf0jcBMDgo41A/7UiTDEbS
	5MwhJdrCTrM1FYyV/H7mqTCKc2SzbOYfp1hM+qREDofMir4kS7AnHauOCIwxtkVnF4uQRmTqwY8
	w+DFvBUe+ct+BYQXQauGKC64tzWun+HR9Rqll6VCpgGH0EPIUfD4cb/E9K6A+PNn/bYl28m7gGg
	c90xOHCgLFmsEhgeEqsrMvnC4VAz9b95LW5OtYzRJ25rlkgRjrz+EDC5YMqjNJBKTuMVBNnIPJe
	wxA9AGMRAei7DS6ixU5T96sR4Q4uWufbwzBa8UB7dk+9KRANET6v1hRHWPRmzHMp9exD9/+lYWB
	qitJQ4X7ntzXwOccSBtMi4CPX+2VGInefEPyXG3rE7Lsb4Xm32GLwVxyXuWpQ+xR7jvgh
X-Received: by 2002:a05:6a00:2d26:b0:82c:7767:5bb2 with SMTP id d2e1a72fcca58-842b0fb2880mr15272360b3a.21.1780908121536;
        Mon, 08 Jun 2026 01:42:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d26:b0:82c:7767:5bb2 with SMTP id d2e1a72fcca58-842b0fb2880mr15272336b3a.21.1780908121018;
        Mon, 08 Jun 2026 01:42:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842822222ccsm20520980b3a.3.2026.06.08.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:41:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] soc: qcom: pd-mapper: Add support for SA8775P
Date: Mon,  8 Jun 2026 14:11:38 +0530
Message-Id: <20260608084139.1468000-2-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a26805a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=GJhC-LizenwalLGVfMwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: vg5t14ljb5gyvU0nifuZzTgwjClwtOzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfX3bJo/sDj0Tnr
 jY2KQMxsZVr+Uoz3f842MoGiMn3g805u587DvhD1FN7lcYwWtqjyR9nY5b1yrvm2nOonT7Lo10p
 0AjkwCl08WkHzMS4goYLIiEUKv0cYjuIE1Mu16hoJO15o8swPuf9bCcSYfjfHUDV0arvbk0+lcx
 CdvHDPTgYGRklmDIBEyTMR+aEX3LzWfHXxhAMfJnh4p01beSs6Kemt6sd4GoaRYZnJ8lFr2tHt6
 3MSz89nSP4pE60EocQFzxXQcRWF48ue7NoevWLzTDJRLjywkWrY1jephMneoAje29fXwCB7JbQ/
 I8oGKKRtW4hVpXSf2dgkhrNTfwFifGrlcoO+tj7yyfxVWsY/L3e13Xe+wDdyZGyXMz3FbVCp1Qz
 24OE8NDM9ZnwN1oTwa9LWSp9diSfY/N475LdvGhvMAWxxSVZVq0ctzTS31y/BjwA2t8gY6JLFKp
 KJuIPzS9ETzRc7CKhaA==
X-Proofpoint-GUID: vg5t14ljb5gyvU0nifuZzTgwjClwtOzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111753-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0F6465450D

Add support for the Qualcomm SA8775P SoC to the protection
domain mapper. SA8775P share the same protection domain
configuration as SC8280XP with an additional gpdsp domain,
except for charger_pd.

Add an entry to the kernel, to avoid the need for userspace
to provide this service.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index b99718e25..03a5a3a73 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -311,6 +311,24 @@ static const struct qcom_pdm_domain_data cdsp_root_pd = {
 	.services = { NULL },
 };
 
+static const struct qcom_pdm_domain_data cdsp1_root_pd = {
+	.domain = "msm/cdsp1/root_pd",
+	.instance_id = 125,
+	.services = { NULL },
+};
+
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
@@ -426,6 +444,16 @@ static const struct qcom_pdm_domain_data *qcs615_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&cdsp_root_pd,
+	&cdsp1_root_pd,
+	&gpdsp_root_pd,
+	&gpdsp1_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sc7180_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd_pdr,
@@ -603,6 +631,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
 	{ .compatible = "qcom,qcs615", .data = qcs615_domains, },
+	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
-- 
2.34.1


