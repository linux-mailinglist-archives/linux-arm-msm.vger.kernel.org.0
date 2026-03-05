Return-Path: <linux-arm-msm+bounces-95492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNqDMokGqWlW0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:28:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0520AC7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 05:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE72B3036047
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 04:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FD6248861;
	Thu,  5 Mar 2026 04:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYl8ffL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTKEEBza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D601288AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 04:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772684935; cv=none; b=NN5+HS4WuSNigsp00GfV4PBJFiwhQ4SkTdh6jrO4PBkLlKABqO8cz8b+C7QvnFgcTe/bY/FHV76Xtro8Ehhag/P/tLp7+118KpYfQVglOjc/4Gk0eHWtXNYdvpxK+2ff5lw9U/UnF4HuJzarwV94fi2sI1uzLydf0LkXG486jQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772684935; c=relaxed/simple;
	bh=vLdj3B1jQPRgWbscBTiqCTeFKntrD1geF72D+7wghxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvx67LUFetULvZ9FCbbUw+BbaeLp7ch+C6uTCSz1AzhJavAoCRKC9po6Ki7ixMIr03j8Y/XRBj9c0mrmmWUzoHCE9J8mmVEvGgxNm6/ndrBUpOaJvtD5qDlMhmo7H7mmkOKgYeo0eIgkezKAAOfCLxpa+9U3+UZmyRuaEDdMAow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYl8ffL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTKEEBza; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BkoZ3604128
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 04:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWV4k21xN90qYzLHH1hU2Cz+AC1ZwZNUglGaqJt87Cc=; b=jYl8ffL7M/Rf/wRt
	eSJxq196IvSJocHYmexVJDQS0Ynlm6oKeUOE3oa2gDYyRvyjAAfh3kLNGY6G0VQu
	VqUpF/fgMoAaCpjHj4ZMMlP13DATnH15O47LkyKMwabATYDUQeTCPJgj9PYeNyAt
	lPOW87yiPVf/UcFzRYEjdyykwwoPoLolwzp2h4QGwzl+IsdvKBgnTWKhzKVWjjAz
	J5XBUvAiSZLA9x8EJgcEiGEQMWjuu6fMiqr3zGBt8QNhDCxUkdF1VAHXNB78fBO8
	PFH7RgzwEKEnLtN3Frb2nSMVgTSIj1sx6WBmgGJYzCEIejkAiNxRTA2I3ghuMp7v
	YoQtDw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w9put-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 04:28:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4af66f40so49394015ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 20:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772684933; x=1773289733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWV4k21xN90qYzLHH1hU2Cz+AC1ZwZNUglGaqJt87Cc=;
        b=HTKEEBzaPI4zXf1vjJuaRUOy9FSuPep0+hRv6frHuhnpHFGKg8xlJ2FEYQTt5rLToF
         Ub8VH/H2r6sQnZgtUdemRu66NipdbrBy5TDgt0wFXkI0xBiqMa/0pq6No1XOv0Qty3Ej
         uQD82m5oa6vaZN2UBXsPJ7NNgfA8nlJXA0Unub0NX41miK/NztGdWw0H+6aqKW6BtJVM
         3hcPaP3WzY5lmxp8oKveVGKbnBl6iHEbM9ESHFXyma6Ehb4poM+NWiPtKYQXDjuQ43ZN
         VqoB5KR+HB4PHvQcnaky3Op8NNRa2viR8OM8GugWGGmroyqkWsHuLCbPmedHuuDQ6TYM
         qe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772684933; x=1773289733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KWV4k21xN90qYzLHH1hU2Cz+AC1ZwZNUglGaqJt87Cc=;
        b=JGFFjE6sJCbRH7rfLcdFV5oSV7HSDgZ17Gh7Zxr6NTmnzYN9onQeU24Y7HpzsczMG9
         cjtYgt88L13TBUOvUvZDkEfSP83R0DI5UN3s+MCsMBLz48nbObW0ik6dSF/1c1UPdhAb
         +5P9DD4wSkHPlJnF317rAbbWm2+dzWhKQ10Pefwe76LxcO/2Gcu96s35OSusdYy3M6oF
         HYg92R2iRptA+wbcNWISPqjNxsiZD4YRjSQPXAR2jnV/FJzYjVGYVIkHg/IA5YDaAZAQ
         kXfSlfqTNIut2X61FKxfmgsIdWnfpyq3VRx6U1Y0MfcnsEUvf9OQLf/TIOEfC1szQC/j
         1WkQ==
