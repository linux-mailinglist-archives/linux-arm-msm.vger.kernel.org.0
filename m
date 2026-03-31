Return-Path: <linux-arm-msm+bounces-100931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF41OsU9y2kFFAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 05:21:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E475363AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 05:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29781301FF98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 03:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E8E244685;
	Tue, 31 Mar 2026 03:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOA5CxKH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idi7EXBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BDE2989B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774927298; cv=none; b=dMEzmXnZ1sEcGyDITHPQOuixldpVqaqson7ZU82z+yYuaLaIK8VzOS7S6jkUB6KWx+9Lzc2hmH7bs/oW4jeemexdx55NZpwMY0AXuHcsky3gK5UAI4pfurKN9ebiJZXa+HvtZLQtI1J4Jj3C3MZnJIoblGvslB84NESqh+faLAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774927298; c=relaxed/simple;
	bh=Dn6CrJRh8wI6uUFuqS82kXiEKeE5albf9DsZVe6OqHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZRflgK4o5KonrjZRjAm9Ip/zh+1dQ6QEQaZru+SsxPSipJXV1T8u5hkFmjqt336P6w755iecC7jaDZvUV2IXTEe3iMvqQzgZqKOkCOGGbe87K8JyyWpf4EVu4aZtiNwKcUhhHNfJY8U6kRCbdX0l4WkXL2nYE8NjrLCFFQeSErc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOA5CxKH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idi7EXBI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V0deOl3174240
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/6hTUIUuvrbheX/Urbiq81lb23LEfZHvDxd
	xPJ4VLuo=; b=jOA5CxKHtH8mpMgK9FkWN1sUUXCHt6E5FferrwxoCPtzo5OYpWy
	hgBH8QVmqMhAkq0h/bth34fC4ImWxTvCVrt2JoTn9ULANkI1AOcHVA0iL9dohYHw
	8KQa1WN3k238LPa/ujnB39NdJxX8YGNr/JEXIqFAJmp2cb6Xn2SVZ1TaPotGAhK8
	TzmnN3EyCcwx/pDrFwtpaj5DP9Slo7uHK0Ygshsc8av2olxT0W5A873i8Mllo8up
	Ubk0bL/8oONk1bUyuebDeQppeLXHRnIP5dVenlEfKa+Wis1/A7Nz0t5gBlBak+4n
	oumUwSE4hzfXKtepFPaLkPF/vqayQ8Dig7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h3e7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:21:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b250d3699aso55426235ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774927295; x=1775532095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6hTUIUuvrbheX/Urbiq81lb23LEfZHvDxdxPJ4VLuo=;
        b=idi7EXBILjAST+MG8WnglagEhQeJHcTxjxqAP7LcloWOksK4yy/t8DifRiLBfwFve9
         CzL6UiwdhaB3M1EP5LcxOo+dxOcuYmzqFkuYPDkamVuDqfKzkAtfW5CINUQLPtEftjY6
         EL+JGvGh3j4PNKbku6QwuEzST3Hk8HJS2VqOHBJg3xSMQm1imqr/WyTmzrFT7LvvZa3i
         8f8UusjZ/YrXeNRyKkP4CsiKllgrmlcxPZuvwkmJRaZ4Fu+V6Pxuo1TLqkQBVUCi/iBG
         qHHCw1UV37K7JFncsd1cP4SaT/Wpa7fyS8Kx1hDHweAkgY2wVIqxKImbA3la3yIp3Rc7
         hpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774927295; x=1775532095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6hTUIUuvrbheX/Urbiq81lb23LEfZHvDxdxPJ4VLuo=;
        b=nT9oPf485qm6oUdsei/CmOEskA8InHnYZLOIP1CR5qQr5Qb6Sr1XrZwC03/+BQkKDK
         UD4EO8hUrQQxfPfEoXMWo8Oy9Gk3jIB3p2V/ZkU3FPGOthX+TF6EScUY69DIc80Y2IU3
         eWEYFtX2U6U5vsWgNrTHHh7DVWMBTwOJ/MW7iwq94JXTSSatlF2GmSRgKI46UUQoEEdf
         eUYHT9zxDpH0U1XyzJrN3FxW+gu002pG1VsGr90ngsHKviWP6LCU1VIoLaAizCT6VmbM
         WSpR2Yb57NzjHvee5UFDYtOGPYSlx/7bnz8pn66dOSSybgn7CGe/d8QLpC47sO8zEWAi
         4VbA==
