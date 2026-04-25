Return-Path: <linux-arm-msm+bounces-104500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NoVdA3Rn7GkRYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:04:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A65AA46557A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD02C304AAD5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 07:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47EF31F9BE;
	Sat, 25 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omOVidos";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeSy+GLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A77315D33
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100423; cv=none; b=aBUrHz5+YY8dzc2M/w/vDWcR0ZHLhGfsSFX0O+GGeWw9gMcQOqsITA0sjrnK4sC2S6lMxrcIj9nszmVUxsCViRukrq+qOtQQsA8HOLUHbAT0r0Gk05IZRm+//xVsybIXYC1fFNfi+iZBA/GPX5RBh2OMUFHw1cSwqFHWnzi4zrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100423; c=relaxed/simple;
	bh=NXr+O0DCE8P7lmctaJk+badu117Po+GBS1RB9vjhu/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oq7uUmmkIsAIHXiNgHFmzkiUtyTE8VCbE5NsyvFnBDoNUZa5WSaW55ypeDm20gMvYHbCOX7pSyjI128takmofEXqv2N+3cGa5ayI5ebA/y7MDsIDS0fOLnZoIKJKv1ul09ovBH4RmB7CF1H4ejSYB46dRXTnxn0gDdcTTgp2r18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omOVidos; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeSy+GLc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3M3ml946014
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/Ff6lkNUcmH
	Y8eKeVweo0bOa1Idufu7/zbttF+e+/7I=; b=omOVidos9YQYr6k628pThYfsR1+
	u4r7D5VZkK6tFJMyWmYWI5HYGnRE9mduRkWL7/09C67SN+T7mx44mF9H33+kWd2j
	LgC3caKCPrP4i1WwZdbnUEPIh5KjjEsfmV1GqybHoMy3LvU+i4OOSYc/ESQIZ/Du
	kolH90zZHjPNDE9rxn4garTGRz+6pf8zyw0zd/RWIe/HPKu26jQeqDutEPQK5BAz
	39m3DxhK6gGO6lL33sHVjgJUGDxxIDd5ol7IqbfPnapkYSW0vHggqLzwX4okvzzL
	ixOOs/vzKuuxhqmSOjIhlmFeCqGjG9F+FBNGNEBixoXH6onz/8HiArqs3Fg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr0by6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1275c6fc58aso12694281c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 00:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100415; x=1777705215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ff6lkNUcmHY8eKeVweo0bOa1Idufu7/zbttF+e+/7I=;
        b=MeSy+GLctRgyr8Bde0j91Ze588yFrrmpWNhQqjb9dOtoYHtJVhO7AzY0yaagl/kbU0
         WncimQr9xD3tdp4thzXIuXUCAA+dtYjURBD2PRYpnCGCH/JEpiVqOr4ZoEcuzzfXsF2V
         n8SeKlbgqnfGF1VQyEfgQV2B1PrdgpV6J3UGlWiaurHDSX0vOg3hZhrCSug/Dcwhrqa3
         nLgjrxk4P3vD1a9sMzEd4hU95znV8O31sT4j2ZtOfHqVckuzMMFCiHZ4tRtoUoh3mSKp
         XHEU9wD5Bez7fRFc0GJ/ud4/4I4dlNRryeT+Mk2R94K7V0hdHvHuQlTQ7yLDOxq6xbR+
         U4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100415; x=1777705215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ff6lkNUcmHY8eKeVweo0bOa1Idufu7/zbttF+e+/7I=;
        b=nY274r8Z2sutp7XH9+lCVVEOmsV04J7EaEKqV1IUco2WDNMTRSDW+9xbYuM5MI4Ju0
         kniEyybwo9Rizkop9ETEdt8Cx5VkJ35yhvAzbZlq+LMq6jTJHUsuqHx6MobX8fnRhsBp
         QLqsODXdBX/4+5wF6ipvp0mrBs7G7eG7leTX6WBcbfeJxYK4G+eJ10UwaHN5UpnH5gH1
         r5dp8TDV5i/n3vmNh9EM9+EE7e84njh9lwJncBfUuhA0A7zJV0icAiWQWX2ndvr33yzQ
         cNM4/p5iJ8qhaE/YHa1GvP3mfTHbCn90mXHHxMe+nDDydJAePaSvVlGGVVTBjI+CWYVF
         1vjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v4VZPfzMls8+PPkL/5jRhhnpDDDv7I6wzft3uzIdymJ7OuOifwniSCnkmmP7xOob1iTEmmov3LY0xaJVo@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUkdn0M8Ew3Pk/2wxLL5OIy3nRq1Nydp8uxBCU36DYd3RU9MZ
	TbxrCGbuUz6KgN1hUyPpSaLusIJq6oNj5ahzcPAlPSCpq6Mo+4h0Czqai7qZbL0ERYDnVD4trcW
	tIzpa7lHaecm0loVy67arELx4D7zWtMrujm98bEKWgqizlu7QIISdpKag2gTEZpXBRd+E
