Return-Path: <linux-arm-msm+bounces-103298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIfCC/mT32kiWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:34:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B01404DE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BBC830A4F4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012993B389E;
	Wed, 15 Apr 2026 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDsKW/Kp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFiMD0eC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25803B19A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260023; cv=none; b=ZEcIpiaeIZbjxJ57E0dswPbHdv+uHn0voOebdn5AIt0btK8cq7/v/KgXhUlv2+sH1fIUW11YzbZ+0wIBWlNbvTEQshuwlMQaWte7HRFiQ8YRdfWqvyQV0O5NP91R6seOCGfrzbwDqu1s8QG/kD15VAP07HVJTJR0dlSRL54Ceb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260023; c=relaxed/simple;
	bh=I4o6YNZQCCaDb7FwnvdTnwLu74HAplwTsh6AV5Ejy14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBjeOsSOsTIBvWe10XK+d3kgnMElVp/+7GVgyxJ4qPLprPWcB8SWXEsgT4c2O1Bzu53t8I5rUdh3Gb3xROOA6FNFqv+CJmMwI+k/sDpyFZrcCy+jtEKSvOkpWVl7EMzAccKKm6tCVZFav5/Puh4MNhNktMUIYz+EmIsHT8zd6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDsKW/Kp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFiMD0eC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F984A34053105
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=; b=SDsKW/KpPp2Hiu6c
	gcdlLl9u8QMmW5CFpeGhhyz5jpTJy2XWToMecq5zeaaQjU0/f0eEMR0XvpxisL77
	zuOADmDSZKf59Dg9e6SL9qSr1z0y6UzEaO8IETn0jukdpIg/5Ek4RQs4ByH5JE26
	WgNZ/hlGS+qvPt04MhTgYT2Zi1J9FOSUqh4nvTtA4+W7rBt/1zSpGfyu6TcdvSns
	agkbxLJK+R+1IKQJP+PgWouGNswUmnydnKaLEL3Uu8MjGJ6Nd2cobciFY2sczZZI
	wxJUg8FpSdn+xP8yQQ2vWiS0mw8uXjunjxUW/OpMVbZk5t1Lgo8XB9/bG+52kU4B
	jrwBTA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5rtrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so3627240b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260021; x=1776864821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=;
        b=fFiMD0eCPMi7PGifkpFjCPOIzf64YzZmmrEgWHb2Rd0cgrngJXr/dbzeykaLliUen0
         jh6YDj+jChX8rXi10sxeB/UaAfOUd16x7ysO0/0seNWuG66KPWpqwZw/aJKUIjS6CJ6W
         IpXVlVNykg3Geh20yXLGGhIKlywStItJZ6EOoHm7fUGWDDi3gQrqzGoJn16h07rQjSLv
         hqc7QX535isjwBGVwkS5g1RYJZ5BbAQEiIUXr6oCPdULbxTTSjRFs6PjGZflkbebRf4X
         cGL6d2hfRy/o4DY/ubYNGDKx8BTJLu5VT6eqSPvQM9vlc09IP4JRlagkBwmfhlP4vxrB
         wjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260021; x=1776864821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=;
        b=Z4IEE0CDPF8mJKg5Lgn/W0c+oc1OMjbSfoi7YRNdrVwPrtoJ7eJ/Bfx//5CWrdBPS2
         1dMP0N4xCmxo3d/qCMfK9f7kN2b+DBVg2DoJEvYJvl1H9mmMI0yBnFuWSUI3YG06t4Vw
         jmu7VjUFaELnrsizvLj7AcgrRx7ZkQujzbTdMeyjU9yCpUuUXCxSQi32Yuw0ZhJHi1mi
         JKG3cMVkE1T8tKygVVLJ3xwr0b8qkMRKZ053QtRPm/rXdXQrBDw2p3AniBkrsObjKnqc
         ogaWMRMSomwN5/oUBP8n7A7QE/9WaExQJW9/eVWzPQB5tArOXWcbNvk0rBDKtKRJQ3Xa
         5bTQ==
