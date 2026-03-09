Return-Path: <linux-arm-msm+bounces-96261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPfLJMjBrmmRIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:49:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E0239257
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B80CB3077399
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076753ACA5F;
	Mon,  9 Mar 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ixUGY8mh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ixUGY8mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF434C14C;
	Mon,  9 Mar 2026 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060278; cv=fail; b=OsDzhLxrzA53d1eXla2C9beqbYxQQXWPqmKnuZUZKhcpNPMpMIRXX7RVWY9gBZwfTIIZF/t7cCJiNNUJC7H5A39l1dGQG3upvyW7IX4KC4/hhIqmdgXuD6GAfyqwXkg0DgtBeyEsiY8f8Dfz5pDtMgebRTq7qNNbmAKakaVy2Zg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060278; c=relaxed/simple;
	bh=ArxeZAnFLC4qSugVd8joOO6f8yXIspHdT93C7LLHfvU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fWmnzS2rrXtjpcM/1cnzt9wvIKFIxH0YQHz8OTAig5YoOzcF2DoO5GraCEvEFnm6rxvtzMfxYn89L71PYU0921YbHHLPy82pPeVt6Xdbv2fwGWwS7Qt42C/XQIbGi5Uo5TxJZ5tpskc7/ki47Hgx/j7pmpG2iHuZyq7LO6mcFKU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ixUGY8mh; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ixUGY8mh; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DOzMWKHtTNQvyU83Plqv+2YX3CCjIC28ats+QktXN6x8QdSUPyQNFKa2bOoQSSh0qLRcpXOq2EUKvgemMCvH7RJK6asy59G7aYlcB8pzZAeblE1kpnpRJ78AUfrvUsCEOTkDOAYVD3YfvA7xu3SlFMAt8n3n5J05CvgyoUMzvVUuS1RQS/bIEyKXYRWNe8kMm4pA6WQZ0QMPhsz5ZGfjhN43CBam/AWKQuqVK7X21G3KHjYrDIHnDOwGq5bxJC2Vh908DTnIAMtb1ENIjas5OujvwHAIs7YpIu882NIj+MsRRRMlLbv99P0v+lsJi9MbQhpfYFXkbgWQKcPJ+BO9xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRjq85RdxEMrHnEO9z4QbyOB4Bwq2eiotACJMjgZzow=;
 b=QuzOfztWc9qzjC8uSp7rrIUakEATmwQmpJ5a9gAq9nCS784q2NEYjhoBffy0ZOEDkoACBCa2/CBSXyfAJI2aYldCpG+a5tU7/8OVdCx5XNhCsOHERTIcfU+IL81eGe9rPh09J6pcQjzjVg2jeHxdgank5YiO99Ou4lDOupHY4Ct8u6Ny3m7iAMaQqMlRecgX4x6nQ/f77ESgvPbo59QD4XK3HG00PkLa0EbdbCh1QhwNGfbY6ZbUUS2PqJIpHdcBsV58rDhqWd4Xe9fdyzrFo0VurZXPFEiTZto+DlwAn+do6yaVWKXXhjSfMs4ZWPG2Nf7X/OMEAr5dIGiDA5YTSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRjq85RdxEMrHnEO9z4QbyOB4Bwq2eiotACJMjgZzow=;
 b=ixUGY8mhaz9lamZrJ00mOoJE29n9FbL7KLLpPFQT5EhUyQHJWReVwpatdxrlrteE4Gn029qQj/mRqGJmls5q7O9++WTtt9sgGn4IBl3vEwdFMhh6ie5cYoFHvmSH9XBO8YtpO8c+kNWR597znVpS1las2ieXYZyW42NSvkVpnFQ=
