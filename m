Return-Path: <linux-arm-msm+bounces-79881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F85C24EC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0058401412
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67CF34845A;
	Fri, 31 Oct 2025 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2u8DiSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFTGatTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F72E3469E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912459; cv=none; b=iMaV2FfXI2oQSCsPLzXqA5JX3WMEAIW+lklFWmjZrCH4Dh3H+WoPSXVdzEOTJn8BUx8IEyFBM+Ce3wW0S2RUS2bOZyL/HgC6KvrVc0b/wXKMEnPOZq23qBUOJKBHuwlK3bUOhGAuWdBAHNzMH/r31ikGDHxPSzUzo02xhIM56/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912459; c=relaxed/simple;
	bh=sOQOsePjYlM2SdUmv8lUrLY2KaB8teOMMCQg12ut7nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfpd+ZP7O9mTHxQgBgGKj2Uzc9mYMVEBWkBEJza52mH77q6Aey+Yo9ZMcczOi79+JvBS3fsafp+269/n/WHoG54V9T66hnLU3cgEVxkZLuHxxosUvTSgwuM7bs4eIAnOZbxDdSkh0FkljPHxuVEq3GiNH9sbh5tG9gVvsdSR0Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2u8DiSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFTGatTS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8tUJ2898100
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j1FjvgdJcCM
	iQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=; b=K2u8DiSDcs76r14JBy2xvX4pgaf
	eePHSlAzFrlVIBlKK7g83FIcFVgmzsMCaaPpX6GNLFOLmdGuepu+fVK6dWu4PLqi
	ZvNXycHhrmYZ0SwAtJU0WVLAp/4ewC8qlYdvYJnCzMfE295fy+Xa+fVphOhmszNF
	+4Rj8G7SHptRCnWCUCPE3Ovw/OyfSbvKsb2QYZ9IcxolusZ8kMQNVQvzO1zF9u96
	ufy1x/xtW6mYeU4OGSD991PEScc9V5DMRUSda0fM0TsfwJ0gg4t3fcVWgDFLdZuc
	sXEeh87W4u7i+MxZwraKBsRhQyWyK/OS7sKMs19awDPMiyedgQR1sjAmbPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb2201p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e899262975so60585391cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912456; x=1762517256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1FjvgdJcCMiQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=;
        b=IFTGatTSZb5io4Edoq9MiBsXftmN0SDQhyf1Fk99zKjCP9VQbE1tg5zahOLvrX0jsD
         gom79HhYlMQxJAbInLOZJ2tybGA3KDrFwsLHMWI4esjHE8lBUfaVvk0o+qhIXmCkxAPz
         W3allLBxqETTYV5hbfYMHzYjJfT71tjkt+PnV1cjWAEWootmvxy0fS1fnoh1dUZI1FPU
         OPuebDur+2yEPUEYDtz2YjmEdeyDX4QO866ZVpFy4fuG3XS+qnrEnZlRguX/dlxuHv3x
         FZVJzy53gq1pI31a6P516RghafDLOcqA06Kh7S7pZ1xwSyoxnL24qNLUbcgloxLIDoKw
         v70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912456; x=1762517256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1FjvgdJcCMiQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=;
        b=k0qRdMKDfi8nRdOGAVt2cXN8vVVLn3rrIMRraICMbQhN0XNRwQPcxfjQ6YkfbFxXPR
         j48exEyDngLr8urMrIYW1Bzz0MR8w5rsKsi8ClhFSlJko5dyi+xiYSY0q/Tt1YIGnQEj
         T2wQv20nAj2v6/Alr7FI5A4m44o1QFoJrkW0BVVFmhXC8l5Xv2n6KJ48LjBz8C2chu2i
         PMNNKVBkvIgGdOPaoikA4/K1M/jpbyGAAbyKyFjOtPLHApCVIwFrjqfe0iaBqtlwBS/f
         ENk6Zwp8Y56xrB/su/xoTf1/AakNlapFQ9fgtNwrIVEFtAgrna22Q0CB83wvGUYOWgNR
         npvA==
