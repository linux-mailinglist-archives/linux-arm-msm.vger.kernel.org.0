Return-Path: <linux-arm-msm+bounces-99931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBv/IqcrxGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:38:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0232AA6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5F62301158B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322123321D4;
	Wed, 25 Mar 2026 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="TfSti6Qe";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="TfSti6Qe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022106.outbound.protection.outlook.com [40.107.168.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2358013E02A;
	Wed, 25 Mar 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463463; cv=fail; b=J22DiPvzkVfFvpaYOI6VvdGaD7tsUjwwnDCTjK6LinouGNoGAUOTInxk1jKiI6kciNcwiKNJsNFqG+Jr9sX+DFEkgWspPyoaGQU+OBGp6vZv/7TKzJd9kfA22B7pOSNg7nTJo+F9kXA4CDIq7GZOuZJgKyE/CgT4MUIyVX3kvXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463463; c=relaxed/simple;
	bh=s8PVgsraRP4wSQeHHecFazOAMy/N5fsF2x/5+QUZyGQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Uk1JgH6rxx7DL+2jD3M7deaOJxe1fWIXKApn8BollOvNymWGfbnNpO3XB01t+32jBRyVx/8ECDqtTNTXefHoKpj8cj3VXgmZL/D11qSR1yIjByHy55toZhbUxqhzurYZHmwfhd9c1WXWyePN0hp+3Fl3m6OIepVlXIQb1vXm7Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=TfSti6Qe; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=TfSti6Qe; arc=fail smtp.client-ip=40.107.168.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDpsQLYz7OEA0+bFcLYohebWukcjGBBPlYKqx3HNkeWyi57rFlo+n5mjh+LHZHFX3hrC4Td0axMr2qUE+Z3VfdsOvTTF+MA6Xmq6cuXiDNKsLdULfaESaZuzCPh+DOSj2Bm8ZaMAvt9yKtxLXUuU4ZFW6U4qW436lsxQ6fQeWlGv2IRvyhUjdNqCqgIcwftQqhzZTg1ZN/Ys8w8xzrh0XUcMsfABTL1iX5HSFOE+7wEMdZByNHJzqHtHENk3USeAkyYNVJxxspsjyf+z8in4YW0GRVvS8VZnw9iv3HVNKyQFPhad9zo/IFbtfoTS0KJhcDgPcEUKXZGtxgivbB+Jwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHHMKouz58G/tfUAxi4zfHoQQuwG8Sm8mmP/SnmjRG4=;
 b=AZb85zFx9jY5QzHbh16VNc2iD7TH1o4OC4t2BylDLzMmGDM7160k4UzA+vfrZWP8B52oelRd0zC/sC9Ai5IR5h7WdOzc0HPB4MIF/VSiBuecQMHiM0dR70BGkdjbNEjv/LAumNWEe14hYihqwRJlQinqLle9/FXhZqjlXDwhY4jMIgfkNHZTbTmWQdbagNu8KYlLHOo8dH+R3KpdClAHWzdYsg3DTYlLHWgYg/rIACiiHIL6b9X15PfWy/puk0NaZfJdnP5jGTM6niwrDUHzDNQ52ojtW/HJtToQr/r9K6R84ZNhboMykmi/FryvI8tM5g0cS5JD4xf07+iJkGDNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHHMKouz58G/tfUAxi4zfHoQQuwG8Sm8mmP/SnmjRG4=;
 b=TfSti6Qeq4VCJ/G+S1+HBlPbaq4geZ3vMgaIx8FwrQvcSipsGil9Iu4RJSXbWh5H2LMkMQy9ZMGvotcFxFvJlki3E172L2xyHYzngM3oVxUn6b6sJ57x+qoSyDPsrIo1YzVZ1oqfN2FyAxHy3iRVbM3sR04OhE4hMxqbhOqs41k=
Received: from AS4PR10CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::9)
 by ZR0P278MB1496.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:94::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 18:30:53 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::ef) by AS4PR10CA0021.outlook.office365.com
 (2603:10a6:20b:5d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 18:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.208.138.155)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 25 Mar 2026 18:30:53 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=TfSti6Qe
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010002.outbound.protection.outlook.com [40.93.86.2])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 8E4CC7E7C5;
	Wed, 25 Mar 2026 19:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHHMKouz58G/tfUAxi4zfHoQQuwG8Sm8mmP/SnmjRG4=;
 b=TfSti6Qeq4VCJ/G+S1+HBlPbaq4geZ3vMgaIx8FwrQvcSipsGil9Iu4RJSXbWh5H2LMkMQy9ZMGvotcFxFvJlki3E172L2xyHYzngM3oVxUn6b6sJ57x+qoSyDPsrIo1YzVZ1oqfN2FyAxHy3iRVbM3sR04OhE4hMxqbhOqs41k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR2PPF6E58E4342.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::2d8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 18:30:49 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%2]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 18:30:49 +0000