X-Gm-Message-State: AOJu0YwrMMPopAHB0lrmSHeQLgvDCYHzGD3DNJBfnu8vbOi4jWGelUGk
	CWvNMJaeoNoTQuigXMeC2uO/bDFUqZFPd7iBTut0o8NyeGkqc95kQesCRdTyGh/HKfzufzZNn3d
	1891ZiykGeMl2R88NLnEiFRQydtf0CSi4yMg12ibZ0H9RY2jS8gCeEABBjTQnUv2STk1O
X-Gm-Gg: ATEYQzynV8KhJQVaOTP/37cyATaGCLTdXh1VznJvmiVEQg5hOJP60+yZ7RTcNd4fS/b
	44Jjao6SRWo+wCOySWv5m062o40yowTSIIqWaHgHXdcOXNuJC8Hzko1l7b2U9mLBY9H3V+1uUdm
	mJfnxdRl2BExolAx8s+bsyyaVwxV97qIao/G2omTmgJDo5KN94deQ1VrP22RRuLzquYgoDEakNE
	YO0PyfzAWeaseh2wVoRiUrOaX563zxzrqCk2oVJzZkHENmP79OQPSeDC7wT2q3FCrcb5xNie0Xq
	YGOoiUqv6gMHq2GZPL/+XlzXTYa+zu+/HbjjXu0e3zLPu0Z74L8tCfbZgnVOsGE/7z7u6enFQoM
	pDXw10RJLAun+ERQ+4UxgaanmyayAo/n79Pcl/L2sdApjiZranE0TpmswaKUA883I/1YUBeGS0F
	gIn3X8kcrYGQed0A2Sc5OF4tQGc5bjz8aZ/eBf
X-Received: by 2002:a17:903:41ce:b0:2b2:470d:6d0d with SMTP id d9443c01a7336-2b2470d6f7cmr104282465ad.9.1774927294754;
        Mon, 30 Mar 2026 20:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2b2:470d:6d0d with SMTP id d9443c01a7336-2b2470d6f7cmr104282165ad.9.1774927294267;
        Mon, 30 Mar 2026 20:21:34 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b25ca51aefsm21104875ad.16.2026.03.30.20.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 20:21:33 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, srini@kernel.org,
        amahesh@qti.qualcomm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V7] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Tue, 31 Mar 2026 08:51:21 +0530
Message-Id: <20260331032121.1279203-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAyOSBTYWx0ZWRfX/6bjSjgLOTtq
 tnMCCaWiBePUgK6XqL/t/wCvOnxDPbHuYmrOS5RtgpHYnEZpG0FU+cENSBivW79S4Ob7RLzpV+2
 /C5HGxH4aepyJOtnqFqEL3G/+ULK7I+3/X+H0eUkG5AjrNs2gn8q9RE4521ag2+gXQ6VzQO1GSh
 dTwrsVC7ApcDkM8/DXkBguOu2GkJXQh+09xDlFQT3HIc/rB1WeF2Pzq0cQ3e+DE9Dr3vKw2IOc6
 FpiUharBFl5Te7I+hevtJBoiYirkYKEC5cZJuZ+mjrrx1dd7vfpGcWW0JIoaX+rJtbNOUQ8oAd1
 FxaiareQti9fCSRQ0cpYnMvIS+V68F9YV1Nec5yPyHratQ4PZn65UJO8yAPe/6apDrNSoaruiTX
 Koh+bKBPksBIgFb7d5eulPQwScHsIW3CqN/mWLltpLO8hFDqS7yGKXZf0Sml5NeB0ML6+B1om31
 APAi1ZKR5xQ7FhUpxFg==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cb3dbf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nXg5SIL9QfFqj7ZtGcoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ApIWXLe9wPySmRdjhWY2v_auug00Xske
X-Proofpoint-ORIG-GUID: ApIWXLe9wPySmRdjhWY2v_auug00Xske
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310029
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100931-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E475363AA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Greg if you are still picking up patches can you please this
as well.

Changes in v7:
- Rebased on the latest Linux-next
- Split patch series so that Greg can pick this one up so that
  the dt changes can be picked up by Bjorn.
- Link to v6: https://lore.kernel.org/lkml/20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com/

Changes in v6:
- Pick the audio series up. [Srini]
- Pickup Rbs from the list.
- Rebase on top of the lastest linux-next.
- Fix up address size and other misc fixes. [Konrad]
- Fix the ordering the various audio nodes. [Sibi]
- Link to v5: https://lore.kernel.org/lkml/20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com/
- Link to v0 audio series: https://lore.kernel.org/lkml/20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com/

Changes in v5:
- Fix commit messages (patch 1/2) to accurately describe compatibility [Krzysztof]
- Link to v4: https://lore.kernel.org/lkml/20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
- Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:

base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
-- 
2.34.1


