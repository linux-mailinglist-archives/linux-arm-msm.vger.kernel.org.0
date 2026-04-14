Return-Path: <linux-arm-msm+bounces-103183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKH6KH913mkqEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:12:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D193FCE47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A814A3090652
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247A92EC090;
	Tue, 14 Apr 2026 17:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adF+VuH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY4NMARU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C252F5491
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186525; cv=none; b=qIXYfZPs3sZkIo2X+7ES4H4W9UbM1OztDOdU+WVQSTHMUrTJEauHtfRfEGcLGpmliCbINlh/+4WGn04+Wi8xOtIr+e57W/XLkzwMbM5+9SDuSDbjHTY3ANHleqJ8Vq0cEZysXX+GR9Qb0fS65qI8w+46kVIPAMIKPvYgHRLEkt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186525; c=relaxed/simple;
	bh=U9SHP4bt1Fs2c7XTKSSf5Fe5zLYuiL+JABoTuDRifhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EL+JgMnN7k6eFmxhG7ElSjvvq6VL+CmdeHZDVYr/qz8fe0lSMThr4sO/ZzqurJ5AbmLuyWLwYE4uzS8WF653QdFJcweMm4T8VlaK6nNw+0I8A1OhpNXaKTlX1MMoF5Ao5WyNiQwLsqicVR0qgN+GeYHdT6GOg4ZrbIsPbo3vzJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adF+VuH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY4NMARU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBo4Io3157277
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ns0DliTLIe9b0Tob6jP05AfojVMCfJToxkNtzSXiD9M=; b=adF+VuH34Ie06N1d
	Gyx/Xq+7khxJ1LKe8tS4pkywB3VV/UmgZdAILx+MolHRtmKinSRnn3YFdEPkh2hF
	1L8a89GGh5eKrnJr+tqRa1orBEWJQDU5iqzAXPEOQj1ZleQe+ita57T7RHt6t7sx
	IFgN3ew5jg+rfNxJ4QJKwGv7aaR5AjuP9KgHyCGAsIV1LeKFsNDBo0h7peOSHCM9
	NVrQOO192FjJz/EEitoxMJ1e3DGNDnqvGlPZl3w+KB2lFQQm1u9kCA1sSZtt6Wt4
	N5Rhz3aaixoHIDD9YvFRizrLn9Dmj24yB3N3IRgr6HfJOZ92kA0CXsV9aCg4Ovmo
	RfhcMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bbqv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:08:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso28934385ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186521; x=1776791321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ns0DliTLIe9b0Tob6jP05AfojVMCfJToxkNtzSXiD9M=;
        b=VY4NMARUlNPPdDJzi9HLHsucWRdSqFUBIOB5nV/3OvD/CzAh/shUMgjtOo+/ZbhHx2
         wn5o39EGC0uYa+nz2TbBJ1NVD0oL5BpvLtHjkDLALw+xs9kf0QSiJBKV8UY0t+JQ4mlk
         yuaXdElIU5KXHuS5ttsvYA9h6fK6QhzDdehhZwcM5IwewLIU2YkWVKe2At1C6DULBPhG
         yfAg9xplEmSsmDNeGVFMHigebMSfz3nO3woEfDnnWTKkAExy+FiJurf3AhZZ5WgSFfBs
         10lRophk4UlRjhTa/Yrpv1k88bSIOgxcsFjKD9mOHaV6e4ZofQskF/M9PiMfeAnaZ+YP
         fdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186521; x=1776791321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ns0DliTLIe9b0Tob6jP05AfojVMCfJToxkNtzSXiD9M=;
        b=bsKS2mOsw3cNWBoQYg6EZy3Sq4cSyOegGOThe0sCVkS3Ob5PkEDQdSfB2giOul+gTD
         UoaHRiBSBwYchhGxnMQK3tLO0dWtQgHMEuflC4MDb0iVYMut5ljV0E1YXUZk9fmrb7RI
         L9kOUC/P39XU7Xp1QjssbvdRvrPeBx2xSKV1Pu0yoSthmJFxwZ4o1OfY+vTo6gMcs+0t
         FCHk/9OP5WEzmPSwKfJdPQa4PrO+zpsxJiGF57DQxtewxz4Jqe5r078d0ugvioVlqwxA
         imSd8R4W186nFkj6Bi/7GeELGOHWa0qGJI6KLHHai/GszXv2McrNuRPlNKekQbJ5lati
         NE0Q==
