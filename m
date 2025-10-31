Return-Path: <linux-arm-msm+bounces-79873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20EC24D71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9612D4269F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A7C346FDF;
	Fri, 31 Oct 2025 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQPvey5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIXzhEIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89269346FC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911310; cv=none; b=tXio6erzq/962Zmx7TzH4B192kdX7nLuYJYqCPytTWpraFx8qmN4AFO1M6enzdow5OwLRNjhc1B4fyqpQJaVwiFyUP6MlTg4aQMlimVuAo+UwXI8Qp4x+mJ0TqEVzwboZbxEgD2DbdeFTHcC4xBFQQnmA6h8AXQmgu/rgIsfBjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911310; c=relaxed/simple;
	bh=sOQOsePjYlM2SdUmv8lUrLY2KaB8teOMMCQg12ut7nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myr4fgCcodqh07ST9p0O7OpBv2dOGLoA2y7VxDyTr7tFuSDuIE9It+eXpXiWNdp+SebCXVdVgOJhufHNadSrc7wBKf1xrz73j6SVvJGGnE4Uus6x076NQ5xSMQlSEfuRQnNmyqw/DhGp0SjLPk/NBUMkM+B0lNNyTIJ7+Cr9lc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQPvey5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIXzhEIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73QTE2058894
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j1FjvgdJcCM
	iQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=; b=FQPvey5GVIUh2Vh46cc9O/hrd/8
	jNqN138I5ZOhO6FaGxnnw0JY1dIzG1EtHHlmRsOBodPjgZFb9HCqrgZf6UOlzL6g
	HH9+GmXvKmMaOTuO6fmFhFmbrn673bcAAu3oQqkp2MOBTFpbmpTKUdqFasPAXNsq
	kDwHYBMI0rhRIuAihGfjdNKuoLfo+CxssahzkOZGrqYfqh9hNnIC+9DLozH0pHvf
	9yZPc5nE0paxO8AdiTHPPSwT+ftOtAvaUuzrBPXWmiHTXjLHGO67bBPYii1keGJh
	vXfv1ATmtcIW2XQCnTJW2GwUxVKXkphPWrJgsxbx2KoQ5CJ83r+UNJoDNmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvgs0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88f7eff9d5fso493056185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911307; x=1762516107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1FjvgdJcCMiQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=;
        b=DIXzhEIzLdGQ2NJ9DNJwu+1UFIX4cSO3FhHYUx/mXVqIgMvK2oSAfO9nKm8tNuXaxl
         HAXN5kKjgjY3QohEKvDrbzl1cVzrCRmzvPs03HIiKWe4Was95kCr+BKC+3qX0ys1uQnV
         k7QK+3qAiqtZxAaWUW734u4qqLlBMh0iGQ4KiDTiurPof/2xCkcaV6xG8dtvJyd2wggR
         L+3KEXw2Lb8oe/R+5I3seTvuiar44URy8SnfeX4x6PN6gsSEFXvQPHpeeBeOrMDAY1+Z
         4xhOlRh3FuWqTyHEE/aikz45QFTRT1Xqw8Dd+/XdFI2cHjtjdVHaW4l/GjW73QIIlX84
         WQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911307; x=1762516107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1FjvgdJcCMiQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=;
        b=QKW1VjFmo867VRUw0IYQWpfDNSp6xMCWO4m96GCda1o4QnzHis/ezBiTRJ4PtK0RCv
         vDVm3Bzei8FnPISDJa4j4Tbdg5vd1Uj23EQO9td9yM2iMnzvsAqkB8CQ3fLisZV1ucyZ
         6hmuB5qClMEz0hQjX3xVlGzKbdUcv9eN4K+zQyOIqOAG2PKmiDSYan89zcrDB51U0zSC
         FCvHIkmwT7SLevvlmnPkoDHX9Nsyq4id+xMLNdUp+OzHegCZ6g6gCKBGqK/XlZx10anf
         9P0TJEZ4T4WgXRZCHt3zZ8v/OVm1HsUgd54h8rLC7Xq6bgHcmzxndsYwOQLaIeknq/EK
         LXAw==
