Return-Path: <linux-arm-msm+bounces-115760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 46ZECR9BRWrg9QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:32:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A196EFD2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:32:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PHMUDJRe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d8O6TW4c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115760-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115760-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 098A83004236
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E6E36E473;
	Wed,  1 Jul 2026 16:27:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A62036D517
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:27:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923275; cv=none; b=cGkNH2c0tv4Z/q3Nn35ZBe36TAzMuNlC33dQgYG8tK6Vl9AfOD2SxKiCsBwJMegduyv57obH9CU3vpKZ0+dD0TOODCt+RgHP/4an7FPnHaLOIm+wjhaZOUTinc2KpJV9pUyY8IH4c9CNR+7o1Zn1csNteO2tp6IwaUvrrIa2394=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923275; c=relaxed/simple;
	bh=SFkszoYob0NQmXMceDh/DB0rxgYBc8NVUBA1MCXzYRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oq8gDUVlWY8YEXHxZF9wtaO0ABG8gcvpUrbS0f/CupmeQtjKE9QHos3RzNTD/q+Mmc9iWFaAF3BPfhP6dKxpaw5iLmXEsZhUTKCYaeVlLd74xPyzilHLAkt6F3jE6P7di+DWGZ230wLjQBZWXcNYDTSY2b2VvFUeWiAvyfdm4as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHMUDJRe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8O6TW4c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoPPk1553322
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHK
	eyk/vEhY=; b=PHMUDJReCDQjIcQ33EMGF9e5oWRhlkpFJ0zIXnP0cmDZlly7sxR
	RXsJDQIIcgN1bWIrUen/L76d2CtDxSpnYRrNxWoObWiRNIJTczG+xF4tDkjSccjr
	j96v9JA8CEQUGeimDOmrWO0QOlA7yUpJrzpV0U5m5J2XVvmQW7HmT0mfs8KSCq2S
	5aNaHFUPcd7js8h5iWTKeuwKFXZHqbLS4zPrk8FywZ/ac1zmkITNO9kAQCEHqqSC
	UizLS7EtiikSRtmCd0DXjYdxCbwes5lQg4Ws1N/2c7Qrgf0ln+GG5UEu/Tm65VLa
	t8KrfEl2qs1XU0iAItGhmltnM78rs+jFoJQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd1kwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:27:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so610313a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923273; x=1783528073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHKeyk/vEhY=;
        b=d8O6TW4cnNjnm4CIwH997nEZGeEMBA2aLMgxbV4TEo6JbxB14mghDPU4+976qPfQHL
         uWahm0fiHSou73Qs0nF+FMEwvXPaR78j8Aah74O/NYbEEN3rypCnm1QVSrLU/mL+dccK
         8uz9iiAtRg7bVx7To0/SF5Rg+NBGZ9qyzkLTqujnL0ljUeTJnHCihV9hti6EEZhgKmua
         dmq9Fy3vb+1drWsphWlFEnPTA77c9TvoBTBQm5t7avGDvIHEys+ZUQnV95r92vc7W1NK
         rA20YtoJv2fZeaW8/c6N2emEAZYRdUIq/BFEakvZkfdOvCDq4tlDtrlpt3ABaTDbe0RR
         m7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923273; x=1783528073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHKeyk/vEhY=;
        b=MbsOlkNUTLnFKKTUVRj31ihKzzoSxgT5DC+5sozPmJdKnNpRG6HMcELK1ELt7Gua99
         U4dngW9slHGNGN0ugickYR9+D4W9/u3UttAkdgGqTnxFX3CdsTd62SRk9cobrOrdaP0q
         k5GbobBPXjbptMnksyUJA6yw3WKU3I0D9EoqmOd3Nipp0G9YP7lKQ0BMngLIwZMgxXVC
         ZVdMh8Vaxg8+IwI6TdgJqchWHf1n/iKd/KHf2kA2LCgHiN40kH/y3pMDw+oP1mQUsBvF
         k6If4u2yvg+84hT0Q6SFaLWt/nA068MT1QOEZOpmk7VOyMDEO4XRMFJTQ4h2qW5XO9Al
         7kcg==
