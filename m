Return-Path: <linux-arm-msm+bounces-92359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO9iD3RIimm9JAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 21:49:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2C11491A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 21:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33E243010631
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 20:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD424428820;
	Mon,  9 Feb 2026 20:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eICAMQfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHcvwGKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181A8426D1C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 20:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670165; cv=none; b=or5P6S6p57WEJkWuAVmqMfbbIRuKU49Uz+bFwq6BF/RrTIAXjUI0ithit91U0Nx2ebVr1vIJ32srDg0ZMrSRBv2BLyCbnc+vD1TlBBmOYQqA73HKYqSfsE/MXjr1NNfr4yBU1DG2nrrlQVHRRFDffe5JwqIRnREGjJJryigEhHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670165; c=relaxed/simple;
	bh=GjcOiAhOVZvgwvg/4rS0umS+LxdiLMCJC8TaLjPsglM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Za/lPB25vcfM65dRXKkj4re2ZKBSNRkAYv4bb8JLqap7b+axvABwG2/CMguBtpsmFBl/4R4c8MIMbvCGsEb7pdks8CbWbDhRKg+FxlkIBaqigW0y++GD2GkqavXcPCq5BZ852Qr80vsW80TLoAdW5oL4OeRSy3x8a/LGv/lRF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eICAMQfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHcvwGKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619IoPYQ3253331
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 20:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hCLz2PQNAIU
	C4fdv7YAerV+Je1obVaIS6CQCQXjH/hk=; b=eICAMQfGk3uSiw22o6Fx/WBrBIG
	taBRQnF5ES+XZZWvygMkkMSQpY1g3oWg2WT0lL2qg3UuWmw3yvBRWmRnJILSA1SI
	HYrMTlWrrg6wQ6FQiGxwCyq2kJILU4IrIDg282ddJOMj6Gagm5jUwA9Zk8fu4uQD
	EmqdHSZwvHkmIW4rzCOIdPulrfaozznN1/cm2SH1CW+LYKAEWqe5zuwHO21G0Nhe
	5PDqoxE1N2OxdaUo7V4m863oJifwzyPfLhcmy0wQiZ4uL6jX732+zDfhO6sAH+1Q
	P3zZaHH1AUCVP1AtFV5zBISRsSte19deJLihrNsM/TnqGPsISpKcbn5d7Ew==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f6b0yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 20:49:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba66faa692so1314181eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770670162; x=1771274962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCLz2PQNAIUC4fdv7YAerV+Je1obVaIS6CQCQXjH/hk=;
        b=kHcvwGKHqX59CNzXNqtv6FzGUXBQv9r8+vAc92s2h3kPphD0hnSkW+vL3C2myr9gRb
         DdcGMsxcWew65YLTexfYexsu7MWfnjss56iJTFyoz61sEVSAFb/KJZ3lolfVt7FdkZyp
         Dh4DOUU/K6PphYHaKWm+f1ynS5MyopomFg9MLkqEfUEwFKg8YzwkHBBU6DTevY4+QFJ1
         gGljiHxpAYrQjeNEzN7I9BTmtGU+0crQyBhLFf4Sh4S1yNwHiRHt4DRsd9AWMwsqwbw3
         KAFIzfvNWcG9htWWeIsDYkv94DHuAnrjDqos+ymHEHvi0g8hfikfmBh20r8tErzBjhIH
         QmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770670162; x=1771274962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hCLz2PQNAIUC4fdv7YAerV+Je1obVaIS6CQCQXjH/hk=;
        b=XngZv2QFXyEFXDDfS9pPlLwNFsHGT/fZtVbUrWNCEeFahKMGv6mb7amaIH5Pp2bpQA
         HHu2BiE49MecgZlcf+Hr5qo7aaSwZ7RnzInxi5b8Aa7o5fGHzC7h7MyjroS4qQ920O3m
         sCvcxde9ywteb4MVKJv+NwUIvumy0iH1GC5LsB8lIjGBYBgO458b+NlbJYbF5gs/gAS7
         CvfbEsFKJENH8UFaQn6UOm+bZNJAmbXGOc9bmd7PfxhhQ/f4dK85oiPr5eHUlM2HGuBT
         qG7M300ZWmhcEj5wphg5uGbiFpkmicKVS+z5YBbA4C+X8Y0b8sV0AYstS5jMohk7yosx
         hDCQ==
