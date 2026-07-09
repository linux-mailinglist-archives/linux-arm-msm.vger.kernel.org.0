Return-Path: <linux-arm-msm+bounces-117979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mL0aNdaZT2rokgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:53:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D51A731403
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:53:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IJ4Ox+TX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i+cxejsH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117979-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117979-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECFBB31BD54F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E095942980C;
	Thu,  9 Jul 2026 12:37:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83642847B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:37:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600634; cv=none; b=jG8piCVsdBHH97jRt/NmXLZQKgXLPNbuthSv7nVUaztsGwW1dBnhqyMUT/shosbg+1wNllaf6HC2vcfvYacUddXsWyg1sQrdphEewmBkPNspM2aiCrlXp49o4xB8HxAVPxjly2vzWA5N7FXBDg8X0xPKplJqHNN8ZcU6290jQx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600634; c=relaxed/simple;
	bh=rhePzQT7hlcIh03rDOoCur4a5l6fqH231Apw1Cmf6GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHwmeKxiCPm8Ac5jbc33QOBQw3mVpqL4b2StP6lGG08RWgS+YQkG+kdI1o4LKvS55TktaGCE27uX0Cplkw0WoRGoLxcoPJ6q46sBFQq/wgggzg9M666uUmtQmeQQiCPEw9HAoS1liJs2uJxGeCeQONkHuYCmIMyq/ZEJGlXsF6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ4Ox+TX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+cxejsH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNM8c1667680
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=; b=IJ4Ox+TXCYYlsylZ
	RYP7HG4J8n9p+FIPjYFpRR6Sjta/4UOZcH3ZOWXhgmxUGSKtRsKsxjXqc+d8WJD2
	BU/0Q1S2LqXurz1N+3TckhHSs217GI/2AoJX+V5wgpfKTJN4OuaYO1TNB7akZV2c
	hQv4jxqC+Er65SSH7mBhmxIDwCl9AZDpfPzAFN0LQWRe3uurNkiL8WVr5Pf2ihpx
	hT3GpQWpOtDxzI68JgT54tWUNrGf+ADsoEeP3po73og2hfzlEpYb//8CnzypRad8
	PY5Opgw1mixqhfo9PPANUokycqOF0j24RPpSWl1CFEHpHonuipCU3GTU77aSb0Ah
	HTZ1NA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6krcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso1526313a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600631; x=1784205431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=;
        b=i+cxejsHnASTvxY2sNMnvosES2uX5iYS5P45FCuQtVS2jhTlNrDmJ8Cu+BkuiEfCpt
         NecWVJ8ldLLum/YthiFKCLxiv0+8c+Az4WuGOSZYRmTOa8Ex05pcrUF00/nLc3SvGRMr
         XFPa9Fd5Zr1pWEsGWdIeQzMCHF3/ZNK6nKBr2a95GkuioQeHAI6lpbpfKrY1UNeXKX+d
         CaWE0drqA08wezJi0ZyEfx3RuxUe/XzbrXKhFydEsETu768Tw0/t7CkklN7/es2R0KMu
         BBzNJiKcIwSJViCs5OGkeGT/x1XnQmAmXVFq2FOaABxw3XccNC3poIGOEGiL3r9t7pQI
         aG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600631; x=1784205431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=;
        b=JKkP5i0r7qLGurtb0lx+d1m3Ve5V8M2k2QH/tq3UGBL5IQpLYz0ba3+HExhecNg72+
         js6uhQAptjx/6RZEYt0440cXFPX2g0s0erQadVu0xS1dcn6dSXjNiQmILRGE8edzBv5/
         xsuamx/0dx5nm+NM2M0mAJRA1TBoSQalRvvZi8kNZ826evtt3dUoq0VLLoF1VF2awUdv
         Xcyg2ImnAXt7iqtdtNreNbJlYaJpFC/X5RQtaI+enWu09ebIwEp2acG7hhoQM23fZSA/
         hfU+9ZzqFN6gwMij5RBrRzmHKQqVxQGSX4NUtRkPsJlETk+U4n8a8v/WMopPHzasmUF8
         nTRg==
X-Forwarded-Encrypted: i=1; AHgh+RplnU8HUpt5A03SZOeQjnIBvgFYhJv00yPOZI51dFlJcvEepb7bYo8RFpyEuqUZVTyAcu4/QCE9PehWGLSF@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgkYfN4T/wroxQfVfriIrQ7yvPrxnyoBg+JCuDTiwItqerSL/
	amuAUB79NbB7hjiwY+SIodz2R91raYX8Yv8S8RhD53kDuYqIm3x43l3n1nnJxkrBOZ1f2RQpCnh
	AFBmlEplI6sS/MVE6HSo6dTYa7i6L0VdUDTnq1Ip5KLiMVtvbE6I4deNKNQioekXX6nyK
