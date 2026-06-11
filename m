Return-Path: <linux-arm-msm+bounces-112588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZkBlOaxDKmqulQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:12:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A266E6E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ETHnIXyQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PW7NHGDe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112588-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112588-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44BDC3340DEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0762362157;
	Thu, 11 Jun 2026 04:59:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B549C22A4EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153994; cv=none; b=KWxNI8BGcoM4mJG/9Ky8ufN8mqkUxzC6bJ+vWjP/3xAot/O1S1qgKdKKsBS+keD0l1p5Ei6cEieTo4LELvC30hWH7SRp2H35MleaOBMQz6W7e13SDt2p6kWVwjimRz+tvb6GG66HW8gbja3yws2x4P3BRlNv94FbvnuCbR/zOSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153994; c=relaxed/simple;
	bh=MB0nViV4TvVTTFohe7gXC325DBwjVk/OFHUgRfGnU0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZmf7/miNtH8ra9wLZvwV+na/7w0qf8HzflQt4A1mUoyOygWnReM/s+XUFFtOppl5jRWxg9LpTkAuLQK3rLe0eeAzifFmg2EiM7Z8twEvYkPyon0CFk6hS5nCCQ6fxCnS7QsivlWHhuVmf3oDSaHZdUMiZNVn0JgrW7mxT0yDnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETHnIXyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PW7NHGDe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0OLJj3214260
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=; b=ETHnIXyQmMj0z3lx
	02bjJdnAmmcUz4t989QHSJuJi0Pq+dRcEZA78WdOXnJtTugn3ysNAwyl8jQ/ofU9
	XBFNrD+/bO37P6eFFgU5e+PVXi8eB0OxsrUGLJmIVzNQaOIf4C6/tVwWPkKMRFMb
	ow6PKinvX/LUqZ2IJRrABKoptkPgllCPC0hZzzf5JJIX++CUPdaEmY9+4UNoDP1T
	VRwdlCot74aLem4EaLbc9oM6K70s4vi2RaNQ9t8dULlwaA1N50Yq2RnuCtkD0mMU
	Pc6zUTuSf3f1oN8KBl+wJUG7O1+++DNXzFw9+cnWvAc+N9fhB4WX1TtGu3g+Hub4
	PmVDaQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701nah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2b64850easo36762925ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153978; x=1781758778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=;
        b=PW7NHGDea7g3CnFpeDc1lnWPOlwZTXflTC5DKNikmQQ67PvVKpPK3dOcgFL3QvXdaA
         2jEtMzQrWGICiO18rF/2VjyN9aJO/o9Ptrm6zY7Mg65HUHIRkgy88Kh5EvvSqPhkeYGj
         sIThs33R1Vg1J31oF7tSCVAj1M07cGiyOrgzQVwaPS44iMlZlgD8xlFwuSxOAOCDw9P9
         y+b4HjCpStI5kYu4gNAO3VDVn2tvPU77I4OST97Z7iV6amS0zta+nj67SaA8rJdRhRbw
         E59s7FhYe7Quc4VZkqeH4vtILMx8YjBzN6XH5ezS6k5yZ/0m6DUzehuC52P6/OHy+Ims
         fqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153978; x=1781758778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9wUwDhg3dsVMHGU8J81+cNtN8Z1vmBifp1XZ8s57MQU=;
        b=mMrwjTNbPop+NTcPtA5GXec1nZzAzFNZiSZ7CTHck6VZcA2czLIQaueFsnNY0xG8ws
         Eq/Ss7WY0oDcaI3NLjT4uy/4r6mxMtUJshzi2mg34gswR9TCJPXKiQac0fuEVYGoZHWR
         F4Dl5tn4lAUnd2wBeye9arxq0UX7orcaZTLQBn3FTUenu+JlIiOtdRx/oEDAph7nE4yk
         k872E1xSsZ3RuezSvpYCNzmsnO05PIXafgpBm2cwGE7DZtKSHoOI7jKWs9oIU52/1Bza
         7mpvOHerClj6Tr5wdyAfpDCpRJL3UVKUFxPpd6HC+l2QR0gMKiLz5npPRaPRJc445ANj
         u6SQ==
