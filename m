Return-Path: <linux-arm-msm+bounces-95985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA3RB9tLrGkxogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 17:01:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507022C9ED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 17:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DE74302570E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 16:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25112DCF52;
	Sat,  7 Mar 2026 16:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="k+WajOUQ";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="k+WajOUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022098.outbound.protection.outlook.com [40.107.168.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16558283FF5;
	Sat,  7 Mar 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899287; cv=fail; b=p1HT02LndC5kRv2HRt4tx4ciDqPO1yBwZ9yc/rrRxEapNkI1Y3cwh+tUeIVrWtTFDgHZQaTMVLiI9g0PTDzzkO7yPe0bExJQpdnTeIKZA0SPbXfoy7OqeFnFLL8lPyG1fk/wRd6JycNLZXg+e1qENtHV9a2VzPzM8smdh/Aec34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899287; c=relaxed/simple;
	bh=KzKyxjR2g1d+VMjp4AP+KY3SfJT/npewJ8W/CM7V2Ys=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GsFaEdle4Lqowh4rAi0ElU93IvFcQ+oE7MMYDQGoXhr1ImhS5wD+QHW+aiWtW4+SBZJiUdT8JVDgwz71kPgy+jnHIdK5bTNI13V1G6GZFiK0tBp3FY9cKQxVeS9akOVgwuzZ8mR5ZTY1ZiN10PHKrVrSOJzvmBhNDFIqA3ZblTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=k+WajOUQ; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=k+WajOUQ; arc=fail smtp.client-ip=40.107.168.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8EIS+1KLOb+LKh9e89o+DXdkk+tb+GECs42t7Uh51rEK920ksdJztJRtt6RB+HQ32gA9lHBotXUib0Q+D4hIrkA/oB/Mh90m51IJ7DbcBjH+gG4tGfWp6EnIKCRFfqIhuL71jr2rjZ7+FJfpYRgHdiXGnFwmZp8ErjpS7T9E0iI0rBNpabIZvhNK7QzCMhaVP+IdZrH8cYA7gaVCvMOTfQfIMiPQUtSNhvYN+PG69/MVaaDLHZN+C8HPJ4WPKMKzKunrNz6pkcbTuWyQE7EojBVLnKliz19rgaI8oSjT0bWzlDsQsL3bKnkVZQCKyMg73ntFUkIysZRf4SafUJSmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/DazLKrNmqsf0K3aw88oxssBGHRJxuhAzE7n61H868=;
 b=E452Gb2RJNzYlNJb+KTQMXO6K4IAYNxla2xg7+vWA/CLAY+X987hxYg6zewwcoi6hucvlJp+eMVHhkLWKIpwjKn3uo0Bs91ngZxkiiwbvDXjTwUcB5iblregxfCRuKgtiD8XXStxAgYXe0kJp3b+UCYl3WG55ES09zgb40+NIVV+umOiaNcktyClLhA1hKBLl5Ng1BcfuysZ4EuFyrjQ+H8bgijaLRs97g5ZZFzPtxPiOcinEO+if4VuWltwdFoEDuoLmCzCJbsyqZX2gWanuHj0uCL+l5yovbNJUgTVGgGj8ApTaupsGINUfMAp2qy5f4V5SiQ8BNbAdDzT+8KmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.107.2.244) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/DazLKrNmqsf0K3aw88oxssBGHRJxuhAzE7n61H868=;
 b=k+WajOUQVRgWSbPOdERADSKN8nXI6EWGgn8lbOxBCB536Ec6TBeoR3qT5vaZ6wqpNwxIxA/hyMPw6L1Gc0czSCsHWJJwV0uJLiiSBYrhR/5PyPJqSzmWfnXwbJdmC/2o0NzwcWNdVz5SkXIiQ6Te1CWQoyl8HixdWsOKn6cKMaM=
Received: from AS4P250CA0004.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::12)
 by ZRAP278MB0125.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:12::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sat, 7 Mar
 2026 16:01:18 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::7c) by AS4P250CA0004.outlook.office365.com
 (2603:10a6:20b:5df::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Sat,
 7 Mar 2026 16:01:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 51.107.2.244)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.107.2.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.107.2.244; helo=mx2.crn.activeguard.cloud; pr=C
