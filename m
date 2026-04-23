Return-Path: <linux-arm-msm+bounces-104298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPg8BvkB6mk/rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:26:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 708DB45142C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFB79300EA98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489693E868E;
	Thu, 23 Apr 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo50KaAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fiKCVqe7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B9D340A76
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943557; cv=none; b=GGZE9RUfK9ZVZrGinDZkP2WOB1PGgiWJYDIxbA/9C6KNflXjEjR89vnHJnK99U4t+mZ7GEQb39uXPluejw0mFPQQjhRfeyLf31aKgK0/ZdbfvpkkI18bHs+s3vrRq6OG2BDthYBFaSZDP+lD+ih7LL0AF3WRMhGvVBpoCO+PtsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943557; c=relaxed/simple;
	bh=xZCd1FXgymz/1m4kwr2/ukyyk5I+OClTmLc3HdS90dM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VBbetji/ZXEAxDPSXO+20pKyiZRyAzKPAUdR1ao6ooWjkr1yUujPT4Ls0xkDnjR9PoBMPVNXgYD12FawJKrAAY3KVWs9nDdyyJQW9RO92T/stdZDEjh2MmM5h1UdboSv4TSy8RaXA2iFSqhOaQNMQfFcOlbpnkTqueyPIQzdevI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zo50KaAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fiKCVqe7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94gN02319297
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZW1GV43wgoIu+cALwA6H6p
	rnGNxU3jMyVw/NxcdxkKI=; b=Zo50KaAjveDogdskHfYCHQ8uZ5V4UPoymX1QyC
	Ut+9X6eXRuWdRcavpds9e23rS06fEsBnCATQNmfaKhEH/SqSZTCKbpb3zj1ApQ3n
	MtesX6CE/OOLtOQHhtfO/Zh8envmBX7xboiyHpZMeHSKiPNipknm+S9emcrnQ3QU
	Tk1EvAXIO6kovfKnvYYHlBjolhWXSic43KYucfJ7Z0DxmiTMM7cUpsXOPMQ32tf/
	BYX9yjiE9HtWnTJsns09+fxwVZx+KLBz1/3UKsJf+DiAa5aPCmWWGbj5QnIuzw7x
	hkVVcAOyqDBwXI80msSJ0AD1hCf5P5TGPkO2SbXFc8XnkHQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsrgt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:25:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so3964995a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943555; x=1777548355; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW1GV43wgoIu+cALwA6H6prnGNxU3jMyVw/NxcdxkKI=;
        b=fiKCVqe7c7U8WQ5CXM638P2hLMK1/+ZUddGg6/yjAvh0CGnDYQdjgqd6gRd7iu83Lw
         /gOQ2xpKUMSTZzFjkhvIZYU5oYuA8xhjn04Ea/jvM8+So9dKrfQeXWCa9ORqg5oJYqPs
         9eZpExb7S3G093aLhsL5gB66DSfIKBCaMxTzNLTLENSumoWQ0sfydwN3TA472krB9m1q
         8kwMo0QxO+yKUv2MRcewIFnDRyWqkqYus96P24SiwTxi5c56ItEfsPhNCpwc7JTV/RgI
         JK4Ar8cCF3k1txFpzEyIa2Pss7D3t8nUAVXpOoa7Q9wQdT0+vb8UphzB6CkIxx8qU5QV
         CjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943555; x=1777548355;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW1GV43wgoIu+cALwA6H6prnGNxU3jMyVw/NxcdxkKI=;
        b=SapKDAE80c6A4ttCK2UrHFv+XbEmHXOjJDOXSP4t5B9v7/BZJELszsN8xGIEm1z5pT
         ESD0i+cZfjKJFojXbvUp808lkSo3dpV9pZUDew3TsUJ49NujsgE8uCf9JjgchlbHtpwE
         HA1QAE4nL0jDUarBAVloru5G+U4JVW4P99U2FBnjx7PHK2vEnjVFFIGR/enhb5E21LUS
         cX1cZr22WMb+rDfVgrxrz9eRQXZbg7mOK/qHKEfzFYLm0inDELC7ZA/xQAdaf2ez/Br3
         HL6bP7NurNoUxY+Jc6CQwTTXxc1W7zf9FcQpzniDP3e8AzyRpec9WoGC0TsxpAg28X7y
         ROYQ==
X-Gm-Message-State: AOJu0YwTwMNtf/prLzUcTOraCoqbwP0K9AiTnbnwzfi9VOSkNjKpp7vP
	+eP7BW++iNnrsyS8BvQ3a8ydcbVea7BrANhZqhSoR9Cmj35Sb2jSAoaxpFes0zZdAwfpxyYCfUH
	thPH3F+7d1vOGeYXvJKelFz4Jso/LkM55L4QYwoNKKMwdokm9WTRmvDk1NRtFNfrqU7SJ
X-Gm-Gg: AeBDieskfIf0pG0S2kNC8jpryLAZ6NnhTfcs2RKfcWmAldahdMwNZrt1tEseV4BruPI
	feUe97oeaYJeKW0xZuEQ/3N2A5l92jCtHTtNiiYmqiRFHPCvZcyiexbGP5SzSTs+jX8ap8Rhati
	eJC7ivX/Pn1rMtkji0nenWPlT1GXfRabm5b99CQE7NgfqbbvijkZS6HbHq1L5Cegmhqcx2MDg0H
	nM2HP3PsP+aTMxaLELdbRWx7hrOX6jQWkqVoEqg7zUpo6SfGU5mxsgcV3CUecXNCL8JEf2lZrEl
	PU4+qMyW5GQJxve0R9ZjiE07UCfD38WwNd3/Hs8U//MFmyiOBra8U9il8XFwD/lvYZgWZVHPfNj
	eUJzVxpiYSG3d82OJTl5ckqVivJttNzfSMCvFB+cpfQB7MNzSc+AhmZQ8NP0+x6bs59oY
