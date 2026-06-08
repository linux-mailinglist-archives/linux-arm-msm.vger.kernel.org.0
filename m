Return-Path: <linux-arm-msm+bounces-111980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1GVNDyA7J2qftgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:58:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A18C765AD36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:58:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oracle.com header.s=corp-2025-04-25 header.b=F0SvB8Hu;
	dkim=pass header.d=oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=rEd4Rb7i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111980-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111980-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=oracle.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6EFB303EEA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24243B0AC8;
	Mon,  8 Jun 2026 21:58:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B039D6FD;
	Mon,  8 Jun 2026 21:58:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955932; cv=fail; b=IaB5rfZ3qJFZHs6LBuQLWEuB0CWayP6Ax14hQpkOYLNQbavgolCYzG/XFIDVbwCDT1amxEn0dnLf2tXVdTiC01LUDQW9FdTQtNN9PrmVQEiQUc1aaYjh0cc1bKQ0Ggo9CKQKteidgC6XKJYSxpYVLYuknu6qfwVSKczdZwB/dtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955932; c=relaxed/simple;
	bh=oziLaIL87HuvCdHO2KiikcabIpvd1jMhu3pdikJxWBs=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=tjt/I/PMVPJ/iq5kBNLXM/DHL4bUCrpXKxwAHzq75QkYaXlu18QCPj9SC4lOstneXDMJ8zuc3UCx+v4RdVLuEQydY5vI5+m56Q/n4yUrsQu7Fm18B2P/ln+JjrXgETJvWFgDRFBCggAuieDOkgjfwXlEC8zWduX6mk2+9XEFPjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F0SvB8Hu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rEd4Rb7i; arc=fail smtp.client-ip=205.220.177.32
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658HSfq81690708;
	Mon, 8 Jun 2026 21:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ddUYuhTULPgsM6+ffX
	VATsY0vN/yZqrygzKB8PY438w=; b=F0SvB8Hu9fCt4Rsmn9dEEFzAUoBfTxYDGB
	1n/0vnoy+Wot+J1Uc2EKQt9YWX1HB1EmZWCRozGlwmGjbUlO/d0w2ar9C0GV0/da
	BNva63aSQa1xjKrxsbr4Mt0xVsZmCz0Gk5F91aLUBeZlUfULjZEHsAz1ErWe40yb
	314TzO6rqs8ZBZSS1Buofg681JVXKGF7E3bdIWfuepxjS+AmemM7iDS2AWuPvfOy
	Qpe/zeO6hsfky3lFT0YUE1PhJlXmLpx2f+2R8w4taaSNDsFH9qh22I+ZmsfhcT5K
	rz9xCvqHSp2B1Uf/0J4+paqRJmo4zVT4wQry6V9U+oE+4AMo92iQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4emab4kbnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 21:58:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 658Lw8Nr009745;
	Mon, 8 Jun 2026 21:58:45 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0eau4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 21:58:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laS+dqM8uOwOlAjE45bPVJSGsbF/oLBDE6NjMIny/hGU430Kca+2Q5sd1kx7M2fz01uLpc4WTFZwOW+2yiIuXJ4kj+IwMtobDRlWad3gH+X0CN+enXL0rCVp13H5VHeQEdQo0DgnQL75TWY5ldBD9Y3F9cU8wZjRdz+C7sMfFMUxU5ztP3iYV6/M386/C/+CrdmOttuFc6ir6XXpnJpAi7tGgI/PbJNjh+HdowHPU9rQc+s6hX0STPqABwQB68B1Z/2FojVvt/sQrSIH5xm8ODDhKkTQwSsnLf2Fx7/hr/eOQoM5Z3IuLvpUN3RPxx3QUX5cRU9aQt3otkK/o00bRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddUYuhTULPgsM6+ffXVATsY0vN/yZqrygzKB8PY438w=;
 b=S9AyN1s7SI8CmCr9yfWe9eYKb54AYYtu4VBqceetfdNz+1u/7JB4FwJtZmuGunjk1rto5Iddut0Ag3A2KOFuXkfiS6JM3/mQy2H8GZyLT4rs60Ee34UlZXmg/YvPLSlY7NTI45+Y2gAP5nutibs6Clh6ifA2o/vuDxxWpfjfoIA2jSj+xFnAI9OP3VY7OpEZSr3+LZE2PC0UAYmtJqz7+XiCTIWnzM8Qs+X4rVc151884Bj1Y6hz3IdSc8eEN+vd3qpZqEabc1MeFC1qykpMhhaFpTGo3RM9UNya/p5EP+rcBjYqlVldygij1Qz/Kr8ZN6NYumk5oYsYEB7IuoLq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddUYuhTULPgsM6+ffXVATsY0vN/yZqrygzKB8PY438w=;
 b=rEd4Rb7iD0UvL10JbLwfQP91XPNgzP2ejhiqUUxVPhVO/90z0jYA4p9TsIveXEjdeQ8P/D1QGm5TUtCjSH/ldN9dj67Akmusd+nYcHF6UPGIkP82zcVKAZm4Eu6GiqRcHvR10cSTCsMUb//6/XyxVgGybv/s8zTKsz23GondSjw=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by BN0PR10MB4998.namprd10.prod.outlook.com (2603:10b6:408:120::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 21:57:37 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 21:57:37 +0000
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin
 K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter
 <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh
 <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 2/6] ufs: host: Add ICE clock scaling during UFS
 clock changes
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-2-1cebc8b3275b@oss.qualcomm.com>
	(Abhinaba Rakshit's message of "Tue, 09 Jun 2026 03:17:24 +0530")
Organization: Oracle
Message-ID: <yq1ecig3dc1.fsf@ca-mkp.ca.oracle.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
	<20260609-enable-ice-clock-scaling-v11-2-1cebc8b3275b@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 17:57:35 -0400
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0315.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::28) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|BN0PR10MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cef7bb1-a2ac-4e70-a04c-08dec5a8f3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d6gyvCCummXEzBFoQeruL1Mmlhbsoy5wvvIUXgLQNle/FWrlGBUeSMLgN0mW1fWkRCFWbBLiUipMRD1CvagnYjl4kwcHPqmYF+1An18tKF6JC6JUxpT+NVUvwmc+zAjEl6M4Rsiwq3P2s9VlXWGjKGtS11AK3q2fAzkFz0NlWXuXD4PgOvF9RPIqvQBYkv9z1cflfpFNrtdnUwNoDXInUVICsIeKBb3ZGMuIKrsOg0q/1u9KC0WRucBVEM3H6SS3w6l5PHFBfN4Dcm30J25bC/RZy3Y8XkxTLF0rhaEY5TpHkMbFr5PvDrZY1ErHBqTAZ0stef+CO5tzDbjR1DG2rlIxi6bCA+pe4yDVIcnAHThUqabEGE9mHyz3lW/u3yxcbjrlQfHDg4vBg7PjjyH2pl6TS+ibba/9XOMXG6V9CdSuRNh4j8k2aa2sQMfy6LiGEIbkND4+pDE34UaTM4emHVt4U67LvCHTgsiJ9vVTLjamESS1iRuaLFXSh/Z5qNNin1dKZZcb9/gqlGXWRJH/92NWr5FEAfHsdAr03Rl71BNkUUSOkSLLNgqSj6Sn7wRTeqonSxgaoc/pLZVYgbz0Cz0yzPXeWHeQYNDDpC8qOeDZ8lE0idcsFrqJ/pHju5g419fjjKPxZARgYdZ5Ul+M3T9DIc1aKoMB+tHgF5OqiPIugn46YBhotey9AWFtlL8M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kSQw89MMItwFOeBxGPCcaUIy2I1+uttuxKewc9eDY2na7S0AGoinNEcaTuSB?=
 =?us-ascii?Q?8UHa/qUzSwYITXjLb9a49TVs5qITPyzWj5+SozkQNnh+sa+KIBIjCyjgsAhK?=
 =?us-ascii?Q?bKbiP9Lc3T5RWEl1YjwwgLQFQW7ToUbEa85nJfrBDrXhuzbJAPiHmabN6nSg?=
 =?us-ascii?Q?JBlK3Kjf2BR+BkDE4JCq2XB9YMmfY0aXk6BB7xDfEFQRRAHD98PZDM8lmRIp?=
 =?us-ascii?Q?oPMMDjmtf1rAieNGzJTK1f0o/NDIvhgvUm7oiyameShTPGTALl1t3tQGwfp5?=
 =?us-ascii?Q?+K32k64HQKKpjqNoaBrulA4Dq7XSvDdnpmqegCzhMY7y9fE0dCjJplaSBQ04?=
 =?us-ascii?Q?7yvAYoYnGFd2XWvxSYIT9yiyUlU2omKT92ConTGYy93u64VriN6m1ATpQFxd?=
 =?us-ascii?Q?6fvVmgZOYg1gLLrqU/hYBCtTlUlj2jqMhc2ajG2CtDlXEoRwc0/Sn/QTPV3Q?=
 =?us-ascii?Q?pXWrLAXlJh+KA+NYIeETOeCTe2B22PSS+05qa3KIW2Voh2H1pNN5vlTITeWI?=
 =?us-ascii?Q?Y7At8KDkuYNiumXTts4YW2VhVQ6hqtM3EYWqnLWP9VfnFAqEgOeM4n5eiebr?=
 =?us-ascii?Q?SP0bj0Xq+UOHPGX8JtUb1KxqiBARC788so3RR/5ZKRelQHql6b3NwMzN2z0W?=
 =?us-ascii?Q?BsimbxXwFe+AJuwdCvK5hybtdz8DzWgjwR+w1PbsVEvMPByd7GQXm+CBh9Md?=
 =?us-ascii?Q?dqqjCxGbQYEt+tu3I2LoJn+ENdAcmeSKYcCgjDzNkJVpL8pEQ+CDybJMzLtd?=
 =?us-ascii?Q?6tmxOBhlYw22F/1b0+Vb3Nyv2FMynjg5kfQDN9fe0joqjVtp11MGvtOh4jJH?=
 =?us-ascii?Q?I9p1BMAv2Zat0NwbBT7GMyTNkR5HezTOjJbCGtefw5u1Cyh0GY97D7t0DxSa?=
 =?us-ascii?Q?D/3TslZVn7XcJhHhfubJynGVfVPy9JFEZIno2Q4rAUG0XmMUSbD14ODfAPzN?=
 =?us-ascii?Q?Ph4H++ISjh32ZGTDmktSux7m5KOYwZLmrRig1x3mfYn8bbew/Vz83Y9KGxqu?=
 =?us-ascii?Q?YUFp73RhduZyXjVux68x5kkGnbGJaiPH/FdnG0uVSaaulOB++QuCPnV6RBen?=
 =?us-ascii?Q?LKEX251YWAkMaOEiQJMN8lyipwA2VoyKn8XHMb4OlxG6srZB3oPlcI59YjdN?=
 =?us-ascii?Q?ttFbbAxgyiRVWKXy988dEtq69NsfnxGBRC2Y60nOsLuHi2g+n8bodZGYuCBb?=
 =?us-ascii?Q?jPoe6kMvdKKxq3Ga0o+gNDf3JqXJXAksXTRX9T9uxXo2aYoS0PV6Gwrh/6Fg?=
 =?us-ascii?Q?/7yuaJh7cCefR8VxdZ/FdAF2qKk//i2BDby6RwmwqczoEb91TuWqWWyF5Bye?=
 =?us-ascii?Q?QzW/fEeVBN1ics+4ymK3ULyz86dIaMtmJAcaq/GebmVG/qcR2khD89r8l5Bf?=
 =?us-ascii?Q?Axy++7VWmAKJANX/JQNceS8xQV3qfmoOf1nX4X+36Y0rpIggGzL1PlwqElut?=
 =?us-ascii?Q?0kRdSNLGVafDx2ubTOD/1bot0lN1SA2Z3fFszhH9lkRaB2gO2JVSLhwzsdLj?=
 =?us-ascii?Q?awe5c0ABmqG4TKwDioQPOOha1F/g1z89Qxrl+0By3ecUNvAp3d8c9rFky1VX?=
 =?us-ascii?Q?GuDWYvUy0k1lOy79hGfqI6PjtpMXO965XW6cvIO+Q2OH327s0YwA8lkFEOhD?=
 =?us-ascii?Q?i/10bR/xi69a2rxuEzqMo8Wl4uSllmXchcpD9yUVPboarS59ZMKYjQK1rrpb?=
 =?us-ascii?Q?gr6Sqjmfg//hhKUuaGgVUsuOo8MXjzJ/QSzdaAlc3dErXjSB7OpxRTf5S7ms?=
 =?us-ascii?Q?Qk7bOejLtsA5DI0mlAAiTI6GrDzfYZk=3D?=
