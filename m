Return-Path: <linux-arm-msm+bounces-96563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uObKNq3ir2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:21:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44A248419
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A2A93002322
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502D1430BA3;
	Tue, 10 Mar 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TFiM3aOg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TFiM3aOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BF3AEF4C;
	Tue, 10 Mar 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134220; cv=fail; b=DAFiYFdH+czkhEOw4VBA/BcMmMsKiGKM4y6iDLcW9mjiUeKZKO1Zf8wuL2nQqwFU3aDKBPACebAz7y3xn7rUNGf02/oZvlmVJPd+mSf1VqA+jR1Wm3TRtyr7yPNhOtwSWnhieZa6lSz9lCA2b5u9qg0gM8jh87OlbyRNe8qfq1M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134220; c=relaxed/simple;
	bh=Hw6m8MMAaoyJrOgVLLIOtEk7ItuY/qfDle3cgsRpZ+o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U0Ln0DPFY4vUrqRzH589caLBKg+tSStylzpsQ5LDQ6v1qWAUTe+DD02ar2NHcfYPPhU8yJy14hmvuXPbd1X+dHh412V+4fTbZERhbk+/5ZLeeOk9QR5pSdmEFWYDqSPhY60akwomlfqdUWxfU9GvQUcoER593Dsk+pwjJkkp3D0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TFiM3aOg; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TFiM3aOg; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mkwaYAEtr2T0FN4YN9g+nyede5S101SZW7wuZYeOcZcRNPA6N7Up3+zo4O9eES4P6m4A3h7GvOaJGU3HOabZBFQPJY8KijfGBoKz4/Ab/BosH4WfHeG0UcvJhf5TbB/hUd4Dp3N4K/ulyyLhaSIqTV9g+LTAGd+j2GvuGaG9Cw0ekM8ldYmYYCLkkSeCymJu7t09nTFak6Wt3lseLhRJkT5F2WNdoXcgDVD2Mt+mAmyTpbgQq100AQW4x4/4+FUTYeUETLsreanBvzALbsuYza0tYRyJdNWe4CSNGs2T5E+Pr4lTwS1Vs1Xp/jKNvQTdLO9N+kytVP530Jo+7tqmOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19z35Q3nt6B6jq9cd9m22prmu/qZ3DZbfZdEv2XnyNU=;
 b=t7tPhP+YHfr7Uh2L7UdEH+rtUWbE7q5T+Wu5YHwGIQkcAsY9005GUkAIqBtgIrgoc553bY/HzL/HnxNVD4Zyq8gHByxCy9j2Mz6G7yM8T5zPiI4fDP5AVRV/frkMt6vQfCcd4nQGrOm6suXxx76XMnKv10f7kmOY56nUvyqSbIPROqRsbJ53s+1xJ0tUtY4G4w7tJdbd3bvCU/4VjI2Pq5TEsPXG+pjosyEZH5Spy1NkaVyhyDjbU3hxh2jD299ZZFdI4Y7zxQs0+ny1hm7Ln83g+nWWXsXeXEqAeetHxBN78umMK2NzBOn8Jqs1RlnMuMOLOIEKCnnxoSzhPaygPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19z35Q3nt6B6jq9cd9m22prmu/qZ3DZbfZdEv2XnyNU=;
 b=TFiM3aOg6JO0JVBdSstFxyRZ4RG7OXRIYVih35UeNOeran+TbBrIpYO/na9xpP0JvQGJpMpR8pdQWLzVTfZBlh+bOFRuPklCjEdZbOCFNcNSE8eOI5YWA/hqIQ+gLu6j1j+I2HAP1KzT/B0eAwxzMRglABCYAdaF4sIIQO6TgO4=
