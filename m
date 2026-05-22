Return-Path: <linux-arm-msm+bounces-109392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMBoBUCcEGpuawYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:11:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B35B8DB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C73E73055D5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1AA366054;
	Fri, 22 May 2026 18:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/vzTRd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEZ3AXxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE9356775
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472964; cv=none; b=lb3UdBwntAmkSEThz6IwK22YZ3WBDTWyoNpp7TodjIQ2LZWkzIKJVTzXSZlKg2WqYJG7p1KrvuNb5ADT955qxXmXR8tXXBLHt7USXHMPScOhDbPRubYWcLka9q5d8vBkCwgT2xK06wYtveSR1girwLW2mYeaOnvTw7+Bzno0YW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472964; c=relaxed/simple;
	bh=TnKOE7unCT/HQOtvafKdSU3ITE0Jp3sab/TyCby1k78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSB5r7yz4I3U6ValLxtP8hwB1yoyucYVAJOJGMdyW8Fi/Kf0Ixe+6JOJroGho2q76DrG/MACJgCbWM7y209xOlNZwT/+l8UPf06+IQDJ/7FHKN5jKj7rkUxHmJGiYPehtB+0sz/FDYc0pQzwBuZz7HaSNqFDvUs0WVgscfRaXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/vzTRd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEZ3AXxW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0imx3477058
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64LpLRRJIlxMY+JNBOraanlo/l9X9GJFOflyXf+N9/E=; b=L/vzTRd/DLlC2VXj
	pp+P5XTwaLPjttc+nI5EG0GgjUHRWO2xtpXUjdFq4i4YfO3HwN/keSWwPZyiEhTi
	6HFtrMqi1DqF62BozVGzayX+2iXqemx4UbDvCKBr0m/JW2HNVxJXOhnc7ftYjO76
	BiAEmHeiTUeuZA1itw3pgKnDDqIWaBTQCuzJ8/fHitHT8+yx6HTeGO+lN9c295LM
	4ueaSmMAI9mv1pxK9rAEydcCRqCwCWw84DYSlrypeohLMP+nHXdOaRTqRdjKQmL9
	GtKyqlVRpNDmgwsOpVKWYUhfl79RVjxnGWXpc4MD77eirA8k8Sl/rH3Pzg6W43iG
	PBSsDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8eyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 18:02:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bdaf8567f3so54021225ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472960; x=1780077760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64LpLRRJIlxMY+JNBOraanlo/l9X9GJFOflyXf+N9/E=;
        b=KEZ3AXxWyf9C6xzeE5VdP1PjkDHnev7t1ThWHy2k+eFeaZcvrKHetguVJlwIcF2RpV
         bT6xVUteZmoqpR5U7qTchlpPDibO7QUwBO/3os9n5/mk4RLx7O+gVuPGoAccJ4TE6zcn
         TNnxJ/HVM7ISL4PxQqCLCXxuA+Z4eMHrHe0UJ4dkv85vZP8PX+mdYhu9mFTAXQ0dlcc8
         B9SYMj9OfLGZCA/fdsaJ2TiVG5kYp+y57Omkks2y7Mj+5AOcUVM5I7VINJf6uGXswNcy
         uELSp3AQqjXH0/jpYuG5jeEAdzCF0VRHhnzL4rgwUkw8SruQnzSMgXXPQnYi3lTvcLBH
         jWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472960; x=1780077760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64LpLRRJIlxMY+JNBOraanlo/l9X9GJFOflyXf+N9/E=;
        b=GRl2VD78jQrnoie+j7IM7nLv4LxgDUa5jX1FFq0Yj+7++gVOYSyBKBD6Nxni+JpJ5t
         0qtLGrro1eTtTXKNAnj5iI/2CG+3IxpT5Vmqnzeko5+LpHTn8MqIT/lwEkmo4JrLx7Uw
         TZ4V0hSWn84yvNrn8Dz20Sz4Ro9OWE8Ul1DCTHxPUks5RMJ598pEVJzVyKg6hf6rAq2y
         k5iwrlttcHBp53TvZcc3mPIDHNQ8jkW3KzETWxNN8q7wx1dVRmvF3mmPUPJ7Dxz7OvSs
         qQIk2bpaD65g03t5bazCccxAZLw05hAEN69+PspR20Ausfcjx8ANs6E8kxhaMEdYk+cN
         7VWg==
