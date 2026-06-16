Return-Path: <linux-arm-msm+bounces-113372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xHEXEAgmMWr9cgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:31:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10168E514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:31:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CK4bEQZw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TiyDP0Y9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113372-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113372-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0B2B3036836
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1224F42885F;
	Tue, 16 Jun 2026 10:27:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626343C051
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605648; cv=none; b=Nc921rPPP2JHHl5XzefycLrMfqwGiWxomsrc9Kcfn1L43sQHS6aN/Uy/2vywOj4okwPysh/cNhIhS6OmebTZ4m9ydI0841do3QXp3xlOYXdSZSLIW6Rzlq4J7hrDi6v28QTqWMs3aa6bGCJm64vmkHb59mKIFyDVHjv4b+faW3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605648; c=relaxed/simple;
	bh=hRjyfW+pWaCzWIfJ0WuK8pyDWdFAwez43dr4uN7mgi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMfq9x++bSrqQCIwSg0TtFC4J5sSnVNZxei6HMWtVSp4KsCNnP3x8jTMmuHNkue7G8bZMzE/qOqblwzoBij9mm4eeq9xwF9vaznjy/F6NCyR2ZLjZjFRekOYi4KDfG2fB1EiZHsbfazr/2fRjeYOHzTPq0n2dF2Hszy1UryNwtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CK4bEQZw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiyDP0Y9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9TBJ2846317
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBTjcisRuYeYcYREUyFPfGR//czmffBsiUT775cdtGQ=; b=CK4bEQZwusmxmCbx
	rCdjw2FyZAnEYMkgGeycumV46w5u5hVUPkvMPLO5N89V9EE2wvH19ao8OiDSeapg
	DLNPhc5l+S+ETvKiGOVAHGrcJlCSG4Ky9mw/FLDfVCti8w35ge4d59i+GNQooWtG
	+A3xWsgH5qsN9IZ3iSP7ayhbnRQv8xGy+RgX1hHgMXexAXj6M41nIIT1eHpKcM0n
	0i9csQhOZqkaOifD0QJsc35MNe9maUN0Gts4uVPHla8mzSr2Zy4TIVO4hcXgPjFx
	9mGPRFgtv72M0BXZURtpRwdFxNVwXc1T4dbi1PTZnlIXD0QwXqjiSrYqzMVfwUGk
	Q/qAVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8k9t1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:27:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0d0516ad7so44052265ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605645; x=1782210445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBTjcisRuYeYcYREUyFPfGR//czmffBsiUT775cdtGQ=;
        b=TiyDP0Y94C3wd/IX0FQU29QtksuNj/Go7kLRsXPqTn97IBtf9tcB67DJ5sa9uH7xW/
         1kyLckuLn2JJPVoDQepxaDkEN9qZt1pJh4/iH9uRSx/SYgjca9ODvN0yXk1XC38HP0YY
         lw8kFKJqmYT2Xm5EeZScxIryXcmmMByU0RnoqMPNpvUE3QmQ5m8dyFVVZJ4l6YqFNPmu
         1FSeEDoMQFg+gFrQ78T9mo5R+lcjpyH31OCyBHq24lg/6YufcMAZaxbdO/j/jio4xZjR
         xEEJ1T/Dpyb67h6/GaWHJS2faNFU+68Bli/cjfmDpsR2DTECJeOJGe0v/AiGtEPtRf+I
         YY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605645; x=1782210445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aBTjcisRuYeYcYREUyFPfGR//czmffBsiUT775cdtGQ=;
        b=cT8x1nxupSzV1AWyNW3YPgnyvAAUbLwDUb5eZObAahWo/1rQHt/NIJxq1Cp/mmU+EU
         O7YKZo5YFLJQGJthL+9/lPcDHoxDWZzyF6eEbG2W17GFg7lkslaSAQXwGq5xDczDf6qA
         O0744GuNMr0a3wwG6KYxVJHZDlab941gSF1U+3RNBd/PxbxVuqwWlN1PPbxIh+X2A8d0
         2OHnw2FzVfPP/YOCBMyYpkIjraZGcV7m03sSakZXiXQdZdP7HlFwhplrr7qo8/bX9RUN
         uSVZdz7UgBViTMPYS9kzgWFJf5SInCHClTid7eWpb+11Z6ZnPCb2DAgJq7wvXNCbCYuy
         fg6g==
