Return-Path: <linux-arm-msm+bounces-102723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FywBMJF2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:47:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE873DB953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB8FB302D110
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B403E4C61;
	Fri, 10 Apr 2026 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5bO1MGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjpGi1ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509B3E4C7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846562; cv=none; b=FqHHK3uV9pNRJ7e5ipfd6M37nU7oJQGmUh8J/h01MlHpEOj3SYepHezeKb2CtDdlrOLqfuT/0QkhsxLJVzGz9CNh0SEeI7C9ZUUpBOplNYG0OkdT1YXn/2/CyaP5CWhkTz84KsMNxX7kyzX5Jc2RiZEE1KWdO87syTfoOEJ7SLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846562; c=relaxed/simple;
	bh=2hgokaPjOt5OrTCQLArfgijW1nQy9scMVj+K4FAggJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRXb/WVBr8cnQnH3pA3v+ndRww2Z0ffjx7QP4YViro9NnPCslgoyQrDVucF+aaITltsUbPWHa05dpQluxVu0gEIqJhzyOc40R9eg2MViP9I6j5Uv2Ps56j+9uJRE4/MwvO74gRbjCbpOkJBA82g0fEgr22vhczaNNqdBMvThXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5bO1MGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjpGi1ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHCWSb1498619
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RdV1nkqBhKs
	RWW2jhUP4vXyDpWHM4v7t28eNP9G13sM=; b=V5bO1MGY/ebmuDonXs3ZeJDCUhA
	bJmTFug3RsGyAQTQhGpZKsRS8+HkW2FvGLJvLUgr3vmigqSR0cUQNC57MH3mmBAA
	IJHvjWGDphNF0JiB2RQSipXfM9bbFoWQipZGHAFy0BIMOYWfjU9d6jCrqhHQiPec
	PINk3mEYdQaUW6EUDqoh3T0OYnHgppiA1JjfdtCUkREAZBeIDymmFhDU9DuOZgjv
	mn2hkiCK5wljRUACnqDMUbLUCcmsItSTYv3WsAkQgd5SvSEvBWVyN0E5rH2oFddW
	C0qewBW7/nzxUTcEADOdeYzsyGSaX2ze1/muMqrndlyY79pQdmE1+ExznvA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b1hgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76fede6ccdso1453470a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846559; x=1776451359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdV1nkqBhKsRWW2jhUP4vXyDpWHM4v7t28eNP9G13sM=;
        b=kjpGi1efXHM+9F2qm6E/N8rjixLQyfKr05hqPzh+eEHZlRhkMg1VWwdjY+8/8/glvk
         EpBiNEihpjhsCDqE/uACKgWuKD+YVHfTUQVGqpnWvG7sp1IgrK/AzQ/NQtcx/HqKcwZp
         cqgwbfXU9pjZtKLXn5bjDE0P9GxsmDsS3IvnIrbImDAORUcIrCVrVjqTOzN6CUojRIss
         PAHowxJ4HLI/neAhAQ/wbipaUVctVYV5TKGtaDn06z9wG0KuTDxE/x4oD1LzQTm3EgTL
         k6oVJj15DzQhll/v3JTmoqbBc0OCvc/SFfwsTuJZgN9tKZPcGq7ftpaeHJsY4dBCZgLG
         ronQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846559; x=1776451359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdV1nkqBhKsRWW2jhUP4vXyDpWHM4v7t28eNP9G13sM=;
        b=gOiwmgPQnx3DiQIEaytSvYQN1YF8fhoINtAy2dasRGuQBN7nw251Y5uOrZ9rAsuclM
         FqDZ9Uke+eZov3SvFOkLCrFTgLR7pJKiexTHVO96qhEDRj9XtjsQ12QULmVjgL7NKqRY
         t2gc+FH14KufeW61Vtxd+UyBrOPsdJnxaKnQeX2pxnZ9WsBmd08gjvwTxWNic0dVgvkA
         szQdLAx7CUqaHljk6eWLBlSPguiLK/xbbAD37bT/emAJS11eSKsdn1MMQlBSqLsyr20e
         Dz1sUjqpjwkNAOPSkiTq3eF+ApUfoJJpi37ODOFUlatiu+tl+7xIfUKpxyRKRQRA9ksW
         1+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUt0pwrHsP7KPfIURZ9mJduvux+bVA2LjbXi/zHN1zkVIe0LzgKCWz+t5tMz63xM0xmuXHY5XsZrMKFwjfL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzinm0/tVBANbJxujOS1zqGyaw4u628anrGllg7D9HalIQz2CJn
	OwuZmc4fPS14S+tHUOi5ICa1AHrEKX0F2TZe0rQLPx3iY1lN7KgfGiU0UMZxyMYAEcbCNdTL7mM
	UskM7Sf2P+tCmXLpzL1l1n4DguboMP2mqQPp3WpYtDK+U+LyUiG58IetQtTMLcapjS8El
