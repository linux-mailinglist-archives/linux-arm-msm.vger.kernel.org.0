Return-Path: <linux-arm-msm+bounces-116642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9FVWBDBRS2oRPQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:54:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C7770D336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:54:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WxQlkGVj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BsahpYrL;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116642-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116642-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19EB73008098
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C7C3DE427;
	Mon,  6 Jul 2026 06:30:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108E73DC852
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:29:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319397; cv=none; b=jDnLE0uf6Hh3CoF/1ZdLFW4HjWiS9y/I+CCxp027i5F2BDRDfNLdddC4DQ87PhUy20OzGlpjC3UP7D7EWVHQM311zf9+B+J45FSg4DMfD0vI/izaFXs11+ovUAXb1WnDf0SGHIowLX2vM3jGk2oEB+egsx2arwTLepwQsF08rBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319397; c=relaxed/simple;
	bh=v8nmVyZqxaG+bHgDm8pJDNcw16d5cJEinnhDzfLRvvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F7B8Jcf+i5tecuoVmGdi0osqU67lFYID0NukJYZNg7BirzitcjLBEL1k5VUk9jAagwh2JrRd42dJExEd8eMwvCSplIP07a+A6NTsg38vIy8Ia0v60QPJNWPpXR0FEOZZnoiANYTtWob1rsTGP7PBJII87lmkS++pDSjtbekz9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxQlkGVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsahpYrL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641ZJL3594598
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TUjpQsnyErfX0o07DSPRbJ
	jFpZ6yO0JzVDMShO5lcN4=; b=WxQlkGVju+oKjYeu0TdlVqWXWoZqI30cZ2sqrL
	nZCJmnKYzCMp9FkjNjVq3J+j6S/L30YoaTFL4KurzHbVirKnVHAh6Z5bzc4ZtsH1
	yrC0a9A+/Q4oefgTJ/h2937emakwc0D5Z/WIQ6XWIeBMHx69G2YwsrwIwuZ1karn
	ADvl64aH9rwtDrzq6EYVOXvsOPXSKD9bqaLotPyTAiEXW6rQo6k08LgQBHE6uIDH
	Vz7hcWjGdtRl+jTX+37WSrI1BJ0oo5+Si8Rd582+3CbHyPANLUAb355p0OKINavi
	OZyAuxFAaFAFOd3aujhKi1ZdaiIFn2VlLJhWMCx7g03HVWGw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgw0sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:29:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2111242a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783319385; x=1783924185; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUjpQsnyErfX0o07DSPRbJjFpZ6yO0JzVDMShO5lcN4=;
        b=BsahpYrLsIWS9N6BINRYBqvhFkjI73XwTYKRNmgZgJux/ZA7+DPl08kgSBjIRQ3lo6
         Z9AgKN5xO+EN4KPKAcUFN3AzsxJ7Sfeq+4SLpxwfr8nBOwDv+KxqDNOzMY9t9Kd/vhOr
         a+/ZGpjJLopRB3+K1ye3gO7iDiwiXLq2uzWbBoGkslwn8sOT8fSqFgQXI/KsKuGU+APr
         JDaRuG0BS39YcVl7EQqFcLHMdbTruIeJ1tqhaDgbhlGtEs4Hn8LJglmVnitrhfPCjlkp
         tfl8zI0n87wplreKUku5N4rcctq7j/V1dwur/Y+nB9n7/AGhx4CJ9aIdFAHJghdgr2Be
         GP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783319385; x=1783924185;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUjpQsnyErfX0o07DSPRbJjFpZ6yO0JzVDMShO5lcN4=;
        b=RfG5Srfx+Goz5Pgzj8izJkPiFgoHNHFmKlmUWER5WvK68+ZXSOk5CqSyPju6Zujuxe
         T/EkfF3tpPxN8EvPW5sumoObTg7fNSQxvCzDS1AUzbQNuUamgyNccHE535Fo1sD3qjWT
         fXojXvCk+hMkTfnHGlQaDp3TJJEsGqRBQKVrf8rQBnGhF7k/t7waY0YiyLLPVFUihkEg
         aj7+l/NFe/C0VlqPnDhReSQkMivXp8fNXFM8lwhOKudg54JPpBZc8lfJ3YoTS5EFdFgF
         9eHQMjlEk61PQyazI/q2d35W40oRN9/rjrns3j5hxRaq1kU9KwMkLR+S1xuZbg1aVxNs
         iVvQ==
X-Gm-Message-State: AOJu0YzsKEe+SmShm5I+7OllZFIyY+9ep700I9JDOsiTmXQiHMpw7j6I
	pXKFDixlYshSQg1LQGj4eIihG2K2rybPb3dpNgViWDUjR/z/L15NltS9ozE0bSnty5JCGkVeTLq
	8hKCaEZeORPrvUYpQcjDMRpPPFP8QcYeJRlJpTkSEcAZSYGJwYeL+vPqOXHYZ2cx8bzg2
