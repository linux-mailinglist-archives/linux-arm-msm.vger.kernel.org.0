Return-Path: <linux-arm-msm+bounces-102741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGDOLsVF2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:47:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D103DB95A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E2AE303348C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE623E928A;
	Fri, 10 Apr 2026 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATE4SgXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jy0oF6A+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847573E8C75
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846632; cv=none; b=fG0BnnI0YTFC8YBmllkOQulw37CAHZrGcr1Z0VZUBhUChZYC5mjkBXTrcMFvfn9/+xI6YzWNOylZ/dMhHhWgoNrDvJUiRMvUpN9t6vnIj1srsc8F2FzFTnIj0upwzkfNcaNchODLV8Gkv1T0L6uG8JQ1D2lz7yoF8lsWmJdM9zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846632; c=relaxed/simple;
	bh=4ftT7KserMFkhX9BF0C8VG8BJnK92Mvr41UGRSzsZNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQh4Jnmk5hHXM7EJoBK9qIP8nfWEXXaYzzAK94yc93qWwxmRzSocO7SIG0ZKhP/9SHcCp0TbmNq+1cuvlvfXB97zqHrwfdoGOr/qpZccCygJyU5LjTeLJ+mkOzpuJrshorKMIi4E1NU0GEk/E2VpKbWI6Reclgxz3UC2WZql46Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATE4SgXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jy0oF6A+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIcNjj1925126
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bFa6hl6JLjo
	KXbtuntiSmjC1r0xvIggQc/6m77la7C0=; b=ATE4SgXQ2aCHt60PZubvHwvrWmf
	WOFjTGYJp4oK5fBEiej3CX+aj0nVLWD5btc73Io5QmlRK6MT7aAQNA5BOAfIaes4
	4zA6X3Lfw9Ixi7h/DJ4OnDGy4pqaz78oCUk+ng86PiDDYnb8/SDuxQz0Aqfb6XBF
	CWkfqka8jnyoJ+R0krepE1uyJv8RQFFSx/2fKXtHVvBnEXENby7sz5jBHoLAZW0x
	IEiWqyV1glGe+L5FVK+1mOEfzP1ZD3I1lrlT3cdXnLArPAkKxauz0BTI+nQT4Hr5
	VhfFmlzxDFZJFzXipDyUz7MaSEuPJgY5xTQikGJyOvXHzuUt+xUFvUCKguA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjthct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c4664f75fso1733617b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846630; x=1776451430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFa6hl6JLjoKXbtuntiSmjC1r0xvIggQc/6m77la7C0=;
        b=Jy0oF6A+GxwCgRsX1iatxaBIalgKcHepyXNO9dR5onaZ72VthpSxwt9fdzYBAnqeCm
         7L6WiG/Byv3XKrW/u8TrRBaVHdCWs8ce6UOZWBVW3q4xUguJCR+DVGoDb3yvZiUy9GgU
         4lsbSNJk0x3wKdfzNBsZN6lu/ctuLLkmbHIQXSMFF3C+rfD+OW6okib1vth0+XAEOYNw
         wGLLcLkbQKSNKfQciusG5MhBeWeI8Lr7ySH2/hPb3n47GN6auDHGCPktcaC8oqzBp1nP
         UNmYTVb+eiLenhBfn6JAP+Nd5zTT1hSqcIHMk/FGo836/MHSD8eRrcBu6QKYM7ZopiyT
         KIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846630; x=1776451430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bFa6hl6JLjoKXbtuntiSmjC1r0xvIggQc/6m77la7C0=;
        b=hK3NyKVvxPZpW+06yT1LXzfteGEChFprGWMxuS9tNbpl7agVZk9AulDV0rb1mxCWnz
         1G6jsZIZcTYBFJqZCxE9KXdfCLys1AyCYkIJ3ugJbKpnj1/HzL4ClP3e/mmmb9rqMSFb
         pVJnSYyTIeY3FJSBoSYOaGCTdgivDIaArnSierRDSRq6GshWzMZQi2+7f43l6hddAqJ2
         BNruJRUdHPVKPrWO1zL9jMBjMmWnuhL7cOeiM839XcIR71gVX/kiyxVAjk4DBibKEDy6
         RSUALSTlt3gsg2AdCcjToATRVGeVwSzyaUjGQZkHu7A3JSrWz7ZgV5dRBAKRgKpAfGnD
         3UFA==
