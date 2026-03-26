Return-Path: <linux-arm-msm+bounces-100150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCAJMjZ8xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:34:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5845D33A2B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF3CF306A7F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D5239BFE7;
	Thu, 26 Mar 2026 18:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="i/Vq3uRb";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="i/Vq3uRb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022119.outbound.protection.outlook.com [40.107.168.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26832A3C9;
	Thu, 26 Mar 2026 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549845; cv=fail; b=IE0hx6Diz0XGgaMld3cPs1zRFfUfo2hS5/ymMjkQ0vKeSAKu8/XG34PqxGulcrM2fpvXoItjmTxd8RVEMXj7Bc4HQCP9XVKnKvRwA5z8kYf7SdWKR7UcFzXUbbkcgfNnm439ejuopbyjspT1Qj+qYS5cb2GO3nXY4ekE5iRttz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549845; c=relaxed/simple;
	bh=TS+HWRJW9lMBAAT+nOVCJvHgXn0TkLzVEVBgdGwM2TE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m9ukSKiJE7v7awZEVdJwDIF+xyFb7zxYPcyo1Lrg5vUexdLXCk2PD3A+Q8KDDvA9xInd1ZMR8sxGDt2d/pl3I1GlWigfSAwTR6Jvsyl4M9Evu4neTduQEZfexgJBYdYOqHJ7hBBrNDSec8S0IVY/e6CYdQBT9B2P2aJZ3tcRHm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=i/Vq3uRb; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=i/Vq3uRb; arc=fail smtp.client-ip=40.107.168.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdfvNSuRFNtmVGeIvsufMlRbcw9Og7aIsCj2tp/LtEp8Qz5E1WrHhdxR8+FF/2ECTjZBfkBPEeOpKGkujhvTePiDI69rToO72TxttOAlC8xARA9TqRqvG9QqsY4l/IHBc5zRHkTTEnrXtbQFMG4eAhtF+xCiLtEfXVkx+ajySSoRn9TWmNwTvHXl043/hOGB0KL2Mh9Eb8DsMNu2sG2ysvqXcoPatVBLOTr7UU348pTA6Ud3iJDtyF8OMzlVmJ4yKdtoH2rcFYEFKfd6RAxQt8uIaFoHHqisqUA2zb2acjSOilrcs+WDAOBub0JusUQQcRXosQuZakrsfdYin4lZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBLajaTA3FXAQVjnQ1dhuqdIgBSzXVlGJfP3amo10qQ=;
 b=wbt8NmXXB0LKbZJoIQ5jARKWNlyqhWG/u0vEpfYctqKJYuvTdw0lLcLBP8bqf1ZJtTM/9D0fWRPxTSblf84Eu45WpXFuOBQQ0p0lieuGoaNzw0fw1qFdlFpxIisfuXTI934Y1zR7UBIEQdTK3YP5egahrSgO5s587VjMp9Q//32B+43YW4EDBn2+4Utksa8UYbbeqYG7/7iOSUcTDUIXfsXeP1RoCQBmiuOJ8NkOc8n6yHvQMvcoO79Sj+L1mg2GJ6w8fxXRX8+yPQeJrdHfxHWtUlQFLYySonYLmrYBpoky5KWYCqrYFA/FnO6yRj3MAta8vHN4zPag1wo2U3XvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.107.2.244) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBLajaTA3FXAQVjnQ1dhuqdIgBSzXVlGJfP3amo10qQ=;
 b=i/Vq3uRbDLY/iQPUqLSiDPfFJNZdWUuyUS1Jt8EtJGwbnhL5115hwtS2jClR9vZ85qlu97Vq+PT3E8BvkDcQI6xGw+6BJIUSDqZsO5sq3Dalr/MOto/utOfdHwGOepEJSMJy32DLrco/ggJd5BPO94q3QtCzhaPz+KwaxHO/S1M=
Received: from CWLP123CA0232.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::14)
 by ZR2PPF4A8D38F75.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::2d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 18:30:36 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:400:19f:cafe::c7) by CWLP123CA0232.outlook.office365.com
 (2603:10a6:400:19f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 18:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 51.107.2.244)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.107.2.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.107.2.244; helo=mx2.crn.activeguard.cloud; pr=C
Received: from mx2.crn.activeguard.cloud (51.107.2.244) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 26 Mar 2026 18:30:35 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=i/Vq3uRb
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010001.outbound.protection.outlook.com [40.93.85.1])
	by mx2.crn.activeguard.cloud (Postfix) with ESMTPS id 30DCA7E643;
	Thu, 26 Mar 2026 19:30:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBLajaTA3FXAQVjnQ1dhuqdIgBSzXVlGJfP3amo10qQ=;
 b=i/Vq3uRbDLY/iQPUqLSiDPfFJNZdWUuyUS1Jt8EtJGwbnhL5115hwtS2jClR9vZ85qlu97Vq+PT3E8BvkDcQI6xGw+6BJIUSDqZsO5sq3Dalr/MOto/utOfdHwGOepEJSMJy32DLrco/ggJd5BPO94q3QtCzhaPz+KwaxHO/S1M=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR4P278MB1867.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Thu, 26 Mar
 2026 18:30:30 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%2]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 18:30:30 +0000
