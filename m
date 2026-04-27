Return-Path: <linux-arm-msm+bounces-104718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHo7FyRb72llAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:48:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C14472BAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69385301FCAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823763B9618;
	Mon, 27 Apr 2026 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6+nG4/S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vv1g8Tf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C83BADB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294006; cv=none; b=rsPl8LfNEsS1T7YuFL+5ZSlreNvYcfGFx+4mCcRoLOvFEBUHVHh5Z8dDvJyTgSsllKHC/xzgX7GpAgpplLr75pAOfy59xHnYaEx9Vlj1qX6Odqp4K4uv8t5CMfIhnhd2HAt91pYfn6wmqBFgwA8Qb7iU/df4P2JYLZRmR9qT0Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294006; c=relaxed/simple;
	bh=20WLnkiYWDQEOKwJiDNPOzP1Og78Nshg+iIm1A20VvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2GVDnKOqTYxTtjeboC67XFj4JuXeHoRLZQSJr0qLzcJJk0dpyCbPJ8rCGp0ECdj+SEpStDqSSi0k3JFObbpt1gs5mlgtwQayUznCAYH0E03cQ13CNMcdJ3kg+L8aaLO80/P1aRWDQLV2ko0vmtLQ+3B7NJ7GZd+qqi2RJAJ1ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6+nG4/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vv1g8Tf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9OeMq3825258
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=; b=G6+nG4/SWFx3ErrK
	UsnkIxKAviaOcZrqkJhfVlmOmbHoQzjgInzE76+F9jqEJRA18gFD2uktvRJSUQ6C
	4N9Ql9YDNEKkztC1cCidMFzTvuSuhClbSb/nvjjimlVbmXhCpCkr0RKK5VLQGsfF
	j29a1QNebdiFh6bk8yZwvQZZ8axh3iM3XNoya32/60lLGvc4VMG+JhcEQRHWJL26
	Hlwlxb6cbPuvT2SHiR/odV23rSda1dvRxaY3x+2Xlf7mp59M8Gj0GuXPdDv64rva
	qd3+3TTDarwBXBKyGKV5CBtRSapgTvbeBUEDkTBIpMASK2Banbu5An6qfCIqY6Wb
	C0vtGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5550r0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so217486411cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294003; x=1777898803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=;
        b=Vv1g8Tf614rePhjf5rlkqimSv9sOhCtmKzRxPyctx9LuU46ck/2XmGQwGZhIsIs8Ds
         5MquywZMwhSHVml8L0rNJUYF7BW+ZNdrp9Su8Z17RZjqwGFSJGfRH6wABO6jFM8T/xve
         W9WVPHw6IvuAZQwCnJsT9IEKihbH0H3OrWNCWZ4M9ySOhBzS9te8q8Xded6AIiEQVVJb
         Yi4xnoWI0IUBWLrkCnbxn2eJcK4USgh3XCTDyclgK5yvEucf+uLwGNcVTu6Ub+RcW9fH
         fnCVijCTwr/1F8HezX/GgTPzRTuWLBFchP7Pjg20ZsiFscb+VmI0zpPjSinbLt6mndis
         P/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294003; x=1777898803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=;
        b=ckAVSxolU2OouZwhxGlAQ9K1k/kog/UHiCYPM6wGL3NfNVMmlFX2Mit4038Ku5pEhi
         HHQqprpu55ffn8pTXPNAA+ahX9ZZ6uaiBN0TIg9SOWY3k8xG7NkppFxsYjpFetO41k4+
         iP/D7i6hpiejdihrwWnleSzUyUyJm7Jr+MeelUDjHz1/SMwY7EFjVNHkusDWeeS0Uu2a
         oW13zzSxBSdk/UZyxrQyNo7maFchH2kAh8kCDOCgre4isnV2wM1QVLBW5LNR3quZUuTr
         /3mlcLXZJYZvb9GtoSbvPCUnwdmToZWHNvnRV62DrvpNFpV6fnnFx2V08xAZMBjXz5Tn
         h0FA==
X-Forwarded-Encrypted: i=1; AFNElJ8r4sdSdoUpeBPLQqBfvl9HcwKxQu1GhmHhaIORXKlrkunDADCyvI/IC4UtB5KzEqF+9rBo2FlYt0yvjQXb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0XIAVKf5oMSDjebXn2FTSkB9iV9nOBbG2eZ1eoKrp+gf4OVP
	TCbi8o5JVKWjN1003NmJspV+vcYw93mlkIZIqW7cvpyFb9qDM26TDpzWclKqioUWeo2twF4QDoA
	ub8o0jPARTh9Lue48lOifr+cXtX7aFlsPqOYpGdyhqZ6gfDb0BbJK5titMqpE6ksTkaPZ
