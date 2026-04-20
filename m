Return-Path: <linux-arm-msm+bounces-103659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG+0KkPC5WmnnwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:05:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521842701C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEA12300D859
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB84824503B;
	Mon, 20 Apr 2026 06:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTpCly8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLJ7YkV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189C377EDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665149; cv=none; b=Ayc2314HzvKagDWEbZbaC8684AIfRQlZCZ1hN+xSy/bGh5gLhggQ7yberfZYKUj2/Ufv/45wMjDk3Fd1Lw8+T9D/142L4G83egFkv8djZe04b+/+6PKHiukE5oBOhTJWJMLVO7YH0Fm4k608ofLajGl7JqvdvJ0vtHeKxg5dhA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665149; c=relaxed/simple;
	bh=WCxScN3+3shYk4oWiVR5D8bSSKIfAo+O5iQqzFaWARM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DSE+zixaX/guk/C1zp3atCPabBduDOMwxSOqQCTs+Vml71L3DywiCEtXLcIgHpUvy0SK5OwhzQLwVWXrhYMcioGiZrgKee2wScvbg9lWKAWhTNO0SixbzKGt15i2N9gCVUeIjnJ3DDK4UTnKMXVSa8P88ZJRjZRJxdinUg1rbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTpCly8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLJ7YkV6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JJWAr21908685
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9HAxgUkvpe6av4f5T+wXhFcc6rAIntcGOvB
	TaP37iQ4=; b=ZTpCly8I8olMwFYpbWA4Ppum+5ylOeWwAbG/kewaPNCxZD6k6ku
	pwcfwU2X7W75Mmx14rFigSfH4eNve4tDsYsLTQzeu3MDPOI+HogRPV1lTi+K4PTh
	garSuvT9PbZf/FvRWHU6WxakTqsXpY+IbZ1v3pyxrxskAVCMgUdSy9CdBviY/Zqg
	QGGz1oIuHVC2YIvOOg/KHiozFL/KdiKa/GgVyUeSe24K6MPS3wqhwMcVPSGQ8+uQ
	Odbp3Q/xaHXytJ++oIRoNvsqQiJXr2pz4sMG+bqsqbn04avYHKuWLJf7HsR/q/l6
	xJm7o70h2tJMIdvVwh8fjU5HrbczYGilgSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21umb5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:05:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2da19227bc1so4100292eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 23:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665146; x=1777269946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HAxgUkvpe6av4f5T+wXhFcc6rAIntcGOvBTaP37iQ4=;
        b=TLJ7YkV6nG7vwToQgBdMkG1EkzSVBFPu5b3NVfRm83c64yyXU/iPnvfV0g8uaCYXlb
         UtGDALUJ0jG9HRjCv4VSpCTYfBG43KBEZhxdML29NoejrcduOBgLkIe89VCgdYWHiFbF
         Ly/jWl9JPE81DuoCmkms2l0rn0krkxzJ0+vBvkdPGmSwrtxe+Mj3DJutcnrP7JhHbII4
         WzpqqQwdyi1YQB0t47l4l/jYTrxfX9Zs7rrB6OHLqG4VQeAghMylK9mFTH2lKnMKwP9b
         FTEi1VxtzIBJAyNDlxKohBbF8jzhubFDCvwQBPpNkL08V9RCiak+WJo/P8htW9CLdWQK
         Oo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665146; x=1777269946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HAxgUkvpe6av4f5T+wXhFcc6rAIntcGOvBTaP37iQ4=;
        b=J8YoW4NBT1AZdZpWxILmZkHi9ZwEeUHvJ/v4NKvXydo89HYrZowZO2QOX14IGAOVvS
         cUu1MvJ5veQCZlDwlJWrjFVgeDskcLF/fiE1/b1DOQnrpxdDabf0wo5c/j0l2d0spTpa
         yKf/SHlNpOsLg8bERPmS6NqmRBxNVJ8XE9xrgpHZ6J79DDUwh97gDG+KUDumbGh9gHg9
         TzR3coqvJTYmuHoL7Jd5knVl7O5vyYwXHbxbORYGlZe5uX9Ck/tpTIPPs4yIFFFzdNHT
         WhfLae2169v1DRkIkyCqEb5YJD6k+voEJIFKHQ6FR6QCs/nNjoQlEl4R8e/b7PePNVHX
         Fn2A==