X-Forwarded-Encrypted: i=1; AJvYcCV12z9dE2c8Ej4+EePiK0sSEd11NibQ8zEhL30b4f6Iahd8uEi7Zj0/SQ5wyH7zbPXaMaoUBEeXp2Odgvpd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4kd1cmak7To1fsmKPOBmIOvcHXa+gaALfmpHQzKYjr2bXiUtM
	LWBTau0iAco1ZGuZrw2WCofOKP2b+O2CTou/VnmoT9pBzJj07+jd+NL5VvLUvKshE4y5cBKgozc
	fW46sIOtBsOt+cssda0cQAojtIhidnJJd9ZhgGQPfST9qfmUBXmCPR9RoED4/QmqLDb66
X-Gm-Gg: ASbGncsjPl5DJ8b02casSwJbsJwWhIw5H26phXdlZajbiPqxBQCjk2RQl1xoOM9+vaI
	aetxGK02AFEab9gG8hY/EGUGHU9qkfdPGN3z9jUAXzREY3Fj7gTb4i4n67GsYu/oq7C4g1Ys5Av
	eK4G3nc5gCNRVm6Yg2NrasllZjqmpjB52Fu7aIB5Rv0i3Tb21t5F4V9wWLq4b5TXmCPqRL8HC/u
	nsIoabPR5NTHnweQZ02EQ9h72tV7TUW4oEGAckWNFYDb7ozK1DJRFP2no1m5dKI328jnjJpAxU3
	AgzrE82G+/lCwyCXhi7Ut/gCHg5m4ZzDY8Y1WvRp3WY9IJgxNm4Rss6kraXM8W1OIjyqtBqpm5s
	i5g/kz33OQGHm
X-Received: by 2002:a05:622a:480c:b0:4ec:f634:7966 with SMTP id d75a77b69052e-4ed30dccfc6mr45714861cf.23.1761912456507;
        Fri, 31 Oct 2025 05:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBnzrTnYPLE2IH4J5tqf7U+h+V3pAgh1vyeu2UR/XQoXDi5qUOwPWROjLqiCxAElsaJcRN3A==
X-Received: by 2002:a05:622a:480c:b0:4ec:f634:7966 with SMTP id d75a77b69052e-4ed30dccfc6mr45714221cf.23.1761912456103;
        Fri, 31 Oct 2025 05:07:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/6] ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
Date: Fri, 31 Oct 2025 12:06:59 +0000
Message-ID: <20251031120703.590201-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904a689 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vptr8DYYLnhAWPBg-1oA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfX5DWRdTfpfQvq
 0i3PN0fH1imlEV5+PuuutvfjZ0YyGWev9WIPSjC+L/Qjwa+z2uquJT7p0qf7cxK6CiWlOlO/HKN
 hztUC6TsdOmvwW1xcgeDQjHDrAI/ub0xseevXsprq9GobmbyDYR1rVidEcA5u1136JTPAzmsJix
 jTMnAbd/OH4s9jZjFkqOv4iRVBCkJAZPaf/WNzkZ34S/AiU+aXmnhDEPWJ7u1W5tD4iN6c9ndRs
 kjsXTawTSijSWtzkPwINBxereweLn1wpMttZ/O6n6wkqOFw5BHHXfWYXnWTEPI4NMH0RO70pgdX
 HbOsWkbvkt5dqkwBeqNjmLOcRtkOLvUA/NCPallXeU5qCi56X/KB4bzhZ90E/Utww6Qh5WRof5E
 S39NlSObaATXnDDQArNaQHXn6bIyVg==
X-Proofpoint-GUID: WKdzsvS8KHMl2wfscNZkvWGSkXARXihS
X-Proofpoint-ORIG-GUID: WKdzsvS8KHMl2wfscNZkvWGSkXARXihS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310108

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
RX macro codec. This SoC does not provide macro clock so reflect that in
the bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index b869469a5848..2eed2277511f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
@@ -81,6 +82,23 @@ allOf:
                 - const: npl
                 - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6115-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
-- 
2.51.0


