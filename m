Return-Path: <linux-arm-msm+bounces-99133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DhNCoMBwWlUPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:01:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6CC2EE9A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ED96304602A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7133845D5;
	Mon, 23 Mar 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljb5Vz0j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwWMZ/QJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F01E3859DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256080; cv=none; b=CH7fnHKnp32+Ny14sj89s8Dmb8jy9LkDLUQ8GiQQe0TClOY60QGGVjQOjRLrQSMn9TZawOMpzcu/tallpuI0rGRNHs8rxAztI4OnDKXkU9FJt+lRqORilpDtorm4woKaK2yiPsXTo8gDsAMGpwiL2MJjF8K4xwqXxeT64sw8uTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256080; c=relaxed/simple;
	bh=1uKZ8aQDg19j7IAPU4TihzC+56HOG3OO9Vd/r6Xi+UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRGGoJ9NCIW1Zc4yu3v88rbr1agFadnrOVAyeMrezWV5aHos6M4xbzy6czyq+Mp39cHBt2GYDy7dojLHBAlVb51uJ5T+Qp2uzUcoPFHMSsA9KY9bdITY1B7HJE0mMndYNBeeSe1G+4qC/xSxYcn+Z/irtrhapnMpFLXhlAQQ7ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljb5Vz0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwWMZ/QJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tM2u2291969
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IXVzZu7IuOB0wJ1BjfV0mPjnSMVO3zU7g5ti8b8Ltnk=; b=ljb5Vz0jeRBYW8tB
	gIHOx0uvbvhLif4aIE+Fdg4a0kM+6H0B736MYyTx1VRYuoodXTX9dYQ5Y/yCE59T
	ceLY6pGCS08Us851n3rvG2OKT5ASXg6xAZ1y0HGvuKD79JnJ5fAzEX/e59vy/utO
	2sJjrlVeQrofjOdznYlso0aTWC0fRtnnvlkiXEHHTNwas956b/6BSIER/DYAu1NB
	ff58CJDfK2zAbAggh5Fz070jOszCDZgVNGQQFkjOfNcDGg08E+4kfyvBDHG62xMn
	Kn5NfuH63iH74ehYhc0GDg1Pyd4iilZQ/IC8CE5nHL5j317S5b/mgbYVCwavL3dr
	5StVlA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j705px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso153992951cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256076; x=1774860876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXVzZu7IuOB0wJ1BjfV0mPjnSMVO3zU7g5ti8b8Ltnk=;
        b=RwWMZ/QJ3gH/ojHkiQKf7m5SAZlwkaDhWM2Zu3SGKAlypqyFTucVuq9U4xqmaE+OaU
         9nA9uxhK6e23VC7z2bhtTQJqfqVLmgZxcCCaFqVLPIj+NxJc3x42y7EjtYOdz3DU4+b1
         AZNE7sIO0VZY7eCZY5tWjQsoPxvRSiaHFwtWK52vH5fBBT2Ls2CoxbZbNujRl8uF0NV1
         qGE4C/cNW6cFELb3gs4K6bF7MIvFlV8Sh+booOxiqyReaXClEDzx8e3Y3+FctVDvV111
         tIrQJFwFlHl01VgINwCrO7Hy0XJE8+2zot4s29f0uGMnTQrFIL6Epnr2ls+l1QPHdp6m
         BAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256076; x=1774860876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXVzZu7IuOB0wJ1BjfV0mPjnSMVO3zU7g5ti8b8Ltnk=;
        b=ekteWmmuqb4sTJmFOV+hYaMtQfbQXJDEjvsgh+wxW94eVLBaiNJQJUW7usObI8Xmn6
         kPfQOEv8ACA0qRMcTceLgJstMFdbOlmnBuGUkeTtrMuu7jcnv180eKSDeLNUeqqwd2LP
         0OX1rsVA9cTwdKz9Dq7ju8Tcxciq0vRra6uay7o3yPPVwcz4uX6+F9/xnYyd0PuKb3lN
         QAYOWQ9SqcM9ZBXdnWFwEtdxVzun9wzGHpjCkrRZ0c5fTfrweU1eimtcesp/+olkRtms
         0PesipnxNYyBv7mCpoqk2LgijSpZmM+gnDdWLL6n+LUFjP/ZdIC/Ov7N+M3H7SQ9f0c5
         DrZg==
X-Gm-Message-State: AOJu0YxT8QZyOLoQX2tHx65E0a1kRox6kE1KfAEv6v52Mcw0XONguoX6
	yXsIAUUFUdCkBvvKDOzGtt6MrhiMAx+P+KwoS5xGF7qeyW3u2Zwa1KRZrzyX7fXRI5jLGhxPKt7
	GLK+CjxlTN0+hg+bVHidxu4sdY70CZAojt1X6BF3/Tz1jA1x3Rk50rRe1zw7G8/ObNAwx
X-Gm-Gg: ATEYQzxOJS9F9tRAMCY5lgaejS7wHU5d5fdqUuCWRae9L2eQFRMFOHNgZd57e8bNw2s
	gJqoTLQgbrpJgrsCfUAPZ77MjiZn08xaG7MQ2q8lmgfvKlOZ1lMIZQ9O3noxoABz/Xkpph5Bs0y
	5VhfU+I9mxkpRTbf8/73WzFbPxsZY42Igz+jxVIRVPHlNUhtMYVKe+swCleuOdjLzjwMGQcjyzr
	u99mY/Q7p0txN0Ff0Te8EOUQc6+JfMT7GgHGNQ30C7OUdaxshu5jODfR65Q2R8ktkfErIHBLvNk
	1tvukc+A4oAVWa8kRdD7g8a+pnIYlyaJ0m2C1+p3VMfhAnMpAKVtIx1UfLBblTpG44nylv7HodC
	MNI/kjz+P16hrjD5g6oRbTgiTm83h4QmdLKVQ5MKWvRUr
X-Received: by 2002:ac8:5815:0:b0:509:465:1d78 with SMTP id d75a77b69052e-50b24775795mr223496101cf.35.1774256075904;
        Mon, 23 Mar 2026 01:54:35 -0700 (PDT)
X-Received: by 2002:ac8:5815:0:b0:509:465:1d78 with SMTP id d75a77b69052e-50b24775795mr223495911cf.35.1774256075398;
        Mon, 23 Mar 2026 01:54:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:16 +0100
Subject: [PATCH v2 5/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for IPQ5424 and IPQ9574
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-5-3bcd37c0a5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1uKZ8aQDg19j7IAPU4TihzC+56HOG3OO9Vd/r6Xi+UQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+/JPSzgqr8Tl/2TSGRemUyGfEgb7e+U9m2Q
 4jrLUiYatuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/vwAKCRDBN2bmhouD
 1xHxD/9+gzSoXTSXHEHXpo8Ehv5Qd8ApU+tyWKNiKz2XZwzo4fKid3mAvbTh8zX421Ok94l4hzM
 VT/c5QmyHXZPoKOPeBCa76zhaoPJ6Ty4s0b/AFcga65YpcZhNgsGikgae3Y0Eqv/0uZt6jPqFQN
 54gtEw4dYvmlYq1xFj7bMTYew/nZqfG6w8/03xeTIzswm9WRaX/xZgYHNycvWr5++oZDncC6NY1
 oOF9Q1mP/tqUw09lwchVDkSF1LGGZ1m3cl+Z8psjCYo1Bid5ytYaZSwSCwPwobQ50vgT0SZtSvR
 NtDpmgPeGUYqcsJghNUhPt+8UiiZM/D/9gvUCXFEHrjC54V86Y0AU98BRMrjYbWr6rpVWGFsx8Q
 kUlh0tE6ojnWppu/XL85NbD8pOMokfWlh876P9uurBVII6Yg8z4DCZXMLsi+HXATku5peE4VSi1
 Q1P+2wtb+TLaoPmmQcSQWEVJ9fprV1YspDTXRtKnTvQDk7uyDsLW4VRtXoU08w3bviu7OB7abDL
 5ax/kxU6uO66zWCyglSCir6xrp9w6J0dwjJCyh1JG6gQ/LM07fJpc1wyAIuqxBdECKo7Oswupka
 HHC3wEU1K8F7FIZoLMwJMZ0WvlVPkreGCzIXWRM5ENcIv5Gfh/qnu/dbtFELXa+NBLCJ+ulpXpW
 g6JPJ/hghZZKq5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c0ffcc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=0lf9w4cHkrZQXp2u8_cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: FuwFz6clKBuyZdbVGlrw47nwOqwIdk2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfX6Bz6h4MnBYV4
 gwyfvKTmz9Z6LJ/TGj4kfIyfP22gM1wPl1VDthRkgmZhl4Aq2fHbpQ2k+rDGxRbSivQO/n1friC
 2eNJCTcBakrBaoapgpJyWf5tObF2jH28WPlk1FiZVmBFmc1qK/EQhqIXbCvix2M2xwtl0fnPt1I
 iKCv2bh+MKO0zSaG8aYGzEZLbNtYvrIPALI31KIdJViDs0Mi9oFsEMuMDBGECMm3X3M1eOhBWEJ
 JPr0NJuKsVhDYuaIxhH5C+ge74YLFgIzmOUmWN/Kjs1UhBgYB9Hw/Nj1x1vDXYd5g8ZYRNlPPSH
 pC3VwnyUoCD6LQbiV8O9G1qbDMqD2oLaQG7L+zPIuTqFcnOJyUHDMkxwhxjzqSCeSzrbDUWfbcV
 KetIyXr34C6B8BPtfGQoU+MsnUTqflioQj5gRbLNwqGV7YRkM5lDafCVfxuuTOzQcYioy+SGZSm
 PA4MZtVTYWuRxm0dsKQ==
X-Proofpoint-GUID: FuwFz6clKBuyZdbVGlrw47nwOqwIdk2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sashiko.dev:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99133-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B6CC2EE9A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The qcom,ipq5424-dwc3 and qcom,ipq9574-dwc3 are already documented in
top level part, but they miss specific constraints for clocks (IPQ5424)
and interrupts (both).

Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index e9e534f49183..603d4cbd2803 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -202,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
               - qcom,msm8953-dwc3
@@ -489,6 +490,26 @@ allOf:
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5424-dwc3
+              - qcom,ipq9574-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 5
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+
   - if:
       properties:
         compatible:

-- 
2.51.0


