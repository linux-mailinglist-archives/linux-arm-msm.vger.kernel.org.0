Return-Path: <linux-arm-msm+bounces-105103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M/lM8aH8WmchgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:23:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0848F225
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EDE9305041C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3A738B149;
	Wed, 29 Apr 2026 04:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnOAGdwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0Ox7Xri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77E338B124
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436583; cv=none; b=eZZvWsW48Cb9IQnfwF9gQ9cbdShU4Tr0qAGQKfLZ7GQFJcc8B+9jOadyytFrOe56yzb5HeZ9iQS2RiRhGWQbNjwtB7E0yZJBsWJJS+JCcdREtTGndihFG/kG7ebPlA/g3Wm2zbdUpQuWN+1ECNFFMCOL0hcadYe89A1v/zMTt84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436583; c=relaxed/simple;
	bh=5t4du17pW2GAwFsQZwduJ825MCN2mRlucu8HnAoe+JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HkF0HKn2A7n+LmqPn8zdS4OD7Uz8cjeAgqcVAM5MCII/3Rq68zIGIoE0lMO5vRpz1z8s4sNegtyfIqf9t/JQ6vVVv4S3GZ5cFNDbmtDQjgu5NLeE6be9wJmN1ZVeoLcKYWAKYBSYY4yrTrsIrWaYIyLeIG0siQn/kZ0+BrIcnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnOAGdwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0Ox7Xri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T00SRI2890684
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=; b=UnOAGdwmUEPtLtZb
	GewWXlNg0zKUzI+UrW8lrkqPSM5hRjIADX3+nokWGhxctmcpHnEkmETrpo9M8hef
	8N0m2Y8JGvPPr+5bHhxKx7y88P1ckdh3RsdbiyRZn6HIIQMzB19gcPOEhi6qQw18
	fYqMx+8Zaj2Db7+6p6KGZBNRfmm5BsUoqQ7HCtH3TuB56X7hD/BwYd8rZjRrIpcI
	vIPyR9tz54gfm7p6eXXE01PepdF6P2i2HZDI7Ga8o5tYCLzKsoX7qOUQG8qdQTqB
	DQaWQlS7fWxO34ye9FxO3GWJJLXljL1y9TZFGBt8q6MAXxSxWtZjNMjzdZDOwX5/
	ACbesA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyusgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:22:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so13046149a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436579; x=1778041379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=;
        b=D0Ox7XriuSeBLN4eOOsmpsBWQX9FamrueOcJipSjW+0fsuzVSqyYYoOLGAD3T/s9wu
         wv/CWaBtOLYPcecszAKzuVNxV6n+vcDIBOhh4qdkCS2wLV6PRXy4Iz80YYKcjXX8pWDA
         76OnVv2E3qXZIIwPhrHUDOLtpuxrS/W2Lq8Bmxttqrl12Iu9YFDgguMoFhBnWYCzH0IL
         meTEILknO/E3srRO7hwpGf4ctVY1nRfBSzxWHgaYFdqZz74ZgYRap8DtSClKMWTq9TQV
         hpnZV4jT0vWipnhzMr98oAfkDlQAODdBZNk1y4n8RcZP8ToFTR02bx1o3pp6DdT08AUr
         XE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436579; x=1778041379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=;
        b=sF3bTGWlSco9k66YQgOT0v9wapY77tLRf9lOE0wQqzTaH7tw5cbs6YSEU/lXRrUxrK
         PpzaEyhDBDy7U3xUeM1axe0Iyn0ICHQn4G/gDgkkDRs2fC8f1+W5JtSBMpvwXjhqfe3l
         PVQvChafoxdxvbBGO/mWo9Ar7zAZ5cdmC5CcY/m3p/8Hl9ASgzZgPYi/144eK/AoUjyM
         pTKG57or1aZ4s/D9c1A/hFrfB9IM82CCa3S9j8MhAb2dYucVHRAx7Y0qHzvVtu7E3y2+
         1HAJnZkYUeG87lh703hxSsxOOv3bjjTHpIhb3GQEW9KVsuU6cUtCUDRgDwBjdfc84oNf
         o85w==
X-Gm-Message-State: AOJu0Yxi3HxxNse53OHbza+EGOr7TvoCmjyU95nz9hRmUV0YFsJmgIrR
	blKLO35gCfP0q1R05MHIXk+8v/dzl+8jJuSYXQyHAqP/HPmsuyjq7iBYzNFTNDFV1CdDwdu4wMV
	UBb+CCTpw8Cv4cTGXZwJ2Uyxc2dH4Hd/ZpdfRzWImzv+apCuBisyB9+KL++MRb2QWbxdU
