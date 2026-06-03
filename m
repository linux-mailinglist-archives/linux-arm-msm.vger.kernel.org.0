Return-Path: <linux-arm-msm+bounces-110940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJVXD20QIGpevQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:30:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DCB637129
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:30:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=De3SH1YN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dwaIVII9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110940-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110940-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 057B9305B549
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4803644DB64;
	Wed,  3 Jun 2026 11:26:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6F45BD6B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:26:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485985; cv=none; b=a+UPcVs+UnbHNuPdoXCzJ0Dpc83T7M5di9h3iWvwFU4rShh7s3ioXRur+NJcbM9Q+SfARAWC6zUYqIhsLcBOdMfNK+tu6FClihh8M7QY9+gIdJG7l5No3SskOeVxHLqONxdUS9e17zMt6QrSSPR7hcpFAzjQBupb9yqTD8pA8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485985; c=relaxed/simple;
	bh=1dObgRDzgUT8dRxMLMRa/R9TRzn0laSrkEbhmpC0VyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OqWR/wOqx+yc7GvIQwQXSLx/8QODCm7CGDBtM6qehlTWt4nLuF/SLSRyDMGH/EYQ/SbohY6Zb6WZ64CpDIMsDKnPqZYkPm2vnrnb21KnUdI2427k292PcYrJ2YIGztNo7kWP0v+71YTVrvdSkcoMhHAlu3gtw784asiOr9LP0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=De3SH1YN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwaIVII9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6537ExAJ1956521
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=; b=De3SH1YNZhZ2j7Ej
	EyVBF3KwV+RzjbMdLPmqPDjoY3R+RZo/zsbfqLCSoBQjNUcgUVsDfSxcrKzzBcur
	rckxjwtZKtrpsTHijuWlQyn0d3C8ftWAgwwpNbTiv44Q3r1zbl4os260zMLqaNrS
	23YwXh85y9CDIBDXwa4fk4mty44yhEKe9bQf8SH5BAHMuO9Mtp4bfD7FawxdpvCR
	K0IVNHoMDzOtm7rDcaB1KjaHhdsGV1GBw9yem3NDCiPB1Sgg2IjONh3Ar60/No4I
	PjqbTENRIFXoHcAlXJ0pE/051xt7tEUDDHexzZ1lFUWKPD9hqNMrNnqrB6nCwUnU
	VotjtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc1117-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:26:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf32259e0eso55108965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485982; x=1781090782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=;
        b=dwaIVII94612wbCgVkjFSPSEwvul3ZOEPQcnS697biQ0aE91M4dAevCgDb+RnSVeix
         0F8yKdyHsL7nAdYp0vyb89IL0prCfyke8oG/FvSaii6OFy6keWgkE4loJTMHD22nmtwt
         U3z0SlHxcWXS4ZtDcxf9pSaUFe5A+5NrLMhFpdrPNUAYVm4f17OQwW/KmOTrT2rUrOBL
         NUmuedkSNwVmAlCviWl1xIUdYChyZ1KTF3b1jFR2iq9ivLnp43CjKAVXUxuDKMAXq26w
         s5Lpmpa2Hli7co70cB0OOq2ooBqYrxdyKuc+d11TywssSxVtY16rvfq0wyhkZpiMLvb5
         fJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485982; x=1781090782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=;
        b=IHABEEpDBBrfd8aVYkAtFsQ6D1i5kKwOO8lmQvFKeE158whMYfKbW2v3pnxvMtgeHF
         VjtHAc5q/5qkRdO14gsCB56DPc2iarAq0FIy8kZkm+gYCom7699or/ysiodD9GT4ai/r
         OtqpsfzLUp7HQ73/xD2WlWQGKI7DW3PJIqp6CLU48bBK7AA8n0teMkZGCV46oiXxjK3e
         wYE02lXAxb3xN+Bk1b3kdekcSY5Ota6Klol7LXlC8sgG45/KnFESeZu/x114Ggxm4xCJ
         8+KyhhHuW/ocjagIgicbUQN6bebJrWXkAHFrLBxhrUnmU+IJo5zcZ1c5fF24FRknlW+O
         if0g==