Received: from DU2P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::21)
 by AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Tue, 10 Mar
 2026 09:16:48 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::43) by DU2P251CA0018.outlook.office365.com
 (2603:10a6:10:230::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 09:16:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 10 Mar 2026 09:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZ9F0EQDjhfg/O+RPFdB92O1kSBrlzCxb8afriwpl4Fd1PDexc/nRmj1U3uxeTvwgC0EVlydwH6pLBJs7cS1o3MDnsoJKWKXa/KjoEXesPISrfdwDq8TuF5uIUmSH1TD7xLBLiE8MMnzhrZlvw0VIhEjo3PSbWbaUXtbtAT2l7v09tHOZWPls8Y2f1IKHFL/aJLJbPSPSuI1kzcMAorEHqTeLZSk8OkKIa+isxBBFvnGzT0QZ6nLzsxxQbpxSpb65v/7PTF+4mcG/F0pnQHXJ+qxQN7giElU6by7dJ15br1QmOKTurOVogrT8P1IJXFmTfX7XpT2RbbppK9GdnxuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19z35Q3nt6B6jq9cd9m22prmu/qZ3DZbfZdEv2XnyNU=;
 b=be3EUVwuV+fgeDhLbx69Z6Pk0bFF0xPN8ldu5VChuu2BvMi/lD6N+yWIpaWvJcTkWVguH6exB6dATCpqmXQseEGONLyiSzFn0bExvamX9mY/OuyqoiZjCyKzcDfjjmx6aC+17RECagjqT9VPbkj/6Gl3GzoKwliRfeO725arB1Sl3k2RSpHaSfGz52LJDX8aszVHeiikGwzMhB2qHTNcOAqXRqFL8ysUBCn9sltyfUMdoNuMwSlJpZnDVShI+XBhn+CGnmFzTttVzkzhitss15uXSW0oHlN8+WHicgBc42Ra7E9mSATDEteTOun52ln3EKzHe2B12BzPPSUjg7wjXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19z35Q3nt6B6jq9cd9m22prmu/qZ3DZbfZdEv2XnyNU=;
 b=TFiM3aOg6JO0JVBdSstFxyRZ4RG7OXRIYVih35UeNOeran+TbBrIpYO/na9xpP0JvQGJpMpR8pdQWLzVTfZBlh+bOFRuPklCjEdZbOCFNcNSE8eOI5YWA/hqIQ+gLu6j1j+I2HAP1KzT/B0eAwxzMRglABCYAdaF4sIIQO6TgO4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB11754.eurprd08.prod.outlook.com (2603:10a6:20b:743::9)
 by GV2PR08MB8488.eurprd08.prod.outlook.com (2603:10a6:150:b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Tue, 10 Mar
 2026 09:15:40 +0000
Received: from AM0PR08MB11754.eurprd08.prod.outlook.com
 ([fe80::3427:f97c:862d:1850]) by AM0PR08MB11754.eurprd08.prod.outlook.com
 ([fe80::3427:f97c:862d:1850%4]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 09:15:40 +0000
Message-ID: <2ac1d8a1-5cda-4e5c-8c6a-ad08d53e3347@arm.com>
Date: Tue, 10 Mar 2026 09:15:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
 <20260309-enable-byte-cntr-for-ctcu-v14-6-c08823e5a8e6@oss.qualcomm.com>
 <f45b9679-857f-4bb2-b683-cd5701ea16de@arm.com>
 <bc05d278-fe28-4503-ac99-fb28904e7343@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <bc05d278-fe28-4503-ac99-fb28904e7343@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0087.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::32) To AM0PR08MB11754.eurprd08.prod.outlook.com
 (2603:10a6:20b:743::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB11754:EE_|GV2PR08MB8488:EE_|DU2PEPF00028D00:EE_|AS2PR08MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 046a7150-8d27-40b3-5742-08de7e85c18c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 rWKBd41U9vwb3Pd5YxW/zOdv2q8TbvTbQLivpQcEeqNDz1riqYGbvdAykSLAPQ8FXIdHe+SV4EaDMoy/INpImHuESxriskqkHCkba6B6xYkXTJPraSaJbaOhg0pgsUTQXF8XRZqSm/3j0XWq0q2pMduBgH/xz95CHjkEIM1trDt+5avpiM4scZHtcf3qDOiNCfR7e1dmW6z3V+9zbBnsB/ID8Tpy07oRODkWvXaVatJwR5bTWXWU4tk+DnzVSw9SZIH9RAhXHloHs/ok6s1F6ruQCqslbiEwjD9o+6vyC1yAUm1XPJJwU4THpLNTPp+6/EYe4XgPqh2s9DA+0XZmbpZiGzv7bopu7FYfYTUQoSTEEV6Gr/mWmPE2KGZ/ZUyunPzKu0cPj0tFlGBnpppqvXx5SNnYj/niOoUX9CX6CnQPAmhgkFcCCsF9yoL+MJnK5O5xzVCC39w5Os4rTs7T1ci0P3dB/DoKPjEa7tOyfyJDUDyo13dLC8EZbsiJzMN4Uq4f4pKtRkHjtW+sTHxYaWFW4Epfpafq9Lbv20IfrHiz4oFXPAJZyxoT+04PJjtp+lHZ9Q7SqmHHdR8J2p8+K/D+im3zyGnJGowtO/jW13fZv5MFtSyYiUeTuCuOZdU5x2ztuWudze00NzjM8Cw43Kjcs/CVco5dxRxz40Y/t95qGcB6qDmoL+vcl2PIW+iNp0fVHLvjyGJW/PaC0y857o1WMzNmkeMXsAHhyObfN8ICWMbKvpnjFnZwKngwjb8ihXgScy+b9BpI0bqanyQS9A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB11754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Dxewn5BObK5SSSX3pVejtEQCiTzsIoO7+4NhBbDhyNiYj/nudKyI0oSS+qMwfiuITGMsNhRaDMhpdyEYDCk2TqwtmeP48OQefR52wLebF8c4/QfkmhITtHcmdpL4a8tdLmTxTE4HLMv/pF/LhnTLv59F2KGEpbOXO2jZX1P2+x75OyiQcgJLP1hSsb/JN8nMJpe70smIkZSXfMgvaSlW9gXuftQHQWzwfXrQNkeYNQxzebHXzjtsE/8tYnxwiwAtWymRia1N/Kqh4+J6aPTXdt5bIrLZ6WFIDxPO6Qe77Z4VBVAziHAJlaBqWmLBz7XGSW7qav1L95NIVaPP+LvaPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8488
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d5f129a-66a7-4f01-314d-08de7e85995c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|14060799003|36860700016|35042699022|376014|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	wy6xhL8tAJ7Dt4tkir6b7Y8WSUfuWLUUU5fGX7et+e73/QXdFWjWaFkz3amBeAttb4EO8lCGzB8RkQRNgqTzqcwAiOo+wPrq4mGFy6MH0EOSluFSosLLhnw9w/89z/+MaBkQLd3Com2rzZSw8YdX1hh6JBKuTN30lIvi3qS8r4qxpJw2aK3nO4Wct+r/NStDs6sz8hj4RGVscUicJ3/x1QshagoSX7HuiB6AG1WR0MLivLumu+wLuJ3KpwwqocFaaPFjUi+sgfl1+07Pm7Dp+SwJPsZ6nt2XRtZRsmw3itW/6ZgKnpcspnMCI1bUbPwhJFYXCV+gdZy/lW10TTaLaEBMD4TbSV5smEBbg46M3+pN92beq/Livrdgask0cqxdDFSx0NftNLnuAXDwxR0mbPhgNjsPRuHSZIDFffxs64mdn6Jyp/W4C53eNuHPtXV2ObtciweYq4zCBWwx/qmrG4eTXOE8E152ML2GSdREVKF9SLJNP6FOfkI8tiPesAX6aPWPYxUdQ+CvQBbUQqjVaFYD1jgyH8ibKBCV39rDTxLr/efnHSCne5qwNPE3lfZf2uJOS1kO6KFbMIqx8vdSHuhuW4/FWszvzuqLA5dL6xVTIayCTWtRElBDE5Ocqa0jHjRTH5y3OfgTlAND1cnGMKJByDhgyyqrdM7/uIRe01A8QG6G36XqsfeZTIxvfpPA+sT9EC8QMb5ras626WjZ1/3G9yQ/qFiwSbAzKX2GJhcxR3+w0Mp4coOeYVM0VbFwWwAkCEpTD4Fo07fJvpDPDVW+cD3nnqcaM3x2oRG08cXnNp2wp8RpCSO2laEyn1dd
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(14060799003)(36860700016)(35042699022)(376014)(82310400026)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SfPKLRYhI0A0qBHxeP2cjHQKGFnOtesDKGV9Cc9ag1oinxHOV4Ln4dBpDt1H7D5VuYrUcjm0L5Mfcr3EpRurJmnFcUDxW6oKTbpJRA9GRCTWsLkJOwDBGNC4Nti9SmG/1r8BiMN8ZOt+UaF64baesxWJVc3gcRqheaurs0Ge+gtv9DSq4r3oxAB//sVCP9PGFLZMW+k6beiwj58LKmNQclGEKIkVOinKdyV1Ah2w/bZZUifweLm+IW7F6nVlEU3juWWwjxXuYJMViAXhMdCbPyNx5vI4qgNsC2I0+ax6qzprQGlLtjnTLpre7UQSumVYPVc9RVkblpEoXAawtYtJZJsgPOQzydQMyR2TEM3IIdV9MR+uM0HlOtITntKyvGKdRWgqNQFnHDcZ/mFR8n0mrEx3eRUVgzHv/ffm40Ohcw3qXu+9jNgwpLPGei2KytZH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:16:47.5058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 046a7150-8d27-40b3-5742-08de7e85c18c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8745
X-Rspamd-Queue-Id: 7E44A248419
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-96563-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10/03/2026 03:01, Jie Gan wrote:
> 
> 
> On 3/9/2026 8:43 PM, Suzuki K Poulose wrote:
>> On 09/03/2026 09:47, Jie Gan wrote:
>>> The byte-cntr function provided by the CTCU device is used to 
>>> transfer data
>>> from the ETR buffer to the userspace. An interrupt is triggered if 
>>> the data
>>> size exceeds the threshold set in the BYTECNTRVAL register. The 
>>> interrupt
>>> handler counts the number of triggered interruptions and the read 
>>> function
>>> will read the data from the synced ETR buffer.
>>>
>>> Switching the sysfs_buf when current buffer is full or the timeout is
>>> triggered and resets rrp and rwp registers after switched the buffer.
>>> The synced buffer will become available for reading after the switch.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>>>   drivers/hwtracing/coresight/Makefile               |   2 +-
>>>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 ++++++++++ 
>>> + ++++++++++
>>>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
>>>   drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
>>>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   8 +-
>>>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 ++
>>>   drivers/hwtracing/coresight/coresight-tmc.h        |   4 +
>>>   8 files changed, 555 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>> ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>> new file mode 100644
>>> index 000000000000..6ff1708fb944
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>> @@ -0,0 +1,8 @@
>>> +What:           /sys/bus/coresight/devices/<ctcu-name>/ 
>>> irq_threshold[0:1]
>>> +Date:           March 2026
>>> +KernelVersion:  7.1
>>> +Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; 
>>> Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan 
>>> <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Configure the byte-cntr IRQ register for the specified 
>>> ETR device
>>> +        based on its port number. An interrupt is generated when the 
>>> data size
>>> +        exceeds the value set in the IRQ register.
>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>> hwtracing/ coresight/Makefile
>>> index ab16d06783a5..821a1b06b20c 100644
>>> --- a/drivers/hwtracing/coresight/Makefile
>>> +++ b/drivers/hwtracing/coresight/Makefile
>>> @@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o coresight- 
>>> cti-platform.o \
>>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>>   obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>>> -coresight-ctcu-y := coresight-ctcu-core.o
>>> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>>>   obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c 
>>> b/ drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>> new file mode 100644
>>> index 000000000000..0bf738d6c283
>>> --- /dev/null
>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>> @@ -0,0 +1,351 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <linux/coresight.h>
>>> +#include <linux/device.h>
>>> +#include <linux/fs.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/of_irq.h>
>>> +#include <linux/uaccess.h>
>>> +
>>> +#include "coresight-ctcu.h"
>>> +#include "coresight-priv.h"
>>> +#include "coresight-tmc.h"
>>> +
>>> +static irqreturn_t byte_cntr_handler(int irq, void *data)
>>> +{
>>> +    struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr 
>>> *)data;
>>> +
>>> +    atomic_inc(&byte_cntr_data->irq_cnt);
>>> +    wake_up(&byte_cntr_data->wq);
>>> +
>>> +    return IRQ_HANDLED;
>>> +}
>>> +
>>> +static void ctcu_reset_sysfs_buf(struct tmc_drvdata *drvdata)
>>
>> minor nit: This has nothing to do with the CTCU. For what it is worth,
>> it must be called, tmc_etr_reset_sysf_buf(). But more on this below,
>> and even do we need it, further below.
>>
>>> +{
>>> +    u32 sts;
>>> +
>>> +    CS_UNLOCK(drvdata->base);
>>> +    tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
>>> +    tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
>>> +    sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
>>> +    writel_relaxed(sts, drvdata->base + TMC_STS);
>>> +    CS_LOCK(drvdata->base);
>>
>> Could we not keep this function in the tmc-etr.c and invoke from here ?
>>
> 
> Sure, will move the function tmc-etr.c
> 
>>> +}
>>> +
>>> +static void ctcu_cfg_byte_cntr_reg(struct tmc_drvdata *drvdata, u32 
>>> val, u32 offset)
>>> +{
>>> +    struct ctcu_drvdata *ctcu_drvdata;
>>> +    struct coresight_device *helper;
>>> +
>>> +    helper = tmc_etr_get_ctcu_device(drvdata);
>>> +    if (!helper)
>>> +        return;
>>> +
>>> +    ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
>>> +    /* A one value for IRQCTRL register represents 8 bytes */
>>> +    ctcu_program_register(ctcu_drvdata, val / 8, offset);
>>> +}
>>> +
>>> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr_data(struct 
>>> tmc_drvdata *drvdata)
>>> +{
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    struct ctcu_drvdata *ctcu_drvdata;
>>> +    struct coresight_device *helper;
>>> +    int port;
>>> +
>>> +    helper = tmc_etr_get_ctcu_device(drvdata);
>>> +    if (!helper)
>>> +        return NULL;
>>> +
>>
>>
>>
>>> +    port = coresight_get_in_port(drvdata->csdev, helper);
>>> +    if (port < 0)
>>> +        return NULL;
>>> +
>>
>> Please validate that the port_num you get is valid for the CTCU ? That 
>> applies to all uses of this construct.
>>
> 
> Will validate it before using.
> 
>>> +    ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
>>> +    byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
>>> +    return byte_cntr_data;
>>
>>
>>
>> nit:
>>      return  &ctcu_drvdata->byte_cntr_data[port]; ?
>>
>> Also, why not make this into a helper, as we seem to use this other 
>> places too ?
>>
> 
> Didnt get the point here. We may run more than one ETR devices 
> concurrently. So we should get the proper byte_cntr_data according to 
> the port number at runtime.
> 


static struct ctcu_byte_cntr *ctcu_byte_cntr(struct coresight_device 
*cctcu_dev, struct coresight_device *tmc_etr, ) {

	port = coresight_get_in_port()..
	// Verify the port in this helper and everyone uses this.
	if (//!validate_port//)
		return NULL
	return ...
}


Suzuki


