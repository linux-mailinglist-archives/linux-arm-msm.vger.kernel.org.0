Return-Path: <linux-arm-msm+bounces-95389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK38EDBvqGkkugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:43:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E058520555B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF16C30B3108
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 17:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF463C3C17;
	Wed,  4 Mar 2026 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAtTThED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIhNsVjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4854A3C2792
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646081; cv=none; b=oH9G+62YpR6YMEn+hvFjxZIqwYuBFjc0m0TiyLlDy/4pfRSUHzN8RgheYTBm0uDiZWB3mf+YDJe/63pkdthSVdfJsHwBIBr3IRxklkq4vsdxaEoafZg5lQMhXd0RpLtmpZcwqWBIARSWSGfdZv48rQyVtRf/ev6eC4rx5cBzYfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646081; c=relaxed/simple;
	bh=AnG05lo05UKYLZiQW9JcG2T899MXZCA5VZJh9xmrkyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ku5aeGbwPNQ3AolhFNRfApDwan6mx5GW4uloNM5og/YWRef+1LfeOJCv6ayBHNISirkQ+lxjqdBQaxUN9q/73F1sK7LgjZScjnjXkxuStX4AA/r8AO8LOwkj1asw81bt17vlFO/wF3cxywBaypi/K1jKTfPvXTBw+7QlA1bkOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAtTThED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIhNsVjI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CDs6B1421884
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 17:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/54ciGxBJeuckQMxKs/2VGcMctRAnTW7UpWd4xQqjM=; b=mAtTThEDCIxE1ZsC
	hw/EBHMaIi3zGytjlHknDYJt0b+2E2Y1kb9Zr6nGx4vmGQ/aJLva5/HH94tw1Tpu
	26C20xeaWn47OkD1O1tpXkxr/eMLVxhPmxsrNc1t1ksBW9td8eSTgeFFKktsBpGh
	p3XFg9TYqQVGjCa1RRUIVuodTngy8q31ihW6SkPv5zItKXdHsDFXGu2qmYYnpgcI
	6YM4bNbQ7viIVnCd0BcMFdY+6zz57zrTLvA6NETZEx1Kb5sLlSP2PEsUi95573GC
	TwbauE0ZvQdBKok+ow+mysMdLURDUWy9OkVkP83n8RmEB6CkdZk4nV3r8WODOh0Y
	RlsT/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u2b83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 17:41:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c737ced4036so442860a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646078; x=1773250878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/54ciGxBJeuckQMxKs/2VGcMctRAnTW7UpWd4xQqjM=;
        b=CIhNsVjIEfhlyAyAqLJ/ttMAj2asDOntIOEGfhlVqb3vYSNr41HY59cNl9xsv/vrQ8
         ZW9oh310ZIg6PqkThQBm4ngTTgBrKYK3TMc+g0icUYFLfaE7w4qFx95qUyvn5bHvnsg9
         LZC5Nz6pYbWQOJbGi09ZINWLmOie0yWvZgXQtWqerEENWS10IB16WHHXRvA5xRY2ZFAX
         sAbMB2Qp8JOuTM99jloxH5pxxaM1N6BM9g5uApmptYoyTfiLoGQ6P/1H4acHkLBzKXz4
         ZMPaPTIjTSP2j8zgNRaw4dM+vBvh6o1a8Y9eVD3mP14S3R8T73E0Ln1XVg4hCbeI0HEe
         bmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646078; x=1773250878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o/54ciGxBJeuckQMxKs/2VGcMctRAnTW7UpWd4xQqjM=;
        b=D/xNKqPd9oSWHaNjNs1KLAsNm1F3CZTgH+6SZWVgS5zDbuRmBr4xLaKI1DXV5e2UC8
         uL8LOoSQgI65gRud9n4DCNYJfYPS0gaEXxHdeFHdIX4x3z0pUj4Wu/vkllqMLCyNrVwn
         ZZnrX8gs3k+cA29ShV5e6TJM/DPxJgw7WU6TYXEWONEsBr+f93okbTHYM3s87wxfiyEI
         rg9RMuz+8FcgFIZO0L9X4PDMtRvmN3Ew+yEecFGtTNLayT1K7RQ1MUOKMVncfVKLFBij
         pJDqXyagbcoC9+aKVtPs04Zc4r13+nTY5zZMn4liT9SY5NTxh4Hg3lyrAqw/aoj8oAPx
         9zYg==