X-Received: by 2002:a05:6a00:984:b0:82f:6cd5:1ead with SMTP id d2e1a72fcca58-82f8c86b573mr26688301b3a.16.1776943554591;
        Thu, 23 Apr 2026 04:25:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:984:b0:82f:6cd5:1ead with SMTP id d2e1a72fcca58-82f8c86b573mr26688274b3a.16.1776943554124;
        Thu, 23 Apr 2026 04:25:54 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm21654828b3a.43.2026.04.23.04.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:25:53 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 16:55:24 +0530
Subject: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKMB6mkC/yXMTQ5AMBBA4avIrDXRFhVXERFqMBZ+OohE3F2x/
 BbvXcDoCBny4AKHBzHNk4cMA7BDPfUoqPUGFak0ipUWq+VUJlW/0Cy00SZpdNcamYEvFocdnd+
 tKH/z3oxot3cB9/0AwUsmkW8AAAA=
X-Change-ID: 20260423-qcs615_gpio-37375b3fd718
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776943551; l=2005;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=KajjicfIK/69OgXBDuFEFnwS3htKUPxgtlLfS1i2wtY=;
 b=cGjhYj4VcFWFcRRhvu49IDvDvAfSoXeIN7CkkY+y9fKclZ7M4eUjOBW0QkJPIV9WJhh98lxcD
 ImlaMDINz5EDEtecGzDr8aCOSiq5LvP0MAX3/CRKM1Iu0SKTrH2LEVC
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-ORIG-GUID: DBCMqdK8hZq0FdEz5dRbhjEsMnjcdxzB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMyBTYWx0ZWRfXyBdy2Ckuslr/
 6RaKOkOXK9fxVZHye7QWg5C4qpuTXlHxApKH6BI0PWMxhBpt60ccaqzVqw4CnqGk270FJqDgCYy
 xvA5ThAoUmO4rWs05xnnOQMcCnGnS9wYHQgJWObkI0XLgORn3O7v93hbYvDkCsL96C9SVt6JOrj
 NU7yP98XbfChovBBRXXZC4DHj0CSk61V0qrJY2KVMQ6IRNL7N9tXRuBNC//v/DgkY8a3efGt0SN
 fcBrtLroXtGln6zqxTJ++v3RMeEciJUNcaYqe5A0H4tnM+WsmFIzwTiF7F7lgJDo2R3Jjy97xTa
 fr7a2ou75deRziAxd3HGGBdXKHn3U4yOttIsiVBGZAQhlSEFq7ckjU1teo0p15LAlWGd4dKNnZ2
 LJiDpyXU0aCX8E8dEk5ngm7CHadQjbs2rXVF8Y2V4jOjfLflWWNiHxKA4XehKd0Kedg+XghLPZU
 4e35fl+CWMSGh2rUPBQ==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea01c3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=E-L-OSUPP1xf1vR-tOgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: DBCMqdK8hZq0FdEz5dRbhjEsMnjcdxzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230113
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104298-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 708DB45142C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not
support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
pin to support non-ibi wakeup. Update the wakeirq map to reflect same.

Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 0ed4332d989e..f066b3a576f7 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1040,11 +1040,11 @@ static const struct msm_pingroup qcs615_groups[] = {
 static const struct msm_gpio_wakeirq_map qcs615_pdc_map[] = {
 	{ 1, 45 },    { 3, 31 },    { 7, 55 },    { 9, 110 },   { 11, 34 },
 	{ 13, 33 },   { 14, 35 },   { 17, 46 },   { 19, 48 },   { 21, 83 },
-	{ 22, 36 },   { 26, 38 },   { 35, 37 },   { 39, 125 },  { 41, 47 },
-	{ 47, 49 },   { 48, 51 },   { 50, 52 },   { 51, 123 },  { 55, 56 },
+	{ 22, 36 },   { 26, 38 },   { 35, 37 },   { 39, 118 },  { 41, 47 },
+	{ 47, 49 },   { 48, 51 },   { 50, 52 },   { 51, 116 },  { 55, 56 },
 	{ 56, 57 },   { 57, 58 },   { 60, 60 },   { 71, 54 },   { 80, 73 },
 	{ 81, 64 },   { 82, 50 },   { 83, 65 },   { 84, 92 },   { 85, 99 },
-	{ 86, 67 },   { 87, 84 },   { 88, 124 },  { 89, 122 },  { 90, 69 },
+	{ 86, 67 },   { 87, 84 },   { 88, 117 },  { 89, 115 },  { 90, 69 },
 	{ 92, 88 },   { 93, 75 },   { 94, 91 },   { 95, 72 },   { 96, 82 },
 	{ 97, 74 },   { 98, 95 },   { 99, 94 },   { 100, 100 }, { 101, 40 },
 	{ 102, 93 },  { 103, 77 },  { 104, 78 },  { 105, 96 },  { 107, 97 },

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260423-qcs615_gpio-37375b3fd718

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>


