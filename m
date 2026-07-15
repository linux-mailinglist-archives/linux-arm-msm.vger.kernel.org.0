Return-Path: <linux-arm-msm+bounces-119258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TjvJH9KLV2quWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296375EB47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Eb4Jsflj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j5ww6f1i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119258-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119258-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8293D3071ED6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951C343A81B;
	Wed, 15 Jul 2026 13:22:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5397544C66A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121764; cv=none; b=q17UgNm6CWK3eFNMNNQIpW0vL445isWTtcPNw7w6/DBUivENsb6GbLHohQ9e0q/nl21QESsNaIhIX/m6tFKl3mnzrYbk1xCsap7WapcJEhzNFr1qzolCsYjft9c2iszWcd+lFy3cAfcdmTENsZqY5C9FjDxPH9H3eqOvMIUhgXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121764; c=relaxed/simple;
	bh=Oz+KcnbdIAJSeNLoLv8z4R1oO2JdGJNZkGLneFnZ66g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpdATM9S5rPD+qdow5qyoMpfKwXr4e2qnc6ZYTFJZvNMjdACQrJtdHI2EqS78hd+75uHmfdTlr1rVyEBJs+yYm9QSKZpJ/HF8u8OL9oYwm2RzmLYTcTeBKLjuZmUP1GaSTk6ayRj6sWkwEOOjWWYmwMS57iwqV+VPMqGxXM+6Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eb4Jsflj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5ww6f1i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcYBb3678209
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBJsPpyNoFpjGBwiW5XjgOxicDjmq976LV5ESHz4EUs=; b=Eb4Jsflj6tPGJjEV
	TknMbpPIPkUX5UFjEUUqN81cljIhr3TFl49wLoVKRCo6eUZI41gAZtXBdNkaPrK2
	Ubc1SFbHmPSRxSLBaVOcmh+EEpLI0N0r+fcSc9/WmJD9n4drdZGVL4V38XrnM5KK
	+Gj8ZercmX8p2qQQWcB3BRlny6DZwQRMNljCl6KjZZvlwMebbn20Blu2tlE/ob05
	+ztnvw2Tv2fVmTq4rZV4aZ2vVRV/bWhmlBzZuUTkJFo1N/e1AbkyD7WT8OOSgJTZ
	pg3CRcLNY4/9tpzWMH6rXopbMM02MyZ+2d6F5t8embyEC+BnkU9l6tiBx1aKVseB
	YNoZfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe65299v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6a2f5995so884934085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121762; x=1784726562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBJsPpyNoFpjGBwiW5XjgOxicDjmq976LV5ESHz4EUs=;
        b=j5ww6f1iqnEN6083ob8uYp4TiOAlYZFDe0LxFt8ItpETRiHJhTKy9yoqz5tBTCfcHi
         4Czm4noMFrnl1Ql38AVyOom1f9l/XLum/32Ils4eKoi8R5ew/UGVDFHIVVqDJ4mx/Bzz
         ECYK/dadBYUWzt7GNeoJMYwwMSa5wofMaIHpXqkRnIXfFHrXRICtlukmWKZ/noq75TCD
         C37OTeUEzhEeG56t/xXg6qO6jfCmV2phRF0OWfoPcdEV/+KahkDJmAukA+VmcBtpUwFg
         BLu560lPo3O0HPEvT8iyCgxsiLHLCju93kBucO007aCNGq70EP447vE9KXN30rWYZyMi
         8Z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121762; x=1784726562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBJsPpyNoFpjGBwiW5XjgOxicDjmq976LV5ESHz4EUs=;
        b=pZp5WR3BF5LKE58HJYVMRsJZ3xk8sS3zUBSaEHL7DdNNIaoG5EpHPPqFLZhWyoW0B2
         X4GjKiTRxH5xaoltvREWeOPmXt6yYlsQRp8Kw93r8YzvokacVk6joj+qA33p+jZ3cI1s
         TLjGyzvDTCliV8Rn7V6O5S4BnHklalva9KVooC3KlRxgj8XPhJ13idIXv2hlAbknNJgp
         eiHKqDhdMIl0mUJOaeskwN/M9Gt3KwcihZDbs9mXMtnworJePWzHTFhsymFvyBSPdyNO
         A/LGVe5T+OFgzyKkOr82uTwy2VXmuGDTZgfa1pLOZrUXl/kAbJ+OuNqFIpnuczWFcB/T
         aqfg==
