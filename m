Return-Path: <linux-arm-msm+bounces-118863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bz35Cbk+VWrtlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:38:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D7474EC53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:38:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YJNla1oC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VENVs3s6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118863-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118863-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D64C30F6B35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE272357D0F;
	Mon, 13 Jul 2026 19:37:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED535677E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971448; cv=none; b=QRyX4VMcKZqMqNfOzQlffVETdofafXq+icQNzBx6IKXYnHKkZXqutYjCFE27i1dWOcTZCOPoF3UGnvejrl3Prxnqzqt6ad4N26gl/WL+MUAiRftTMYM+FeEasHG1pZGws4rKZcZbb42emjYjP/rxkv4n0Zu2WrWyQjIme/b9fq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971448; c=relaxed/simple;
	bh=MG3sAgTxM2yS2k98bs7iCxw+/UEc3/K3gbnTW3sIzdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=edoycBcflKDwQ0KMSFW/AFsGU00bS0Rr9aMHvF/PDIkur42jlPmrYqRBRgJ7JWXDhIehpnMAtHRbUyco1ZYKkyDvVkeuHHfEyT2VBDEQ7qDaa+V/wvJ4EVBtWFdVvDwL21uObZwioUKlCeepM2z3zZlVgA8P+JFJ36wFRdcQGVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJNla1oC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VENVs3s6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9M1S2247666
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=; b=YJNla1oCkmh2/frg
	3NzRL+lxHZZHk2V5Sh3+gxiaa9sm+cF80ZPd5islSQqyjBB2vop7C9At2xxXz2By
	wLxgU1kcD8oWfGkD0itXOA0fVNvWPEvGUhV6qYvXok87FN1L1RNhFOhnIkAZLCBi
	pqTltNsyREvnrLHuP1Dlg6w4VsSrXNjJNKX899x26bVUGvVc2k4hWHfxWC3tCFOB
	JeyvBY/db+Dw7j1GzDsrgJX5C4VPk5UkVqzdt/GCOijMnlvFx2Uh7cC8hvmfp0jI
	ErM4RblIK3k/uvbs7Ho5jO7r3vIal20Iw4fPCke5UsNrFbbb0eerNUXweA/tlFNZ
	XT0pVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3jc4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso504209a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971446; x=1784576246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=VENVs3s6R34UVnQPBe+UCdUBLQHE9AYjREglUlLmrS4RSZ4uf5g2LX2iNUmzyNJPGA
         GBQHfIQK3/dtrNXg3nFjWVoaR77/b3Z25HjH+CEV2Di+SxQwacMrhY3V/RuDhs6BwWFO
         fKinw+ZQxbNiFzLC3EH+R9h6davGGTCVz50UOx8a2pWNTWPhyfa1wx1ZNC89pxhiLbcq
         P2dQBQCtIHib5bsOER5pQI/fk86SOPnBr1Tu/5ox3GR3/cMbzjLaiU9zYH4bc3mD7lqX
         FmIkDGYPP5LDbIhEksVOsqw/zOT+rbNLP58+7vRQHVX8RLJQPS65wzIzeGAZYj9xIuvr
         9ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971446; x=1784576246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=kDm6Pg5ThLWkY84jMKZ7vfkiNUZ/STORd/J0yFasgTsD2LeK/qla2HCDas9Oxcm3w2
         5WWCvVVJomtBYCIZy8njRP1v8w9tyGw3OoWT5QElbPZInoQ7NE8qTJ1F8WKSoJpeQCrH
         kcWmPwUFKpHEZskExxGdBQ/bTAT5XU3nePeQ8OAOxHnJS7WHh9h/XEvZKsFPwqgxh7LC
         1Byz1IPVT4PyA/TqZ8WUcnleE2Z020DyZXM6jBh+wVY2vmuz5adFxq5uG/VCGnv5kl5S
         nmR1AFc8IM0CjW/SQ0gKSuIwm5TAQYTR/T3d7uhqNc84pKb4+E4PJi1mxJbKqqxY2rfU
         cQ9A==
