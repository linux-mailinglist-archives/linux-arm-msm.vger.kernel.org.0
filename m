Return-Path: <linux-arm-msm+bounces-118929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /CjsIOvCVWpFsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:02:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB31750FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:02:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XyadkByv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xe0A06pG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118929-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118929-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C64530177FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C9D1C84DC;
	Tue, 14 Jul 2026 05:01:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C35212564
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:01:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005290; cv=none; b=SN8ivzd5BITIgWdHSVRP6VVLXWWy4t85X7iSTOHN3qmpS5geoZC0pv1c3zXgl9q72zVhoN2VBHC5THi1DObiwmv0y48ptC68XTptCLdtpNW06yFErb5RC/kc3EqhLlAwesU14ONKGKRibqmtkuy5G3uPqVebeyd4Tlr+Wv9yIzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005290; c=relaxed/simple;
	bh=x7LdWwLo0cnnNjSUljN9XXvIzCWAYsE5+JIPg54yzQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ff/mabLWAOobWnUJxuLFgpJ2OgiaMv/D3ju7FWC3LzEOHvjjYpV4LPZVzXlk4CPeoVQItN8vlzT1Ejq9JypqKBezCQK9YWjolcuMKecEUvfpn5bjrosXDUb61pUdx1qRh4//fpezJMjhtbNxpLzRhlSBmvLOB1x+jaOoOyraqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyadkByv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xe0A06pG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E3feXC3367292
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f3zDj5t4nnjFf1RljgE9ae+K/Mz+sZ+dAu7FstVntxA=; b=XyadkByvVLCGWmE+
	Zc3hOkF0lnbv3F3Weqs0B7IqBtDyT7b5gOZo9BDXc8kbMe8RZlokDJhZrHkh2Q1r
	joyVA4ACBNCPqMgqcx+Nv3KVZWzyfUyMEtfg8QbceVahDddTMeuph7B5SN0Eh05F
	YQIiS/29Pz803k9SCvadKbUz8Zwh6Xg8Syzk2yeaWaOAUNTGTuktSsxmxBIBgrcV
	kPLQ6MWfGNvK2QfdoE/DzF+PUXdmfvYPXyLGOqT/mI5hsHwe2Cc+67CanjmeIpEg
	RtA+P8hzOH5v7D6yjdjXHSuVcRbhqlyRS70ZJIC7bWdZ2FRg+jSGUope632psuWj
	SdDxZg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde087tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:01:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so4562578a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005287; x=1784610087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3zDj5t4nnjFf1RljgE9ae+K/Mz+sZ+dAu7FstVntxA=;
        b=Xe0A06pGh+gOHTXgMtgjgC1oaqUoJ/LT1h+rybNVNKDWDO6fdXrAcq7ivXqL76NwgJ
         NZBu4CcX7tobXcQdPLQM9IUqbLC/SEjRUTOrhkrEDzOp2De0IJC9LqIRhBJyiPjXaC5h
         JWxzMXvnARXc8EzRqAR68axaiNzot5LyHLyXXQ1FVvAikmqgBqSuwU3/Woxp/ZfJX3kJ
         UOEqXQ0rNpAIXgfq/BFidociGeb167N/vSLjEJdnXRRGT2hBzIZbRQSU/MyPV9eFXvGO
         Mn6ic973cv95+IZwxwSZc/9DJYPBqeiyssKd1nAKN1exqw2C3n3EgdmDFazutx9317A3
         m97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005287; x=1784610087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3zDj5t4nnjFf1RljgE9ae+K/Mz+sZ+dAu7FstVntxA=;
        b=dhhVhSwbZvYQbUvqEGZDjZNHU/OpLs2ZLX/WortXbUghhPDkmplUe82AKW1DkQkXTf
         LPO30l0vFgthhFQ3TpX5p+5kbm9+1r9SkT0xah/yFfFwrTACS153GqO07gIY6AfwVnUw
         DyInZrnahstHDyq+YDn/8+Wp1cfQ5hWKbSunMEh45ZZm0JcedCaFKSnvr9R7Kcv0Gg3v
         5N7v/O8bVWhLYlXrhy0K2EKM+sKx5RZJP1gOFTT2yj39nvcAMBFrMuFDwIdrE2ujTLAN
         iSolGzu2iI+3zVZFoRZZg51Y+yCBoIJIsRacE8Qo2KBiH8bXxZgcpSiREo4kPjuA/OpU
         uPrQ==
X-Gm-Message-State: AOJu0Yw5ZfMnSooXomTwPjGS1iB14nKYeabFlk9RKFgaRzSLdlqfl0BJ
	0Qf3JQqK7oIftDquTs0qx4z2JsgOo9c+8tMtJI6qHAdCJ69EqpGq5NhjU5xrl09WaGPEtnfhfe2
	vLc47jAp5EizrAdEYoErK+V/GV9i8Gb2kKRIA7qOmgZ/aubjX6gvDT1tuD7eRJ9optm3XFSwLIB
	KO
