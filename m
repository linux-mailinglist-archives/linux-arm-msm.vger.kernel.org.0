Return-Path: <linux-arm-msm+bounces-116310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bRRgOx+sR2ozdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:33:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF1E70263E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:33:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ENmWm7Vk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MCX+1HBW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116310-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116310-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83E44302AD83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C240320D4FC;
	Fri,  3 Jul 2026 12:31:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484F3D349F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:31:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081903; cv=none; b=UvKDrJWcdzhupeZlOwV3fiRu5BNe5q9y7EWQ5FTyCzZ15fEVS/Pn6fM680agJgjUbjpTnQWKEf/cdM2GwiDtwi/DTqRH1JSSkjHY90CN4D4y1rj+mCwUxbv3BkulnaleR24xtHN1ko4b/807Cq3dCVWUlv++cA1S3zkh4l7uLC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081903; c=relaxed/simple;
	bh=ZeKYCoDs7FPwodBAJHK0//8K6Py72kGbK24x4nRRC00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OLwdt9adBomeVkgkSmAW/wooV1eDywJLXKecxwLUN/ZBNV/5vFXVBmH6gIc42hAIGDj/Xe3SK9yeeL03OhFiehY3xE91udb0T5qXvq6BIdakHZahA0nvQpbtKjZfBanQ/N9KqYjDxwM9Os7MeSfBujwPnDi7WBwtvvMyR8HV5rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENmWm7Vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCX+1HBW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BMli33136095
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Int6oWj8UX764nnXTADyID3XduYL5Y2+vFpSE3Ej/VM=; b=ENmWm7VkIFs/dTtF
	1LK+pM7Hpk+apaR2+vwUbAW/3br72lgYEtXabTLoH7CmHBnjO+Mf9jv9wBH1oZle
	vPTnfZbCJxv068IbtSqMtad0NswznXbtMx4c+55Hcpte8VcJyqAb1B99K7p5t5Im
	qJ/yDTfSYrmR3xeiskgG9QrUK8iwSoWR2FP+a3pCnlv9m9lgjfAHCuOLWIXhojg0
	m1QALgEdAb+qjyUYbStppR1+emxKOCq8ER5OgXyitjwWwlNhZI5zPsBlWkuTSrV7
	fWQIzKWIGtlJdtKbIbba+nezNq+DF+JZ8AvwGAt4R+Z1jgPJddDxMf0Sjpeci6AT
	ajbpzQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5ab29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:31:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380969f6d97so807488a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081899; x=1783686699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Int6oWj8UX764nnXTADyID3XduYL5Y2+vFpSE3Ej/VM=;
        b=MCX+1HBWXeXxN2FNgJB4bHumgwVK1B2qtgCIaRg5mc1hevAgQ8QPwE5/Xufzdr+amk
         RK2YudaD9GruL48FVoXTQsDFPljw4VlheQhjEyt+7c8lTpmkNHcLJy0Cm6eYuyUDEckc
         nOeHl4WTbh/7Pepthmf3zlNJNdEwHgNWPzVdfuOqUhHb1bjGZZN7cJB+F33l1UdnERuq
         /ABw60w7B1bSiG0GcTg5xoOG25GnnlK4+A3tZpcXxKg0LVcDgIpjEvXj7/A99HAmQdpY
         CN7tmw6634v8xCKwuPNU72CWb+XsgWiEMNPvY4fw+peHM22gYRjOKd8LNYSz4fj5mEXU
         xHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081899; x=1783686699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Int6oWj8UX764nnXTADyID3XduYL5Y2+vFpSE3Ej/VM=;
        b=rnh69uZ7eLcByfd4EbqAFn+/Z/GDU+XRdgZTEF4LutBPpSBktstd2Z3FHZfxlFqqbx
         TkHNr2seU7klS751mQ/XOGMp/E4EhUvxxkyXi5HbSF1v/g8UsXq5iDzckxwHZ/SrGz9B
         TsQerQxwHxAv6svlwXPf1K0p8uE+UA0GxQdWFXti4nWdoJiHR0+MazZCU7SY3vlpnrsT
         Ga8EIA+5IwR6/GUEEFKk0RslAQnzM6E0mZjyGNEVYDgXggLLgTrLfdSSrIbvkqspm0qU
         KuyI4BJvuacADswRKugJZhS+2h5QS7QCe432rWWWxEpjt+fsvOp3OAjt0TvLQRECWZuM
         N3HA==
X-Gm-Message-State: AOJu0YxCnA6U+YxIGPj9Bk3IjCDXF6OGzb8imfa/t8zRG9cX5PwpkqKp
	zrDXcWn3ozZ8C+WIDReaRY7G6z06MUcYTduHc7RfLzNqOUVmfuveVBSWHNhMLwK9b6ABaj1zglb
	CKrkzPJUaLIugDDRf5J2fpQjpYA4LhCVaENHEWqlfVHXrsghU3SbPRMsCKQtPz4BF1e9S
