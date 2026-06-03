Return-Path: <linux-arm-msm+bounces-111018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NfbkHMxCIGqezQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAB638EDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:05:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=ZGhOfCBl;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=EhX+QGFK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111018-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111018-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF06D32FB3AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A908480331;
	Wed,  3 Jun 2026 14:45:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62C944D6BD;
	Wed,  3 Jun 2026 14:45:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497951; cv=fail; b=iyzmvcW40jBTyVKR0nVEzFFIXva9lIyQqaLt2JIdmh1xuhzYqSKe3R+YSqKrlr9EI66PpKS+ePR0sx3mI/6vPxNeLZjt0XHm4I4sNqBxNpbluCd/ryQE4V9SiN6Mw23UiDiB5uGYTqfq0Oxv3HSEJ1Fp6rq5ICUN+IxdO9qh/DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497951; c=relaxed/simple;
	bh=FZ156FLlBLrXeJAINYKkW6WlpSFaDPdc1c94BiwYhdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dznEbDHkIsOxIlMmkZMKq0jlIc/9N6CaoG+QmdBdL7fla6tIj4UXyQr0w1WJDemJyBEobcceSYkNM5pjCOQJCgo2orP9Kcn7DktqBm7Tp5y20PR20H1TefIE/kVbgN9qh5DCpHWSHWaTmQR1BLA06xxFde2o0tYlvqi345t7g5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZGhOfCBl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EhX+QGFK; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ESsSj1297282;
	Wed, 3 Jun 2026 09:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=a0KjpoVRg/v+wUNRgo/UZqjic3bofdfYnYE9BpzoQUU=; b=
	ZGhOfCBl/KJZSa0nsb0HK1Ha6EXbu5BoYS3pvJcsqgtU59+R1MUAN9cCq7buY7HH
	P/SA/sPhGNlwaXrEcd0s9Zu++CrAPrNzivDhS9VhNNx6YfKpYK+Jmn/jMRW/m+nS
	YaJNwEF+PuAnoNpdEiVqflGB6YGX1ZHo+AnzURMw9vmU5PWv1dRTC+QZ9k/DYSvP
	Q0pW6rp820OuVDth+R9OLO94t7a4lYz55PLPdtsVCks4QKmxc3Mc+n/H0GNXN7TO
	708+BcvGpuRSTJ5Zp3zFNNUqg4e1D4eWPYdPFUdPm/lO0lkWfIuH1o/nz8IRpvj+
	xhVc+FWG5ffMhbUBCISyww==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020102.outbound.protection.outlook.com [52.101.85.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa1695e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oq4Tcdgc/ktwbrx2hLWddpuZoEL3Kd7cTNkLwz3W3zxNJG+8I22q/U/K5qPnjAMQk5wdTHf50CpiSYp4lw5TpyuY9fRATh8gA09GZ0R7v7jeFYJiQDXrYsnaxtPGArmu85R0Bn1hdIkd9JY//zNcgvQCTRD4si6jCBrDG9aP9tQld6NxzzNMWXzGpD5A+WEOEjW5HOYWGqjptJzWirPNtH0Xdm4JHOMnbdlUqYhanj4HwLO+IafczFlPOqFIqB2HMQ9NFH7XHv1WAOLkGTE7braeHY0pO/JsKlcd4s6qEmpZ7thf336uO6LCqt7lohPWtt6UNoaXFr4iDdrEwbNMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0KjpoVRg/v+wUNRgo/UZqjic3bofdfYnYE9BpzoQUU=;
 b=mH6NdAzDWU4wCi3JBuLEmqixJXHC4/wZElDHGiCbBmigmqG1FzQv1+aNWGk+gnIFMtCvCGj3BHh4tfGBt3VF9o7YSBRemWmktxUgSfnyQ26vGHP4tS0D3TnftzVMUWcasKBePBbMxYOyzj7kvj0uTr6MJZlBDZ3I0cqE2zeWQECkk9DjpkhcnHL9QeMk8zQ2zPoMY5bdLseiYQS5xqXfT8lNh1gTshhmgec0HtLu9fi5DDFDyBDmGyLiSq4E/bAJ4sKP+C6EWjRFdEkuTYr2qIp7ogDwQSfx/aeQknx+UNzG0eToo0HmiDFppfgkB300AkVwgPpij5m0VuWP+MQfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0KjpoVRg/v+wUNRgo/UZqjic3bofdfYnYE9BpzoQUU=;
 b=EhX+QGFKcYNA5uMd41VQCsQDS+KGyfSRjq3tWiri+wZS8o+0j/qLRHJC2eo2xHzJFHwy4ZRC7rLrn8UdMNZBIeMnC3X+HdYsMDeB0RlGt+9+kQ2ON2u71z2PB3jpjwDtndopAbDCR0UlW1QSMpf8UaoSyHCr0u4lK7smsTrQw8E=
Received: from SA1P222CA0087.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::20)
 by BL3PR19MB6537.namprd19.prod.outlook.com (2603:10b6:208:3b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:44:52 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:35e:cafe::51) by SA1P222CA0087.outlook.office365.com
 (2603:10b6:806:35e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4DF6B406557;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0E430822544;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 04/10] ASoC: rt5682: Use new SoundWire enumeration helper
