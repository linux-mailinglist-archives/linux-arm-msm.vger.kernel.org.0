Return-Path: <linux-arm-msm+bounces-99051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFRGF9gSwGnMDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:03:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB752E9E3A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31E883003D3B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 16:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E6936606E;
	Sun, 22 Mar 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="KEUWpJBg";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="KEUWpJBg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022099.outbound.protection.outlook.com [40.107.168.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D935949;
	Sun, 22 Mar 2026 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195414; cv=fail; b=beyQB3YCjZlSXvCtRK29u/08MXjkTlweLZeTPoaFdgCkJQ3YSJl9aqOYDEBz+drBqcQS+1WFoomS96jkDip0P234IWwoiEqPUc3MVTcCg6nHEU988p6JJLjERUC7A8nkO4aTcJN1uqQe1xowoh2oqb9PPqshJ0S/qOAyDBzLsBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195414; c=relaxed/simple;
	bh=2drpDVT7/FgU6MDCyoXlWlNjI2pT+W0rZ7/4qDyaIAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HQXPPLuLU7OLcwGTFrxdFmKIfcqMFtX39umuNTavPexf5/IgWO6WCTO7ID1XJdhoDXKqeuEcjH+XrPGmmeWhsIaUDpfIGP1nv82lOhIEbTE8kssGbChgRpkrk5nLCN0zx6ZrvbZPztPBrkh59u+XlO9LVnsr3o6vZXdgnx7xBjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=KEUWpJBg; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=KEUWpJBg; arc=fail smtp.client-ip=40.107.168.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVc3NWz6Fb7hPX0urlf0s+lZo/Tm0/w03Vtr+ZnYuXqorj1kAlWTEhrX7qlNI2CL5Cyln0QLHrPnZxsW8DeVMCzPS8BWH2R9Jo/ny5r+GlTitueumcUKjkXC89jza6lVbPV8DFUxV7HanssOJnMGSAG4TY9yhThIfP+trzWyWXP5Ua+L7yHL6qTRZ+uT8LTrLB5t5FO3u9QK+uq/r4n4agww0MIcgPOswj8isDefXhjwpGiZ0XZ4ku21S+do10GEhkmB/b2Up3BxTIcKRzlMKp3JWhRqI1HuDEEmVjyGQEa/3iyaXd4KWCFmdrkg5T406ShBsfyIzZOq4on4GcVo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E4oq97rrVwxMNfT34ThWrGrB9kno7T58j3+/HB+uzQ=;
 b=Jo5iEo3k8XwlSDzimx4mJyTfBQMI3xouqju+3I23LKbLMAULu+uiJEjbBtga7b8WTTddIERZaCxyiDoLbMxRSpRtYRjx54enNd8M9B+fPTG4VFSaoXzdoMnAltr1PpVrV4e2S80ZEcgsvCGrXB/MCR/Xg+cyrU7dFfE5MDeb7dOu/VdBq6QRc9HHqhiR8REFZvlmVdjL2Mn2/6a5mJ34hkfW7e31QeWvgljCWM95hzZdg14h/e3rtoH9iU8dvI3nXRMXesLsQP6p6KTqAmKGc2vBUMourKvzGL5vsqz6cHH1f/kp2kzowhK4naNNoRYDCqNxzeMaB/TVoZcE4xboZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E4oq97rrVwxMNfT34ThWrGrB9kno7T58j3+/HB+uzQ=;
 b=KEUWpJBguC2HmxVaLSho4LS9YCpI79vp6bLMV6YatBMydCdC4tq7NdQtLZbgm6GNWZUDxS3V3A2bQUU4uSHnRnmfIyGb2mWpb4fHtLi5hhh8eM3fHBgeQnS5HyZL4Z1CPIWk0ctdP698YyQMLxeLoLkLSxSfqyvMELnwvlxsz3k=