X-Gm-Message-State: AOJu0Yx2wKqVyWLVqNutPtRlP5dKqez61aIass3pRWMIZL2TzNwcUMl7
	6/LOBb8ReuRa69I48X9qsIuF13F4KhtChcfRYG85FrX1ZRxfgO5vSmGfnGH82+pAkM3bSFOR6PZ
	+fGjoYTWbzTp0U6b/VjIDc1F3URPXIKzWzND9mw+ef+BnUN7vUlycrSnYXhUkW0NSROOs9ZEyA7
	Qp
X-Gm-Gg: Acq92OGf+8yhliAAOGl/wNwHfeWKFXJzSLRl8WdX6ylXve7U1EPrn5MItQmWYZwQTc2
	QDk9tJayHfd2l5Z0Mq3olnTYUiFrza91Tcp/RgXUflwvrPd0XKYowAQp8naNqPzTbwYAk2N7Oq9
	9mruMqeylzFe5p3Agli4/K1cilAIINImg94Vcm0T5gB3+/1QbyI6mfH5X1DzsHc6p9QvlYeFO3m
	guNeEMU/mxdzBwVry3OIzJoTNZfS4vTxkRridsKu9+6LezoCjxNDakRnl/uCiRqX9ZV6ZAkEgNt
	QVAT9YUlWUvWpEXvl62j8Yw/IHHxzwtaz6cuCXxTmILqyF1sL24eJetSrG4VWHENg2KKm46/CFH
	D9KbEuPOUY9ztxuSmd71tKx5POlvg5oW7htJWVKXaXwKjxZc0hpyonXOO3AHq3N4bgkY=
X-Received: by 2002:a17:902:fc8e:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c2f297d57amr13980015ad.15.1781153978320;
        Wed, 10 Jun 2026 21:59:38 -0700 (PDT)
X-Received: by 2002:a17:902:fc8e:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c2f297d57amr13979835ad.15.1781153977896;
        Wed, 10 Jun 2026 21:59:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:47 +0530
Subject: [PATCH v2 11/37] arm64: dts: qcom: sm8750: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-11-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MB0nViV4TvVTTFohe7gXC325DBwjVk/OFHUgRfGnU0M=;
 b=WWOhIuxKJLuog1Pmn1ccnG1/brJmdzs+6DeRrViN5X+2fVfCnHzhP9BYAQtzDyErJCkNO35fj
 UzUc+TNh4k7AGyI3rskES3V7JStvn37k0btx66mT3BmsgPFY4uoyOEC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 9uO4q8LMldoQnZPijzBMtvOjaoFEXUt3
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a40bb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5qXKZxjc6dN8
 2KvmtxmhkUaz191+XZfGt2d8nEPypDKQS2hT97b/qsH/oD7jxB1nW3MEkS+KnkvagTA/QAFxc8N
 n/S5q3onvxtu928lLvbI8TMsf8Qu8h0BeNcuw3FWlGu4O+wUHld28Iu4joIxrl0rrRzY3LXdbMr
 qtNkczyjgMLw8OVDVsl4+2/7NnXkUPgcuNHK+vVe7+25gsKoPcnxI+LhM0qxczGnqD31otPdIzM
 KuosZssa9IRJ2ogiZM4EU9q1LWMIHFBJGGqp8WIyYNZq+w1Nv0LNR1sK7Sjap/QuCDzAlhK5TGG
 EGznJdgRylIwDlj0321e0diLV2q9/OAjCUMBvALEj/sbeKXEo0tPvci7p156LIhI9C7Siy+JAMh
 noQrx8CoqOVfprhdpaAGtbP0De7HQ9AuFrx3OhUctjtlHFSh8G601xq6HFUXWikXN+OrIyVkqJP
 lJR3Y5dPuykuX3K0RWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5iReGjynfT8o
 wD1AjCljCPYYAal+qN7RTCseVwuJQgocCuLnOxHFlF2K6lGG3FzPKgVjWXSmU9pfzUFTJTQJAg8
 1bRdnEshgNXgOKmsTN/sP2Y15/feSFM=
X-Proofpoint-ORIG-GUID: 9uO4q8LMldoQnZPijzBMtvOjaoFEXUt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112588-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A9A266E6E1

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..2c2753683c69 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1


