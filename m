Return-Path: <linux-arm-msm+bounces-74558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AFCB9830D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 06:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E3E84C06F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 04:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3201B23875D;
	Wed, 24 Sep 2025 04:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/aN7J+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EF722DF9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758687536; cv=none; b=Q5A92sKUKzPV36TTfmup5xzhKaessvM84sal0Z9OVTVBaYIz4MiPcExLE2VcTt8xksxS4OHPED1rFS6lDQSowOP8EjdRH3Sa5oI+5im9FVuoVZkytSHsi2VHx2UjC6/J2rC/0MVJxyqBUO/bGd9kFUBOG1fx4c3z0gmGZgtSEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758687536; c=relaxed/simple;
	bh=y3kDiWminIlh4cAMLwWiVIQUVLbdzIjh8+MBDi4VRcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGIuGVyW/iblejO5B8VpVhgA4S7rI7dgUiyL/4WiyzCROEeRuF0MITAhGp6crTuGu8Caj4mQbAmrJfCy+kbT9i77HMlongJSK275MLZ1AvoUYNEOBq9LasEadlSNw+ac+bHjpVqDqxS6V+itpR1raEqMLnlw8Lk4LlMCg5774P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/aN7J+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O2xgLa003017
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MzWxFE6SmNE6Sd0JJ62qs2K1+TijFUt9wCgiHhJ3do=; b=a/aN7J+s1FOfcBmp
	wS1htj8rZ/VJANYqKj7em0XEUvDVo+H/2JDakZOZiqDEreYdjjCIpBe/mxkVXN8H
	iw0AkR1Byn4xSp7UcEL4LLaqBHkt1Gh+o5lKNpy1puzjMsPn2iUxJYVwljOZrMy6
	V3uUpK9r88tTadzm2owewPU73Jb4RlJXfRpKJBfryd1S1DIguEwNodfC36webv8L
	B/wMXVGraBCTrM4yI8Q6aJwUHNdqbR0vep2ni43mAn6OtBIArUiJI777wML4x3SA
	pOphqqjywS/2mykTJY4O0Vb0ZzEd2e6OPeHQ+/oXAxmiqGRQR0aiDoRQdVw9iuvW
	5NFdNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv12yc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:18:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269af520712so70586955ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 21:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758687532; x=1759292332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MzWxFE6SmNE6Sd0JJ62qs2K1+TijFUt9wCgiHhJ3do=;
        b=VWMoBjMPO9wPp2NvTtyFeqUO6DUGnOCBbVjIfKKgifi+PW/YEtqcRxNsQGZnKhgBoA
         2SHlPVsMtvO/vNRjfN5xYDiV+eS/mS8SWaJPXo1LoIXhfGZsTViq8vShTAJiYIOltXmb
         n6UI+u8DGB1769Pr1I4xb9Is8sAHJ/WnN30o50ysnZX3yykSGbbkyksdIORBFbqse7ot
         q5FBenKdHmhXj3WLvxLTg8wp18kE6A2uux3wAGXhu/CqY8Xf0v8jJ8OVCCWeh/c+bEiI
         ubuHKfJnjsMh+Y7qNONVbAZ0jNmObqH91KKrHyAIb10AdAJrdoEQKY/1y2eikGrIi5uS
         B2uQ==
X-Gm-Message-State: AOJu0Yyve7d8jT9+QqXKv3we8suOCtzIxxKjwoeTA1S2uCmwuVh4TlIa
	UQLTQ19POP9X+fhSxQzqRYFd3ts3bu2j9osk7fCgGvrzU+ILpeHYSFiP/nXpSJaBfd+Fb2kBu80
	YaLw8FE59SpWz2MpVZ7Z/WJf5lkqtRU4Hh36yYuCtux7dvaBrqlrnLZzXZ7dGJ617ReiB
X-Gm-Gg: ASbGncsdEQpyJ2ekz3IZ7VI/wreRx1dDZeo78l2Xry3Z8FHWgIzR6tnjvuUtIVV/P++
	WGt8sMKm+1D8nMYTnTHFRY3Lw07Tpho2ZCzBxcaSx0pZgeC6oM+/GFbaaPnZRJzeD5rjkvaJMnb
	+lKXLXqba1e+7TVdJG7gLvRLG+9TEJ/Rqsn2EuICO/ddfByK31f1HjvRJKBOjaTWygOXXWjQKej
	A7eUqot3NWGth32BrvP+V18eCscu+Xlut+GwJnk6ChtgsUGKJmSFAu4SpHukGdlhUWNzg9nZz21
	IrtGSdK1SzYCQ3SFK5SwUau6/TjmD81kMxKtW5pMC/wIO3vQxoAp8KMq6JKFOiNpysthQnssJZq
	tpwAVO9vM3maaHIY=