Received: from AM0P309CA0006.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::13)
 by ZR0P278MB0089.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:18::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sun, 22 Mar
 2026 16:03:27 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::60) by AM0P309CA0006.outlook.office365.com
 (2603:10a6:20b:28f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.9 via Frontend Transport; Sun,
 22 Mar 2026 16:03:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.208.138.155)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Sun, 22 Mar 2026 16:03:27 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=KEUWpJBg
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010004.outbound.protection.outlook.com [40.93.86.4])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 897827E1D6;
	Sun, 22 Mar 2026 17:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E4oq97rrVwxMNfT34ThWrGrB9kno7T58j3+/HB+uzQ=;
 b=KEUWpJBguC2HmxVaLSho4LS9YCpI79vp6bLMV6YatBMydCdC4tq7NdQtLZbgm6GNWZUDxS3V3A2bQUU4uSHnRnmfIyGb2mWpb4fHtLi5hhh8eM3fHBgeQnS5HyZL4Z1CPIWk0ctdP698YyQMLxeLoLkLSxSfqyvMELnwvlxsz3k=
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
Subject: [PATCH v6 1/3] firmware: qcom: scm: Allow QSEECOM on Samsung Galaxy Book4 Edge
Date: Sun, 22 Mar 2026 17:03:10 +0100
Message-ID: <20260322160317.424797-2-mstoretv@cern.ch>
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
	ZR2P278MB1053:EE_|ZR1P278MB1326:EE_|AMS1EPF00000093:EE_|ZR0P278MB0089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9bccea-f221-4950-c477-08de882c8e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|366016|10070799003|786006|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 LpTWzfPNHyh/cXa0BWY0frSP3U89cEqXrcDLddD8o4/iGSCnJdEYZ4xdeX3D23SebTc1pEuHhfwnOZde2kcXDR7eKJq2+H6Mr9lT+8cQefikW9z4ZlbeicY5iyUCzQGrGUKCtgcuxyXyidjAhzCqH6+2KAajnmGCj9TOsk8dEDHtcmmvlmNeXapc/uVhKBYW79dyXencIrdsYNQtoSJZ/Pfs2NYmsYDt/jTC6ppY82ZZ2lSyPXsXySCiMISkIrP/wxdgofPsvikv+SjkOHnE5sS0/8XlDRkbdLLUYSjaZ1ceFKCRXVa4v/wWoh6I3Rf2cCjObHV7DQOtECuW01dNzYOAlJlUTzrr24JVvjXSO+0ofmYGgpD2TuepqW/vq8nMJL6DosBWt3Y1IKwZmk6O/Elw0cH7V4t+EH8ioBO/sSZ9oS4GXK0WoUtA//ajlUyjqhWbOQJrVmEhv3TUmoLk49fj7qCkdIqrTdEUTLQeglzeBdTRNBKEifW4Mutr/m/eBD550DEexxigia9r7G00720YH0cPzTEgxpBr3ZKdgkQoInP+tetL8mgQsBFcAPQld2hykGV67149J7jN6ICfGodPJcnW41BN4ECPtMseca0m1BKl/Xaqh4Jco2M0Syajjsy/J45o6Nss/u2z4VvMV/o6WsLE7It4a02dMDXMhQkQayTYGagk6/gjcJ2fdtKzsDCXDVfU5kq7tyJHrXzt653tREzCssb3NuYxf6jHokU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(10070799003)(786006)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 iw0J1eB7lkfl7RzAj1kMnbKv7Lbcewd01FQIjkLx/fwntjVh3ZC5benz+5ImjJM7h5DEQLPnCjroxY4NoWi3RgU46BWrLm6EDe20g2B3wg0GqOCzj27wHZyMLuet9LdB8VOGnqJNslR4HHD/RFEuTOhoHienBocmNnzDP+QEBG/JyspxWR0zPMFVEvsKWqB3QE3ckNMvlDQGJTHtQxnPtxtRhUenxltar+5rVA7enYPqIDW3bLTPneblLUeC8htE4aQSYztrlRyZe2pc+Jl6731huecRmoyEZch2zA2GB5wiQw039TWI23EZYXInYICl2sLSVRBS3wihOsY3jO8YSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1326
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9542cabb-62f4-4e21-f61c-08de882c8c7c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|1800799024|14060799003|30052699003|82310400026|36860700016|35042699022|376014|7416014|19092799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cmfUxKYAK43t9iX1NkpY9W+6JhYvW8HOashRdJ7pKusBJV0jW24+NSbDvwBVN9s3Nn2h2mqq+itKiAIiz8XjcB/fozruUAsE2K+jbk/nZx5tJDHpRdHl2LZTSVCs72038a3jcmD4PSFeFcdn6a02ZAXLb/XzIiyCNWpd1DQEjyZ0eWXY8FZMoDuF/EJFJ4JR+7AIgrHGcUV/dEEAO918LjHRJngg9vzq5rjqR1DzLrOXFo7hcjKzcQCqPTIAKN6Sqm87qwt/Iyk7KaZaG8PLj4Bw5fAxDMeV1sJovBcSphTzkvlBVKyRMS1Fkws4ObwmPHqM3ijoI1c4i4/sNiuwNvyNub2fq1z5toukxZrXtPr7/1pFTAlPiDW4RJfQsZSQMVMtKmapLLTE5Mb+Ui5DYNpiqRJLs2urfT3kER1sa6YaulHJtUYrv9zoIKx0jcBDDaTqFUCKJipMHqO9CDhIF4ik9WRc4C4T5vAca+khLMkx5qzGn1JZl7UJ/oKnj51MRTdheHL1uNVPQTXqYJkDlfZw2DqkMjGY0Q1bpv4L3oObxzol+UGRdsN4iR8GEnW5VgzYCfHl3V8Cb0GJFwwZnYya18xNKY9dhcFHGtI36dvbYa3p4zR6n63GW8m9MyFV7f20R5vEh6+8GU9TbmMFLNdJspWyN7ciqLz201oPOmhFKJI8LjxZuwAJP8WYfN2V41dgibK/TW9XR2FRmCgOOO1uhS7AovU7npxlgfhErOuDWSx/ymaXU2T49Uye1mhfrpXAydYMkDqWjZXj8tZIng==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(786006)(1800799024)(14060799003)(30052699003)(82310400026)(36860700016)(35042699022)(376014)(7416014)(19092799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eaWKgvtCDHEs47he5kfdfTMW61rdea9NGPyFiRvDEQGIhe3gjHt7D6a/Ze/NKECeZiXvL3iejOCGdTaZKzcXU1uvvXlEkGjyam7Wd5iA7MrIX3JX9CNZOQfPGl7fhEFCoqIToVYD3G3H3vslQPLnlD+ZWYcnxQCgUQEzNycu1xbZvnnW05uaIYdWzgoeMJfMKE1y7pSpL3yEBqvx1cf0T3JB9pNwnrfKpcpCWi+d2vw/sJwXb8GBsbtCcoTrFSGZrafJfTq+e6P4jevKROY3Wih9zXmKjOTmLrbk8V/GT/Yi+6ZNPwMTbPGoKsN7WaD2RCFF6o0bEd//dbkaBVlmZVJ09rZ7d9CJaIa7CeAKUw5K+jrmKZcYrpU1x4mRHV6GJ3IgMPGzVoMRAFt5uqW8LR81iZQcKaiidNdukwj/AVpD3ZQGAtrQJ78565cR/eQd
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 16:03:27.5917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9bccea-f221-4950-c477-08de882c8e13
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0089
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99051-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cern.ch:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cern.ch:dkim,cern.ch:email,cern.ch:mid]
X-Rspamd-Queue-Id: DEB752E9E3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 5c4375a7f..5d3de476c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2318,6 +2318,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
 	{ .compatible = "qcom,x1p42100-crd" },
+	{ .compatible = "samsung,galaxy-book4-edge"},
 	{ }
 };
 
-- 
2.43.0