Received: from mx2.crn.activeguard.cloud (51.107.2.244) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Sat, 7 Mar 2026 16:01:18 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=k+WajOUQ
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012048.outbound.protection.outlook.com [40.93.85.48])
	by mx2.crn.activeguard.cloud (Postfix) with ESMTPS id AC0A47E303;
	Sat, 07 Mar 2026 17:01:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/DazLKrNmqsf0K3aw88oxssBGHRJxuhAzE7n61H868=;
 b=k+WajOUQVRgWSbPOdERADSKN8nXI6EWGgn8lbOxBCB536Ec6TBeoR3qT5vaZ6wqpNwxIxA/hyMPw6L1Gc0czSCsHWJJwV0uJLiiSBYrhR/5PyPJqSzmWfnXwbJdmC/2o0NzwcWNdVz5SkXIiQ6Te1CWQoyl8HixdWsOKn6cKMaM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR0P278MB1204.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:83::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sat, 7 Mar
 2026 16:01:15 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%6]) with mapi id 15.20.9678.020; Sat, 7 Mar 2026
 16:01:15 +0000
Message-ID: <c9304705-41f3-4b4d-97c2-acb0451b3fca@cern.ch>
Date: Sat, 7 Mar 2026 17:01:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add UFS node
To: Marcus Glocker <marcus@nazgul.ch>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Daniel Gomez <d@kruces.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>
 <cd9d5a7c-ec0b-4f0a-bac2-f747799bf295@kernel.org>
 <l5vwputpefdkweti56em37i5asrd3vb7pxhwlzir7webfuk3fl@afcqm3faq2gt>
 <D5I1G5K85QLC.FP6NF7M20KXQ@kruces.com>
 <f5676c71-9e15-4733-aacc-2d194e2567fd@quicinc.com>
 <srqwbf4teujrcvovxglsibvhtq6wpv2ojclf4joc6hwvszhbir@2gxtczxhqlc7>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <srqwbf4teujrcvovxglsibvhtq6wpv2ojclf4joc6hwvszhbir@2gxtczxhqlc7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR0P278MB1204:EE_|AM3PEPF0000A79A:EE_|ZRAP278MB0125:EE_
X-MS-Office365-Filtering-Correlation-Id: fafbaa46-f7a0-4c41-f84c-08de7c62c4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|366016|10070799003|376014|7416014|786006|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 5IQ317uE3PULor95ixrHVWtrd0Zczx/O8BVIK9XirTg8RP1U+YG0Z1asBoIPObGvUqr8Kg5rQIffTfaicc2UGIm1PWnAB22dzTO+Zv0aqD9AoglaVrlOyvWPf33tNnzO4IrBhjT3eJ1Jz8n6rNqhlh7ebUrMMyKHZ7izYZCKkHpPBsphmqZhfdRXQWF3k1KnuE0U8FlBUqNkUsmsOltdSnake9k8RQQK6/kUQT5ekmWMc0gM9ynTWozSs5n1XXmir9jwqNQK1JPKS/pnmNGjuYZNlmWvxZ6WMsTpkWr850PwIaHB2OFbNczlfiQ9lZWNtt5RyTg68d8aLgB7MTiZQbWU0ffopV1EOG3Uyie3OtfzDdjmW+uZPzaKpqrp/y9NJPuJJ6XiQY8jGWZaJkc7iLteKBnpR6zNgWdeyGySHOA84EhYALFNvPdMeyk+xc9mtgP3dteLhz1lvX3dcuC/OZeE6VEorVEGhQ8DCXpMexXKui6uil7Lp0FfvXGtDfFFMQclpcXAR0qnrErwe9C3T2GRA/G461S2nZMj9zsa7na1Q7CM4gr0VFeJlqlT+hYlrk9BmYujRo4g7LjjvC1Sh3jYGEMhKYjdiXx3ZPj4qKS8drdNBru2GZKTJUcXwIwbbgwV33Rnb4Hwevh3IihflK23DdIAMKzshsQS6CCjF5egvnw4WVZkCHDq98HdGAvS2SaV9ZLGcLy/XpG6QuWj3XWmfLvIyr7xpOf38rRvYjw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(10070799003)(376014)(7416014)(786006)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 QdRECtLgQV3rUmeOYvw/teLPrVTdCd+B5DYdO//10v+xNBqVGKpK7FhAulms7dvkJPM4Sn8yxt7pRJW0pSHZccWhXnPGSq6dM9vhcU3m7BVcV4n9vru6jyBm73L/3y+89AUMRrZm6SAhrwsFqfHHWEKUqWLd4akOq36yp4gmip+kpu2TuvaAg+PIDcy4HpJxpjffZBXVbu/EI0c5Iho+y24PaYWaJc5udPSBUaVe4IK4BZZbmbV3ONf72iQjntEroMZQ2eUhBcnLkOGUFwYx8+qXcR8d7ANcHQEZigFLrwzAKljTs0ThRsFniRX9/CPBjxjVQCVUrBWv5+smp6wUOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1204
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	12c9b0ed-e260-409b-a7f1-08de7c62c2e4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|786006|82310400026|14060799003|35042699022|30052699003|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info:
	9F6rhREG1Q3g60CrkUUS9hOjg5Pspvptkyko2Q0e2G6xzFN+UklgDvIZcTXpGCUVd2ej7Z+DWo5TaKnTIQYVTu+P27MyFIIejyY39y2TxhFH8a0d+MaqQp04NQliELFcQv8M7d9Hq3pQT50SWyeJNYOtCSH0/INEX9Mbaw4H3BuEk099hNPWgLN812TQJCbp1isVaRvQYjT/bYxY+3BR8tuoJL+fZsCPg8EI84CjL4QUlfhJIRq4/n1M2cQVEdEQLm+oy3JHLeMIuFxXgVj6BwieEsAF05n7Rm+VuJ40laYAklVqcHO16CyFWGELJZOfe7VpNCWXvTwQwgDnjXTgua9Ywrdadps+3dJ3gWfHvRkIVPyW71I+Nx60qHXUZgMgCSKSAdvYBcpsg4LZfc1ByaAZyBFFAWozvA6aEDvnKmrCevMIQvOyN3e3FpK27iEEYihGHTHYeRG+7SoXHL77zWqQQqlBtpR2mX1nIOdrtqGZdkVw4JKvokcqxpouA2+s8CDjhpHI7PgPbvBlSycA48bxJQmbjHArFsu1zYZbLJOX8voTCP1xLmAn/OVlr2Iah+HhiNpSJo/kbnDo0lKdYYmrMqU3dEdeDs4PSuzf+mrnK/pOP1qcA9m82mujOvhFP1XljeWhDw1C7SeKF9YXzNEpPrg8C6/qviQmD/a/Q+H52pJRBwWK1xtvZj4kbVsBUdCca1ik0wzs/qVQ7MqMQmgimpLwy32QLc1AC/5+mHriQA5lHIIWLoU7B48tkLbAhIl9fT2i5G5aKzE2oGsPCw==
