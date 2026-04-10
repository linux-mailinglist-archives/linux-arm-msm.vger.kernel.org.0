Return-Path: <linux-arm-msm+bounces-102736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPmkL7RG2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:51:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 259763DBA3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 409E430E7366
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEC33E5595;
	Fri, 10 Apr 2026 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AyC3zA4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUr7wdh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2936B3E7161
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846613; cv=none; b=n12jqd+S4CpsjFra2D/s2CTrgtzU0Qkpp2vCTIbJoWn7kLlUh1fTXgfbJc7LREAWMl7tJS4FGMCG3sX11qf70hG8rt0qIezl2bAy5vB0WQ95k530POeMx3IMWYCM5F3hP7obXs0t6OPSdMiE+YLu7ao7ihwBvjY4vy0Y8XW3wW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846613; c=relaxed/simple;
	bh=ts9I/8MVqENlSCKMkTEH3idBu1lg0eza6U8uB5QrNi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eb1rKG7Kmzes4AvGxytlv5aArQ5P+Pf3QFdT4YBBMiSQkylvGKs53/YOvpv0BpkZlagT3ebWGx1Qn9Ol+nkbCh4NMW4gxe1P+Eb6ZHMfiR/w+l8Q2SjF5vjo1AXWlCr4A+uUwdQ9lgyHrQMqN81o22t0oPcKzADv7nxBNHJWFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AyC3zA4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUr7wdh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIApwO1925388
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QSLeY19NlNB
	khtzYWsedf0JYDV9RDV4tBF9rhYpoxJU=; b=AyC3zA4tzTTnPXsQIy60YI/OkkF
	iBAbmTxBDOonVR5GYOJkVC0/SteCPfCpXHmS5buVfXVUWknsG8dMhGpYQ7j1HpEr
	J0M354eKrnNaUiVNZSuOku0QoERQCG7Z9JnDLtmS6YslUdyeeybWHHQlWpt9ptIN
	mP3HCoR8AHpCNJmd0so6izTBWUMWu2ggoBTayyAdaXTMPknZZ2Fqg2jGPHMBJylK
	nh4FfB6y7tK5gsQPvhxaAelhzAtG9AvQTUJ8HHSz1OWhsLLnNUAIu23akF+D679a
	3BMux7GYzmyzlgBilITIpXPc9XZnLP9J11slDNwfl+BVwcPqBgyqDXXkBuw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjthbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso3287427b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846611; x=1776451411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSLeY19NlNBkhtzYWsedf0JYDV9RDV4tBF9rhYpoxJU=;
        b=KUr7wdh2MxOqRzLGCXtSLdfZvpx+5Ei2sVcti8ovOqtwPD6OKh+mLqjNuhG9Ehl0Nb
         BI5AvB4J5x1AzhcoYaMcBQTR9genV760AyQ2iWwORmaSoUd+rlInoX5W4zOkr08TgdOD
         4vtJZRrVykPWKsZUMjYC8fekks/uk9Veifl2b+gk1WZWcmmy9SmPs5asc8qQvvIDqabP
         mTOgF4f7vKZpWgk+aVVqUtLTIAyS2NxABiB5n4+nYODwVbeMdo01MDDloWwM2MHorMQH
         hND8FWqLtn7hO3JvnW41n2Y9zSP6yNQipeg+4AGs7VoSex/NcV9jtw5qaH+nxL8MtWTY
         BLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846611; x=1776451411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QSLeY19NlNBkhtzYWsedf0JYDV9RDV4tBF9rhYpoxJU=;
        b=SzkYYM3juaZegZgBrZFS2cL0geoo2QwCR4hR64YI9gQa7+Fi5+d2tVZ81kp9FJ/3cP
         Lea9AW5eegeM7nXRBALEiNLQm2yTLwhIWGQCvQytztHHFo9sPcPJbueVjhHIn8WkKEZz
         zMhl4ywTfOsHec+wYB9vK5bIXYBEKU4DQ9FfeACrPE3WpSV+4tGFAJLQ2TXXOsQrnKH8
         G6GkJt7MhLQXvMWjfG+5joi6vj/jPAgMY7hz40MlOC6HrqlyfF362WJoUnU6hpRGydqo
         JDlHm8gtfK9k+3Xsqs+seKE3NAFowNypp4WGxbcma2SXQBSVBHDusPB3XxzaJOdejUIv
         8QQg==