X-Gm-Gg: AeBDieviDpKYj25zvpFVtNdvWLp/CSL9JbWfemHEq+3dRVSDZ6eIvuCR8LXOhF+JcXC
	s1FQiEct4pm/ceDj065PQERzAN04TuYrebpmxb0zmdK1yLcm1T5MVlm9+8YnxsjmW2SOyn5UJB5
	6S8eIx7Coarnn5u2W89syMyEWo6mXmmXK6ZNsjYOZqb4rFhmio4n/7awy0LzJkwS2JkJ9nW/TlM
	LWhOzPUm6NxTb1eipvJr2YZc3FSDlEDTtx5AZOMOrSdeZnKjVVVB5yVoKSVEjYUQuQl0cHn3tSh
	3StEEAsfXS6iYbvFInCTaBlTDF2/c6b11054TQc5zKEO1F4D1t2ZChC44LMv9b3L4h7yKoe922k
	QjjCfSesOI0cPPA3dP2VVAcuaJ7nm7BEL9Kon+OcT1bMgWIo0f2Tf4tjgKNlfjjpZiHNe
X-Received: by 2002:a05:6a00:90a8:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-834ea66f266mr2042959b3a.32.1777436579314;
        Tue, 28 Apr 2026 21:22:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a8:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-834ea66f266mr2042934b3a.32.1777436578824;
        Tue, 28 Apr 2026 21:22:58 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:22:58 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:40 +0530
Subject: [PATCH v4 1/7] spi: dt-bindings: qcom,spi-qcom-qspi: Add
 qcom,qcs615-qspi compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-1-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=1728;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=5t4du17pW2GAwFsQZwduJ825MCN2mRlucu8HnAoe+JI=;
 b=pzUZDzbK9A5SfNK0sbCQUoKCfOCWnIT1mt2zm8vCLmE0YLlAgvpVQ9eeoVLngHEzQEXJuDmHS
 pn+mqQw4DaNBbn6DZZKFUWaq7gkxifOtM6vrd4hs+GRR+7JdHBQ5kqw
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: 6EYGP2CvexCS2RZeRr1l0hwE0-6ZzeYs
X-Proofpoint-GUID: 6EYGP2CvexCS2RZeRr1l0hwE0-6ZzeYs
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f187a4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kPckM-BePm1yi5if5TYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfX9GjNWzk8vamd
 oZVLHnfTM8gbNUW5liuA26aeAj2Ss4DlnJzcWBcuEk5N2sBhNAovRf5mVSSyXWBDkhWFLkHQK7v
 peHwg+eaeiQq9jzgBV7t2Hpskkf09F4qlZxacspGBqRQsxA78G7CJP0wtVn+uWNJUxdSUu5FE0y
 c/9s8iJydaag+bmAgfN69M9J3BV0ZBgY0bm28ZMphqgCxfjp0E5FYrU+HzG2+8x4KuFcL3myzPl
 mWyw3o2Xj7nIdLFO1yG8Yo/J1AX8W0G7yJ14TGPKDI7eJFHFu8JdZkawM3RPdIWjJda3ZU60LDT
 Kc2GEBtrTbuHkyBF1ew28vnq2+1Gcht9MS56xCzCaEUFds87dLQmLMWARpZX9Az5HdsAShQAMd1
 Aqjg9JRsRf2C9qB465ozW+/PkAx+UmuZhiHVk2wRTXmHhX44WWLOBYBAJYAozUAaFGTDT5A4pg5
 uYtDIspDPAFt+jBrdYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290038
X-Rspamd-Queue-Id: 82C0848F225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105103-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for the QSPI controller on QCS615 SoC.

Move allOf section after required properties and add if:then constraint
to require minimum 2 interconnects for qcs615 variant.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 1696ac46a660..ee2199027e89 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -13,13 +13,11 @@ description: The QSPI controller allows SPI protocol communication in single,
   dual, or quad wire transmission modes for read/write access to slaves such
   as NOR flash.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
-
 properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-qspi
           - qcom,sc7180-qspi
           - qcom,sc7280-qspi
           - qcom,sdm845-qspi
@@ -67,6 +65,23 @@ required:
   - clock-names
   - clocks
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcs615-qspi
+    then:
+      properties:
+        interconnects:
+          minItems: 2
+        interconnect-names:
+          minItems: 2
+      required:
+        - interconnects
+        - interconnect-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