X-Gm-Message-State: AOJu0Ywfp5IKTKauPMKSJmPFnbyal/tS+X1aiM+2axPJhYulGJrviA23
	BnYhCJ/88NY8pvR9bHxk2c1xsZk7zMX9BEs5PfXs7OFQAcqZYhVtBFjbSYUNmZGw5/tyy9W18nV
	WlfPiPvrCkmqGtDy3oR6OKu9gmT2wbGQ7qb5LdOb72kLHhq0IkkI8iB45AsBxtVP+jBly
X-Gm-Gg: Acq92OGAkn2H5YxopxVJXpUE+a+ngBj8Hqg8YHETlRweGRfX7Bf1sN30TOiTaTaw4H1
	P3iZo8C52XkSqngV6FaXCmXy2iRFk0bYfiLBMvINdkgZbtbSJX9vwZR5vzmyOpFg8JC5WEshjPG
	nOgceOYDugnySeeB/Lc3fGvrJtd3roSmHeOT37usoWR83TnEbmHiF4XuWnx9lD8nwJeWVDWa2d2
	7tyCZdb9JHvHw3fiM6ua3PJuoQM4JokAVJebNPBLoMJMOrfyP56Maes20vRsI1bFcjKjbMNU+DX
	IJOufiZ78BGx+ekP5AMKXsUwco5X3KNMveRCSd9ZT/bFe4NBA5hMv8iM25s5tYzrXqxXybQE6Lk
	RLVd3l0aCOOOqu6R77OrGjHFmeaKqwqb+mG8trFgD20jwtAMuOQ==
X-Received: by 2002:a17:903:acb:b0:2c0:a746:7b16 with SMTP id d9443c01a7336-2c6641e3058mr154941535ad.22.1781605645381;
        Tue, 16 Jun 2026 03:27:25 -0700 (PDT)
X-Received: by 2002:a17:903:acb:b0:2c0:a746:7b16 with SMTP id d9443c01a7336-2c6641e3058mr154941125ad.22.1781605644866;
        Tue, 16 Jun 2026 03:27:24 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm118343685ad.45.2026.06.16.03.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:27:24 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:57:13 +0530
Subject: [PATCH v2 1/3] dt-bindings: interrupt-controller: qcom,pdc:
 Document Purwa PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-purwa-pdc-v2-1-8dda7ef25ce5@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
In-Reply-To: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781605637; l=1107;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=hRjyfW+pWaCzWIfJ0WuK8pyDWdFAwez43dr4uN7mgi4=;
 b=fFRUprnuGz3w+3LtuXZ6Z0g4LAvOdR8d48CRzTbJSZLR1SlLJv6cYP2rbc/nCUZbvJIA5CJzH
 r8wLxqPOgMvD59K5zJ/Fh2HIP4JYCRVZxcyhgLvS498fQIxFc0JE+3H
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfXzL06mO8UIeuo
 mUOa1sOamwpJ3RUcA3geF/iLhRZqq2ICKo+kvv1+4souW4dLlXuyiiEpwW08zNkVzwuxYSoXS1t
 BrrRLNK32LPpxfnmscuccV/K13p5wPfoZnYzsTqiSUYgCjn3hT//sRAOnsWjiKRlN8nFcmzSUur
 XYFpKuC40eWzSYGmk8v5aqYpLxA16fBXoXqEX8VNzBrJEUhr1u3ShaPR5Ou1cHhmhj6sceEt/OJ
 6q/0RYA4UiqXBr+JZhoVH7IsQLntqSPGqmNOZ070eKNGfx4uZqmhQP8z6fi/V15/06TU9nqVMUZ
 gXvSuYIuGDFL7GUde+5Z7wWB0CmG692ISUi71Usv4+vXMG1MC3LZ4ALbzp9SHh2TKn/Mzte6Ng7
 FVF7bSdcNuJ6bITm1tQkqZ0ABLT/eOPSYMiEfr6NAlEuBolna/O/fR6EL06fJbm9YukYipIvH5L
 OTUBw67cc3Gbj0qadRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfXxvES/RNbVBRJ
 RrgrGwFNy9jsPFd5OmFe40pqjCDtWVcb4BH8AmnBU+QvGcL8vpGrCYbStrNPoYYep0qbVJRHins
 Voi+22ojnJHpCoePyrOmbxOlkLeAst4=
X-Proofpoint-ORIG-GUID: nBsnoVX7ivvD0zhraH0-dHiJlq4eEPOJ
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a31250e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: nBsnoVX7ivvD0zhraH0-dHiJlq4eEPOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-113372-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 4F10168E514

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Add PDC compatible
for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 07a46c5457a4..420421863328 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -57,6 +57,7 @@ properties:
           - qcom,sm8650-pdc
           - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
+          - qcom,x1p42100-pdc
       - const: qcom,pdc
 
   reg:

-- 
2.43.0


