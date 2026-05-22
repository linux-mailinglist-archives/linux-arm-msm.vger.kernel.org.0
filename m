Return-Path: <linux-arm-msm+bounces-109179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLfrM336D2qCSAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:41:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984D5AF9AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76DBB303F7F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439933806C1;
	Fri, 22 May 2026 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBo1gV3j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f02d7gVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C45361DD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431971; cv=none; b=N2ce5gtDh24DQEkbQ2+Xl8CS1SSr4yOoRaA2apeYCGdRvhqC3DdD6/vjk5OMnI/r9kD7TE85q2esNidcgy7yGszjV6bJMaLItngxjgoGmjUkz8qQfZmTUW9ocIlZNvoJ7VAP+CxdlL71x9GSbPmX6UqGlvF34khlinel/4eXNIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431971; c=relaxed/simple;
	bh=vPPMrwSbretNAwmHkQk5Ze+IfHo/ksOHlGl4SvYHmK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ksv9Yh4/IxuOKkbiJLNBF14rH2G5ISo00C9d/C4t+eOuOt74KIeM6s6/jdTRuVnC04dNZ+meew96zIfNVtegpmjI66Np4TEPA1njhmDjJNSDYp8FeRfUmg5TWpt7NHsj3Xhm7Aj/4Y8hsxNyQxTDb9z0CCTegDWoDQVHSCewi6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBo1gV3j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f02d7gVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M3Wsq82765182
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6k8zFeejpgENGIEpm3ejapchplAB5iHo5fBZStZd09U=; b=PBo1gV3jZW2KmiE3
	4w7Le3ttaxSP19Y559/83uUzYKilB5LuwQpJhQCunj9AgLeXevf9gutyIPq/zmBq
	O0mwe683VbR1Pfna7T8PbTnfgQd5/TqHYm95cIRMdg0eE5XLUvrFe2QYvMCrOXY2
	vPXYpYrlJ4oLHOB5R4pdDtViizXCcGolhwWdU49oogFohflUT0RFNSD6vkU5AM23
	w71lrN0JVcdMZG+IdcBi8+e8ds4U8BCp432jCNOLlQV+YwReKokgHCo+181gUone
	j2awD7dvyerB8gnemK0LppVc+xHW9lsqHtSry3qTKoAew3amVciA2fi1ndWPnVRW
	n8+eJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7uefv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3684cb22502so6614064a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779431968; x=1780036768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6k8zFeejpgENGIEpm3ejapchplAB5iHo5fBZStZd09U=;
        b=f02d7gVVWNi9n+vHWt0u1gUK5uMpbQIa2J9MJUXV16vN8FWHHtdeQiPP9jS9ieXdjA
         MNJMFFZ/BVO0Gtvsf9nWtd3hW7qKDvEqu4HuFYnZIql4mTb5IFZjrWn6LSbHVHnhIRgy
         TZ4c4Dc1svKxcpE6LIEP+HabLK2oeaiBvHwCRbgw9JgFWcY9mnaEY0tT3V5oFgNSgq6k
         nQShcm4ZfHbW7Mq3gBgf5NpkPtRo8OGASu+m+pfwZkGMmQJCDe6vgbLXxAxgbHaH8Jyb
         n6l5TwflvqKiUe/QV0k069NW/xnCvfagAtCqkV/dGh5Z9hRnPAQdqF0VHiDasbQzrrDF
         4QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779431968; x=1780036768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6k8zFeejpgENGIEpm3ejapchplAB5iHo5fBZStZd09U=;
        b=L3ay6y4ScbUFcaqDy/Lrq/W2ju4VSzHfaMnu6aJ5zMpoRVDR054SRP59wjfBnzXSpI
         Ft2Pp4CLXwy31M2HoXv5ezRP0N/v2PleakgZWJYo52x6h3IuJRtHz5ZL3En2EzcT5r6C
         ksaBuvJhFqbZvQQCGpnUSYLXaPO/xoJhRL6/bqFiOfx4CB7OknfobZi696A2mZiNgnP1
         D3+/+HxkCRPbE3hyAuhtz9yQi//KX9Je448ffx6I3FK/X29AsikTI1esDUKkhIWj2Yey
         j/wHU/fP+5Oha0iEEbAhuFXDCgWa1jUYTHkb5ZxCpJpWqmVcbz0UOspmeJx5lKS3X5xr
         cx1A==
