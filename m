Return-Path: <linux-arm-msm+bounces-107439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OCdKyXLBGp2OwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:04:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE2C539865
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40C2F315AAED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E073AE1A5;
	Wed, 13 May 2026 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7oDIk4c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZqYxCre"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3013AEF21
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698372; cv=none; b=Xd4GlqaRXawBsJtInDUzsdc63BhOb8+h9a1tAQKb7cRCNnHM1e9/zAW3EjuaZaS+z/mIKF3oQUbJSdD8UCwPuf0/06BsUfnxQoyFbFPRaGVepKvFxB8ldoEliAOQQF/GgW07NTtqjg44/OMymsXnDT/YOoIaq95PZlC4Vu7rQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698372; c=relaxed/simple;
	bh=9Gkee+QP2+V4ReA/loQuXxXG0CE57ytfvEg2Yf6qXv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NNsnWW5zFntHOkXCmMjmn9c6sFizNBdWhUmJk+p3WVca/Cb0DRJ09UhLEYtAd8ViMhXxEMY61CGhQ+XpHKo6gmde+lse2HcsMvFb4BJkHZ0GiQcaYEx2wIqNpWt4DilZmtRV6ccMkTw9BtFreoG6unJbhhzuu9Flfy7FHm6vHVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7oDIk4c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZqYxCre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEbaFP2887912
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=; b=I7oDIk4cPbo9t8i/
	3ZXIU3L2PWuhdzgYSUqbKiddfDNZdYigOL/idUBKA7aKfeucZlIXbamu52srRVtD
	DyHrUzZMqhmo2DGiEP7umvO4JN1+Fgrfd4D0Gwkdevgw8APOCVjlYJ3F3SJRQCaz
	qN9L7FiZygrCmyfFimWmic4XOljid4ikdcFtCvonYCyhgkvbZQE+Yr9mfoYa2x0a
	CLp1e5CGbIrknsuI1ex8e6G/jpef5VlLq988r82OZKwBjZ5mLEMwjysVsLQFBxkO
	fnsNAyUbtsgb7IKO6k0ynWyN1W5ecGE7ZWq1BsJOE7aK4drmH4RKbiBLYOhE8k/a
	A0nIdg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gjfnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so4871364a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698369; x=1779303169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=;
        b=aZqYxCreq/0OqaCq11knMntZnol/JyxcEI33iGgmWN5/Yq/C+FnK1Hv3kmcvx77kCs
         0Vv++hrDoAz15REiDNHyyYubjusTH7IF7ZCz8pODAJoA6Pza6QRuD9v/yaIFJ5t7OmLF
         PBXHvdC1jn1rnRYrHteuUZOZcKtScXKvH7ed78b5Dr5TTVVyTRmdB+Rv3NRbX4TLm1iy
         YnUVArfMQDfjORBVrOBcfuvVMJ3TIAjbLI2Wm5gffdLG/gndIBdrvIkh+/5/OG5SfvZe
         41jazeRxl+/Ka472Im/NtfNDH/oGzBEsi9hoq/hwdI4M7EtLdS4XT9UVvyMKQZt5D2+A
         Wi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698370; x=1779303170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=;
        b=b0HTU8F1NbLUkVQUzQM+aQEcRDQMi59ZaG3SL7R542k/OJrSo9esgweQ89Q4RF5hd+
         MHwCx/mU5VUWeF2GBykVB7pDJKDmMLtI5c93SQ2B+Zkxrx+Txu9Kj92NyViZ31JnMxRC
         R52iHZw8KgqNyQZmffOurGLvgdEhooHA5NOfany5VnbthOtyhZgWpF0txXOyZyM3xHLx
         CI7k7Gvz6rNgRuMuSt87jsenH0uWjV5UrKJQ3H0LI1SudhfLe6bK0snNAAAwhC+GMxpK
         E59VLk6xu7Gd2iwtBabdIhgQK9+53yEkz7dUUyUIyyoqU4w4yCQD8jBt5R9/viSVCWoL
         wDaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qUwOhVI6C0JL/TmtEBl0O0jqPW3PHhxqQVkTMLatkgURSNEyZSZTd9w6Ck3l6SQYAQTl9kufrGVnXU3ug@vger.kernel.org
X-Gm-Message-State: AOJu0YxkSfx3R9FIygGK7IXD0ixBZ4QftvH7y2EZi4RQn8ZCqhyRYoex
	vJ6sUu4imZ1IV2eLI1iWBuOoqObSZwx8ojN9n2JOmUKKed2vtQjkvtnF/BAHu+ipyFRtfyqToJs
	rVudjKUn8zaMobfX2hoTV7TXB5kBaJ7aI238kadqY8DWecKvhVfHiv39L1Eplx+odV7qe