X-Forwarded-Encrypted: i=1; AJvYcCX8CAzVN7xXrFWuZtoW9Rx5QD2gYWtOfU8xgQe100Y3+eXaXhWjlbIi7yuRCbhk6nA3SXa+5KFCw5AJQhP5@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+Yjtqz+Gb1niIojixPbkLm08GYCiCFi5J47/ACWXRtM3u7z/
	5flA4CXQVpzmiWFx/QIya/9O6oSoSy0jKcbhuE0da0Q6ZIG0NxhiWuAFve4cBMpU5T3tW4MVnKp
	8O36kf7ybFb5Vhp2qAQm380pGJoWf4OZkg8GiOHLE99VmkGS3p7JGrrSgnXTfMIjwPqBv
X-Gm-Gg: AeBDies6QVTaqsEUNQiW9us85IrA3wWRVhWThGCF7dixiOIZosM4xPtACFMt1eqNV7X
	qlhzNhAVWBXvVrO+siED3MBJNAw59B3zCXUAcPUQjjaxIwuwxRjYIZSclInb8rE37ljBabp0lLn
	HSebFWIxSc7iUttacFlyGZPBeauVQVkkbnxki4F6QvByohS5VVMIJvanFvmdNw68LmNjzoNyrYk
	EtehgxfmJTaukbzk2B/TlP5kaJ/43RtanDKXl4ul6rkYr3tK3khX0qStzGvBjf8LLXi6br+s4Pf
	Tb6AI9xAip3LKt36pqEus/pHyrlv5VdD/fmKBI/BrHvn7MIdNCNgZDHOyGShytj1r6MyyfZ7lVy
	/KscaViJ+Fey6EwbFCCFibvPF1dLVdowD+6nKbdKFNY2KtTVE
X-Received: by 2002:a05:6a00:398d:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-82f0c187fa6mr4925423b3a.24.1775846630087;
        Fri, 10 Apr 2026 11:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:398d:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-82f0c187fa6mr4925392b3a.24.1775846629472;
        Fri, 10 Apr 2026 11:43:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 27/35] arm64: dts: qcom: milos: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:04 +0530
Message-ID: <20260410184124.1068210-28-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d944e6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: G6UIVKQfxKsYH9NDCEXryj98ZYlZKTnn
X-Proofpoint-ORIG-GUID: G6UIVKQfxKsYH9NDCEXryj98ZYlZKTnn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX06BBKyTLtJvy
 6UlwGYK1O/5q+XN/okZRttuETPw8rUV1wT7Z6tEmUO0HKyIRMQGsrztOfB+QhSS/LFN17OzOPZX
 xzNMggyC5cbGV26N2uD6J6M2s1NxtA9pYlDqb8iNrhmkKTz1v2dmq6xYWwvISoSvBOOt2p/Ct4o
 mTxBBCUlMbxU6tMVuSny24s2xllcn17pgSDa+uUkYF05XCVVyLltpvBsR4ySZvQPTfl+rCOUbs6
 8Vrqzt8ce2dISy2AXrCB0yUtfz+3REybgvVPE2+XbhYqF78b2im5xeh/6V6gwyul6dSC5NF6v4N
 nwAOHgnP+TMH82xkhb9d2flxGZ3ceaaoEUI7AeruJVZejEN/WlJqfsI1H0fguP9pzANt1NWuMTF
 gzh+yq6E8XSyDrDrppObbptHlspbfyrQYjin8TpbBAazoLzGGBRPfzyAPmeKHM2GBODXjlxuCB5
 ff9I28qaQPj6PPueMdA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102741-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: C2D103DB95A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..71941e6f49bf 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1564,7 +1564,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,milos-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 			interrupt-parent = <&intc>;
 
-- 
2.53.0


