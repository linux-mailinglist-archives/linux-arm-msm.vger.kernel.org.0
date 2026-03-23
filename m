Return-Path: <linux-arm-msm+bounces-99130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMF5NjcBwWlUPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:00:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5812EE94A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D25D53029E4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E153859F9;
	Mon, 23 Mar 2026 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecK4OSr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEbRPuGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8AA3859DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256073; cv=none; b=BIAH0+TJoJ9w7RpuWyySK3LS33EhSNmmkOLGGqynJ+ERtjeWWT2oFXJYWgXFT4HAsVZeR+zxkshorC+Lvlk+fjUIyyaXM5eQfuNnYNSwSegZfIYPtsDejrCQYH8VuyUIOrQ43QVfNW1pPDChj7+wqgKMw3c2E4B8hneajqJRh7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256073; c=relaxed/simple;
	bh=WDwt+iJWsLrMVO9ZsmRBE3Ry8wsQX0z/9z6PVVpk62s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GOpjW7AP2HPdcadUsCZ9Ry9x9HsP/BlxHSaxNxCg7j71qdiC5bhWMGM2NAqv8c7aBZToFWMJxAWy6J0qsVH83lM+dEe9Cik1tTWbMia3Vf0YJ4bMCrWehb/iWWZfdu3FcqpcR9ezDz2ILOsJ+InIlyIaM3AfWsv0vMz4lkjIiyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecK4OSr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEbRPuGK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N71kNW1040726
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1j7aXR0mBvxICpb+HVyuv48KVermp7Qzb1+jaye6ls=; b=ecK4OSr2nk+8aWvh
	VOTmIlAofkSYcPJswqh3k+UWX74Va37lDYJzOSDPGMTBBK35XICjzU9z3RtSxAs0
	DHbUub5hgwidyJHZxKFbtoZ2UaInhU6tWuiKHRdLjTlsdudyuUwnXzMiETFpwDGW
	aTlT+OZDN4wfZRE3nEuWBa5bI+8QPtl6zneCsg3HrjS/QMbnvzls14hY5dN/x5V/
	Yer0I3jkuX6Be9xYceHYIk6al1jwCeCvXaavhhU9IzQxgRByk5njKqCobXyCxx9B
	bD5ZOPEY/wina6+3hifOaOVyJEn4EXTyQtxzb0q6y3iI6dDoM6ifE//emjfkzZb1
	uRRPqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcep4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2cbe7223so46722531cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256070; x=1774860870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1j7aXR0mBvxICpb+HVyuv48KVermp7Qzb1+jaye6ls=;
        b=cEbRPuGKeaLAynkbK2Uvi9Lp+jMwWhB3pLL01AkxvlAtLkgikxdkHbmN1q9DwT2dcd
         AEGrndd/yvFoT/2Y/unhy5N3QWJgzz1evsI+nm2KmaiIYLX9F1N9CX200L2T894JxAE3
         bBNFosQJ3ZGNKGuvDS6oMPvpHVVwfn5vfCG4aiNsFSvCX2IgFquxRiSKU93KptUxkcrj
         hxSqvM9vWyE6L1Ij7PAMCcIgGXi0TkYOclB961b/99+aXqUoHFVA0PBjGnNn3FkWsGxU
         dNyKkwuaKd9+PYUTrDSEwRxjBVMAp24lyI6kCA4QOUN3UO5fqwY31CrizK0O7dyemkH4
         xH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256070; x=1774860870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O1j7aXR0mBvxICpb+HVyuv48KVermp7Qzb1+jaye6ls=;
        b=LntwxMtvVnAp0M62SxzjzRpclPBLIwDQL9gLGkb7y3haxViyErDMay2d+Qp3i6C09y
         6F4NQP6fkrGDpnyhSWFKVshfJfYf83WFW4LI5Qc+wsu9ta04MOYXt91FcrNdIMTSUv/x
         /d82vLLX4xDybq+3SOrvf6+QK6/bhTZSKuMuBuS9Dn/UMHZFQw1huqY++HwMVjGBdErI
         VECL2zyswvyTd1iqntUAnvs2z28tBsx3gcucEerC61wVMnmOPBa4NC/sNVvKGp9uYFE2
         3SUCK2RORk0NOy9TTIpqkTaxchKZNEaTBu6NdeIYbYOhGui+CxNFaaZiSOF7UM6attgM
         5pIA==
X-Gm-Message-State: AOJu0Yywwt2pKBO4uRJ9rtJeKMs0V4pwTO07QwARyrqj5KlwLPGImZaz
	amPsXK+AYVAGvbY8mLFOz6nz5vT154uK8r5QU+pb+r6ZF5m/bTHeWJSQMcovWLfg+nrdm5QxBBa
	+Kt2kZjovSmf5igq81lyOBwlrt8nTJ7cFO0bBZLB63u6JEzLT/wIgM0VyTB6/69V9eQ/o
X-Gm-Gg: ATEYQzzAxNGPPycLfX+NkDuOKrdosETAoeEoNuiMpAfu0h1INwlA4pjODc6na3Pcti6
	78W493vxty+sMTxXQk2tby73Gn34ouVGl9Qdv9tiKd+fRABszRlKVIkXEeTkVVSAJNuZ5FRvVOT
	VohXQpTwh0Z2cPB2mWT1avd/+vjK517GIJopnDlzrAchxYbXOlw2ZqMxGocAojmOywvKC/4MyPI
	Ne8srB04GF+B/V3LOQjx01yKC1Q3CoGVNSB5TOnbcMgwLkOi69IRYxtzC0ragEFfN0eHY1c7a/L
	/EXOwsHVgprJ85RK+7VtjUZyL17ERrjb2dNNMoRcUCaCP3jLHPwyKXNEF/kcTyNmZjCnQA7KmlT
	Fz1vQDZiK+H8urXTkacE6gLG7qv31RJsPgyEqbqEiSagX
