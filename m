Return-Path: <linux-arm-msm+bounces-97451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAozAK3+s2mWewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:10:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A0282BE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DA8D322E069
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58E12C0F6F;
	Fri, 13 Mar 2026 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZTuO7kW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkavTjLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE5434D3BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403732; cv=none; b=aE1hRGFY5h4r4BsBvJpj5poSdEDPo0kDzZc5tlq967nA3ZjtbmrFbE6AIPulkaTS3XwV4Yr2bCJryXLp0ZbnGeYzCKPIFpxYAx/j1gf7ovNz6wWV4FmvNF8UEdrlWSyMnHn4mL43bePcQEYzLzMe8izbqZL+nl8nhQqQfjM6HiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403732; c=relaxed/simple;
	bh=RxCkCzWzRKgloai2lEz648vC7PbTJ2nKZf3T4gJuv4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kbFmYLZwb07RpjA4ntZ+0uD/KBn76JvI6nj1RyjhPLssE/FPK09XoVUp1OIj1N+LJv0LyPxW1p0DZle4/2nS1QoORnbzNOjD2czUOby9yeRAdAviqlw0vJTtgiTUzlHprZ8sPCqcY2sjHCfqHySWf/CiissvBnztU1q9JJTMWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZTuO7kW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkavTjLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B4tU3906296
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ppInlw+PpBT
	aE16b9MZfivnywOUUI3oPkZlM/KnSAN0=; b=RZTuO7kWH3LiHb8Q7BQ4dnKdIyM
	GfGwzPi6+c/Rt2hfcU0RqfFn1V+nh/dlnC98O0FV/Ejc2OE8rUdouff51jqRzU/0
	KD8kzpJrgPeswp7jy4/wuUW7n8wdvO9zmELO5aFYAPN8X4tyIS4bv9briinNRK7S
	PZoXHUBM3B0hvjCTu3MwnJmL+giWZOf68PdFgk5lhKzNnRQqaRbvbQZniddbqXm6
	EXazBDK7lfQwJqK8zFvFT9SlX4HWaK5jAtIHVsy/3xltTm2p5Eo9qWp+qP3DJE8b
	yn4Y0r0Qbmi8zGxqtZsWA2Y2W8sYymV0Yr7H9fnZuZSH4PFphhv4h4mKSCg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8j3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:08:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0ee0fed2so1646989a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403729; x=1774008529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppInlw+PpBTaE16b9MZfivnywOUUI3oPkZlM/KnSAN0=;
        b=XkavTjLpXZGEL3FP+ttG4VQ/TNCWEOpecmQK/WgNlgNimTLHsLSQjR+UUNYHSlAavm
         RAwXjDoCR7QFvzNTG5/IFrOJgGOFMR4NTehC/h6iBVylrqgRct3ObtTlnFCha82u+MFr
         2kia7ODalJ8Rxf4cq/TJbVCfgNAftmuAlgbU2mvuaxk+dW+oYEBlBzV3VhjR42JDSTHL
         7I1nSkiG84S57dfwU2YSUXffgQh+ccwq6iY+5WbCWn1Lr31BMYmAAvteQTgd7LVDmpoX
         i0IBL1EZIUZw/J6oNMHgybFf/RkjaNbeirD3Tf6g1A1hgEbBfs9cwcTTfe7pjGFa0Fqs
         +UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403729; x=1774008529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ppInlw+PpBTaE16b9MZfivnywOUUI3oPkZlM/KnSAN0=;
        b=tQdy8vKqzGSycfyIhyXDdMAidjYmX66tGlVtiIt0L9L0o6AykvpQOyY8RiUf9wWJmB
         T2Na3LhUjpz/uJi9VKo0wR8LFJluqT9MWLCUDsu4d0h+s13+3owd607h1o7ulkib3sWt
         f3VsblsvRbsQISSI4tCORYHsX/o/iuKDA/RZDvCiBGrTWfSc9sVc47tOg04z0VdCTdKX
         bAyI4ALEGpoU1zD+vqUwDBymgsUhM0F6rlZ2toTaTnXNwNHviKgmr+p4fSYI8UvZfHxC
         sr7aeGFD3wKOcSvnVO2TxsU2usbPSEDn5vYF+L5WE2FkX/g0QtYGWgmV9Q5JkO03NZjh
         YtRw==