X-Received: by 2002:a17:903:2c0b:b0:269:8edf:67f1 with SMTP id d9443c01a7336-27cc13808bbmr60166415ad.6.1758687531873;
        Tue, 23 Sep 2025 21:18:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7r66V5B2kT2HM7RA4fkMlGVLXRBRzSC0bio+S3HcT4gSSi9reHGYc6Y5F2yK+Vb6ftbA61A==
X-Received: by 2002:a17:903:2c0b:b0:269:8edf:67f1 with SMTP id d9443c01a7336-27cc13808bbmr60166235ad.6.1758687531388;
        Tue, 23 Sep 2025 21:18:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2699363989fsm170133885ad.92.2025.09.23.21.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 21:18:51 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 21:18:43 -0700
Subject: [PATCH 2/2] soc: qcom: smp2p: Add support for smp2p v2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
In-Reply-To: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758687528; l=3194;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Iv1mr0CsUVNvjD6gvfRUYbwxcg/epGGs6ZABQD1hV/k=;
 b=EU8eBSCHicFs67DlRHihnPl91dsbq99bdcVFpgiWeT1t22XtBq4SuigAYW3TRa2TFRM8Joc6P
 QvWns9Zje6PAdutnp3VcwsS1dUbDqhRnXh/fBhA3sPsH7lJGQfUVy2m
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 7o73pCdS8koQJUbndAQQiwmxw0jmaOaj
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d3712d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xvny5BtixxlE2jsoVxoA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX6d488e7BgzMT
 ISz9y5AnuIW2taJVUpAkMR6cgoaQRM+dzbB/61R1+Kum0RO1cYACODYGPEV0LSLBGpr5DDBOcHq
 pUnkaTJ0zZuco25ahyh8MHkEBLzoP8tCF+vm2j124eWMWaWdnsp9Ru5qmmarm8L1YbvhxQj5MMQ
 uPE6TZyc3Yq0hT01JtQgk7vIDw6kuK/v+D2aaEvzUoj0qsCcQX6Cwl7kdXGHQbpBupXWmB3Rnp2
 bxQ29g4te84Bf8c1wYwZWhsBsPwSG8Z+a3MhSXqawixxQx5L7crj7ySNIJH8s4FBkQUuTpZT45w
 tqK5IlUAZEvfuX53wiaO6dhIz7l0iYCK+cgIviiaq5elmtb+1eRb/iRYZjyKdrPosUU0cZO3E97
 j+Pkm/fM
X-Proofpoint-ORIG-GUID: 7o73pCdS8koQJUbndAQQiwmxw0jmaOaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

From: Chris Lew <chris.lew@oss.qualcomm.com>

Some remoteproc need smp2p v2 support, mirror the version written by the
remote if the remote supports v2. This is needed if the remote does not
have backwards compatibility with v1. And reset entry last value on SSR for
smp2p v2.

Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index e2cfd9ec8875..5ea64a83c678 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -48,10 +48,13 @@
 #define SMP2P_MAGIC 0x504d5324
 #define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
 
+#define SMP2P_VERSION_1 1
+#define SMP2P_VERSION_2 2
+
 /**
  * struct smp2p_smem_item - in memory communication structure
  * @magic:		magic number
- * @version:		version - must be 1
+ * @version:		version
  * @features:		features flag - currently unused
  * @local_pid:		processor id of sending end
  * @remote_pid:		processor id of receiving end
@@ -180,14 +183,23 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
 {
 	struct smp2p_smem_item *in = smp2p->in;
+	struct smp2p_entry *entry;
 	bool restart;
 
 	if (!smp2p->ssr_ack_enabled)
 		return false;
 
 	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
+	restart = restart != smp2p->ssr_ack;
+	if (restart && in->version > SMP2P_VERSION_1) {
+		list_for_each_entry(entry, &smp2p->inbound, node) {
+			if (!entry->value)
+				continue;
+			entry->last_value = 0;
+		}
+	}
 
-	return restart != smp2p->ssr_ack;
+	return restart;
 }
 
 static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
@@ -222,6 +234,20 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
 	}
 }
 
+static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
+{
+	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
+	unsigned int pid = smp2p->remote_pid;
+	struct smp2p_smem_item *in;
+	size_t size;
+
+	in = qcom_smem_get(pid, smem_id, &size);
+	if (IS_ERR(in))
+		return 0;
+
+	return in->version;
+}
+
 static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 {
 	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
@@ -516,6 +542,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	struct smp2p_smem_item *out;
 	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
 	unsigned pid = smp2p->remote_pid;
+	u8 in_version;
 	int ret;
 
 	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
@@ -537,12 +564,14 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	out->valid_entries = 0;
 	out->features = SMP2P_ALL_FEATURES;
 
+	in_version = qcom_smp2p_in_version(smp2p);
+
 	/*
 	 * Make sure the rest of the header is written before we validate the
 	 * item by writing a valid version number.
 	 */
 	wmb();
-	out->version = 1;
+	out->version = (in_version) ? in_version : 1;
 
 	qcom_smp2p_kick(smp2p);
 

-- 
2.25.1


