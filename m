Return-Path: <linux-arm-msm+bounces-111329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yC4gFsSDImpIZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:07:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB64F64642F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:07:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AkhVahHM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jubo23yr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111329-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111329-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B30930066B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56D548C406;
	Fri,  5 Jun 2026 08:05:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD154921A2
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 08:05:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646757; cv=none; b=fMEh0rZ3tusU3a1Wh91gFTiPBEkQw7AbHcJsID5BMHw+Nj2O+TO/RieLEfRl1fSiAGOQtI3oC1mhD3BVvYIGH4IiRjqJb/6kJQ/1S31k90SXlEOgx+9C8G6Xm25SZuyjM+S/tfkyKbUH+oammjdOGST1qzttLtdi5a68R/31Zy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646757; c=relaxed/simple;
	bh=AbZSvSKKn0azfcR/+KXoLjri4lu6RoAzxNHoGD8OEYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rFK6wZ9WLQJdgwHKldY4JqU1Vp3UGzUEjBeL893dE0y9ZUADjbNZ3bCK39RxSK8Rb/SHdpbdVUyHVB1h6vEEcK/PRcN3GY0wNnu7cSohAg76Hl4TUXrPcb2HWV1iZGh9KgWyl2eQFmJ1OH6MJMBtiFty9tkaqTMKdg+PJmbERWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkhVahHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jubo23yr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6554SuIu2669054
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 08:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jnyvLn0lVJ9hoiL08NGEpZ
	FA/h4y2F55THnZ/u0gLdc=; b=AkhVahHMAosM7TvuFm2Ydo2S2uclzo/5IaI2/V
	4YpCttye3ndLl6RGkwzsMMZtqdDfv7nP7aq1YlJK6MG+u+yjg7mtMOQwn2eUXFsi
	0k0NvBHvY3Drh0T6EvKX4RSI6FutlB8D1//9BiWVABFmgBHyhSTghPgtT2cKu/cz
	5okvsBTAm28yB+aaIV+tmM0bJjUxwRgq8LVfiYIbOOVDDdSbMBgzxKi7zdFdh6Zr
	r6VOC8HfGbIaagbugB2pSJPGroxWXiqosmziQuGT1C8jFT4ypkQZb4HiapewdxrE
	FRqRXuOExjk3SsDpLI5sRWrAnNh9ciqAg60lxqDOd2JBftpQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekemytwhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 08:05:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ea42b025so770271eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 01:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780646751; x=1781251551; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jnyvLn0lVJ9hoiL08NGEpZFA/h4y2F55THnZ/u0gLdc=;
        b=Jubo23yr9/St7BS3cq5j9C7KEUx+aYPzyLeVzyt30Dh18raqowdo7zXcAf4z/fpoz5
         5ena9m+TudODT75dJaBzz1xC61op6zd1h29ljGwK50KG0FT1H1b5ZtTCEMfC0uHVhyKA
         Qw9bp8FnZSEg8E3iC1cE4p0W/gn2ejAmx0viI78hiJYhXOQ3kMiaQzlcCIxNlFxxIVhl
         TGb4o9v1GVTMuQye800ZF2cb2twUcrduZ7q/nGUjTmgbvSEDCM45x4Z+e5muru7SEFal
         0iqofXQQeq2ItnMYGCMuLygj11bz8qqv2ganXMX3vFcI6mepyBppwol771wiwCR+KXnR
         qTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646751; x=1781251551;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnyvLn0lVJ9hoiL08NGEpZFA/h4y2F55THnZ/u0gLdc=;
        b=obyI4aptuvb8lpYS1lFHIToTZrpd0HhZOEaT5CmsCjOSewh+58uMLbPiIbeiTW+Qfv
         E9HXoB6CSG8ctSTZONJ7ZUHlqWedKdC+t3dFQNrQyXi15Ra6KK72N1pFre+M0Vb1wupH
         YqOZkSjb/5QoVItyu4/WakhSJ/V/9yu05/QfX2FgMSdLkDCgR8v29oIxPT1x4L6hfLcY
         B+LPijuLoeRQGJDYlOPlLIL0AjvayCsIT7tCtjwX84oZZpPgpNTA+a48Ut0pPBiBwKLC
         YCEhyr88bQkTr3FHUbBhEqG2cLzomKU50fLSJ4FoI+QR6Dg1lMMy8h/lVf72rNTc7PVh
         LlAA==
X-Gm-Message-State: AOJu0Yz/o0/T7pZdlMqn/k8IIUuhEsaHoJGj+AJlpDqvAZoxopNyzC7W
	H/JVvYVTzCsC4OtOVtV5pOkP+MfV+kdxnnwF92LuKVih35aRMn6VsyfXwUV6UwDi/UfHdJp54nm
	ncPpz2qey8YD61EcqrZ+p6YFy7lOE/CfZBvZA4CGLhdFo2AOkXbFsdFsWQs84adtO5T+C
