Return-Path: <linux-arm-msm+bounces-101123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL+IM7AWzGnfOAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:47:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 227333702BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C8723064F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2057B38F94A;
	Tue, 31 Mar 2026 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGAKWD/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvZ3LWQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6538AC88
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982705; cv=none; b=s6okl2MVzROuzyUk9CbsRFpk/azrilDXtLS3GDmuU1+agQf626+o5PQEFRQcf65IEbL7lRUPk/8xOsm07/CfUCMPVW9p/oSInuU00Q4N2niWTXkgQh5YeAL7Uouk23hikbMz0t69ma8E6DwYPpxb6Mx92KhXtBJc7jP4Z/nOJDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982705; c=relaxed/simple;
	bh=7/65ePqG4yopQHr94k6g8n5+V5JBH1uc85cIWa4Qvp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3olBlpeDkcVoqJVbRTveXNzoufDXTRtaCjdI2cNh3VSlpLqhMf8RNiQMKfKqMAY2vuafHucGyrfYnPDTRFtj1YVCX3B4wQbft5W/HxoiAJB2LPaIswiGcE5n/bnCmlssQuJkZvc5w35wOomQdA2BN/D0QkdfS4DFRZGTUGzhqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGAKWD/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvZ3LWQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdHCT1831866
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ctnIgyI6jogPY+2raF43nSJTPOcHOKf/vME6E39VLU=; b=CGAKWD/Pp1Vf04FB
	PPaW24aOvCgt3zOFzecw02ZkjWXgzW90VjcFgyiy3Z1yL1jp2abfjeRzi4DGBRDr
	E4qnIf5EDh8jxidxq0yqa56ZTaF8S0DQs/Z2oEq/rh//JAiDCmQnwDOhJanhSQ42
	Jhj+hf+aK3iiBvpu6VCnTA+6pYdnHuMfDJeg98OlfFzdKAMvo+0ehwlaqwyrtt5p
	m9Imuv4GNqmUB0OtLDwaO5ysMQ7WrDfSkv/NhqgMsriRgXBJm72eRykzZdgiS/Ff
	vlvqQBm/H/O/Q8JoQEtfD7DmSxu7sRi1bKraw58LXDBfy8BNpezCLglTI1bTELPf
	pFlzXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ9tqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:45:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ab344e3164so16678395ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982702; x=1775587502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ctnIgyI6jogPY+2raF43nSJTPOcHOKf/vME6E39VLU=;
        b=GvZ3LWQYLsTW495lbP0Myd+NFtr3hxnlMRkP1q1MhyCskOLbgu8hSxQI4LCvpOuyYo
         6yMfOJggMZdgdzPH3HboqQyu+FB3dzmf4zzW9eZHsRFDNFnXTDsGs3ne71a5rqr6xM6r
         8mpHHU82tQtJGwYk2ru25IOFB4IPjLuPTRqSyBevT7Fsr30f2fF8LH64M4Wc6W49Goc+
         aWqgcxZE4MC4aDd3ZFAkQgd/cGY0tzsdJ53RTwhoY96Fjnrhv/eo2tcjYJClFoeUSbYe
         U/MdUrnzQov5Qk7aQGMk/NV1oSWhjlPrJJE/0pOLm7nSWPKDu3Ijt0G4OnjB/M/f5/+i
         jQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982702; x=1775587502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ctnIgyI6jogPY+2raF43nSJTPOcHOKf/vME6E39VLU=;
        b=tCWKtXGBuT6MNY5DxMjgabfJLioS4VnNit1Wc8NqmejW6D+VzYkUahiHpKEwew6fyp
         qB+noZEALjL3YWcL3fFj27QzTQAtx3C2b6mWUsB11xnbOpnjVLZuqxSIW6fWKrwGSMN6
         Qmk+CtyL1qDSGiiQvgNnAXeb2py+xrB0bo36XF/r7998u2mBaV+bymX01TgEpGATrKTU
         ib5CWZsIE9vS5rROclYUyE1U357F/Wdd9iAkJ58b2btwnHyzluQOK7d8gkoBG/N4nABE
         ykEOZybK9kzBEyHSQ7CzINmolzmvwY1VO3JmR+VvxBkU2tg6o4JrOkpBXQxHj2Uk3+hV
         Hmlw==
