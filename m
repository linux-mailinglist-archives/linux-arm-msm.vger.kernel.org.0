Return-Path: <linux-arm-msm+bounces-102733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGauGn5G2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:50:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB713DBA07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CF30306B099
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099323E6DD0;
	Fri, 10 Apr 2026 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op3g+03s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TB5Y61lZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A63E63BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846602; cv=none; b=ddpw7J+hkWRJzbrfTncdG2j15548YZSEeKduApQBx8+LqkfsWApyAfZfHm+XsmNpz6wTn/y6uhelINW45KU3a0hpDHOWJsg8ght4S8YHJ26+nkovN2Fp/n02j7z6GGEJ+F1qk29FBb2c4clXXFsWa2Y2uQXABVqgDRkbooDE0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846602; c=relaxed/simple;
	bh=y3oOfrb61GA0sr+vqs6duve+43vLPtr00Qb5alWgs1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glLIb1wl2Dl76D5lqsqgtapjPVDyKJbimkMSfM36qETMDIW3Qa8ftLlQen4WZPPvd+IYRIGapSrO4VoJgMww1C1hHIUYHgquDOEBiY2APXt21OBGhxeoSc3Le+40wn/hG6+8l0aP9p8RKexbULM+tPNk87Jr9ErBnB+2AV5qh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op3g+03s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TB5Y61lZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AI26Zl709147
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0WMLkXiCwmv
	qIFNDghMkRAib4E02w+arsKGbKrFqc84=; b=op3g+03sWr70arATmjjo5IMEtvK
	b2fcku11dPq/hXzzHSmg5bcQdpKCJj5v/bFVyfvcOnf0fh7442RjOvbp7Q1JrD9k
	/UoMvEBZwOCyDnt59JJgljgig70p6bKLD0itH24xse2l3gQmz4kR/4uIb4fPxt8S
	c8PsA9Bd5rfBZ73pOCZjw2l2AlQ5V33Fu/RkL9ogd9KqpkDRKwDIezo9DMjvKbDH
	DGDn4Z3dq/sn3AmioHgtlC0xcuqoIXF1UaBRYb9seKkQrFaEEpGkqUjbtPd+JM9s
	h4VoBZ/373O3P1NUo7hNNh3I/kCDdDwZMCoZwDl76gy09V13S8GsNbdd5ZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso1820497b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846599; x=1776451399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WMLkXiCwmvqIFNDghMkRAib4E02w+arsKGbKrFqc84=;
        b=TB5Y61lZj9YM+KfkTyS7ZdKdaxOQx0nesr6xfBFPKb9pkK4C3K3RnEMhuedUpUZew/
         ZgEl8c/9MqWjfbn4+7Wrhm2Uv46D8Z7MJQC6jKb4YBI8UFJ54myXjZTrusH1UPFZK+n+
         TuhnUaCZCM2sh/eDeg52zFjrDZjPjhecCrqEDjT4FYs/gGN+50d/Nqd/kdCeeXacH8k7
         LxMSCHp3Bn60tINZzGoGKfd8twUHxvsm2yx2ZwGGTkKrEv7IJLdEHHtmSB3ZpluCmY+N
         FwQWpEEATC29gRHw0D63lLgGqSJRacdZq0hK+liB3iScpqB9z0+gKfw/wgHlgwY/V0Ty
         WT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846599; x=1776451399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0WMLkXiCwmvqIFNDghMkRAib4E02w+arsKGbKrFqc84=;
        b=WAsPRzobMHLQrFZBkwfGjddtSdJ1IQ1oGj7ffFwKwkGUqNpk/jCB52Z9fttITXpukw
         lAfNYUfrfwPScz7XRugGud2CumOlEubQe7RV3/wYqpaQtuHEo6X6Onqvu9M2kbXzGwAL
         LOo+4OBB5rS5/nSKO3NtVwbU9khVRh+fsisG/kM4sHYFzJgeqCF+Cu0FQ8UIdZtGV81p
         qxxA0pKuESKHwgbeGeVG+FSZk3ymAKwifEVGUt91D3LRQZovLppim00jQLD1SlJLDvK9
         urAuhaS+OUOWV7X1vg/xpni6QGJjZo0OunyRpdKXNtz9DUveA0OAF1fljQmtYEXrqeoZ
         BHrA==
