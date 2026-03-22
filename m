Return-Path: <linux-arm-msm+bounces-99052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGXhOtITwGnMDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:07:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7B02E9E8C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAEBA302EEA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 16:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63119367F46;
	Sun, 22 Mar 2026 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="BMP97via";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="BMP97via"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021075.outbound.protection.outlook.com [40.107.167.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F22874F5;
	Sun, 22 Mar 2026 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195415; cv=fail; b=tKzm7SbC76ckSBvKCDExOYrq8YZkYrbpa5gluLiPcFlYf4cAEr/qTosG4t1z4pmglxX9CZgmvrcobUdWvE3btcnqfA54caqeOM1CyfsIE3YbNof8r+gmpYhGF/K5XEFboiV355jhcnOxuPqdhsYlObhzsppIUGwgL5ij4RaDUp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195415; c=relaxed/simple;
	bh=e1cJVs3cOy4V1cuzu2tbo2us/0A2scmhtDUsDNJXLI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KRb20DC1eylYUs5ovXP3kjZKQTQmvhoy3JxP96URftkUc3WIHzI1tnTXbw4PlDx73bG87hTOFvQ/WIww2GH6IyfKGOz1fgsh4O9XgOY7ig644q78lHNyUVHnUOgdq0wDCQUQ1g/TK2HJ4UlRTxVGzlNrXE4dveU/M76H3ec4hnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=BMP97via; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=BMP97via; arc=fail smtp.client-ip=40.107.167.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alwmBwwAI5thbdiAdOk80ZBMUmlnMkw282fY7Aqcqj+Ezw+E+sGPU0A6ui7jYgRKru2rc6Y7dBHxkIQmXmRRstaUUrbF3AJibmgdfsOQexJn4zvV+HWnYb2/9pjxj6gn1R7iSn/RQFEe+Oz8eOkJZrVQ9wC4RMHoWqJXh8jxq56mQS0iZHy4JZLOE67h1bojlIygmFw1PyNODLEr9DAufvIo0TwuhPcrAi+N+dMnOjZJHRypzZcD0AcRG/HHIL8fsRqrniT0wChNCVrKknlYmOIkoYpDst18w9yYdOU8B4/iuc3RPe6CU35LWMleFHkUTMQuEfm1yWNwB43wczaZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VI8cVPgq6aqp1bDhH+jNuC5r8MvAOaxSu9t4O+EZffg=;
 b=iPQvh7fstb0vpQFDCpCIJdg1Y+G/WewpZcFOZ6Jmmhlx8imQ+tqVD8wmD5ad9Kl97KbDt8xA93qqHXCKrTnVtSNLRoSHNRJP4JahrZ4XXhmU1ZSmlQEiLVSDKVWKbqDRyhtAiaMIj9+8DStnsQa36LIjQSMDxemKcV3Nq8zMO57yoomiNhZxW7nXXde6wZhGQwpdXGr6z8CqCIsuiD6yUpwIBawHgEp1kjw1vrJ8H5OESnkb98FIUelBAEkvsP5bXf2vhjtkBKG+g0RLfRLtK2c4xMs9SbITRWBMzKWsOgsNDyjiM5ABMaR7/Cevm40FF2F0rWlXc/h2Ag+WGBtjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.103.219.121) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI8cVPgq6aqp1bDhH+jNuC5r8MvAOaxSu9t4O+EZffg=;
 b=BMP97via3ldbdSfaXNJZgOVVPyV1J/IAla77ZIz/kx7vgkavrBnQRW3fjh9CvRjuTQ6LnNyz3GSmW1eIu1QSLVLTrMH2V2h//RD4kWiMoQq2rL1OLYzBwNGEqjtuvcHQvD6IsnWwNbDrfDNlkWtc29/vuUbK2fco0DUvkIijlW0=
Received: from AM8P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::7)
 by ZR3P278MB1428.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sun, 22 Mar
 2026 16:03:28 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::20) by AM8P251CA0002.outlook.office365.com
 (2603:10a6:20b:21b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Sun,
 22 Mar 2026 16:03:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 51.103.219.121)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.103.219.121 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.103.219.121; helo=mx1.crn.activeguard.cloud; pr=C