X-Exchange-RoutingPolicyChecked:
	HVERBU8y7KR9tHWl+vrkXL8BQmCu4LcuOp/u1Tu/7+lQ7B+masJ2QdD1iSVxfU5twppMc8i6PyOOu4KZFYXv9yBcOuj1haRBJjeTMiO43HqMa42zmDaRbZ0bIvNaMVP4VVHIH98DPTZJcEy0f+0Xe6MP9q80G+JXlYrE7dII+zyMom71iF6dk8Yp/eyS5FJLpVPC9X1pwpN+bG49LkxLry7CTnVKe5kVGQyXnO2ewpHl3enHuVW8hPpd79Lv6FG5/1MS8lSrNabI4Q7lBEac5naiSjgsqU7Skmo71xgqm2R/ZdZkPzD3V2Lwx+fbRHLx/6WgjhhBZq3uepdEKt6LfQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zi3B4uq6Ubs1/Otyh9K8p/QYzki/krjxY86/2d35ur9C+aEZkclpSGG1fpUUMNX2Bi4naG1VV6ucAQYk+e1rwWE5MdNlR1n5PEQ0EpWQDbfzMwgbzmPspKgFahrraDpHsPmtCyokmX7E2Af1zr7MIJLc+/3duG447ocKR5tXWCJMobrkfBpyvSPlSGbn56aHzGqFpXsdgv5qQgzo9jS/KfW4WxDaF6muAVc1bWkGMLhYKZuu4T06RvzsruigEvpHharXNChJiD3FnwOsrCprUMPHaR6Ahh+qHbQvK6OIVKaIhDuT0D8mP21phrGvH4KrUYjvbjMkWA7wzVW4dzt/j7P4/7mVq56WyUp2dGzA8AqI/jiyUZhOMT/GicrxTyButGsLZS78wyrkb/5vZeBYiBU7RGp8MUsnMrKmPp7s63W4QAwL014Fc11oliUEbwNgGgdZVJX60qnNhjEaj+ODLKWEE+E7RZdRj69OLLGKuxFPS+rq0z+8Ol2KZim65poU5tjoruIMSULheu4UjABYVDRQpdQJgY6HDbFDGonZB8h6Hh1D1eyTQjz2Ymvn6+gbDLwSNZydtaovflc8A+8EWzMRpbN6PoCIWjCH1lPPymw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cef7bb1-a2ac-4e70-a04c-08dec5a8f3cd
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 21:57:36.9779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7jGbfAJi6Ks0fuONDkDCwMXUfqKgAVF2S+mPRFmlpoQN+YJLSLMCeJeVnE+7ClNc0V1p4eQHBQyNHQ59diawr77ZmYJ32dRNfTrmOxDbv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4998
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606080201
X-Authority-Analysis: v=2.4 cv=cL/QdFeN c=1 sm=1 tr=0 ts=6a273b16 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=xy4oZan2cbFDXSxVChgA:9
X-Proofpoint-GUID: pAIc_KyfAKjFExiQ1pFnJoUed3JzTk0q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIwMCBTYWx0ZWRfX6Qkd0eHDYY+J
 o28YJ9t6s2DFQt/nYCEo0jVG9hCAP62Mzt32e37RraAKdP9TvzUdIfWcqcijM4YeBQSYF3KJuvT
 QfQmq5HYiQxva2+zFPxLGJ2D+bmyjASIXlRhRxlcNJA/SHGzyPDDR8oUHkw1lnUxIbVqic5Cilp
 2jL+Po7XtirDT575cgFq/dJGk9sha2kgHe/AClkgNarHX8GEgMI/URBiONVjZtRg6Sv/Y6qrXg0
 wcUTk2APXcDA8XEXrXUs/dhJZ2/3oOLZTXQDdO1VEpdQfjD1k8yKtTFSGTDROHfJobTmfn1ACrM
 KIaF3NdENK1kIIgx4tgMwSublNAtDbPWKBTUUYBndC2r9H4ly3RNvxLvL8JxtRUoYWhayLO+SIF
 NFiFYwsocsm1BuUgDBs+0MCp5UVIxtB5ffpZRoE498AwE5iCgiAJsmA3B3RtGyQqUntLbGrlwLV
 D3mCTreVJe5IYKQryJQ==
X-Proofpoint-ORIG-GUID: pAIc_KyfAKjFExiQ1pFnJoUed3JzTk0q
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111980-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ca-mkp.ca.oracle.com:mid,oracle.com:dkim,oracle.com:email,oracle.com:from_mime,oracle.onmicrosoft.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A18C765AD36


Abhinaba,

> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> UFS controller clock scaling. This ensures that the ICE operates at
> an appropriate frequency when the UFS clocks are scaled up or down,
> improving performance and maintaining stability for crypto operations.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen

