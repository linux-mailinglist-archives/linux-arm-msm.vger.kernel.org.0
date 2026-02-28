Return-Path: <linux-arm-msm+bounces-94570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLySB7OnomkK4wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:30:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800C1C163D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8674330BC5BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722713DA7DF;
	Sat, 28 Feb 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiWZehNE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJwH0aRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B543E8C65
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267355; cv=none; b=F608/NB6zMRWceLzPoGLK4cYG7NBMqobh3nJPzhhIBH1TLMIZBVGWrrXO3CNnvOdyGvgbYDGOFFDh7Yuz+9I0bT1dgcDRF5879w++EnmLHkyRMD1FaXrGMNkVxO+JF3EJjuczUsCiVO2LPieYsX/S8p45WI/D0Q8cJt4IYQbwk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267355; c=relaxed/simple;
	bh=1Kf6KXU4l/H3LFKNax4FrB33AhXXcXlylE0Nbe0Lz8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7uFix90UkpV+m6SgVJEXSp0SKHdasLUmRAlYZT6v01R6VYuQzIj2LLfMSOGypQB5kGnama7rZVFTNv3fU75gGlXGtYL/A3kSGkNmN2hfh6Br/RPoWZ1ACz9ELl+qkh9jZotqHsJUAH7u4KvLUnUEuiRekzOKQMRSrwFZSbk7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiWZehNE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJwH0aRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NsPP3132747
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=; b=QiWZehNElJ2D+09s
	trzIxCRhst8ERnY0BnDu/v027pW/KyHUVejsDR+dwKLG5hnd71ko8aURM3pOT7uV
	0HzFjsF5u/Y62Kz5/IDlfWIDX9oo3XkgfZMrzwSvTrYmTxxn7Vqa8cZhAUyllICS
	dzAJ31RF9KzUfLX3MDphIxWGdRBJsyOFdh+pRyBFcj7W2P/bO9rNY1m3ZP3VYGAT
	fALowp44iz92mzUu3c32XpkAinbKPz2mvmoKhkPLgbzJTvq3MtYGTSQBW4W+Rf63
	NVWYUxypgQXHV7yLtabhj1Ja6CmxbsdkgY+p4gh9+lUjY6CmIpyH8kYtdkdKZKjw
	INcujw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshcgjhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 08:29:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899c6250348so273395186d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 00:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267346; x=1772872146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=;
        b=kJwH0aRwtFbn6RjHppvSJKOkFzOmMOx1XVzqOcBwKtyLYoAbKYOUAiLmworNaugvZ+
         z1TiHkG8lVTphKDUOao0jGe4th1gdfl831S5CSpMz+T34OLuWWjfe2lylt2esxt07E8G
         qQswr/km6aLzSh8tc2kS2BfoNdsOfB2IfIFJMkjvYtrAvKXHFaVB0C6CvWfUhKuaadXr
         6hg+aX+IeV+X5T2OVhDbrotTMprGLtrc9SCrfM/pCC87kNDMjucVNfc9s2Jl+yc7XoIe
         xTVLfiJIjV8URnL9TwCRn+GFP9zClqn3NsywXYKFrP4N0SCXa7vEQ9T4NwdBCM6+gjzt
         L/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267346; x=1772872146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsBjgLUYF1aZBbJeQlRJX02GwU16qfWJ7mXVf2mm2d4=;
        b=kd4Dj5uYj2lcyw/J/HI9wUZc63/cQKl5i7fA5CNfAblEzw9LPHp7B2HmDSGhis+cfm
         bCfMuHjeS6/UhrmkCvPaSgpQ/IBmGUN2NWZ3a+IHKmwTEGWneh47khs9TU865JeF3c7u
         +6ixoyeHLC5wpjeZjo8Zh5bK3cI2AdW4/uafYBUEE6RLY5bYVpxxbppUfqe7Z7N9FHf/
         ulRKfWoG3/x5f4SPU5hNqLE4HpoVudKhj3afgtUvGcrfUAaMFPk/VElnry8B9SSDTtiT
         LraAoNHFmG260dzfWgdViGbq9NK3WKjLrhe2C0jztPyLKpdmjw3tvHIAeEnViYx0L0H8
         tQUw==
X-Forwarded-Encrypted: i=1; AJvYcCUSeVsCHPWkpoAmbWP+01Zq480qRF8TBUMZFy1HC3a7NYAljq4PhKO1XY9TjdkAf4k22gkedk4SeV2Jn7B8@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+SMedWujhVJOgdO6w90/bj6++kgDJYkxiP2XaE+Gv5tqK1eI
	biAJiXMolhocnHu4BArwCJMy/esWdXEpCrxh2Eukw4okLJTOe1e0uVDWsISwZu6npqL1rW90PBH
	vgYQaDeejkOg5usvuJueAa8PuQz1uehys6VXR7O9eMocem6m3SLwzGToBKVx2IoO84CbR