X-Forefront-Antispam-Report:
	CIP:51.107.2.244;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx2.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(786006)(82310400026)(14060799003)(35042699022)(30052699003)(1800799024)(36860700016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2gAIsvsXGOO5rgbzfkqEOn7ojrw7ubtiACwznpMgtV1pBSgndMnUDQ2HkJsyZLdV3O+lOQDYvXi5d4eIJ+N9X2DjVbRH7dAkRqg+BCjZmoG6SLJhcvWHpGFEBH+TWnouaJE1EoNZ5i/UQ3iAtKG02e4idoQVEKCNgkL1O+mWZoHDcnHtI65h5xR++SJQjpH43iSYPKkUxeObfCcJg36jOAM2HmeYSufjVnum+4p79f+SJUlUGxAarWzOu61AfmtoqfQOLFvVPYCpQ+hiq+BsA05CBPPgX9QzbFccJAVZOhP5rGY8ibpN6lVkZ/nRsQBAvznQvf9m3K1jDrd0fWdYpOZIUvhE90nXj2phlZY0C8k/NQLAw6SCF1FewmiT0RoL1WMOnVQYUDAPBH98qx0kHdjhQaolZVlPvGAcR4qJHpUcMud8Nu+WMz/TjE01RRJk
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 16:01:18.2830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fafbaa46-f7a0-4c41-f84c-08de7c62c4cd
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.107.2.244];Helo=[mx2.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0125
X-Rspamd-Queue-Id: 7507022C9ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95985-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,1d90000:email,1d87000:email,nazgul.ch:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cern.ch:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.27.41.32:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


On 1/3/25 00:17, Marcus Glocker wrote:
> On Thu, Jan 02, 2025 at 01:38:10PM GMT, Wesley Cheng wrote:
> 
>>
>> On 11/9/2024 3:31 PM, Daniel Gomez wrote:
>>> On Fri Aug 30, 2024 at 7:25 PM CEST, Marcus Glocker wrote:
>>>> On Fri, Aug 30, 2024 at 02:05:48AM +0200, Konrad Dybcio wrote:
>>>>
>>>>> On 17.08.2024 10:38 PM, Marcus Glocker wrote:
>>>>>> Add the UFS Host Controller node.  This was basically copied from the
>>>>>> arch/arm64/boot/dts/qcom/sc7180.dtsi file.
>>>>>>
>>>>>> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 72 ++++++++++++++++++++++++++
>>>>>>  1 file changed, 72 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi 
>>>>>> b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> index 7bca5fcd7d52..9f01b3ff3737 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> @@ -2878,6 +2878,78 @@ mmss_noc: interconnect@1780000 {
>>>>>>  			#interconnect-cells = <2>;
>>>>>>  		};
>>>>>>
>>>>>> +		ufs_mem_hc: ufs@1d84000 {
>>>>>> +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
>>>>>> +				     "jedec,ufs-2.0";
>>>>>> +			reg = <0 0x01d84000 0 0x3000>;
>>>>>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> +			phys = <&ufs_mem_phy>;
>>>>>> +			phy-names = "ufsphy";
>>>>>> +			lanes-per-direction = <1>;
>>>>>> +			#reset-cells = <1>;
>>>>>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>>>>>> +			reset-names = "rst";
>>>>>> +
>>>>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>>>>>> +
>>>>>> +			iommus = <&apps_smmu 0xa0 0x0>;
>>>>> Looks like this should be 0x1a0 maybe
>>>>>> +
>>>>>> +			clock-names = "core_clk",
>>>>>> +				      "bus_aggr_clk",
>>>>>> +				      "iface_clk",
>>>>>> +				      "core_clk_unipro",
>>>>>> +				      "ref_clk",
>>>>>> +				      "tx_lane0_sync_clk",
>>>>>> +				      "rx_lane0_sync_clk";
>>>>>> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>>>>>> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>>>>>> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
>>>>>> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>>>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>>>> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>>>>>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
>>>>> You also want
>>>>>
>>>>> <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>
>>>>>
>>>>>> +			freq-table-hz = <50000000 200000000>,
>>>>> 25000000 300000000
>>>>>
>>>>>> +					<0 0>,
>>>>>> +					<0 0>,
>>>>>> +					<37500000 150000000>,
>>>>> 75000000 300000000
>>>>>
>>>>>> +					<0 0>,
>>>>>> +					<0 0>,
>>>>>> +					<0 0>;
>>>>>> +
>>>>>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>>>>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
>>>>>> +			interconnect-names = "ufs-ddr", "cpu-ufs";
>>>>>> +
>>>>>> +			qcom,ice = <&ice>;
>>>>>> +
>>>>>> +			status = "disabled";
>>>>>> +		};
>>>>>> +
>>>>>> +		ufs_mem_phy: phy@1d87000 {
>>>>>> +			compatible = "qcom,x1e80100-qmp-ufs-phy";
>>>>>> +			reg = <0 0x01d87000 0 0x1000>;
>>>>> most definitely should be 0x01d80000 with a size of 0x2000
>>>>>
>>>>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>>>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>>>>>> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
>>>>>> +			clock-names = "ref",
>>>>>> +				      "ref_aux",
>>>>>> +				      "qref";
>>>>>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>>>>>> +			resets = <&ufs_mem_hc 0>;
>>>>>> +			reset-names = "ufsphy";
>>>>>> +			#phy-cells = <0>;
>>>>>> +			status = "disabled";
>>>>>> +		};
>>>>>> +
>>>>>> +		ice: crypto@1d90000 {
>>>>>> +			compatible = "qcom,x1e80100-inline-crypto-engine",
>>>>>> +				     "qcom,inline-crypto-engine";
>>>>>> +			reg = <0 0x01d90000 0 0x8000>;
>>>>> 0x1d88000
>>>>>
>>>>>
>>>>> All this combined means you probably wrote your init sequence into some
>>>>> free(?) register space and the one left over from the bootloader was
>>>>> good enough :P
>>>>>
>>>>> Konrad
>>>> I have not done anything special in our sub-system to boot this DTB.
>>>> Changing the values as suggested by you also doesn't make any difference
>>>> to me.
>>>>
>>>> Anyway, I think I'll give up at this point, since this process is
>>>> getting too time consuming for me.  We'll go ahead with out downstream
>>>> patches, which works for us so far.
>>
>>
>> Hi Marcus,
>>
>>
>> Do you mind if I take over this series??? I started working on getting at least the UFS and USB portions of the DT file to work on my Samsung Galaxy book4 with your patches, along with some required modifications.?? If you're OK, I'll keep you as the author for the main DT file, and submit my changes on top.
>>
>>
>> Thanks
>>
>> Wesley Cheng
> 
> Hi Wesley,
> 
> Perfectly fine for me.  I'm glad if there is progress.
> 
> Thanks and Regards,
> Marcus
> 

Hi Marcus, Wesley,

We've continued to iterate on this device over at its thread on
Launchpad, and been able to get a fairly usable system up and running on
Linux for both the 14" and 16" SKUs. I'd be happy to update the series
with the changes.

Cheers,
-Max

