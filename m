Return-Path: <linux-arm-msm+bounces-118486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vhLpHxt5UmonQQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:10:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0247425C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:10:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JoCK9hba;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F5vhvrkl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118486-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118486-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEB2A302AF14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8885A3CC7EC;
	Sat, 11 Jul 2026 17:10:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DC53CC9F6
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789820; cv=none; b=tiRnYknu8VJRmpevzh2Lld5eBR7N9L1rfVMSqz1zcp842XAC1V8tGBp9eGmcmHjhZYbI7vH5/iH2YjD6qwxMfJQsrrOUO9rtI9OGeCoShoD6HUWn1o6/wzq5iCBuhcToMhrGdOTEYIXcJvn9dl/5nn7kCUnHji9BqZqA4+5fcWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789820; c=relaxed/simple;
	bh=oVC5UqW8EITu6nRZcu5QBdQbzKRKDsRDWUWaypx17T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqMihxQlT88WSTxhU0SF2ZGiJ9k76FsM2Y8CwlWD6GqFdGeToiR8LUsF6p4C+2us2bPijnl7LEd5SrUE9rcc34SNwRwyypIdtXAU1/tXMsJWgGHuQYGw5CQEt9eBg+mbvh/AmllSTcb5byFtplw+P2vKnAMPNtXBxcQrDA6yZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JoCK9hba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5vhvrkl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOU8S4113364
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=; b=JoCK9hbaiue6C6gU
	2zyf9Eh+cZaf0Tqjc4NzJucvH1HPiyx//5gbS4fCtncnt61Q02GYSX6TsJLRUJf8
	lePsaD+xO/OanthIY/FmV8/fmiN5Svd5cG3qdPMcCjhSujuyxv647v7W68siuWEc
	9zSziLBYcLqtQ8bBW1JdxsiyMeEqvApKZC/eWzShsAgKSpStnPDnS0fAXjQDO9wG
	9+3ZDx4onRChIt0zTpEqxBrD4BN7V34cntWIlIbokqh29OXkitXITw3Z12j9VgPe
	9hDE2e/Lqdu8rsAErWH8eIfuMPgST78LiwhVzfW8A3mxSP+miTBbbZ8K229uvmLP
	04X2mA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hh9fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so3071314a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789817; x=1784394617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=;
        b=F5vhvrklmXUUc5sWmCxzjc7/6syMeohqIZvlp5WK+5nZGCdxe0QrVNh27ZD4sprzqf
         kl+2UTWkuqVSN/yAjC+T3OZgM2yF+55iEEiQbxqw0PIYjRXnV8abHWTSxqAkpPxet16Y
         +0Zwn8HN+lS1n9gHFAlUOBrzwElhEr3dy4Q8euSTll0MuCSGun+VKbX0z187kWhNjR3K
         z2XekITpVG9+pM4P35XeMImm19fniHxVzIewsnfnLRLhwC6/Ey1SgoNOa0xP3vswuXqD
         dTWFuhUROp2YQLrNJJven9DH9t+wg0Mvozc3TN4pHNFahwS7ifUIXLexV+RTTfouAkyv
         sfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789817; x=1784394617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn7fwHxfFOX/isdk4ukXYQLob0WedKotBlCuMDd7Tzw=;
        b=dbRPpkCXMDQQHrLVT0HVTGBhv3m1hLB7a6AT4IbRxul6z9iCNFhk7p/Vo+BlWknsVR
         rpdthurQfE45U5oC0hWxqnmDXfAit1AiPN9ayVgT4e+iQCcKmXz5BlnttdXTVCaJm3Yd
         AhCv+alCwTQl3GMj3B2jszJkB5Pet+cZBuw5+FZsXWdewcK+ChyEPmYSJS+lFZvG1cye
         DReUNWkUms9SwIzYG61raYzUmpbmIIJKo53iYlhYY32A7HpjoAoHhm+qYcNmIgZZdFgc
         yE41MPHC+16ad+oBYHgSlnGwYIBWJnzAgyxEgb9l3Oonmr2LAfKg4MFOwU4ec4pgJKaW
         SGdA==
X-Gm-Message-State: AOJu0YwMnyfrgYXTBoYlSG1ceMGlhx1uX0xyU8TdLST07Y/00Nar63kR
	kfxQB7P2UtIkuFiFUVAokvtJusNM1k0vgfNLkPskuaGNAn1wIHt54PcUZ3scJtUxf+FvFgw84U6
	kDsnbfQ+Xg8iJSLc6WWnCFClExHdWE2XHnSWBGs3xz+3UB7Y5BH+20h/k/E3yff6psKlH
