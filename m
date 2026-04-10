Return-Path: <linux-arm-msm+bounces-102730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMIxAPlE2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:44:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9263DB8B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 031AC300ADB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807933E5EF7;
	Fri, 10 Apr 2026 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzZ8k6cM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxbpLz+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40A3E5EEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846590; cv=none; b=rR+GH3yvGY1HIGOC2GLeE4/7PpEUvA3du2bYwXde7Bl7BJKTNzdOhJXMfu8IelA42nhixlTh9VVT9ckpkkrw7NFlJ+8dfSXT9/vB05ChWzT6+ruf1QK9ijt5PXhOqMT3PfPUwNlHpNKoFAvMrcV8qj5t/9RSDM8DHne2WDfKtXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846590; c=relaxed/simple;
	bh=JBr1fZ+eJoiZaiu1EiIvAAke3CV8bEzY2jwvWC/TtiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YP42Cr6Bf9sZyraYWLvfwEqZCtb6y/l11ijGOUsu+ELpLVC9sJKzYZqw0tmLONNN1Yu5NAgErbf4tmUxDKkeP+9Vlx0cPlFKZWF4v8qmp14iznSVmsjEKAW+dgo2CcsaI7Mdl63Sk9e7ZtUJXqrY2ReX0PTSLOF8nL/e/XriSsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzZ8k6cM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxbpLz+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AITJra3743154
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kzXrR20pd9o
	JVz+SrQKXyeg+MYmUBfiKCyuV5KEvrro=; b=hzZ8k6cMCodhD3P94iJef2c2TG7
	Dvf1Ipwxgis+TgdSvbziB0FMLXdI7zqPO5vXwXyhNHso+qbpzHVi34Mc+Z1x17eN
	X452teQYfF/nPy2tT5KcqjTFDVit+HSCJ87cT8P4/6SeJHVgZPNtRrACy2ldtDaL
	6HaCzCohbigQ4sK7tm6f3QS8y7tfXSmwx0b0wUX8gjsEOb2zAqSJetEG3pxqas9O
	8kkX7lVOT8prZdEUOQasUhXA87CmPZYNXppMiFVwvPRYYxJHD1eaqaGhIIAbPrTZ
	BtZp36c9HfurOF0Yk6aHps+MmLRAK2M6JsTEstXE90nSb+kQQZ4/GPnqCTg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76dbf0fad3so1463351a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846587; x=1776451387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzXrR20pd9oJVz+SrQKXyeg+MYmUBfiKCyuV5KEvrro=;
        b=HxbpLz+wHInIeSKAmIUbdfMR1nLacK5nG7ZbxIfQt2Zo3bLiHOVlJStz1IbhC8ZC/H
         lEkRVlgiRPGMu2msKNEMGxL0fN0osVcdri2krl/0iDyQNkdFzeztrhElgRzHPxmC0jJA
         R6OHGDhHEqwGdP2IODB+JX5kVI2g5IeufQLQpP3k8SWJ/mn8/DfNCr8s9FVy8/UTPwsQ
         qailhqXfd2Oa4uncceU0JK5H6l3AWTuRNIpZdvVI6nBqyeXtDtk7wTKtS9RG3F1eF2K2
         b9JUxklEDbfJ3SWjOohDcKpC7jJNp9slcjKuf+eRWFP3kxqY0LPja6vimj44tdpD25bd
         J6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846587; x=1776451387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzXrR20pd9oJVz+SrQKXyeg+MYmUBfiKCyuV5KEvrro=;
        b=aqwHiEzY45q+FpxGlmYhAXQ3voVc194PEV0uLTukMHOWfWep+sH38H7WnjCwOtNRpI
         yaYbgKNTX4/QNnREi67EXNHDM3QYZU0J1wJgKAOAyJMQGS2ryP9iPa3CPQpKKQfL26qd
         SLDPy3KWmhYlAqW7KpTlcWNEgYidqG4rHpnIU/INSaeEDq6rA6sBwTNR7Hf1rEDSjKxW
         +c+I444MiYv8YLk8jGtfPnIJYB/3qeGlDO88JANX3kBUjx8fu3aGzs2cUYRkhOClSPvg
         6w1VmiOWmJDWiryaPd6TwO6GRKgBeO6OrG62HuLJLDD/dtHQzi52JBSSHQsRIRHTS0gq
         U87w==