Received: from AM9P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::35)
 by PAXPR08MB6608.eurprd08.prod.outlook.com (2603:10a6:102:150::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 12:44:29 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::c9) by AM9P195CA0030.outlook.office365.com
 (2603:10a6:20b:21f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Mon,
 9 Mar 2026 12:44:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Mon, 9 Mar 2026 12:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvR2Bst5jjLjkJehGv8hwy9fOdyDJ7TEGEXLtal0piGJPHg9Z/0R/qTnZMeEoWXZ7H2sJgKvCdt0iQtadvXZHC1hPmS3b9tpjBKc9lXalJOZh9ZgQunIbvo2XYuZDSpM50fp9vL9HjST4nQbx+XsfCWXKTXda9qXqHXvUYkA6/+Jqtb9/2mDwvTw1+wut+kTqN5oO1FcxofOfX9BOi7BWJj9eltfc0rJJl9qH0sRBoD9iW6GUVdD3jJ6sGGFZd4sOXi+Jn5zmdZl/RlIfQAhVfonY0NqfBll2OVVf1aXFVDw0PQU/Mx1qgH/jcVqG+nmbGkTBSwASPaqvNysZrjsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRjq85RdxEMrHnEO9z4QbyOB4Bwq2eiotACJMjgZzow=;
 b=jicV75fav2IR+PJoeN7njuWTgf6ahJmNmu5IsQ+b1kFIuVN3X3zJNvjfzOR4Y9kKxKRfkGVhk11mLAj5QyzWeXsZUW/KfwF0E+y/SGdzL+UHv/is64ehegLiCqth/+sm23zyTCwFn3nE4erEz4o5n/JpzE1Pm3DEiPmLG95JYhVVR4eSl8a2o5eJv+ySg0VXX5fVKbf5CPT2BhwPCMejmMugoSkTm9g4FerVanAXrr1YI3pv+3JMvf3jxSEiZouJoL1TSj4xV7HQe7q+7hGaGZIO7UELEXpIH0mDQQFbc4AlAzUbJKfzS6zwJ54bKb2nZa7ALiMSpHgb6BeNmmMRog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRjq85RdxEMrHnEO9z4QbyOB4Bwq2eiotACJMjgZzow=;
 b=ixUGY8mhaz9lamZrJ00mOoJE29n9FbL7KLLpPFQT5EhUyQHJWReVwpatdxrlrteE4Gn029qQj/mRqGJmls5q7O9++WTtt9sgGn4IBl3vEwdFMhh6ie5cYoFHvmSH9XBO8YtpO8c+kNWR597znVpS1las2ieXYZyW42NSvkVpnFQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB11754.eurprd08.prod.outlook.com (2603:10a6:20b:743::9)
 by AM8PR08MB6500.eurprd08.prod.outlook.com (2603:10a6:20b:361::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 12:43:25 +0000
Received: from AM0PR08MB11754.eurprd08.prod.outlook.com
 ([fe80::3427:f97c:862d:1850]) by AM0PR08MB11754.eurprd08.prod.outlook.com
 ([fe80::3427:f97c:862d:1850%4]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 12:43:24 +0000
Message-ID: <f45b9679-857f-4bb2-b683-cd5701ea16de@arm.com>
Date: Mon, 9 Mar 2026 12:43:23 +0000
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
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-6-c08823e5a8e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0187.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::16) To AM0PR08MB11754.eurprd08.prod.outlook.com
 (2603:10a6:20b:743::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB11754:EE_|AM8PR08MB6500:EE_|AM3PEPF0000A79B:EE_|PAXPR08MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 6729e24f-5de3-45c8-6a6d-08de7dd99a81
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 w2ZdSwbMMlxP0BGg1FwL+hR7WpuAJgaFrE//+N3QSaaCDP77r4VMLKWiryGOHf/EForkfxRouukuumbtXrbeA8lEOJZHPHiFHcBqzoszUVaw2Gfhlj5UjOGmLAE0ngHrvfKIz20Il/F2BxUOTH7PvYJcsyzqTA84iYuQwKVPw8qFHv6Y9fGIqsKaZgPgXUNk4czBkD/Yboz0JLLG1iyZ7en952/ywi8DlgXLHynYUlE5IaBK9nEp2bPGyB8Mt/T9e0jCq3VVu23PrDjefW04vf1M+WGhMQ9DhoVrbcMN1/LD5YyGQ9OX58mJ0zEhK3ZM+UaePBpuJU8Ufe9omMNrY5kkbc5zwVzHNTRE9bKaT1WGkCxCtaRJXTlRBURHpbu6gKpOehlbKJu4UGu5SPXj38BUHTwlUSS7UKuDxD0/+JmDgLIovfK0DPjACUt6eadNMtFvJFqci67N1dhqk+FpzVO8wxAhBQBMYiEoBP29ef5gmsAizphOXKpGM/ssRq7WZbLeNmf6RUAFsUhIWpQ5dd1BYql25YGYSQra1S7V1awzCARlPqaL++Ct4C5q+lgBlqbF2B8QXnG+EQ7TX3PYNfnn+8/ZQ9z/ablUt0YLaDqB63FX8dWRyGGi68QSHLDaf+h8ln4XTlb2tVB0tblNTtxS9XYWXaE1n4OXy2zRNkETAAuD6246lFli0qMNO2sersaTwjIXdvcm0zzlvicRx7RfF+q9PRSa9H1qzsgbKvyuwqbiilmcWHl3vAJsBgMPRqcMdPmb4A7ic8DwWSUp+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB11754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 B9iumrTGJtS8niYAN2QD9QqgCBqCLAj/ypdaw0Sw0xgzmwPiUuBBszBswS6Ti2K7GCx5xRYhBuXTrq5+/xHuoH5IUXUGkrjwmYlQ9rQz000flcTBKmDuZF7yzRfr72cx4SkBAuTNmzG9udGOK3tlEwe7j6RjRzsmuAVbPQSDwzM6Xlg01eZIobKKYkRwMwYvXM3OL3H4ZYcCvbo7x0xQg2t4S3L/EOeW9xF8JhhES+SPG+jHJwzvaXGUSqM1XBY6VpUoaiixZ3Y4zsZhzMTdQ9jj0nd3MrPQ0kN6rEpfDYFQ4gnKRsjnEnRDzRMhnOIY620YLvXkyyqRatcFEfW0zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6500
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9733b29-5c83-4516-01ca-08de7dd97461
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700016|376014|7416014|35042699022|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	VXfYpc2qTBhfJyNnVQZz52lv5sp99ZZL5+bUQX2FZ2YW+X76B3d4yaPsiE3GxuVGecF3t5UaVQDcKkO390VdYQ1M1eY19BPY24mVeve8/ASExeuzW01M16DGwurDqhPio8CQYa6K1v1MKZpIEwMJt0iLEwCWjsiLx/kNJk554mN6gnSXSNLWeYdx+PE5mwlPnhJ6hm1CB4A+6nu0Ye+Y31T5TEDSRvdTXkU8LaYa++2tw4nDpaf5LhYKtOo6bpIHcawtP3r5dlweMVmVEoJKBuoKalANTgMRTsz/YRHO4I64YPfc30yVOgcCbNXnvUWAKHjKUKiDbGjhKHcwfZUkiwDeBpm6f40jMKxmROx7ilsTG6cXbt2teC13ctGJm4fNLCy0SLNEmZsjQx6nytmgQOUM5l0ASE9eujLZSZpDCmZcKFYU3HUl0x3QueQMOZJqLu37usa8xKuvHZwuLKkZpTCsy0YCs9Rsn9jrJQcIuGJ4/IU6S8l2I9U33PwPw8SyvVaooGAhbHLxzPeL8rLU7W6YuXHeUvgGKan8bJGxln8TFOBc3LSZ9pS0ZS6Q3WNVaiw8rgY6XD5AHwsYUU7NHIoe92onHlm7bWZ+g8TpiDjQpu9hKJQAabnLfw9DlvUI3VIvDBUwtuMHeFVxxfeS4gQNi5PggPD3g9iH/0brh6faEXc8j4KRPOBpz4x/KOnNQmc6ait9+EXjYP3VRCfJjfQoE63GqLqRUBigTCwNXQlVnO/fg8JBwaUMK4UMVHZjlKi4/fDgKqwv++ayXifxSTbjr1q2v6+eebNE43cefOCC9140Sv1/d0s8U6E5gCHr
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700016)(376014)(7416014)(35042699022)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9qkaoEnucQnZJL0ELC1AwMDwOUvnqTMJ1ZkXSV61IIrltT7VRfzxKBGgwa23f9V8t3m7qxALgtWRQFYV25dYH6Xvf5UskBtBH8OFmSq65bCvLWvfLiq6cqYFqCyjqXfOIFACD/J77BdwiI73ZOgUq158COvsdPDfaZwht/i38jZqy6eiaE19jnTRCxu/K8iS78/JP5mUHDfg9Eh8am1h98xIOVB+Diu/CbCnedm/6qN4kaJZ9fHgkU6QomxMyKY+i4VESxjWfJ2raLIpTI/xB0BhrRJs3kVJX7h16ocSSMF6sbwftGEYGD+nTCdujEpxj9eWv3tvOuiyLd3eUV+fmB62PlqlYJQYBzDRNp1plOxauXAf5y8wBesYTWU2ni02kuu4p0jghR9v2MFlH0Gd4q2hkuhr7OFY0YRKjUPZ9sOxb0J3NP0sF6WoDxz3VbNp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 12:44:28.5674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6729e24f-5de3-45c8-6a6d-08de7dd99a81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6608
X-Rspamd-Queue-Id: C86E0239257
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-96261-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,arm.com:dkim,arm.com:mid,desc.dev:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 09/03/2026 09:47, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is triggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the synced ETR buffer.
> 
> Switching the sysfs_buf when current buffer is full or the timeout is
> triggered and resets rrp and rwp registers after switched the buffer.
> The synced buffer will become available for reading after the switch.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   8 +-
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 ++
>   drivers/hwtracing/coresight/coresight-tmc.h        |   4 +
>   8 files changed, 555 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
> new file mode 100644
> index 000000000000..6ff1708fb944
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
> @@ -0,0 +1,8 @@
> +What:           /sys/bus/coresight/devices/<ctcu-name>/irq_threshold[0:1]
> +Date:           March 2026
> +KernelVersion:  7.1
> +Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the byte-cntr IRQ register for the specified ETR device
> +		based on its port number. An interrupt is generated when the data size
> +		exceeds the value set in the IRQ register.
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index ab16d06783a5..821a1b06b20c 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>   obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
> -coresight-ctcu-y := coresight-ctcu-core.o
> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>   obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 000000000000..0bf738d6c283
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> @@ -0,0 +1,351 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_irq.h>
> +#include <linux/uaccess.h>
> +
> +#include "coresight-ctcu.h"
> +#include "coresight-priv.h"
> +#include "coresight-tmc.h"
> +
> +static irqreturn_t byte_cntr_handler(int irq, void *data)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
> +
> +	atomic_inc(&byte_cntr_data->irq_cnt);
> +	wake_up(&byte_cntr_data->wq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void ctcu_reset_sysfs_buf(struct tmc_drvdata *drvdata)

minor nit: This has nothing to do with the CTCU. For what it is worth,
it must be called, tmc_etr_reset_sysf_buf(). But more on this below,
and even do we need it, further below.

> +{
> +	u32 sts;
> +
> +	CS_UNLOCK(drvdata->base);
> +	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
> +	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
> +	writel_relaxed(sts, drvdata->base + TMC_STS);
> +	CS_LOCK(drvdata->base);

Could we not keep this function in the tmc-etr.c and invoke from here ?

> +}
> +
> +static void ctcu_cfg_byte_cntr_reg(struct tmc_drvdata *drvdata, u32 val, u32 offset)
> +{
> +	struct ctcu_drvdata *ctcu_drvdata;
> +	struct coresight_device *helper;
> +
> +	helper = tmc_etr_get_ctcu_device(drvdata);
> +	if (!helper)
> +		return;
> +
> +	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
> +	/* A one value for IRQCTRL register represents 8 bytes */
> +	ctcu_program_register(ctcu_drvdata, val / 8, offset);
> +}
> +
> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr_data(struct tmc_drvdata *drvdata)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	struct ctcu_drvdata *ctcu_drvdata;
> +	struct coresight_device *helper;
> +	int port;
> +
> +	helper = tmc_etr_get_ctcu_device(drvdata);
> +	if (!helper)
> +		return NULL;
> +



> +	port = coresight_get_in_port(drvdata->csdev, helper);
> +	if (port < 0)
> +		return NULL;
> +

Please validate that the port_num you get is valid for the CTCU ? That 
applies to all uses of this construct.

> +	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
> +	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
> +	return byte_cntr_data;



nit:
	return  &ctcu_drvdata->byte_cntr_data[port]; ?

Also, why not make this into a helper, as we seem to use this other 
places too ?


> +}
> +
> +static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
> +					 struct ctcu_byte_cntr *byte_cntr_data)
> +{
> +	struct etr_buf_node *nd, *next, *curr_node, *picked_node;
> +	struct etr_buf *curr_buf = drvdata->sysfs_buf;
> +	bool found_free_buf = false;
> +
> +	if (WARN_ON(!drvdata || !byte_cntr_data))
> +		return found_free_buf;
> +
> +	/* Stop the ETR before initiating the switch */
> +	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
> +		tmc_etr_enable_disable_hw(drvdata, false);
> +
> +	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
> +		/* curr_buf is free for next round */
> +		if (nd->sysfs_buf == curr_buf) {
> +			nd->is_free = true;
> +			curr_node = nd;

  ---8>--
> +		}
> +
> +		if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {

--<8---
		} else if (!found_free_buf && nd->is_free) {
		
> +			picked_node = nd;
> +			found_free_buf = true;
> +		}
> +	}
> +
> +	if (found_free_buf) {
> +		curr_node->pos = 0;
> +		drvdata->buf_node = curr_node;

Why are we adding something new into the drvdata ? Could we not extend
the sysfs_buf struct and add the "link" there ? That would make it much
more simpler ?

> +		drvdata->sysfs_buf = picked_node->sysfs_buf;
> +		drvdata->etr_buf = picked_node->sysfs_buf;
> +		picked_node->is_free = false;
> +		/* Reset irq_cnt for next etr_buf */
> +		atomic_set(&byte_cntr_data->irq_cnt, 0);
> +		/* Reset rrp and rwp when the system has switched the buffer*/
> +		ctcu_reset_sysfs_buf(drvdata);

Why do we do this ? Could we not leave this to the __tmc_etr_enable() 
below ?

> +		/* Restart the ETR once a free buffer is available */
> +		if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
> +			tmc_etr_enable_disable_hw(drvdata, true);
> +	}
> +
> +	return found_free_buf;
> +}
> +
> +/*
> + * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
> + * The byte-cntr reading work reads data from the deactivated and filled buffer.
> + * The read operation waits for a buffer to become available, either filled or
> + * upon timeout, and then reads trace data from the synced buffer.
> + */
> +static ssize_t ctcu_byte_cntr_get_data(struct tmc_drvdata *drvdata, loff_t pos,
> +				       size_t len, char **bufpp)
> +{
> +	struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
> +	struct device *dev = &drvdata->csdev->dev;
> +	ssize_t actual, size = sysfs_buf->size;
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	size_t thresh_val;
> +	atomic_t *irq_cnt;
> +	int ret;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
> +	if (!byte_cntr_data)
> +		return -EINVAL;
> +
> +	thresh_val = byte_cntr_data->thresh_val;
> +	irq_cnt = &byte_cntr_data->irq_cnt;
> +
> +wait_buffer:
> +	if (!byte_cntr_data->reading_data) {
> +		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
> +				((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
> +				!byte_cntr_data->enable,
> +				BYTE_CNTR_TIMEOUT);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * The current etr_buf is almost full or timeout is triggered,
> +		 * so switch the buffer and mark the switched buffer as reading.
> +		 */
> +		if (byte_cntr_data->enable) {
> +			if (!ctcu_byte_cntr_switch_buffer(drvdata, byte_cntr_data)) {
> +				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
> +				return -EINVAL;
> +			}
> +
> +			byte_cntr_data->reading_data = true;
> +		} else {
> +			/*
> +			 * TMC-ETR has been disabled, so directly reads data from
> +			 * the drvdata->sysfs_buf.
> +			 */
> +			actual = etr_sysfs_ops.get_trace_data(drvdata, pos, len, bufpp);
> +			if (actual > 0) {
> +				byte_cntr_data->total_size += actual;
> +				return actual;
> +			}
> +
> +			/* Exit byte-cntr reading */
> +			return 0;
> +		}
> +	}
> +
> +	/* Check the status of current etr_buf*/
> +	if (atomic_read(irq_cnt) * thresh_val >= size)
> +		dev_warn(dev, "Data overwrite happened\n");
> +
> +	pos = drvdata->buf_node->pos;
> +	actual = etr_sysfs_ops.get_trace_data(drvdata, pos, len, bufpp);
> +	if (actual <= 0) {
> +		/* Reset flags upon reading is finished or failed */
> +		byte_cntr_data->reading_data = false;
> +		drvdata->buf_node = NULL;
> +
> +		/*
> +		 * Nothing in the buffer, waiting for the next buffer
> +		 * to be filled.
> +		 */
> +		if (actual == 0)
> +			goto wait_buffer;
> +	} else
> +		byte_cntr_data->total_size += actual;
> +
> +	return actual;
> +}
> +
> +static int ctcu_read_prepare_byte_cntr(struct tmc_drvdata *drvdata)

Please use "tmc_data" or even "etr_drvdata" to make it easier to read
the code below

> +{
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
> +	if (!byte_cntr_data)
> +		return -EINVAL;
> +
> +	/*
> +	 * The threshold value must not exceed the buffer size.
> +	 * A margin should be maintained between the two values to account
> +	 * for the time gap between the interrupt and buffer switching.
> +	 */
> +	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {

Whats the magic number SZ_16K ? Comment could explain it.

> +		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");

Could the threshold be a percentage of the size used by the ETR (You 
could always align it to the nearest PAGE_SIZE)? That would make it
convenient for people to change the ETR size and not  having to bother
about moving the threshold value with the ETR size.

> +		return -EINVAL;
> +	}
> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	if (byte_cntr_data->reading) {
> +		ret = -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	byte_cntr_data->reading = true;
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);

All of this can be avoided by retaining the etr_sysf_ops in TMC-> and
calling into the CTCU after basic checks.

> +	/* Setup an available etr_buf_list for byte-cntr */
> +	ret = tmc_create_etr_buf_list(drvdata, 2);
> +	if (ret)
> +		goto out;
> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	atomic_set(&byte_cntr_data->irq_cnt, 0);
> +	/* Configure the byte-cntr register to enable IRQ */
> +	ctcu_cfg_byte_cntr_reg(drvdata, byte_cntr_data->thresh_val,
> +			       byte_cntr_data->irq_ctrl_offset);

Is there no way of going back to the ctcu_drvdata from byte_cntr_data ?
For a starter, we could easily store the ctcu_drvdata in byte_cntr_data
and always write straight to the device, rather than always going to the
ETR drvdata in ctcu_cfg_byte_cntr_reg() ?

> +	enable_irq_wake(byte_cntr_data->irq);
> +	byte_cntr_data->total_size = 0;
> +
> +out_unlock:
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +out:
> +	return ret;
> +}
> +
> +static int ctcu_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata)

