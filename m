Return-Path: <linux-arm-msm+bounces-115326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3qOoMOp8Q2r5ZAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:23:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6D6E19EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:23:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=selector1 header.b=dsaSpsY5;
	dkim=pass header.d=arm.com header.s=selector1 header.b=dsaSpsY5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115326-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115326-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=reject ("cv is fail on i=3")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2BF53008D41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FD83876B7;
	Tue, 30 Jun 2026 08:23:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83424386554;
	Tue, 30 Jun 2026 08:22:59 +0000 (UTC)
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807782; cv=fail; b=HTWR0w8r2X72SIlWw95bEfIxM+a2sIEOJnOaKcMK17TZ00hym6ONsZc+JWQU9GQHPPQqrWCBg1nNH1YbhiEj7uPdmBmtnJdG6HBmxZxROfdHtsfjKQ9wKPguQX9/oXwI3Vu+u7nVDDXPnekLFKpkEaRhHTFwxtKVLfz7qgacx6o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807782; c=relaxed/simple;
	bh=dsNs8OcIEfVNVndiktayMOZsWYUpyQzObQtNjM5Rwoo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZOX2yr3joUPgrndzZXdrSFzYW3j+QybAF+ONKCeEkdsVl56dMnw51/AT0jVqsxWDYgPPB7vwqgIaGX7pGTVNyGPOUbGk5KltXnle+RVO10XWvQExzBkZRkvP36z+gXCv6s6i0q65YP0R65UVOoAwXtIBMkm+NffQR2qd1A/86jg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dsaSpsY5; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dsaSpsY5; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SRWqYRLXs0oeuOn125+epwwBQ7JhcHYfEEUBX7BNDKD8Hkt9xAzWNcQQuBhNBAxIKEwyA1hjOij/2E+YwJBCek5sio21dPpnWmteNOrSjEGawpLLff/xtObO/E7g9tY+jCYU+wc0Mq+Dwf7Ppa+YrcqWn+z1jeQY66coZSaTdMjYDSXgd7o/1xonV4RQupLv8ErpFgOAidGkXZqZTjvT7iTVBXfrXK/rWsXwPGeAUgvvVYwHN1xnMforFoG+p6m8zBUy7QbvwhRjANvycMcL889e1hf4NLeB0cZDFfq/PBDiC7P1n1QGXJ//nTyGJRabz/BPMZ4mTkX0jjT8cgE4Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuR+QqO8KC7wgbVqD+4lW9kvGSFpU9pEedz0l1BbOx8=;
 b=re+VVq/DUFgfehByouO866w1r+tIwjCHpMJ3aGuCBbjOv45fsIyuLKShe6pidqSBxjo6fwyjvFOPKRGDg98eStv9/OiBkit4daWEoqsifdrdJm7LXKdt6YquqBw076gXaYNkqh70H53YvAAAxA4SNYsqK6vGxR8tURKPiU3o2ofbtByRLkGecSGderdzmhEXQ0O1fR2S+EBYLzAfy48+iyvav2ZMoBZWFYQEWCyzsjoy/r4XavwcuHPsohHUA0lSNFNAR2nWsR8oDp5Gyv2DhurkvaUT6HPqSEo2ZExPXYEd3Ztuhfbg/mSq8lcGcB8em+fgXB7Zlzyg+3z6Wq4ERg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuR+QqO8KC7wgbVqD+4lW9kvGSFpU9pEedz0l1BbOx8=;
 b=dsaSpsY58FxXCbGIaQnmpzxHgyZ56DQXJ9KlYGN0npAVhLCGrKyU7bPnPNBR6GRzTxxJeOWpKM5ZBuZMg2ZnpJnqjEMtMXgL0rMqgz+FphfhvT2cV/8G4/blndQPSgAjy1GZX+P1EMyhi0Ln0hMxV6npJ9v5TjdjGN0E4kDJSKg=