X-Gm-Message-State: AOJu0YwheviHbNR9mL//ZXgR6eTMg3T3nS2B9Fu7zpO5OSU/7WqHO671
	NSVKWnxYX90zLAyqt7Mdk97eZJlNPq0iri7wsTMAM1UxJSs0XpIjiJiXsFeZ0oF642b81mh9toz
	kDCVL9RRyDWb4l21nLxwdpbtyda9cZvQyk8+QNHgz27Vo+wLk/2CCbFe9w/aw23F7D95+
X-Gm-Gg: AfdE7cnrJ1jfXoE497ASieIFrmCW8vjdOn6PvwVCip7CrJRCWQkWfdeY67n9CbaI62C
	xRJ4wPm8P3TVDGDZqiOyCqSHGUs8GDzfVd8zpLjZr4oAn/3N+JtZ9jeYWksPdJdozzT+a0GhOvk
	DiGVMYrii5Ff01NG+a54xElNJIUJfcmlODwJ/o3EU/oK1iE6Z+7OmCumEthy2WlC7GhBVD3M853
	yteoUmnJ3M7y5Dqo3Zu3znSCYa/NXkHCwSyHYzV2SvHRWezYyLXhtk2IOcibdv9HDzC84aOKSvd
	LU9cVZNFGsvd9NHi63g+kMcqCk56ubgCfG24x8P+JGKTw+xYonWPCaygU11e3ReEIEFEkXQFYPl
	bcXP60Jd2VnWrMl5y3VyvK2zOwyDH+nOPHjI79OxlWx5NZmneQdwCaPoyIYFvpWmgffZujHPJE8
	sZIDgZ
X-Received: by 2002:a05:6a21:48d:b0:3ba:ecfb:ae2c with SMTP id adf61e73a8af0-3bfed2a20a7mr2405038637.20.1782923272901;
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:48d:b0:3ba:ecfb:ae2c with SMTP id adf61e73a8af0-3bfed2a20a7mr2405007637.20.1782923272447;
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abbba82sm24782403c88.14.2026.07.01.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
Date: Wed,  1 Jul 2026 21:57:45 +0530
Message-Id: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a454009 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3e1sJlzf_ErWyEvw0aAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: UH8wV4KfkARmBXBdgZIHRwboctSxiFNT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX/BFmW44R8E94
 BzpAgK6BHWQvGYPS4Po3VY10v60TGkIz+5Q3MyqUfw82L68Gcc6GLPqAQSihrkpotBnZ9rpQUqI
 RFbQ/L/kpp9MenFGljZKIpCXO3aZDao=
X-Proofpoint-GUID: UH8wV4KfkARmBXBdgZIHRwboctSxiFNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX7jih7XLBQfU/
 euB1LfUBuB61nVaWo28B3uoHtebGWgPMHhuiiibsghc8MHzFbHyRU4JxW5DVmQj0/BFDefMq6Fb
 gX6bFzpXzw72+m9gNUnLsn+hEVToJHF1+2FL+SyxhOKR0MoXqt20yMv/PAK8ErjQBbmUeYC98aN
 CInv2JKkT3MHfRPHYZjWpTX5fi6MREJWbFgshmqMMqqOvHDUbgRvprLUE/Go5Yq797L87L5QHg/
 piTkYnf9bcQoNLcyY6IYJ4m0v5MouJsJ2ZaoIlURZvk1Qxa8AFVDaQ4pXmkw1uY1Cmtiro+gta+
 LzmY7hf5/0PxVupLxeivVQVz25maYjXBf/a74qWRbPVEsIZ9sR+5QIA1wSHv+BwEVvYOZT9qxZO
 1nbNjWihGF6hTvTMA0kbDb6MHg2/w+p9B2+VMSNIGq0bnTMKsRotsyKEavJRIj+YN90aHFuN2m4
 y6Po03L8Hxpb4URd70Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115760-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93A196EFD2E

Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
has two usb controllers and the secondary controller is high-speed only
capable.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to v2:
https://lore.kernel.org/all/20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Moved to using dp/dm interrupts instead of qusb2phy interrupt.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com/

Changes in v2:
- Updated commit text.
- Separated this patch out from phy patches.

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..026fc715eebf 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -60,6 +60,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -386,6 +387,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,shikra-dwc3
               - qcom,sm8350-dwc3
     then:
       properties:
@@ -556,6 +558,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3
-- 
2.34.1


