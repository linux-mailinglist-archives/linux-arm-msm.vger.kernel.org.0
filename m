Return-Path: <linux-arm-msm+bounces-96577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODl7Jz/tr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:06:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D923249185
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C11B316A245
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D3144D68A;
	Tue, 10 Mar 2026 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXEODw4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkF98rqk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395336CE1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137040; cv=none; b=cEzEkHaUlWn/aJo4Yif3jjxC3TurCI36arYbBBaJg6jqoy77/+KoWKamrgSKEfI2N6AUDiBhAKV4R1DKg9A9PptAYpUNEVhzf/MEwPtWebnL4lQ/NGEYVjpdA+s5kviy0DmrJp3ugdZMn3uYxgLAX0LcZLqmy56jzr4Y6OkUXH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137040; c=relaxed/simple;
	bh=MNJvbA1adGgSxkK9ZtMW6V5XLKHtqCmu/CC8Sztw8QA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d98jc5na0xmQIFBANG5KOHn8/scBBQ07fIw3rayukeia/Hnia5vpLCfwzFkBogAcQfCdRo8y61s3y48qH1bALBWBAVmUJe/Q1qAl78CRk55VhbwOvZ69lIkANrG1mOQ/mw+wFba5q2bL1GG/0amFlAc9I9vjSchHrPF7ZDuDyJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXEODw4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkF98rqk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wS0m3124655
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+TiJOIpoIer9ww+dmN9MLZeSR4wUzsJQvZZnemuHSy0=; b=iXEODw4tpSTLiLzL
	hp/1hvITnlBXNqxmnTVzzZCkTnjM+FsiGI9z4sQ9xVFtv/AjX36DCWInMdGNs6b3
	/mYlfL98uVFNwvVfi+b+kgyF+GeBiqkWEF3Z41ebk8kdVIsdafx5y4cb9FjdgSAP
	d+2Efa+VzPO3dvMsQdFkK8p1MD6ewBDhdg9DtcIQZeJdxpFSLA7EF4vYQmrnvUPd
	DFWwqVou7wAx4JlmYishnO8yzwdMbJB6pHCfa9B7X0uyMp1BywwaE88nB0+8OYmP
	HHx62/YK91hcW3j/nPiow30npg1vrg4AP5Bs+i5lANOLM7S6TwgGHjPzMbnpfCeo
	cxVPUw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0ga1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:54 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d74ab502b0so10697057a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137034; x=1773741834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TiJOIpoIer9ww+dmN9MLZeSR4wUzsJQvZZnemuHSy0=;
        b=FkF98rqk9FM2/u5FieGIHWtSn6ya1U9l8+o7+2qvv4OTVXOIA8p1H8CF26scJZAdt2
         8fq6QYx1IE2zcwZwOvJA7fruZTDf2R8fI3OwpDyu46oDZ8JchLyGvj3QkA+JPEDtw1C3
         CGDp24OYD3UWtt7qFCjpGsfQ05+ZgfHf6IQ4gc714OIT2ldQAe7tgBNxvpxwV2pCxlJ5
         HhoFdJTVo5nkyJYxIwFM39q7lQY+II7/gkiCY5c9OVUa7KBAx1JxM21s58vW9D3Ds+Kz
         S1admXq/UHxorlunj3pnxyo2lUItInPOCNjMeZTL0tVIrdWJwEPq3x13dkqqjdwjmgHl
         6UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137034; x=1773741834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+TiJOIpoIer9ww+dmN9MLZeSR4wUzsJQvZZnemuHSy0=;
        b=OO4agKTDQrLIoNOSPErrD/iSbZ7Ft/kPXZ51qr2+NvV7u+Aw2w1mYS2/ZCXZIowRTS
         ObmS5eFEkCF0ywNmTxhG4EXRTJHo/xXfP+mqC1fpgutcgpsn7GDqUlSdkGJiVDtH+aWh
         xkJhEtisrFczojhXkcrz+6JkEsr/lLCbMFSVw0DdSadqQVC5Izla4tmuPaGKmGC6irET
         CdvLd3uzqdosOWJ/G6rOwTsk6xNXYkobqclIR3oufv2UsmGUt0Mrz2L+KixJDIMrJO1O
         OEf4IjnNaN+yoCXYD3JHT6V3IAi8k2sm/7sPl5WieMW15zIxJZq8ojckD+vcGgbGMITO
         BRSw==