X-Gm-Gg: AeBDieuEQPdBTr3b9RBJMsr+dAnYNRjbDItI6zomQScrsjGPsPwyEUS4kDH6dTnsDJt
	Q0lsp4PYD/4brgJaz77cP5r2McRARWy4VUB6uQQvMKp1EnuFxIT3Hc9tsN1QKoxE0gMU5mJ13Km
	Dbv0PlOLEe4fAUhvEhk/B6oY26LOuiivJ0K+EVoF5fbogCFtFKwvut8EhbNTO3u6K6+/Q13PZyx
	4RLgnJuBzgHPQ8uCMApJ33DxrqEwORaqOeGgA4RO+s8Jgizn711jwcaBgm4ZuvzIY5ePewPvuQM
	WjI3Si9g/9Gt0bfiXTbt2OaDVxt/pzebhrelBNRAaVp1YkMlRmuHLwCCXgroHe57kdDVJDYnF2q
	6jY7h7a3jT1cvP1CgtcAYziT/b+VXq2OaXhTtO4BfrayRJNKtk36Y/LeUYLXkOtawo23g5iN3vb
	AtHhTXEUwynw==
X-Received: by 2002:a05:7022:90a:b0:128:d715:b717 with SMTP id a92af1059eb24-12c73f82878mr17045194c88.13.1777100414448;
        Sat, 25 Apr 2026 00:00:14 -0700 (PDT)
X-Received: by 2002:a05:7022:90a:b0:128:d715:b717 with SMTP id a92af1059eb24-12c73f82878mr17045173c88.13.1777100413911;
        Sat, 25 Apr 2026 00:00:13 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:13 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
Date: Sat, 25 Apr 2026 00:00:00 -0700
Message-Id: <20260425070002.348733-3-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ec6680 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mzSaEd5VEpIjRnDHYqYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: Dl34QXQtVu2p4qpvA2MiXXUZ0xXSWAig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfX/nKZn1JgFrHl
 9f7Z7YmR3I2LyYFsiIAqjjfVWn2LTkhm4A6/lIWAcKmzrRePDIZU7syC/rUTwDqEjhvw+DKWPgm
 Nn5LKK1MrsWvt/S2/2c2W5HTgxacRDPg26vGFIp3M8aXVbdPcYmIBi3596R4/naS9pF6WtUIR9L
 OuURTIXud1l1rcoD52pXB72zJg0HxGUPMLB8LeAkUbbm89Hm2qKhPYeBhM/e24Nj4kPAiP2zDBy
 DY9d+QSdi6AzdkcjAGCUkIgIZgMKoOB0rqZ65qStsUji1Zf6q0+uHVj//Glr9lTisxnzxE686hQ
 WmPMRiP4GoKyyQhVKYmtwJH1bXzqit49rq1NzJEdxPLxBm2h+1kGTCHXa0loBWn+zKILhqXqYFX
 iqWYG3R8RvE4JQVa7faPDykwhDEQv8IPazN2+IN9lkTthBj+lNywa7xbM0Ni+fBkePzi/0Hii4B
 EeOEZ1P6R/v55MTDlWw==
X-Proofpoint-ORIG-GUID: Dl34QXQtVu2p4qpvA2MiXXUZ0xXSWAig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065
X-Rspamd-Queue-Id: A65AA46557A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104500-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the M31 eUSB2 PHY for Hawi which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the Hawi
with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index cd6b84213a7c..c0e7e2963ce6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-m31-eusb2-phy
+              - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
-- 
2.34.1


