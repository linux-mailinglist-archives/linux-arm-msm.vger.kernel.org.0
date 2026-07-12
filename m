Return-Path: <linux-arm-msm+bounces-118581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgXqNlmrU2r0dAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 16:57:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 996FA7450DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 16:57:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E+JFFlqB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HLfeZ1GC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118581-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118581-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3BE33014421
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4255630DED5;
	Sun, 12 Jul 2026 14:57:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CDD30C160
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 14:57:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868231; cv=none; b=ilSYMnTsnUQWrtuJMqTs54DiHL5emBVZuzZPdi4SFA/Xu3hmR6e7nvzZqMIcbPR7h+R0FCHQkDKW5+dGp96iB7tRv4jTLp4y12lNAz/PdxOvZ+ZYF62qyosBxW2YFiPmQAthERiryfJ2LJisosv7YXLO5AYg+TGuDf3Xp5tYGVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868231; c=relaxed/simple;
	bh=Ewxp0eWN9scx7NBRSiYW1UAzNKRXni9sv83O1PAoMnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVIDnDkenFkIj86QA890HZESD123Rsd3AevBASec8qwJXTpf3npCQxVBJmFH5R5P7LiircDtM1+fBIKlNXPOTcsHsr4+ZXeEhCHIjTMyvAatGuemPN6kBp1dUGxeTQEcEaph9dKSZna8MXa+xzRIDaQVi+N5L6XAAQkmfTjX8Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+JFFlqB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLfeZ1GC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZRIs2555925
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 14:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vJRsdfLIQ/9jC/oP9S0fE5V21GX2hmcaZQB
	CCJftBGg=; b=E+JFFlqBP3WDfCEg3Yxy3y6Ku9HHTiwu9ox6KfKnF5p1dRx4d62
	GBZmcZ6DdTQF67YzATjwlzpIFmkLE620NHi53D5cgtVptgt9oNbCcKO8vnzkJ96q
	+bDHNv6nZIpO8px7WckYir7nb7AkG7ERZl89M5z/B0VPU2z0peWfI1aCqIu+inl6
	4K5mrbaQBpwXFCRXvRfTzWdB/7sy4Eigrh4upodsAvJ3LeIjegHIp78AJtjVmD0N
	0iCxFFVgadd5xlgVYeFKtw/RpubSGHW2pdlY4R/0HqjdbNFyyE+1s5amQw5aMaYd
	Ee1QOHrdwLtlM7xtxvnAF+IffGoYJygcYhA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9k1ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 14:57:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so29911421cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783868222; x=1784473022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJRsdfLIQ/9jC/oP9S0fE5V21GX2hmcaZQBCCJftBGg=;
        b=HLfeZ1GCEBpOi83M6qZTnk9VpIc6dMk7crO7IVuaUR7biknV7tesHAgBGoA94GjIBv
         cej9lP8WspjOgARFJ2SQMlONIlx7rgMc9dv0rdv8XtTNsuFoo92hd1C9KhCG4+XW0gew
         EYgtlFqoCGUT71Th864juYEtWr+zNHddD7zGXNMCO9RRRG+gKPwD4ygj3phMZ3zKSAxi
         ReIq7j6G3x9rBBL4G2gLhNfC7d4WZ/OsQ4TR0edlXFiK2G6d94MGaolENF0+sOI1jD0k
         /0ReB/M/omXkle0oEfJ/WVbnLY83LtSfL4gF4mjFIKBtYMFcRVzFvSFOw/Rgo7c9IyKQ
         PNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868222; x=1784473022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJRsdfLIQ/9jC/oP9S0fE5V21GX2hmcaZQBCCJftBGg=;
        b=i5jRsVgn1l5mYBN4NzPNngIF0/nMmRQ20QspO/9vpSq43WUpGIPmiroPItTr91/mlZ
         QJs9t4oZCaagywqaEdawOKTTy1p2WoBOzRflYyDnxrTU35v/Ur2aVraSNyL0ndJZazhU
         64kJ1+gHgZBoK4wBZsv0oyXODrQTR/DWW3ojZT/ECCWil8e6/LwyMCJ0xHF7t2P9quhA
         PMxjsaqkSamzodPaHNdAfPwOrsQlwp30vy+PVJnzsCtmNDavL20z/Dkicd4010fjFNip
         lOJSr/mNPS7YHaCDKi3MriIRxscL3Hzy1jWUXuOiuAgK2OyVkV2XDr2aGySsr+iXv/po
         DCUg==
X-Forwarded-Encrypted: i=1; AHgh+RrwEJVqHc0PE1/uFGCRkkiJq1ildFImtImr1gCFYz/t26t9hSkXxupZoJUofZ/xikG7EkRO7DuTpAO90voc@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhcFhms83MK/QSAwsauUOl7Fv5dKE/Dh/Oys+BlRrL9WPdYiE
	Q6NtfeZBrZ7cFiWftAGwnN6KxU9NYP3xlMPHSje3lTf/fMzJdyOom/2PPW78FEpqA2K0+81Yn/3
	SL9dQWwjBBqWkqMHJJnES1znjTvGbaiV2Jpf/0wW8emcbBJfb8x48rNl8PBKSklod6VdLP/chBE
	IA