Same as above. name

> +{
> +	struct device *dev = &drvdata->csdev->dev;
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	unsigned long flags;
> +
> +	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
> +	if (!byte_cntr_data)
> +		return -EINVAL;
> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +	/* Configure the byte-cntr register to disable IRQ */
> +	ctcu_cfg_byte_cntr_reg(drvdata, 0, byte_cntr_data->irq_ctrl_offset);


> +	disable_irq_wake(byte_cntr_data->irq);
> +	byte_cntr_data->reading = false;
> +	byte_cntr_data->reading_data = false;
> +	drvdata->buf_node = NULL;


> +	/* Restore the original sysfs_ops */
> +	drvdata->sysfs_ops = &etr_sysfs_ops;

Please see if you can avoid it.

> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	dev_dbg(dev, "send data total size:%llu bytes\n", byte_cntr_data->total_size);
> +	tmc_clean_etr_buf_list(drvdata);
> +
> +	return 0;
> +}
> +
> +const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
> +	.read_prepare	= ctcu_read_prepare_byte_cntr,
> +	.read_unprepare	= ctcu_read_unprepare_byte_cntr,
> +	.get_trace_data	= ctcu_byte_cntr_get_data,
> +};
> +
> +/* Start the byte-cntr function when the path is enabled. */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	struct coresight_device *sink = coresight_get_sink(path);
> +	struct tmc_drvdata *tmc_drvdata = dev_get_drvdata(sink->dev.parent);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	int port_num;
> +
> +	port_num = coresight_get_in_port(sink, csdev);
> +	if (port_num < 0)
> +		return;
> +
> +	byte_cntr_data = &drvdata->byte_cntr_data[port_num];