X-Gm-Gg: AeBDiet1uasSsArRFrp4StU3+lPf6Jkz9p6BZkKeasYBVb+OnFVPr7dweo0i/ZMQaDM
	rWczbHk5SF+zcCs1j8thvSNEbFjoRqJHqvL6XDucGDIPbHTm0rmFjwd/aCIoZ3PG2xlxLMpIpWY
	cxmkWPnTcwjovMS0jzeunmZxUob5ycgUK1FdmnU3+owrHIPonspNn5vVhJdWzLoCfFM/a1UaRN9
	n6P7j1i1WRdG22ansomBwEHBUrCEl8R1ydeg6ngD3bnOSo+EqRzi+6IIYJA6HHi0/eNhxULT16e
	HtYJeJVv3epfwJDmjDrYj2J3nsf1jPqIPhqmHYn1Q/hv8Pgypd2GrPXX8yp4s8flLB4l9gC1+Yb
	fXxUCzYlAIVyvQpFjCUizO8q1HibKy+ccroGRu9BBcrPJO7K9
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr4743573b3a.39.1775846559340;
        Fri, 10 Apr 2026 11:42:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82f0c2b368amr4743541b3a.39.1775846558780;
        Fri, 10 Apr 2026 11:42:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 09/35] arm64: dts: qcom: sc7180: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:46 +0530
Message-ID: <20260410184124.1068210-10-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: D7oRY1B4sIA5WdYDriBWleDJZuIwE3fs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX8KL5D85YtQXd
 76EqObjHYYmUB/X1BkHJPVbIpA8bMn/mU0iOB1bf09r1TPst9HE9Q/JSBnaDVManbty/fgau42A
 8DLWnoE1bxsuiaWM8fxDQWlacs6BfaxsHe/RSGo6pMUjcmsgnEn/MZMSOrc0wu1VG+gNPmEgbuR
 Va4dznbD3nLPK6LXFQ+vnDrH8eZk1zddtOIx84apxjEY3Z3LBw/QvU/cfdZZNoWUPohj+8twfq1
 r1J9ikJ9ECtT2PnFQkCqgRCP2iH7pW9U3Ogh2kaeDRdx261Vw/IVy0dBLt6dLUBQ9T1t2bQ2tG6
 PNpOIAmfNyF2aWnnuSHRb3OixNJ/PxlPpKMRrOiLKq5H/2JIppdEfnSKRntQuRbaTRWYM43DyCR
 rSwLiJGz1uAjXgxRlaGC7bYL7nkFtAhsjmMH1aTuOBeHlytfXP8YiOnYd7KHqmCZNFwM95WgSWQ
 8PAWXqbxkfOx8KQrmig==
X-Proofpoint-GUID: D7oRY1B4sIA5WdYDriBWleDJZuIwE3fs
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d944a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EE873DB953
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 45b9864e3304..52bc7d1aedb2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3505,7 +3505,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


