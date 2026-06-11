Return-Path: <linux-arm-msm+bounces-112613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bjexAqxEKmralQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:16:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B466E752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:16:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S9eFKXen;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RTbjXd2z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112613-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112613-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24B03303E11F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524CE39EF35;
	Thu, 11 Jun 2026 05:01:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E0397321
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154090; cv=none; b=dB9kNmH1E9IeOYTk3IyrQELOVUESj5O48ttL7a0m89E3oSrNRCVpt1imkh8yTVJK73RWVWa1Td9n4enp5nLOvScr8at2Mn0wqcyGXVHTsUmoRK62rBK5WRLjFxBxDiO/pyLdTRbmXzAC7dywcga7vB3I5c9KKI6NI8w+p98aHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154090; c=relaxed/simple;
	bh=nJ22RhsEYu1ZN2/H4/WWZENc1zfrl59Y2SybnlYrC64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZF0MHEd8H2O3DZk6tOh9nnO1XsB73kZf/kDe7c4njvBhLgR5vgk5j7aYyAlL/ormu+mOIsFrTMLuxg2oQv3jL10V90zPOAt940sEcYPI0px1JQ67oMaZk3KEdUrB40e0cEjZxMLx79LYnA6GDgEhW5/yQtibs/kWDmgpnGEuqY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9eFKXen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTbjXd2z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NuqT3184617
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7CBIcy8w+u8nf41K26whcwy7q1q7j3Ri5VH/uv7BTw=; b=S9eFKXen7+Rv4ena
	JLO+wbeFVy/NggcX8lQk5Q+gXDJuZtgT5q00LsjxWeDhwIHulO3viW2DdCB73KRy
	RhjL8uqOKgmRp4EBvzdLffMwULzONrbrOsVqArF5kHRmBMoAYj77LMpc1FsbLjh8
	rFvMNIPWzrCEtnOJaMZs/ZxBEn2PO5+L+beBgFOSNt3+3I7VNBuulFBrV3id5vOM
	pkzIhYGoYQ7aNwewI7FoXzhkXw6XSeDxF7w+9r0Mw4IiGeixzspiVkz8PsCQNpdT
	yqSMo7iogEgAaJY8Ijs93SNqprQhGhTmQVZu7IT66HWgR51tK5Qb6sf3cmeDnr/P
	TZBX7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6usnwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf55c3f44aso4737305ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154077; x=1781758877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7CBIcy8w+u8nf41K26whcwy7q1q7j3Ri5VH/uv7BTw=;
        b=RTbjXd2zL5tHgQGOE/rTeCmUKNloX4Oe8Y2M6zTiRZGy/Py085BeARIpgS/iWybn30
         mMm/CfIPEs+fnJ19LJJAnUljluenRzwWuG+h45YZ6yxyPSgzRMCi15Pg4NLBQVpB9McY
         5bGA2v+4v8mbSLy7bdILoxngEPYY+jlDmkrp5NTumNYZLFgd6t3Wq7BtHE2FlmpbjRvc
         PzPPsESC/0EfwX6/bfPVHYqKtAO4Dm1iZ4ubPgDI2u1loecH7nZ3Evl0CiFm5da3yO25
         3rZJEkEJ62FZOaVx5WFEsBpM1KYf04GedmN5imegdKAYw0RPZ5qncXZQsae4ZCRl7Szm
         ONNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154077; x=1781758877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r7CBIcy8w+u8nf41K26whcwy7q1q7j3Ri5VH/uv7BTw=;
        b=Dj56iJnOPTPiWcpQajgSa6fiHdm6JbBnhjovnrMZlQD5HePGiF3c48cspAipbdjs61
         ySCB28VbrbpSvOOMcvb3aiU+Oud0F9F7kyDDRpw+MbktFyvwC5AY8n8dmUAcUVmOOmeB
         lFfW25R79hljYE+XboatxAGNLc4Ji2DRv+E44rzyvfQhy63uZtszcxIEV93d2a9/Ixrk
         ehtVc747F4ofeFv/PpninQl3Dd/TYfdtfhOcDrhLlCMF5cz0vJhS2Qi0uzOxVLd3stuE
         J/kkwICYt8teWM38nsl79LMeE+TTvewS5arPsDA539dVI/Rs19mllpV2IbTaVSXMh7nb
         A7uQ==
X-Gm-Message-State: AOJu0Yy7GX7GSvRdY/ocTGsokvA5ik53komFdV9Dl01QT8jEeYZOxCcP
	8Zv3X/cC3EEg+QTUz07lHtwibPqeZOYRWEQUbLWL0GbwqtQQJRq7g85PDrYgKUDv2tMI3MsxCy0
	MOf+SShBVivQuu7SzRINMblMw2C7qxkah9dU7WG5DdR6sveOV+zyskVrLyRnefU7p0WTpHs/Tvq
	LK
X-Gm-Gg: Acq92OEt2uzozko11WWxH608zr7dmPPeI7bE+T9a7qz9LUV989zR++nolz2NRhdRTIg
	kFdPZEx8BvGUgjGV2XSLb3oXWdzSvX48HAavsJz4NfW9XhaBSuHl9gm9yexkg2+FBiNKbGLnLSL
	cA28YYF/D8bF+v1/dL25Ev1uCbt6tNw4tUr5Gk1ahSLcBdqNnz1tDP+RAs+6nHlEkAv94S9cJuy
	4NImjjL1Z+GljAyXC+3zPTD7AhpThvd893YhJBD1BR56u/Vp1WddxaBcn+3aOSlbGat3mmW8f+U
	BdP0oZTUXrA/fuNtMcFg/GkqiEp+lvQmJUPItIj9MQEI2PyzNvh0eE3nGoCWGI0INUPT9xfHDsS
	ZpTD1RavyWebyEhSiCmaA2snsoObnOSNqXxL/8Sjyf+loJQ6dbRz6UrBFxgZx9I9ygGs=
