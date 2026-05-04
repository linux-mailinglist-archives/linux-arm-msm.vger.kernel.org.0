Return-Path: <linux-arm-msm+bounces-105758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPsgLG61+Gn1zAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:04:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4DF4C05D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 639DA3041A1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 14:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF5A34252C;
	Mon,  4 May 2026 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEMKsAgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlXdY5w5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83F3E0236
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906641; cv=none; b=utdGMVEDV5YprrgEk+j5qy+uzIUZ38mCoiT1gMKSgxdwfBMna6/SHk2U3zIR2vo7BEq7w5ti9vjKN3Ju7Fa9Bxtf78Kfa0IEna0MkEPcI5KP/0XjOPyHXQ+qrMeDh6/AkHLiNwMiErOU02R3gKhAgSgjC7cJysnJX9YgVBLcUVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906641; c=relaxed/simple;
	bh=t8CHaF375ZqJzhYzOnhS2X05bGUB34JV6zSqsa5XjfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b9oNq3TOJ62Qp4x0wUQ0Q2uoYUimd1QrQs8c5i+ZPfG0C8tCnJHLK2We+fjE1g/4yYNY0eCA1R24XgMpZECs5nPlfBLaNupApWtnS4WgidTd2q5ZGWeafOQyLb/ggWuQ/yupEUVaI7mIZapTZDpoRtyEv6d/lC3KW5hbleI75mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEMKsAgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlXdY5w5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4FTt4128847
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 14:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Ea0e9ZD9RnZuTqbEH/FSIarRYUkOP881sI
	vSBU+P4c=; b=IEMKsAgwL0AAG1YUYvdvbpSd/gbQPLRgbqupujlQYVpAR20q/ec
	YkXRzbCtilf5koEZIOm7Q2nLEsLuil7JSoGwZ0MkuPicGAq1ZazS84blLNAw9llG
	u+0XIN3PfjCxEYw3ih8D05WRTzsd6MvZt/MUegvNVS9RyDTlgSCuW020AZvXfnd/
	WT83q4EivwcGknwC0OdUNMrqUejX3vSiQIT0pz6JakpB3nFI8rO3+hghp4d1uywj
	0VIOjmQU1g3C/PzZHpEfAZT+X6N9jKgcDVOqdWE8PYX2/YkiKHdfYAjdtNpJ2TMN
	bYk9LAFYKKURM3sNRW3TCIUuISIyhALQ7VQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw0wav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 14:57:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so30157565ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777906638; x=1778511438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ea0e9ZD9RnZuTqbEH/FSIarRYUkOP881sIvSBU+P4c=;
        b=GlXdY5w5yRgq2JaMNghV610rqcFCMubzG03z/y7aRkCYLWBmIJpcytTaLRdwEfB1yr
         uxjPNXp5z/D+tHW1mMmyIzuJhX85MHAVsUIDR/YjLAzWflFRi317aCBigGxgvPuoPB4X
         tJS6MMEQJHDyu6ADIOyZ8PQ/3ure0aWCpXDxSW/vBFaS0NE3A/E69QyoAEvYNbuS8qRZ
         lOsx0ZQciaWRqeAaF03ckWlAbsMI4Y7YvFLExlvDLXj/Ww/xhYIPc4GP8GR5AKnYJIAT
         g+lk1tXpo9OL9GESOK+zdYOqvon3F59VNSTAxhIcBX0SWvjllirEIRQMfNKykum2Svkq
         QfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906638; x=1778511438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ea0e9ZD9RnZuTqbEH/FSIarRYUkOP881sIvSBU+P4c=;
        b=Hw/N3z5iUqu56Si+wvb5BLLHKOB1gCfkH2+eWdQlhQlgZ4NUR8IHLB0yE6jq62ypOx
         5hR4PEYIsn+To4PwwP56Edn+myUWGRKYGAqTt3r5p+eGw4QZICHfq4uVOo5QhvIdGrwc
         +9ppjVzKGBSVsNq0IfA/+C+nkQifVtbHJ3LVMle0JxFEklC2Y9Nnsn4qkK+AgKllQyfv
         r9vkzrcw0pAhRT/PsnaJ01FGxIqG9vO9IzVRRtyAAPeYiicCPAQTFAC6Ws7Bj3nhSBkU
         PvI0QA8+YEOA7jQXRSphrqoUhpiC+vEAvOw/cydEOe6zNCR/B8SH5nClAtn0LzZX5ty7
         UckA==
