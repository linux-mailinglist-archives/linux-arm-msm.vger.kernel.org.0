Return-Path: <linux-arm-msm+bounces-111908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id knUxBBHPJmqlkwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:17:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5C657102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:17:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OC31Rygo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bNCDcJ23;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111908-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111908-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D932F304B540
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F513CDBAA;
	Mon,  8 Jun 2026 14:07:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACED3C8192
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:07:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927640; cv=none; b=p5l/c4DkFKhn5gHjb6bG/zIt8H0KSdRzoX2I6ll060cpsoUpYXvp5fb6gAFdu/C4a1xmqPLdAKb5A6SESjJOuus5J8OWIFERHb6opR9RfU2F17udWuvR4nFGJerCqbq2hGlz94oEBvpxxXFHj+B6Q13qVmDbcdDureeqV9qW8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927640; c=relaxed/simple;
	bh=ldYjYAGXo9AsC38/Eko4nOrSCJF7kUU15KKBuwcyPE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcEVWZqFz7B+egCbQFaSLNc9SMyzk+u5ZIFgUI1ozGbmOOCpNlrdECveRyHhKCm32+0mK+5Xve+pSZa2qaoBvM97etopPK61Q2KYSs0LVr7kNgHLfC8lzBsnaYpxMQU74Cn/SLtFjiqZse0RL/gicd3JoWJxHIb4noen24/nWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OC31Rygo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNCDcJ23; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR3Yf3346718
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 14:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=; b=OC31Rygoa1cYQ7UK
	9AstLNJhmhLKmaQa0VOgF/+XRdBFUCC6UwS9wyV/Ktb/FolVJv2qtrcqRBUUKEhF
	vrky0DBCWlGUYjlCFT/IyMCgbFBN35Aw3nWyzA4aWzjQL6BF0wrTbY/MswV4R6uh
	f0pijpz7YoE2Rea4fvPIRjDUs+fdGP7Ltj0xxkfEXfHTP8WnoM7ermmKDDca1Rhn
	6bID3VorwtqOeOXbsP9sh1U1pRZJ5mPPEiP4x275t++Ds33TWXvANm5awMSgBQxF
	/B2Vh+T6t7s1kY8jxEK1mrzk1NEfSRsEq2wEtKMn201qSygK5uX61ncJLtfOnUIF
	4MpTcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8u4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:07:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf08c2a24bso41971155ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927638; x=1781532438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=;
        b=bNCDcJ23DOvD2qBRslbnMB3+nETwx+y60mYMZrcH2n7BlLK2FP3PFwD94u4n021kc6
         wpSNsgCa03/eurbdGG9cqY/mBIBOAiRfczMeXNJ5i04EXCpVuNGARTUHAZg6B74wtaHc
         JkkiLgfsGmVkrYzCm/8D/cnnsKF8QtC/tN7HeZmiXxPfAtZ2aOFardzr/XWUmg5RQeNl
         d/L1Yizqyk5rCqpvTfVp2XhMW2bsiDfBi+gfCbrMoFGf2kGKo6EycHFHgy6jaYC12NJY
         eG1pvsgIlgz1sKXfwFSwGSA47A5ykxb1BgV0nhnWl3Gs+vKGX3vitWVewLNkNa7ACGzL
         FvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927638; x=1781532438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=;
        b=DqXzvN0F8s0oGg54tQEMkajNFK0dFYvGUUavbbJDOElB5rC4RrhHVlNZ7iLhkOVb86
         ou9jhQXoM7n8NpatCyXCwFG6kI5Gzi+nxxvensH77GiICQvqgSQ8xQT55L+oCUN13IAG
         ZxdZeIJ7VNRRHsd4fk57b8GZpp0Az5+P506sKWoPltofC3q8kLAuqIrHPViVpg1xpIi9
         uoohJKMr8n1XONqnUN6Aq1C43Kb7xwt28fW2PN1E9XCtO2desOMFwsXjB2apcYv1Wnr4
         V8Ws7ay5SaOSPLZomoL18t7a5OHkPMocqlhBfLXUwQQ/V/s2hK1Sqrm/hJzh7LtzPZQW
         JzTw==