X-Gm-Gg: AfdE7cnNQpk5DlU5ukY7wbWFU4c++cgdiLt+qN6DL1w/kiHAxel2rqGzWJKl+nKwsx4
	KiCieHjeUfgYRmGwrhzJeUEdlmd+9UEoviBNFYIO9gL5cJ9t1nifSwDkIBH1FHD91prjoLjnMsd
	BnRSYHvC0UEa/VPLZrCA5uWhYhKgpSq/FI3N2zUbbULf+Rfqig5WdtdOwqYY77v6kIkAamsMeOO
	AQf1H3+GHsspj/bGAFWreaE4KCyc99pCvmC+MUDoVIi77CgQNnYmRrCJ5esPosUZRpASNboH4Gf
	aa86G7lA+1XaJ9hnUEFEA0grJnz/4gvPFP0xzRYVukKSX1KD/hzYaGwoLvNDpBF+FVBeSfI07TY
	GMIXrQhHoTmf9LAbItc2wi3FqTYUrTGCiJ3Si+t07ZhizJc2/pay+kUONsJiHmJLWcntuc5wcZv
	dlWoWERAkKPlMw2JFnvV+FX7Z88g3y4RHPJot6RhZf
X-Received: by 2002:a05:6a20:b40b:b0:3b3:d0f:7883 with SMTP id adf61e73a8af0-3c03e1f3834mr9310003637.7.1783319384566;
        Sun, 05 Jul 2026 23:29:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:b40b:b0:3b3:d0f:7883 with SMTP id adf61e73a8af0-3c03e1f3834mr9309973637.7.1783319384118;
        Sun, 05 Jul 2026 23:29:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef188sm47645640c88.2.2026.07.05.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:29:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:59:38 +0530
Subject: [PATCH v2] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qfprom-v2-1-f5d9eaf12d55@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFFLS2oC/0WO0QqDMAxFf0XyvIh2qx172n8MH2qXzsKs2lYRx
 H9f3IQRCNxwcrgrRAqOItyyFQLNLrrecxCnDEyr/YvQPTmDKERVqKLC0Q6h71DYUjX2Ys5GXIH
 hIZB1y1f0qDnbHUptIP1/l6XEFMlHnEvkUVI2fFNK0b2PMR8n/TZ91+W8DmegceJO6SeGRkfCH
 XHplnlaEh69BNTb9gHiHzsszQAAAA==
X-Change-ID: 20260706-qfprom-2f17bf4c3c28
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b4b59 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E3ZHFlwXONBU5DQtPr0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: u5FC4s2fLNgxZXTr-ucXgz44ofLummfH
X-Proofpoint-GUID: u5FC4s2fLNgxZXTr-ucXgz44ofLummfH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2MyBTYWx0ZWRfXx8OalP5db19x
 ncPWecXMOH8JGG2x4sHI9uolhu5dy6Zcz8MsbtsfvPqHSWReuw+//uKHNGfXBlEy1KVZ3EVNkr9
 j4U8acSwRCF6V3ZhYA1msCh6Z9wJhXg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2MyBTYWx0ZWRfX8rjBr0CxlnbO
 JOl1yHFBygGaog07aZOH8mnIxNjGJoq9oR8xLqe6SmUy3CCxTA4fKMP5ufPpifHpTAKf5sDE9x0
 oF51V1RYvK1jMPRNe6hGhGLn+J6mHm9u/yxJ5NnMbvDdB670TY/sj1gc45heKOiukpiaajTq1FY
 jeMwQ6eNhatE96Q1o/Qd8PuIRb/IErrZFeABeBuHRfBdcCklAhAWtMIxUOU3F9gG4f90YGUkzwa
 SJW4q7Pyer7cS2r0qmYQirXJvHYvsQPrRPBkfk4MwFJHELcda2k6N1P8JvcYdM/2VBk+TO/ltcT
 eC7O7ssZCG6NfImV6Mzlj9/+RgKXEi0SInBH93q5JydHQSvdNMBjNVxKTTFOAmv1RoJPgu2AQLJ
 qsgB1B6j5C02gI+G93ACbUlcrit9gKFP9/TRux3/uudqzWZrQW+2uHURj/lm3JnhCCzLFeKuiaq
 bMRx8HC5FT4pJxIBKFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060063
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
	TAGGED_FROM(0.00)[bounces-116642-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1C7770D336

Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2:
- No code changes
- Rebase to top of tree
- Pick 'R-b Krzysztof'
- v1: https://lore.kernel.org/linux-arm-msm/20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 8134ddb54e13..bc0a0898b9e4 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -22,12 +22,14 @@ properties:
           - qcom,glymur-qfprom
           - qcom,hawi-qfprom
           - qcom,ipq5018-qfprom
+          - qcom,ipq5210-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom
           - qcom,ipq6018-qfprom
           - qcom,ipq8064-qfprom
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
+          - qcom,ipq9650-qfprom
           - qcom,kaanapali-qfprom
           - qcom,milos-qfprom
           - qcom,msm8226-qfprom

---
base-commit: a9498e40e3e314ade387d3ab0d5cb14f0f3aa1ad
change-id: 20260706-qfprom-2f17bf4c3c28

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