X-Forwarded-Encrypted: i=1; AFNElJ+sHnr6BPK/dQWoZ9Xifq23q9SCknuqNQsZpzLPoNTR1DC7ZGRgkOofqO9qhm2evcAMPz3uddXYEg9sKzWX@vger.kernel.org
X-Gm-Message-State: AOJu0YzXXTO1FTEoDWUsL/5L++eswHztVea1Qx+ZlyKYxtgBjMGGbLUX
	1DV8XZx0XmNQVSRmo8P3BKtcY3EaUIN8igUnm2zKKd5TEXwKBdTHiCoON41jxQK3O19WkJ+W1Tk
	3DnJG1fkCxO3KujZUOjtlFQ6lzLpMbtjxZED8Kpo3YJTV5LzLMVrC+VZmd7XAafKJxvza
X-Gm-Gg: Acq92OEkjni+VA0j/aTOZ9QZuyTgpmLS/u+AeYQr9jaJb1K4zwBvlcWnqRqSG0pcABR
	yUUUcnR4p1ihIHtPrtggzu2G2L5a460jlCf0fkfrLqI9BdVOGjPlzeUmK23wJ0KaMWTealvjw6b
	9ldtOoCyId1QLvBLJVarmUjuOIf+AigUvXW+e3t3zU5oGfOVLCRkaJ0ug/2S7Huc6vq+ilLHU7U
	y/gkX2uhR6U+AE7La2bQauLYrEhi/Es8cBMhN4JPFky2/pIIM2fEAIA96pWKEBT134mJJoQsVSu
	lageJscrS9+aC0ZkrgueOphbtv1/0IoYqXMEhAXKW3SOmV2BU+XdXuvvKsEd8S6hs0uqYBg3r4X
	OykYuCG/Zoo15XVoN8ZZ1gl3HOyjX7LSlfIG4PyiK0lUpH76ntFMs42K3465xiqfB+uM04cyOCn
	9K4ln3cAU40mbVEY77KjZhMw0si1ex3xfVuQhgQjdoWyISL3wfFBk=
X-Received: by 2002:a17:90b:5823:b0:366:aba:4c86 with SMTP id 98e67ed59e1d1-36a676931aamr2428169a91.27.1779431967512;
        Thu, 21 May 2026 23:39:27 -0700 (PDT)
X-Received: by 2002:a17:90b:5823:b0:366:aba:4c86 with SMTP id 98e67ed59e1d1-36a676931aamr2428140a91.27.1779431967001;
        Thu, 21 May 2026 23:39:27 -0700 (PDT)
Received: from hu-yrangana-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cf56sm888822a91.12.2026.05.21.23.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:39:26 -0700 (PDT)
From: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:09:00 +0530
Subject: [PATCH v2 2/2] firmware: qcom: scm: instrument SMC call path with
 tracepoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-scm-tracepoints-v2-2-e27cdbe0c585@oss.qualcomm.com>
References: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
In-Reply-To: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779431958; l=2631;
 i=yuvaraj.ranganathan@oss.qualcomm.com; s=20260506;
 h=from:subject:message-id; bh=vPPMrwSbretNAwmHkQk5Ze+IfHo/ksOHlGl4SvYHmK8=;
 b=R5UMEPITv03nsw2tgtSkEHEmRgrc/fIj4oshFHBNnKqsj9vNL7zeFFpd8sPJpBMpHHE9C8uUf
 XtGAI07dRl2AcMF26HuHp238BsTTYLP5Z4zMNjKKPDdm37ZtpUZrLMx
