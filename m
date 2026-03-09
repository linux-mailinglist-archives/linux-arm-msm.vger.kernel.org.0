Return-Path: <linux-arm-msm+bounces-96185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM3hDe6armmqGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:03:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C95236B33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB0C430054DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFEC3783A8;
	Mon,  9 Mar 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TFr2jMWJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TFr2jMWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6665D37CD38;
	Mon,  9 Mar 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.8
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050602; cv=fail; b=YDjfuj0v6Y6Ynd7JOLwthj8lJCWu4E1Mj2oigqcQMkhPKTvAFaUhu1/TD2zimfErEbGChtfb4bOe1qpabsUR2G4lbqGiRnm0qe4tTz1Oy+kD/KzOOzJX6+uhl7b8rKm91DT+1W7gu44pd6iXfybjKtR07HW6889sjw0jmpKHp5E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050602; c=relaxed/simple;
	bh=8MMwKTCJDk6rK7n9PDiK8aUfMG8heeSGFwdv4c8Hra8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HMwe0FMyCWsTbwPGlz19UNzUlV0u6FJsB7vwS8Y3JDnH7fUA1rBXJGtjkSpuAC/7p5BQzLouNsUgvUzm4PR0dqCpKzaTlg5+KtqFof5MZfOJHgrjOjtZuKMvJWRyHN1dJ3BwJ2EXBLRSmBMOYPOVyGt0EmyQpcg8rPg6UWdDEeU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TFr2jMWJ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TFr2jMWJ; arc=fail smtp.client-ip=52.101.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Y61z/2jMWQyp+20ARa86JXdD3DWifzqKSxAc8ZNORkGoK1JARFufqwCuEwtxFqP4LEHWoUZnvo1yIdqi+TEHcL+HuQEPOe1eKdonNm6jmEsUUVwT3H7CGmmiJnmC0nMnc3wmR/3oqs4pH97qo+6DEIP6duh90BoLZzcMa4oMm1QM0KZx6A6gAQ/c0Jm0P2uIeWuMje7L39Ob1DHLo9I9ScQRDxWYzmDUhc1MOqbbEqb6rITQK0ugDT5qhHjOon8DuHmoXMFRKP8ApZ0+vQl4bfspLRg0a2hrIxRO5pGz87C9iB0PakntPI3/NJxTfRMIdK/VHCDCy8aM9QqsXzMhsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o/VscQURhqF61YBBiiHUenPjGeHJuIRDLibhe4xCHA=;
 b=vuxohiYnsKAMLgsUz6QkUVcQqgfae4tm4+L0GTHLFJEPXU4WmN+UhxDkmXuHGuDby92HmXpcydkwFSfJuycmVggGHrqa3umY65tjAZhiivIQLS9jrv6805IGvB4eIlyIaXmGLgmWolMvMxIn7ijsvmQ53oDdXZa/xGeeHpHLvWFugzSemVxNGvuhvYA5RMzigg6z32K1khU/XJn6mFo65XJA+G50ZIJbU4JtkLu4+TT6F14eNP7Od+zTe5yM0EmT89MH+M1yHF7djkAWKFZdLkHvOyEw5eV9U+qUKcVYm7LQ93IzXYqoY+xZNeu8QrTi3oJjH0OD1XYhlBsuOwfbIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o/VscQURhqF61YBBiiHUenPjGeHJuIRDLibhe4xCHA=;
 b=TFr2jMWJqx5YgrDK+ikOR9PnVU0q4xR2eyWmOoy4ufqCmyzsHwnjGgf4a8Gsk3DZ3+OV3xsoiYsbtJ/YzawFrYySFPKys316GoRSYomMZTiachy/lGwSd+cCdgiqewzTxZw8DmENbAa5hGCpRt6aQOsUjuAw/ZHa0GuRPOzBlIE=