X-Forwarded-Encrypted: i=1; AJvYcCWZSIjQKrKc1chsIJlLURtQ7krmqYx78VdzyaDzvAKxuUTZUik4fgfMTMu43rn3hKJEjiuaCmXjXPh+HfHs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cEeGtDpU5Dy5agIr0ayFCmtRBub52FsAtOJ752UxqahBy8cS
	FujANxSnKB0oDpdn8iDjkIpd8V3aHq4/xB/B3vrXtKC+G8hmNNOy2R1RUUSsBjQutQDF9lb0wr/
	IXoSWJ41agS7+n4YMMnfWP52sxEtTNRoNTVJzkW9oJb9ysdZB8L4FmhQXsmIQskdtdzQJ
X-Gm-Gg: ATEYQzzyqjcD3ZkMCOGNz4DIi/fp11QgnI7L8TLDMrkBrDsNz0d4tiDfaafdXYYWfhK
	R2lMGnI3ovVkO3/M5+3f49mtQzP3a9ACEnDQ2D+7+NTjoeVT81Q4xe809sjJu3KeWsJLpQzdtJM
	Lj6JXpjh/JTQysj8BzhPyq46G0oUH1xEYj9k10DxY/c4jVH3Skfr8LYGjQ1vgV2fdoGSxDmTZs4
	BokZ2HtILrkja8Mg1JFvcU8MavA0rmxyzBiLZDc1FtJ0Ab3HWm8eQaOkKAkfolxEz4BQDNeuvJe
	Rge3OsBrkMYFxQxdabdcH7LkI+XDQQaQCAhY33dktu5lkWAftODI3hB78/NWAwIFtpg+bsSbRG7
	upOv/My1VHUo7WyrYZA8HFBsrS2rzjSdWQVCDu9bLza7/E/P1Gdm5X/AkZkQOSdXF5PqcmalVbq
	MxgGzeIUgMw18GCVJXQuL2+bV7LzwvI+lp2nUb
X-Received: by 2002:a17:90b:1c08:b0:359:8c01:66f with SMTP id 98e67ed59e1d1-35a2205880bmr2758120a91.28.1773403729306;
        Fri, 13 Mar 2026 05:08:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:359:8c01:66f with SMTP id 98e67ed59e1d1-35a2205880bmr2758095a91.28.1773403728845;
        Fri, 13 Mar 2026 05:08:48 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:08:48 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V5 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
Date: Fri, 13 Mar 2026 17:38:11 +0530
Message-Id: <20260313120814.1312410-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F2kVNQZB-d1jmuH2f-4mum7zo_GRVqPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfXy/s42CoNZgjV
 srokINJBr97rq1NbvRVEP+tk1rkGRGua5bgcCaZ571cabCmIIaEzBQzJoMpiOYHjkvoatlQwz5J
 /xWpPXIof7LLwLMZYo+gKPPSmUG/yySlzgVTACIn6t1RUnAIt6g4/xL0MsAmDMIQMun9bAbkpMw
 clf/OI0gUDvX5UvBioRl5QhKVJ+o3MpFRMUmwuqKZHBm+0JUAqf2sivjl1iRL0H+1HczGdbFn21
 aNc+7zqBznGF0P7wzknADAc29cwkxxw6MaNV3+u5iY60piY81uEqThIGZGNvN53I95joL8XKPgv
 Dap5asQ+PTa2mAJ/O8QkZGA8F3J2z39seUWh0z8lMXDK2Tslvo0QAsORj1qauOHUAKNdBYgXRRE
 79Ntp8Fj7XuxGtKnJdgZxsmGqvD/K/tvdzeU540deKpzTL604dA9pnjPP26ZWe0Xpvst7t/36Ga
 feLdxCUiklTYhDeKuBg==
X-Proofpoint-GUID: F2kVNQZB-d1jmuH2f-4mum7zo_GRVqPc
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b3fe52 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BVTLK7zpd-CcKl8eL14A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97451-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D6A0282BE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible for Qualcomm Glymur CDSP PAS which is compatible
with SM8550 SoC except for the one additional interrupt ("shutdown-ack").
Similar to the Qualcomm Kaanapali SoC, "global_sync_mem" is not managed
by the kernel so it remains unlisted.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fb6e0b4f54e8..6a29d239ef41 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,7 @@ properties:
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1