X-Gm-Message-State: AOJu0YyhOkZ/1tKd7krPelooNPsfFYPIhki3bJ0CTPCpwvjrWALPGURC
	wbj9FZxc/r0rU6VDYx0z/pDmzKzsxjWjrai6TVFRk+IS2tZrmoeDhOZmwOtN60jb9FWLjs6L3Qb
	nB87nGnCDryZHQ3UNIhY5V+8BqXdtj0QZIqGUElEsUexftXgAxkd2O0GcYuSTZzfuSNPi
X-Gm-Gg: ATEYQzyCQ7PhFBnnv8nGM+XM6BrDpsEU2CLvk5ywvqhzbAFSJZ5RbzqZscGrDcWjN3M
	7MJihyymjxVg7gNSWBRX+N0A4YGjAOiPT3Z7C/Vq7SgrYcohoFRd9Z2GcI40jgAzkPHwJvS7917
	kU0mLbAEwQ4b0hdL8LIKkdoeO0NOJ1HShXwflSJLG9xJ4AOkcdD31nKDMGzw5/kFDFCVcywNpGV
	BHo9R/4NQ/TClsUpZgOlLON/PwkNSsg0IobezXEHI6ZFLx6kxWNEnxMgXGI/+TXPSEgBIXJOswG
	k+LuODSRMETYtypO1Es3KuRo1E9T+tiigWlLYIBLWGFXvS79HZ4UWbD0ztWyzXHVqnSEJh2N0kL
	RyP0+7D5WdAhUNRLZ4xLBU7IFkrMeBSg0gXMcPmu1/LKzkFEGtotr
X-Received: by 2002:a17:902:cec8:b0:2b0:c355:7d56 with SMTP id d9443c01a7336-2b269d42201mr1479955ad.8.1774982702266;
        Tue, 31 Mar 2026 11:45:02 -0700 (PDT)
X-Received: by 2002:a17:902:cec8:b0:2b0:c355:7d56 with SMTP id d9443c01a7336-2b269d42201mr1479775ad.8.1774982701751;
        Tue, 31 Mar 2026 11:45:01 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427af930sm153284635ad.70.2026.03.31.11.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:45:01 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 00:14:42 +0530
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
In-Reply-To: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>, netdev@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774982693; l=778;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=7/65ePqG4yopQHr94k6g8n5+V5JBH1uc85cIWa4Qvp0=;
 b=B8M6P8m+WrkDYks5hvvAEmHhrEiZmQQsNp6TqbsXUVmyPktPEmcjWqB7fMvcUGGZ4FaFLd3Ud
 qagim8WyvJPAy9aAnN8n1154TdD8fUcCYBFc9kCAR7vk2s+wnNmY/7v
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3OSBTYWx0ZWRfX65y0jNU7YLeT
 Wy3vsOPmJtaWMMvvnIz/VpMa1CQpGGavvITz2BdNxzKqrMjbDaHxslYOmYq+kXeM6gylgOpOj7p
 Dse3dSnPlf0tVT0lwXG0gQ+AFOFX3dFn0g7dtt+8O81ZWKdq1Tm583PgzIfm02Ae+6IvdEGGaiF
 DblMqOesFbwpgh2FCuU8emPJVBopiY5II7UH4Q6g6wRKWU8SewwTr3Tf7v7geIP2Yl2g026HSQR
 O6/sIofHOSP2nJjcV2ro8SvUW+sIHRHLs9vsu0ZzXv62qjAQvTU+8FD1V9S0k0aJ2nf7M4Z8MZJ
 cd7Vre6ru9qRvLEk3GK7dbEpdOthdsUEYKXOhmzwv4AsH5qOEZDx/J0xspZXLVROQba82MtAVkZ
 Nbf7/YTFltntUjEhW3mfbIA5twEIq/DOIdpd34oHvaoyV8vEX4Z6NIgTE1c5RawgYpnSz0fyEuB
 F4gByHKPzBB7lqAQDog==
X-Proofpoint-GUID: 94DtaOTFqMj4xjyVv3pIauR3mjo_aUvS
X-Proofpoint-ORIG-GUID: 94DtaOTFqMj4xjyVv3pIauR3mjo_aUvS
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc162e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9DcQwTZnXUZXOflEe_wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310179
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-101123-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 227333702BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce bindings for the monaco-evk-ac IoT board, which is
based on the monaco-ac (QCS8300-AC) SoC variant.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca880c105f3b..c76365a89687 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -918,6 +918,7 @@ properties:
           - enum:
               - arduino,monza
               - qcom,monaco-evk
+              - qcom,monaco-evk-ac
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
 

-- 
2.34.1


