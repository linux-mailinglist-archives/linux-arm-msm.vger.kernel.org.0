Return-Path: <linux-arm-msm+bounces-118489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ClyFF2OFUmpMQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 20:03:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A64687426C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 20:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jhwd8Xgt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LerPtl6j;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118489-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118489-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07AEA3013A52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363EE3CF054;
	Sat, 11 Jul 2026 18:03:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5B2FE56F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 18:03:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792992; cv=none; b=QQj/lw4DSbmYLJmZjTcd7jvMsgxzTgjou3AfIbmgZ7zt0uxOlpR2kmtP2yPWzfZPc14zCO1RPERLTEIW/1UtfTCt05ecver6AppimQ9flNtlYUhn0l+2o0+TZAv6sANNdQ1J8T9FxaRJHT2XzkaHsN1gF3Eh+JrnOXx2Dwv5LcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792992; c=relaxed/simple;
	bh=PnJa/8aPWps3IziQFeNseLoRZq8hhlEt7fyfzASDAqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ib/pfpWxVlC24bLT/JDAWK+REZIbd6HUnDE1L0UI5Bxb+UmgiadhhWEZeWcqfzwrw6JwI3mZcHB7vpUiM0FU3OyR2iLBqqjz9QrnSVCiV7qZQ8RqmDeUdDFPbd7emH3v49zxOdx8XH3zg9ZLwkoS74fQ35GdqGzGiADceqltfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhwd8Xgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LerPtl6j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHnJAZ239868
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 18:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z/6guOJLUSR0wBXlgjCmVq
	x6d332CBtCzhg7geAi8aE=; b=Jhwd8XgtITUxv0oUaeO9bAQtQ1lEpRnX053vLZ
	imDVqFUGrAuoGTK/qhMVTfkKcCsi3vu1mIJCkN0GQ81Vpye6TciwoWPlkQelhdq+
	JYbKdzNYXr4W9vHwgy8pzd2ERj4tHJ2KiXz3R4PrL6Myd6TwAQRjk+XWc68tLcne
	6CqDnxAxonYKa/P52xRM/NBa7+iQMvPMqgo4TtKT299mWDE9I/huhPRTv0Q2qfJj
	hIuu/8YHj+TNn/vBAjRti6nWWxIW0jtBdZ3+3g9x+W28K49BH7KUpTBeVynJp/ni
	/WY/pPy2vbEjpGHKhmA7R6A9wyT7+pSZgAXFmays0zuUrliA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe911bn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 18:03:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so302990a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783792988; x=1784397788; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z/6guOJLUSR0wBXlgjCmVqx6d332CBtCzhg7geAi8aE=;
        b=LerPtl6jMVn1tx9F/4Xy8kIdnHbv3+ELA/jaXh8LJEvFsFE3mPHc2U1PpWgnrLKVtm
         +kcoi6lpLSZuIIEi5WevO+0kSs/1CVgQZ8RTIHtpXW5PhsDYoeoGU6CbCX6ZCwEXwcvg
         wnSX5lILVnLILT9sQDroRcHUJ9UZtfMRlG+wo6u10E3GX0aQqcoq0rtRwVPvUw07u9S1
         KN3b4rJo0K9twby0mtsHYQxDtRay5ed4VR4Vp6qzExbmDZbdMAALvgy3hDfrv0qqqh9o
         Sc7O2AfAUdY5XBrBxDXiSLsPvCD5t6WpvFnrhEijpFbPmF4gIQB431/pt/V2EsZoSgaH
         g3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783792988; x=1784397788;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z/6guOJLUSR0wBXlgjCmVqx6d332CBtCzhg7geAi8aE=;
        b=fsz13Z3lYZ8NJh2gj3G7w8HPIFemaTpOid9XDKXbhVYvBqKA1yigfO01IUWvT0pNiY
         tWwx+m2UBMlTmCTR6rJXxom5zu8Ntx6wTb2Bb2sIHs59iOlkGYQFwQte/YkSV5NP1sit
         /dOnc9UYcwwzBgj2lfUSRq02mZ/UAgoINybpLxnSvjoe/w6ma7b9w0PSjiw9GP0xuIEF
         ffhQAIyzolc68x11y78YXG6pey0ETyDJTFLHAkPzOHv3pdlxaWTbKwEwhhz7EzJzjXMs
         KQinU8hMMTQSzRN2CTnuJwNh3MN1gf+2DO48jSqs9z0H/xG73/8DnxuA9/EtMidVMvQ4
         e+JQ==
X-Gm-Message-State: AOJu0YzMambkUILEETROUKqrEtnZsxwgjnNXKAVkeTDV2Fd3PBeBOF7x
	S4H5n71k+tTrXqKKLWwjkK0l0/ot77RB5o4UFsVzKUjY3LaDj+/rppIa6ye57eA7eSfb0CJg6jo
	aTfDuEOy7W8c4yVoe1pegVz/t+rHM9/UGNmapJrrbeeNL7AnXZQUMdxdJX/Jm0qPfVMun