X-Forwarded-Encrypted: i=1; AJvYcCVdz33JPJ9kEbNRhnzi5i+I769lW7mC3Y+7gmYKQg1/0zZnmDtfsbefFqSzlcS/vXDwO7i97o0+TylDhwEE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57D4iW88ezV6TKdZDXSdiOJHko+hdZuCmIwCJfSYzDKfiu7qO
	q/TCnijViVizCceVVS3+YIgmosrq5zDrZhPmPb65YLm62uipTxFIJL+en4xFlvrX6zDJTtssNFX
	cJ6BYK4X7akimHs2CWyDifNYgkXgXIf9yq9O0AeSl5DUf7joCLc15oOjTuxg+bXMVAH13
X-Gm-Gg: ATEYQzzVIfJxY8TkKXiVDNHMe3YV41cBYGpVicFJyCkDxVJCxv2f7t8liOA4kST5bWo
	2d6hgtzek4xPZhsffFu/8uUXwQmoOnfE2KkI+SPrYim4Xm/3ZhMHqKy8Gx8xZal/Kd+qmaVnApn
	KkH0hsTVRiO42ntJbFFo/7kLhqofMQuSZhU8C4GKbaNe13fDI6Dgssr+NyeoMbZ3rKJl71SJxsu
	qR2T+OMw74ZHxurkmdBS5D5mLgvIUuPuWtvRWt7+5qnglBkx5PVUlOiaCgn5eM3Dora6WZ6lk4p
	H74Ah9qMszwzV6HNZXxYmXEWEL1EDIFkdO9Ce69jb8dUzf4fUdT0l4kjoLzu3Cxq+Bmnf0awAcL
	245qyxZfLjh2vLHsV4JgILx9v54EhWZrge0iT0UHDRdyJ7v9g3dOxDhR6ImAcdYSlCt4xeVIZ
X-Received: by 2002:a05:6830:901:b0:7c6:d001:afb2 with SMTP id 46e09a7af769-7d727077fadmr7706494a34.35.1773137034256;
        Tue, 10 Mar 2026 03:03:54 -0700 (PDT)
X-Received: by 2002:a05:6830:901:b0:7c6:d001:afb2 with SMTP id 46e09a7af769-7d727077fadmr7706478a34.35.1773137033741;
        Tue, 10 Mar 2026 03:03:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 03:03:18 -0700
Subject: [PATCH v4 2/7] dt-bindings: remoteproc: qcom: move interrupts and
 interrupt-names list out of pas-common
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
In-Reply-To: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=15017;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MNJvbA1adGgSxkK9ZtMW6V5XLKHtqCmu/CC8Sztw8QA=;
 b=lrmN1CMb4giSSKs/219Q2RNENZzFinS3uK4Mpz5nznbXPqMXFCiR/0l2CXt2l67O03W84I63I
 9TS3jQXucrfDevf3XU2Pu2yVd9czg69U8k8oV5agSCq8GWW5JBvbFjy
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afec8a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4MiHK05HUdkkAtNoTgEA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: lZu9r-wodaWoC1cl2ir7yvDC8vlN0GKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX6tzDbzilDbDE
 WeZRok59F+Dp7VxKf5qNToiYqHUHk//NIFJu5X3vFc6k+Tlgkn4roEsB1GE8bCd6BCvodcW18Lh
 N8MpYbnTISl/AcsLptIexijIEuMd8+Hp+5J6Awu9QL3s8BmlAdidalEeKVW4cU+TYAUIaJimy2j
 RuS6Q7ZeGM2h6jcoyeyQnnpfTPJCIR5eBedsEPIdf64szvz/Kd2j/jNy6tTDJYozmO2FVcwvImm
 8F2gmyA05YOBzA6hIo94ZcpD2P2Q8o9rtbm7R/m6CBeegSkyzg031VBaF95ajQIX1cJ2kkGvh5g
 7hAHs/k2QTZ031tjgj8zjxEDlp9DzOXVD7BvjJQdxEjPfUUNj9gEQNsekdQgQHOmb4skt8+M16S
 IVDJ71F2iBUkutskvz4PLGRLuZEcyqrPLJ9Teiyk7x2Wt03cHwFEafRh231BIKiSp5ICk5FOLEe
 gA/2Lem9q2zQCv5I6ZQ==