X-Received: by 2002:a17:902:d4cf:b0:2bf:21e6:bae1 with SMTP id d9443c01a7336-2c2f101c3b3mr10049135ad.18.1781154076902;
        Wed, 10 Jun 2026 22:01:16 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2bf:21e6:bae1 with SMTP id d9443c01a7336-2c2f101c3b3mr10048905ad.18.1781154076409;
        Wed, 10 Jun 2026 22:01:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:12 +0530
Subject: [PATCH v2 36/37] arm64: dts: qcom: kodiak: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-36-2744251b1181@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=10020;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nJ22RhsEYu1ZN2/H4/WWZENc1zfrl59Y2SybnlYrC64=;
 b=wC6F6iV3+H8R50Maaa8EbbN2evldAlqQZqzhFZAsaTm8J7NhyUHE7G6Kbe+VX+Pb0DNfB0s2W
 q1IfosYNCRODHTp9LDyHe8sZQ/UaYu1n9tURGnNlRLpJHA7NSCrVE+A
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a411d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JLcStonL50ma0eizzm8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXzuEpgZ+J+8dI
 ASRfYVmN1q8mXmZqaPnclZd1yEO1wmoFkAw5Io6EX1BEoRuGc6o1OqOwrSzlL6iJ+/zwVlxATT3
 M6E/H12MYEHcsxc61NCp4v7K3GM7UZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX2ELgDzB+QOkx
 8mlJVkplLshvk/JCHea6ElWSdmPE8Z8fBndxi02e3UqYX/39vePvYi7G9QxGO7yRemFbzTO04JN
 PAGOCUI8hvjl2ZEAbxXnzT+KcioLp4j2QbPQQ/UIkYMZp1XEPijwSAZE9jLJioGrozC6/GOpjmB
 SUAr5zPmmdbNzg/54/fycB/xU1FndM10XIzNntpg6CaD+EkSfMAc/9BWHEME6wFPRWNU2Qa9RH6
 XWj44KFNSOjGyhW6e/G6ZsGlRUBHb1X0YjodfxrZPFeksXAg/KBBlJ+AB9V+iW0IJJ+399pctIJ
 7XRBs1h0dvn4Stqnr7iRwaYCjr6gYGWCzDXfFx6C8N4JY1wdvoDEpadwiArh7Hk3sR+ibH367hA
 wu4SX9NKhhfoXiG7Pc1usA9BDCZ26qFpPiYVsWk5eWYQZv3j0OENwF/ur5fciWm1Ed1cE9g+N/n
 PPaE6tVjBxfrWDLtkSw==
X-Proofpoint-GUID: 48hmH-HcQs7T8LceceMpIE2XM7-ZXhE_
X-Proofpoint-ORIG-GUID: 48hmH-HcQs7T8LceceMpIE2XM7-ZXhE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 715B466E752

The PCIe phy reference and the perst/wake GPIO properties are
per-root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcie0_port and
pcie1_port0, and move perst-gpios/wake-gpios from the &pcie0/&pcie1
controller overrides to the respective &pcie0_port/&pcie1_port0 nodes
in the board files, renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                     | 10 ++++------
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts    | 15 ++++++++++-----
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts    | 16 ++++++++++------
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   |  4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts             |  4 ++--
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts   | 14 ++++++++------
 .../arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi           |  5 ++++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                 |  5 ++++-
 9 files changed, 54 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..52887643e1a4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2286,9 +2286,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc GCC_PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_clkreq_n>;
 			dma-coherent;
@@ -2300,6 +2297,8 @@ pcie0_port: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2416,9 +2415,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc GCC_PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_clkreq_n>;
 
@@ -2434,6 +2430,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index b1ad1d7c346a..92023aac967d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -545,15 +545,17 @@ &mdss_dp_out {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -562,8 +564,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -572,6 +572,11 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 3a9fbef89aff..d0639eea398e 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -522,15 +522,17 @@ &lpass_va_macro {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -539,9 +541,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
 	pinctrl-names = "default";
 
@@ -559,6 +558,11 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 83908db335af..8e65a63a533f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -49,8 +49,6 @@ st33htpm0: tpm@0 {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -75,6 +73,8 @@ &pcie0_phy {
 };
 
 &pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+
 	#address-cells = <3>;
 	#size-cells = <2>;
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..3a7998f7ca55 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -824,8 +824,6 @@ &mdss_edp_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -850,6 +848,8 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index e0275430ef82..65687a6aeb6f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -684,9 +684,6 @@ &mdss_dsi_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
 		    <&pcie0_wake_n>;
@@ -695,6 +692,11 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -703,9 +705,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
 		    <&pcie1_wake_n>;
@@ -732,6 +731,9 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 681a9ff5ef77..e5c549c794a9 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -812,9 +812,6 @@ &mdss_dsi_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
 		    <&pcie0_wake_n>;
@@ -823,6 +820,11 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -831,9 +833,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
 		    <&pcie1_wake_n>;
@@ -842,6 +841,11 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 5c5e4f1dd221..9198377c2a8c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -472,10 +472,13 @@ &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_clkreq_n>, <&ssd_rst_l>, <&pe_wake_odl>;
 
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&pp3300_ssd>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pm8350c_pwm {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..655192adbd5d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -418,7 +418,6 @@ &lpass_va_macro {
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&nvme_3v3_regulator>;
 
@@ -426,6 +425,10 @@ &pcie1 {
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 

-- 
2.34.1


