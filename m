Return-Path: <linux-arm-msm+bounces-109956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBRTFF29FmqHqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DA85E2035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF6883006B23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172153ED3D4;
	Wed, 27 May 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O47sm6Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+dwfF2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5243ED12D
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875034; cv=none; b=maJUmsm0T1ESwegy72Q7Mp0avuTc/ekBHm8Pboo65QAWdQsKv60bJlwVsCtFHajIDmrffQwGxGbj6kNnCuFsSMAgAKBW16h75sMBuUWD+rKn4E1BT7AbnC2r3PTMYNwtuNocL8JWNEsRjefV/PxUtwxXSj6RZpnaPZPJUhiE66g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875034; c=relaxed/simple;
	bh=NaZtrlng8k5QQTwI11Hfr2WExcKBZiCHogIKHB5f264=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaKmmiH6TuUyXS9eiLq9YkZC47nEwRQstt34KdedA2L/NDoxMZrGKj1NP/3DBQ40y/GGcVKbsG7Skyqv77FL0Y7Euk6KFJ8kB/LLrFX8fUMO1lEIP2lPqKWPeEmhqM4zUOL5AXsd98pCo1esSRxFbdnhtnKC5HhaJ+I7XhV+2m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O47sm6Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+dwfF2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mQKK879263
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ybOfpiqWajv
	H3os9MDhLdbdl0lEm7GdvEUSE4MFqraA=; b=O47sm6Cm1+vjG7tab1LIpY5awgE
	BiA+x+nWS7WVhJiXunW3QhRLrFgO0uSVEPx856YRc8YNCx89XbereZxV8K2ZSqdy
	239J3H2OoCJGh/RO0jiGr71SpR1qkv2WZuYsNxml6BKiZs6QCRVeFNlB6xAseH4b
	G25oCtFRvQSgZYtwu2NIsQo9dV5lS9zlZ5NxuEc9IrqF4oVLxJ4qH4R5PRto05+i
	56wxEqjPE4eHqTTnfBQpmP/4groa+gr20un9xWlgVko9G40PVwCoLi+KXxLx0aCc
	q6Kly1wMREyqSLki7tBG89ZTWsCDv+c35HGR//QcSjgaor2ENvZXW0TWAHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqrcpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:43:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baf7748d0aso117824475ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875031; x=1780479831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybOfpiqWajvH3os9MDhLdbdl0lEm7GdvEUSE4MFqraA=;
        b=Z+dwfF2bP5yVRBd9BEhLHH0f6LzdC/ozJXM+aF+aSKUW/adobI+H7JeJdDxIx+Jt3o
         1a3ujUF+r2RN5YMTfur3U9F9GNdC5uduZ+D9uEcoRTYPw4Uple1g7B7tZD6G1mHuigsk
         +2fVoo6N3rZvUEKYlWPe+CTtNuP18OLCYKEXVLIe3V6dhDJUK1WwsoxUM1PVNjRsSBox
         e0AwNPHAooyZ3HVM0jxNfqzr69yWVOmFuM4Rp9TASGrY0q4tNV1FqJzFF57WbipUHQNX
         HdTji5mXmVmIo1/rXmf+iNWKAD0E+t7naGykBlYRii0tDnc99jTf3CzZFtwy3bzgKCV7
         a+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875031; x=1780479831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybOfpiqWajvH3os9MDhLdbdl0lEm7GdvEUSE4MFqraA=;
        b=UuPahJbBdcRYCl4TQLqrxz0sy2xbADYUjha3zQy5Si27InQuMMc/Eu8MTK45sSDBa3
         6du52sYErL2GlGT9BGkquH03Bv3ZM++D9Fv0iDc4TxudBXLPFIcdHZvUXPQt4R8kV3zr
         Jt/2OXviiDAtMsOQFwp+xwuG/dySvX8veGLND5sTsIlCaQRG+mwFEeVMe75e/2WAnwT4
         Yv2CikOKgcezBw6BZOaTnImTOPrzGTWgcvoioOyc0wus0tY28S7NhsH8eNZtONVRBuwy
         eX/kcz+IW96YG6C2LkcEZokFm9HHT3hXAfboXEqm6iTOusSYmM4BmY3KFkQ8eIC2+boV
         ljaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fXqp6X5cccCq0CbyLLl9Y+eN6ETxPFgGzkU9190Tq54f3l+ULx79rXOLiIhkuUTrgOgRgdhpe9ivZaZjN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7IT24K6Rs0EmhEGQXNC9veI+AkKFYBXjP3/WrajaBFbWlsFQQ
	q+Rb77ldj0fl+pOuWdfVtnLkNVI+MG/ajAffKlq0oq2Y/hYMUVZ4J+zbmESu+3Bc5Q0uvtZwlgw
	UXSlTDaeJ1Ii8oU8LiQqllJ1Ha101L1Sd9w16QThldQb18BK6eQAGhXpPQvbsbvqXJwpj