X-Gm-Message-State: AOJu0Yz8TNDU5dmWQac784LLzWI4beV0GbCh7WiRnJr3MHJibQrI5dM/
	Dd3EBXN6YGjS7a5wuWTd47xRBKuon3j2OfMFhlN6kF5wGUNKo8i+6LVjqPrXci58os3DPzE9lUo
	pPQaQzWdKchFjLJRUCoMAJkOV9JyzFvQduYnja8thdSSJ/OtJ+D277kNdpD5YzfEAGASE
X-Gm-Gg: Acq92OGXUoPXnG9O0yXBxVRvIKDeasmAfv2ixsDz7VbtTBDm784bS4SVxuBdROdsYBH
	i+5XXKCgNuPyXVCRBKHWGcNTu04H2D/D5EA4jDgXRE3eDxGLzP1SWVw0ttKSygNHwL16Ae9Vj6B
	BjnSuxh1AUvoFxOFwfSzAmg3XScvtaH1sSggT4Em8a8CXdqN6rS5U0t61vX9IqzQrLIlw1dzlSM
	tR4c7kszHjtRaBvotIhQXKLk5p8PhN43aFL5+/MVKg8bIceN/JtlCeEb8iiJBaifmU5J4XbaoKA
	jmBTeQ3vNB9pc6/hR5DFYW1vdlN+Dd7Hvlq+IyaJIiKCS5KqXAf4kpnmoILwfEHULXg3zPLy6BZ
	DBuIul1wtlm8CUsX3SrNxDtivP5ycJ5tYGrJ9u67u8arN6rMg2TbC/CmaLRznx40=
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr187867345ad.5.1780927637559;
        Mon, 08 Jun 2026 07:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr187866695ad.5.1780927637093;
        Mon, 08 Jun 2026 07:07:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:40 +0530
Subject: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=3808;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ldYjYAGXo9AsC38/Eko4nOrSCJF7kUU15KKBuwcyPE8=;
 b=mJqkPYbxbRsScJQJpieQcSgJYF8xfF4BRtw/Lj10jdnv8SKIh4KRJCE4LdjY0kpg5zUwH8pNn
 /0Xgj0KhF9PAINqKk2urbc3bNU6KqB1yUijwzwn9HrUSDaWSKExfPm0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: HliLlC8ucdeCJmu98EWL7RX7vDsUKcOU
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26cc96 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7JZC8XBhqYczC4Ahd7wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: HliLlC8ucdeCJmu98EWL7RX7vDsUKcOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX9ZLpquF52Rwe
 Vz2Z0WKJ4Q0sRu/SGG8Djl38Niukjh/n5oYxwbiCme/9zrakrz/N+2iZWIafxTG5kTI6GEOl3+s
 0ntYJeqSta3sXWQC37efYXBx0Fms3ppQbfPeLaNt6qy1JNmjSw+S+PevMspAU01V6Z8CtV/KMjK
 wFssrpD0lWMTA4MZq5TpdQi1E75bdaUv2n9xQfrgQu/l9juIXGBr3MRfy/IkriXr3Sn/UJ1Bdi1
 bwRSBMANEMlJll2gjURB1mDhHWodwDNMyIGVeryY4A7/7Lw0F/0nFtQ0ke2HaU6lcHyOWxLDGSg
 pqzEliE8H0LfzVxxELorqHT+hm1CHiXyD/DVgJDVeaTnb1yk7UchILJRNCr9UDRwk06TVcVbK5G
 k/ayK6rUA1Kyfq+/ZmwmhArl4JE0Ddisj76+gAMVjuJYb8pM0NeHyGpCHL4Gg4Wt/8C5jlWin7t
 BDH8ooMHIabCh6VybjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111908-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79B5C657102

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..b93ce4a92a998ea5d9d4268d2fd46030fafc4084 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,105 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