X-Gm-Gg: Acq92OExubuPb1ZhfC9y3NT+fHbWyM67JdpV7VUaiQYZJzgcm5cJ00rmraeFqoNEsgX
	zUPpCTGDpiK3+uaV5kovFKK3TdeuN+XOd5yTNpTxKAzCoyA92vEwvhI4UyJ/e6XHqZxPt1uW7Rw
	QI0G8GpwiXv32b+8AN1YSDM/kJaiRcZM2pAB1cMwS1rrR9sQ81lf3DZoR/NjVIP88Ju6lWzWeb3
	n6Yf2SsOglO1SyGelR9uS+fQtfqFoSyDznUnnNBBfgUw3wEixReFVsR2TdjE4B0GuIYtU6bkhmR
	kdkQn6AYFJWKZyR0BMu2Q/2K1+XrWVHoZFqZTDMSQKLJ8dgv3GDV2zHToX0snA17B1UVHi+/wnb
	d2IfIE58II7/Y8KsLX9mIwGZ78Yy1CH/i9W9EsAdhGn8IG3R1yQgaq8yPmhE8pN3dYa4o1iDymu
	NamGfTIVdZ
X-Received: by 2002:a05:7301:1504:b0:2f9:1004:b2cd with SMTP id 5a478bee46e88-3078011de63mr471981eec.20.1780646751442;
        Fri, 05 Jun 2026 01:05:51 -0700 (PDT)
X-Received: by 2002:a05:7301:1504:b0:2f9:1004:b2cd with SMTP id 5a478bee46e88-3078011de63mr471965eec.20.1780646750892;
        Fri, 05 Jun 2026 01:05:50 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm6549085eec.10.2026.06.05.01.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 01:05:50 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 01:05:48 -0700
Subject: [PATCH v2] spmi: pmic-arb: initialize "ret" to 0 in
 spmi_pmic_arb_register_buses()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-spmi-bus-register-fix-v2-1-b3964b093fe9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFuDImoC/4WNTQqDMBCFryKz7ohGEe2q9yguEjNqSjU2o9Ii3
 r2jPUAZGPge72cDpuCI4RptEGh17PwooC4RNL0eO0JnhUElqkiKJEeeBodmYQzUOZ4pYOveaFt
 rqty0ZZYTSHYKJPLZe69/zIt5UDMfZYejl7APn3N4TQ/fv401Rbms0NbqMtOVunnm+LXoZ+OHI
 ZYH9b7vX5rjBKDTAAAA
X-Change-ID: 20260604-spmi-bus-register-fix-dfdb94bf834e
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780646749; l=1222;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=AbZSvSKKn0azfcR/+KXoLjri4lu6RoAzxNHoGD8OEYU=;
 b=66r27eVQQFS3pN1C1WeNE4qR3QE2RjC3iKBuojIBvFTQjxrkUVdXnU4KBMixA5kVEVeN0ioJg
 BFNX9ogZrArAhVSsK8lTtU3EM4FhoffIIbPyBkvP37c09mM/8ha267M
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: W31Ix6auVfAmdQpks1X7NUoksz57fSGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA3NiBTYWx0ZWRfX5tSQeR3zgc80
 vd3JiCS8ZpCxNfCfMiG4m+6CqfTHOnScwUQA+zyPTX4RuBqZpy8C+YFG0CGsU9YdbiAhvektEo7
 usAhnB0l3gGBf0pUFtsVubIX5yi3OLrCfNX6Sr56YtmRdrJV6Qdtxh6aZso9CfPiM2MgZ5xK7nF
 52RrEDLGV0oxZE4bxa5bmxCGNUehQPsc9SaEYbryTvgqpUYxLhq8kJBnTeyTkRB3RQHqFkbzuNS
 VE31GHQ37/fjR6nGP0iTlz00cnIRfj3WhfCZ4w/6qH171ARcvLkdhFOlF0KUlqEYBu5VXKUa3Xv
 xZdKY9hUYFSyg0K9YJQBKiRYZut+GanZgskFFhTNn1aa4z3XOogM4IRL0m13JwrMW706bsWiW36
 36Cfs2dFH9yj9IilJ0Vts8mGY8l18FBLlsxGQQg4vsnlXGscTk6z5pXackUfUmBsU65moFbzQjG
 tVRdnLqx6kICDmZtCZg==
X-Authority-Analysis: v=2.4 cv=K/wS2SWI c=1 sm=1 tr=0 ts=6a228360 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pQvugiExNoUzksszKGgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: W31Ix6auVfAmdQpks1X7NUoksz57fSGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111329-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:neil.armstrong@linaro.org,m:abelvesa@kernel.org,m:gregkh@linuxfoundation.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB64F64642F

The "ret" could be returned with an uninitialized value. Fix it.

Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Drop "of_node_put(child)" fix as it has been fixed by updated to use "for_each_available_child_of_node_scoped"
- Link to v1: https://patch.msgid.link/20260604-spmi-bus-register-fix-v1-1-136adda83a92@oss.qualcomm.com
---
 drivers/spmi/spmi-pmic-arb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 2e2cb4774103..6203bfc2207f 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -2046,7 +2046,7 @@ static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	int ret;
+	int ret = 0;
 
 	/* legacy mode doesn't provide child node for the bus */
 	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260604-spmi-bus-register-fix-dfdb94bf834e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