X-Gm-Gg: AfdE7cmK8WjD7TYTjPXb10Zk3x77zL070g5KDWzY3wvRH+pZGNzfpeCVRoO+MSOt8Zr
	TiXOQi1AHXHQG2IlfJwmTGcQTlHaaFZ2KiT/5C2eLltZ6PyKT3Tx+pIxwHABONuTic639/BGmnR
	umyZ1UktCawYx6KfX9foopnYSvvHc8gBfTKNv/bMkhfkEbm4SnTyP1eq5NLrrePp/KXDBdPiI5N
	KUvmQdDmVwrbxyU+1c5B7YsA9/C0TVTGjXTjmGn76jbFd9CwxkyUoPhP81vWm4H5ANoHFdJ1g1t
	NA6FDQSGyos978bM6yf20s6N+T6l0lMOmiSZ7QixsQKrozOzeLnhXOV0GeAt3ciaEWma/5jwXIa
	1QhPlyQQ4Fl9giba/8ys4jczd2xZyiyK7YrRo7hPPQSrO17eQIhHcjcqZOwb6jRmV8/lLJsjnYH
	D57Ka/
X-Received: by 2002:a17:90b:2e08:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38dc7769958mr3609815a91.20.1783792988460;
        Sat, 11 Jul 2026 11:03:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2e08:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38dc7769958mr3609786a91.20.1783792988036;
        Sat, 11 Jul 2026 11:03:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm26407486eec.6.2026.07.11.11.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:03:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 23:33:01 +0530
Subject: [PATCH v4] dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFSFUmoC/yXMQQ5AMBBA0avIrE3SUiSuIhbFYEiQDiJp3F2xf
 Iv/PQg5JoEy8uDoZOF1CTBxBO1ol4GQu2BIVJKrQms8pEEZeXYWT4MmtalVSndFlkNoNkc9X9+
 vqn/L0UzU7u8E7vsBG93vV3EAAAA=
X-Change-ID: 20260711-usb-shikra-v4-43a3a001d756
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783792984; l=2191;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=PnJa/8aPWps3IziQFeNseLoRZq8hhlEt7fyfzASDAqo=;
 b=ONpfRxQhrhydyR1lYo6ZWILKLgioeNJ3yeih6kTernj5CS59U4NDkgG3d0wgEC6dm7bA2RbMY
 I2OlQh4pFrGAUIyF8Zlb+DQcC/c5iOTBtrBOIrKpyMH/QMIxRp35HtN
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a52855d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VKXdlmgkaoilbm1G0MEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX6DizXlf9LTSu
 fQgwiZG3TUpros7ci4MunqmzkEKpR+soV4PGdCTNMTwCZA7kM8Z8cXEr3vrHPC6a8sRRWQd1rPm
 LIaiQOiDynDwiZHt6IKBtT7ya6dQmTY=
X-Proofpoint-GUID: RApLGTdNDf6GRm4MpFD-_uNceAZ8mHaq
X-Proofpoint-ORIG-GUID: RApLGTdNDf6GRm4MpFD-_uNceAZ8mHaq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX9o/rOZXLgInS
 6ROCN2fb86rO17VdSWnLuuffNVyNraRdJ/GePOvOpzYoVOOfxnOVXsjBdtdzcN1d/ZPxg6oCa3y
 teGgLHxnDm9gZMOnUYqULSdIOxi1OkdDaQXh6LTyBbBaVxGIxlYSljhOT2ztxq5XBmzMROdhsxd
 /CXWItK7T7MW4GeQvIc8Yl/4maLYfnBUdc8ED9vu0ISA+DnsMncjCu4brXESdBEvPElhn0ia4b2
 0V68Dq7sz2fUaPWkW7wkhVdakjMTYLDnD3IkBMI/3py/W/ksIpNsr2LSY3H0p0xVGh/i5V2+YHO
 WWSZMETp4olbR4nbwzLQbFCdnVSspbpvhItpU7qTJK4TivgUYbm0A1y1iPbh/b0czISW3eo7xY6
 +8SAwGceSCWOyQo1t5PlwEYbigesp9n3OMf2FFpdcyKxsLV0qcUqHEQaKdH0kzgpc4Xdr9SjwAt
 hm+SBKJGW72rC++bb+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118489-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A64687426C7

Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
has two usb controllers and the secondary controller is high-speed only
capable.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to v3:
https://patchwork.kernel.org/project/linux-arm-msm/patch/20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved shikra to list having 5 clocks since xo is not mandatory here.

Link to v2:
https://lore.kernel.org/all/20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Moved to using dp/dm interrupts instead of qusb2phy interrupt.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com/

Changes in v2:
- Updated commit text.
- Separated this patch out from phy patches.
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 932d7aea43c5..8298d1515c7d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -61,6 +61,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -220,6 +221,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm8750-dwc3
     then:
@@ -559,6 +561,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3

---
base-commit: 1db5c6b0b9834aee2f14e39764becfcc29d09ccf
change-id: 20260711-usb-shikra-v4-43a3a001d756

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