X-Gm-Gg: AfdE7cmQm+tspnfreQHgC4azsJiabIN8oJWoU7bkm4Mdyu2ArVI/D7QXophv8NqApkE
	P52nZdSFkWEZm/kms2swTj5N+X2YESU+2iK9Uyb9aV/nuOVyEB8DUb3OcHKRh+dWykGSvXnoCEd
	BMrUIgAM9rOe/R1gpXV/BhQMBXPEYIUN4JKze0j9Uhmk+McAyNy5sC6EPNbC06U2g9bxqUqysvE
	m6N+es14w3DEJPkrYk2BeXuIXhMnTNUGRGhCQ3FmsJGAQhyPe7p/gOLGkzgWJkZv2Pob+FE6HSD
	szAsrdYe/UtiEoX89MLUFKjn7Y5ESE900Rmknoo3Ddrb7Bxil8wXX8E0snae8hA+dkYeP5iEFyg
	C4LEv4DIppKO0woFjmxkMrcoxgP0=
X-Received: by 2002:ac8:6907:0:b0:516:df62:bdd2 with SMTP id d75a77b69052e-51cbf280b68mr53093571cf.55.1783868222196;
        Sun, 12 Jul 2026 07:57:02 -0700 (PDT)
X-Received: by 2002:ac8:6907:0:b0:516:df62:bdd2 with SMTP id d75a77b69052e-51cbf280b68mr53093391cf.55.1783868221806;
        Sun, 12 Jul 2026 07:57:01 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ea082sm318971065e9.11.2026.07.12.07.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:57:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name property
Date: Sun, 12 Jul 2026 16:56:55 +0200
Message-ID: <20260712145654.126171-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Ewxp0eWN9scx7NBRSiYW1UAzNKRXni9sv83O1PAoMnM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqU6s2/WnOw0/8DvhdHRatl3OFbU+ampeU3bMd+
 Gu6Ibm5K/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalOrNgAKCRDBN2bmhouD
 1yh+D/wLM75a39HnHBqGXcOhcj2Fq+ZOM+whd1OIuDzPF+LtPU8LKcgPy3H9fb5W6X8xyoHt1Li
 GJMeVnb/r5+WV5lwPcpAflYujiLb9r1xYttReNf5vx7t6vNS7Cmeug01KB+YQGNYFX4EX+kn7bB
 sO8M8dCXSblfHNcDeWJo8fkE7dxGtd/h3x5ifBFma3O+XKYldbDTVJFbBr5tU6MpZeJ4b5bwg/h
 lIic9H4mQDMe9lRQZwVVO8HxkKvVqQ16jzI9vcq+tdQ+PS/z6cUd3V9UVRhwCLTjdvmUdeeWY8d
 sfDchMQW8RJUrYRGBGnACFdz+dxuCaTEW4sd5u8RRmSwQy6zIMia8d6Frie+tsBfOIAWrPQGTX4
 2prOBSSmAx1689uk5Get3xgM4FGQIOPAFiCI8RRfAlVgMseCV4i5/XfjVmqMqMxrG5L28rZrRq3
 QcSErMQfTLWdr2ag5u45pb7TbE6H7L9uvWi5f9zzYlGK2g/Z5oeIr8jfvqSLOtIk60GN+AoP2dD
 Rm4Rl1ZhRgpZjJYkJq6w7GkVigHgYkYn0gGJhb9+pF1gUfysGe1DycmQxQi0N8hDSy8pO0EJvDt
 kKgEp7YG7QApErjdUZHZuGC9kpT0+jVE+SosCd7jTMuSdX5uwJIg7O831mUgW0RbkYfkLAwQAA9 OX9eQpnxWdzSRSQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfXziN7gqp8Xm3T
 k8ZuzwjhQSxUv9k6h3rnXbOES7HEYrvvL0XrOnNEveMAMVWPx7dlVJCdzHx5s7nGfsUGXW4dCdy
 ANy8NGB5UFWjKScXpICXXek9gYTx6Hg=
X-Proofpoint-GUID: pEfEyUtNefrGUZYCVEheRNC0tChCf4RG
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a53ab3e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hJuU4UVuZdPSbFSiBLIA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfX/bihlYETtjVq
 JQQKXrCdgJnDmjl4rTyonLxhf4340NakPVIApEIYLWYSGUmar3fmkHy7o+Gyt4oYUTiSn9ntgz2
 v5qfdRFFMhZtbp3BfB7mVEsh4vSNuaTCoMHleVDiiWvmwtLcTKnD/5fpAG8B2ADgsgkuvQ5zEri
 1WUpxCUPOlWaTfp8MhoHT9bgyyoh33cW43mEQpCGlrKHNnvB3+G0KiyjIeSPu2X7Oss2lYgKU+6
 vyC+X3vFfTUvjAixnadPglD3/85eQAYS7evD1aeaKi0qr91xIOkyrD61UHY2pmuwG+0TkibO2UJ
 ACeMsBDNVhIlDypiZJZq5yLwaUhKmbFyQU76CW2Nx6YVUt9pW7eVdrj/RgNJhFM7C3O7506UfCu
 /g7SB29sDzqh3+1CrrjP9jCW72Fxs8C8hvxu3SvUvaymZn8bF0hjPzHJ/bwZtqXod2csnq3tq2T
 Mlw8Kov9jzRwKt4oGFQ==
X-Proofpoint-ORIG-GUID: pEfEyUtNefrGUZYCVEheRNC0tChCf4RG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118581-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 996FA7450DA

The DT schema core defines the type ($ref) of 'firmware-name' property
as string-array, so individual schemas do not need to.  They also should
not redefine it to a single string, but instead just set number of
expected firmware names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
index 72a7f8cb09ba..eb76f222d681 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -19,7 +19,7 @@ properties:
     const: qcom,wcnss
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     default: wlan/prima/WCNSS_qcom_wlan_nv.bin
     description:
       Relative firmware image path for the WLAN NV blob.
-- 
2.53.0


