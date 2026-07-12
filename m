Return-Path: <linux-arm-msm+bounces-118592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fWxgMmO/U2psegMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 18:22:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3B74553D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 18:22:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=asllG8dL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GPKOifgs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118592-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118592-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B4A63020D41
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 16:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4D3355F42;
	Sun, 12 Jul 2026 16:22:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4E356773
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:22:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873342; cv=none; b=Dgm6sBAx5RzDgK+HtpGfYsnOMpK3Bg2Fqb2yMyjjSp/udqJfzLIYcsXLwrtae9IVI3p/9bUqkNRuipUy0aOCosy78/O7EH5jVDzwFZe2EP97pUp+hJUVxw4faoPMV2tt3PWBYW4NoczAw8HfSafuP0egaCDfwzl+O48JYRr5hSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873342; c=relaxed/simple;
	bh=m7sNgFkWWWSKCBvhQRwECvFZHSWU0qxXYNUklOLYymQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YkyOJ5lsA+DVRw62N+FYuuAWK2b8alekWoZbYqocfCXD8aeyhyFn52svrB22qx8yxhPR27D54Iu6PCbNq1d9ditzflJXcvqly63AUuylBp10NZsP5Odiff8gEJ3GCmJBQuZn9Bxh8tCcenAS5sN/0b8y/b5VYP/+fHokUI0GSRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asllG8dL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPKOifgs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZdcY2603056
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J0TZ6pT7O99BP+k79Go2fZyr6dXMY2OC68X
	HJwUIjII=; b=asllG8dL1z5nVSUbwj+K0SOUIjZJF8nmqhikGixCUghvOPu4QMf
	ZAwn9pmqysbcRUy8+xXeqzu+T6VB4ueQS6trblJ8Ch7s8Cg7nBHPITPhRS++f25t
	NDLvbXp4MFz+YuFizLFvYQ5nGryxsw9CB4rT9dyO0CI4Dg80KCdOugMU5fE8nWUa
	joaRG0nOujW9nGpDY/n+lyeHph2zAe9X2Zb0OQmQhin2CuHBJone2NgeLbCcl1Ig
	aCPipKS0qHSCs9mHIvBZID7S8Rz+rPhvtLkJrBTc/ftpUqIWcr0rT+8P7RYi3ad6
	JOofA4vOxzYtTHbrfpTPFVX/DHJScUL5Gdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekck2xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:22:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so20328691cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783873339; x=1784478139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0TZ6pT7O99BP+k79Go2fZyr6dXMY2OC68XHJwUIjII=;
        b=GPKOifgs6jOuwAMD0Oux0Rs3/rI0MsSOql3KUjnAooHYQdklK0N2Dn8ApIceAlQwNr
         GEYdY388z9uBQO3hFM6K1iRIksGsN9IR6N5QCWwhqLwA5vSkts6W7ZRUuQPD3IXiGEeV
         uZWEU5cn7XtkXhhD1/OzNs3tYwAngxx3Fo31T4E1nVLh33bvX/CHVGJ3s2PdlyW64P2A
         gu5uJqsJvdV5Q8+i5dP0hJY/wEmQxF3cxVgQCZSvU8Znt5jE1euaHdV0+RE3YSbj+xZQ
         5cKPIkTdFfVh+RTW3rKiv3TDdVDJNj2EO1OaAvmODHOHb/kn9tmG1LO7JZ87jJP0R+or
         dz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783873339; x=1784478139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0TZ6pT7O99BP+k79Go2fZyr6dXMY2OC68XHJwUIjII=;
        b=iTPbB5CPVToSCACXk7pizATdxT2Eek3tNTWrRbAE7SNFNq6Rq7Pj7Z2FJJtoVm84/o
         s4ZtCU1yQkME2XGvAN+3A4ZVNBO3zpc+sEMCVSAg6pAaUnS4JOaJECyurWQ16s2I6W13
         pW6RQhZcIB84leK1VsLjAhOqweua21sOvi2HL0+BWhFffnsl6cgxcuQKVawf9FNd/qlN
         lyg2/MNYAVsv/Kc1H3KZXo1PvlQ1JPCZW82dZN4s0uDC9yVOIVZrqzr7JUkj6e8kmfOX
         SRxMOw81gFrWfc+Q4/1gKMUFxkibjrFSfDwdJSD/KhWVuBNxTGjMbozFrYRCuWnOrDl0
         1PKw==
X-Forwarded-Encrypted: i=1; AHgh+RpecpZ+fhor5WfE73hK2YxutDLYLJXoxucyfHNDq+k/kMPxqbjASkmxIkeWxsvCPUI3Aj5fylSHgsMTRqw4@vger.kernel.org
X-Gm-Message-State: AOJu0YxfOTsEhW04QVPIbWIqiuAtid8zjkHg0soEtOOItxJ8PVjXyH3v
	g729huznFTKdZABE1wmXJPA+j+o2lO9bxRqFs4msLtIc6s74sITfeeL7FXfaoUFOZ17pAicVZq1
	7giqwC7jwigWs8NbOjprUmmS5fTqhbYxlHxEG+gGId7q8k2YCoxMTdHhTIct22LIWYc3b