X-Gm-Message-State: AOJu0Ywl8CfDIl50LUcEcSJu0lewKrwk4VbsH3Tp3QPdxaWAaTSA3Qu7
	w887Wj5YWt6f2vN+VLmAk6YK0K7P1Odof9FCoy8BuD5b73Au8703QtJxPBsqkcQIKaQb0/Unl3o
	61jqxzkbGVWMEme731xlqkl0yo+Z9LBXRbu2ex5Wd6uTHxpqMmkIakS624XAB0APRdzTn
X-Gm-Gg: AfdE7cnrOJeeWYwOiJsVuRXK26s8i6b86oIHF8d8cbwO0M1OfknclDafohCAUW5qIhw
	X56sv7fCpJvjSZdhBO/l1wgAR93Xx6NDbiikQYqaNk1tdzd39p4u4GXjjkHGfSxIFMBnIAnhxnc
	PpHyGi+/p5kDGuFr5T8chFZNl3IyuZmdrkSbblJF3jebKXJs0FTWecwQPSlJmAVkqP5qZ+CmHfq
	/uflVVuOoymmJmlOQBLWY/ujLIpstWtK09lxkoTOUtkKrhvC+CylsQ+t1dOz9SoNZ3wq3Co/sPD
	SYb14mWJhlklnmXLnn0DtpbvdzGuZBTsFIIckCEnmxNpS3LpsKjmdW2oJMg2sOCVQhkcMwfWa/Q
	oMiUH0pCSOffdYN9FoTILYcr5Ag==
X-Received: by 2002:a17:90b:35c4:b0:381:21c1:75c0 with SMTP id 98e67ed59e1d1-38dc74cfa71mr10093758a91.15.1783971445822;
        Mon, 13 Jul 2026 12:37:25 -0700 (PDT)
X-Received: by 2002:a17:90b:35c4:b0:381:21c1:75c0 with SMTP id 98e67ed59e1d1-38dc74cfa71mr10093727a91.15.1783971445373;
        Mon, 13 Jul 2026 12:37:25 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:24 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:52 +0530
Subject: [PATCH v6 03/11] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-dt-m1-v6-3-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FgXZj7vad2zgvA0RfnbjlrO8hgDk3pUjpoRSx0IOZh0=;
 b=ohJI347iFWs4U0QCz24SLyaswuGcNatjjEcjZ0P/Z5bStmRHOkpTD1QghBUSqS6AW4VqA/afb
 NMa8uB/KQEZBospBXUY9lZGnuTiWhQQKjydmq6jMo44RFV/g51mTMx9
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: pvde8_hb_nKuf2J0C2vlOk68hVSE0tjr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX+ktX61dtycXc
 3w66YFX/b8dtyC6JpIDY4yKad1QqewMcRGDj90ooQHvwFa/jbZUTAGGSMSFR+ciEN7gzkdpA/ct
 lLyy0yBhDMUTQzdCFYJc4/XyF5SSoEs=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a553e76 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfXzbc5vVIB6rkJ
 4oloOAWA/mEAesqzxUroqLybWa4vp/ebaedIC88nDuhagJB8FUTvrFuO9r2FlkOaqT+EdjsSlm4
 Ma+FcG8Rx1N0oPZHH2B18NPLYWsWeIcrwKWj/ykR19zTOhpUHcoT/x5B/bpTen55AW/z1hp0Aqr
 vdIjce4Ha6TyCvcjL5Uz7wAv8fBUxIqP/FPuaNGPjT37xOLcDJkBB0UMBfpUn1ypZGfiut2bVuE
 eScxX+jeJlSW4IVpRUSvAqluTPkXnnCHc/deKs9YK25MLtYK+lzn9QDS+kxH/SXJyJZUXVtN0RR
 f+LmPbLtdEajz3B+MU1xGjBosjG5nz3B16hG3CE2QOAnhsRULvbIpNgxmn0MjSGdfRIUaMmNjG0
 8ZnBXJlbepUdBobIgGX5us9Ml0o0rWQR/AMVqZZ+90WzRod8jdW05WrcyK1CTuBtRkSJVQS5wjH
 y/W3G1RJr80wx4mDm1g==
X-Proofpoint-GUID: pvde8_hb_nKuf2J0C2vlOk68hVSE0tjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118863-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:sayantan.chakraborty@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4D7474EC53

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0fb55b9deb9..d66b97dea319 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1