X-Gm-Message-State: AOJu0Ywb/yQ8qRwd1E8BxVsB2N6SLuUvbYgVYVq49Zp0GNp4vIIpT7f7
	t0lwYwv83rUQNmU9f4IPbK7WX+Rn1FcE8AkvtCT7ptPdt+HRcyx2amCpBITpDCiPxA1+UALedSJ
	uAGaM/rVoqpPkXYbfXoYhMYKKEuGXFaOnf9/8Yr7lLzz1Kp1DSkZo87lsY0CuW/Dum7h/
X-Gm-Gg: AZuq6aKX3UNiLPQIO6pIrALpdxmsY1X2Uid/DXICTZh+sl6vhhKLpIoeKHWZsqzBudC
	jQ7p0bNF//DWfv34J3p9mGzWB4i11Mh+oYumI8cKzuEEbPWIHVEWanTzDUXga7BtLsQfMu97Saf
	jgZkh7gtP+CmN+JeWhp28VdiZJHIDL584LhzzT4qSU0sFbu82LZSbjsF9FRGZJ1/bStBrnvAJVj
	1OiL0MiG3L5FuIDkO6QSK5uZpGGsSdinc1goaQMQfRWmMmbkMTJSfS+JZ/VnRYI56j6hKJT0AYO
	mjEME7W7fGKxhPalsdRPoKEZT/8xKJA5KJROUMr46iQ8xcQshFr6gqEyqzTvgWyDMBiTM4G7u1N
	MhUh4i4ltzEG0rZpM3ONOyGYFWcWWJjzpIaz0M1/QDu+7Y6ULAu5HjxlnqHq+R9to6T9CMwjI
X-Received: by 2002:a05:7301:6783:b0:2ba:871f:796d with SMTP id 5a478bee46e88-2ba871f8c45mr337457eec.30.1770670161664;
        Mon, 09 Feb 2026 12:49:21 -0800 (PST)
X-Received: by 2002:a05:7301:6783:b0:2ba:871f:796d with SMTP id 5a478bee46e88-2ba871f8c45mr337432eec.30.1770670161076;
        Mon, 09 Feb 2026 12:49:21 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba89ae14c9sm106247eec.29.2026.02.09.12.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:49:20 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v5 3/5] soc: qcom: pmic_glink: Add support for Glymur and Kaanapali
Date: Mon,  9 Feb 2026 12:49:13 -0800
Message-Id: <20260209204915.1983997-4-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wn3bhmQtHil3eff0XrnYSFotRZ-DH5ip
X-Proofpoint-ORIG-GUID: wn3bhmQtHil3eff0XrnYSFotRZ-DH5ip
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=698a4853 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=eoX2Nymsb10xMOwzDcsA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3NSBTYWx0ZWRfXzUknNC6KTp6y
 XMHLMkrkPukNe22b47KTXwDJahfKMe+wyzrN++sSiVT2kO2O2ezSRigrWzY8krTJj+usiRXVksD
 cRQlD6eRcc/lkeRS79jygFI7BVj8PoTO5EwSBuNqpaTVdJ7IYi1t1bE5CNh41x9wEZbxjA1Axyt
 TwTkHbkKcTuxpYZ1McTH1LaKTcMvPMdfB10L0MWi9DOyHRYfD602aT4HuCmUmsqnsnbZPs55FAi
 hSRYW9Et9hZVezWmeDIk9g06SXFHEuc9t2C/6XvV6JUAaE+KUl1MVE+ou6n853XB+rLI6/S8fFi
 EdpM4vVsPK4TPs22iORzLceW0SwmsLHKY+YSiy6V6n02IA/b6EZZ6eG7S6jn3ZCn28ZZQJJJWaI
 WL5DW4IJ1t+T0oNaNo+4oCCUCcZjcYZ2isMJN61y+vG6ymonwvH2ktIi1nH/kzbZHg4RvfqOaOC
 oYTSC4LGA20wZu2hUxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[anjelique.melendez@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92359-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EA2C11491A
X-Rspamd-Action: no action

On Glymur, a compute platform, and Kaanapali, a mobile platform, charger
FW runs on SOCCP (another subsystem). SOCCP does not have any specific
charger PDs defined. So, add support for Glymur and Kaanapali compatible
strings.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index df2fd03d3b33..3042261578aa 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -397,7 +397,15 @@ static const struct pmic_glink_data pmic_glink_adsp_data = {
 	.charger_pdr_service_path = "msm/adsp/charger_pd",
 };
 
+static const struct pmic_glink_data pmic_glink_soccp_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI),
+};
+
 static const struct of_device_id pmic_glink_of_match[] = {
+	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
+	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },
 	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
 	{}
 };
-- 
2.34.1


