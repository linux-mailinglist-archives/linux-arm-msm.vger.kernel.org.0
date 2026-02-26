Return-Path: <linux-arm-msm+bounces-94212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJiaFdS/n2lOdgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:36:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1B1A099F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A193E3014C34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C6B3876B6;
	Thu, 26 Feb 2026 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mrLufH5o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jXVGvbSn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67141387580;
	Thu, 26 Feb 2026 03:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772076985; cv=fail; b=Eq4vB67bsAZBf86OZzoHP/0xQ3SYlORrtU5Kq8169X0rK15S1g2JMr+HxJ3HcKqEe2hDXjMMp+h7xrF/CMTFD1+YM+b6/rKk73GIqtIopmWBtXHPlD/ExbBRBjjtalrUCiIxUTRvW233MR9nSCz2+z8mJqXPB0e3t4QAgudTbTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772076985; c=relaxed/simple;
	bh=F1EZ7NSZWDmtZrHbs+bpq8y38uP7bUE6yN4RCrevudE=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=M+0GWwSSIevdBwKepR2oroSf9NvDy1KCjtrb41Bsq0pCzaeyxkdYeWsFITaqEIS8lbdiK4xzqhUy9RqHJoFiGinyppGY6HC7DiIw6BB+5Bn6xoPP1sembUZcOzTVa4qlsvIwb4AM06yn1sjFeDyczjGC8OvgAWD7ERQ8HEnp+GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mrLufH5o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jXVGvbSn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PNvUKn3709856;
	Thu, 26 Feb 2026 03:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iSl/F06u5B0K1ownou
	UqzQi9solKbzl+w48WEiXLzPE=; b=mrLufH5oMIjqIo2SyIP3jthmGPI11gzKXd
	lf0K/06DyM/0On0qeVEOOSpE/FO323YMZHwne9+X/bFCPReESg3RCRi9RQIsxvbd
	L9DQ9mUQWizwALmQJto52ga+gOzcX9aciyHHF+Wf/v836pOIgDhxWqDHvPmef6d5
	gAX88tGGSSdCuoeVmJU5QoC3PNGj6tqZb1L+UqDrwK3N0YAPp3OFgWvIR4ygy6aO
	2sY3RPKMCDUXt6Dd5v4U6yXBUyI+V7HaadqYYfYkP6nLIJx9ycH57lYOEfkjYay2
	1hvGGzLUtfIkn1vCan2Qtq/fQ8Jbv75s+e8vDicIbdzopLTXo+/Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf4arfh78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 03:36:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61Q2j4aQ028577;
	Thu, 26 Feb 2026 03:36:09 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35bx5pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 03:36:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRuu3/UTmPdI50WVHr/TWGlHdT2bYSU84m3dM134rNTiXDmQpPBkZ3vsjPfIP6Z2KFfKC2KmKOMTJkSagM/yFjBqSt2T2D62F9KRm0a6RMDWSTLZScdB1L3VPvFPjDZvCDAi6O1/2vZrsPk6OQl26a/nlugVdCS3WqDGmCOih8tzAc2uo2K2tTNe44IcXjzAHTLcNb7/OQDzZ6ytO94sWQrgdkm0ASR/r3dDFjOYKGOohpwuNFuqWCVXiDTeWM+EihFmPquk+I4O7mnICyCW6HxDrYOGo5UAl8pfHcyr8M4SIMxt/4zEnOjDBEVFjPYmnAI6nbEn8XvBdkSO74iKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSl/F06u5B0K1ownouUqzQi9solKbzl+w48WEiXLzPE=;
 b=ni2tjhdWEUx1xez0ipR/jtm0VgrFkZNBhm3p49p7ebvd0iSTjXjKOyXaKstx+8t9eDHCzNImpCxMnGESTWrYBLGLAFc30Rg+6HVR+8/A9uymWfthZLYuPJNeqUhcwwmXnheE4dCwrUoR1FjpaWy/MRcHIOUpJXDzD1AqLFQriMxVjGJkSpYzSwtvBlss1eFztmSuYRPU/WDtpSye2XUq/kdU3ov4OER/b+z83rlEsVkLJaoZfN3FmWBoGVKKjdwHmlFkP+cILwxzsgQCUkC0YkyJj6CfW4lSIxxZAYzAupvY1NXtJ10NTA5g9BxGe+0G0EJiE9bjoRer4zqvAzU/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSl/F06u5B0K1ownouUqzQi9solKbzl+w48WEiXLzPE=;
 b=jXVGvbSnDU1VQMZ73pjFYSfawIRdNsbKT2uAlxPtv7K3PAayJTyQ7wjTm8OBQ6JWbDvoBL6pdEbHgWbKdpmVR7beGxE0CmSr2VIYDxZJRNF2rgvgi+hJWssIKw74i+o87pkSdIa5SceyF2ctbvLpD+gTYa0XRpAZTurkBsRmSkA=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DM4PR10MB7473.namprd10.prod.outlook.com (2603:10b6:8:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 03:36:03 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 03:36:03 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Avri Altman
 <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "Martin K .
 Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-scsi@vger.kernel.org, Konrad Dybcio
 <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>
Subject: Re: [PATCH v2 0/6] Enable UFS support on Milos
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <bab87b07-42a8-4712-ba14-3489b7424ac3@kernel.org> (Krzysztof
	Kozlowski's message of "Wed, 25 Feb 2026 09:56:17 +0100")
Organization: Oracle Corporation
Message-ID: <yq1v7fk42r1.fsf@ca-mkp.ca.oracle.com>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
	<bab87b07-42a8-4712-ba14-3489b7424ac3@kernel.org>
Date: Wed, 25 Feb 2026 22:36:01 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::10) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DM4PR10MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: d886dbda-3f81-49de-0c61-08de74e82ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	NXOkijmLoSYhnUPoxfSZhiuELhkKu348dL3xrp93+liP5qzYnkGOHQ89Eb6t1p9UVHDvnguIr3gtFrA8Px+C1gDNJ1RvC6GS+29WihyLRo9IL1wt1O1sCXeuSHIKTQVPQHWBTvONT7yg0aoV2sqilqV7FvdQBY4g/1dp5jx7dzacSGUF0kcXGOBUfXnyoMasO1UGaA1z1OWIVd4i/2HBpHEbxAEwIBBYVKyFNGxmQ8qKM5ZXdy5yaqchVzM+pOKoHpG0nszwcLm/gox4fWkaRVMEXqvXEzXaubYkN1o0ZbUwOFw+2gAIuNbwEo0EraUT3f8EThcO1J1JGMpqH8JfWeDe4hMFLCsndtMdbFTmWyZRM/h2lE3bxr4sb7dhTEmJ/HfYKzkHPYrLg/7wdVNcxN6T8eyIvF66VotJ3KGmOAPvQkhscZj6YbwmRncCPXewIu4XYU6To2UrSkr5XSFqYJHfEWXJ9xyl/cjtJ1EKmzY7QVQf1P2ypjjifJW0ZES0+cD+WmZGQMYZ7n9+nSj3cZdnNxpHC0MXdo+BhJipgNuRdxNVxOkhyKk8RSTac5tvm+vs2qrrSkHK9d3XaTowxuv5owc1la8uNcmtlgpzWkr1NE/Z18uubsBtW0NT40VK6NxgdT8oTGtKKmtHjL2sQCtPseJsI7I0Rm4Db/hq45qklXp72OjBJerp3Ska48XOgRESA5ZLw1TGOS3yMmPjKlzwuuKt3/78Djx1OC3nJes=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sTMeSlsSZ5pDG/RzbkSwJFGb9iVtPww5GMv2keHkIvyESjgcHvLgL6OxRmqY?=
 =?us-ascii?Q?rjlr6w3UG2PGvosTgWXQS5Zc12yNWwCDTmSKsfz/zZsDQO1YuViFDUfola8F?=
 =?us-ascii?Q?NwwDnpgI3aElS78uK+vsCIi1jPsmMFtQPWzAOVwCgQDX718NfhObOkh+9TYb?=
 =?us-ascii?Q?Yki9yIpvUSMRxd/Yzk2qj2ZXGgLmPQFQrlz/8MfENO4dUF6Cw4QnQ5AZBa4f?=
 =?us-ascii?Q?qEcNU1MtonlORPZOgE05dS95byu/GrUqzQgF57Rxz6w4RfOLY0FQHbUsyomk?=
 =?us-ascii?Q?6/p3QYN8GFpE+73baqwciKxOvgK+eZjqlFpRalsXwrlc/fxnN7G0VUYM4nBE?=
 =?us-ascii?Q?5OJBpcssqd9yd8jH1YFoU+GBQETHiBT5aCROU4jrLDN+oy9LGW8RT0tW8DIh?=
 =?us-ascii?Q?whhvb4QdBJkrfGd7g/S0SLlE0mTnig7TdjAy+qKz12XNXjO0CiiaMzg2gT+v?=
 =?us-ascii?Q?6k81KUgMm/55gsmmEO/EjYk5AAc2E6PyBm4d3H6k3IGZukfx9fOnTnE6K2WM?=
 =?us-ascii?Q?/DW0iu5T9hmq+ytqqwiJh7fqZb3nD3jZPEfW6NvDT7b83PWXRyJS4Yt4+5WL?=
 =?us-ascii?Q?3NFrOni57fijsWTp5aWsD89wprZ3o4p0t2TRTjKHavb4qfUjKHYgtwvSyp3h?=
 =?us-ascii?Q?wzqNYjGNKjmhfULJnGnzyNQow/bsAx25VisWW3HNpGYiS43nMHQ5moDMt06j?=
 =?us-ascii?Q?wT3EdbhL+4hyHXYPGqZM3svMsN63aSP4fnskXNasJC3iWUUGSml8uvMhPXsK?=
 =?us-ascii?Q?rSXT4T3a/srged1DjR9q/azvL+VK+/egRqPwmIUjw5zw0ksD0yh/IwShMSZF?=
 =?us-ascii?Q?P454BqKqEL+ZSgCZPh7XbpBC9kvtQhI7CMFfCK9xyPk/OxLlsKFKQLyzgjhR?=
 =?us-ascii?Q?jxQf+jDsW/9dRTQGiPWiZNubuhUJBjRz884E9vyPWjSf4yYxLkKLvawsNhxd?=
 =?us-ascii?Q?Aw42PC2pL3v4ySdOmvZ3le2ktDiLXXk+ELBkmxjE89ZgzxygPYT1zul6tA83?=
 =?us-ascii?Q?vFfRUd02uyt98hrFnW7GwPamrU1Pt9v/j7t4bYLkLMm7gvooSb2vTfg+rrbs?=
 =?us-ascii?Q?sipAl2KAqfrgZSyu7vr8UCGVrpxjLKho7BmAy8JiLFj+FCo5LuavBhqc+o8z?=
 =?us-ascii?Q?W/ABVcwHrMyknVBz7GXV8FlgSDer6PtyujG8w/qGChaEhBrrJK3ZnSOONxXP?=
 =?us-ascii?Q?Ozkzcrhx2CETNqktbuxQduyv4tQw1wDqr0xnMUoU1ZojMihFIPqJ2XjuJjue?=
 =?us-ascii?Q?NGCopor135fZTjQqojppvpzp1UdHRoXyTLF51M/bYDmlMUZqGQRv1j6+IxVW?=
 =?us-ascii?Q?rcDs9/Dk1VApIhSF8cotlNn5Y5QU5BNClKCh94Wf1/ovoXPBmsLrfsLcmBr4?=
 =?us-ascii?Q?NiwRReeR4GlFM3VvbgvCi29S5FNLQXeUneayKtspizRJUnxFJ9r0ApV4S07g?=
 =?us-ascii?Q?qHiW0sQlWGuP2jKDwYdtvH552CWRbvbZDZJ8mUT9hOnC/nH1aQo4zBP1oJZ0?=
 =?us-ascii?Q?XpmwVfpnhraGadZz0PXwQSpCbuAeM/y7E8l0bEpO871z980aV3ETWpwhKpEx?=
 =?us-ascii?Q?S/Jf5jk/B/L0JnwUdeMsVsiXDcFve2F6Yk4y8TcMohaeO9AuWqF+8YIxI0K9?=
 =?us-ascii?Q?LPD9b2IU4j11xT/pw+fRXHOllwhVOZv9bDoEbFXJt6k9UyM2zs5XcwgZpvCI?=
 =?us-ascii?Q?e+/GluguNP8QNIFvE37+OT9GLWnp10py0b444CrQ7feajAR40DMlYj1l700N?=
 =?us-ascii?Q?m5yonv4ZZwa+7+9owWx1pXvQcgsA5OQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ig2MNN+KPjCp9obzQZobAtQBdVEcgjnui5NnpDLuq41XtIE07BZIEYF+8cxTQwVbjh3yhWPnQjTF8GkuwCgFZEBIJtXWOKgZyo6iDKbfU6cC8eXP5DDbbYUZwvMy4hqhF9pxf8K6oLZueVf9AQP5SXCJ7W/sFV7vu6P8hANqfYJZfL9vcS8RBEzSIcrGFWCckXpxProIzChOOd3LBPdmkHXmAB7nOrvHQD19o+LZtz/1tNyTKyDzECWgh1lVagpgakDYLEHPKJtbWLfD4feZEe9lNRjrdH8h9aJxhpAVsuWDWZBIcR+Pbj7ZBTkt+TVN09lh24RCZ4RBEWjGYI/JUO2qBHnVYXhfVy6b0w3ugCmygkDTJAX3pg1XlLW3yTJ2xHd86SQ6HCwXJGg7JR+7jmmqwYZy9PeMajTSyOglZjcyEDN/oz+WHR6OKqTVuAFQ0gal+UOatBXJqLLElndzUE+1Urr8NUt2VJQlQCPj9m8QdB+1ibMHFyl08nFaQze6sHmLR/rzHQGRk8XDcR8UfWOmCvrqm3vuANSQwx1MvHCs8Byd2izNPAO1RZvYRPxNVjl+zMOr8lH7J49VuwgGEGXGD4fXS+M6yxhKFukIQbI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d886dbda-3f81-49de-0c61-08de74e82ac6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 03:36:03.3865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fw9nMJ8shGmX3iOlJhaJoEPlydpgXjnODF/Eau3oX2MedSmroyANY0bv6zax9m0zBh1uM56k+iLk8oEaMMlRv9rU3ZJ0bxY27/WXpoHmH1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7473
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602260029
X-Authority-Analysis: v=2.4 cv=La0xKzfi c=1 sm=1 tr=0 ts=699fbfab cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=u1X_V_D9RYlkuY26GzEA:9
X-Proofpoint-ORIG-GUID: uAPBIHgoIwufzXD9MMFz9f8BKJAo3xaC
X-Proofpoint-GUID: uAPBIHgoIwufzXD9MMFz9f8BKJAo3xaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyOSBTYWx0ZWRfX0WyTrb5WQ3ZA
 WjPtEf2F7/AV7w/SIB3xpMJRx/b25vTDbABi9BZXdVb33OSaJRvb180E0ATViUHxS6swL7DOExl
 gbrvKjyl1ac4LuTt2ns9FJ8WYgAI8PBNPn/wHhVbP76Qvh1y3b8WLbCvD7AVOhFpl95qOi/rikt
 7xvgweWsls/p44wBalC1EB3rSHdpgl3k3mbLf+ky6tSKGXzbdTixDu87mq6KwPba+m4vw0AlNW3
 eIbt9cawfnNEPg4vSb6Z2ChNjfCw9vRsIsOLIwETWwcm8FwRrgxpHhbmJmtKojt0mJ0i1lYUHON
 Gwrx5SD3/fo4lT+ato/CUwjT0dozMFptS7/UiNeIsSq62IdbQq+5CcqUTro71tnCFuLN4YIg9C4
 v/0zB3oo5Wf6Zf63Jks6pLHQDCK8kB1FWc2bIDS8dVRXleyfSfy4BC1MbZd6doDhLR+NQPj3m/X
 LWdkqfvEtRznILRV9EQ==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94212-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:dkim,ca-mkp.ca.oracle.com:mid];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B7D1B1A099F
X-Rspamd-Action: no action


Hi Krzysztof!

> Driver subsystems CANNOT take DTS patches because DTS is independent
> hardware description, thus combining them implies dependency and
> usually means users can be silently affected. We expressed it many
> times and documented it in point 7 of [1] (although it does not need
> any documenting because it is different subsystem - why would you ever
> take arm64 stuff without acks/permission from its maintainers?)

I frequently add impending series to my staging tree. This is done to
see what breaks and what doesn't if I were to actually merge something.
Being in staging does not imply that things subsequently go into
scsi-queue. But obviously it does send the message that I am looking at
merging patches from a given series in near future.

My script tries to cherry-pick any commits from a series that are not
already in linux-next and which look relevant for the code to build and
run in a cross-compiled environment. The script is certainly not
perfect, figuring out cross-tree dependencies is not at all trivial. And
I certainly appreciate when submitters clearly indicate which patches
need to go through which tree. In this particular case there isn't a
dependency that would prevent me from building the code that I actually
merge. But that isn't always the case. And I clearly need to be able to
build and validate the patches I subsequently put in scsi-queue.

I'll try to make my script more iterative and only backfill patches if
the build fails. Hopefully that'll resolve the situation...

-- 
Martin K. Petersen

