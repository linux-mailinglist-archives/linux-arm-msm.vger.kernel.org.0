Return-Path: <linux-arm-msm+bounces-110082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T8GKNvwTGGpHcggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:07:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112D5F034D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 343F23079EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA053A5E97;
	Thu, 28 May 2026 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHdKia9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YT/7TSdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F9A3B388B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962858; cv=none; b=nR3zJrqWe2fS4yvnUhgPVRP5Kr8son1XeGMCJm696LIBJiDk51lm1oU2DApUFe2AH2SLemm17AtlM3PIrQWIMDLrbjCM1WQFPu6DqO5bvFe34i3Xa/T65xm0zgbQIBOZNwTDEzBORJUHk4b8jn3pUgiPszwC2am3lJW9LK6cROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962858; c=relaxed/simple;
	bh=M1Vtwv7dD6jz1weYO+KPGRu/3yG8JHsMNrT2B4YP6W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmpTfGBBf6LPVH+zon7RnxPXHUnuMLLgVB9PnvylkbPlKuZcLVYEcUugFznkIG1OhDBHSYFrhU6Sm4GI2tQNLzvdJ5mPiUBxtpF6YuNUbuhdfx68uWNEx8QCtEC7n1hVgokgcTSYATNX4SqGCBSi6UJ7VhD9eSM8C8kpyoI3YDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHdKia9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YT/7TSdj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vOVN3545365
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=; b=KHdKia9yVO/cLQyW
	R4M7gX+Eu9iW6emgtz0AorsOhXvEphsYkQttuCqbYSCbXy+d8ozr2CNqGJn4mmP9
	DPKQrSIvd03VCViQ/yD+BU+YrsiyfJahCuSlsLGWA0GQh4U6qpJoaO/eqM5u9T7n
	1yE7Vstfw8L5FriSh/a5zlBVzH1t7huM3Xfd4EVIHoeJWjeOzX6QlfcxssZeSI8q
	AWLMbk3+xWtiv6rA/aaPUYrCc66A0QdXe3EZNT41EszsYmOKiXh33tRMmw837uDP
	ys4S1A9HuAizEuwSLx+UhpTzvSibShiEpLOkmHJrgfr6mouzi+J4W2T49NLyYTEK
	akr/iQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3tac0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so11920901a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962855; x=1780567655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=;
        b=YT/7TSdjZXyebKA5sMHgFzobKjX8Ony1RzfjFp6tXWgITBOrqGsqU57nPsnMa3fe1n
         3pJEN93/PLSx0t2EY3qGR77fdeLy3g5xL4SB4nGukRLehYR00gNebh6rDOqmSSJlz4Mb
         jYFUVslZ9LnWfZ+zgsf89PQrmXQ3hQRzjK8t5CQXxFaF+mcQON2q0gkS3fMff+2zG1i+
         v3XUlp7+l/v1IOs5m5pyuwp41m3DpNtRKYbqvo5BDGLj/lDM22lpXD/QdUMHnIo+FXd7
         MwxZz7taxCVaArPDXPEuVCDsi03MlXAN+GyAS2jNF3YEp26AWZICK8PPYpJ0SWz+SW1v
         /GLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962855; x=1780567655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZaR8B4PaV/wqzFpiMwRE2Za+f/kX98Hasw4Jda3t7Pg=;
        b=WfXtFgE/MoJTTlYLYLRYqx4rkDhYMw54w1LhxUd7fqpc7bL4n94oScR6Jlmoiapm5U
         V8oKhkONnvwJarS0TRgUP4iC6nPwAe6khXebtP2SNf69Z+Kv/OP6VXGe02WddPBh7aFn
         1ybsY1qMkjbmLEO4Mqg3z4jNiaSlt8ouz26OxngwuDC2yfvAyyFdJGWsVtSYXr2K6k4R
         rea/oLjjtsWU/dfz1dNmjLF4aBxJfRKfNnKN38oL+1dHQfFfg8iCfhZ5+EAiF3+IP2S7
         V6+rKjL81HwQ9NTdMUQObiFTsQqkgGmp3TWpCsRf/WS3uvDzIE1nfW/ExkLrAejAaPPw
         j81A==
X-Forwarded-Encrypted: i=1; AFNElJ+9lN5PX8Ktydej/RqcDaVsWPHr8W3zpJOxFB/xlfIxtweGBYLKqp7vWZyVVrnIx0XaRWF0h1zj/cEZdl6l@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZKZDu4HXqXCgX5tDsaEpf8vD+0pUA3i+QS2A7I28B7Q4mlwB
	eEWRme6L/Dn+nTGmpRCoqWkUsNB2uxje7UrDpFGTlc3fZDIqpH+xE5JsRIqUKNhOyVuMItgX6Tl
	Yvx93QPhWNk/5UtlSLCssMg9JVyRvU6Yt+v7hdDCluU/jHkQ8P8NCiSxV7rwGcvOStqFz
