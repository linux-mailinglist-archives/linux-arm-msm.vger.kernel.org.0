Return-Path: <linux-arm-msm+bounces-109402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFbzLcC1EGpDcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:00:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3095B9CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 494F430512A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0F337DAC8;
	Fri, 22 May 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILUUx7HY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzf4soem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710237DAAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479655; cv=none; b=F/KRivnL18r6OGvfvq8LSm8eDP85XzsVNM79TUNa46SziMqY2Wa2/uv4rzAy74k6d2TMuwPyrar49ugfSQIOMDAg2xGtUqwxBfSKQCWFUBKJaQekP/YpFMObhGrKkx9B4xAQvAeD44WSujIQXydF5RjDy1gfd6kzTTpqTqD+1yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479655; c=relaxed/simple;
	bh=adQeUYpX5mb5stJg0skrMeRG8iYvZNYvayR/mWNjRjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=as3qCT8rl8myUGfSV407aKQo8jXA8twtOr8FII6sByvac/17vZOLjZgiJdpKzjvs4x6srEH7Nm0yG9DqMEN0TA3nXwZ+/X6sChXEPeNKVbDpHmm8gpK7UhCEJRMP+XxEK6mgx7PMfW8aT9v4NzQ1lLF886P348+N0opSGDhVJiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILUUx7HY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzf4soem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIPI4D4009527
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LlJpGcXGOSf
	ETNR4FoSmOI+FiFVFxQkYddCmj1YZdyU=; b=ILUUx7HY4fqMY+5crtHIytpz6wF
	Ts1+DAia5UBbzZ5KoMLl/OyuiufARS78CL+LQ3ZFhQMHCiRe8U1mrgH9bxfVm5dk
	yD+3uPZ4zkFTDLRoM3kINyUMlEdz+ymwnNcBGuJ651pfaHqWMbHrwjskOTlk2vRd
	W8BnxG+HdHHMmv2wg6jkNgDwoOiIMFiVHPzEszHt/ag4vMPClvAWWzyWE/BJBvq2
	sAfeFjT2WtVFJ5QepB9AQBVZF11Zx1U3tS0Qyh4JIiiWkNsCvYjpgfjaTFpd0p0H
	PjR/6ooCnfMUKSQscgwk8OTFSArM2O7EtTqjUx13GjBPnbuqx9vMUPziXQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eavd988u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc763c7256so172118765ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479650; x=1780084450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlJpGcXGOSfETNR4FoSmOI+FiFVFxQkYddCmj1YZdyU=;
        b=dzf4soemBuEVkYFsK0EoYcxDACdhPPv+Fl17rhQTXuPl6ps48uLviKW1ir92gFXnnT
         KpVWVmkTC02h4691H8q4BfDXCrNriUFoLzZq4BVwm6o0Bth7+gI+4x2jBIFLqhYm08dR
         gaEQ9aFvk2dOxbHsqHbm0lewjG+gN+C+xEFqXEtksxIUxoDTYaGdxs38H90CQdWGqj5V
         bbZrK3wjYWGhr3u4+/6jWb0YHe/8dyc3XO2tuvdwX0ZL4ZPzaA4G4BaIG7TpeEiYwgtq
         cIF+auABELysHh/bg1iOe2aMHzpZDZR4ZZgzHntIcBVk88lReu8Y5gV9G9uhK5lo9fQc
         NsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479650; x=1780084450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlJpGcXGOSfETNR4FoSmOI+FiFVFxQkYddCmj1YZdyU=;
        b=GoSXokPCbCv+iWNlnQNokcEvfFV+jH4Yxbvvbat55F0OI2GJpYLse3nhetglT/77+u
         /VJ+S+YMFFM0H/hV5ltFtAovkU/q64sreoeEFRtnxmwek2+IWexgROAjsp49v3xl1mst
         65fy951UGIwq0XWdfCEfRlbc9+6LjP0K5hd9AinoUUq+KPVryFM9rzqU+k4mG2YIOhyK
         kCDNt2N4USqvo1ii37e1h5QGdU6NTsRvNmG/rtL4Zj279JtqWVd3N/slZvE0jfr/xNeZ
         dMnLyr5QmzfjycdWHdonI6tl1X9/ROQHkKAtxEvyW1Qx71SgYvekAVm1ZYEu+jZwQWeP
         mPqg==