X-Gm-Message-State: AOJu0Yzch7vPNdoSRYF0pjNOY8x+242JAIF25jFaFTfxYBzcl/zYh0MY
	tkNVNapEUxGmRV1aVd5HhyHAgMk6MNN4KAWn9+leNgBRFdCFR/4Jv6ANK8gC+Ig8AgLP+EnUNJv
	RksDLxva/QAl3cdydly84TTxNIm07D90TAVRuwPEpCVg0sn8MxrtqZGnydMdyjTmRHL5q
X-Gm-Gg: Acq92OEqxbK4enm90OdaY7VGE4WKhEfaAcsL+7j1pabCBL7ayIbZcZMEYtS7OXMwnlQ
	y/EYq8btSX6sdzctArAhe4gDDBkFqZBMwYbpZYOXln8YsVnWwNep0o5BE5jNxqc6ke2NrR9Uzt3
	x3AK8rv03bM/bYjQL7IaXE3aI0R2zr9t1w3mwl6VpByZKqFca/5MGW2lPh3t7GHS+/OYdJc9V3i
	8HFPxZ0wFavXag1MtS2yfwpjTIxKVnTjVwWCMlgjwp/Dbnyq+ngmvs4zAhXEJdBG8J47k4a5rAw
	oukQXubf+Oc5rh1QJybp5jv0Bd7AT2Xni6+d/rqkXs7GCYz5hw+QN/+3IB22SoQDZhLe2DJpbIP
	o5eaWN0bbDm9/vmebsJCgaGeKF1KH3D1RP0uYBaaLWdt9tOfQ7D6w7/8=
X-Received: by 2002:a17:903:28c:b0:2bf:1fbd:b946 with SMTP id d9443c01a7336-2c1636143fbmr29375895ad.0.1780485981977;
        Wed, 03 Jun 2026 04:26:21 -0700 (PDT)
X-Received: by 2002:a17:903:28c:b0:2bf:1fbd:b946 with SMTP id d9443c01a7336-2c1636143fbmr29375615ad.0.1780485981543;
        Wed, 03 Jun 2026 04:26:21 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm22704275ad.45.2026.06.03.04.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:26:21 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 11:26:12 +0000
Subject: [PATCH v3 1/2] dt-bindings: interconnect: qcom,osm-l3: Add EPSS L3
 DT binding for Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra_epss_l3-v3-1-3c2e0b796e78@oss.qualcomm.com>
References: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
In-Reply-To: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: XZd8HD2Gvjb6X3LMg_9o8-2X4tOQbnLE
X-Proofpoint-ORIG-GUID: XZd8HD2Gvjb6X3LMg_9o8-2X4tOQbnLE
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a200f5e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_8IM60h0k0ddrWA-9CwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwOSBTYWx0ZWRfX0MhqAxQ08Q/k
 KliZ4BWkKgAtivcvih+z/8n8m75AGIn1j2FMZl0gkQ1qPC1F29SG8lvxDGRKCVwn5JzJGCLwRRd
 5rYfW4qqGNHaA7RUNIPSD11+KMK8CFylL1kg4BESvIQvxNAHduExRQn4EbNQ8PaZfZkiDS9DeuN
 lvYYYvcixKPJqzN/RMPkq2JC4JiMuANUeYM5Qcm0D3MR5MRzxoklGQQgbFAcFWSWPneDLJV+DPM
 jcIZ0XtE3NVu67Xuk+fW66X12L/c5WoXmBvk83UmfC5v8Zf1wXtYGo7cHlBDa9qbr8jQ2Ut+50M
 0kJIT3tugWVtUt3YN0TKfBZ4z2SeSEmWo5XRqHHrX31WMutT3iZWGI1pdr8MCl+TAHVYpbNIIbV
 Z3/Dz6hO9is53kmTQgf6nrAbX48pjdj2znZopehkriQXpvZnHMGuwiGjnJa6knXMIFponAUCP0a
 fCAWg0JRwt+owKVvI+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110940-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0DCB637129

Document the EPSS L3 interconnect provider binding for Qualcomm
Shikra SoC.

The Shikra EPSS L3 block is similar to existing Qualcomm EPSS/OSM L3
providers, but supports only up to 12 frequency lookup table entries.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 41b9f758bf8b..3b8ebe17a976 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -17,6 +17,8 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,shikra-epss-l3
       - items:
           - enum:
               - qcom,sc7180-osm-l3

-- 
2.43.0