Received: from mx1.crn.activeguard.cloud (51.103.219.121) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Sun, 22 Mar 2026 16:03:27 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=BMP97via
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010007.outbound.protection.outlook.com [40.93.86.7])
	by mx1.crn.activeguard.cloud (Postfix) with ESMTPS id D01ED100F3D;
	Sun, 22 Mar 2026 17:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI8cVPgq6aqp1bDhH+jNuC5r8MvAOaxSu9t4O+EZffg=;
 b=BMP97via3ldbdSfaXNJZgOVVPyV1J/IAla77ZIz/kx7vgkavrBnQRW3fjh9CvRjuTQ6LnNyz3GSmW1eIu1QSLVLTrMH2V2h//RD4kWiMoQq2rL1OLYzBwNGEqjtuvcHQvD6IsnWwNbDrfDNlkWtc29/vuUbK2fco0DUvkIijlW0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR1P278MB1326.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:6f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sun, 22 Mar
 2026 16:03:25 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%2]) with mapi id 15.20.9723.022; Sun, 22 Mar 2026
 16:03:25 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@linaro.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v6 2/3] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
Date: Sun, 22 Mar 2026 17:03:11 +0100
Message-ID: <20260322160317.424797-3-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322160317.424797-1-mstoretv@cern.ch>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0016.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:26::26) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR1P278MB1326:EE_|AM4PEPF00027A5D:EE_|ZR3P278MB1428:EE_
X-MS-Office365-Filtering-Correlation-Id: 38928193-73e5-4a95-2c98-08de882c8e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|366016|10070799003|786006|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 jmb5J63fzI5084ma7fgmxZai1DDS0D6RtmAbc/k3vBmrIYyz0vHBH3JnZh8xj9hbSs+tvumwU2m58ONweJdeBfLfZXANyL0tLR/OWulOv12ERMPnQlsjwsL010oQwUe50k5GY59WBAvxg2x11mGEyiaNGq4B8CbVmzAZm5aC2fcJEG6v77j4cca8ilSu5318pszqVh0O/uSLyCJx25UJiqNN3+1erj3LVm6zHseeKfopAXQ+13o/jDumSatbkkq1+mADplBmuvZ9SZS9f+Swero8aH3e5EdBpoREAPxG9mHN06/MRVoMyJpvj6VFqLnppRmAKu2K72aWvxpFOr0gcplywD8vewIPyTmIHFd3hxXqgBbnRn2MuyDhH38dX19GmMB802zTFlbk74PoksE2MjXnGZQTHIONNx2oQlJGR3xIjoIzBiwkpZKgstHg/0FYTZ286j1dXBC2I05jsCNbqarkDZ/RJwOxyXWTGleOSsGmCRzZZ4fxO1XvJ4QZSVXlurwOHRVqykzn+H2QMGKi+DekgnQZ/mT4CyvlHI+5xsLLBvjh0iHSX13Cvl2BB1i2/NIaE2MpSLuZ87D0kdPVcP8B5bv5hfAkIH1mGtE9rMhhFIRrLR69Ej1s0bHXFEhor0rfKP5N+U7gJrR16C+oLmVYjllfNhubkwPt3ccSex9ULUyOgUheypkkPuXkJbrFvV/C16j2201BhwAsu9b5a/OOctHLtnsk4Gs+bwD60Zk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(10070799003)(786006)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 VWdEfqvdMM4S3D/89wJfKhvbJKyIMBmqoLDWLLDr9nVjsPSXDDcciRs+9WroK3RyJqXwrQ7dv3WgZGg7X1SWDYAgj5brl79FTEU7/zVLArH3F004xKNB2Wgjjk9UCR+SW+3bnen9OKN03pVXot4uXmYQhJWIvdnBBH23ys2L0FgQVeiIavw6mU2NySblL07EWshcfZR/v8snhvD0dPQ6HYdB5RFUBxDzUOMchDXQM7quNMhrjGpQla7a+v2nOAk6Xfl036w7FZ7puTcP3DuX2pCZDy2LyE+KcNDd81bLTmKujCxQA9CNFsr2LRW5HfSlBj9jzYj0eTiosqEwb1CUmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1326
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1884a32-965d-4ba1-2104-08de882c8ce6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|82310400026|14060799003|1800799024|19092799006|786006|36860700016|30052699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3UU8qI5O8AxHEyTLbsePs4i/Jd7QjGScD3Yu8k9x2UMp1iOp57OVFMTTi4zui1G5FUSwu0LwVm/lA5M5Nz/uwPmd449yH1blzfBjQPwRNHLPPK4Y5apS8K0Pty40ioLs3+Vq8TVjAkJM2b+6Ixosdu935Z6MeGTganbi5sCrUlYRcBd2mcd8Weys+mywbxnBMeP+mOqfAcEtpdJsaite+XZG0M4GvYpCBPiWIoXfToe1vd45KZCWgZNFn+nx9Q7WrStnQ0EcxMZAjmWOcIj0dZ0tqHuzHfAiJ1Z99OYDlVwblUxgfLfCFDogz+QK+EbwxpEh8VK8mIg6uIudiAE1+HPDOS1UgtH9LYe0J/t6qdXGzPwfydFAjsjuPgXaCWJVZE6Ys6LgPLQClKu4CsxMgAWmlkEIxitdJ8N6crpA+CdQOPbtw5XUsDm73c2qM4kyBP1PTUlAtKZryt8423C6oCEOQulUEH5acfWe0n0NNnYP7o4Zndc4pkdiXOfjqkXE/LPMqwt2N5g5HffSc+TZhxFFlVgR4KNKXEqipUt7LsjFh4MEIObqpMbcg8vVKFl5ixl4VYJzL2lg4ZGUv49DvneLqmSqDFvuqlkZaMAIBsoEHb6a8CBAKBpoEkWEF7M93BaZeIzDodzs8x0PGjTgC9EwNcXR6j1DpLYRUic0TDCxV+LOy4XpekGdiQJDsh4z7fUwWtNZ6syGi0qCXCenvpR1MIahgFw9/io42eNaOiAFJLxU0iDJ8RynxzUmspeJxd7LLNrrQiwlc1dMRDJNvg==
X-Forefront-Antispam-Report:
	CIP:51.103.219.121;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx1.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(82310400026)(14060799003)(1800799024)(19092799006)(786006)(36860700016)(30052699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IzUI/rIuYwV4lVAYr1pf16unAaeS77+ecIvs86oqkNL+LGrXca2/dbR501QJ/AM858oUvkWp78ATchrCo/vhM1vEtFN8er89vovSHljTTgN2CTipOZHaE0hphhHHaGZ+VN5vg3PjM3lik1Q2RwauT0dHuDu7TuJY5bsjRdspBiNuFG2Cd+PoEfd3YchQZulD65nv+/+Sx9OCdX+xfX1PdXgRsvEjNaelUwRWOGYzWlaLfBrFSAV3pi+6PKS935aKBGfQDI2BEuVmSzyycmMC7fzZr9OYdh/isu0ezjtuA6RtWWuQX+2IfNb27He0bFVgfXSfKaSVZqjOJI0DXVXAZfBjpZOypTvx/7N0meKo5CNpcnrVnPzAtlzMIlTsvgcZG1636Ab5bwqrV2apeXiFgc0qyVFsDWpyCCeybG9MCjQcv4AA8JbGB4dIKjkb/7jH
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 16:03:27.7952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38928193-73e5-4a95-2c98-08de882c8e32
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.103.219.121];Helo=[mx1.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1428
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99052-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cern.ch:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9A7B02E9E8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Marcus Glocker <marcus@nazgul.ch>

Add the Samsung Galaxy Book4 Edge compatibility binding.

Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d054a8f56..b82ddf167 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1129,6 +1129,7 @@ properties:
               - microsoft,romulus15
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
+              - samsung,galaxy-book4-edge
           - const: qcom,x1e80100
 
       - items:
-- 
2.43.0