X-Forwarded-Encrypted: i=1; AFNElJ/3WiG75fWKi7utS3uHhs2+5sI+RZep40CoqevQ90G9JoeJeCwL/+FbHlnyUogv84VLDxK28DM+TA9PfdfD@vger.kernel.org
X-Gm-Message-State: AOJu0YwpsfZ7Sk+2XuchdXj9Ovu52Z86onGtDC0NN5GGxZbDCM6RuKZw
	hu7/v49lOr5+M9L/+2V8Q9qw4fnyCRhSyFL68QRY645RbJVsVy1gK82RIwdNeBaqiNqheD0Ukq8
	tNQtM8mgOD20Pu+ZdXXYbiy/SgZ1dIhXnhZx7X/RSxxq7tK2PtOlK8KwAZ58zccZd3DZS
X-Gm-Gg: Acq92OFV4Bb8Dm6b0+bLsUCaFtZDaTj7e4sk2qzaNoDQLgFAQTKnn3eAVw8QBLRHpva
	UaK0cMnFit5GoAVts5qUYWK1nDTINY4F/pfs4tLutprL+YqN7OWOBQ9xEaZJmV+bsjwF82bcltD
	LCToSgDZXjRywsVbY+Cb/qcNrsp7qKQkou2sVlkO2Y9iW49fZhi+3gSfxRd5IFcPjC/kBXY5jSG
	aXcDyGEm6mg1P9gIFPiTBTESIcOWl7LZmtds23ya2tb+819xDMuKf9vLXRdH0gYBloXe4oiNsor
	KiwiWLeoSsdC0tdg73vi38Xi1V66q0MdJ0Vcg1+kaQyERZIk29OREwMlajhXxZU3jvDfjAqohyt
	ebesjWEuWwNjNAq8/4Qgk3uNzJ2NCSZsa8vsG1N5W9gzJ45sN
X-Received: by 2002:a17:903:f90:b0:2bc:dca9:f0ef with SMTP id d9443c01a7336-2beb0770a09mr57263115ad.36.1779479649984;
        Fri, 22 May 2026 12:54:09 -0700 (PDT)
X-Received: by 2002:a17:903:f90:b0:2bc:dca9:f0ef with SMTP id d9443c01a7336-2beb0770a09mr57262845ad.36.1779479649431;
        Fri, 22 May 2026 12:54:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 02/18] dt-bindings: sram: qcom,imem: Add minidump-sram pattern property
Date: Sat, 23 May 2026 01:19:53 +0530
Message-ID: <20260522195009.2961022-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX1Lfyh2vxXKAM
 RPfQ9f0k19Zr69j/0P0U4ZkazOfDhZ8I5/1/fhlLJ+n3Lavg0KAEfN23A+0NaKB8fF7ou4gMj6S
 F+PHhABRMe+5RmI02q3fT+7VHzmDWfvQHWO4BGwsPEQrFpBbW6XQ2tQal4tdZnOyb9mIBd6wLnS
 Nklnz2wqLSYfxKpRgPSArS3YIw0doVLq7zIQ/NGye8vb9CbO7lbJr7LFX+YwnxYf9DVEiMY+kbT
 1zg9yNUXi09J6BTkA0TMuJefi+DXrR0kGtSqXKKtuxrpMpoUm+n64Aa7t72437ftbAZ3NU3xYC6
 IoDPikXOC4Tu7tnp049s/eQqLULrQZhY9YJArX3eKcmnd9gmnwGK8Y5VdvLs99V7RroJJ700IAW
 ndAPP9xKqsINdc/0eNU67WMClganvjnwwfRzp+qK9uiTdneNujDnCxIiSjIJv/TJNOoMzZgJexq
 WVE7s6fd4jVQe5ypfDA==
X-Proofpoint-GUID: sabiyJX5hnUMw_yo71Y-yAaLjYkUef-f
X-Proofpoint-ORIG-GUID: sabiyJX5hnUMw_yo71Y-yAaLjYkUef-f
X-Authority-Analysis: v=2.4 cv=F+dnsKhN c=1 sm=1 tr=0 ts=6a10b462 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ljd-b6_uVLw3iGfjcQwA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109402-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F3095B9CFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a patternProperty for the minidump-sram child node to the qcom,imem
binding that describes a single word in always-on SRAM shared between
the kernel and boot firmware. Before DDR is initialized on the warm
reset following a crash, firmware reads this word to decide where to
deliver the minidump (USB or on-device storage).

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/sram/qcom,imem.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..17adced6d3a4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -67,6 +67,22 @@ properties:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
 
 patternProperties:
+  "^minidump-sram@[0-9a-f]+$":
+    type: object
+    description:
+      A word in always-on SRAM shared between the kernel and boot firmware.
+      Before DDR is initialised on the warm reset following a crash, firmware
+      reads this word to decide where to deliver the minidump (USB or storage).
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+    additionalProperties: false
+
   "^modem-tables@[0-9a-f]+$":
     type: object
     description:
-- 
2.53.0


