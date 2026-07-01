Return-Path: <linux-arm-msm+bounces-115637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mPZKKt7rRGrX3AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:28:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 206706EC251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:28:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MWIRlnAA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZAj5Cc1W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115637-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115637-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 255BF3022F77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEF84218A9;
	Wed,  1 Jul 2026 10:28:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D2D3F1ADE
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:28:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901716; cv=none; b=aC7VlZB0Gk71N4d83TsMkm8DiOZxXgRF2IWVwSbQYVUALqNi0UTe+5cX+NBem2nFQZazOTwFr0Ua12ODGx9216PuZhWTg/h3jWqP57xFJBgN6YUJUqElfj4pvd8le9fLYB04Uibav6cGozqYDrk59SXwUJLjb6398OedkGQ+J/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901716; c=relaxed/simple;
	bh=l8QfYoFSstIExHnispTOUZbqovMeqrNg7FKcyIklooQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQ+umIZdzjlqS1idASRytvz6oDLxnX5aRMl7i01vyhyj/PBGvpDp+25bleHvc+k3JhVDjlK5RhhJY/8ASjs+AHDWB1x9gMRIBmfyQoSrMWV2k8IjQ1SnI1OsLfbENdBCysNnp61PtpYKSLhH1qBGzSb9ZOZVrpaV7UAuJmgx6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWIRlnAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAj5Cc1W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9Lad754559
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONKy4OXlaFS+6eH3rmX8NTr5xpbMTHPRAg5dd1nBsqM=; b=MWIRlnAAQVxWDqWn
	kOztpenJy7YSKrrT5tHodKNLQl4JAO40fiKL1PUW+s4FJPeGN47yucfHaqmow9J4
	eZnbTWmap+1Ab6OLHm9Micds7HL4hTceEJ0KOSpaLjsGFxAw8rIRfl+T4z6OsY68
	sxX7oi49jv0By/w/69dUCGzRdtQ9wpYKneM41w0LUDqjhw7C9F4VCwSMFwBndtUw
	sN/jr1Jzryh9+bjcmrXMolj8+CBMeJlRO0y/fFAvG9MFSVg5yoOV9Z4F96mr5jN7
	aiOE4Ybs3n4y2XyCeL3weqGmdWnKDU6NF3WSxPsEXpI6tihLY9fd4ajx0HxUmOen
	tKQ/wQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy265j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:28:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1211026a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782901711; x=1783506511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONKy4OXlaFS+6eH3rmX8NTr5xpbMTHPRAg5dd1nBsqM=;
        b=ZAj5Cc1Ww0HHWCDc1Y1jYUeY1wpFEUdd+JIjSBHLRXKQl/fSQA/hRkHbuadjZfU9td
         /gWjo+8Afqse/MrUmGKkwR3YcEfVL4h/C+x+znj2AaKSHi0Lagu4x3EhhfTXBgIZY0ou
         fC/oONkr9gL4VBjEOrnW9sIJX40FURXMGXDdhN2OoE3V4yPtmWhzHUJbbBJCHAV/W4UI
         aBnGef0uxKLYAvoI7kKlchjTTbdXYhk31h11w9ynfyQ1wMrwNc+oEeeZ2QvUSrIhvmRV
         tAkBiQYwsz/wkTtVnztqdSVpt7w8JkWYd4o0xgBDHfLNClRSWeH9dVwfHPeUxntSfV6X
         GE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901711; x=1783506511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONKy4OXlaFS+6eH3rmX8NTr5xpbMTHPRAg5dd1nBsqM=;
        b=QReN3j0lyElSDklA1PTqqM2Nr7RqTsFUKQ9nS6ZHDP3F1BQ+O42uWise0/NGIRMY+Y
         p/XGJBN+Z0Ber9XnvBtgKMWBziYk1299AtRYy6v+kIH7HTfh98n8TwK7QAMkL7co0RlI
         yUyEXQt3M7rD1Ka170S266wiJlx9XVT1YMGD7bGW+H+QBtarCftAsrCEZd74yx7XHXmn
         X7pOR/A14oHdzFl1jefmfLU/djgtvl2+2mjGhUHM49OLQUwuOR7fg1fg9Wvsnc9d8J4r
         v/GZEQp5xvqeelZgg1dRAWKks42+i6CbxyQo5n/5zBUvkTT/c5r6mNcLYQ0F8qAtTnBk
         z68A==
X-Gm-Message-State: AOJu0Yycn5flwDcyIDodBHqGvtZmBafrjUcmPlxgD5NYVHpcZznz4KcH
	X5JtNatqFAPU65J2Z7cEdmDxNJ1W3NihcJzTlUeV3GxXxtm+NrWFvp8wkq3fivJ/mXpWlsNejEb
	NFNBj3D30mdSFUlFUUSulcZhmcBWgdE7BgRuadSctGUPyi7n/BZHMdscDxsLdqhP0jIA=
X-Gm-Gg: AfdE7ckSFecNhtKW/OlqkO7tN40f6Qxmg4prJ/ZXevt846H4t9v2nmOpONhJ3tUn5UX
	cFfBVEE909JiKrGBokUeCq2+yqwUVXPA1g6YANyeNOxTCo1H2qOnieHgS3U7q1jrew0dZOe95DM
	yap0ogsBGzPxvVsWViLivW/qpJ4pPiNoYOyRfpBQ0gxM8Ykjfxtm+RHxqoHnzr2NfujOfT4G+1w
	P/Xcryik8LhYFWjndZiF264D4VPd+sGjH2IZijAALw38dkkaome41R7EJoqgVGKU3caruQm1lsF
	2/egt2xBeO1zMl0vEvOEDpVELyEp0jAS+iEG6T5GydxiUjc2aVjfy9NIuAdVT9HoO98njh2yYOx
	d3+gbteyCPUqgaEjtsHImvuuI6p1R0+al8s4LNDkD