X-Forwarded-Encrypted: i=1; AJvYcCXfru6MHbiRKtxlPpcQ7MZU9BSLdSs/yAQs+1EqkEnRHTZp+8PtUytGtUFCvCZdUkUAWtqj4tIYzXT7+Q6y@vger.kernel.org
X-Gm-Message-State: AOJu0YxNj+KNbQC/yIHbty4lO9/hvhL7aVfiFjKWc5Cw9Wv2krYY/0iC
	7uDeFyNAToLoTn9jl2+igUj+pWn3aNjTAh2dLNBRLe9uK38ZXjZMjd989RwSzDT+W3C6VDkA0AF
	0t+oHR5OmWZhvc6iMGrYpoTZA77D+wW29UBXLZ8qpv803MuW6ck62E7C7u4S6sSEOgjpH
X-Gm-Gg: AeBDiet4J/rT84BJ1QSGm+PozvU4hgwm39XwKCRFivCYoSs+Gm21vl+czd9YaMT2ZW7
	WjS24TRspfzJszsdlC3LNZvdvWUi4kPkXzgrtU7yxxxN+myJKRU0OSv97AnQoHzSEU6BjyFOf0Z
	PE1hxWGvPEUHZMQmPhJcBMt1Li3Q5EWionvlHMHw7Xx6LJpWAKlk+WmmVR6F/CghwniljkFUzFX
	TbdO0x3FmTu7fkixdIR93/0KnslhP804qxGkz/wn6Qo/6wUD67fbUBwJGAobFvN4W64n+nfQyH4
	eZrASwGDrV2V+QSyHMWKRvvxyU9FxYy9GVwGZjm+U4p3BhAWx+O71+dKtizvcZxKCf9Cv2xzOfA
	PHYd8LddWb/s3+UDLHvvA6mdLY7h5YClSuZtltsfVgmls3yRT
X-Received: by 2002:a05:6a00:1796:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82f0c3d78efmr4851714b3a.47.1775846598683;
        Fri, 10 Apr 2026 11:43:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:1796:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82f0c3d78efmr4851673b3a.47.1775846598011;
        Fri, 10 Apr 2026 11:43:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 19/35] arm64: dts: qcom: sm4450: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:56 +0530
Message-ID: <20260410184124.1068210-20-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: EO58ukaUsTVik6uunef39I1rTCNlGN1w
X-Proofpoint-GUID: EO58ukaUsTVik6uunef39I1rTCNlGN1w
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d944c7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX4aGJVa42zaqn
 tay7MsknIHC2zj1kxOFlHwo032ekb27PQRUvapH05QBc58hMiTCHwndvwmp708U3SjG4nfilSgE
 /ncmC9H9s5ZGHOh+Ih2g4N+JDOIRLPpQe9aZGFCajA4/YxKY0Y+WSqg4tsukxA2UfCtqJO7R1HU
 HbAgJpMPuuWfVm7wSZfAWL9w6SUgkwlUc7g2M3KcxZnVnFFUlV179KxvoFIrAw5Ze8DKB2fUf0s
 UrD12i1m74VYvluNi9o2i8WPngz5+LQkky2n69CAvxF9EA0IbV1n/WlV1WrUio9UkQeZvVkrLBX
 XFrJkVKwNwuLF9OyvixGoC6+NgvRUsW2tgvcsz69VfG6Kq/1LR0q8Nmr3MjdEiQGivEpQKwIwam
 ORiGlgvW4HktynKpMvVV67AHztFOrmmpKKSeco/HOhpPagvsLANOPCb2LeQfOn6ADJkGUhZ5+Mc
 KoCoSAce8vPcy/eYPww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-102733-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,af00000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,b220000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDB713DBA07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index d217d922811e..b84dd1a8311b 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -464,7 +464,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm4450-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 494 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0


