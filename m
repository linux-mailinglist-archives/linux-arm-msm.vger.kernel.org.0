Return-Path: <linux-arm-msm+bounces-102729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPxXJD5G2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:49:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E422A3DB9E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F5943055DCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF483358A7;
	Fri, 10 Apr 2026 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+PT8+2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/aLU4Tr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2248A3E5ED6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846586; cv=none; b=b6pq6YDRrc6iIANEqO6yDqJ8RPHdAoXSzFQCYq0CDuem8YXcQ/Dbq2lKnHNZtbLi1H901XaM/4RzBy1cMKyUhys9ssb1ph6yZwmU3/TA1tbUgnAubYlQWhAC01nbr5YxctlMuM8TtGYvsSZguWVJbY4Ulp3yOc+aCUUn+9ZOxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846586; c=relaxed/simple;
	bh=xkv0LZA0DeKxEDR7Xs5BHACka47JPOCDqUGZUWDcuzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W67Tw9w6fIgOTdOzxAoBMpzlmz8qb3rPMMW8BFfM9Uxi3naqWCybeO4sFiiH95eP7+Yu79URqittr1zeUBj3oC9lHd8ybisXiC+SPMLLbmOW1ypScUcLnSl4Yejrk/6zwPjeoT0qMNaBUudMeTfhdKpJMpJ54ExIBPEI/dViqpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+PT8+2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/aLU4Tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AFJV3C3118764
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=byNP7MlHeAg
	DUInAEfAlHW6RWFsmEUK6lAUo8q0+9PE=; b=Q+PT8+2Vg/DNmkiUhZxnY5u2nZU
	JtEZ4VKxAaVhPN1WEEazVaLwk0IZ6h6P31JXDC3SO/f0U5q4+vbgqJ6jbl1TI0ph
	jvchY55TbcXaJxnLkzKSF7Q8yffcHom/k+5uIS6bOlyRpEfy+Hhe7JNkAVAvLZx7
	pvnj/R1QUdx6wt31WscpodjwtFnEipM+mSm1y7vTDjVhVOeAcG1tMjkXjtngWR2L
	eiw1TiXm9V1ggDWF3GKI0ZP0QWZp8yZVreAEqkVyESiLE1mZxgJ0eBVPcUdR1MNZ
	ti3ZqVK//oI6M1+sMiokZmVP9pt+SMFQZCnrSUC0ednbBQDIEKDFb44o+ww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3rarkpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7423ba5342so3154276a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846583; x=1776451383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byNP7MlHeAgDUInAEfAlHW6RWFsmEUK6lAUo8q0+9PE=;
        b=j/aLU4TrkGXGczVlSClfhHHfT+D6ORxFJibK5mXwUPq3xGs5T/QMr5kDSPqgpXZRXl
         ER5mBaaEFkT3nvQFZDOcihVnZoPnfOm58MIjS0FhZVMQKtO6ek//XZACntpyVCEUNOBg
         CsVMByZxqj9fOcZ+AwoL77VsOFuCRKMEupdJ3Z0OZTkSeoQwKdi/Kgp5oufIX4Nv9sbR
         p0dU02wtrdVIJeoHPvrNVGGR3lKzhn+yQV+x0fCMv+iGOy1O2SxHgUIo1DE5KfqaOyCm
         gD/wYhhZuTxj3TdIKlzd/pGOx6sWpS32RJDqrMJqa4opmE4rHfrCtoOJAXs/Ozq1EM9h
         SvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846583; x=1776451383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byNP7MlHeAgDUInAEfAlHW6RWFsmEUK6lAUo8q0+9PE=;
        b=YTqjZiwXxegbVRgVr51bhOR2ZD6Liw8nSoU4F6nHdu97JYJ4R1kddAtSG+mbXLb0qm
         0HfLMxPVTrpBfV1wrx/ejrJ0aCnfF8rG4QQxTsGy4zXNO00Gt7pQwUhk5b+B4cwA1B0S
         pHUy9r3ZurPdhNcyBO0+VXnVRU1TeKORG7qdXaUxwEouh6kr6+zRkUaAXAclFsScTqWY
         rNIVX1lGkhLP+oEKxeNr68qHeHZiulDBvNAYxoVHA2erHaZ9J1nptnXXGEWdBW+Z0jtb
         PdvK77x8R9fCG1DCtnz6XZ5nv3mFKxhpiVd9dEMDXL9iS43zrc+P6FBt3Yz2iCGSdJor
         eGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0i+2hRxGN4dLrpzP9/2hPUeszo6GMnq6Lw3iZK/bGtw7cZtx8jCm3uKgDoROM7baLSh5o5Cr4uSVW+GMd@vger.kernel.org
