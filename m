Return-Path: <linux-arm-msm+bounces-117246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tvj8Cv/RTGr+qAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:16:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE1571A30B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:16:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eqBJYI1/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dhZJuvFV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117246-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117246-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F0D530D9778
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD6D3D525F;
	Tue,  7 Jul 2026 10:13:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489C3DA7F8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:13:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419188; cv=none; b=AOqrQ3Cww0zI9L0EyH5zecH/Ee+iUqoBK7MQ0du+/oOVqcw5Lv0T5b1yuskDKqMgqLheQJlsu4/LH/IBN28tgOaRmrhK5LaHgx8thFDtAbONc9YuUwqCoQBo8pwgZuHTtETeNonyA8BucREmmg9V0AUG/jQtAS2taLTml0eV+Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419188; c=relaxed/simple;
	bh=XAaZjca2fmlAx5K51J4QGeh1A6Gyi9hGgsyhtd4bEHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sd225BkSHhvr/vNHfXsaQ5q3ym6cpULl5OjJl6EvdfMNAM8vREzotO+i0hjVABLODW1wIUHs7WQALcaoCcBEURoL39AzZjVXYBL1plAQj9Dj5HCAabl1zCWm596vqdO68bOoX9WXEdk6ADTlDVyX7QPVdV720sSSAHqebbAWQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqBJYI1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhZJuvFV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EBQM3231397
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLODp9Ss27lWrpiuizONL+dwsUM+NkFWEaoxkD/1XA0=; b=eqBJYI1/+GAG0VJp
	QIF0gsUKs2iZBIvG9/RNzrqHxQTdQh+M+z0gGzIKAyoBcc9MJfniYCzK2UwpL4rC
	Cg20HLQI2ziw4xdKQOfJud1zdBxAfSZ1ZNEfhJN2TN6Fp1RsF+1Vz+EZ6yGc+fuS
	DFxw11aOOmjufUnCvzb8ZFyGBm8SenwK32Qg2nh+YuhFXF8FUOIdmqB3jO6+2azQ
	hVtNU+NHC9DKq6v4fAmKal8YfZ19hUQ2ZYBuNAfUFSt43GtWnc+ourK7O8fU1d8Z
	Z1w0HzJDLAdzuYEOCP8WlZtecqFTjndhZFvbCHQ07JeXjE+mLO4ICMUJ3L23t4OG
	upjGAA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79wdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:13:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso3019392a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419184; x=1784023984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLODp9Ss27lWrpiuizONL+dwsUM+NkFWEaoxkD/1XA0=;
        b=dhZJuvFVjf2ekXRsG0C95pCDZiU4BPaFCh6qQvfDvqLBBWuEnx/KMRXX88NIdlZGOb
         aHBhxSVtUFQCO4i+0jbZhFA1+IsSlGpUPWW7l8YO7SsXpS6c2PC+znv9oVD4kmMlDuUU
         MdZkRa09K7eggzRFqBavw6iahHdzq9LbOpN+px1Ivp3qW+rhhU8Vr0WGVdahlh3qjzlk
         o26hQRVJdGsrhZSdxfqB3h6I5MT7mh6F45D8UiKROcGPxQdT3+njdKAeqXOy7Vsh7V0A
         WvlDEjJH/LyJ/hU0MzA/t3SUriXg/rEqRx+HEDEkScnjPDu5QTOOkdzY5skAc7ET/HPi
         y5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419184; x=1784023984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLODp9Ss27lWrpiuizONL+dwsUM+NkFWEaoxkD/1XA0=;
        b=KWnS6yDpKdoEYi29lzeybHF+hqUqzj9+E6rKeo6VT1ctJ31gVQxsNxcRHgpAoRnWKq
         ZntJZ8bkbLgD38PWK4DuGN3GlgJtP9Qn9i5Cxz06x6Gt054CmfKtPk6l+hvM6B/boOHZ
         iPgHHMx2gOVvfKSq9m7UaVPvDdsq2XnZbFqhSwYFKj4Un8a0V6XnGVrKdh2Zthx6rrv3
         oaNAlFZIYuChGZHo1Qv1sjK59SxL+E9xHoRe3Xf02PsTB6N4e4nrTJQcsAaU/atsEZTr
         nh8mkELbiS9QBp7gbTOGp4FtH5Osd7oCOnsY2aMiO7TAr+HUyxEoawtygcPnsxl0BZTT
         P5mQ==
X-Gm-Message-State: AOJu0YyCTiQttu7VnpLrze8rankXcbmvHtSd0fi3GC8pcgnSR44p/xM7
	w0sEfzIxREraz2b5Aoo8E8oFiEx0pZVJ4i9XE4DUrS7bck4yXpXRJP9yaXTazx4VfC+jBod3jcy
	Wh9YoJzn6pinlHUWfAm16mJQCtW5kL1rHIsMXnt8EM5Y91HDvJYhRBCAF9J7g1PAcW9fn