instance 2

> +	/* Don't start byte-cntr function when threshold is not set. */
> +	if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	byte_cntr_data->enable = true;
> +	byte_cntr_data->reading_data = false;
> +	/* Replace with byte-cntr's sysfs_ops */
> +	tmc_drvdata->sysfs_ops = &byte_cntr_sysfs_ops;

Why are we hacking this ? This looks *very ugly* and we are doing this 
without any locks at the tmc-etr driver !!! ?? Could we not call out
from the etr_sysf_ops into the CTCU ops based some checks ?
Anyways, please don't change anything in the tmc_drvdata from this
driver, especially not the "operations".

Also the locking seems inconsistent. Here we use byte_cntr_data->lock.
But in ctcu_read_unprepare_byte_cntr(), we use the TMC-ETR spinlock 
:facepalm:



> +}
> +
> +/* Stop the byte-cntr function when the path is disabled. */
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	struct coresight_device *sink = coresight_get_sink(path);
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	int port_num;
> +
> +	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
> +		return;
> + 
> +	port_num = coresight_get_in_port(sink, csdev);
> +	if (port_num < 0)
> +		return;
> +
> +	byte_cntr_data = &drvdata->byte_cntr_data[port_num];

instance 3




> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +	byte_cntr_data->enable = false;
> +}
> +
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
> +{
> +	struct ctcu_byte_cntr *byte_cntr_data;
> +	struct device_node *nd = dev->of_node;
> +	int irq_num, ret, i;
> +
> +	for (i = 0; i < etr_num; i++) {
> +		byte_cntr_data = &drvdata->byte_cntr_data[i];
> +		irq_num = of_irq_get(nd, i);
> +		if (irq_num < 0) {
> +			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
> +			continue;
> +		}
> +
> +		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
> +				       IRQF_TRIGGER_RISING | IRQF_SHARED,
> +				       dev_name(dev), byte_cntr_data);
> +		if (ret) {
> +			dev_err(dev, "Failed to register IRQ for port%d\n", i);
> +			continue;
> +		}
> +
> +		byte_cntr_data->irq = irq_num;
> +		init_waitqueue_head(&byte_cntr_data->wq);
> +		raw_spin_lock_init(&byte_cntr_data->spin_lock);
> +	}
> +}
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index e8720026c9e3..60f1db3ab70d 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -15,6 +15,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/slab.h>
> +#include <linux/sizes.h>
>   
>   #include "coresight-ctcu.h"
>   #include "coresight-priv.h"
> @@ -43,17 +44,21 @@
>   
>   #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
>   #define CTCU_ATID_REG_SIZE		0x10
> +#define CTCU_ETR0_IRQCTRL               0x6c
> +#define CTCU_ETR1_IRQCTRL               0x70
>   #define CTCU_ETR0_ATID0			0xf8
>   #define CTCU_ETR1_ATID0			0x108
>   
>   static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>   	{
> -		.atid_offset	= CTCU_ETR0_ATID0,
> -		.port_num	= 0,
> +		.atid_offset		= CTCU_ETR0_ATID0,
> +		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
> +		.port_num		= 0,
>   	},
>   	{
> -		.atid_offset	= CTCU_ETR1_ATID0,
> -		.port_num	= 1,
> +		.atid_offset		= CTCU_ETR1_ATID0,
> +		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
> +		.port_num		= 1,
>   	},
>   };
>   
> @@ -62,6 +67,88 @@ static const struct ctcu_config sa8775p_cfgs = {
>   	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
>   };
>   
> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
> +{
> +	CS_UNLOCK(drvdata->base);
> +	ctcu_writel(drvdata, val, offset);
> +	CS_LOCK(drvdata->base);
> +}
> +
> +static ssize_t irq_threshold_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +
> +	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		return -EINVAL;
> +
> +	return sysfs_emit(buf, "%u\n",
> +			(unsigned int)drvdata->byte_cntr_data[port].thresh_val);
> +}
> +
> +static ssize_t irq_threshold_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf,
> +				   size_t size)
> +{
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	/* Threshold 0 disables the interruption. */
> +	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> +	/* A small threshold will result in a large number of interruptions */
> +	if (val && val < SZ_4K)
> +		return -EINVAL;
> +
> +	if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		drvdata->byte_cntr_data[port].thresh_val = val;
> +
> +	return size;
> +}
> +
> +static umode_t irq_threshold_is_visible(struct kobject *kobj,
> +					struct attribute *attr, int n)
> +{
> +	struct device_attribute *dev_attr =
> +		container_of(attr, struct device_attribute, attr);
> +	struct ctcu_byte_cntr_irq_attribute *irq_attr =
> +		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	u8 port = irq_attr->port;
> +
> +	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
> +		return attr->mode;
> +
> +	return 0;
> +}
> +
> +static struct attribute *ctcu_attrs[] = {
> +	ctcu_byte_cntr_irq_rw(0),
> +	ctcu_byte_cntr_irq_rw(1),
> +	NULL,
> +};
> +
> +static struct attribute_group ctcu_attr_grp = {
> +	.attrs = ctcu_attrs,
> +	.is_visible = irq_threshold_is_visible,
> +};
> +
> +static const struct attribute_group *ctcu_attr_grps[] = {
> +	&ctcu_attr_grp,
> +	NULL,
> +};
> +
>   static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
>   				       u8 bit, bool enable)
>   {
> @@ -140,11 +227,15 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
>   static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       struct coresight_path *path)
>   {
> +	ctcu_byte_cntr_start(csdev, path);
> +
>   	return ctcu_set_etr_traceid(csdev, path, true);
>   }
>   
>   static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
>   {
> +	ctcu_byte_cntr_stop(csdev, path);
> +
>   	return ctcu_set_etr_traceid(csdev, path, false);
>   }
>   
> @@ -195,7 +286,10 @@ static int ctcu_probe(struct platform_device *pdev)
>   			for (i = 0; i < cfgs->num_etr_config; i++) {
>   				etr_cfg = &cfgs->etr_cfgs[i];
>   				drvdata->atid_offset[i] = etr_cfg->atid_offset;
> +				drvdata->byte_cntr_data[i].irq_ctrl_offset =
> +					etr_cfg->irq_ctrl_offset;
>   			}
> +			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>   		}
>   	}
>   
> @@ -209,6 +303,7 @@ static int ctcu_probe(struct platform_device *pdev)
>   	desc.dev = dev;
>   	desc.ops = &ctcu_ops;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> +	desc.groups = ctcu_attr_grps;
>   	raw_spin_lock_init(&drvdata->spin_lock);
>   
>   	drvdata->csdev = coresight_register(&desc);
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
> index e9594c38dd91..c52cf6a33d2e 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -5,19 +5,26 @@
>   
>   #ifndef _CORESIGHT_CTCU_H
>   #define _CORESIGHT_CTCU_H
> +
> +#include <linux/time.h>
>   #include "coresight-trace-id.h"
>   
>   /* Maximum number of supported ETR devices for a single CTCU. */
>   #define ETR_MAX_NUM	2
>   
> +#define BYTE_CNTR_TIMEOUT	(3 * HZ)
> +
>   /**
>    * struct ctcu_etr_config
>    * @atid_offset:	offset to the ATID0 Register.
> - * @port_num:		in-port number of CTCU device that connected to ETR.
> + * @port_num:		in-port number of the CTCU device that connected to ETR.
> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
> + * @irq_name:           IRQ name in dt node.
>    */
>   struct ctcu_etr_config {
>   	const u32 atid_offset;
>   	const u32 port_num;
> +	const u32 irq_ctrl_offset;
>   };
>   
>   struct ctcu_config {
> @@ -25,15 +32,68 @@ struct ctcu_config {
>   	int num_etr_config;
>   };
>   
> -struct ctcu_drvdata {
> -	void __iomem		*base;
> -	struct clk		*apb_clk;
> -	struct device		*dev;
> -	struct coresight_device	*csdev;
> +/**
> + * struct ctcu_byte_cntr
> + * @enable:		indicates that byte_cntr function is enabled or not.
> + * @reading:		indicates that byte-cntr reading is started.
> + * @reading_data:	indicates that byte-cntr is reading data from the buffer.
> + * @thresh_val:		threshold to trigger a interruption.
> + * @total_size:		total size of the transferred data.
> + * @irq:		allocated number of the IRQ.
> + * @irq_cnt:		IRQ count number for triggered interruptions.
> + * @wq:			waitqueue for reading data from ETR buffer.
> + * @spin_lock:		spinlock of byte_cntr_data.
> + * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
> + */
> +struct ctcu_byte_cntr {
> +	bool			enable;
> +	bool                    reading;
> +	bool			reading_data;
> +	u32			thresh_val;
> +	u64			total_size;
> +	int			irq;
> +	atomic_t		irq_cnt;
> +	wait_queue_head_t	wq;
>   	raw_spinlock_t		spin_lock;
> -	u32			atid_offset[ETR_MAX_NUM];
> +	u32			irq_ctrl_offset;
> +};
> +
> +struct ctcu_drvdata {
> +	void __iomem			*base;
> +	struct clk			*apb_clk;
> +	struct device			*dev;
> +	struct coresight_device		*csdev;
> +	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
> +	raw_spinlock_t			spin_lock;
> +	u32				atid_offset[ETR_MAX_NUM];
>   	/* refcnt for each traceid of each sink */
> -	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
> +	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
>   };
>   
> +/**
> + * struct ctcu_irq_thresh_attribute
> + * @attr:	The device attribute.
> + * @idx:	port number.
> + */
> +struct ctcu_byte_cntr_irq_attribute {
> +	struct device_attribute	attr;
> +	u8			port;
> +};
> +
> +#define ctcu_byte_cntr_irq_rw(port)					\
> +	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
> +	   {								\
> +		__ATTR(irq_threshold##port, 0644, irq_threshold_show,	\
> +		irq_threshold_store),					\
> +		port,							\
> +	   }								\
> +	})[0].attr.attr)
> +
> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
> +
> +/* Byte-cntr functions */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
> +
>   #endif
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 110eedde077f..948ea864f2a1 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -293,7 +293,10 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
>   		return -EFAULT;
>   	}
>   
> -	*ppos += actual;
> +	if (drvdata->buf_node)
> +		drvdata->buf_node->pos += actual;
> +	else
> +		*ppos += actual;
>   	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>   
>   	return actual;
> @@ -748,11 +751,12 @@ static const struct tmc_sysfs_ops etb_sysfs_ops = {
>   	.get_trace_data	= tmc_etb_get_sysfs_trace,
>   };
>   
> -static const struct tmc_sysfs_ops etr_sysfs_ops = {
> +const struct tmc_sysfs_ops etr_sysfs_ops = {
>   	.read_prepare	= tmc_read_prepare_etr,
>   	.read_unprepare	= tmc_read_unprepare_etr,
>   	.get_trace_data	= tmc_etr_get_sysfs_trace,
>   };
> +EXPORT_SYMBOL_GPL(etr_sysfs_ops);
>   
>   static int __tmc_probe(struct device *dev, struct resource *res)
>   {
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index f4223215ef8d..8896fb7a9ed3 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1185,6 +1185,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>   	ssize_t actual = len;
>   	struct etr_buf *etr_buf = drvdata->sysfs_buf;
>   
> +	/* Reading the buffer from the buf_node if it exists*/
> +	if (drvdata->buf_node)
> +		etr_buf = drvdata->buf_node->sysfs_buf;
> +
>   	if (pos + actual > etr_buf->len)
>   		actual = etr_buf->len - pos;
>   	if (actual <= 0)
> @@ -1248,6 +1252,20 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>   
>   }
>   
> +/**
> + * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
> + * @drvdata:	drvdata of the TMC device.
> + * @enable:	indicates enable/disable.
> + */
> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
> +{
> +	if (enable)
> +		__tmc_etr_enable_hw(drvdata);
> +	else
> +		__tmc_etr_disable_hw(drvdata);
> +}
> +EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
> +
>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>   {
>   	__tmc_etr_disable_hw(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index aaa443abe8e9..183c649b982c 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -260,6 +260,7 @@ struct etr_buf_node {
>    *		 Used by ETR/ETF.
>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>    * @sysfs_ops:	Read operations for the sysfs mode.
> + * @buf_node:	Available buffer_node for byte-cntr reading.
>    */
>   struct tmc_drvdata {
>   	struct clk		*atclk;
> @@ -292,6 +293,7 @@ struct tmc_drvdata {
>   	struct tmc_resrv_buf	crash_mdata;
>   	struct list_head        etr_buf_list;
>   	const struct tmc_sysfs_ops	*sysfs_ops;
> +	struct etr_buf_node	*buf_node;
>   };
>   
>   /**
> @@ -371,6 +373,7 @@ void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
>   extern const struct coresight_ops tmc_etr_cs_ops;
>   ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>   				loff_t pos, size_t len, char **bufpp);
> +extern const struct tmc_sysfs_ops etr_sysfs_ops;
>   
>   
>   #define TMC_REG_PAIR(name, lo_off, hi_off)				\
> @@ -480,5 +483,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>   extern const struct attribute_group coresight_etr_group;
>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable);
>   
>   #endif
> 