X-Gm-Message-State: AOJu0YwxMSKlYl2fBNUpAjmOcJKGQgOx7sN57j4zRLuJ2YuPNQQwoxbr
	PcNTG1K0P00doIlnEU4KGAP0Jf8OaxOzabEksXT5Xq75X3Freej6j7O9Y3MEAV9W9C6neNB3wvh
	XsPgdlh5r+2jv27ZElqR8E4/iTGJbiKnaZVpG8h6IH1VKjDxPhqIZgCH503tKg3I7UCy9
X-Gm-Gg: Acq92OFbBvkYdhxK1hHplbUat1VePy9Vejak/R2vdewfElFTCCumwrJgoSnyw7nZePr
	LKoMICudSxomkQUe90AkW0LY/8+OmPApCCTKdNmtZBe2yeSwvp0/uakk1exikyPuYXg4KnHW/U7
	Y6BSWI2YBCP8OselAJLmSe8yJKXiAdWd2hTt1hln5Z+BzoTrnkloyXCN3hbPE1gNOZqGtsKPVxc
	oEyPF2LhfYWIF4zG+JeqnaAcrwMKRWrImgsffg/MBDy8hN1hGMyVBAaTc/JfYmqXjgefjcG6iHl
	C3s8dRxw4/vIg3DwEFfv7/s1Op5aESQgnsBXK9qTHGyV73oR3IWbTNpfPpYoE2sBVMGU7fRRvhl
	Fe9XtiXr8LZiFx/gy6EJ/QaiSZBsDfWOoNMYc
X-Received: by 2002:a17:902:e78e:b0:2bc:977b:846d with SMTP id d9443c01a7336-2beb07b5161mr33830455ad.5.1779472960537;
        Fri, 22 May 2026 11:02:40 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2bc:977b:846d with SMTP id d9443c01a7336-2beb07b5161mr33830045ad.5.1779472959931;
        Fri, 22 May 2026 11:02:39 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm21193645ad.74.2026.05.22.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:02:39 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 22 May 2026 23:32:24 +0530
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-dt-v3-1-80ffde8a3dc4@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779472947; l=1681;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=TnKOE7unCT/HQOtvafKdSU3ITE0Jp3sab/TyCby1k78=;
 b=lipHYk4WInft7+V0GCh+adx+B5S1zW0zaOQCUNgDx1cFqTwFKxvaTvPyDS1IpBJ4n2RGHCZUq
 DbSRO0zd0KqASjomeFsYUocpU55FNf6eUK8ZW6IDjIFp/wuCNEdpOU/
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a109a41 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: kfs70imBQEqrD-h2BV-2efxWRSm-X0-O
X-Proofpoint-GUID: kfs70imBQEqrD-h2BV-2efxWRSm-X0-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE4MCBTYWx0ZWRfX8+Mgejv25x3h
 IMBoZhhQ+T18KKMkD5/D2zGsPDCr5sLQ8dMbcl/UBCyset4yybYvGORS52xkmQQFGSDjyDaU6GB
 oYob7gHLEn6Me5qw+DUQQQcZyuq6yc3EmI53p/MOeBgZpg5+ePzd158lnYATSKX5v/5cnEcZe5x
 wGPIQKMEsDZeelJwymTnn9NCrIpCEQjw8HZuPDGFUH6KKboYbjos7cKCyfJ0HF6AEXIKzmT3hCc
 SaUlQjRmH5gTQ9v4hRd0wLzPu2YltXv2vjR2d+WJSdpc+VLuzTxTFhVrrY/XqGMpXm20JEaqQi3
 2WpDuuCI/wNTgcg8nQ0oeG+phzI1CQEjuWQv7ezJTaiowu6WfAOvnqDBRXOfAeyRP164QPpITwA
 jU/V8yBP8ZIBI7gllrL+cwN/YM3guqLwetQxq51qNeASoBZqlUJh1a+pXnzNaxoUW/kzqrLlGI0
 5dB1WQbOwflkSDvlbvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220180
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109392-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 685B35B8DB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem
  - CQS: retail variant without modem
  - IQS: industrial-grade variant without modem

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and its
corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..cf7d241f8107 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -989,6 +989,24 @@ properties:
               - xiaomi,polaris
           - const: qcom,sdm845
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - oneplus,billie2

-- 
2.34.1