Received: from AS9PR06CA0079.eurprd06.prod.outlook.com (2603:10a6:20b:464::13)
 by AS2PR08MB8783.eurprd08.prod.outlook.com (2603:10a6:20b:5e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 10:03:15 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:464:cafe::34) by AS9PR06CA0079.outlook.office365.com
 (2603:10a6:20b:464::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 10:02:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Mon, 9 Mar 2026 10:03:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIOPqqF4HhApby+rBRMW+U5t7vVkAQJXx7QZjFwPLxnWXIjcpAkYNE/nHbKvbabjSQJjhIrN4z4oMrUDB4jTjKlKqpd9skF/+ZBcE0sK3Pkge+n7H+VSPrf5UVK9jhF+OBnwsSOPpBkNDn+6a3IW+Sj7amrkzt1dCowfwyVQ4emFhnJHuD8RbCJQ9hjHcathsFgkhMvKhYKHXDYb3eAW+Uq9QKopBqP4IYN3VSiUxjA29YAs4+m9qhZVpmcJSQSEZuaUnJ93itz2i3oSzhmJcY9qanCWiV4+YACTkQQdgkYSRK+LzWXu6gevd+SRFc1r0n++4pu4dAd0ZRcxB6e3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o/VscQURhqF61YBBiiHUenPjGeHJuIRDLibhe4xCHA=;
 b=O7TDQ3+mwfoSuAwDpQFH6S4oFPZkg5UgKEXqBlpRDGe4EDO54cKgKHguVdzidxI0N7f8rueqRrmw4RuqMMTEio0VuR1sthjDnUslzwHYvPvOQMfOtrAflud96ZNJsmfrQgJHfyN66igQ4YFeAJ8FFZFVG8+x4aTIj0cdNwuyag2LrgL0pC/D+4nQ1QHFOH5tqVG4ytNj8V+NCU3GZ2yLuXdNa+iZ7qtrHCO5w6hDZlYsBLVoNscxejx76Iy9wtIziD4oqB8aZII1hKOBP91tZNERO35TLBoOZ3fdxF5C2NOrAcHcLEicEh4Ey6ra91PqtCu4CcUi/E6MZ+e4ZfLaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o/VscQURhqF61YBBiiHUenPjGeHJuIRDLibhe4xCHA=;
 b=TFr2jMWJqx5YgrDK+ikOR9PnVU0q4xR2eyWmOoy4ufqCmyzsHwnjGgf4a8Gsk3DZ3+OV3xsoiYsbtJ/YzawFrYySFPKys316GoRSYomMZTiachy/lGwSd+cCdgiqewzTxZw8DmENbAa5hGCpRt6aQOsUjuAw/ZHa0GuRPOzBlIE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB11754.eurprd08.prod.outlook.com (2603:10a6:20b:743::9)
 by GV2PR08MB11314.eurprd08.prod.outlook.com (2603:10a6:150:2c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 10:02:10 +0000
Received: from AM0PR08MB11754.eurprd08.prod.outlook.com
 ([fe80::3427:f97c:862d:1850]) by AM0PR08MB11754.eurprd08.prod.outlook.com
 ([fe80::3427:f97c:862d:1850%4]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 10:02:10 +0000
Message-ID: <03705fdb-e13d-4b5b-8ee4-af9348469b42@arm.com>
Date: Mon, 9 Mar 2026 10:02:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
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
 <20260309-enable-byte-cntr-for-ctcu-v14-2-c08823e5a8e6@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-2-c08823e5a8e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::18) To AM0PR08MB11754.eurprd08.prod.outlook.com
 (2603:10a6:20b:743::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB11754:EE_|GV2PR08MB11314:EE_|AMS0EPF000001B2:EE_|AS2PR08MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: a494ca45-4941-4bcb-1087-08de7dc313ff
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info-Original:
 usplw9nNOL8Wyx89Ly4GEK859BiJ6yRrps0qLMz+WdvYOfKuQ6/fs26EdY9xNeZRrNs3FPEpoAvgJICioqyyW9CNRo4FECqfjKzclFSwDqrPY7JmCXAv5QGUShmy6K9AJ3able0pioMkr5QtOanDTMNSdmcPLTBvPCW5F5+tFixMEkEZE4ZgxNIvG/AD2g5XDsbzqOANEB2sjEuApgkLjUYno9DdYagIYubI8N1+sHobS7DVy1sNldJPBTpBi5nXi57b+Ij2gw3d+ebdY56+txS5fgAAr+pAbzAQ0g5KVozbRYCk8Ajgbjq0LnXE/7oZ8C2KN/pVPYaW1nlWJ53zOyyECgnQaynJ8rYDbbGjVYdrvDNmnjbv3QgcHfOQlw0O336iMG4vSWtzNrakZ9o8m1lqEKvNx4wSuqgMSqa38fVuJtCtRNRpAMMSiONa7KbJQfLtT1B7e0gRpVVcyqjQby18r+0afb8Lh27CDp5Py74JMYmwK6/BszlNxOG6C3mt/wWUyVRPiCQsA9eLSrEHCfRhQtF9T7LF3zw3YrmJLWuf/EUUgA9MOZBJuS3ASjKn2W9oIEdhx7bFDHEpwPsntsmCH1NAu5fBw3rHAJgUcEmPAqZIYt3/72PWdmh+Y7Gwy8TFcFapSB0/4G3cqrqxug4WrFQ5q5mktnToWiIzY/3nc84QD09P12Tu531XnhczqJpNDVkasbnkhFPhFRHSQmHR9pGKarAYgV+mA3usN08APuEv+Lv/jiNvUCwG0qGg6cx3NUdAWCQoCa1MHInNLA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB11754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Sogbpw97wE6zc0JfvtimIANQjiu672EFAsLmD0vq2XAfN1CREqlySAhQhaWUpBQhNqxeioXl/zrBs9f5XX8EWo7i5Kju+TcF7pI2DlDYfOp0IfWpoAHc2Mgm3i4ov0vwRVg/kmPQrk6RhyhNMMMgBl7NpXMsz/24sSTUGIS/pUT3An+6AUFXiuQyUfLsTpM3+tuSNh3B3Li2zpAi6A+pROgxIZyyEmtz9Likas5Jstv9p55uDeE7EMInz6CqMRsvkhbIa6XvT5HevDxEse5lFa59MkXBEyQ8ZOpXBm0T/ayPLfZVMfaRp+yds4WyoK8Y+vezljb7ze0+mj4iaG8wmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11314
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	834dffed-0195-4925-f122-08de7dc2ee0d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|14060799003|35042699022|376014|7416014|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	K/dyI1TJ4gpNd/tmrcjHQZvEyXNK2atDjQg+z6CZLMsaVsvNtM6lWyGaEYpkeX79VVHCCzksYl0EiE3vP8U15vdQUBDKsZA6Lzc+X8kq474z8w3F8F6zoKrtg/1ZU1RTjuaZo90EA66tGXnE6R4c1QMoUMbr7zMbkwhtV8A8Py3zkMSVAKSqf8biKKws8suNISFX0IcGGxGpNhv2rTGyQ68+Ep1G/zgC2XZ9NAvxAIGTZP8vuy5jouEBZ4T6FUkEfJXSFlG4HXJf6LiwpsHBPaGgfi8fNzsXrD5iDQKba2iN6y+5tAFX2KBDhJtXTF7AYKOLGxR5LhWjRRE6+sFug+srkPcBplkcL/PiOb51acJQlgzLqbbJ0Uu3R/PkxtypsApF++usS4UF9RQNfLrNMjOerO8p2VTRnLtV5VTtvZNZZiDvcK3yRMRdPjq9DjeUM9q1IfAEB800qBYbr88T+uj8SeYnAET9Xiw7Qz8CMcl79QwmAAp985Y3++m1Kgx38FWG6BwTh9jIpE94VmEflAMjIDCupTzn8MYwATAjbzhySn6mM1mcImboPt9tKT2Bj/qCQt6ArK8PUslg3rLzYl/WZCUwufxn5PbsBB3jMch6LdDTi6kidcxCIBZlsMrWDDXUw5d9NI23JLAiAccIhQT1vs90c9YhUtL0Uiu7wnTNVHh5bOX6r7YHxhOcm7A6CZ/2CKFwlpvhiQeKHC92HIiYiICMxYlSoyZ/oAi3ah8xYwH9a+PBRrWSsdJiAX0ACXMRbrm6hj/L+dpRM6RAgll2iV+wGuyTi70sKHBB3w1maSA4VRbzrZMnRMl2/9sk
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(35042699022)(376014)(7416014)(82310400026)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xswEHe71YhO15objzspJfdLKq1md/Iy8khlRN/GKyN9GTzuGdSLXe01UD/EBsCCLGnLkFhhsa6QfdaNQoDNEpgLd/TFA8Mhd8ftWMIlgVLM8GvtxMLsPnMST23ohHxak+1umNO/TtCbpaPgZNRDAcNSd2H24KCCxKpX4Aj2VQU/q19SDh5j9mSSaNM2lWeWQjBUK/ZaBPJyd430YlKWRFV/OLAcQ2LimzndZxxP80uov+awJKVUbO2uLP3rm++rncBSVmFnKF9x7bG+jTbJfVxFmxagZByKMGkhoi9hQT2wUDcsdW5UGZk3L5s0aA7WlcbZdeGfN2/MjTPStMCIgHE8mkd6yfMcpIM+3u/vLsWAtXStXGiYlMRDjWbQa6ubl9gFs4Y0o6hDUJrHWARVPHaKfg3Z2eTE/4ImklOS/OKkqWdiF0l+7Ha4QD+d/2xb3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:03:13.9690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a494ca45-4941-4bcb-1087-08de7dc313ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8783
X-Rspamd-Queue-Id: 91C95236B33
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
	TAGGED_FROM(0.00)[bounces-96185-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,qualcomm.com:email,arm.com:dkim,arm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 09/03/2026 09:47, Jie Gan wrote:
> Introduce functions for creating and inserting or removing the
> etr_buf_node to/from the etr_buf_list.
> 
> The byte-cntr functionality requires two etr_buf to receive trace data.
> The active etr_buf collects the trace data from source device, while the
> byte-cntr reading function accesses the deactivated etr_buf after is
> has been filled and synced, transferring data to the userspace.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++
>   3 files changed, 112 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index c89fe996af23..bac3278ef4dd 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		idr_init(&drvdata->idr);
>   		mutex_init(&drvdata->idr_mutex);
>   		dev_list = "tmc_etr";
> +		INIT_LIST_HEAD(&drvdata->etr_buf_list);
>   		break;
>   	case TMC_CONFIG_TYPE_ETF:
>   		desc.groups = coresight_etf_groups;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 4dc1defe27a5..15c0874ff641 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1918,6 +1918,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
>   	.panic_ops	= &tmc_etr_sync_ops,
>   };
>   
> +/**
> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
> + * @drvdata:	driver data of the TMC device.
> + *
> + * Remove the allocated node from the list and free the extra buffer.
> + */
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
> +{
...

> +}
> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
> +
> +/**
> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
> + * @drvdata:	driver data of the TMC device.
> + * @num_nodes:	number of nodes want to create with the list.
> + *
> + * Return 0 upon success and return the error number if fail.
> + */
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> +{

...


> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);

Given the above functions are "EXPORTED" please could you make sure that
the locking requirements are documented and asserted (lockdep_assert)
in the functions ?


Suzuki


> +
>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 319a354ede9f..5ac07e8dd5ff 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>   	s64		len;
>   };
>   
> +/**
> + * @sysfs_buf:	Allocated sysfs_buf.
> + * @is_free:	Indicates whether the buffer is free to choose.
> + * @pos:	Position of the buffer.
> + * @node:	Node in etr_buf_list.
> + */
> +struct etr_buf_node {
> +	struct etr_buf		*sysfs_buf;
> +	bool			is_free;
> +	loff_t			pos;
> +	struct list_head	node;
> +};
> +
>   /**
>    * struct tmc_drvdata - specifics associated to an TMC component
>    * @atclk:	optional clock for the core parts of the TMC.
> @@ -245,6 +258,7 @@ struct tmc_resrv_buf {
>    *		(after crash) by default.
>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>    *		 Used by ETR/ETF.
> + * @etr_buf_list: List that is used to manage allocated etr_buf.
>    */
>   struct tmc_drvdata {
>   	struct clk		*atclk;
> @@ -275,6 +289,7 @@ struct tmc_drvdata {
>   	struct etr_buf		*perf_buf;
>   	struct tmc_resrv_buf	resrv_buf;
>   	struct tmc_resrv_buf	crash_mdata;
> +	struct list_head        etr_buf_list;
>   };
>   
>   struct etr_buf_operations {
> @@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>   				   enum cs_mode mode,
>   				   struct coresight_path *path);
>   extern const struct attribute_group coresight_etr_group;
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
>   
>   #endif
> 