X-Gm-Gg: AfdE7ckT8dkLo9iAad4JkgdeA/Ws50MkD2qo1oQyBzvq56L4Xo11xnpVng4jk3/jqL/
	7rumzOHpNV6GswsSCGN176JlMs9M3BqSsodg3CMwvZF/KLue7UP9jBgOE2DfaTsoqbCOiyZlQ2N
	C0+a4YcT0198y8u8yETB3OTdc+DzulizCdX49CSRRRNz0r9gaPZmOU2zeFfTKX75apwrLiG70n/
	m5Wuyj4AIQ7SdgKx0oArnxMfie4HhmhEC4RCpIxhOm05OFMVdhn+DZs8PfZ7L/O/l2tw2lnhI/3
	aF/mS/XvqgPHOvNreLraU8pMVFf4l9LEAgUsV3CMF5IqVkzEu4R+6tQ5IYkjw7V9uAr7m95t41H
	uu065oWpFMj6r84+sPEcTkKM+Ae1DqTK+co8a/Vzo0Oa98e9ZCkmDAQx6jDaoBeB2qjWbzFxkif
	YA/ssI
X-Received: by 2002:a17:90b:2692:b0:38d:c834:24cf with SMTP id 98e67ed59e1d1-38dc83427afmr3157835a91.23.1783789816559;
        Sat, 11 Jul 2026 10:10:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:38d:c834:24cf with SMTP id 98e67ed59e1d1-38dc83427afmr3157810a91.23.1783789816092;
        Sat, 11 Jul 2026 10:10:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:10:15 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 22:39:53 +0530
Subject: [PATCH v5 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-shikra-usbphy-v5-v5-4-229ba3602737@oss.qualcomm.com>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
In-Reply-To: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=3641;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=oVC5UqW8EITu6nRZcu5QBdQbzKRKDsRDWUWaypx17T0=;
 b=08IJb8l81knSvutBM5fHX6e0vukIowWGwRGgNQ39+7oMRJhSgBbPrWK80T43xqvdUtb5+JTHX
 hU9vbGCIoo2BOBoxt9kPbUBnRA5yTM5PvxhMk4BZAunw+G3i2q1Av4X
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: rX_oCfIVSqk23hqpDEcfDNIbrB6sTqRp
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a5278f9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BrUXx0GcgBZ9W2fV7PIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: rX_oCfIVSqk23hqpDEcfDNIbrB6sTqRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX7qb4ngcKKMEm
 76CTWB9DdRHAA/zEv+LsPTap1367e0RuXMpaKaJ7itQKj2MSGa+/flJPdYYPL1ycB/tifODmLZS
 Xrm85FQbHLl0SuG6UX1G/0b0HNObBTf5D5r5wgW71yGvgKSJi+8Utiap4JlIJ5XOvlEt2+i0HWU
 fmUx51FK8UQelwpsSiUejtRMy7MFkya+v2P2y6gxwjMM0N7Yam1NhkPcnKu+XLLYFaeHVPKIUEz
 JMJEFNHV2noptou8L5cAG75v89YhjWAyxAFDdsDNqfErkzKrSLsfWFHYzbnRXrNlHxqh/4XwetJ
 KGsollEPYe/7jEtaLX92UVwpqkdR+1vD4Hd1ZPMxhqmSQxxd5Wblx7GIl46dh5+pePC1BpdsZpi
 Nztbo9tsQOg9bTmLUXwKyjbmx2T3PTeM6I6v9HNEXVZ+LSJjnp48Pej003qOnrET+5QZ+1oHFeb
 WVxB+JR38vxp5fApyQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX+IlrvQ3mrWcj
 Pg5oILYinf+AbCCZbiuVzBpUVbJ0yVTONMGKwCpAmOZH54qzibCMI+w6F0+FNe1xFXO3OqV/9y9
 faHGIaTFK4dNku8oLYpv6sSfzmavTOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173
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
	TAGGED_FROM(0.00)[bounces-118486-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC0247425C8

Add init sequence and phy configuration for the Super Speed port on Shikra
SoC. Also since Shikra uses 3 resets, add support for the third reset and
configure Shikra platform data to use 3 resets.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 53 ++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index ab3055bb5b0c..fa8492b487d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -512,10 +512,14 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-static const char * const usb3dpphy_reset_l[] = {
+static const char * const qcs615_usb3dpphy_reset_l[] = {
 	"phy_phy", "dp_phy",
 };
 
+static const char * const shikra_usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy", "phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -680,8 +684,48 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
 	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
 
-	.reset_list		= usb3dpphy_reset_l,
-	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
+	.reset_list		= qcs615_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(qcs615_usb3dpphy_reset_l),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
+};
+
+static const struct qmp_phy_cfg shikra_usb3dp_phy_cfg = {
+	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+
+	.dp_serdes_tbl		= qcs615_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl),
+	.dp_tx_tbl		= qcs615_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qcs615_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qcs615_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qcs615_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr2),
+
+	.swing_tbl		= &qcs615_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qcs615_dp_pre_emphasis_hbr2_rbr,
+
+	.dp_aux_init		= qcs615_qmp_dp_aux_init,
+	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
+	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
+	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
+
+	.reset_list		= shikra_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(shikra_usb3dpphy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 };
@@ -2019,6 +2063,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-usb3-dp-phy",
+		.data =  &shikra_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,

-- 
2.34.1