Date: Wed,  3 Jun 2026 15:44:37 +0100
Message-ID: <20260603144443.593230-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|BL3PR19MB6537:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 318e6d70-d002-4c33-67d4-08dec17eaa5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|7416014|36860700016|22082099003|18002099003|16102099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	A7s7pSAebKIjNXH6btoDqR5FuBTQcHFrHIYY1zj2KN1gUec4iLP0ekyWoSoQIrJydLZTvlCYlUZnZVQ2CC8AgST/wV98jiGRY+8MJ0zY9/9gpi0yq1oS8L0D0Yhh1Y2oQM89F+Vg8189AwFtwjcmYmVNmiTVN2yZ+495Mc4McdbWRa+VlHR2Eyh9M3z276TEZlJ1bjK0BAP+kAO3LCV4w6nvmkQSzkYcwAv/+PZBeAgNrIvFmPgANE7dFLsJonBEGkO1RBDI1g1pZQNHhY3soawdzxBuokdq+UQLvtRymivQzGGXQed/62AzXy+VO0Ter0ALyNpHhn/m/zDBaltbPDf8kGDkhjX32u9Iz9eRwwzQ675XbbzIbbJzzbj630Wfdp1KD8Ha2cXJxVwAWif42mYbCSeT4CaUIN16N81/3fd5ZuNgm7NeoDlvxXze9+5AGAKCoQDmoSyQWdw8ehKmgzypSdI0XHRS7HkVLlC8vtmqfnA7U6pOgDWutYw4l3vQG84yKSllUSpwxGxDqkHq78sFUq6XYLW+JYTsfv1YRtD4I8KAtkePh4+H0di6ENUlUmTJ40dwCcYo5TSU79kuhEki5PxmWwlIjYgyFpAwGq2KyUw9PUS7dR2ooRFLmitB9ozii9gMqxDIpVqPq1hSe2YH8JC02W4jkM1p3/6y9tZGnqqVBp9gEV14dExAC9/zI1b50NudlFRa1U02nRdUUhpQQ6m9AQLj2Es2cQCU2lw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(7416014)(36860700016)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+nttQtsL9E8DMmk1txI6/hjRl9B0qsH95vpOJ7tD3khgXQm8xQQUoh3thmf1S3pBHwb6U2kn1XP4i1GLRIej4kOEbp/OACzhsUvrcOBWqe20KqwBwwTNIupudV6NXuvINh9gm/8hMAafv+gPBmD4cxkYMshQeH8HEHBOelNgy+nfLvth7PQXV/liFkWNE8amBkbXg9ABbCuex31M54GF4TuQ1PdzBjEAEmwCKL9RwRvMRjFOD6iZ3j4XKGwKqta7ddl/oBn3O30VO2pGmBLxk2AlcxRtjRCE2qLlWukZHtqo5JKrRp/Oby0FdZZUW9QzaBlIxTvdgWlNSAHTLPid/JuxFy4VA0+dooNbBzOrDQLKp67FJ67fFr5G1qU0C9NhymVnGJB2p/SXOROP3eUS5BaUTpDQOLnelZ+n8dOQZ+OiGJGTWvf4nn+NczrV2dni
X-Exchange-RoutingPolicyChecked:
	iyjwkW+uRZzCEwHP5967P7o0dtZ0haStXTinMfpnmIruxFUkQuyBBSV1LRcvfELKcYDlDMFIDRUJ8qmpPbEek6WaN6SC+ZlB5Gb7RYb/Aqtq9Ec53khwrk3K/8RfkRUrKmW209/8+iy5zFTNaHF2iLqwAtmsp31AabTvyVPe6+MVAc8DUYGa3ABC/MwXuOmGzq3s5g0o/XRGA3lA6x/BTppjyCEQBPOoLznq4rN+P/GlM4V48TX+kfnwen/Uhd+Vk386q+azdLjEbNEg8bWG0v+YDgUTYjlOLVxCqxqN08m3Qy9IYAXYD3H9Dp68JW67ZLOWuVYTIxYHymoFBUn/6A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:49.8471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 318e6d70-d002-4c33-67d4-08dec17eaa5b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB6537
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a203de7 cx=c_pps
 a=/HvL1LX/IhLcM0VBVohJhQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=3l_c3HHteuAAOOvkCYUA:9