X-Gm-Gg: AfdE7cl54+bDaOwS2UC+rAeQe+tTJySAqCnKKwx4wGk6DwSHBmHsnTkscQjXvvgTTuG
	sM3awmvHpzwTGW+L22joRgRM1AKvt6DF1hc/BO9tMFd6Nq+K0QwWmci2HNA4Vy3lfInb9YwfLxk
	4Kf7PET2v2TQ+4prvTpzhL/ajceGHClf4SWGLLu5zwBlHZAFEOGEV+9l63xW/WnvZ+2i77t1PP8
	BjjBQmGBUCLiEGCIdYqBJ3ximRPW/njzv24GvFc8F2WEzi35U+xER/EsHEib5eidGAHaEBaaTwi
	4SMa332X8ePBcE98MK4Oxs/RZqQkNLzGx1lPZ18huBbdbLbFCyWv6dp4PMFk+yi4KhR+DeY3I+0
	zPaM257AHS+U/dg7vicX14Q1x+VaWAVGeNwqm8exE340CBg==
X-Received: by 2002:a05:6a21:485:b0:3bf:aa1a:d2f4 with SMTP id adf61e73a8af0-3c0bd0fa17dmr8579105637.49.1783600631420;
        Thu, 09 Jul 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:485:b0:3bf:aa1a:d2f4 with SMTP id adf61e73a8af0-3c0bd0fa17dmr8579061637.49.1783600630967;
        Thu, 09 Jul 2026 05:37:10 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:37:10 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:57 +0530
Subject: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-11-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2240;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=rhePzQT7hlcIh03rDOoCur4a5l6fqH231Apw1Cmf6GI=;
 b=PSofLlEVPZP0yPnLVxKIhOWiOv4MpHl/hM9jyNuxc3BfUMVEEFt1Bt7aDOAv3AK5okRAIHNAw
 GQMnR5AipOpDjLQZX+Nmpn96vezw46HRbG12+RzOnBkfo1Pys9jWEiH
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXy0YJdZxaMyAM
 +BF2uekgdpEOklchX9mAs6tEAbSw6Rg6YZERprmlnJ3Wm8apAfJKfng2gvkK24CBvliml47722V
 JwFIZMhxnWnryvJCXO6XrbooYOEihmg=
X-Proofpoint-GUID: pB37PeR2ZatEGGqE-dkoGNw0-Qo1WrZy
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f95f8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=Q09pOjM2IGVQiUKsHggA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: pB37PeR2ZatEGGqE-dkoGNw0-Qo1WrZy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX+VevrQ97rA6r
 feyn8S+X8U+CI0btp3nPd01AxoduwdHyK9VqSuVTfw33N4aQRE8TkAZDkZD6p3+0nakALY+ZzN7
 ZG2KupySOVrix7Azu6JH8tY/o+PssRQXzrOX/Z/ZlEHSF82qD6ZIibxhUxIOAMGYLqxl8WheYZO
 vfcTEpVtmLTgZUYEYtHu21eDZVy7FIrhnJOTS3rrixCt5gR+Hf2b5+b5v6dWwIIYtoQKiMIRgn0
 dKKXTplqEbqHampjWQD5u6XrFOlMS2/j+OJ+LrEs4HqHjyvsKTUzNxgIFYbn9eVI6m48fwQXMaD
 gI4VY2IS8z04MlLZMTuzvq6l3h4f/j7WPVSiFR5N1NFBTAscBA1oQ/aNhetk9TsSr2UNaZG1AGc
 97Q4H55+S2wMn6Azby2kEzfviNxDCeHI5MK0H7yig47cS3+oL5BX1aAmqVr65tEq7rR6KB2qCxN
 eDW1iPduMryVv29chbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117979-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D51A731403

The Iris VPU has separate streams with different IOVA constraints. The
non-pixel stream must be limited to the 0-600 MB IOVA range, while the
pixel stream can use the full IOVA space.
Using a single set of IOMMU entries for the Iris node does not describe
these per-stream limits and can allow accesses outside the supported
range, which may lead to device crashes. One such issue was reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Add non-pixel and pixel child nodes, move each stream ID to its
corresponding child node, and add a reserved IOVA range for the
non-pixel stream.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 447b788fcbb96efc8b26a52a0606bc53dd29adfb..f9c03de1317f1c6a8e52bd897997ef7bd826926b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1849,6 +1849,10 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0 0xff800000 0 0x600000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5219,11 +5223,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5231,6 +5235,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1