X-Gm-Gg: Acq92OEOI/rP/n/vvuU4DsigbqiMOi4EknzoJn5I/NpSd7nvKKywtFbjVmLkkPWowvN
	yR2lWb4ojjbQphlokCJnpPhULoQwMtcy005Jnlq+4nlFFksL7LWM2sFfxqazv1FBneTCGpobH9V
	6CPf0ahsvwsAl2zlTFqecxfiQ2pUUIB6nFeyfatanCnkrqFcZqigDWLzMesqOsd+ucmXAyj/6NX
	ng2dsoRb/h8/ypM3OiaQtBuEtZUp9+OyEC0d8+Ld6w/XOxHlOdoQ+h2nTUtImAlEvPbVN55r9Pe
	ZZqSZNWS47lcf+6zKAad8Sd+G0RvNfMo5VqWKacWb98dVd6ThojdBmfoI8KQovBiec1Ks6TpCB7
	n5FzCtG1iQv6BHHroHG6H8O2FvlZdhyV8K7ylJRMPoT1Xvcai
X-Received: by 2002:a17:903:2b0e:b0:2bd:a403:4ab8 with SMTP id d9443c01a7336-2beb06319ffmr247567065ad.25.1779875030577;
        Wed, 27 May 2026 02:43:50 -0700 (PDT)
X-Received: by 2002:a17:903:2b0e:b0:2bd:a403:4ab8 with SMTP id d9443c01a7336-2beb06319ffmr247566695ad.25.1779875029971;
        Wed, 27 May 2026 02:43:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 02/24] arm64: dts: qcom: sdm845: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:07 +0530
Message-ID: <20260527094333.2311731-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX5USsQIeWG7MK
 EQXcNLPkVwOu2PXo+/ZDUfNVsk0j6LhxPerLEgm3Tei+ohn9uifOb277cxMPMud4wqjyaesRZQk
 F4itd4vP5lIFhIqbBqzHh8ddfk3V3V87sClh9T+kKy4jvuW+BXdb+5sKyEov1OYDwe6Qeeu9yft
 n8PcKfXDh31bITP6BawLjty9zJry0wTm9uYXU9sQ9DPOdWUx/akPh69fQ2BERVXOEzdibBRUCZM
 pZd8rYw/by45/KUYYOJkFiLiEKptPMBan2zM6Ps1Ogl47HSbMPQ1JVcl/TIVT8I8UV8hGcJ42b8
 vERuIjfiXGGYRKtrxNad5zxe2V3aZf7uboO3l/x/abrT2tDLqEbHlY4dHBfiulZSf4Gk3hldFqO
 Aq540pP8psEjfDtzQPLOafThPP593m2zx11W4BerbIe8TXGtTPiXsbiKiikzQESVbJA+ep6ybus
 Bni/KX/2Jyngk7m+tOw==
X-Proofpoint-GUID: jkbcv63Hgw64i_z8FT_KBU68D2f0pQhN
X-Proofpoint-ORIG-GUID: jkbcv63Hgw64i_z8FT_KBU68D2f0pQhN
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16bcd7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iT1TFoq1hZWo4dtrjgkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109956-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b220000:email,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1DA85E2035
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sdm845 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..e9a31a5ff04f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5102,7 +5102,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc_intc: interrupt-controller@b220000 {
 			compatible = "qcom,sdm845-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0