X-Gm-Gg: ATEYQzxr2BGhqWMUk4X3Skh6xkWKYLJbJKMLESu8bQKkLd7hr0nr6kKOqyhAERNAbFr
	XMSmTyQxlJ0/bud7r66X3qFrIe9QWcwXP6+qhxFttC0cDaxFteAbS+I8vuXPiLAp1eibTPVbvRO
	J/+dmJuWLMuRouZDm4mrRH7cT98NS1RuIQJKqDeXj31I1ro3d+dU8bH4AsQu6nVKp4Cs0+NWyL3
	yt7Y9XihO5Go0D54zOP5+JF6uxFiiW8C88PYCW+qgKu2wK73n49nZSFVXXyYjWutttBLjdmBjmq
	xO5l2yYUoizKhc0wi6RzhDsMli+AP5ml31plU5xpVgZDSEL78Go66HLArTPKuouoAysOqcz8HlW
	7+sXGhwUZ9H48ymZzUKUkWvRSe3IvwiyLPmAiE/8HLuNvBuvDOoT4NqrVJYGiVmEX7vT1fyJk3V
	W9aeH9acIEfqOUBee5lkb6SUweJEAe3txpnHc=
X-Received: by 2002:a05:620a:4152:b0:8cb:bae9:9f46 with SMTP id af79cd13be357-8cbc8e2a446mr676121985a.77.1772267346475;
        Sat, 28 Feb 2026 00:29:06 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:8cb:bae9:9f46 with SMTP id af79cd13be357-8cbc8e2a446mr676120485a.77.1772267345975;
        Sat, 28 Feb 2026 00:29:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:51 +0200
Subject: [PATCH 06/11] media: qcom: iris: don't use function indirection in
 gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-6-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1Kf6KXU4l/H3LFKNax4FrB33AhXXcXlylE0Nbe0Lz8s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ai5Q4zM6P9WP2vls3/Ziof9HXW6feXTn00TpW/33HdU
 /9k+dOcTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMREKA/Tfb7U2VIbvy5BOq
 LXbsKBZ245ZeLhZ3dd/OhDff+lp0T7//9uTh3SMfQ7ccdrTi0LaxTeQ5UHBsskip9sZ4Lebs0jV
 GrH07+s60LDVfeOaX+EmX4vuz1cO6vBv/NRftb3m26fSWZ2ZPtzctmy81j3f23Pql6uaWVSJ5H3
 J9Qs0ZFQvn1RqW7FVYk/tRdBLLlktd3cpPl3vL3s+6GuMv4OitEntodtSSkCvMbPsfvgmL8BDoa
 bl4tMbR/VADj4RFrqZXpEmwVoWOf0KIjNcXHp+f9ts/yP7tmlz4Me2+zJ2zTMob01N49H56t4bM
 qLF4dLb8S9Fan0U+KjydEXycFnHfyqbpnJr5v7X0E8sfAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: X6PbiAYLeq7ArNE8cBLOx2DUs7FOjwHE
X-Proofpoint-GUID: X6PbiAYLeq7ArNE8cBLOx2DUs7FOjwHE
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a2a753 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=M7otsm39oOdpNaC3G74A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX7a5ahnqiluDe
 4Q2puNEqmS9DiosuBLgXhRNBFuzZcka5mCtoWNivTDmjm1rtVy2JziFcYmwqRUUGnVWYT0k9ieE
 T/diCpAhJ7t7iDJFJ8NLRXCVHjefACr4PeVoo2d4DCSPRDL10xQdo4I2E+rgvaJNgLXGYUFgKW6
 hqXP88hhua6j2iDZPLLzNMq/rVYtGh9+5rwRPB/OAKjEHCjBUKlyVHgWU0b8SoRtY2N5U7SpK1p
 BYhaoMzLdVGXCHL/NXQR+dnZGCrVtnitCpl41ygYuL8ld8Bi8JN46ku12lRyuBiZV0xmATHwOwR
 B9smzKuKuoAbcVVk7ynBRcuS98Ayl/cx20eRIAPcrtQTPIbAqew4vQhEgTDAv6VCrVqsp+TI0MK
 0G/wBFxE2zinepO8urKRMWsLgLc3FnREvYE/WvZG2rIpg9aG5nuphtHcJHs8JaicBzzX9quupyd
 VbjphNFwz6YMLZvVyjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94570-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 8800C1C163D
X-Rspamd-Action: no action

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fd8a055c4acc..93ce7ac3a19c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1295,7 +1295,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1310,12 +1310,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
 				NUM_COMV_AV1 : caps->num_comv;
 
-	return core->hfi_ops->session_set_property(inst,
-						   HFI_PROP_COMV_BUFFER_COUNT,
-						   HFI_HOST_FLAGS_NONE,
-						   HFI_PORT_BITSTREAM,
-						   HFI_PAYLOAD_U32,
-						   &num_comv, sizeof(u32));
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_COMV_BUFFER_COUNT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &num_comv, sizeof(u32));
 }
 
 static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
@@ -1347,7 +1347,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


