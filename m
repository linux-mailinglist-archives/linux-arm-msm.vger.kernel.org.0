Return-Path: <linux-arm-msm+bounces-109370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GMzBZGUEGpSZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:38:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972B5B8602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C038630B5A82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F63377ED2;
	Fri, 22 May 2026 17:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQS1K/L6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPV7EVSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD4379C55
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470861; cv=none; b=ZQ5F2Ke9RYZiO+Q9mWipY/pSZPxh1lfjV0I3vn/Mt9D3AjqXLw+u6GUJscu+KcD6vHs6CszU24fsXtVxhYehKk2tztFEfy5QIGQutfIJvVkM6noudIBD0xyPJxymQ5lkBRoJ0GEoKPJCaWnJkRy78s+mv5/uAC+6rQviK3Lye8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470861; c=relaxed/simple;
	bh=ZtudtnJuX8Faby0VuV52r6celt2UQfjIrIlwr3oabns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qj+4YiudAeUT9qRGgn4b7VIQ+qegQW2W8P2sLQslIqyCIOROkF99WVmpqEpMQTBd7Mu0+tKfmlXFsm+NwBIatsuu60YEkIpMQjRirxyEqmSYAfUHSnYcJ91bCF0DnlV8p36gR/9Zsy5BGGZb84U86wcX8oN6ix8P9YxFQTx7JQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQS1K/L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPV7EVSw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBBeMw1958624
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OQen+VoAHis
	aKxiinT3/zd7m47X7BB/wcGnNSYFTrVA=; b=UQS1K/L6dH8o/QuU6jPbVbMeBj6
	UkNoCP3Zy4xXoISy40tP3L0TSMUpC6OovZNHNLOXOg1GdQVrCMvIFJuZUaxkmSV4
	quqzokSeB6ur7hwakWp3wiAhG5aTCXV8/Nwk4kbitK2AscbD4vg2SIkqaX7M+wYI
	N6T2hWtvL0beyBDfgaaLl1BJgUgtz9krUZAnhxESEYnb04GG4EVPqpEp2YrkaxBx
	LcUGTH37/HAFednOVYN1xKIQW6ec8ZAgHJ+4/Qa9WofoF5ryZpP4YGSfVCf8S/ds
	jLn5G51wdSypsW9qg9/DV29tSJxTMs781A7yO97quPwBpomXGvquSCNT49w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxetmm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8354503d9acso9403293b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470858; x=1780075658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQen+VoAHisaKxiinT3/zd7m47X7BB/wcGnNSYFTrVA=;
        b=dPV7EVSwPAjUDGd277CcKJ7opjujfTmUSH72biMak+b0hNW7utLPo+sLjNXzCwxd7h
         Og3adzaT6epNKETTtspdOZIM9H8o3LdSrULWxWspw+HzzSO4t4VaKD6qV/3snImi/LKi
         Z7ntWDqGZehld6t+fcHql4MOuJVOUqqVWTb9JNkJN4T0I7CyRE7gvnaJR6htNF1nvfOF
         sO7XE6ZjqC85kPAxnFYdCHk2if1nOightfkIGUuPF+cNAT86UieCOqFoXWaSkj7H/OuH
         Yw2ynvWjXleYygQnYuBfKB8izaEto0+ZK8qMmTIzAHGBxQRCoisH/TmCMyLinFomWmAc
         PV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470858; x=1780075658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQen+VoAHisaKxiinT3/zd7m47X7BB/wcGnNSYFTrVA=;
        b=phwtQOnXMEXTO0B5I0ho0dELxXFrImF1POXAip1kDlMOxfMxJfh7KdhQUz7UE7855/
         p4quY/rqiy9vYO4N/nygr/pSZKswArr51PH1i8LgXAZXPxTRPOrzcLjZF/8Gurm1/Yod
         9rZxdxiRmdQB1JaAJjuJaRiFtGccu+4JzNjJgjMa5uxbb7H++1uYUTBz0hc2gnRUQPRS
         OlfWlGh8PKJrUIcnBDg+xnQxpsbA9lX6avTQUgayWfFeRxJ0PNGT2FNnXM1WrObQvupQ
         Vrgf26SzVEJeMaemhP6xfO3eUdov9cJabZe7kK+T2p3Z2iBbyrLDeQ+IWOMHhzdfFN/x
         JfdQ==