X-Gm-Gg: Acq92OHnq9sg0rrCYCjw4p2gCyVWDf4ZwRtzYmUAEf156iIyR6rcg/eLxWPJ6SOncTe
	I5VWxSq8EkvuuBVL40isSHRHi6C3TbNedYG5CL/e32+oYHlGnLmVmS3ZuAyLA2KP8uFbHSP0etW
	aQhBjcOJiIE+vAOci4Wwc96dDXSrCrMWlQn0A9cTTCKZ217swH77gFR0Ix16ojqK2k4CJG578xT
	Di1TIETPQV63Q3GvouARYoMLnhNDJ65vpSeM94GvLw9AdvomOfS57eF1nMvDlCDX14j9Zgd5INf
	VFr2E85lQd/lleEmG6NQKJcJdssUegqId3U2k1Ka5Zecc8qhGYkfCgSDujimnG54D2jBi2Aa/zY
	YPfRPQFbdNHzsoIhQMyLzr5IepTIWgfmnEgujY/dm01RxlmdBQYg3tu6MSaK5wD0=
X-Received: by 2002:a17:90b:134f:b0:366:3ac:f725 with SMTP id 98e67ed59e1d1-36a6788d912mr27070479a91.25.1779962854562;
        Thu, 28 May 2026 03:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:134f:b0:366:3ac:f725 with SMTP id 98e67ed59e1d1-36a6788d912mr27070427a91.25.1779962854005;
        Thu, 28 May 2026 03:07:34 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:33 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:03 +0530
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: a6GUHOeczTO1jIkDdKg0a1iidafxgAFM
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a1813e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CblTgZ0dn44HXzuTGlIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: a6GUHOeczTO1jIkDdKg0a1iidafxgAFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX9ekjZNhdaW8l
 jC7kQjv+g9icDNHNsDntULERmifzIlf4rMM5YZ0zbGXlDhIoULfqpm0PkN5L6wKhF4DBvVF8Qme
 eRy8vuyA6KA9y96SDi7pQfxxOI0fkZh8PxvygKoUVXcj9P2rEZvPg+DODOjmOt7/QPk6vE6XKLL
 sVotvL7UOROGYD8APiZ+ySdn0IE8zDVsVayyowGzEVP5cXgyTeH5EwOi65X6lY4Aha8+k5Rzn8h
 U/+5ze12Y5SIuvVoecryb7iiIs8lPhu3bmoWzsNt6GG7YoqCGWrUyU2tNmzLTfcYW23xIxVnEBg
 K9vz9RaifuMqJqYXqE4CG+KUej8xAZQBXeW1zI1FBc82bubD9tumAJ7koQRcCaO7uZTe2qPEr6Y
 0u0ZHnNW51NEYhJcBUb6weCKDzGpAs8HlXr4A4649mbR3TV6lmao/iQzp2/zPhd1FFyipAW4oM5
 wca3JF2WKtCsJXFM6ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110082-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9112D5F034D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
but has minor differences with the number of input clocks. Update the
existing QCM2290 DISPCC bindings using conditional schema so that the
QCM2290 requirements remain unchanged while accommodating the additional
clocks required for Shikra.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 75 +++++++++++++++++-----
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..b24095814d9e67a355321d9013e144f245077322 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,25 +17,21 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Board active-only XO source
-      - description: GPLL0 source from GCC
-      - description: GPLL0 div source from GCC
-      - description: Byte clock from DSI PHY
-      - description: Pixel clock from DSI PHY
+    minItems: 6
+    maxItems: 9
 
   clock-names:
-    items:
-      - const: bi_tcxo
-      - const: bi_tcxo_ao
-      - const: gcc_disp_gpll0_clk_src
-      - const: gcc_disp_gpll0_div_clk_src
-      - const: dsi0_phy_pll_out_byteclk
-      - const: dsi0_phy_pll_out_dsiclk
+    minItems: 6
+    maxItems: 9
 
 required:
   - compatible
@@ -45,6 +41,55 @@ required:
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-dispcc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board active-only XO source
+            - description: GPLL0 source from GCC
+            - description: GPLL0 div source from GCC
+            - description: Byte clock from DSI PHY0
+            - description: Pixel clock from DSI PHY0
+            - description: Byte clock from DSI PHY1
+            - description: Pixel clock from DSI PHY1
+            - description: Board sleep clock
+
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: bi_tcxo_ao
+            - const: gcc_disp_gpll0_clk_src
+            - const: gcc_disp_gpll0_div_clk_src
+            - const: dsi0_phy_pll_out_byteclk
+            - const: dsi0_phy_pll_out_dsiclk
+            - const: dsi1_phy_pll_out_byteclk
+            - const: dsi1_phy_pll_out_dsiclk
+            - const: sleep_clk
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board active-only XO source
+            - description: GPLL0 source from GCC
+            - description: GPLL0 div source from GCC
+            - description: Byte clock from DSI PHY
+            - description: Pixel clock from DSI PHY
+
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: bi_tcxo_ao
+            - const: gcc_disp_gpll0_clk_src
+            - const: gcc_disp_gpll0_div_clk_src
+            - const: dsi0_phy_pll_out_byteclk
+            - const: dsi0_phy_pll_out_dsiclk
 
 unevaluatedProperties: false
 

-- 
2.34.1


