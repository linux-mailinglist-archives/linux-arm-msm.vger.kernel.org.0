Return-Path: <linux-arm-msm+bounces-101095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNYEHHr+y2mcNAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:03:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E336DC54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5A613043152
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860333FA5E6;
	Tue, 31 Mar 2026 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="K6o4ulXx";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="K6o4ulXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022116.outbound.protection.outlook.com [40.107.168.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC633F38A;
	Tue, 31 Mar 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974904; cv=fail; b=aGH2Hrc1jXx5L6+vnFC8YCy1qFO25/A6BGvBJKZwqo0gkQFK+zpI/7aO63l523b1qPGa4Sl90+qoKICp12gU+JOQUcQpcWXglqkjrWwVCc5IjCbW5vPob5/7VcC7mIhMVHzRNLk3PyinFdJpzhzx9gZ2D382EgUQh+ieY67RIB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974904; c=relaxed/simple;
	bh=xdeEd2g95OJfYG6vjwspXifBHApsV7WqxFys/N5RhWE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y0LiFA5D6tjS8bf0NEtifzUXCrUxd5WL7u/06GVdhSX9J92LuyNdV9jWWz/+oP1HPOR8G2OV5Xcq9kFAjguQ/ae0fduduJHeHsudDfBxUaojZBEcJrja98xF+V1cnyo+v/7SacG3EyeWCdSbWcO2WKmit/mGLQdpypWLSQ+gubE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=K6o4ulXx; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=K6o4ulXx; arc=fail smtp.client-ip=40.107.168.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/5LKf91VFvc210O4w5yHbfNc/G+YMQ+SUJs8NKrUZUbzr7M+RV2YW5lVoDRpogDH0bvMtIZ9jloyP1DatVyjkwdmn0+xSU5hNfzfYXoDJKVh8Pc84pL5Ht/1vHiZlQzuBDPJfiFvQ3OBYPv9b6f2Ooa+BIY1BInIcHtgnEBNyFZ8k5Yo192tJ0CMavZWWVJNsVi5xq2ZAF75cChI7BoJ1i9RfZzDplLIxTxoqtBig3MOwKsC549nAgjk8XYiG6qoBXmtqeIXudSAVDLPU38HPAX8ja6AD5NdXDiD4gwbfoMlwJB+eKaAeATigeOvRWVyYMour9XKkyySTPGiYnT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgPl4Y9S3suCi/DFGpPKaJVQoaucM0yFKfYThdDY+HA=;
 b=RATUjGiDoIdyu3J0yhyops3QPz4zF7Pusy7nu/USpzjV3Qw6npmaLWjxbYrr9+Y2m9verNk2ZvIsU9VK9uW53do97E+iGrXf9xxMSCrpcaGnz0AQm4uZe6I25WKpszPYqUFktOeQ6n5cz/DFEsF+m45lJbMyJcZspanT9KVk1MinfD3WZM8xYPS3DMVxlHkgg1kYVDzcUjnTh+9mqRWhwfGSqHwPWIUTyA7QgFomgBtbq996hgBwKRHLJEcDiDGKTK+4e0KyztI6z57ntTVbeh43Vya3p8yVI4S25idSQeTrv5s26PbeiNwDDuJVleD+fcuJRTeUr1ywvwf/Pi8SKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.107.2.244) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgPl4Y9S3suCi/DFGpPKaJVQoaucM0yFKfYThdDY+HA=;
 b=K6o4ulXxfNiCbfa9Hzuw9YEXwenxiQhtIrmHpyIxJ6yuP0G1zMETnQ3QOjYxqI/WQ+5OJKJKws+n8FtlrCzPR0Pxw31Y7ZOPY8HomuE66yMYV3WdAEVO3cqzqP+kGHSlgZR0PGyOOtNTlZtnzHec4ub237oRN84aFjH9QAzaInc=