X-Forwarded-Encrypted: i=1; AJvYcCWxihkjinBbplDC4+aq08qbcMCW/Mp8VeKmurlIPPMuaqWFXb8gT03YprtpkiwIt8vOJKt8QY6DMIgp/vLD@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPA3havBjN32jG9JU7c7FUgtFHziZ53tFgHT9h6bxqz2XuZFc
	bC5LfWH0JC5Tn+NHUaK5Thpp/+oMcdmyhciYMSZcpotCTj13/oRAvfT28XmKRFsKDEA+UzRoQXO
	Ogr4lIdB/f5/fto4DrStHm0FrCoGwyeq4o6HPXQ5Vijw26haYwLXm8Ht9hVkD9hzOekc1
X-Gm-Gg: ATEYQzy8Kj7Qb/qApxpwptnA1/ZRBwQ9zOYBQ54fWbFaThYHsYK6uFst/PvfE3FEitg
	3yxl5+LFwoIhj4r+IeowKXkzMFfmYq2jPJACFdHG4FmkhBzN/x5IrzJJ165a/Ps5QaDQKz+HHVz
	9UPVoxONuCYpHA7OAhPkoDz2w7orZtJymLM+ECKgLsJk5vy7l8Sf9K6rlCzT3MovB+WrKYfdlZP
	rIk8NakUKu3njH5B5lo1UMAz9I276Jg3xKCKhbQ5eMcZfmjhKz4AHK1auyezuIckxquoCYIqrRJ
	MKgn9/ByFYahdIgHBgq3A4mDsqRSxtZsaLoTabJQ1we9EN1XA1BbS1yZ4IfKnir/KHqMpO1+Plx
	liC/1pSEgGjAmrmcS7m7n6mkuj1Pme9gU9/OotEj5Nap754rladno
X-Received: by 2002:a05:6a21:e90:b0:394:625f:c565 with SMTP id adf61e73a8af0-3982debb82emr2734164637.30.1772646077956;
        Wed, 04 Mar 2026 09:41:17 -0800 (PST)
X-Received: by 2002:a05:6a21:e90:b0:394:625f:c565 with SMTP id adf61e73a8af0-3982debb82emr2734140637.30.1772646077370;
        Wed, 04 Mar 2026 09:41:17 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:16 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:52 +0530
Subject: [PATCH v2 2/7] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-2-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: B0_rEELfWQ_FPmnsL5NO5jIJ4Z2QgwWH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXzOKWcsptbOW3
 w/2+N2cqlzJ4DOeFh6ajnYdGFzzeSHmu9FTjBbiSjW5ppWI5hDvVFXHLLJDwoPylmobR8FfWdMw
 +272XRTD4ol31IwTjHD87IvRDAAqy196juJfBV5wtoAjw7n/tFcWxPJAXpHm0500zWjey4RJTlT
 Lg2ybkPqtcZwd4ttXTS7mUM40HVgCHcahdathFtJgJmeNOMHoXVTIM32THmimN9XAVvqJ3a/bh8
 JgB/w9DMu3WcFYjSdcnjynx4hMp8tpnhSZFlU6r1FleDtqDePbensQIkYOGJGS3h9XxmoXh2BE+
 nRHwTNpyImuoEzHCBPB5h7H2jRQIhOi2RG64EjsJxTFaWWzxVpkecVGuRtkTcjh0gktKAxYDMOD
 1vhDnU1EZx1dA2DptR79ma9KJZ+oCWqrsxy8BifdjBUzAnyuqOcp43YJp6vdTtxyeeurKJdmwak
 Jq1PinMw4u4jMS94D2A==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a86ebf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-2Qx4yxcNGLJKJli3vsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: B0_rEELfWQ_FPmnsL5NO5jIJ4Z2QgwWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
X-Rspamd-Queue-Id: E058520555B
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
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-95389-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add X1P42100 camera clock controller support and clock bindings
for camera QDSS debug clocks which are applicable for both
X1E80100 and X1P42100 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..b28614186cc098268ab0d8c32b21d9dd9508c9f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,x1e80100-camcc
+      - qcom,x1p42100-camcc
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,x1e80100-camcc.h b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
index d72fdfb06a7c716ed2ec376e061e4f0ca35f42c5..06c316022fb0d26ec6243b28477564d97f228c8e 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-camcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-camcc.h
@@ -115,6 +115,9 @@
 #define CAM_CC_SLEEP_CLK_SRC					105
 #define CAM_CC_SLOW_AHB_CLK_SRC					106
 #define CAM_CC_XO_CLK_SRC					107
+#define CAM_CC_QDSS_DEBUG_CLK					108
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				109
+#define CAM_CC_QDSS_DEBUG_XO_CLK				110
 
 /* CAM_CC power domains */
 #define CAM_CC_BPS_GDSC						0

-- 
2.34.1


