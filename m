Return-Path: <linux-arm-msm+bounces-105668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGqxCf1V+GnRtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:17:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050E4BA0CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABA0D300139C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA6631B130;
	Mon,  4 May 2026 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QmMplkKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqNDceeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4583331F991
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882615; cv=none; b=jjGb9ebQmIc4VLEvwndLAuQ2Jvwh/JMJl4FfsF318L1cppAQ97keBSBeXOsq7HqSh0U1CANYLOgVMGpmdsIKM6l1N3NaKDVUDroC55/NTtBjmTLTqKb/FfVp4zPnyVAABjzZl1WCtxbm6RLcUeWohje+Zs+WWvGy//Xy4ZpDVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882615; c=relaxed/simple;
	bh=ssvc98NVfA7fDPfYwtO2liPTnGF+kbxWY6x/lSmWa7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K20X7+iNn04eFppKYsEEDE7y0RUM+JphJZSAr1SA8qG1Janf4lUarPSlyiXowO4XQTTo7h3J/JrkUoAYuj6g1OzAkfvdJfu5cqAzhphnHBRaDVDHHZfjN+BKpoB7q6+Z+x3IbRrAHh/torsQdTEHOb5chSMma5X/I+noKetNaxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QmMplkKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqNDceeA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446E1gl877472
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A/UsH+hKXoFiCKwvQNzcoN2pkWyXuUQc2Ws
	08NJ1FOg=; b=QmMplkKE/KvWeOv0Cv4N8V38+aRATqORx+jJn7EJkZmi/43/vkD
	ih6BUe4xIIIJw8GmH6a6ObLfx66O3PP3AhVmLQadvorucuJYJBEKzjc6rfKN4J/o
	Yl5TjDGtbn4PkNcjNBm9/VcQIeTXr1DpxbiJW12bo/X2GOOtTRPZwOi9NQBA6grJ
	OVdMGxQqRMZrQOI29P4fXmsb6daYBti1PtOWFxfW1L4SikjcAB/sAS9/ackwm8YN
	M0xr1T/DOSkLwoHEjJ21oCH0azX0DnD7D1mDP89OXtxvKHDgoNJhCgZe3tz6b/vT
	u45UWIhNuLE34RLQoQQlXX9s5UxF6L0m2VQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1emtg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:16:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so6491042eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882613; x=1778487413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/UsH+hKXoFiCKwvQNzcoN2pkWyXuUQc2Ws08NJ1FOg=;
        b=BqNDceeALkAR98pdP9dnsP3RvpbmrU0r5WlMQlojcVHNcgsWdS0HiatK8S1oQNbZog
         5Y8VwTgWJJe+WT/BCryZ7Eg4IOPDkZVgTfMGUgRSmATXP8+mGOfukaZxF2Rqui8IO9Ec
         MDNm5JPIX9/kZhCkQfWF6vapsa7/ddxkX9ON2ciZzWSXrK+qLlP7i7LbLe7RvDpzSU60
         t/tz+Wva6V/R74LcoI40cRFLzPf1FZcrkXlRl7tiFLdztxumCebw0SJwSca54XYNqPc0
         lSdu2lYWg1KYQBcWVKtWkOe91gejO8kXooy/IdJdWG7ZROZIHSxkNTLRVknV8vpnaSw+
         9qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882613; x=1778487413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/UsH+hKXoFiCKwvQNzcoN2pkWyXuUQc2Ws08NJ1FOg=;
        b=oD6Nt3MAt4kj9aYIrm8u487pmavHnXKwVYdlsvds0mFi0ffAllAeB1JuzVggg7JbTf
         oUAgsEKYTBvdIri52OAwbfZYqw08N5bt7O4/mpMVGNWNpCODem6rncm1w3FhZNvhMCJO
         X3owyA0WRWXHj9mx7CampyUyMnm0tEiDgokGZppRCN7RB27AuSu77nBO0KI1kQXk0DJV
         ejy4o09za8dtqry0mkxTe7OOV7xFqWTUekhfJiI8qAOL9p3d7dSf1EFEZYlz5IYqv/hn
         eHU2xEwjq40NFridgJD29y4+1BCRi9HHP4mWlKxXpFgR0pDEqFgbLCELcT/KRh11cwa2
         sQeg==
