Return-Path: <linux-arm-msm+bounces-111025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FyjMIaRFIGoLzwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:17:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D76ED6390B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:17:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Sug/L9WI";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wun+mvBn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111025-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111025-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 657EA30F887D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 15:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195973CBE7C;
	Wed,  3 Jun 2026 15:00:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16633CB8FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 15:00:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498817; cv=none; b=TyZZsjLNAf5OSU3ZGNM87F92YBqTrCoxl9qa7f1q0Zxi+eY5ZCjUmQBR7+vn73cI1PMnAxYjZmkGzvFF67Kr54X5bbq6iaD7s99b4JtqpadIhPfs1epOgyvdu7ifUgOgLZ+emtrmnn1vMC41U5Hg9IIPxsn1+lQ1dIY9G1HMWSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498817; c=relaxed/simple;
	bh=a7vBq7QV/0yauiv4Qm+n0KSEd9tQP2btOuvl9/RRzPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVHktEjZ7yjmcosOPfk3zMbY/WSLpqCSpmqKhYleaYmBKhPRUHrVyQOcbpd2UwPv27x1OcEw8Raw3C/T0YxoB6eBjQ0bIt0Q9dGoOIzFqVH2C0NMLJhO4xUzeEr6A7wwKxjcBFluIfiqGAcqQ5jlKZYei63QCeIAzxR4uIadW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sug/L9WI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wun+mvBn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EblHL1476841
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 15:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=; b=Sug/L9WINtQNcSA+
	VWzI4NBOLDJYWHDxbR1Q2y52ks5mWmpK/zQDBuk1kYiiuIe749UqP8HxcnCXSNfF
	+k4v1Z5ISAxbWErr5WJj3qbI83sK0npm7bm3T6/lBt8fFS/a7ke9CeXLBm0KUaTr
	ITw9IjYS2woEBFMtwqR2B4ZZHW0Euind+QTa160zVwp45K2jPM3h9ma/DBZDwUPl
	r4ZONSuc0YhF1FprECN2KA/DFYpRX7pLFZXHWuZcnTzLV56SVYM3fvcYiYIjD52T
	EeB2ULUr97u5snKtDVXW6Ig6esFb66y+3cqYs4GkTmfZzwazR/qiOlE4vd2mBwP/
	ym8XPA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nr3e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 15:00:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842208d5b0eso3387364b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498815; x=1781103615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=;
        b=Wun+mvBnaRY3QT6PdcSO/h+UiQkiR+AWL5Wy5niYC0ecLnQ2jjtsiU2fhe6RIzxIQu
         tr3qQxa1CaTYnK/4qjlxD8ixI8qGXzLUauq/47QNKY3fv8ow1oPICZ7yU5fgkGWm6iay
         1tQd3TnnpogyyPPe1aVyYjbUVSJ3lyAcNlBeCv8mbbHhRbZSXPYf15HEXg1NNhSJo9sW
         AqeEQ1VQ9Z6ERbBkZDFXPihYi62oiQi2QUY9DFXW794MkNoLeOVkgyV1/BHaQLNF0FVI
         SoQ1Kp9gZ3xyq5j86knNgU/Cy2CZoruF7OPx6lI9K84YhVsK8OPQZRzd97RolhElB5Oe
         6Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498815; x=1781103615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=;
        b=geOMHuFhCkZxHT2wEeKvpXIqLLT7C8/cK25tPopqIxGYY9jfRQBVxPxY5M964SDP3s
         oLRzEpI54/1Jz5K/cr8J8A2MBn6+H/y5jq8edH1ntrpCLDwZS5rBcRJS+c2oOU4ql0Z9
         tl3hF/4fnX5GgHrQ7A0qVMFOJ+m95be6Mwu4hZJAFSsWsBkOLeCk2nffQuQDEWJXfMtb
         vaV2/jwgKzA0r22EmOhS4IaqgCe1X6aCQUTV73q35EBEcO55I5w4wkBRW+ssNHXGpMXy
         MpLWsZNzb9iUKybsaT05ThjOaBJdfLthQFNW5WbjaUgUPsidO1U4BUG27ModgroEQDYE
         80iQ==