X-Gm-Message-State: AOJu0Yy6g+NEivpY6FG2KCNbyAWEvTi5WyfkYTs4ZQzytMNydqd25sq7
	7YevHHzuh5bne0tYVlQUnJApYqAoYCkQcj1ERaXMoosTPZEIVxekw2V5mpnyovEqk3ItaRJjgu0
	rCgh2opzCrRXQu2iBBfDHlvG2OsDqfd8MMUvbO14vQ1i0M1ERYsrk1HEh3HztRJ208mqM
X-Gm-Gg: Acq92OGPQAKWhwZHnXkU3IIINyivkbLXxtAdFsupSIICe6/FGb0wNaDZgEVCzaEeHaM
	WwVPPZj2IDjfuhyt3cEeNdALSWXDdKIUuaMSjpA9vaDFJwLGTB+W2pYVNdPqXJ3WcsimzrIH+gb
	5l8Si7teua5VmHZkGPYAKxO7GMCsnmSW8yIEP3GNhlS7oM4d5cG/+GlSzzGyLzenu8ctgSEYVwS
	pt6rlx5CvqSLKWUbsuK/8F+soa0fdgyUnsU10sdvSijmBwyVvlo9Uy3jgsAP6WnEEbzO9qcAUmF
	pN/LKx3V9+TwHFC0fInpCDPCoJwrOvprps0D1m2SeUdijZTkWubq5EtLDUuAljcU2hsTo0e89+B
	9y+uEmG+vUZReaWiCNGhax/I9VUcQXTrYLrfg/CnuDKZMR11GpgB07g==
X-Received: by 2002:a05:6a00:8c04:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-8415f3af2d2mr5234127b3a.6.1779470857796;
        Fri, 22 May 2026 10:27:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c04:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-8415f3af2d2mr5234097b3a.6.1779470857341;
        Fri, 22 May 2026 10:27:37 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm3045693b3a.31.2026.05.22.10.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:27:37 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Fri, 22 May 2026 22:57:14 +0530
Message-Id: <20260522172716.820490-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NCBTYWx0ZWRfX8Ckqg16v9qwe
 HuZBtGW6Afj9hzK3XlBnJixeckZB6akdQ2pK4R+IiSyFY+TdeOQAv1HHQAn31aBOtC4EAYipnVN
 4Wx2D/mMTT/+0yyrJw8b3k4VK8q9S/QIyuZWaAHu2GVwY1sS55A8uTUTcRYyEzgScXB0KCn9FPS
 mr/BPYcvN2nZcfRbEc5zTr1WdGkGVctzDZiHjzGAnkQEv84D79vL3DGH5Q9J328WriqVl7LG89X
 LG4gomUJlLOFKC7SyBAPtCASg1SHSiWkUXN32JgSDhjaIzPq6bggLH1dLumUi9xbFPLNT6Lrlwz
 C6C7wamh88z98QGqqd7UZWpodDNJ5IRAd9itJzeJW88ZhOW6N3s2gjCZjkVuiuggbUlvZbf16te
 k5OLfMfAl3NzY4ccRLGAw/4quJ/zU+XBQrEbmmVgkmZvsM+8Z+tQIOJmxlLwoxYLDhNyS/hudmj
 caQaaflQ9SdpFS4slNw==
X-Proofpoint-GUID: a6kiK1Zmt-iyqU7ZyfIr1McshhYYNAP4
X-Proofpoint-ORIG-GUID: a6kiK1Zmt-iyqU7ZyfIr1McshhYYNAP4
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a10920a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MMZtLZuhhDi3SW52_uAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109370-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6972B5B8602
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..b75015f3ea70 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
-- 
2.34.1