X-Received: by 2002:a05:622a:6090:b0:50b:2096:4950 with SMTP id d75a77b69052e-50b374c5d13mr184875301cf.44.1774256070358;
        Mon, 23 Mar 2026 01:54:30 -0700 (PDT)
X-Received: by 2002:a05:622a:6090:b0:50b:2096:4950 with SMTP id d75a77b69052e-50b374c5d13mr184875151cf.44.1774256069896;
        Mon, 23 Mar 2026 01:54:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:13 +0100
Subject: [PATCH v2 2/5] dt-bindings: usb: qcom,snps-dwc3: Add missing
 clocks and interrupts constraints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-2-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WDwt+iJWsLrMVO9ZsmRBE3Ry8wsQX0z/9z6PVVpk62s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+8U096y5ipdmEXzRM3nEAq1lULg/vILhHT9
 939uM0BZJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/vAAKCRDBN2bmhouD
 138zD/0ezlmfMNxEESgkB6uorN+sXos1Awk2mLoFE/x+RtObVv9nFzV4PR/xGkSjNR3TXFlnz09
 XkD8Dzs8ZXjb6GbeF6ws8Jg9W1hqabAG15W9kDdxR1SMpcmovu7A0b7tGfzOTVCBoVF+DRKPlPB
 VoyIZXUFwtm6OGVz2xayprtA52IR25it6RhhwY+YIH5sbywCOxiHbtAzyZ1KofhbtUWiW+p27aP
 EE05U9bbsGsLd5aak9I7dCL/q0xnBLVIP/6fn4qhW7RsvE96eBMTojLgKJp36Aie4Fv0vrRnS0Y
 upfDIuOkX0XS3YEjtRylFF4etlYK8bxXu/mrH6r5zy1J+kVm0EgW4YaqeNeFsfXbUsy3mHBSka4
 pq+HgIoXLWbRU5E5QwNlU3Ghb3tXxO/LiV7nYO6ET0W2PB9l0jpikpL2DMPA1rdSp+qCbxF5E3t
 CMjzkg5/kyBfu8Ab2435sax1czePSwlfR+sKJMHO9T23KFMF/C34K78L6vAt3msgvbEv8CgF+so
 PWdLJnnn9qapYGEE2wEmA5a5PEIuDwSjOJXk8wVzTdA+xU2mO+Kuvj741RdeDOp7F6OaCkuJi9O
 HcplXbUhpPyYlWINfUij84ODR2avmG/bP48WdaAsZltIvQUn7usXNFkdreHf57SwbVf3j8gHGLn
 Nm+JHSnS0nRdjQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0ffc7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QW4mu7NqH3IevVM1T1gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: jsNVXyoTxt_cFVkdMcA2m6B39MWkgriC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfX5SIPJrKU0tgD
 i3O5dIvdQ28Sc0rvIhfKyezBscwt77gp2g0m7xcT8Rkhoa9NgpDnEq/czIW9efZ10tkZZKXFU8F
 8dfdvxnEud9TZKJDE1zbyhfAxEYbcTKJBgXQ3P3ZCQ+yQZV/+z+oWknhYx3YKGt4GIJha1bB/0Y
 6JspGDL8vCN28pxu2HupaPcmmDn9K1nbUxhw/6mEvdAr1McfXfx09QMC4CASt9ujj/Nw/BWqfov
 ZYSs/R4mlHNozblOpb6zQdt7A/DxbWzCUdikaVf1vjEWIDbcVMgVEvNiqnU7R8h/TdMdsUVWSSO
 pWKxEvotkZFbdYJzuj6JP2P11elLPCa6uiq1PDyGaBgEJ0Gil3YwpJL9D6H6zTLfohPxRepSMef
 x+yBwqj0cNHqkiGAFn9AMl/FLFWmWqSeroWYdjtDGOO3X7L1QQDu7bhEvJgX5Z8KIm7Yfroh13D
 RC6+4Yr+0JvLPnv+QSw==
X-Proofpoint-GUID: jsNVXyoTxt_cFVkdMcA2m6B39MWkgriC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99130-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B5812EE94A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The top-level part defines variable number of clocks and interrupts, and
each "if:then:" block narrows them.  It however narrows only the
maxItems leaving minItems undefined, which then takes different values
depending on dtschema being used.

Recommended style is to avoid ambiguity in such case, thus if top-level
part has broad constraints, then each "if:then:" must specify both upper
and lower limits.

Add missing constraints, mostly minItems but also maxItems for one
variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Narrow also interrupts for qcom,ipq5018-dwc3/qcom,ipq5332-dwc3
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 2b6a0939d98d..1ad2b52955ee 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -173,6 +173,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -220,6 +221,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -262,6 +264,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -281,6 +284,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -301,6 +305,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:
@@ -361,6 +366,7 @@ allOf:
       properties:
         clocks:
           minItems: 6
+          maxItems: 6
         clock-names:
           items:
             - const: cfg_noc
@@ -402,6 +408,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -470,6 +477,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 4
           maxItems: 4
         interrupt-names:
           items:

-- 
2.51.0