X-Forwarded-Encrypted: i=1; AFNElJ9vG+ADdSSGO+9gljDdpmxM4M3Q4KHSjMRRoA2YDkzbwXiyHS7tAS6f7ms3D3+E/hDZFdfDkeJXBoN1pN5g@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvZ7wSzSvOUl2DIMlnu8J74PYCV8xlGedUOkz5YW1dygTB+Ki
	ep98oS0RtFgNJ6N0x2cbvjzJOr6UGdDXSWpJAXSwARUmItQetY2Bc6CdS26WCS9WUWEvIkofwpC
	K5uuOUDlB8OzOcCGCRmhg0AasBgDhs4sk4ImpWSDyGxWrNLYcZquLHiViAeImAks8TqVu
X-Gm-Gg: AeBDietXyp9J2rbNyvAkodv6z458lotseDCu/GySuUGhTTvb+bwomsPaLNZWS4Ih4bG
	EH5xR3Pig5j/yoI8/lBqLi4nk3CXWhK9vIvRkHaInROl9hZBjJV2m6GMzXDaifRU9nhTsy62ADl
	eSYGN3C8jje6RadOTF9rGJeU4dhi/DGzb0WspxA1hH+pc02MlRtYbmgJfbvFq3Ly/5qMUskoDmU
	nT7ZjfOM9WLUDElapNWh2UXttMzszBRvlBHk+/4+qAp9/grj6GmGM98tYDbfzTae378aqSE2iwD
	lTyYzoNGakOvvXP4S5roClubKnrAJq3eN8j+adIVd35Dp8abBZeo6WVuqHNBruqn1ozvA8/KTks
	dNz8k9aF18twwEzkqImaC0NF9JcLrCwGwH/EFFh9S8hejC9N+QngJA/mSaC/f6iFRzYLenlrojE
	FBndywkZIQ1N9nosM+
X-Received: by 2002:a05:7300:6d21:b0:2da:1874:f39c with SMTP id 5a478bee46e88-2efb85af63dmr3929812eec.12.1777882612916;
        Mon, 04 May 2026 01:16:52 -0700 (PDT)
X-Received: by 2002:a05:7300:6d21:b0:2da:1874:f39c with SMTP id 5a478bee46e88-2efb85af63dmr3929791eec.12.1777882612420;
        Mon, 04 May 2026 01:16:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f15cad1729sm5438517eec.6.2026.05.04.01.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:16:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: watchdog: qcom-wdt: Add compatible for Nord watchdog
Date: Mon,  4 May 2026 16:16:43 +0800
Message-ID: <20260504081643.826038-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8AgYRzGV6gjxeqHgFZOh6Soi95EB4yrw
X-Proofpoint-GUID: 8AgYRzGV6gjxeqHgFZOh6Soi95EB4yrw
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f855f5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vLXAFcHGVjC68m0yDQIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OSBTYWx0ZWRfX4fXEW+jWije+
 L8JctuYsNYpjT4Z8aqG5I8nsdpGjUZXXoes1Q+N75K/C7n9IjvjtlUOmjwpdNNvKPiMEQ5hVbH1
 TMWMUzDLjtP1tOi/PxufD4LlKQUtW7LhQUPM7/3PGDi1yanhSu8zlECjx1g9AkSABwABfBNK56D
 76dclRr+XRLFEqpYNsoNQEwHIvkGz/3YrnBchPFBjou8GPAd9VBem0ym6aMKeVluPAvGhW+mTmo
 v1UtJzKMWv4i8F8ACIr3S2eJyCagvelccITVZ7Ct4vbG09byXJfg1TyN9/P2z0P5xJxlFUxl9Av
 jL72FfFwl0ejTJt4An9fhCBXNhopOXpxJRXBbuY/Z1fi2xeYBD/SRFz2dpeVlznk3UMmKJGufav
 7NWqT3WWvmKvfTNnoyW6OBp6X5Yh2D+i8d1eJNtb8W9TWIvDoMugfsfnH94j1IB18qH2QpZjX1p
 4LGXzYBzVjk8UoasAog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040089
X-Rspamd-Queue-Id: 2050E4BA0CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105668-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Krait Processor Sub-system (KPSS) Watchdog timer on Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427013236.231841-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420114950.1253792-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..f2e6091902b1 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994
+              - qcom,apss-wdt-nord
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
               - qcom,apss-wdt-qcs615
-- 
2.43.0