X-Gm-Message-State: AOJu0Yx5+83+sltKemaKcdn3KmZKcGiEzWiOqDXuwubWZ9lur+GyONoA
	0t0mcRBFDv2ixOuOyn2FQ9r2o0LhU7zpVkwTg3VSpBxXfqHPRiGam0oMWfo0pRdpHhaTXo7KdlH
	GFdJloP9B8sHb+NKbAbnJXe/s0qF4wxpwOY5fUNh4Vh8sbs2EumGGOHzVDPu9kzO5tp78
X-Gm-Gg: AeBDiesw99ulbSeThP3hIvpZshGu5OBzAtmISf3FjTfWN7q7ArqFV81D3b89BK+AfLJ
	9dUpq0FHVlkk4Bx1vYgIDtmjc6a6qpCDjpZ03jmx8TRDMJ2Ka7Zw0Z9w2N/YMbcf9kaJ7iOJfPp
	CNah0tYpAUHzDzPE/h7PWXYmvCchbYms7RcM2q7jK1WhxiQgqYbOQ0tj0pHUzmgObfm3SFpKzC1
	2ybQt24N9/2m8wg9253tuV6li8lGtTZW2EjXLoqOCbSFUrU9PbR62spWYCIkq1o3ITp/4a49/0H
	YBJ6XoqABfpruYnUk1aUiyfrOw6LjdEYlEqa5ZHmCVdBEfe9XnS4SEy9hGCLHngUcXVDdBtF26B
	WQ8RaL8ah+Xl8B5Xo+IULtWFNQd3oA8tBzUzFrvFAmh/PPTnOyjPVt3XnQD43ygUvykS0
X-Received: by 2002:a17:902:ea11:b0:2b2:5840:808e with SMTP id d9443c01a7336-2b2d59b80cemr201175185ad.10.1776186520603;
        Tue, 14 Apr 2026 10:08:40 -0700 (PDT)
X-Received: by 2002:a17:902:ea11:b0:2b2:5840:808e with SMTP id d9443c01a7336-2b2d59b80cemr201174745ad.10.1776186520133;
        Tue, 14 Apr 2026 10:08:40 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:08:39 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:19 +0530
Subject: [PATCH v2 1/7] dt-bindings: spi: qcom,spi-qcom-qspi: Add
 qcom,qcs615-qspi compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-1-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=1601;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=U9SHP4bt1Fs2c7XTKSSf5Fe5zLYuiL+JABoTuDRifhk=;
 b=P0hUvMsZ3NPI9VdIzKxQg778jaa9grR8W2bES1sG4gXjHQUbxUd7Dv7wdl2IBr2NFmAglcMQf
 qpg1K/57otUDrrN44TLeWmGDwHcGEkUgO15ZEah/gVZne01zKNZKo/E
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfXz6DvNfmbUxl+
 yPaboZFjZeYPs30SHrLkA25S6Oy6TtjhrMZ5SEUkhC9NSAQCCftasAbgF4vbeBrf5NwErypFCxQ
 6NC+HLPubkLtEK/mU20zxmhCLlz7nCR3iaMunRKWiDbxwvvlK1i259F33mflm4/7WxXDYC4TvSX
 bpXCKMVkgRK4idlCjfgmZwnmrAreGKlBjwLHNR+4Ovm2BIB3tONumxglxtVkgxIaejK83tJcqzP
 XP1Ji0uwhDHoIXGt93jBPT2reSkydIsAsmfXg0xpbzAbxC+0MX6oQE3s6FuUjBFE+LPCH65/qTi
 hfXLZuLeogA76wl0fCZPLEeOM+JL58lMSXivbjacv76XFfYPsmzB50S4Ha4TMDZsQtueXQGjk4Q
 ZMurNmLjQ+751IJ6B6Mu6VWT3yqVdicGW6ETJ/HPwB8Y9HKixYXpAG392W7Bv1vNKyGKcQe/bzW
 nx/Jt53Y2kZqzANVEaw==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de7499 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kPckM-BePm1yi5if5TYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: V61wZWKypFo6T88xsoVAhjh0L7Iy2Sjy
X-Proofpoint-GUID: V61wZWKypFo6T88xsoVAhjh0L7Iy2Sjy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140160
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103183-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01D193FCE47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the QSPI controller on QCS615 SoC.

Move allOf section after required properties and add if:then constraint
to require minimum 2 interconnects for qcs615 variant.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 1696ac46a660..38b3408ae163 100644
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
@@ -67,6 +65,21 @@ required:
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
+      required:
+        - interconnects
+        - interconnect-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