X-Gm-Gg: AfdE7cns35T1GMhY5TFbT7xyKT+wi9G5CoXIGonXypfIAaEIMdgZnR4m33gcxH0cTj0
	v8iuO3ch6sjPP9xlIrCRAd9KIw/hdhHvv0mvl3ySXEJkpTHPAFqkULrlYAVucZ6t9TFCN3P4fEk
	XOxhvZxzUTiI+L8UtdeVOQXeqQBk6IC/TMwxUI4/SGCf6CdIxYP+iMSiplTDzBDfeFxiTzDaYfO
	eYz4Fb61fC91AtddxF1ooVThqWHLVmfGubRru7tUP1nFbKSndUUKnCg7Uk7QMpwT9t4fH1v2+ij
	kLUXusXgaFSVH5f4ynK4hnog2YBG/ku7ch04a4GMutbbuqwFtJRJht3KyIt9OHGsz0ksGuhjEBQ
	Bn+GESV9mbtIVV5abjyG0ybQik9As3Y6nLN25DXJihQtFy5RiO6CgLFMpDz/L
X-Received: by 2002:a17:90a:c10e:b0:37d:9874:9363 with SMTP id 98e67ed59e1d1-380aa07e089mr10813268a91.2.1783081898490;
        Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
X-Received: by 2002:a17:90a:c10e:b0:37d:9874:9363 with SMTP id 98e67ed59e1d1-380aa07e089mr10813208a91.2.1783081897853;
        Fri, 03 Jul 2026 05:31:37 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:37 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 05:31:11 -0700
Subject: [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 force shmbridge creation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
In-Reply-To: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=2712;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=ZeKYCoDs7FPwodBAJHK0//8K6Py72kGbK24x4nRRC00=;
 b=FdpZHcPYOUQtw/HeSpZ5f5sH6IU73Ruw9Hq6hC8pDAVpwVE4ByVEAtSkxBCNCnAssv1pM41Al
 YlvBaI8QifDALggqzjJOJbLD0TecxbCInOYtn/ucp/AVX2GVImBHVTN
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfXy9oPqk8O4qDy
 orNMiCmmdBUoOM1WmDs/BJWaFaIp297h1KpbFe47AKyM385o6pfiTxLCBqrotduSon+DPW4lckD
 +JtdtJ1/+ktlZojZxSiQe9mceVbEFh8=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47abab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TBRyIjXBjLUW-Ng_AUEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: IEHF75F3gYTwdKIeISHTFmqCwiG_VPMU
X-Proofpoint-GUID: IEHF75F3gYTwdKIeISHTFmqCwiG_VPMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX7L0IAId7iGuy
 Q1QZbk6g99CihKD9gmPGOBsq+dthx4CQ2g9hLu6qAlLiYAZwR1RpcjODRkEI0luPQTU/CXoX+c/
 itgaT59U3FkksF82pjaV3/cc+5WlMX7qInqo2kZ1PBYqX9gZ/n+HIS+jYRH3f9khhVL4EH6ebmY
 8epvvzhW7d2oVhPax26iPheVLUnTHfgdW+yTSxXbxiz7iWpf2xRahUe9RPSPn5bCH6j0X4jN3JR
 S9BPkPKaz0PkdKajT9EUSq4ZCpxonZ++vli9ik4cXgkxikidY+ga7XRgf4f8Uqg6pgquqa8m9KV
 fpxTr7my/4P4+Zqu9Tk0v2KgOoXax36V6P1V38k90eG5ip5rN92g5/Rqpq7Zik1+mcA71NxPANb
 2IZV2cceswv5MoWRCDFm/4vVAVlMmR+AFTFGmy2JQAxVnEl/s5RcRJmE96Y1z576NW7R8Z6/41i
 7D5ALWwYVbwejaNhKxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116310-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 9BF1E70263E

Most Qualcomm platforms feature Gunyah hypervisor, which typically
handles Stage 2 IOMMU configuration. Additionally, SHM bridge setup
is required to enable memory protection for both remoteproc metadata
and its memory regions. When the aforementioned hypervisor is absent,
the operating system must perform these configurations instead. We've
been relying on the iommu property being present for this, but for
remoteprocs that are already running like SoCCP the mappings are already
in place, and any attempt to recreate them while active would lead to smmu
faults and a non-functional remoteproc. Fix this by adding a needs_tzmem
flag which ensures tzmem and SHM bridge setup is performed independent to
the iommu property being present.

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


