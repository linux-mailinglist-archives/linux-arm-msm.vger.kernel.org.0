Return-Path: <linux-arm-msm+bounces-111016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ifpnD1BBIGpOzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:59:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FA5638DFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:59:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=GPyvHUIP;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=v+C+aB8Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111016-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111016-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BCFC304002D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1F344D013;
	Wed,  3 Jun 2026 14:45:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAFD3B95E3;
	Wed,  3 Jun 2026 14:45:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497949; cv=fail; b=d6+ayRK2LYhqJbpJPp8Li2vtkVtcx4l2eyeYzXSnlPXOCGZQzkXDxSYsOYoJ6IR/WZXC39sTw4DH9pyQqP311q0SrNhLOUZr7yirvhlps0l/fQPQP64iAVLfkK31HobF0Sa3F/8puqTNePhMuF64ajP80OoQLpx2VscQvRqQtrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497949; c=relaxed/simple;
	bh=XQIA3Y+Bgbhb8o6J1e9gbKBO6HzEWGK9St2MPr78I+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZWSpNj0AdIQTajea1xiYDKHGlTkla+pEhRAdJW2Z46apoFS+J2EeKlDpronJPjqMnNKOiHWWToRWflI04YZKVO7w0FB+zfyEGNvoOXNDflSTg+UmTPp5M9n+oKB3niy1rbATPy5lzIhW3eUtiUx0fVheSlG/p1AigTpWdv1MM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GPyvHUIP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=v+C+aB8Q; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ESsrn1297281;
	Wed, 3 Jun 2026 09:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9pEW5LtBhGHN8EXN1xMBwok4xpXWMgfVn8jgAFQRZbU=; b=
	GPyvHUIPbPSTgAJhCsdBsWasnu8W8Fjch4tjIXIM7TTNsscYXCZG6YAVsaiby2hv
	+2hkPhaizETIqGozWb4Bg+yM/Mynz/ngv7KoNrR8EOw8/FPB3gov1Fs0NucwmEc2
	6jNKOx2t2w9bnBDmI5H54GB4/zZAY7btOIiJ0Bry9HirffSapu4VcRphmm6eRi+v
	zQSCF3gad6wd93Xnsz1tk990uc/BYkDT3rTEabcncc9qymYgU6OGQIzq0P9s4S9y
	c2e8a/7L6hqhdy0ceYnr6CUXn2Z9S5SuLYBLvQL+EYaQOSeyPIsVVmryXYBXlBSV
	ihHrjfHadzP9BkRgBL8pzQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020123.outbound.protection.outlook.com [52.101.56.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa1695c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJyVlKKJRdKltB1syAA/BmT1kYleMyoW/Hzs3w6YEaBLvB9f99ELIK46DcPeyAAit2Q8WoHHA6gaY8w5gc/zNz6bCXPDsmYiFXQqT52kbHoMGUirxs5yca0bvkePRXU6pUj2L4HTHbF1x4sOeNd9bLNFKXfodENTWtDbgnJ3vWFK36ewq0LmT5Z5gQKQQqLpQ3OFHCE7Tc5Y9Ruy2F6DiY1KzMsFVYT+af22P7RqUV4XbW5rQpBAt+eGGP3wxgUt/0xWXPYg4kEBo6wA5RoDQuWlZWjm0r+wf4GROx0XWh4Z9JTyqyO2ex8gNhTpvBip0DPZ6hiCsCwMvIRSTn+tOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pEW5LtBhGHN8EXN1xMBwok4xpXWMgfVn8jgAFQRZbU=;
 b=bkaNpV1XmTPpN6dMnpTh6pKq3deazvuChvVr4kVAQ55AMxjG7YT2TNyTDhO+G2/xDsk61s2VSAt5GboBZW/u3Vnazc2jQGfUHNLlJQfZlc7CgX3iqFE7/bWQJqOi2BXAf1UodI9lVKOUYijdP4l4E1ZquDfRd8xbKO+Q9otQi+zJdQvwOJ2KLT8L5C7ljPa9Z28aT5jq+D5VY42/uOYkTF5h6Id4iO7BTCThSjlKr3+TxL0KpLVEZKEx/nPeQSJ/Mo3IrCItvlKpXwAJo7qLeLZDfXrweZdxxDELxQDzY1EaQyBmmFNPmc0CgjK0gDLTDpfprPtpPLQ6ItYr84ba0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pEW5LtBhGHN8EXN1xMBwok4xpXWMgfVn8jgAFQRZbU=;
 b=v+C+aB8Qh/w7KBwI6/Hu26Yo4OkWDG58As95U0ea1HecZ4saajxn71sghbIkh0HYvBgoyVh4Pm/Kd7s03j+xL49bJTOYocllm1vHNlgLPW/lCbwMBl9DL/qLptlP1TAVPRLSGZo2uqst0lfmA/zz+a+J/E6a+3dtoPfg0MqMSVc=
Received: from MN2PR07CA0024.namprd07.prod.outlook.com (2603:10b6:208:1a0::34)
 by DM6PR19MB3932.namprd19.prod.outlook.com (2603:10b6:5:22b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:44:50 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::a8) by MN2PR07CA0024.outlook.office365.com
 (2603:10b6:208:1a0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3F61A40654F;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 028B582025A;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 01/10] soundwire: Always wait for initialisation of unattached devices
Date: Wed,  3 Jun 2026 15:44:34 +0100
Message-ID: <20260603144443.593230-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DM6PR19MB3932:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: badda406-1bca-4dc4-ac88-08dec17eaa44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|61400799027|18002099003|16102099003|22082099003|11063799006|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	GSRGzP4Z/3JjaL6Lkr6qKqfdeQ0okHpGLyiN7Dsd1ZETKICyY6tnuJkt4Ow82Gn931J35vGxskq1bbm/XUyusdjW9mEVPYANL5bsZgeoWs4KD2WojlPFRR/7oj6ab8C9EQ7aRwvoRroJ+47eLTp9yE8dQs8APeykcif8oieyjHIdypLEnz1dAuC6NrX146tpCAXcJ3szHEk6PgF96dK46rSaJeMAIv1Rs8gpK+M6UIT6Rdm8AqwQWyzwxQkph1rPw5vE9hmNv/qOjacypysAp6MemCH8y62E0Vl/2mnx9kNpQypD3WDK3xDL/I9utNKz9vI1c9Y/hGhomDMKiC03xPyHxbsqgwj4mxHnkDUsoiKOuXYLlJjguixOPsh+TUoIAzO2FOtY3wUdY5c9OW6xcBKWkn1cHB+JxHo2LU39M3BrkN3Rbiktbf7YSUm/9wqyj6gDzyzc8QZzVlFlDZMVCfZQLjg7KPBBzUdpaJ07WlVxel92YjBIK2FhDsrJcQyBw52xOVqMetrKcj2QCQzKx6z3j4wwse3iZ4YxSzejqG7Gw+crkFgvKqOBR6xeD2KrXSfE16RhZtRsxJK3tHtQhVPRvDhEWgOk/zNUMeYC1EWobfGlhc6wghbi/OYB+xwESaxM/hAIe+tseldVK7c7VRB+eO25oKxD049HF6jTlUeTLfWJ/PO4RkcwyO9gdjpxSSBmaPv3KgbSLopnT6D6mnn7N+gG58iPviVncj3Maac=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(61400799027)(18002099003)(16102099003)(22082099003)(11063799006)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1KZABtse15kn7U+Vh+5hgZtLDkHQw2b3U6UGEOODlR8yvZ4WG7YPrJNIQBApfEmnPfYRBQfgAII9K/ANlvwwwbLRGXPp0zDaHIW7fRXsXcCNyLuRACasDr8YzZ6vMGo62+E6Uhi0PcbcVjaoil4Y+vmJ+mm4wwtb+d7Vmi7U0pWV7tjunH2KMDqNBU9+CvDlwQREtHGUka7z8KkFTxzrRzbocaDmYvLFnN6tl0IHRZBgz0TG01J8+8Y/qQ5Dc+qZJRJCn8KIjVLZV62IToA0ZLnoeUyKGlbHk5mfLpqCBnYP3SubLbxg6amHJtLTJzlgjkq6D6heP+gXGMoSHJVdoBSES+B1XaL+QupZQBl+McfqJy5JVxFv83a3jdpipQoqNOzT4WqV4wyiigmGFZYYgPtJ3QvPW3+4zvwAy3SnfiNpZq/AFpYlrzlmMdBDbNn7
X-Exchange-RoutingPolicyChecked:
	KTCoyTqQ0BoUsv9x8pAcAGeR3h94C2HgeQPEgQmrRABi5eaAyofj5BfCfU/qniWG1cDfNleXCJSSlOaz/se3WLX2VJ1zGvNEZjCoz/yUA5Bx6n20HgKqof/bygG33VxlaEmbUl7LxFomPuqGTdHt7kglCusx1btJBppWpEExOhfkz41FoqpJA307Lx4cz9kz7ZHWNFw5I/IRyu5bdqKq1qZa/iKOLzTISBBeKpnNvHXuW2KpReBWeUcftj64IdRKyk4YJrQM4CxpYTQ0YsKzy2fue4jIbY3qsRFHC6onV9/qwPktK4n2w5SZ71oY/2qaeJHqMnSgaPzeT2AUiIBCmQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:49.7802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: badda406-1bca-4dc4-ac88-08dec17eaa44
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3932
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a203de8 cx=c_pps
 a=Ww/eyc9HJI3lJRrv7Oj56A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=CWTouP-59cMm0TkFMMwA:9
X-Proofpoint-GUID: IhEi0yxUqkCO5tcRclbxQHjXjCxJWDPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX4sutleZt7nGf
 izdI3dLaWKSPaAaiyUoB283GNmfvb/txi5c/FXWHvS4NwzcABiIaT5hpe/AvKd46ORtUKbFgaom
 jCizMRx2t1iyo4d3jd2EtZXKJaOu7Dl825w9YLXNCd0jv+ht/lG5i7V/zyUUTipxXQgGGlHS1GK
 wtfnRLprsWQTD67Zyf4fFyks6qSjsL/lDZ+AVCvcqRd7MELpx9D+JPTxdVO6j9+8lGivda1jmVB
 zPGHykdaD70N/++8eyvePX6TGVp83V0S3yuD+0ML6mygX7ATx7izEbzzmmLWiLBHuwx9CEte5BJ
 fXKkZlCmAGwATXd/FnvnAZVUqVP2G//gUFNpbuE8Rg24ALUVNgsIeoL4lGJzkM4inypawE33aQ6
 ZDvHg6zPjZqpOIgWZPeyUEKvk9h0VHSHxmvqbOzi8jqtzoAZCG/3KfAkwiztYgeuWyholtiNT3h
 MmaJJTOVKQp9U1ZL+hg==
X-Proofpoint-ORIG-GUID: IhEi0yxUqkCO5tcRclbxQHjXjCxJWDPL
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111016-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cirrus.com:email,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1FA5638DFD

Currently in sdw_slave_wait_for_init() the waiting can be skipped
if unattach_request is not set. Doing so was added in [1] likely
because the core used to do a complete() on the completion so
waiting in the case an unattach hadn't actually happened would
block for the full timeout. However patch [2] updated the core to
use complete_all() which means that the wait_for_completion() will
now simply return if the device is already attached skipping the
completion doesn't add much.

Additionally, unatttach_request is only set if the host initiates
a bus reset. However, the host doing a bus reset is not the only
reason a device may be unattached from the bus. Other options
could include the driver probing before the device enumerates, a
sync-loss, or the device itself powering down.

Removing the skip using unattached_request, doesn't cost much in
terms of efficiency and allows the sdw_slave_wiat_for_init() helper
to be used outside of runtime resume.

[1] b2bd75f806c4 ("soundwire: sdw_slave: track unattach_request to handle all init sequences")
[2] c40d6b3249b1 ("soundwire: fix enumeration completion")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index ea3a24f805c00..b7bdf19ebb42e 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1386,9 +1386,6 @@ int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
 {
 	unsigned long time;
 
-	if (!slave->unattach_request)
-		return 0;
-
 	time = wait_for_completion_timeout(&slave->initialization_complete,
 					   msecs_to_jiffies(timeout_ms));
 	if (!time) {
-- 
2.47.3


