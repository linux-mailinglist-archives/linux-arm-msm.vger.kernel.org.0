Return-Path: <linux-arm-msm+bounces-105136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKrTASS38WngjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:45:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58122490AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDD6F300C93D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 07:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962243A6EE0;
	Wed, 29 Apr 2026 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOa6jCDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gngLto7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB13A6B68
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448653; cv=none; b=apLZqqF9dySdaaFv5Lca0oZ9CUCrYX703ZoW/alQV+wABiKV+ppfnffzOlyENLgAdYaDXY1R73TbLKClVxpZJyuTCtCYTmCkwyyUbrinwKsDenDTjqryv5oirYuhKYrHgrlL495qZRouxWfWCsqcXfcwr+KoWgPEEFm41yXwz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448653; c=relaxed/simple;
	bh=nCGNVdOSbKP+5Rvbk/rIUMxHzIT1UqzaZk73i/hheGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqBXXoMGMHlCTgZ+Ydea/eOBtLTeDzT71cr3/PikNRgpDia4FWOgtRIGMGLZ7Nh/6HiTX62ltWwM74+y83rCJZoEsxqKcEQP7SSmhAczaKq7WZwA3MhMDxiWLRQIPxcPoFBHJVY0MSMETo07b4LPIqtNHkl+5Pbh2yUALwILSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOa6jCDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gngLto7N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3JCi2831494
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=; b=FOa6jCDbRllsTgbG
	fHHxmCsEDF1OKds+K/ic3/zeBy94bmf51PLVfUgzwf2cs0QeKOLUV0ToSLekG6NN
	GsX7qneRkno2c2pwEqF/dV62MZQcKFfFsQy+GM0u3IzQrZhi1tkZkosRcjVZrCh6
	YQe/njYG5bhtpPrH0i5XYckpDfvHsCUPd+6WGp023SSlXXtF263DGIQjPapQTjU2
	gJEFixzUAewc1YeXON1zeEsAU+fnuWayTXw2qFBNZSo3Jqu7V6cxyqRAAHEsXFER
	BEynfGe8IQjO30Y4Tp479Id7R2gSuHvMKLn9v9SzA+2HG+La0IIzLuAe2TtirYzs
	q+gOhg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqar79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:44:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354bc535546so12732145a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448651; x=1778053451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=;
        b=gngLto7NC50zFipJEh2gJZByvgG9uKfGSyYCbug2Uilmoq7EDgTdUyuuyjw4yKToOu
         0RgsTEun/+bmH36jOJ7/14REmHuGWl8hRx34gnlQmdqqYrWrC2WgzyZIi02A+r9jLipP
         JlBeakjJr5zBIVMVWi/HE81qQwodcTipSQqEfU+O2bN+1eYx1v4mxkGfZZLh0BFTT8Se
         NQbFQh6rKHdPt1Ncpd2GArKnjZqts6DAhMvmYlf+9Cjs7KdTsxLKGCyq4BoMJp9iIrw0
         19OuNL4SfF5b049BB9MnAHM0nd1SjqxDTgw81r41GuxP2gvUubrWBZCIwktbB6mdguSP
         6B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448651; x=1778053451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=;
        b=cD67vIq7CqqcndogBHvkVcc2+96mHynyqPsHFvAM/NnT/eun4neVK/BzBllPp8VbgR
         SYXOKUSetkaAYFxTwIG+PvHbkJzV98ko76kWdcWBK6qhagP2qfBf8Vo7Qc+r0eLzOI6t
         LG15Ehg5GjjheLeVr0xhg96l5QQ+hlaetVLjdgqXk8C2m4xijoZqRoqvnRBmelZkRuDz
         jG0iNF8uAr+1tuQArlig1U9WsrT2JyBW/0WvhgGGNFwA7ATGdw1lt0HjbdBJmi+EtX1i
         rgQgHthnMbPjKBlYUOZU7vGe+t7QODfMUGsHjbuLx3EQK1RHWNTT4U2n8ospWweSS66e
         RruA==