X-Gm-Message-State: AOJu0Yz6EIZksEL3Kz3JiTz4Idd+RLCda0n1y5V1K9rFPT+lKqE2Y9xV
	A1UhsQRlc7HVv+k1V9k5UgJsDSXik1VE16zospslZYP4VIy9f1GykuMKeXPN7iSUrmPgqScv2MJ
	bV6x0qDNd9hzrFMhCICpw+QIU9vL6Adf7GMno5Bnr4yYhCcCpU74L9ySEIC8+7DHHnIk4
X-Gm-Gg: Acq92OHly2pxQakaQJQLgzARn3ENqZrANlZePFSgfJZEF2b3o8QOpOKyns6RWbIKmy9
	oE/D4FdVKN47yola1psqwU1KoVrw9OFyuDNf/dFENVw5Q1T4RXxR6y0Xk+S9Ss+5zeY1bA+ZVMn
	LBk8QRuF0zITRRQIgH5dK+Ba+qXYVQ8+2dC6TeIVbhxYmiMeVLMpaPlVKu/e5OiCxIJgR3Q1unJ
	PHhgXmKfCTFe32EJ1/pyldVFe9pvx74UhXpeRVgBPrdPNNA6Jecm1hiBMqLBcsFFuTeDRKtRU3u
	MpV54lbadTE1rrjIL231m9H25c8Dngn4+r9xjLOUZB4W52UvSm3d15RQ0O1Ov4SCG17c7cy3tuw
	xiqEUK7dQ2pBLoPXj3ki2ucslwhhXNI0sYaZ8tiYmAokOX/C/2FSKCN8AXYk=
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr3771924b3a.33.1780498814409;
        Wed, 03 Jun 2026 08:00:14 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr3771679b3a.33.1780498812312;
        Wed, 03 Jun 2026 08:00:12 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:29 +0530
Subject: [PATCH 4/5] soc: qcom: ubwc: Add Shikra UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=988;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=a7vBq7QV/0yauiv4Qm+n0KSEd9tQP2btOuvl9/RRzPk=;
 b=LODbReeosUf6ztstgUJKlWgizfw2G5LN5Ygs4s0z7okzEppVrZbtrF8DieJuyRHJDpr2KhVsO
 X+HJ7VKFlFUCz+q/m7DTxr52OcTpVegvlvq5s18YKs1fSb0RScsxD/X
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: wO5UPenzKL4dD72c4BnLHzT31TU_5V1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfXy/o6RpITRRNd
 kzyaz24rCT2uktffFZKokzptkNRvncf/A7NhuqYeIaVCBU8hUc0A4cJfa5iTMIY5Qjpm7hqK12j
 097xsZL97fJykrLFwoEpuKyeCsqGQVZDoQNU3vonKyD3XSZWwd4qA1jhBr/NCNFbwtdkUcenlBR
 HfjsnGL9wnUy4Xt5GEnDDtsoN/ZBi4kKYMKKLbv/bHtbLN4EkvUFZhbVcu3UCwqwEpqoA31IGB+
 14/2USq5LWnk1PctglYv+7Gnm395kc1MMs7qoqJxXXkbrN4dttMA3v0oiG6MpL0CxomcApDYIH4
 5CiW0UvFg38vbfACjY/0bhi/tZXOlKw2sfDxGA5i6FufoLymWt7UGTKNZ3BFZYi/k7qX87cvNPc
 ce5r37fA+C5Lop7hBcGY+9bRfLMxb+SNyn6mTCTksjcxF++AvWOkYmq7Qooe7S8T3pmZREsbAYr
 68CoejjWjwObksBUDiw==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a20417f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4nfEs0z1Wzubab7DKycA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: wO5UPenzKL4dD72c4BnLHzT31TU_5V1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111025-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: D76ED6390B8

Add UBWC configuration for the Shikra platform. Shikra has no UBWC
support and no highest_bank_bit setting, so use no_ubwc_data.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..01dca97e2671 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &no_ubwc_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1