X-Received: by 2002:a17:90b:520d:b0:37e:cb9:fd7d with SMTP id 98e67ed59e1d1-3806a04dc16mr4781761a91.17.1782901711295;
        Wed, 01 Jul 2026 03:28:31 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:37e:cb9:fd7d with SMTP id 98e67ed59e1d1-3806a04dc16mr4781733a91.17.1782901710815;
        Wed, 01 Jul 2026 03:28:30 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm1658103a91.3.2026.07.01.03.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:28:30 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:58:03 +0530
Subject: [PATCH v2 1/3] dt-bindings: regulator: qcom,usb-vbus-regulator:
 add qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add_pm4125-vbus-reg-v2-1-6bac2bac7131@oss.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782901701; l=3411;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=l8QfYoFSstIExHnispTOUZbqovMeqrNg7FKcyIklooQ=;
 b=KNus1HbOrtmvPX3NEk/cH+OaYK79g62PBVz1yjxVOjSlFGWX/Sdr/Mde7T/KRtkOksrVeKNaj
 Z5BcgwDmVf5CkswhnR/4lwEeIvFUnHlpYneX5Gdum1BxbM8hgjLR05w
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: 9KreZEvlcBCvr-rybH5wyOcKq3BgyKq3
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44ebd0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nDMmG0lKkFKFsl1axvUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfXw4LuifQH7NgN
 ql8ZXldLAIvI00iFR9ey6qZhWAzu5Qg+Q7/Ut42sUbrwKb0YSkf3egZCMcHYi8JmFCGMH7odzum
 DpVmH+v2V6IdMniAqf61iHgwNZAXS0fbRLnHVtxhu4YxnN5sgBEnMZytD6ypxnRXlynN7oEkC+U
 e4kJuL9sAHGEFV7l/HWe7r0JCoytL/A73/FzOioHngqOJ2u94dHVXO60qo/bD39C1qg0B1C/XxY
 7asgUh958WnnKBkJIpHe3wXnb1gEOKZaQsPkhd5bmkGGqoFsq5EBokB7YvnQqDFe+60Tok2WETo
 yZU4SoBqTKGGPIZJLPWnT1dDljCPML1hIXaxfVUSZ0zm5cfAfnethpH9FVCuZVoUecRRNbIrarp
 1nRcpl2IlEM5US7POpJ01U8QtSYHjmIeqrJmyEN1rkbR/xCot5fujd0w4tYSs3SvEAY80L1ey6Y
 a6HzoVU4G+qNr7oGxqw==
X-Proofpoint-ORIG-GUID: 9KreZEvlcBCvr-rybH5wyOcKq3BgyKq3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX5G6hs3ULABNI
 h98ukNUm9cUBQ7u08bdGbhz1O8GUr6q4FvB8Eb5OnkWmi9OvHXkGyrisYJ2WIBrJ8G8MFQSkhO2
 arC80TFsR7j2ArV2iiRGbgHr5P1cJEQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010109
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
	TAGGED_FROM(0.00)[bounces-115637-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 206706EC251

The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
It uses a 2-bit VBOOST voltage selector supporting output voltages of
4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.

Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
standalone enum since the driver handles it with its own match-data and
register layout.

Make regulator-min/max-microamp conditional so they are only required
for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
max-microvolt instead, and update the pm4125 example accordingly.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a495837fedba026669de97350c566..024b34d0eb1a694b9e0ff530a35f787582caa425 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -14,17 +14,21 @@ description: |
   regulator will be enabled in situations where the device is required to
   provide power to the connected peripheral.
 
-allOf:
-  - $ref: regulator.yaml#
+  The pm8150b variant uses an OTG current-limit selector, supporting limits
+  of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
+
+  The pm4125 variant uses a different register layout with a 2-bit VBOOST
+  voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
+  and 5.0 V.
 
 properties:
   compatible:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pm4125-vbus-reg
       - items:
           - enum:
-              - qcom,pm4125-vbus-reg
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
@@ -34,11 +38,35 @@ properties:
     maxItems: 1
     description: VBUS output base address
 
+allOf:
+  - $ref: regulator.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm8150b-vbus-reg
+              - qcom,pm6150-vbus-reg
+              - qcom,pm7250b-vbus-reg
+              - qcom,pmi632-vbus-reg
+    then:
+      required:
+        - regulator-min-microamp
+        - regulator-max-microamp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pm4125-vbus-reg
+    then:
+      required:
+        - regulator-min-microvolt
+        - regulator-max-microvolt
+
 required:
   - compatible
   - reg
-  - regulator-min-microamp
-  - regulator-max-microamp
 
 unevaluatedProperties: false
 
@@ -55,4 +83,16 @@ examples:
             regulator-max-microamp = <3000000>;
         };
      };
+  - |
+     pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb-vbus-regulator@1100 {
+            compatible = "qcom,pm4125-vbus-reg";
+            reg = <0x1100>;
+            regulator-min-microvolt = <4250000>;
+            regulator-max-microvolt = <5000000>;
+        };
+     };
 ...

-- 
2.34.1