Received: from CWLP265CA0449.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::17)
 by ZR5P278MB2053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 16:34:57 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:400:1b7:cafe::44) by CWLP265CA0449.outlook.office365.com
 (2603:10a6:400:1b7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 16:34:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 51.107.2.244)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.107.2.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.107.2.244; helo=mx2.crn.activeguard.cloud; pr=C
Received: from mx2.crn.activeguard.cloud (51.107.2.244) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Tue, 31 Mar 2026 16:34:56 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=K6o4ulXx
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011024.outbound.protection.outlook.com [40.93.85.24])
	by mx2.crn.activeguard.cloud (Postfix) with ESMTPS id BD6667E0B1;
	Tue, 31 Mar 2026 18:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgPl4Y9S3suCi/DFGpPKaJVQoaucM0yFKfYThdDY+HA=;
 b=K6o4ulXxfNiCbfa9Hzuw9YEXwenxiQhtIrmHpyIxJ6yuP0G1zMETnQ3QOjYxqI/WQ+5OJKJKws+n8FtlrCzPR0Pxw31Y7ZOPY8HomuE66yMYV3WdAEVO3cqzqP+kGHSlgZR0PGyOOtNTlZtnzHec4ub237oRN84aFjH9QAzaInc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR0P278MB1267.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:83::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 16:34:52 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%2]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 16:34:51 +0000