X-Gm-Message-State: AOJu0YyB+Lfum5D7SDmPF5s5fe2+cjKceSOdhrayCoAAwhqAZHHTLh53
	N0Z570pm5oRG5jEHoxAYLV4QXLJrJ62meO4ekX72HQCECamnM+S1OBxooN1clknYvB972vJAcXw
	9mU0vGXe5KfPWYP5fHynTFyIRSlp8jv9vg8BTeqJB6TZdzNd5PP5cwE5UvoN7qnBN8NRq
X-Gm-Gg: AeBDietMOUZ2LUcdT8A3jl+kdBpUI1KRImo0dK/df9pWIRoIW3VMa1xJ0DtHIpqEeN4
	IgaAEPIOQVNGkk2wNF8Idl8WPPzfKMRr8HPD6wFksUZvB40rMww2WXfrSqw57M3hWQYmzGLF5q9
	YDwlKFRSUCmqyFxbw8d4bWrsETdn0wZX7k92u5LFR73WaUdW2w2WloOtaWgbPzlu8aqlwJiXPC5
	vLPWx8SpcRU+Pnkubh7FUgZNLty4N3oZAMkbMf0YZqZJWpNGAMHexR+4DwHw3W16moHYFfChbxd
	Av5RI/Fd1ONQ+JRlOA5V8OdDByiwK7q4cONLBQte693sDH7GE/g/RtdJrNOeEP46X6JtGZRtbTR
	63xZaZnix/RiODe+6tZoiypE2KrB4QBxJE5xQdjQfk5VaSnbADkPtidm8CvBFrKYDPdk+3nO6Rf
	a6jPYSCwS6uA9JPmY/FvmYbUtXzQ==
X-Received: by 2002:a17:902:9683:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2b9cabecf0emr73829935ad.1.1777906638264;
        Mon, 04 May 2026 07:57:18 -0700 (PDT)
X-Received: by 2002:a17:902:9683:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2b9cabecf0emr73829755ad.1.1777906637711;
        Mon, 04 May 2026 07:57:17 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae11fc3sm128863145ad.47.2026.05.04.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:57:17 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
Date: Mon,  4 May 2026 20:27:10 +0530
Message-Id: <20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f8b3cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mkQ1ARZptfdP9UuQ85IA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: kFEw6n4rhVLt4IRnBwub_G59jlhS2Ya5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX19uLrIbFGIct
 pJxutD1nJkRsQgkqhKZ6H3TXXvi9RQ7V9IWrlzNiAmZ4VmnUu41afYqqGZsyRMMiyjJb2z+HrcN
 OL345ProUfO6hV4sLvn/PWuIaaQB7l8hlOV973ABytqmD1XW1SZqNpZSSxcwp9c02XQ9Omhfl/8
 KazAYALP/ejfkGLIbLZIAcx2tiSrIqv9hMDsXyorOXdgzy2dbPJLV9rFFOdmfevZGxHFSq89xnv
 uGrCC5Gpn5ze9EfnFHAyWAYJSWPnkqYthy2zue5HW9VlYS29Xv9ROB8b6gjLszrVZM3gmb3Q73i
 2+qyvbfim/CFDGuvnddmQhGELR0oiLymUxmapNnAZz5D3XEFvMM1U2jJCmGfy7hoGoNCY+DH3qx
 lDJ64vVO+aQxuTWaSUwwVzxvYB64Vk5fcQRXjkq8cp3D0fBzrHjLneJKYXAMTtploqvJ77TeBUu
 uBsp3J3PQN44OLNGpgw==
X-Proofpoint-ORIG-GUID: kFEw6n4rhVLt4IRnBwub_G59jlhS2Ya5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151
X-Rspamd-Queue-Id: BE4DF4C05D7
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
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105758-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
has two usb controllers and the secondary controller is high-speed only
capable.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com/

Changes in v2:
- Updated commit text.
- Separated this patch out from phy patches.

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..68d0491dc653 100644
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
@@ -456,6 +458,7 @@ allOf:
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm4250-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
-- 
2.34.1