X-Forwarded-Encrypted: i=1; AJvYcCXu1Z3NdTNjhrLjtA3RgVohQYYs1DjQR64uV5eVtLgsXPdSqyME/JDJ7r3tXVJJjmXG/5HNSQi2oN80CYcW@vger.kernel.org
X-Gm-Message-State: AOJu0YzeRc4wPjAJEWTUkSIFzGW93AmMAGMpTtGfFtB75JE/bMhUax7e
	5mO1Iyv0yOfCDK8xvCmPLK072mwnJa4CNP5qD0RqB2PFC6FpRuhLlW7AGDG1ka0+F+iAZ3TkE/h
	+aXU1cTitV0wiq65s0YHwNswFNdq2TO2bTAfkJtLs1vy0dxU1WIhEqaCCiyH+Qk7zMyZ9
X-Gm-Gg: ASbGncsdDa/TLA/mcnp4gcE1uTSNEfYlnNRXO1cPbpMe00DDSygQpyvvbYMCV5/0o4I
	Uzio08CSxDLOX1s76m36cw0JrhzY8DpaCByvOSadlmjUoosl12D7SGXxHYfiKYe6f+UqutW/a45
	JqWmsBHUi5h0AjzqQUGWsnq4wDfn1AQo6RzkHLSBXZ1yBapmWO7HviWgr3g5f3DqRlBR1W6Bg2W
	zBAeUu9+/UU7orz4OEGkO7klS4k3jpDl7Y+Pqbb/94oBTcuqWervH19Wh79yFks/sVinaTUW6VX
	qp7Iz9FL1Ljb70M1pydpOJ4RhlgSAPjCA2zNcyfSi9t6C28h1SE7PtmcJ91pnTXWstgx9WOyu6R
	TyQ50+SCtr3/o
X-Received: by 2002:ac8:5d0d:0:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4ed310bd461mr39463251cf.81.1761911306804;
        Fri, 31 Oct 2025 04:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV7FeNt00GvU4b+LMEjbJ+gjBtvvYtDUL9yozhNZog5D7ftzUP+YptgowQ6Mp0rebrCNKzpA==
X-Received: by 2002:ac8:5d0d:0:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4ed310bd461mr39462901cf.81.1761911306373;
        Fri, 31 Oct 2025 04:48:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/6] ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
Date: Fri, 31 Oct 2025 11:47:48 +0000
Message-ID: <20251031114752.572270-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=6904a20b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vptr8DYYLnhAWPBg-1oA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfX9UBbyLgj0nts
 GmlGQVik8wm6iTBw3Ssb2TWkxgsUbHDRFHM4v5yg3ur4r5coNgX6LqqRfosw79oRM90dtN59TDC
 NX8GB6guQV7uli9XoUP5b+Lg1T4cZep4pQHQONRh9qA2b+E3Bwa4UfNX0AyB2wU1xcfq9bnQHWk
 jA/ejbfrszRxM0ueu5G2vyahXUnx6RjJidGvebbygexJwGqdXEFCWFJGw7LNORaVGONssUhCXXf
 AeVnETq0C94eWQkLrfE43AH1u9tbmIhtKehv3d4uvl8S+xuEG/NdVPubBV9FQvsptwAZ2ZWaeRw
 ye2M0O0LhOAwdPVvkrnfsrpppyRVs2umCjkucYXEdWRL5AMed+cy1S+PkIbrIUHK29R+bl0Odgq
 V46EDhJCCMbGHdWcFuiTzowyOH+y7Q==
X-Proofpoint-ORIG-GUID: NluYYD-6EDywHs32o9yioT_L-hSdIJxB
X-Proofpoint-GUID: NluYYD-6EDywHs32o9yioT_L-hSdIJxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310106

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


