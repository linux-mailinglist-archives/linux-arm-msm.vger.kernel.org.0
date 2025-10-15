Return-Path: <linux-arm-msm+bounces-77436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6ABDF6C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 17:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64329484B61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EBA304BDD;
	Wed, 15 Oct 2025 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ToeZi931"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58092D24AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542641; cv=none; b=t3cuzo9RldIIZTCngzjmmGJjNWCpAbAG8ByQz+cZ+KjlhYS0E5TQAhol10j5f+bD2KVjN0fJnA+JgR5MA439E5PcX2HUQLkykNarf43UTe1wWkJEWIDSKAIWAxuuKkssiFQ9sW0bheDGLoSLytCSPrJkuAXiu4Yk1DL/ZD6Z220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542641; c=relaxed/simple;
	bh=SSZ2jcApCBEZvjRLBC68V/LuWwTDkUZ0dNuP/z9R17w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WGuXoB4cttGIT20xb6MyGYtJkbsyQ3uigBPzRceKI3vVAGF9qCEAIMa2xirZxjTQBMmNBxQfXCo73M51DfM3Rs979/M/i6ULrN19T3HkO8+89wt88/vuKbfg/rGFniTyr21KsmobVSp2FGg2MAF84KINNBal/HFg98IjZe1Alog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ToeZi931; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBBZwL015803
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dZN1GMyJRm0hjQlF7gTjdyCVMbef56grA5g
	HCJDrtSs=; b=ToeZi931PSiK/IoAyhyzk6BaUaU35be1+sefPADmLNX8JWNW8Gd
	gJIqVvy9LMQXLGWSozn2CQ7Z9czesQq7d3wTrMd+BiMJsCAnbG0Rkzmk+Kdb4D7U
	wqzIvleOEyJoDGZWu1sceMeAMSppIqZswPfPUwTQnNlsu8hHoLM2ay4xYOAika1G
	fKHN74zs+RE77KZjcfmY1SuRL1NOuLccRMf6QRFqYziAMuEB2TIK7K4vaJw8T7k8
	GKsvGusC62wLU8Sh3hFdJRxcvYN9x91+TXsjbEuyd1vA/o55ZbfGGRSj74oXv98/
	KSPWeBcFyc0N6jjFf+de0Wm4xjCcHzt3Hmg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5n2hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:37:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-803339f345bso426334656d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760542637; x=1761147437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZN1GMyJRm0hjQlF7gTjdyCVMbef56grA5gHCJDrtSs=;
        b=PtgiLfT46r7ET+/etIUtisQJV6NNGZHhwLaKFqSbM5Q2NwV/XF2EvkKBsc/DHOapuk
         gZS9R/QueOrVZgs4kpbEppoc5CuD6/0ecFn+96BmvHPjAv6VFZ5esWVCSVpXJXIRJpsH
         9j2ff/LwoG+NHQ9Y69xGoPa5Mvx0BKcFGnXe2aHEfuRaWcj78xkvWwrkKFsDzL2pVAvy
         KSelRbFUYZJVB9Q90PT2yoJnNvYPyLpPE3bXVgak79MxaPX5o5jxY7iwBUjMPsTVM6hU
         Sv+Et0oR+DIIRb6G9yOqPiteEgnv/9gnIJtrajdKPfv8sMh5mXQBvaFhOE7VHVSNtOVX
         00hg==
X-Forwarded-Encrypted: i=1; AJvYcCVDcDw961fNsP6pR2czI3F3ttedhHDAdNn9nEwh7abvCxwU4EZeNgkbn8oq90fp+W6edYH6ElMGxXjr9maE@vger.kernel.org
X-Gm-Message-State: AOJu0YxY5mm4/iBg2BOanEuicIGBQb4Lrl+N6s6cqoM34iQM8+NhyMzz
	6DGKrFkGROoErR0lKD7BfPCat2fvS2bHw7R+Qz9mRFUf3QiekdQ/agiinaiilpBgFdn9h+SdICW
	BL1SeV1U9U2aHbms8eqaNP+Af7cOe1jZ2M7kCitcwcxkaA5KPOqJaPsuC552JBo+tbKuF
X-Gm-Gg: ASbGnctnUh5kGIMxFI4HN0LFN66y8wX/uuDd2T5dwDQ5LzsjKv8GcZoGqYCgKWdGCE0
	iIeVNROzaC5/WBUviUFihS3/C2JwZqElcwLaAwtEUbpdr4SLASczPgNrjOmuylwL9q8MVdiTo4N
	lxMHpA8tOlAJMB58KgiqfHl6Y/e8gyAqy5g1bgGcUn5sJKMeXL3NdON3gYuoC5Am0kqWnI0Y4mc
	LdJaa6UVTpTRV9ZDuFJUzd6pB2KPiYsDAd25b2paXYTJEb6ANq2Afp4lp8tVF9ks813SXTBA8Wm
	0Imhs06SlJJZo3PAibXfZ2fJ2tx8OaaZbLYWFl3CBXms+nRY5dwRKqujaDg4uuOmMb/UdDuZnyQ
	aM1Z/
X-Received: by 2002:ac8:7e82:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-4e7221029c1mr189799491cf.13.1760542637492;
        Wed, 15 Oct 2025 08:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0IH0/ITMHy3s6jWGoCNn+SsmvbfoF3tGYx7cI41wDo+mWnIOTWBRCRq1frHt3u2Ipk+klxA==
X-Received: by 2002:ac8:7e82:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-4e7221029c1mr189799001cf.13.1760542636958;
        Wed, 15 Oct 2025 08:37:16 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb965c599sm253136166b.11.2025.10.15.08.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:37:16 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix mismatched types in min()
Date: Wed, 15 Oct 2025 17:37:15 +0200
Message-ID: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rAJ0YvzYgC1-2bvPTYzVcpNYw16UAaih
X-Proofpoint-ORIG-GUID: rAJ0YvzYgC1-2bvPTYzVcpNYw16UAaih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX8wKOHO0j/Fzj
 cztf1YRc7HSHyWlWANy4nx/HYvxITJBeT+jDiVn0RLbuJMqO5nyyo5oxmMEVPZegbfkFCz4Zt1J
 rHp3Cimqa5bIy7Jg+ofT0fCmxYXNqwd0AVKTxvo4tNJYACbO02m1NYRrYxVBzGwWV0iWbfjzfyx
 ZEc/QRx8xETJyUARMSNLg4vNnjpBD+r3V2snNXNIeEc0mM4LgzavdNZSl/OFhrYMUyv2ipKLhcw
 +8vPwu7Ra3yJ080EKJcx5DqfOm1P2Zq3DPoLwlG0wE8/kOMSCe+zhG2xZmEYQSP4kYADUSamJz0
 oGLQUGGS4S71MKitHstMVSbSlvpukKgEvL2BXhnLO0GLK36fem7v6aNGoc6pUMuW+C7r4kRDWRO
 BxmogYhZuNnPe3TL38ap1lj5m29NwQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68efbfae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=j6PT1K01a8H6cJ_D89IA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Use min_t() instead of min() to resolve compiler warnings for mismatched
types.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..ed24417d4c8a 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -615,7 +615,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 
 	/* Request the first chunk of the first image */
 	context->dump_image = &image_out_table[0];
-	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
+	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
 	/* Avoid requesting EOI sized data so that we can identify errors */
 	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
 		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
@@ -663,7 +663,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
 
 	/* Get next image chunk */
 	dump_length = context->dump_image->length - context->dump_image_offset;
-	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
+	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
 	/* Avoid requesting EOI sized data so that we can identify errors */
 	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
 		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
-- 
2.43.0