X-Proofpoint-GUID: tV3U2p_Otjl56UXnOvZF6fWflAKBkhLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX0gpmo/WgV+Ch
 Uo3lLJF/ZAQAmunXRdbtNVWNpTDCA4HSG+91mq/Yy+qCunMzkprkjSxeahChj4w5Tqqx/E3zZ6R
 MvoTlLKDWQ/I0m75E/sIZfY/YzOBpYpGU3ANbfV4Or5HQqFyMWm4VEyBz9vpqIKndKnRZSapyTU
 368z4u0SIYW3Dx5RWPZnILfhlv8x18V0c/0lNHlZZSxJeva7Jvolp5LGeo2wope6RJiCbcyYwqb
 v75mXdqWCf1oVjpPswAqtmdBvqixScFHlgQrnwZX1oQfCNvOoJqdzO4O7FXqlNrxWLdmZ6/l78M
 IlOc4QwZL3eiE1wFKfRUuhdpjsMQehiaNvwsHEP7/XmSEbyA7GAYSNw0pLPudtKtxWt01a4N9uH
 AGqEaxlIM7yqxgYaznGP798OtbLEJdgWnjMn/atOgpYlGMgBQkrO0GmHtsrQ/IiX7Pnxz9a4Bwv
 RXkT7Ggo1xjD8lLJ13Q==
X-Proofpoint-ORIG-GUID: tV3U2p_Otjl56UXnOvZF6fWflAKBkhLA
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111018-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,cirrus.com:email,cirrus.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3DAB638EDD

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt5682.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d39f8e4f3474c..4b82e07d3b2c7 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2929,20 +2929,14 @@ static int rt5682_probe(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	struct sdw_slave *slave;
-	unsigned long time;
+	int ret;
 
 	rt5682->component = component;
 
 	if (rt5682->is_sdw) {
-		slave = rt5682->slave;
-		time = wait_for_completion_timeout(
-			&slave->initialization_complete,
-			msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
-		if (!time) {
-			dev_err(&slave->dev, "Initialization not complete, timed out\n");
-			return -ETIMEDOUT;
-		}
+		ret = sdw_slave_wait_for_init(rt5682->slave, RT5682_PROBE_TIMEOUT);
+		if (ret)
+			return ret;
 	}
 
 	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
-- 
2.47.3