X-Forwarded-Encrypted: i=1; AFNElJ8CSwNhFJiTnh/Rx1Pikp0c+WYDTr7jpPrRrtnE7EZIrD92R2bVJhyiGQYVzr/yRregFtiXm8ZThSCvZBQp@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9713qIQ9flG38zk17PS/9gH2Ivmfx/WGxMIpHhq5qUDyU6R2
	+cTuudzMe7t6iy//l806WQk0kYGH75XdNgPsUrv6B+bETk5exvBGvxzLhnWjo+lPQwGCKfhMKex
	3xzo1QSts+ZEbRiBsLJ+MNaE6DXE4OKuTf8CGqFENeWpfiq2j6jAbZvfO1RAe0XrrNZOg
X-Gm-Gg: AeBDies6PKw/RA41xuaomXz2bhWFUuPy50cBGfSfKHSDBfBvvaPZMsPXx4sb5p6oc9o
	jCxPdCgNhoFEdbisuIGSWjpmhkiyaUXGVZ+Vph2s90pIz0wbtjG456lth0aulcS+OKFqaJ2I0f8
	7t8lHi3sMWP8SKQ6pcNCmr9/Y18QmY7bJI97dQowYPa6hYjGI6EKadaGE2j+u83fniHdTB7FVtI
	ME4otpcrWnQT0zpkK/XsQ1uDtK5amiVhZ4uFjN6T2oZcH+GjFZxCyrGNwx8D3POCocXppLYJEnE
	j1Z73dBNoo/OOsxzE1IzCHFKqN0a8HV2ywYQrv4KnP7glWCQOH4t5AqeTpokzw7O4OR3lGNH1Er
	tDe7YFyaTCSG63aWGciytcVEXTkZg0dTGNOuj6u8wrofMlboBM8aoCYB4hHeXbvxFkbRFFr10ti
	og4AFpYahMtoFGziZP
X-Received: by 2002:a05:7300:bc97:b0:2c5:220c:5673 with SMTP id 5a478bee46e88-2e4647d0397mr6385056eec.5.1776665146086;
        Sun, 19 Apr 2026 23:05:46 -0700 (PDT)
X-Received: by 2002:a05:7300:bc97:b0:2c5:220c:5673 with SMTP id 5a478bee46e88-2e4647d0397mr6385035eec.5.1776665145585;
        Sun, 19 Apr 2026 23:05:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm13430382eec.18.2026.04.19.23.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:05:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: serial: Add compatible for Qualcomm Nord SoC
Date: Mon, 20 Apr 2026 14:05:24 +0800
Message-ID: <20260420060524.1248432-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1NyBTYWx0ZWRfX5FjZ0Pruf12r
 KpY0gnDF7h7zuq1jyRPuNfZjAlz/68xRJ3mUf3naL83MUCEX2ErSuNGm/VvTChs2zSVixF31xul
 XFGHicEUBmWysTcr4Gfj1Kq8Tyllm95eCt6HUANzqKL4sai6bOYYPaiCi8cTulvX6F6REuMzDp6
 20wpIm7r9h7B3ptE0udndVXvM+5Gxx0PNoo9jkasMtUa84UQcBHmmsGDXYpeO3PJ9jyDZU0OtQ3
 SXW9Nt66CC8WeFU1gfj3LD5RzNir+OE4VzdablfDv3DUYjVgl/Hg2t9xu1rpPLNuGvmD8Io8nal
 K2mwanmAMwJ2Eu9VwMd39mTwPIlPC9i1jQAdcCc+Q68VqXi0Y64tAzVdKKNAHcfi8CmergUYYyh
 S6SMU07vR2jAHbySkfpzd9MUTlVxhasEP9PK5vl+kQzC+WVPpyJi7EkmiubeOs4PbpKJJ2yI6xH
 /bphAjjYI7ko9Y12JaQ==
X-Proofpoint-GUID: bhjQUYd_Jx4xTsGWSokLc8tFQ8jYS4Nm
X-Proofpoint-ORIG-GUID: bhjQUYd_Jx4xTsGWSokLc8tFQ8jYS4Nm
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e5c23b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=oH9XnFzfs7V-9WSmyQkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200057
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103659-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5521842701C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document compatibles for QUP GENI UART controller on Nord SoC with
fallback on SA8255P compatibles.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/serial/qcom,sa8255p-geni-uart.yaml     | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
index c8f01923cb25..55e73b359f04 100644
--- a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -14,9 +14,16 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8255p-geni-uart
-      - qcom,sa8255p-geni-debug-uart
+    oneOf:
+      - enum:
+          - qcom,sa8255p-geni-uart
+          - qcom,sa8255p-geni-debug-uart
+      - items:
+          - const: qcom,nord-auto-geni-uart
+          - const: qcom,sa8255p-geni-uart
+      - items:
+          - const: qcom,nord-auto-geni-debug-uart
+          - const: qcom,sa8255p-geni-debug-uart
 
   reg:
     maxItems: 1
-- 
2.43.0