X-Developer-Key: i=yuvaraj.ranganathan@oss.qualcomm.com; a=ed25519;
 pk=ln7RObom4c2W8MEnQqwZbOi6X198/6toN51al5+6rKI=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a0ffa20 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=R2Gh0RvCMMMYrCYy2VcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: gMX3U4_LTjlQK1341TEKeg61HPiABIfg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA2NCBTYWx0ZWRfX6EIhMitfI+B+
 kzoQiHa1XwhKnlicfXwsDYBx3dG/fWOqIznuIAmf46R6MQebd/Bwf2RoJ6gIg+uSwyz38vL3eWH
 6aAMQHMZ6hvN3AIRRsQYheXLqvzrEiAc4W9y91sGMf5LP+XGt+K3Xdw+GblcjV0mUymNyDx8oiX
 /m9lrktpF0LsxcFHEr60TYc4JxTls1gESr67ad/J8rdrdnjl+GZgWvghwOErg/VV1JVaJfQTF9p
 tjF4yljSIBhjNFbHFci7rHv0wbkJzkrXewO5SNMdBDqPkC3Yrwg5IXwiJYNWyZT96So4NectzA6
 mr+cb6SxJesDbx24Qe5D1RBYc3uqwzr2yRfBBYldOg73SYNcOejYqIWFo215phrmR1Df4UmgHkY
 TAhP/Q9lBoUZnjFVKWNs0Tb8fxUgLuw/z7ucmnOyDm8RyrI0KIdG84t3TkN9Seu7CuLOsfjEQGb
 DtlbdqTRlvzvJRqECxA==
X-Proofpoint-ORIG-GUID: gMX3U4_LTjlQK1341TEKeg61HPiABIfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109179-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yuvaraj.ranganathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5984D5AF9AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire the five tracepoints defined in qcom_scm_trace.h into the SMC
execution path by including the header with CREATE_TRACE_POINTS.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
---
 drivers/firmware/qcom/Makefile       |  1 +
 drivers/firmware/qcom/qcom_scm-smc.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 0be40a1abc13..b679d3fc2c26 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -5,6 +5,7 @@
 
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
 qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+CFLAGS_qcom_scm-smc.o := -I$(src)
 obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 574930729ddd..01999c22659c 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -24,6 +24,9 @@ struct arm_smccc_args {
 	unsigned long args[8];
 };
 
+#define CREATE_TRACE_POINTS
+#include "qcom_scm_trace.h"
+
 static DEFINE_MUTEX(qcom_scm_lock);
 
 #define QCOM_SCM_EBUSY_WAIT_MS 30
@@ -44,6 +47,7 @@ static void __scm_smc_do_quirk(const struct arm_smccc_args *smc,
 	quirk.state.a6 = 0;
 
 	do {
+		trace_scm_smc_request(a0, smc);
 		arm_smccc_smc_quirk(a0, smc->args[1], smc->args[2],
 				    smc->args[3], smc->args[4], smc->args[5],
 				    quirk.state.a6, smc->args[7], res, &quirk);
@@ -83,6 +87,7 @@ int scm_get_wq_ctx(u32 *wq_ctx, u32 *flags, u32 *more_pending)
 	if (ret)
 		return ret;
 
+	trace_scm_waitq_get_wq_ctx(get_wq_res.a1, get_wq_res.a2, get_wq_res.a3);
 	*wq_ctx = get_wq_res.a1;
 	*flags  = get_wq_res.a2;
 	*more_pending = get_wq_res.a3;
@@ -105,10 +110,12 @@ static int __scm_smc_do_quirk_handle_waitq(struct device *dev, struct arm_smccc_
 			wq_ctx = res->a1;
 			smc_call_ctx = res->a2;
 
+			trace_scm_waitq_sleep(wq_ctx, smc_call_ctx);
 			ret = qcom_scm_wait_for_wq_completion(wq_ctx);
 			if (ret)
 				return ret;
 
+			trace_scm_waitq_resume(smc_call_ctx);
 			fill_wq_resume_args(&resume, smc_call_ctx);
 			smc = &resume;
 		}
@@ -201,6 +208,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	}
 
 	ret = __scm_smc_do(dev, &smc, &smc_res, atomic);
+
+	trace_scm_smc_done(ret, smc.args[0], &smc_res);
+
 	if (ret)
 		return ret;
 

-- 
2.34.1