X-Forwarded-Encrypted: i=1; AFNElJ+IYIDS/quHqFeEJxP+f3HzwFBF+DjfRn625VmwSuZZ0Mf2Y6HKek8BfluRgJbj6DNir4OyAGCHS3IoYGZm@vger.kernel.org
X-Gm-Message-State: AOJu0YxPk4AYGfCQSsR310+39yu7cwvsMGQCfcHoWRN7Zej0AbSXVPPM
	zauP9DyQhnXZexHXhYZ7kcDvcHWvkSylMESybYy3mXwUhQpSXHCg8Jsi70N2LC3OvJVqF2cSDqV
	YaWPNhcsfIBF4IH7bQyGRXS0RpgBeohtcOZBCIkbIg33L1upknSqP3v2AtrkI7ekbdcUm
X-Gm-Gg: AeBDiet+PNBb89gKo1RrQU4u/MG445EFmVBJaKu8EBfVrbWCnoGkAh1R6lJkw7cu9Tm
	ZjATM7dDpV3a2a2Q+7KIAdVu/PF+hWFPn1T4q1W1TiNgrO8t9ttZAnib5XSSrxeEEsGuSZa3taw
	DK6S6NGCcZTQUeyjTESJk0KtEW+AbhO7v+0FbCGpyDLR+uAnMGRAIIXZqzpe0gdr5pwKLzC3fmt
	7Ue7B63W2uALVz3NDzLXCUzANrqxdEhPxB4y8uGL2npDVJdaNs+t2pAfTFgIsXkuMQAP2FNNgG9
	1KI3tUx26R6Vouh6Slxr88sE9sY86dj31AOO49i5eoKxrlMvI3kVSHDmgcFVSkHkXm2Ry86QR3S
	BiBQS3lEEEnspoEKRd3weWUOud31bV+TaEPCsvtrAfLXQox9HiWyKUoYl/ZEwyi4=
X-Received: by 2002:a05:6a20:e211:b0:3a2:d68d:9e6c with SMTP id adf61e73a8af0-3a39c32e8d2mr7733614637.56.1777448650683;
        Wed, 29 Apr 2026 00:44:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:e211:b0:3a2:d68d:9e6c with SMTP id adf61e73a8af0-3a39c32e8d2mr7733578637.56.1777448650218;
        Wed, 29 Apr 2026 00:44:10 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:09 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:52 +0800
Subject: [PATCH v5 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-1-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=2017;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=nCGNVdOSbKP+5Rvbk/rIUMxHzIT1UqzaZk73i/hheGU=;
 b=SsLaueJ9P2BSamWpqEywUfgQ/TPTcl/0wfNpalloUqAqne62mP402W7Jl9OyZXtgt0lUudSaF
 ev89sTRtzaeDdIV2A6qiaqqr6R7kGcVxYnBq2eDgCV4zYUQfx8Jx9kl
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: oUt_ny-ub6stY7D2Ww9dc-bZ2W7Ls-Hk
X-Proofpoint-ORIG-GUID: oUt_ny-ub6stY7D2Ww9dc-bZ2W7Ls-Hk
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1b6cb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=IRvKDNPyRmbH6eZ6UP0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfXx1RRvupofXHD
 TvjLcYB5IjAoMeQAA6+xnaYJa3voh0qxLD96/I236ZuwM59GRNgoWIVKD1mV1Y7lfLvoDb32ig+
 xzpVwK4HCwlI3KLDYUhWAHswN2frNTy72geXAyaglwArYZBhk+pvIBEDmjhzxoJOue9ZICkb/xC
 Sj0CIMwIQr7iZw1EEufIsTRhXCRJxyIJcKRVutaAub01Dwef/14uWBw6Lhm4PmhbrgJ5B2WPO6m
 JifvDpe82eeuzDEwHMKScg52FYBsTn5VWa62AvlMVGbfQjSWCteF4a1rlYLWB35eTrT7Lmu+MVF
 6aKUONyukXdn8i8Q39m3F+amKLcceXOYLwbO+0A80kLQbXCYFnJ068O0HfepjC7NsM8i/YSU7K3
 lTc7AxqiFWn0IKsYsp/pqxjwfMlEIDAIalac7g62dRjIKruzg43ScseK31zVV/DyIsAg4L7hKBR
 9+Wyfryy9B+oQ3dP6vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290075
X-Rspamd-Queue-Id: 58122490AA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105136-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the new compatible string "qcom,x1p42100-iris".

Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
that requires explicit enable/disable and frequency configuration.
The SM8550 driver has no knowledge of this clock and therefore cannot
operate x1p42100 hardware correctly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0