X-Gm-Gg: AeBDietInFk8zfT2rN+M9iGSuCQsBXyvcjYy+v+pQV/knki1IAZY8cHspfzbqT0Oo1V
	HLrg8MsJj/Ox8t1NqaCb3u9om7LcyHzzyUo9WhYdkB45zkQBZSJLUeKUm8AkYwR1Hye2IRcDJeR
	r7lpYzB9LoXm2dVyZrwgv8nLFqa6SylTZvITBsbXk5ocJpMWyN5xlbeYpgz2DV21JmTG94rc3OW
	Mf9Oj4m85ZUiOFHzJyY16mBSWMwpEjpfSM55IiT+VGCM97SExgOoTPxMD8pMwa9dpyh0rr3J0by
	7g1B0uO0LPK9uU9XTpKfjj2D3NTpiYUSeOiW5lap7pXK04pELg9EvKilaXsAU7/7HbPlIHHuthz
	e4Cg8WMwCoXeVB1L0VxW/9I1b5OyUAFkm2n+2wAHijLl1fq8uxvXzm4PxrgCTwHJCAWuc8W0VY8
	YXujgCYFjYC9s7Wa566OEVC9bYUdE=
X-Received: by 2002:a05:622a:2615:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-50e36c122efmr629758881cf.38.1777294002722;
        Mon, 27 Apr 2026 05:46:42 -0700 (PDT)
X-Received: by 2002:a05:622a:2615:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-50e36c122efmr629758091cf.38.1777294002214;
        Mon, 27 Apr 2026 05:46:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:31 +0200
Subject: [PATCH v2 04/14] media: qcom: camss: Drop top_ahb/axi from QCM2290
 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-4-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: VRNzVaQeIeaUFEQfPP90noKGquHiQiGO
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef5ab3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yFrQIQtVvbDJ7NVWecMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX8xllYlOgZM+L
 9fzbyFDK6EQo3mFthjXUuGtIw11X5unVpq8tEcz6wB0wMP2GUOhhmnEju0noIS16DTOjc9QoTd1
 JTeXbUe1CW60JWhRRtIXkdnSEPMyShCeuAQVv+rAh7ghRrXEINKHIIPqfTOz8Xb6QZw+3114EFt
 xSnWqKGyUxdrKFTBILGMzY2YqXUix4AWr54v9uvMec358oK63/YpicjNMLbOXQaRbRS5YOJPdT9
 dASzUdLv2iXbfLJ5yvUxxuTkgGaZ1/u9YNbI065lKThM3yK6nWcDAwMRG4Supc4c16eDwM/94K2
 ntHsvzYkWLNBohPkp99tzk0eazCQ0baWLGNW86JOHg5Fzb+q+Z5VqEApCIG/vXy8aLHkdsLjAo3
 EhylsarTK2vBxbqyXFxnTWmyD0y8DRORpwbWXtbMsA3FXpY8zzpAxemRp0FXEhtIjYagEa1ZJRn
 FB8pRzPaBc51GF6ezkQ==
X-Proofpoint-ORIG-GUID: VRNzVaQeIeaUFEQfPP90noKGquHiQiGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 04C14472BAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104718-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Remove the top_ahb/axi clocks from QCM2290 subdevice clock lists.
These clocks are now handled centrally as a global CAMSS PM clock
and are automatically enabled when any CAMSS child is active.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b2b0afc3fb5f597622f9b4ebfee2ec6703bf0890..1fa42565c28a8cd461771821518875a8f468834c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -664,9 +664,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY0 */
 	{
 		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
+		.clock = { "ahb", "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
@@ -681,9 +680,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY1 */
 	{
 		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
+		.clock = { "ahb", "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
@@ -700,9 +698,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock = { "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
@@ -718,9 +715,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
+		.clock = { "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = {	{ 0 },
 				{ 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
@@ -738,10 +734,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock = { "ahb", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
 		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
 				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
@@ -758,10 +752,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock = { "ahb", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
 		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
 				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },

-- 
2.34.1