X-Proofpoint-ORIG-GUID: lZu9r-wodaWoC1cl2ir7yvDC8vlN0GKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-Rspamd-Queue-Id: 1D923249185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96577-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move interrupts and interrupt-names list out of pas-common since they
will be redefined differently for Kaanapali SoCCP.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,milos-pas.yaml          | 18 ++++++++++++++----
 .../bindings/remoteproc/qcom,pas-common.yaml         | 16 ++--------------
 .../bindings/remoteproc/qcom,qcs404-pas.yaml         | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml        | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,sc7180-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml          | 16 ++++++++++++++--
 .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
 14 files changed, 226 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index a270834605da..16c35e15ee1b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -58,10 +58,20 @@ properties:
     description: Firmware name for the Hexagon core
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index c47d97004b33..f8e1b2b8e782 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -33,12 +33,22 @@ properties:
       - const: xo
 
   interrupts:
-    minItems: 6
-    maxItems: 6
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
 
   interrupt-names:
-    minItems: 6
-    maxItems: 6
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
 
   qcom,qmp:
     $ref: /schemas/types.yaml#/definitions/phandle
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 68c17bf18987..dc5a9981c12c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -26,23 +26,11 @@ properties:
 
   interrupts:
     minItems: 5
-    items:
-      - description: Watchdog interrupt
-      - description: Fatal interrupt
-      - description: Ready interrupt
-      - description: Handover interrupt
-      - description: Stop acknowledge interrupt
-      - description: Shutdown acknowledge interrupt
+    maxItems: 6
 
   interrupt-names:
     minItems: 5
-    items:
-      - const: wdog
-      - const: fatal
-      - const: ready
-      - const: handover
-      - const: stop-ack
-      - const: shutdown-ack
+    maxItems: 6
 
   iommus:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index ad45fd00ae34..5854b3d2041d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -32,10 +32,20 @@ properties:
       - const: xo
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
   power-domains: false
   power-domain-names: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 188a25194000..4c6d32b1031c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -60,10 +60,20 @@ properties:
       - description: Memory region for main Firmware authentication
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index 66b455d0a8e3..cb0a61fc301d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -48,6 +48,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index 5dbda3a55047..c51010493bca 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -45,6 +45,26 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 5d463272165f..381ece510b0f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -30,10 +30,22 @@ properties:
       - const: xo
 
   interrupts:
-    minItems: 6
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
 
   interrupt-names:
-    minItems: 6
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
 
   power-domains:
     items:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index eeb6a8aafeb9..987fac433fae 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -51,6 +51,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index c1a3cc308bdb..53ffb1ccd199 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -45,6 +45,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 7286b2baa19f..6823a2a8d74e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -39,6 +39,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
   smd-edge: false
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index a8cddf7e2fe1..8a1fae095a3b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -61,6 +61,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 6d09823153fc..4ea7518db537 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -55,6 +55,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index b117c82b057b..d93e17fb5e89 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -72,6 +72,26 @@ properties:
       - description: DSM Memory region 2
       - description: Memory region for Qlink Logging
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg

-- 
2.25.1