X-Gm-Gg: AfdE7clYc146H7P5AUG6kXR1MlUE2VrQJ8DjDtJtWHVR3EP6Y4wTMLyUggMFfDJjZ7t
	F9vkcu0IvDP0QPMHB+bKFxsN6x/9wIVUqZlpwI73dTzpEqrioVOYGhRG34aSESJSGpEm9OhSKYC
	R9++A4vhwQh8+iYTpVnXd261QpacgYOAM9uJE5+7pSZplSX0uGS+muEHj5IOFXBO/i7tBvalzvy
	/eURBcAqAWNUnG1Mbz6lqjFVLvOQgthh9WD2fSsuO+lo1V5eNX30ZrkYJ5zgBKaJifcxE7AUrHQ
	tBc/E37a11UJEvb2wQoR7/v94v9Sa+65s75sP3DKBqQ4M90OieTpasPcj0y3zkJcwlvyv0kskJ7
	uaWsXfnD5ILX4VZSSbwles1f0gYG9/uOnmyVaj7JCdSe3NDtHVXMNq/h2O7kX
X-Received: by 2002:a05:6a20:c783:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c08eef114emr5294441637.48.1783419183666;
        Tue, 07 Jul 2026 03:13:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:c783:b0:3bf:a1e5:ff53 with SMTP id adf61e73a8af0-3c08eef114emr5294404637.48.1783419183112;
        Tue, 07 Jul 2026 03:13:03 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7098929c88.10.2026.07.07.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:13:02 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:12:44 -0700
Subject: [PATCH v5 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 trigger shmbridge creation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-glymur-soccp-v5-1-053993f0c6fe@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783419181; l=3019;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=XAaZjca2fmlAx5K51J4QGeh1A6Gyi9hGgsyhtd4bEHo=;
 b=McTIKKEfa7Ct2DLCMx2QpAg9jJP8bF0xs3Ed/NHHhsNQ91szfAvj0Y028BQspzvb6zI9cRueI
 1Z0zcD6vUaxDvR2VsMu8bYvhP4Z+iiIyOXWi62+kbZ65NsZh5z2Gniy
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-ORIG-GUID: NU8dzBpnKRGv_eesHWefXpehZdcG8h7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXwrC5GqxSdP7e
 dZNrwUWswx1ZRxxaQTV11UnvkCjzXnj24bc6jt8RwmVwg5wMfuVqvSfvfXJoLrKK2kxlRufbWex
 J7rT0P2vxDll0h2dp7XyOojFurhpo030OXDVksfTUb6qlMO5qCmyXHOd1aM3I1+wNcGe/vp+r5o
 2V8PY/I9GekXos5Ykib8Bxk9mUn0mPTpKWFivyMeSNcaWEvcLUOrgxxtSxylsvXaz3qLr5VMGFX
 xBOpE4iNCnJk9RSewzvj1QfWPvKlPGndcWMOVnF8ppcc2aVnbyS0B5d8tjy65nSZ0HddNbWoOYn
 7LYG0EzokeVHiaapN1u0Zn1UbpW07s/8ZeWFC64GKorD95O3ojF+af88BNsDWJFUEqoCoaCfRLF
 JQrTXW0rmcL1MYxCAFbaA8Gh3nYn3ApLYW1NnJlsl/UKTJLEeEop4KxdBSfJAX3WGbKqFRijm0l
 z5f/Qmkgbt1RZn25/Tw==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cd130 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7RXNGxq-AdoGDOOEiD4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXzN6pN7Wfhd6K
 0RGDXLYlBqoqrsIreQyrv16vfsIod/3LN+nZ37JVDklQsG5ddIGNXq+IWvI6vNXasdx4rcTjGRA
 8Qa46+Haa+E6lnZEXCcsseXKKAgNhwA=
X-Proofpoint-GUID: NU8dzBpnKRGv_eesHWefXpehZdcG8h7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117246-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CE1571A30B

SHM bridge creation is required to enable memory protection for both
remoteproc metadata and its memory region on Qualcomm SoCs running
non-Gunyah based Hypervisors. We currently rely on the iommu property
being present in the remoteproc nodes to detect this.

However, this doesn't cover for cases where the remoteproc does a late
attach, like SoCCP, and for remoteprocs like OOBM SS (Out of Band
Management Sub-system) that doesn't have an iommu in front of it. In the
former case, any attempt to create new mappings would fail with EEXIST
as they are already setup by the bootloader when the SoCCP is brought
out of reset, and unmapping them to create fresh mappings leads to faults
since SoCCP could have active transactions on the bus. In the latter case,
absence of iommu will be caught by the has_iommu flag, and SHM bridge
creation will be skipped.

Fix this by introducing a needs_tzmem flag which would cover for the
above edge cases by serving as an alternate trigger to the PAS helpers
to ensure that SHM bridge is established.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 60a4337d9e51..cd7273fbcf98 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -61,6 +61,7 @@ struct qcom_pas_data {
 	bool region_assign_shared;
 	int region_assign_vmid;
 	bool early_boot;
+	bool needs_tzmem;
 };
 
 struct qcom_pas {
@@ -914,8 +915,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto remove_ssr_sysmon;
 	}
 
-	pas->pas_ctx->use_tzmem = rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
@@ -1657,8 +1658,27 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },

-- 
2.43.0