X-Gm-Gg: AfdE7cmgOk1oATJr4rFbnN2H6mVGGRAFZvA/NcwNUKb2TpvwyK9FEwvuCDADVNEBNGH
	A0dFJIz/aNI4NBh9ddQnSfJBErBhr1SnsEiYiICSKUg9Sputqc9+pDC2e/fGHOAIGj8q9ip2Hzy
	/PsKjjBv6FT9HIasWCAHovB2z3TYrYsrSoaHFhs2ti80FQvvY0kfMjRXuOU7bApP5Q112Bep/KJ
	/DDbEBOjyoP2VIH+ew4r3nE9C/jo6UcJplBRAzeqS4UnImGI0s9iPgkCkSidRxpeO2OuUCWDBhw
	gQLqayBYtMTrjIhgOX9XLcMWqaAki3ZW0RALFFuSJmsB55jN2SeJaKd0ke4+Dyb7IuEn2Bb09jp
	VU7RTTw/VbauRU6fDR6XA3Bo0k+g=
X-Received: by 2002:ac8:5a0a:0:b0:51a:8c97:9374 with SMTP id d75a77b69052e-51cbf24a839mr58229091cf.60.1783873339536;
        Sun, 12 Jul 2026 09:22:19 -0700 (PDT)
X-Received: by 2002:ac8:5a0a:0:b0:51a:8c97:9374 with SMTP id d75a77b69052e-51cbf24a839mr58228921cf.60.1783873339129;
        Sun, 12 Jul 2026 09:22:19 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm72909467f8f.30.2026.07.12.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 09:22:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name property
Date: Sun, 12 Jul 2026 18:22:13 +0200
Message-ID: <20260712162212.184592-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m7sNgFkWWWSKCBvhQRwECvFZHSWU0qxXYNUklOLYymQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqU780qY+FWlPAgWuN+HepYSkUMaYaZ6dqWeyCV
 WvBUNQzBjGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalO/NAAKCRDBN2bmhouD
 16+4D/93B5mrkuEDCgrnbz1oObJrKCJ8rNxmGX+tToZVxbJerTr5lIFbZ+ad4IzW0WFPl9NNUsH
 jeI9IImDYaPlPjIg+342l0UgCOei5kpBm71Vug1vahaGcLKeOX/MT3U9bo5qf24Hxqs61y9PMVm
 9HZXOs7P5ReVDGx6ENlAb57C9W/YkqxW1ASF7DxZEBnBg1RwHsxFDoUcKjE8KPNCbrNOyWVThiO
 lYXlhMqeRjN2uJFTGQYfFowcnAx+Lb5k/+YST0f/Cvf/XVVq26GGEexkpFq9mFQNvd4RwwmxT0K
 iU6NoPdwz87wTPoeX92TEYptuK/TQRaTO3mU3+0a8yZN4N0uLCjET6caDNIF7GLiUKAjGDNA3O1
 gcww5fP2URDd9oui8FzQZPMQNENfeHNVDQ5gW2Ul+9LFZ1jHgS7KNX6z34pP/eSkhKmvBld2taj
 FmE7OGmHubxLLinpR+6FHmetv2o/NpYT4FumGmFeRLAuitnTfYUR7DHIz8LdrMPn3xbEAhO5+md
 GCVKObP0HPSdMw8FNGg4i9qIR6iJRdAlW6pa79kvfv4Lhm585aQD/I/mlnzt4UW20/EY9h3ub9m
 V+rmbxAH/r0BEekjW93KXgsVWnLP7vbkobcP/CaVGsCmFoaFIRDdluXwMg7EbQ35OvhpLuQU0Xx 9gQyG/uzgfuNFdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE3NCBTYWx0ZWRfX24e/uhFx1nq6
 v3JUN009ndSVoQtXw/czdZt8T1VxIsA9MSSi3yBPkQrBHYEl98S088uUlNAYMOFrLSoEanXyJbg
 g3DUbMG3qEmVK3XulAj5Qx2FPS7S7lph/8f2MpGGnSPtSi+kXk0Kbrg5Ra9AyWAgJgUcFi0Qp29
 Ab9BbH4t+3udbW3J/clPiZEKRWvai3qInKDGUyT5L6+Amm48M4iSkFD2HcJdp7CcAV1iIySnNag
 FVPg9aD/0f1FkudOWk9+F33gvqh2P3JKAV4SFXti2x5sqaaELIVqxRNabMxXR2vlXxQdYytAxMi
 q3QMqGP7cz3dyW5hrfG3RcCWeb6g4akbujLs/K+JkPsjmPHBnyEee7IXxYVDdQCd6E6kAy1fqjj
 uzLEHtI0gdosZ4mAjDqmZgL0pt0+8He9RwmJagVVP59yED+7s2lps2WKN903JXxwpd6ZcQGkxaE
 GHWvGAq6jrgT6E1aIgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE3NCBTYWx0ZWRfXxScwfhPUzXMI
 y2BY+zA0qh1nxaJkCxv3YZrp+1koBaI6KW5x2fSyH2FD6sgeVELjKxX7tzCWscEOGVkIk0VLksI
 mZzeLAfouZSCoXmvND7Psm/weq84sis=
X-Proofpoint-GUID: TkviwyLtkNblLOyKFaLma7MqSioleNcV
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a53bf3c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=A6QOgsZt3dy8YBax7uMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TkviwyLtkNblLOyKFaLma7MqSioleNcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118592-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46E3B74553D

The DT schema core defines the type ($ref) of 'firmware-name' property
as string-array, so individual schemas do not need to.  They also should
not redefine it to a single string, but instead just set number of
expected firmware names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Switch default to an array
---
 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
index 72a7f8cb09ba..cfaa15d86ece 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -19,8 +19,8 @@ properties:
     const: qcom,wcnss
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
-    default: wlan/prima/WCNSS_qcom_wlan_nv.bin
+    maxItems: 1
+    default: [ wlan/prima/WCNSS_qcom_wlan_nv.bin ]
     description:
       Relative firmware image path for the WLAN NV blob.
 
-- 
2.53.0