Message-ID: <e6134dd0-6672-44ce-8ced-41fc3e21e474@cern.ch>
Date: Tue, 31 Mar 2026 18:34:48 +0200
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
 <f6323f22-27c8-4ae5-83d3-59831b62b5da@cern.ch>
 <12ee3569-16a6-4787-a874-bc802a50175f@oss.qualcomm.com>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <12ee3569-16a6-4787-a874-bc802a50175f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS6P279CA0064.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3f::14) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR0P278MB1267:EE_|AMS1EPF00000091:EE_|ZR5P278MB2053:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efe8086-d223-44d6-829b-08de8f4371f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|786006|376014|7416014|366016|19092799006|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 /k/uWHsdtcPJRen7tzjJyZ63AvkAuCZNJqhutdzTtH8uS/vH6akxGZGZ9reH0MNLDsMtFZSe5iS2McZs2J5QcJEhZjsdmG2g1AQBZS2AwDOcJYaTCe6HLt5snJX5BTBUUNx5PieoqDG/u1VSnNEmsF6juSBm+a2fIHu2aBPEbfZRCtcDj3G3duatve+Pd3V5ZtgB+Huu8tft5uJBY76TFM7eF1hcn2pIl9qS7pWoLgPe9cjiBxTeiP0Ya7nfV3uVrxM98oyCrEKB74TtsvARyyIUZuPRCf9UhqOA0+Y6PGBuaKJPJkttrzxzAR3FxGmWUB4cj0vIIM1AiODUnw3XoQmD6ZzfiotCz8tg0JJfYDV8aU9aRL6ulIJ5Y1i96uZjJwz9ecfQt+kiZkiLEPDpMXCdGMf8Z5N7NsMhJ13+EN5YrpY3XuYFr7OUKPzD1NzRzEC+Jr7wBeKmCs3T+5OAxw0oAVF+R6VEadIA7VlboRQeNfjla1+TdDgeCRvuoY8w9QYjEpULnirUhfiQq1/XAcW0i34XUEkRBhGAy8xifytfsjxhkURYRSH8y2/wvjY34NGLIntYIaTouk2sMHng/hap4OL8WjyXqks1t1jxQnJjnHy5o4d4K16sYmDlagUC68xgeDtsZBsQf9XfHm7NYiwryVWCpIcHLDf+0UrWOp9zUaM8sS1kfm53L8wyoD7JTk6d+In/M4vnJQ9ujdmcFkC+HyaMM/rjfY5oeLYts+s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(786006)(376014)(7416014)(366016)(19092799006)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 SsMywM2vJLq3RFDwmqjxh6zLz2H1w3jLtPgIqBmCFl58cNHFRu1z8aXEZt+bQKOGe4tmj3PAnKy9U35V1S38oMOU+2sHwDQ2Dx9OuoGZyIZ7E181VBT9r1/r1xor668c/fdgP9TSR/aDgHY5ba1cI1zVu+8qRXg/fIpQBMUyfiYXalaUwaEAyvanJwJsHxK34cftt79phvqTir++u6kdRfy0G34g/DtxMpI3jtTetJ2GHlAIgUdytaimP9IWbuQQMyqdkZ9k+jJdy9Gb0WRlVJBJPUatJ30iZjLyegwDBC7wSJYdciR73p0W5pKC+ESeyHitnXZhXdN0er9kcPxjew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1267
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3faf856-0ebc-4bab-348b-08de8f436e4b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|786006|36860700016|376014|7416014|19092799006|35042699022|30052699003|1800799024|14060799003|18002099003|56012099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	0zEBuI9ohdJ+ki/t4EsPHMwdlbFPPCOLWuD+LVPbr5VUwCVDQA3IwOz8ZIfmDhraOH+Dx2OtA28WEr0hBzE0PNOV9/AZ4rBsrU7QviRbNnJqPwZxVUERE+WadE7/ayAljrR5yjgmY5oCpNoSpBFnqmR6oa4oF2bYN0Z93iNE8TPI4EbyM0v/doM4eiXMv1lkUiSyhQhkyobxHuQP5Dk1YN0OM0EtJgIZcIl+Ee0nnmZA2KMpLLpWG2zEvxVCxLvTucWuQUiBForImZBMAW9f6nCklH5ap3yuUkVVGgzhju2/e8WWQmHNgVRs9uo/fk+5ysj7bGYhqLooCEs9DqgqTNQHWbqdGNv5K6E1z0jquLg7EswLqexaKeSOOeuYsD9/8eKD1d4QKP8sqNb026KrXxSqet60cPtE97UVrrCklf0NKj773c4Kv4BoNhc8wfPMaleuTpskkp1FZSfFZ2ugFUYwFJzWaTzq0xTFMUaqUqAUytg4VxYCVb9xeRI47ka0r9mC5B/sSL+rlc8q/sSOKZlVYsdwKa08e0b8d9tb5D+laqYDYFXfukfi1PyvM3MsGaMXZKB5zSjxokhwMOJJ38JNR/rhYs99vbijuQjhj4s6lIhnw5Gtko8TlWPLJpvQLz4RwM3ciOixKz1wbzJvfBBEMZCa3iHGSaOWP+FIALLYygl7duoyzFI8wMZJqULMz0A0WPhnF3QnVPfjU/BiPAE1PyfZ29G6n0cW6ABq94lAoITG5XyRagNZL8ZQCffGXmzs+xI9vjod/oCMe+P1ZA==
X-Forefront-Antispam-Report:
	CIP:51.107.2.244;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx2.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(786006)(36860700016)(376014)(7416014)(19092799006)(35042699022)(30052699003)(1800799024)(14060799003)(18002099003)(56012099003)(22082099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sdaz+SX5iJFuW8hD9i/B3Ad4KD0kiPJU7vCSjh57uelm/xQRZ6OPO/N9mgUHkFe6tbLtbjUo9oa8hYVOpllsOwetNuSAg/Z4yNhkFrnvugew/+r39+MAbt8tGHeRjPTcsaBy8R1pKHSv8QYap7A0m5W8doF/vmT952W1ustsksuwVZ10LNcqdik88qP+01as4zGHQngDCigj3v7fgh5pVRi3qZ5CHzwnSCmc74OTkqQGkmDFpjxdflY5yeIhfk4b4eAzAHM/7S0td6VTOEkpUMe3AaovVojjzdonHMpwKwY8f4piyiutKqN6GE/UdEpKg17+TgmgFNnekAgbJeJb0LaDF4+1AH3l61QYNKk09cAdGlnvUhw0IjahvwUsVAOuU+p/mIWIcHINElIDJYDapYWVmu9Yo0CCoykJYAK8d7caiY95Fy40fRRhwDj0qiN6
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 16:34:56.9751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efe8086-d223-44d6-829b-08de8f4371f4
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.107.2.244];Helo=[mx2.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB2053
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cern.ch,quarantine];
	R_DKIM_ALLOW(-0.20)[cern.ch:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-101095-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cern.ch:dkim,cern.ch:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mstoretv@cern.ch,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cern.ch:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7A8E336DC54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/26 12:41, Konrad Dybcio wrote:
> On 3/26/26 7:30 PM, Maxim Storetvedt wrote:
>>
>>
>> On 3/26/26 12:33, Konrad Dybcio wrote:
>>> On 3/25/26 7:30 PM, Maxim Storetvedt wrote:
>>>>
>>>>
>>>> On 3/23/26 13:17, Konrad Dybcio wrote:
>>>>> On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
>>>>>> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
>>>>>>
>>>>>> These use a common dtsi derived from nodes that were able to work on Linux
>>>>>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>>>>>
>>>>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>>>>>
>>>>>> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
>>>>>> Valentin Manea, which shares device similarities:
>>>>>
>>>>> [...]
>>>>>
>>>>>> +&i2c8 {
>>>>>> +	clock-frequency = <400000>;
>>>>>> +
>>>>>> +	status = "okay";
>>>>>> +
>>>>>> +	touchscreen@5d {
>>>>>> +		compatible = "hid-over-i2c";
>>>>>> +		reg = <0x5d>;
>>>>>> +
>>>>>> +		hid-descr-addr = <0x1>;
>>>>>> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
>>>>>> +
>>>>>> +		vdd-supply = <&vreg_misc_3p3>;
>>>>>> +		/* Lower power supply is not enoug to work. */
>>>>>> +		// vddl-supply = <&vreg_l15b_1p8>;
>>>>>
>>>>> How should we interpret that?
>>>>>
>>>>
>>>> This was in the original patch, but using that same regulator appears to
>>>> be enough to also get touchscreen working on the 16" book4e. That said,
>>>> it still does not work on the 14". Something to revisit later...
>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>> +&panel {
>>>>>> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
>>>>>
>>>>> I think it'd make sense to move the compatible from 'common' to the
>>>>> 16in DTS then too
>>>>>
>>>>>> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>>>>>
>>>>> this matches the common definition
>>>>>
>>>>>> +	power-supply = <&vreg_edp_3p3>;
>>>>>
>>>>> ditto
>>>>>
>>>>>> +	no-hpd;
>>>>>
>>>>> really??
>>>>>
>>>> One less thing to debug while previously attempting to work around the
>>>> "illegal link rate" error, which turned out to be related to eDP 1.4
>>>> (similar to the sp11). I've kept it as-is in case other SKUs attempt
>>>> booting from this dts, such as the x1e80100 16" (as it might be getting
>>>> a black screen using the current x1e84100 16" dts, though this is not
>>>> fully tested).
>>>
>>> So do the 80100 and 84100-equipped SKUs of the laptop come with different
>>> displays?
>>>
>>> Konrad
>>
>> So far assumed both 16" variants to be fairly similar, though one
>> valiant 16" 80100 user over in the debug thread did try to boot via the
>> 84100 dts, with no success. Instead having the screen go dark after the
>> first post-tux kernel prints.
> 
> Does switching to the generic edp-panel compatible (which will parse the
> EDID and try not to be overly smart about it) help here?
> 
>> This was strapped together via WSL though, so could be there was
>> something else at fault, but strange it didn't at least fall back to a
>> visible initramfs shell.
> 
> You mean the kernel had been compiled via WSL? That shouldn't be a problem..
> 
> Konrad

Kernel was one shared by me in advance (same I've been using as a
daily), so it should be OK, but there was an uphill battle in creating
the modified system image afaik (that would boot).

Can only speculate until there is another go at this, but could likewise
be something completely unrelated that's simple to fix, e.g. older mesa
in image, but final attempt at boot used a dts with gpu node enabled.

Cheers,
-Max