X-Forwarded-Encrypted: i=1; AJvYcCUkq2ESA0CueC0SsyUEN6iKxE5Gf0lw3WdhVr9B7vCSJmJAfvN2/bBV5T6WzwQkM/tlBkzA/TB4q/bnwy2B@vger.kernel.org
X-Gm-Message-State: AOJu0YxOo6gObvXlon1Jm1dCWGQc2SLejKpcUbifDu+JAo4baNyQ7Qh5
	IFfSDJ+kGKVDUkrvGaHXrei5RLjMH7uBzqGcFMGoYsHVljYgyrwjCYQtKZrYiAd/GH2WVSOxQ7G
	W6/cAkF0r/jewdrGRCa6PaYaTCFdoiSU6xIZHf7G25XzXEgyiqACr8IAo8XrWvwQttKcn
X-Gm-Gg: AeBDietWttZoIjbEKIcawYN6qQCfvgTSKZLUpqqe+M95MngScbt72UchlOfib4QfKU/
	JZjMRFj0PuKqhOzp+JIoFZ6oPCOUqtmm91wLKjvD9ImXZzVAEQwJphoLjqH+T1CG4DkA5Z8R+ER
	EBzToMWEud9tmEh1CTCADwypZzLPZLli0505oiaIGk5OxUfDjXYjmIKm8XB9uT3cTot6N6H96as
	j7rFY5iX3KYRk2OixpRjtr+W5hlx6GyGQd6PlukWywuJ4IwMtII0MgTb9r24YAQg+3zJpCxanfM
	NQF5g4uUwBKCPzwhiHHvBvlQpD/0/eKmZChfkzKd5B7PPACaV+0tJjuKH71L5BvMYIO18UlLUS3
	8G3IIMTYkWrKM7ZrhfYkqt7dEqKJMG68rWiykLLLpLX9yTl5o
X-Received: by 2002:a05:6a00:8c13:b0:82f:5bc:59f8 with SMTP id d2e1a72fcca58-82f0c39e9a9mr5381257b3a.52.1775846610589;
        Fri, 10 Apr 2026 11:43:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c13:b0:82f:5bc:59f8 with SMTP id d2e1a72fcca58-82f0c39e9a9mr5381212b3a.52.1775846609910;
        Fri, 10 Apr 2026 11:43:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 22/35] arm64: dts: qcom: sar2130p: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:59 +0530
Message-ID: <20260410184124.1068210-23-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d944d3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TA-_PxTPx9a9ESl0nAgA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: zcC6fdsp1V_NvpIfHd8uGrKeWTLoZjjz
X-Proofpoint-ORIG-GUID: zcC6fdsp1V_NvpIfHd8uGrKeWTLoZjjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXzSc635vc/8Ml
 f3GOE4r0EXx/P/YprNB5md/C31pasKOiNTPo64q5Q+speKcqz7u6QzgX79KEOrmQUDRca5yCslj
 rGc/LoMpv+xIJCqGsY3ErWDDAby4kDtcNCtTUvOyaEwUUOakbmdYi+A1Yw6ezhPT9Ys2hAmmdN4
 5YouhtQwvp9cSBPezMgnNTg6NFe6LFt3bbh//MtyAiy0nW00rbJ3oGNnaTKTsEnK/w35NXFRGHh
 nDeUZc6Mb6FYV51ou0D1nTbXuiSNIrGrweHDBNJ77UHxgXJhCJ45KvWeTJG2HBDUZoAWYt5yeOX
 KvJ6tNigITNt2amnunQNt57TdSF6E1B6PHawhPbmwLpZ7VZYYmLr3GDxzb9N05vTf5wshKzBd5l
 eLucGBbWW4hzhdCrrDwFTDhdrGDumo4N+yfG6bctGyOckYknQ6OFExOLqBTwybDg6hKefq28h5D
 EKCmP7d06/fyNHXdZQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102736-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 259763DBA3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df6865..c4d48f657e5d 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2417,7 +2417,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sar2130p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>,
 					  <94 609 31>,
 					  <125 63 1>,
-- 
2.53.0