Message-ID: <f6323f22-27c8-4ae5-83d3-59831b62b5da@cern.ch>
Date: Thu, 26 Mar 2026 19:30:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 DTS/DTSI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: marcus@nazgul.ch, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
 abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
 kirill@korins.ky
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-4-mstoretv@cern.ch>
 <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
 <40e31e2f-84ff-425c-a7e9-f2df4210ddbc@cern.ch>
 <892fe03c-f3d5-4b6c-b821-95dad55fdade@oss.qualcomm.com>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <892fe03c-f3d5-4b6c-b821-95dad55fdade@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR4P278MB1867:EE_|AMS1EPF0000003F:EE_|ZR2PPF4A8D38F75:EE_
X-MS-Office365-Filtering-Correlation-Id: 50614813-02f5-41b8-f48f-08de8b65c5c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|786006|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 v4NRQZ3CPO89524/ExCp053GwQI1y2tfGlRftnlNrUgjozxSaGuwoR3wOMNdpxRqWQDflIIuiGCq741xwoLOILTfCgdisykPbDnKavceliGD68aixtuDIfL/cByfeg7V8szlr1SuaeM/hFoI3tnxkIta/DUqIUh1s+LLFL5fd9xZ6lWBPh3vLWTDBTwvAkYezwwwsX9iRtaPSDMP2rwHa63u461rWrqMrpwj4xvG9fIz6nROKl6cx6dd6oMDlkFPrcXbqfjayvv1NHGPLCM9UzHM43WgtnVcK8hwHUzetkMYdTzh/uROx+xslTBDiNlPWxRJCDNYS/q0MA8qUzt1ftCTh6iMZe04KQ0QwAS0FYUjv6d9PW5ojquulyez1wh9+aCrtrQSDX8NRcEWUji3IWHwxaep+AFVtGkn6nxVMy0D0/E2sF9qmkXYX7QHhmM/Ut7J79BPpilSZZxolpwEemXEt8M0SqztqwKm5PITyXC56Xxfr5raAlwp73iHfG7uXYiq70hVUPf4F5vDCbIWQGzBfRpye5Cy/uIk6YNvpIfOLcvDRM6f89mz2sX6r8bjwBaDbUZlHt+TVLv0MLjvjPkpaZWJd8aWYtJOhkCbPB0KYeVJtcf5DcBUiypmkY9dchGPghdAo3POOrlQiwPwtOvmJM3YDSAuuqLWZHl3wB8rQNv8R4Zrhg7v1xRt/Q1Q
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(786006)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 I7yWd0LdLPi3UqlgKyrMWbe2MKZJy2KsBy99lMGWHvrtWSCsA8ptx7vgohxjnZfSRpvPppl2uUvv/IlnwzopGb6b9p2kjW+ka3Lwx/+7gzGBN9lzfHwyXQxFFS4dfCP9XBYVxNG/2t/tT/ekwAVB7YBkcY1Ya+lZMOovtmmqPcyYaHZyeONPd5tgIUrsVB6K0T5k6YaNfwDaQEnEKcnmEMSknS3vnCs8UdS7+GXvoWNPwlwrWoFQetaEqlhRZrCpV7+qp9HB2Kaoieai4sEvqjmyBYHATGNQuSZPcHtIWiVunhFDGXu+6fWcYFKOhEyin5R7FUR66P5A/yp2DnG7mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB1867
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34ca3595-2b04-4ff2-a17b-08de8b65c28f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|36860700016|14060799003|35042699022|30052699003|1800799024|82310400026|786006|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1A0leNVY3J/bO/rDl5VZWp/qiuiHqAQ5OTiSgNrrW2ogtjsRWRZkO++kTsl9fULhOAlKhYslhCpezOCtKuaWE+Tx5veeaEp4F/ht+ojuB+Ni1ZkzOZdsevM65ksrAszWurNlYrec51Vd2tQTL+jAH7TIgxukRIA3AxFC5+J5dvOg81j19qcLUzvFzGM1lndJUH7GAp5wP/BnTBJ9KdmzKXXR0HMAm51XQF18xZaVpIuwqsY1RP2h61VX1UZvznRFBYFSPw4NckZpTLuNhvl/6PX1uAcLVce2LmIDlhJJc9CxyCuyMtpGiGs/DR76Sw44CiCMP/PY3c88K6aF1sXGjVVQ5b2Pe77ICgFIOb/F2PjAaFK9sU7Oq/VR4K3ltknA49gX+FECK+vkTA4FmE6SzLxz5Mg9pRDoeLFs3ZFpibYG4EVmEusxqNzgdEah7nwwvGoeYEwwUEU4onb5CUnqfPtmErmP28TvRnOW0JuxmXIwm/At/e/9ts1fz2ZiAY11raV5QOkO89cS4KAoDGd4mYYAvAAO6SPyRsCVBzLpgrudHQMoxxLqDGWgFWn1aV61VHL3F6F+QfSIjbcfbBirY6fHq5nNZzZjpDN3858R0zdc2hlCM/UpOYmHqpsJEaIJkzYnB8y9xwu6nXoAtXHupNR1F+CY7bLcIxy/95ZgoBIYa28Nop9B+NP1qT4PfXGiWJXJdD9w8NEH/7BpiKlwryg5RHx6m1NTHTeLdDkJ6bA=
X-Forefront-Antispam-Report:
	CIP:51.107.2.244;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx2.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(36860700016)(14060799003)(35042699022)(30052699003)(1800799024)(82310400026)(786006)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E/uR3bL9kKQaeAEGO9fXtKrFRKaIDrqb1O4REJ+71kD/363NpmgNrME8Wj7h7sHBtmyoGL5bO65p2JUUDCy4SqhgbzxKaSqIegPX2Cxie2TlbxwUOUQwl4tY3XJBuH5eyCJOmTRNh5Zi5IeEPlyI/jw3RZ7R504vXH6Q2W46/1anBSpotrtFnt3L6VZTnIXoCNLaoTzAJAGwCqGblFKNhHjOKLCQimdrr3hBSDpCKodJMtbLyUGj8IJgGxFaKizNSoeIQUUUFqUh4w0eeb7Pgy3F+noQhw994VV8tbvVGKAYqIChcJtxpy5r8m9F03MDFV68wnunTurfflifdDOSrwYPCkL1N7gVEjp6gBonqPIf1Muw7Jln+8ojOah2vrppdP/xL50Jr9RjhnJ3tw1ppKQAZL2lHI4zmnvbqab7tciskGI9JYlbxWv93IXuu1DK
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 18:30:35.8137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50614813-02f5-41b8-f48f-08de8b65c5c1
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.107.2.244];Helo=[mx2.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2PPF4A8D38F75
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-100150-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cern.ch:dkim,cern.ch:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cern.ch:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5845D33A2B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/26 12:33, Konrad Dybcio wrote:
> On 3/25/26 7:30 PM, Maxim Storetvedt wrote:
>>
>>
>> On 3/23/26 13:17, Konrad Dybcio wrote:
>>> On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
>>>> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
>>>>
>>>> These use a common dtsi derived from nodes that were able to work on Linux
>>>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>>>
>>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>>>
>>>> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
>>>> Valentin Manea, which shares device similarities:
>>>
>>> [...]
>>>
>>>> +&i2c8 {
>>>> +	clock-frequency = <400000>;
>>>> +
>>>> +	status = "okay";
>>>> +
>>>> +	touchscreen@5d {
>>>> +		compatible = "hid-over-i2c";
>>>> +		reg = <0x5d>;
>>>> +
>>>> +		hid-descr-addr = <0x1>;
>>>> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
>>>> +
>>>> +		vdd-supply = <&vreg_misc_3p3>;
>>>> +		/* Lower power supply is not enoug to work. */
>>>> +		// vddl-supply = <&vreg_l15b_1p8>;
>>>
>>> How should we interpret that?
>>>
>>
>> This was in the original patch, but using that same regulator appears to
>> be enough to also get touchscreen working on the 16" book4e. That said,
>> it still does not work on the 14". Something to revisit later...
>>
>>>
>>> [...]
>>>
>>>> +&panel {
>>>> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
>>>
>>> I think it'd make sense to move the compatible from 'common' to the
>>> 16in DTS then too
>>>
>>>> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>>>
>>> this matches the common definition
>>>
>>>> +	power-supply = <&vreg_edp_3p3>;
>>>
>>> ditto
>>>
>>>> +	no-hpd;
>>>
>>> really??
>>>
>> One less thing to debug while previously attempting to work around the
>> "illegal link rate" error, which turned out to be related to eDP 1.4
>> (similar to the sp11). I've kept it as-is in case other SKUs attempt
>> booting from this dts, such as the x1e80100 16" (as it might be getting
>> a black screen using the current x1e84100 16" dts, though this is not
>> fully tested).
> 
> So do the 80100 and 84100-equipped SKUs of the laptop come with different
> displays?
> 
> Konrad

So far assumed both 16" variants to be fairly similar, though one
valiant 16" 80100 user over in the debug thread did try to boot via the
84100 dts, with no success. Instead having the screen go dark after the
first post-tux kernel prints.

This was strapped together via WSL though, so could be there was
something else at fault, but strange it didn't at least fall back to a
visible initramfs shell.

Cheers,
-Max