X-Gm-Gg: Acq92OH22HhnOQVsbTmGiBg4PAJVfBahcdzUN1GM7fd44gWwxe5BSEUMSANs3WVY2q7
	WfPfUgsnY0CUE6h184i8A1L5VaT0ricahcibATXdjaHuRilylM/6YW2wRc7bXkn7E6uf2AnXN7G
	vBeFSBmNVs3FApF7s7PWL1auIVQARmvYg/oRsArGKWO530ttjTdKjwH0NJBWwulMy8kPph8ji5U
	wJwWPoLDj/gjwXoeIY1gkZlvbP3WlLtkEpnjcsxvxlRtNpv+91nIUPsrLlYHujh/wcB09aNlKrB
	1LuTK6pGF6lPb84pAUeMs/YxIcZ2zuA47E2KMLOf3hCbErXSvSlhQxN1IizSbPMWLapc1pxKXce
	DCiPy4okWXseNjJFVXKMZ4o8ddJVpW/KsVEwhA3B3eusG+VJmly3liMw=
X-Received: by 2002:a17:90b:3a46:b0:367:b9ed:dec4 with SMTP id 98e67ed59e1d1-368f3e7c1acmr5328857a91.27.1778698369491;
        Wed, 13 May 2026 11:52:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3a46:b0:367:b9ed:dec4 with SMTP id 98e67ed59e1d1-368f3e7c1acmr5328831a91.27.1778698368955;
        Wed, 13 May 2026 11:52:48 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626a04sm3660219a91.14.2026.05.13.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:52:48 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:22:21 +0530
Subject: [PATCH v2 2/3] dmaengine: qcom: bam_dma: Add support for BAM
 v2.0.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-knp_qce-v2-2-890e3372eef8@oss.qualcomm.com>
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: OxwPaz4cLtluiUHVz42CCCh1vM8k69Lk
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04c882 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RYeHZzZGa2Tlkre8v9EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: OxwPaz4cLtluiUHVz42CCCh1vM8k69Lk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX0h1ob8TLFJE/
 q0QBPEiEcNZ8gUsdR9dDZstkdHCIYwSxOEmWxuCJZq/1kXrOme0UcUQiudT6pGzjnqryR9/HDku
 WuBh4s06yK9NQdruzWq9ovf+qBvN3xmN05s/VIGqKXI7OCDrRn0QXd/hbqnlYYNNwrg6V+M0P/a
 XUJ/caolAko0oK/VLr1sAT2ZFKQoY2Ls/Q664YbliE84VIShNzqTj3bXMzrroTWQmqmOGCXG9cQ
 O1354Rkqc1uyydVUmv8zHwNQ288Vi0m4hClsXdElMm9WP67LPAI36yowHb7GtRH+9E0aUSBqMwt
 XEuNBFSbqsxxpcnpkzu7XYVv0vgdzvhPJ+G5wGZGhQ3LLpCq/3mYx2OfaOVLxZmSMr92V2934qU
 QnArU8FtdDqq2gO34Iyl86LlrBCoocBB7KqsBMrT5mqBGwH3BOepOUr3xX3rq6vXpmKmWOuYvXQ
 ir4XCw6ePSdhZ96PxYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186
X-Rspamd-Queue-Id: 1CE2C539865
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107439-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add register offset table entry for bam v2.0.0 version found on
kaanapali.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f832..1bb26af0405f 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -199,6 +199,35 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct reg_offset_data bam_v2_0_reg_info[] = {
+	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
+	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
+	[BAM_NUM_PIPES]		= { 0x1008, 0x00, 0x00, 0x00 },
+	[BAM_DESC_CNT_TRSHLD]	= { 0x0008, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS]		= { 0x3010, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_MSK]	= { 0x3014, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_UNMASKED]	= { 0x3018, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_STTS]		= { 0x0014, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_CLR]		= { 0x0018, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_EN]		= { 0x001C, 0x00, 0x00, 0x00 },
+	[BAM_CNFG_BITS]		= { 0x007C, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_EE]	= { 0x3000, 0x00, 0x00, 0x1000 },
+	[BAM_IRQ_SRCS_MSK_EE]	= { 0x3004, 0x00, 0x00, 0x1000 },
+	[BAM_P_CTRL]		= { 0xC000, 0x1000, 0x00, 0x00 },
+	[BAM_P_RST]		= { 0xC004, 0x1000, 0x00, 0x00 },
+	[BAM_P_HALT]		= { 0xC008, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_STTS]	= { 0xC010, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_CLR]		= { 0xC014, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_EN]		= { 0xC018, 0x1000, 0x00, 0x00 },
+	[BAM_P_EVNT_DEST_ADDR]	= { 0xC82C, 0x00, 0x1000, 0x00 },
+	[BAM_P_EVNT_REG]	= { 0xC818, 0x00, 0x1000, 0x00 },
+	[BAM_P_SW_OFSTS]	= { 0xC800, 0x00, 0x1000, 0x00 },
+	[BAM_P_DATA_FIFO_ADDR]	= { 0xC824, 0x00, 0x1000, 0x00 },
+	[BAM_P_DESC_FIFO_ADDR]	= { 0xC81C, 0x00, 0x1000, 0x00 },
+	[BAM_P_EVNT_GEN_TRSHLD]	= { 0xC828, 0x00, 0x1000, 0x00 },
+	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -1208,6 +1237,7 @@ static const struct of_device_id bam_of_match[] = {
 	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
 	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
 	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
 	{}
 };
 

-- 
2.34.1