X-Gm-Message-State: AOJu0YzqsWQvqtXGTWu7FPbAVZCpcJMs9332fwbhSrNv6Zuob3YJe+3q
	2+mXb3a9HDw51wOaLrM6dF1hJ9TDb26UUjdnhR0xj1NIN7Fuc66iv3LX61G4e8meTgJDDA8O0X/
	zYWHJmAH63F7MURpP6DueoMYCF4Q8FsF1Iug9C/xHwFmawjC98bekhvwpkSHtRLrzv01a
X-Gm-Gg: ATEYQzyCk3Ai7eP3ueRgNovNyEc0rcPlI4ZDKpe/SmEwWgFhpbcAdSc6zRw7xeAiwsL
	1QDr7g8UzDCn0108qINL2OG7scCk5SXWWK9Ds5bY7O8hLcVU8WbWI6DyLdA/C87+s9OHpM2BIqi
	K/W/fndge2N+Slg2YWT0XqyBPzERQMaa3VlO7GJsyMc4cKUdiGts6SApPp/Q8uUk/TzUd/p+S5s
	Ke9ka8TL6GSGfZTlr0jDQLPJQU5JjciUpFY0K/EGzL67S2qwfvwNrGemEobuKcu//0PuWV3SdOe
	Zr/z5BaD3GHwjZxkvusX1OVoYHkNYuaIcgrR1mCSgcOL9QI2DaUUirGJdyvIuBXbXb7aaDbnWn8
	OlldRi6lCzBUKOAFx8hFBOf75lATSVpkBM0kaRhp/i9IDcSAqW44TLMCoMXuSqshyjlMugi+DrQ
	==
X-Received: by 2002:a05:7022:458d:b0:11d:c91e:3b58 with SMTP id a92af1059eb24-128b70e8da0mr1972605c88.39.1772684933036;
        Wed, 04 Mar 2026 20:28:53 -0800 (PST)
X-Received: by 2002:a05:7022:458d:b0:11d:c91e:3b58 with SMTP id a92af1059eb24-128b70e8da0mr1972588c88.39.1772684932496;
        Wed, 04 Mar 2026 20:28:52 -0800 (PST)
Received: from hu-djaggi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1279cbd1993sm11164942c88.2.2026.03.04.20.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:28:52 -0800 (PST)
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 20:28:28 -0800
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: add SA8255p Ride board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-b4-scmi-upstream-v5-1-f8fc763d8da0@oss.qualcomm.com>
References: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
In-Reply-To: <20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772684930; l=915;
 i=deepti.jaggi@oss.qualcomm.com; s=20250501; h=from:subject:message-id;
 bh=QnmqT25GQywckMFAOnXMqflitvwpMCh13NozaygAWDg=;
 b=0MhrqyySyIfhWud/TzANKUFu12zMDYNKYrEwwMQmSZw34wm8hJyp3YChQyZ5E2+bBncgipKuE
 AZi3jLUUgi2CD01Kj0EXulaITNk6UXt85NHaNpF3HpswauppasTC4eG
X-Developer-Key: i=deepti.jaggi@oss.qualcomm.com; a=ed25519;
 pk=+b3H5UC/u0pUK5+btJ+35nW+6vKwJV1CfjJ1CJWuOZw=
X-Proofpoint-GUID: QVClOEWhk17mjI4Efk_92TT4hskgfCjh
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a90685 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wDsz3shVdOXW4ZV74lIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMSBTYWx0ZWRfX+jnl+K/g6sMr
 pK46yiePw/4A5eYIeze2zidEDIJa1xYz5ZXbRj1IFTSQNo2NQr7Ly94y56jWKGWHfI4TJ9VVbEP
 RQJ0xZmfkvTo1V+Pahuivi6NUfsaBfREkD6Y03MI5+yPvSG1xtxSpFI0Tx2Yfd3jQvxzCk68Sjo
 35fpuuSs4a89N8xSVm0/19ifjOZV2phQ3vK8+S4ZpsfVYaMmxFc+Et/cqZFX+oSmXG3ynKVVfuD
 Ay1igU7C7bNY3suNXV3zSoJ4S1A1TEoZXO8UoPueiWycl1XS95YlqxjAB93KriA8fXAqP/5J2Ez
 JR8ok/sLhhWx+WZinIXtVnRTemOXIVsxcpwCmKkS817KCosI2Kf0LaYDZVedeVRXe6A+bJqg6Sm
 s7hnUK5V9ons1rgsMD8i070mmS6Fl0OqXdagWC+Z3p7MdVfU5j2RCZmTBWrbCpipQwh1Hcb4LI2
 zmSITmjgcXoZCwNrysg==
X-Proofpoint-ORIG-GUID: QVClOEWhk17mjI4Efk_92TT4hskgfCjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050031
X-Rspamd-Queue-Id: 2EA0520AC7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95492-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..f9a04769e20b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -891,6 +891,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp

-- 
2.43.0