Message-ID: <40e31e2f-84ff-425c-a7e9-f2df4210ddbc@cern.ch>
Date: Wed, 25 Mar 2026 19:30:48 +0100
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
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::13) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR2PPF6E58E4342:EE_|AM1PEPF000252E0:EE_|ZR0P278MB1496:EE_
X-MS-Office365-Filtering-Correlation-Id: ef44784e-b993-4090-be3c-08de8a9ca5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|19092799006|366016|786006|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Cpv9tthiI4Ath40BFifNB/Vqoa+r84xFXpOVMnPun0GesYa5fvcBVlgqLt70U7NmboyLl/ZUFQGUPaiH0ftUQcGD0hkLSPjbTlH3QqhbFjJsC80S9AQyTET3HbNzAKaDug4m4qa6lqrarmG1p5zeJK0uch1VWqOnQ+0mjc/py2aQtJVjE9i7jlkrUPTYuHTeMyDAZIzy7X8QbEKDQtXdTVoKKDixp6BO3IeGSq19uWyAKwN7Te7o1mXn/ZntDjBY9Xa/uO0Fwm4E3FQ8oSYxUPU5OBfkbGtSG3zoOSYUbbdviVMLYEKW0KN+0xHmKPwrBVN+IuGoXKG00pvDIy6HioIa73xBHyf9AChUA7HqkBPLqqYJKVoGhKz863DMYOQ1Ra8VLR99K6MvGwkoGQish5weM/uQZHtxWMk8gAKDb84sSTJ4TAGQByLTB5D9Af3eb9r1cEyJ/x8fU1IKjhrdboo12/z98fB9RDRWQXQCisCRXUNJEat7SjW0pAvIELm/b48LHq3EwSiBXyuc4i80GRUIOif/+bOEHxJWwCAKdlGQGHTIoOhhexnag0Nv4Xwk4TZiCpset63B7rKKHbIYNRO5uY84lgy1ll3oG1IxYclP7Z8TYCI/2KdUHGEYWnBci98vX1RSpZbsaWnLmZqkOq9pnJoArRd8ER4LeU0za8jYuQaI1vXvyhBwViMHnr5+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(19092799006)(366016)(786006)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 GGn2+BmvcELtYWimAXQK5an+fFnhgc3pDeMovJW9I6PzohYZSwYF/b1gMkecoubFAg+PVmpyPjPsN5kxq6CepGxF9lWpSH57zvNQkssbLrk6yk+GKspxjKryyDheWybxpR54GgjGm4Gk77h+17rxsIg11WJPjikY5n8RNjTjWpvEFLguJp3dfHOF4uiLkC0X7y6cVUk2ag9wU3vcoN+40QN6qOZE/UHN5p/Iy3K+N9A6JJDCAon1NkwIp/SBNPUAvj0kkri2TXTJINwdxpwq331CSeNkv2vf1iFsEl8v2iudhI3uXuhNGyrwgAqhebn25GtNwDBvRx94nKe9Ydye5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2PPF6E58E4342
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22d96d76-b4b7-4984-ec80-08de8a9ca380
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|7416014|376014|36860700016|14060799003|30052699003|19092799006|786006|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V4SDKnR6SGEIQjwYyriV9M5XhZeKI11JBRCHHA1dMszAvibgU/sxEEx7jvvHOGdiQ3D552ii8KLyXmY24a22UE+q7+tys8S3nTkUaWBBV3ayVtnV//bbNAz8rS6SRZcLR/X0BiT8l0jS1SQIsB5BDvSfayyqmzaUoqU3+lwO26OYk5iN7eLdxmom8I8cqV/678DCslaOE3Xx3pQshX9tfUWq4RARUg4qPA2ChgeymMZgmZw+/6Uh1apBDDnQuSnHxdbJqgBbpqIqMqyOUFcKlt/5Ki4OIG1KctV4tMxJWV8g0VOSQlGg4xNzcG6l5YAmlk0WP1jPkFn3+ASxHfUAeYQhDfgo0HppMygUoIgUuTO1WGnEBscNUwiZ4ivxjiihYNs/Yw9wTtq6SadHBHjZUpNnuvQ4PeyJ/C8IvcPFZMZh5l/Txp+HojDkkaBR4kbSNTI5B4j8SrnIeEzstFRBBjlKNDD5YIoV6Tc4MGNRvMcD5M7qwF8q/mpHENdziIoFKoFrn1Laz8M5L49xiOuVbJFe8Y4ZxGjOUXjNORSppoPVICNsdr2ewyJ1aCvFwizjPU3I9H4gl/ute2Fef/o8JS7VbrLFWtXGPtsEj1GGgPCFcXfjm9xD8f7y9Ocqpn65Qvoj4ib0YS2EWj612oT8vlqjOb/jFaXjhTGo4d9w3n3UEkomf9s/ywZHQyXaVpwx8GN0iQuEKhxOSEdZyIohTm8zuV+h95sAroc8+UOwGKQ=
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(7416014)(376014)(36860700016)(14060799003)(30052699003)(19092799006)(786006)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yGyordZjJbzRv3IY14t4SC+yyi11whoaC0knCmtqWDLawJhJB4njw32FLqy08eCEB9L86BHQPp9spFJIPQCF7UzQlojIjEK2ba1N1kMTRdxg5bGiDEcgRBIq+ZDImqauCX3HgJ/04DKRkowmVVQ94w56YZMlbuVl2ADFLG42LFPypSnZ3S9YxVAtcgZ9SIyW8lKeoO/0OO07YW4LAeOwARgszayUgi9BUzSCJNOpb2VvFKs9o21/9o3WtJNQJx0Y0Dtnn61VCfMsAmK+j2CiPagU0vEej1Mh8fkFvVJ8a93bE+Rwk/nn7MLsiehODFpZ7ey28vg+rSbLuaHfbWg/yM5c1a6+TmRY9gblknnfZWpK8SJyVpJQOAxk1KpW5YtSvxZqLbb/orjDFW+CcnGJ1v48EV7dm9oKHn9FoPr0/maTiY8Af+utLBqhJKLYdopK
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 18:30:53.1563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef44784e-b993-4090-be3c-08de8a9ca5ae
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1496
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-99931-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cern.ch:dkim,cern.ch:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cern.ch:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1BB0232AA6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/26 13:17, Konrad Dybcio wrote:
> On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
>> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
>>
>> These use a common dtsi derived from nodes that were able to work on Linux
>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>
>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>
>> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
>> Valentin Manea, which shares device similarities:
> 
> [...]
> 
>> +&i2c8 {
>> +	clock-frequency = <400000>;
>> +
>> +	status = "okay";
>> +
>> +	touchscreen@5d {
>> +		compatible = "hid-over-i2c";
>> +		reg = <0x5d>;
>> +
>> +		hid-descr-addr = <0x1>;
>> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		vdd-supply = <&vreg_misc_3p3>;
>> +		/* Lower power supply is not enoug to work. */
>> +		// vddl-supply = <&vreg_l15b_1p8>;
> 
> How should we interpret that?
> 

This was in the original patch, but using that same regulator appears to
be enough to also get touchscreen working on the 16" book4e. That said,
it still does not work on the 14". Something to revisit later...

> 
> [...]
> 
>> +&panel {
>> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
> 
> I think it'd make sense to move the compatible from 'common' to the
> 16in DTS then too
> 
>> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> 
> this matches the common definition
> 
>> +	power-supply = <&vreg_edp_3p3>;
> 
> ditto
> 
>> +	no-hpd;
> 
> really??
> 
One less thing to debug while previously attempting to work around the
"illegal link rate" error, which turned out to be related to eDP 1.4
(similar to the sp11). I've kept it as-is in case other SKUs attempt
booting from this dts, such as the x1e80100 16" (as it might be getting
a black screen using the current x1e84100 16" dts, though this is not
fully tested).


Worth mentioning is that we originally had two separate devicetrees for
the 14" and 16" SKUs, and the dts for the 16" eventually became this
dtsi. More could indeed still be cleaned and likewise moved to what is
now the 16" dts (i.e. for v7).

Cheers,
-Max