X-Gm-Message-State: AOJu0YzQC+1XeD6trFo86lrWe9RLyV4ZwB0zD2QGzi3uXQVyNrmK9Z8E
	W3NWiYlnro9kmPe4O70YHfyvpeDqRQGTuJgo/J22dy/wrr5wwF+slrTWZPt1Fu+Sh9Vb05pIjQz
	aDpDWQ/x46B8/2mrw6YGjGxaliic3ZiMVL0EnjMh9Bm8iPXmAkEa6dlYdZcLVqRH9nZYe
X-Gm-Gg: AeBDietiYaG+L2hwIWSIttPxvQnEquBPNIFIxbR24nhAOxv/i7pHcV8YEhLlholJhNR
	P9JUbNH/tXx0xaJwBCN2+w0lkq08GhKXzC7BlB0u2m6T4OpKeS0tZu6jMpvTiwAE5K8uvcBO7uA
	+FKZIefoYUcKOoiDNbTPF2VFmA7+nASTPgIZwfa/tmKDCjIQYeVUaFp7EX3KKSayh502kSgXCgH
	0+ztsvxfmka7yxhMYjcEOC2CnxXOyxxDMHtXroyGbtGjKT+wt5emzxRk+zhwxyAIa6VWAQ3lfRf
	Q1GaOF8hXVN2DlY0Er/Cw5qXDx0GLfYQYUU/3e2Ds/+HCVwIJJBh6Mdt2Ri2YTiRwGg22PfmvqS
	Qyf+gnPJE5gipsTWBnr/WNaMidphDr6m/9p9FCuweyowAxXyD3K5ktfiG9Pb4rUZBTA4XhMKJ6l
	oBprDAteeXmOJYk8MeUn3kOfg3oxd7WJ0bXg3LXW1ySLArywk3NkMS0wVd
X-Received: by 2002:a05:6a00:12ca:b0:82f:5a4:aa46 with SMTP id d2e1a72fcca58-82f0c2b510cmr20023782b3a.44.1776260020551;
        Wed, 15 Apr 2026 06:33:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ca:b0:82f:5a4:aa46 with SMTP id d2e1a72fcca58-82f0c2b510cmr20023750b3a.44.1776260020056;
        Wed, 15 Apr 2026 06:33:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:18 +0530
Subject: [PATCH 3/5] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-3-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=821;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=I4o6YNZQCCaDb7FwnvdTnwLu74HAplwTsh6AV5Ejy14=;
 b=MbkKPCyBgmhldJHygpwYuks7foIDBOHg1RVVxuqEr8gDG7kUTI/LJsPukFs0Mu8/nD3ap2blg
 O0rJ6nvQJZ/D1R5etryASFhnBuwgb2K+ZJoTjKLQeGDyME7vAoKE7Yc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69df93b5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 2mI88r0jG_rVZEJvAb8o4la4vdyfYvcP
X-Proofpoint-GUID: 2mI88r0jG_rVZEJvAb8o4la4vdyfYvcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX9+8xC04tgY0j
 LBDcsTgwLYVpRM10RYtDpO+pLbEwyOyuXFoRE67RMQ1ZAv4WvhAWyXW3f+yTrZ6Viyj7KV4/0Kl
 z4dsrVoFNg4wJn/WSLaMVu2iKTnOfKnRj1DFBYA2cVJF3l103vwfIXxloX7iJyhlwW2HhRg7UlR
 Bq7JLvW1f36+Kf/xi2ur5wo+TpGY5dQdC8x3X0qZ2xUzDjC+6Dd8ER/yeAblQlVyetvgXXDSRW9
 bh4gr3cmv+Omlq7kA1cLaQVpQaeW4TP4prGTpg97bdsa/aRBZzvOQzZbOgpHHNTuhHpFoxyO542
 +cZ0t2fLDS3xfO5O/xeeHc1kOOTiUcV/ShhMRD6uWy6N3idggH7GD6wFvpoAXwjxtTGPVAZeTuj
 MWRZKQRnljDnaDxHOcCPGPf33xyMnX2spUMX5iCF6qEA9E5j7PShb561dpk6MbyL6FJkCVn1zKq
 8L7uAiE4cEJp2aBLfrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103298-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95B01404DE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new IPQ9650 SoC/board device tree bindings.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1