X-Forwarded-Encrypted: i=1; AJvYcCVVmxKMtGzz1vHkQvLQEkGf6Ft4TCS++bBOWQ7+wBKLhlYytrvNjF+eFQnKLCwXdsPmUu+MYlyK7jGe3D6h@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6dqhyMVzxkZz6nkqj82VmLS4pDs/+I8E22PXWyezzfDDT3Wjv
	bO3fK09+32PSqasNxrtM8C50WP5EzxlY1s85XaI3LW+OiJWs8GHlb7q6+sl9qvdZgqgJHvdMJpA
	dVMlUOi9jHILJj0Nbs9X5vCmsOvOKdA3iLUO5OYOgOMPl1QNFPXEkxL2fsTqHJJilQ224
X-Gm-Gg: AeBDievz6uUHHLIkShs5ObyQgE04d06R5DKFBiwDec3TGoRhKulkJggKMZ1002pi5BN
	INp7aCcej8dZGLkSak9X8Xl+LdHvg7xAnL26IRgp0Yugx9d5/iRWm08SbOLh2b+vmCGyVt2gn6N
	c49FYTzXH0WHkw6Klq6P3q5dNQv9xjMpDRVOUsVmb3XE+9CMgYNNUlSEbbwU7t4pv6O/lsgwCol
	nM6obfijFh9Fw/dWsbWkiKGAFRBKZzACLYEKjRfnnMqy2L2dqHlsTW24B8PxGAvdprUHAkJMTKt
	vOUX7nxnkp+BWT3b7gz5rJeHzEGmOVos03o6XD26TIsq0KHMmasAZ26qfXdrx/GASTlmqKVxIcE
	8/v9H69X4lVWb5e/wzHBb4j86IkGXrjoU1f6be00RLHimWiUw
X-Received: by 2002:a05:6a00:2ea2:b0:82f:9aa:d63d with SMTP id d2e1a72fcca58-82f0c368148mr4928482b3a.49.1775846586846;
        Fri, 10 Apr 2026 11:43:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea2:b0:82f:9aa:d63d with SMTP id d2e1a72fcca58-82f0c368148mr4928447b3a.49.1775846586238;
        Fri, 10 Apr 2026 11:43:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 16/35] arm64: dts: qcom: sm8450: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:53 +0530
Message-ID: <20260410184124.1068210-17-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: AXJ7pn9a6-K5StuXKG7-1zgBCHyDXM1Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX0WxbFVp9/IsI
 5ai0TX8Xq+OfyWP4Pirm4Od7kOgSoTe/7LCMZOEF+yd6SSgqpDjmMejkJ9je5xrFaIt0gBmDbR4
 P7E2AWtnuZOQa1j2JymX8I319I9lNr5H7UzpaLyD5wiAIwUog4ffqvOYAuLjODIN+cqx/jcFJCZ
 GqXMxfgiv0Vr9bf7He91UtpFH8UHyDsnJhakj5jXtrByd/qiZzoT3kfdsrQuV818YN3zZt/w/uT
 9gakzr0ZD0USjYM9A5oGSz1q1H0Hj9J9UmY4Zu5ita3slSOzfi1T+5bzd5huMHl0ruRxu1JXeU5
 +iXDFj6sB+TYJsKylfQeM7RCCv02nADEiP1gRiNtbnmMizB5oYUjT+e3iSXnNfcap5oVBHn2oGr
 Fogj0XRyRR53jVeJS3aCmqxf7hVS2zJp07O+oNXZuVNOlCMHBIYtK9QAyKAayN36G2K1zTpqy6c
 r34uqb5fDXKEDpVIOWw==
X-Proofpoint-GUID: AXJ7pn9a6-K5StuXKG7-1zgBCHyDXM1Y
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d944bb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102730-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D9263DB8B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 920a2d1c04d0..8aa60aa524a6 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3728,7 +3728,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 12>, <14 494 24>, <40 520 54>,
 					  <94 609 31>, <125 63 1>, <126 716 12>;
 			#interrupt-cells = <2>;
-- 
2.53.0