X-Gm-Message-State: AOJu0YzbkGu6FazuWr00116aC8zYrkS4uOXp2sgZLy/PRdgKWhtCmw8v
	mYsbF2FHbu7NnfixXtEMW4BoeAzuRcf5/j9/f0LPOhDFsUgQQUNrfILVti32vnTFmaWyLODC8R9
	3t9ux+QFTNDPVxmai1L4TOXfe9yyyoRoPEMZ7YCBM87/R1Oko1AxuLij+IeP533IU9NIi
X-Gm-Gg: AeBDiesX1iAhtFEPT0wtYQiaCEqtXZFZtk4a4/0LlHdxueQz+1VoySWw5myhKL3oHH/
	Oway5/0NyoX7tu4Acx3dLdRg6/sqJETooAseh1F227aqDBwAnwpI1L0Djk9VGzA/E4YmbIWkHc2
	4pZ2AXStmwwSqhC84jL98Ha0WYa2lSC3V+tzy+S5+B1sT78JXAlz6sbYcnGYjpaCcptRXsxvevx
	nCodQVBT+s53ZHeq/aWYmlfPp+RanUxYkJet91ueQsmpQXZ4kcPN9032Jrh9UYLUb+2gN3B4b1L
	G1N2l35gBYJZWmvPXalfM14/g4kZKn6jCzNwG4GUOEg5xW/NZokeEGOsDqAP8V804d2JQqTA9kP
	GqjScUV02BASCKbV8tFvj23BcLosY1hJ0P6ocKObJlb4TVSDa
X-Received: by 2002:a05:6a00:2447:b0:82f:37:f590 with SMTP id d2e1a72fcca58-82f0c3459a8mr5224560b3a.42.1775846582966;
        Fri, 10 Apr 2026 11:43:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2447:b0:82f:37:f590 with SMTP id d2e1a72fcca58-82f0c3459a8mr5224526b3a.42.1775846582314;
        Fri, 10 Apr 2026 11:43:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 15/35] arm64: dts: qcom: sm8350: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:52 +0530
Message-ID: <20260410184124.1068210-16-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Vs4Txe2n c=1 sm=1 tr=0 ts=69d944b8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ml30YaW89uiewqHgnPoA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXztxnMs3xgJf8
 HR0aZIOsvD2Rnm3qbZ7Joq2QN0fX+PoQKjhFhfaw6ADq9AvD4ypEUBhmdImLa8HIziMLU5uiZZ5
 C+0lk8gSqkYtNn15+yqaWEiBZiiaWgc/mabkz2SP8/p/RqzL9oKwA0+XS3SXjPgrAhshvPQuloR
 wucIDECXiUfoOgOBewt+yj2wDr6MOT4ZnIBVIRkmsWW7AjK+y7sLoLla+4YBlKnE3lMUMqsT7Z9
 rXO35nKkrw+6Vatf5IU6tes4p7u4JX/XtWLvUCVf4eImTvD3olYjxVS8QBlQhDOrdniLf77tNd6
 H6BF+fy0j+Es+jwCwabGze5T85x1z8QvkcrbQYfAiBT3D8UtCdB2MBb9Kw8aLQw25LHx6lNiUrI
 xB31NqtScE1OSMgCxvVfU9J8+xFdDBPcv+uPpuKlqQU+/do2pTTOCzPpyC/yZGm/t+g+eC5uyQY
 UrEcwQGC/kUzWXlkqMw==
X-Proofpoint-ORIG-GUID: KJtZCS3xC5_0S7PgGA_py17h3iKggqAW
X-Proofpoint-GUID: KJtZCS3xC5_0S7PgGA_py17h3iKggqAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102729-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E422A3DB9E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..a183212b12c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3172,7 +3172,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8350-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
 					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
 					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
-- 
2.53.0