X-Gm-Message-State: AOJu0YyQDM4BqAAmk+m2OjoLg/xRLMoPXK4xPNxi9b/69UutR7pdM37a
	fPI2UKjEMbxv4a3mjMJEDLZsoQXt4Gd2ghRTp2y6ZzWzqItH6wfniT1M/YfLqyP9M84Jkodf8AG
	yCiEICMizwI/AGEsjQRoI+rR9jwKWXTi1e7hiz08+UqXB/aq7RBJ6M+5c6xuJGC2x1EBa
X-Gm-Gg: AfdE7cnc76lnuSOJIchVYXFRmnQqfCwFWeEYZBqLOrxakfNIt/dOpGIUGocUoLNGTzm
	x9DJI9txDpqC0g1uTSsvZpjjbDP9CktJD84KFcvpxTX8qGdTcXEh/WkHVJxTb4UnrX4OALnDwNE
	UOQhu2uAdqqVHYrfHLtSQue58jHr9RZRoCgTOJ1WRN4b7UpFrDCWeEyCOYjC/OZVaHqgqDGo+n3
	JKe1svU/ZIb0jYZHKBa4yURmdR1ovS9VmfuAwCqNHPW1FKQEE4M4nYV4bSXOqLgOSzD8ZrBsB67
	0PSt8C61N5AQQCJlILclWwuLq8vReN/k0ohEfJM4gG2RatjVZ2vd3yaDQWsbuzWw4Iyxl/fxArk
	/p5VtRVOi1v85hcNK0IJsMggSSlKZ9EKkM3QiRbo=
X-Received: by 2002:a05:620a:460f:b0:914:cb07:447e with SMTP id af79cd13be357-930961b5e5amr252127385a.5.1784121761737;
        Wed, 15 Jul 2026 06:22:41 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:914:cb07:447e with SMTP id af79cd13be357-930961b5e5amr252123685a.5.1784121761345;
        Wed, 15 Jul 2026 06:22:41 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1773676985a.45.2026.07.15.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:40 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:52:01 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
In-Reply-To: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784121746; l=1193;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Oz+KcnbdIAJSeNLoLv8z4R1oO2JdGJNZkGLneFnZ66g=;
 b=xL6lGP4Xa82WCOnn00X+w05nvL0abQyk6xI/cAp1XOv7MPhnfZqsyrd6LZ9Op1uKJk4psHz4n
 iCkCgVX8MKbAowvZYshBqGuyqK84PUnwHsb2GREUTlCf/b1334+czG9
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX1/lUz48r6r5O
 LjEBNFhM7h094J1enTzUsLMnGs0gzN27bzdxV6BkCuD9w8jtSwOdOdlY0fCOsE3gMWQM6oNAz1a
 g8O0LoYp4/flwtodbdmGZoz6TiRXsE46e6blCMsSqYUP2oUOppGg5GvYVW2PDJ5z32KjycjuOMN
 ZdexFhl9eLUsxDlZxPoFDbV/nos4Ry38iuDOuQIY9VSQgMlvX8L0nGcGGgRQ7moT/OuKiui4N4u
 TdG816C9ddi0Ae+OB0G0ri2Uj4znUD7DukR0TEu+XrxN/OnSuy7PBloOjZJxo6NDni1ftadcT+A
 mYAW9rhTl6kEfY4ZkW5KY0Pz/B3HPJCPw4Le+2DQUG8hH7TTbDsNswsd3ZoOuITAE9VFFRtAa6Z
 nuqcCxEMu3OusbbnnRZvsH0pNn3vSwn0eHJePWIf0yMeHn5Kx4Z+d2CL/64eUq4qdvj/BwxiDYx
 HdxN7JUJ4MdxIRQ6cGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX1PoS+eq5L6S3
 2cqhiafIn+EdM7oyP4VOyVx30d1/+qZfaL0Kd/GpLs3TQr/cWeQd3VR4+QPpMFMWgp0z7qKTWza
 3rIVtVfDwm1Bb5B4o4S6Vht3LC4AjVg=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a5789a2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KMss14f58ScVH1AqMRBAMu2TMmQuwgiC
X-Proofpoint-GUID: KMss14f58ScVH1AqMRBAMu2TMmQuwgiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119258-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5296375EB47
X-Rspamd-Action: no action

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Use the X1P42100
specific compatible string for the PDC node to remove the workaround.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 3d73d1211cd0..591a89098a62 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -174,6 +174,11 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+/* X1P42100 PDC is same as X1E80100, but without hardware register bug */
+&pdc {
+	compatible = "qcom,x1p42100-pdc", "qcom,pdc";
+};
+
 &qfprom {
 	gpu_speed_bin: gpu-speed-bin@119 {
 		reg = <0x119 0x2>;

-- 
2.43.0