Received: from DB8PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:10:110::28)
 by AS2PR08MB9644.eurprd08.prod.outlook.com (2603:10a6:20b:607::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:22:47 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::8f) by DB8PR04CA0018.outlook.office365.com
 (2603:10a6:10:110::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 08:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 08:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKWzTj5YmLx0l3ALjoyX9oi7F/tPkObHBZNk2jhgSseGeDj4gyn6etvB74cGibWumtF8wrUUzEkB06NNzlj9yLNX1gnf6QsvI8maK0MnIz/Uza3kL5mVq64Eq4lJe1VDZkm6bloEAFwOGiB0Qo2VQuckA3Mpj/SrveYyZl6GFxuAHiLKnTtRhbb02D8xcBniNihYQxeAMz9pPr4kALZFe47tuPW9cqpVwkK8cSzE+ul0reA4P/dAE5Q3ktiyLpN++J1zeWK+o0C/oPt0rPm0q21EVx0TEffv3n4yAP1RWqBOiPVVMjee0rn5IQzzRh7T1fNTCqm6JeZ6riDxsNMDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuR+QqO8KC7wgbVqD+4lW9kvGSFpU9pEedz0l1BbOx8=;
 b=OVxuS8L9aTBESXk30B/36fwIR3tK9tjquvzEQhx95Vg15ZUbCgVSJ2l/WiT9iUly7jQUBGNuExt1AbPh0FPZrwfl7MoSPZSpYxDMtJ7E5faOjN+6ZaI0JSrlaO9vWECnOpunVmXqi/0+HGSeOJybQqy+LsYQ2oMbdCfjABK9/AgTj1ZgagdpD5jZFkA8v7MvbKXHH0PT2KjHngCuecqYhvaS4ICTDz2LffmBrsJJMgryAzKT/2cLK/OLGS3bdLh35Mpxr52ZwexFExhLb3AukdNLblvbee4N4dmYEmQhLYAnJKDVsIx4EQRclCPOUcXnyyA3jSrlWeSW08/Flju7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuR+QqO8KC7wgbVqD+4lW9kvGSFpU9pEedz0l1BbOx8=;
 b=dsaSpsY58FxXCbGIaQnmpzxHgyZ56DQXJ9KlYGN0npAVhLCGrKyU7bPnPNBR6GRzTxxJeOWpKM5ZBuZMg2ZnpJnqjEMtMXgL0rMqgz+FphfhvT2cV/8G4/blndQPSgAjy1GZX+P1EMyhi0Ln0hMxV6npJ9v5TjdjGN0E4kDJSKg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by PAVPR08MB9842.eurprd08.prod.outlook.com (2603:10a6:102:31e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:21:40 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:21:40 +0000
Message-ID: <294ee11d-91f6-491b-9ba3-a04dbba89d60@arm.com>
Date: Tue, 30 Jun 2026 09:21:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Jie Gan <jie.gan@oss.qualcomm.com>, Leo Yan <leo.yan@arm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
 <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0609.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::11) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB10975:EE_|PAVPR08MB9842:EE_|DB3PEPF0000885D:EE_|AS2PR08MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: c55d7897-b78c-4ba4-6d03-08ded680c425
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|56012099006|4143699003|18096099006|11063799006|20046099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 tnkm/o0oYXBlW4HBNQkTXPBYB7N9tGkUT0YI4vDlZ+wJ4baliexnRkcWlJxWh/ubdg3YsatNAFqfUJ0gEyg+zKeZG72KS8p1xHY4JzEl+l7Na0iFQaPAISk4ydi+CPZHAo6dwU9eiI/jR85XIrSQhXJRM4fXS87z++TTDb0ROZbdH/WmSUOjxIHfm9XFE4IJnEMX/56nlIWAQVIkzpdUzorSs/Mo/JV6WSZqO5NZhn/iv1qRNc+qexN6rrr8KCKrdkB3Qd3+d7sQTXL2pGVZWuBfZM7RKZF/NYdLahrhVyr0lTBJbiBIC2ytjZrHQu6P4Eg0pe/IhDG97ecpQsOUEPIzOq1S1VrASYhPxqA/uIMg9ya4J6Ye2E20eVRm/B1ms8C4WJC+bYn9VxJ8LnngFwltgJr++5sLFariUnFS4sZxgfB1B0VjbFEhNLDYcxSbZNm1jE0tPw15nVN9onqwaXnXQGRX/4PWl2koItB4qrw9Gmu/R6kb2Q+6mAW5+dI3qi8olTpM5wUI2LABQ8kPDG3AA9VPvD9+ZzjW9sl3Us90dBw9uAMzrZKD4uVzr885vmu/RW/Cxnmt7rnfH2Gk+/SRd9N4e5D+hd0D/JxPsHRkOzdc09NJyVkZwObO1IXdO3rC+efUHeYjxIAdednVGJwxPn06T8qxTcKBAdVlKFQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(56012099006)(4143699003)(18096099006)(11063799006)(20046099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 WRyl268QGp2EJ+SNTu5riXryEtbVZ4wqEeHAK6GwS5dXOOT4vtOY+y5yoY6mONlnc/gDXaFk5r0v+VV/nK+5VUnP1vlMu9nNLwVDoz7iKlZMNZMAfIZvBXo3sRH1jmt+gdtRsYZXEwiXOlxqu6DZfXg7IZMtP1U9TLZfWEdMNTwgucGIAB9fJQj3G07PNYZEdWSmSMTvcl/w0DiEGQbpH0LVT+hO/OkatSXKVuzWOy4OJG609dS2QqFwAl3A+LSGtNb0zIuUiiomK6lIJe4xYEvHOLr25YY4E8ex2Q9p5TCd613rBgaz/rodvnlW855J9yDFhg1s88T2uty2KbH/Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9842
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	898c5b65-1c62-4a5f-3fb8-08ded6809c59
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|7416014|23010399003|14060799003|1800799024|82310400026|36860700016|376014|22082099003|11063799006|18002099003|4143699003|18096099006|6133799003|20046099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qNwEBMrnPJLHp0l6/6BLoYsou/EOyBOITdfKHvi6yOHH86zLFzaGJmIQ9gLaFPWaMBj7xXp1VxtXGUCyjJ9HWSK8Q6Y4isTIWZedNsZXA8zXeg2EJRdH8nwitMYrDKgekSboMTsMIDkr9gSAnDl+nK9ymjKG9O6gQpHsy2fVsP0DyenBfpWrY8JVEEAHUrFGxEPryK2CfusDOyh9wXvwpcH9mN0RQGDpMRXorR//0OjuQG8AiGzs8vFvPqCbbgF+Q/OUGKYbkoff8gd7a5XKQiqP1mmc2BrGyVhPAglIxD0g9J3t628hGDz77tb5Lije5bnb7Ss0Ykh9S11ovq3CmF4VX/HCbQh9mMFF2hVvUZTBZwPb7CIToaMnJgCYxsjNcvyxDoFydM5Uqzn5IroaT+Gn9UziOy/gGo87mldgDFcA4jbdceZ/8/lE6Euv9eGvrR0X5kry5kAIGAZ+24U3HjPDdf/oW/XW1N7qngUKhh+vbn27wmjXxcHCqynqaleo4T45UC9Bzb+kniRXKIGFQRe76Ptnt1vxHO+uz/AJ43nLOxPVpgMxA1JC6CC6ZwrZhS6Yo88J77l/oNftmxSrENlui3WiRYtNdwEXTz4eq6yBk0xNjsPNrjSqnniQMhTWJMv6qXhgdKzn7PonF1nIWxuIlhClMJMm9yEWhaJ/SLRNGyxZ64gJDexMSidnFF6dZO5FqZa/ai/6sjiorxcV2A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(7416014)(23010399003)(14060799003)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(11063799006)(18002099003)(4143699003)(18096099006)(6133799003)(20046099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FzUtrN0zbwZNL5+mvYhe8RluBSTWLniMGKdau/UHrISapgZmUiQfZWLyXPK9ZPIBY7bm3XoWHrmyomE1Lka6U8zKecAfJEqCW03IZ1CagzeNCtAMsokA0XyODMkLoHSRMUYNCxFosmEFke8o2B4NnCljfikrEo86EpatI0fHaW0/DOeuPuuQ0ofWO0UpzgSNDF7op/w+kEjZNNWFt76udlWPexXV8Lguc8vbs2eGILcO1HrF7hJqijbSHzgeWcHEyn75yEGJ54eTtT9eWmFJowP7oRt8tBmI8fe7mJdiMFTl+811yn6puK/c+64r1+8KN/YDggyXulF/kWwhPmLOTXXZiyRIU20rOg+T121OOJPJs+XXY+bn0OEEfh3yr9NbiSOnOQNIAwCdrT0LSIOJcRCTucRAuYV74yJzZkxaLbNo70DbpMJxPaBLU6fNJDH7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:22:46.7150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c55d7897-b78c-4ba4-6d03-08ded680c425
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9644
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-115326-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:leo.yan@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84E6D6E19EA

On 30/06/2026 02:03, Jie Gan wrote:
> 
> 
> On 6/29/2026 10:28 PM, Leo Yan wrote:
>> On Mon, Jun 29, 2026 at 10:08:17AM +0800, Jie Gan wrote:
>>
>> [...]
>>
>>> Can I fix the issue by adding "arm,primecell-periphid" property. That's
>>> would be the best temp solution as it avoids breaking the original 
>>> design of
>>> both the TraceNoC AMBA driver and interconnect TraceNoC platform driver.
>>
>> Before proceeding with the "arm,primecell-periphid" property, could you
>> clarify a bit:
>>
>>    - For an interconnect TraceNoC, what would be the consequence of
>>      enabling ATID? Would it simply be a no-op, or are there any side
>>      effects? Or is the concern that the trace IDs could be exhausted?
>>
> 
> TPDM0(or ATB source) -> interconnect TraceNoC0 -> Aggregator TraceNoc -> 
> sink
> TPDM1(or ATB source) -> interconnect TraceNoC1 -> Aggregator TraceNoc -> 
> sink
> 
> We only have one Aggregator TraceNoC and many interconnect TraceNoC 
> devices for one platform. All interconnect TraceNoC devices are 
> connected to Aggregator TraceNoC devices in the topology, so the itnoc 
> doesnt need an ATID.
> 
> That's the design purpose from hardware perspective.
> 
> 
>>    - How can you guarantee that a interconnect TraceNoC will never
>>      require ATID in the future?
>>
> 
> The interconnect TraceNoC is primarily introduced to reduce routing 
> complexity in the hardware design. It is typically deployed as an 
> intermediate TraceNoC that connects to an Aggregator TraceNoC (AG 
> TraceNoC).


You can always distinguish one from the other by checking the
"compatibles"  or even add a custom data field to the of_device_id
table for the platform driver. Personally, I think it is better to
keep things away from AMBA framework, when we get everything from
platform driver.

Cheers
Suzuki


> 
> For example, a modem subsystem may contain many TPDM devices. Directly 
> connecting every TPDM to the AG TraceNoC would result in significant 
> wiring complexity. Instead, an itnoc is placed within the modem 
> subsystem to locally aggregate the TPDM connections. All TPDMs first 
> connect to the itnoc, and the itnoc then connects to the system-level AG 
> TraceNoC.
> 
>  From a hardware perspective, there is no fundamental difference between 
> an itnoc and an AG TraceNoC. They use the same TraceNoC hardware 
> implementation and share the same AMBA bus type. The distinction is 
> purely functional: an itnoc is used for local trace aggregation within a 
> subsystem, whereas an AG TraceNoC serves as the top-level aggregation 
> point for the SoC.
> 
> Thanks,
> Jie
> 
>>> The TraceNoC device here must be treated as an AMBA device and I am
>>> continuing to investigate the issue with our hardware team.
>>
>>> We aim to fix it from hardware perspetive for existing platforms if 
>>> possible
>>> and ensure it is fixed in future platforms.
>>
>> I'm concerned that all of use end up repeatedly fixing similar issues
>> whenever hardware configurations change or modules are reused in
>> different topologies.
>>
>> For example, if future platforms may require ATID support for an
>> interconnect TraceNoC, then the issue will pop up again.
>>
>> Thanks,
>> Leo
> 