X-Gm-Gg: AfdE7cmYwgneaEWX7faaWXXKZcxuDCabX7CeOWy1xH272qHCEdZ+ZnUs04wr4jUB9Cj
	48i7IiN8E2wmwVCAfJDIRLqrckyquj+e1XVmTQt3S5D/cx6T+jGgfxNHw5f8B+5cne05goAPM27
	Qy03cNp6cU8I8EYH/LHZ1zTwgsqG2tCDOAXa9At1ljYWJaE3SrAQ22xXtJngKYcMqWcaiTFMYHi
	rraGAopM2nTjB6fPLjbhCXqGkbbP5TCjYywRF9DcQxpf/8UBaShlTLMVImNeq4kl+tfefsd5NiC
	xoIpiIokOLf2RfXgRZgk9ZyQlEVyo1nq1PXJpYk2rEjCp0l7mMO9sIf6kvN1/Cn+ARC9WyN/lDI
	2xoQlyX82eiJLzkGBO7jjYeNURxfwWJoYnUj0EI6cS+ceC9U=
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:64cd:c45e with SMTP id adf61e73a8af0-3c35731bd15mr1026737637.4.1784005287232;
        Mon, 13 Jul 2026 22:01:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:64cd:c45e with SMTP id adf61e73a8af0-3c35731bd15mr1026688637.4.1784005286755;
        Mon, 13 Jul 2026 22:01:26 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm9327406a12.32.2026.07.13.22.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:01:26 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:30:22 +0530
Subject: [PATCH 1/2] dt-bindings: dma: qcom,bam-dma: Add optional qcom,vmid
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-qcom-bam-dma-vmid-ext-v1-1-cef87c57b7dc@oss.qualcomm.com>
References: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005277; l=2743;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=x7LdWwLo0cnnNjSUljN9XXvIzCWAYsE5+JIPg54yzQs=;
 b=MOrq10271hFCcD2c2QHE22b+uYCAGDpM3IuW4gFA/UK4wu2vcTXPqSkRTQ3cACXbFdhB2DtcV
 Rin2jnK8mTcAbcyQPlLiDDKYwK+qleXmlTw79bxOhiKsi0PALhvIMnL
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfXw4Zt9h2QqGaF
 Y0OUFI6wxc1v9fJ0GUhrCyIw4EOf1yrossjwcatE6UGZf4LAoI3TFA/8/9los3EUBq/HAjbUTTX
 woCmf3GdUQeq6uhgfS7hZt+oQ7LUdmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX3l/TfktGQNEv
 kCXdue/TEvXlhpwCz/vhWtUGEjnIbe1L7dGZj1xD2wJbazIxrsNaVEy9F5F2tCv/4s8enk5Q6sa
 sNuebTY27TQBYaXl7DRzQSdzCEkTByG/eFGcaX0INxusF3MabHIjWI5xbXn7ZI2fOhK7cNhcc3T
 R/sJS/IFQuZbJrHAWoDM6pT4kMjvrepDpm2a4fBaWF6oF+0E17aVxFj8WwyTCDVXWXGmJUJwQJ5
 fEwxHNRJDSjEuYpx3JvXhHZrCanFz4g48IK5pw6CrtFJmf/maHfpF8UwPnwrs8Hi7sB6/y6W2eO
 g/Lvp7xLiQSNuQ9xjmY2XYCUQoz74OYg7Y1pgUSwTlqQuqlSvyIe246IffOpaXu5VgBTsO33+Ag
 5fTZAdL7XHqAgpnpL57b2iS0Ysda/1NTrjwccg3u5fsFggaWfv8gbY1N1ZimtBA6rdXGOH3nVm6
 pLfBEi6OXSlLLVC3vcg==
X-Proofpoint-ORIG-GUID: XAXmu4dgbrfMsvdPOCtPkaY3gd4-9nsw
X-Proofpoint-GUID: XAXmu4dgbrfMsvdPOCtPkaY3gd4-9nsw
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a55c2a8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4-exsm1T3CILtrYoWyMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118929-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vishnu.santhosh@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CB31750FFE

A SoC can have multiple BAM DMA instances. Some of these BAMs are
powered by a remote processor that enforces XPU (eXternal Protection
Unit) access control and reads the per-channel descriptor FIFOs as an
AXI master under that remote processor's execution environment, so
their FIFOs must be accessible to the remote processor's VMID; other
BAM instances on the same SoC are not behind such a remote processor
and must not have this property set.

Add an optional qcom,vmid property listing the destination VMID(s)
that the affected BAM instance's descriptor FIFOs must be accessible
to. HLOS is always the source owner and must not be listed.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 0923fb189ada9ee435144e8490c64ecb81edc57d..d256340d3f32e81eaa8c1e275c2a99aac888aa90 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -12,6 +12,15 @@ maintainers:
 
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: qcom,shikra-bam-dma
+    then:
+      properties:
+        qcom,vmid: false
 
 properties:
   compatible:
@@ -29,6 +38,8 @@ properties:
           - enum:
               # SDM845, SM6115, SM8150, SM8250 and QCM2290
               - qcom,bam-v1.7.4
+              # Shikra
+              - qcom,shikra-bam-dma
           - const: qcom,bam-v1.7.0
 
   clocks:
@@ -81,6 +92,21 @@ properties:
       Indicates that the bam is powered up by a remote processor but must be
       initialized by the local processor.
 
+  qcom,vmid:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      Destination VMIDs of the remote processor(s) that read the per-channel
+      descriptor FIFOs as an AXI master. When present, the driver SCM-assigns
+      each FIFO to these VMIDs so the remote access does not trigger an XPU
+      violation. HLOS is always retained as the source owner and must not be
+      listed. Optional even when the qcom,shikra-bam-dma compatible is
+      present; not valid on any other compatible in this schema.
+
   reg:
     maxItems: 1
 

-- 
2.34.1


