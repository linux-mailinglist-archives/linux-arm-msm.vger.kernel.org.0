Return-Path: <linux-arm-msm+bounces-105386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AS/C6p882nH4QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:00:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B34A5401
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E9BB3002315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970CA18E025;
	Thu, 30 Apr 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sT0PcajH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QrnDrLl1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB994657D6;
	Thu, 30 Apr 2026 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564835; cv=fail; b=QQyGDNMVhsR+mVfuEofdaWDewbPKaBxodYsQ8ydSrYytnZfS/pt3HA3r3Zqgl4pijaAin8rcUWwri4b/+q1CnJBrbHPAf2spPpdeJVWjLXcSSMToVctYUUmzw+NsKg/ku5GfhZdOA/o2daMb1MQb1hpNmMaO1gTZ2nEw7lI7a5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564835; c=relaxed/simple;
	bh=WYWHVsi7gTOs2qpxZHvv68ZJMj/liqpBfC72QsLA/gU=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=OiA/r786mh5mdYau04Tqx4IK9kflPWIszLyUzx4hdZim7SMpbGdaDyVFmpIBz4gHJOtGcc7YsIEtlhTMH/HtKngwsU4o5mwypby79nxg/G3CfnfKo5aKx263J9cMfhWxZitkiBCdU4lH1mSN6wAi1utiCQWbUMNU9CQFwomPV5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sT0PcajH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QrnDrLl1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCfYGZ1412747;
	Thu, 30 Apr 2026 16:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hthRgeB+UX1KLtq5Pz
	Yu4+IHGl+1o4FeFrwZuiwEiMo=; b=sT0PcajH1F5At3z5YncwgXS/yZoq/XMR56
	P0cANC9/n3UQIHhZr3DHhzOjVABe/twIqo7e3XC1waiZ0pUU2rKRqkeXZmBGjM5x
	rBwu6DeNiMGoU6RgvKsHpGZ+qxfK0/51NaHL30GANiOYOKZ1enH/slnyqEc4HFcU
	OMVuyfjjKKxW3Le+A91eHYwp7lykFNBSBCaxz5fPrgSNFyofYJ9DiHzAJ7IlUUAw
	arfb0vZ/VCHB8QtbImoG5t23834eaR7xzbFpkZsOTUkOgihDxO7vbwS8pVvHQpRT
	UcGZW7s4fcpLPR2YyM0wGtv+KSPX6AmYcT7JX8p7k3nTSMy8f5Gg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4drmd65e4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Apr 2026 16:00:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63UFpO4A024933;
	Thu, 30 Apr 2026 16:00:27 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4drm2fv8yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Apr 2026 16:00:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGuiUm7bX6U0bdZXXV2vU77W+os5TYLiCzPLLoLqoojDVQ4jSPUrWm5w0PxzNYObJeKgkKXZpLNwEu6ic2k8CQTZC8/yvQSRET8FysJhjAvOo9rmI2GELFaWE59dR18D4nQHAB+8yNH+PeJ2tYZNjz2acZ7SkWguT5fF9j+B38jD19VWE2yNBRzChUccvX83K337zG2JAYAmzVrvlYCK6QQCsexGVst6gWSN9a/fz/1uZT0n+7ufqBeYNuO00LqYjiNSJ0OlH5u3bPZi552nw7d6y7A+LxGI9HGPPZNB/BwXrIL+rK+T1UVQt4U7nSr318BZh/Ae/VbCKIOHchA2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hthRgeB+UX1KLtq5PzYu4+IHGl+1o4FeFrwZuiwEiMo=;
 b=dFkLTyKmdB6pl25esxBBtdk+lic/kXLX+1oUzSvCb4imT+hVdxrq9iAQ4/mPVns68yTqdoeju+R4OZYvkUoaRZzqFfQNrKVtrW1qlmmRAxjYrfV6JMezN4ujoVS7JUHpABDQfHCDCGSiTPy3bV3Yfkd1S7P4UQ2RBXqlt3Aa56sb6mJPot9mIMM6Uz6aVvO0wCn9WrpHyFzDur7EDv/+sKaFFbHIpBW67a6j/oZoaBhQDo1Rg23YUG9lbSxwRCBnbw6gSfn7cONP+K5ODwin8wA42mTqmOxYiUnZgFaJVsHf31mcHJ4KMMiQld5C24YnW3rL4m/M13VYz4sfwcu3CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hthRgeB+UX1KLtq5PzYu4+IHGl+1o4FeFrwZuiwEiMo=;
 b=QrnDrLl1FotlGTj5YwkuyDfABDBV0wl6SOTG6fXAArAQBK5iBPnHkCv1B2jngCjutiisYtZwuoSHPsO4RmOF5cUtEeVQBaArKpctFJqKxx6lga8R+cG7JaEyOE4cFu7J/IsgofHlx3Sg7U7K4uf6lLozpFPZZBVmOI24NlfHVpE=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by MN2PR10MB4221.namprd10.prod.outlook.com (2603:10b6:208:1d7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 16:00:13 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 16:00:13 +0000
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Manivannan
 Sadhasivam <mani@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi
 <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] scsi: ufs: dt-bindings: Add compatibles for Nord
 UFS controller
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com> (Shawn
	Guo's message of "Mon, 27 Apr 2026 09:31:13 +0800")
Organization: Oracle Corporation
Message-ID: <yq1qznwe8vx.fsf@ca-mkp.ca.oracle.com>
References: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 12:00:11 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::15) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|MN2PR10MB4221:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a707b3-d626-48d4-0c85-08dea6d19034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Aqin8LDBn9nO7TVZaCSFkj4chdASZIfI3nJdlJRyezUUHBPgulDF+sghNaOLJ6fN1hVW5FuWQPGU2LL5ayhBWrrRagghQTD1EGxQNSop9sdPW+lMo/mA0imUuXellln8z52Zd6pgpvec5ijYs+4fXNvgv0x1v+k1kRGcJtOaA7e1gClvBcl6Z7PFPymQeFmEO2+Sz3O2Btxi+2CYa5Cfmgk9zKrJtvcwjHbxXwLeDj7XCBgpacaEd1p3CpSzOMuYRVbplk23OwYMNLKkMxnFq2uDSxMCbFgzqTAmMgB6H5wWD93KXX0YPJxF0TL9HxD8jo0V7aEIn6K7g0Ic+NO9rsaJpMrXWgMl+kz8cErRKbMUZw4TO8oDVcKGJTUyWXbUd3knvYJlHFa7//tgNt7RTg6zzjv9ft4VicaEkcfNPwg9gyWBWrd9I/KrC01ZISCdW3RGDN4BUaMSNCtUCj9S9fmkKvAe2H4pSFBZYA4aMne4GINoGfPALLKT9NZzJVyNxrxqQYGyENJ/y7r4LKIQz5I21TCYtTCgRvxsgLvmwmtAQmIRs5SevxaCRgLXUAolvxrLPTqJBeu5jTXnXcToXo0XKONAZCeOEiMBa9M3TwD674YxLehZdQW7uo1cfbMghpRxwQGuFFFsykYc7o/auCJBQHDVJW1fWwTTemfyA5xbbYx3IiJ3VKV7ODMngsUtDXXYw+wT2E2n6qvLD+DU+jZxNG1qUVjUieqkhgEUDXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2wmFw9QZGMg+GhRxEVgqpTgFszp5RW6AriZPCp92OtdIeMi3JD8nsHXYyr5W?=
 =?us-ascii?Q?BVBmTUToTFzkkxk+zz9HoqDWjQHAwv5acogNEU9inqRR3bRsd1PjMUwAs27Q?=
 =?us-ascii?Q?OJbs1qVIey1L8M1hOnzdyev/xCUO4UTWXK6PGWgc0hK+RMDrHrHRX7ldQ5P+?=
 =?us-ascii?Q?/IaBj7J+JKsRJfKV11LYSD2R+SSAU6nUICFzKvIBVM16bhlzXb6vPaQTaFI3?=
 =?us-ascii?Q?1yWTnzmk1F/cTYgfa5Gwql/xxfd7Wjy5xkhjT0XavQj7YbgUecVnlvN+nrGt?=
 =?us-ascii?Q?zcVtY9sWQaSMtmP23NEB/LPc4Nxoooqjzbh8gB654NJe5PX4pnt8789s/wRp?=
 =?us-ascii?Q?z1lh3y4ALWgnI0A7FvQaV8qdlDMhlOateqellmgFDHuVyqIm3vFWB65a69kt?=
 =?us-ascii?Q?B/sxj+f06ld8p+C5sTMYnv1Gla6+1Ock7fZLSByonVbWG5pSWDqN1G/4IRM2?=
 =?us-ascii?Q?sOxNIR3YCrxJmJBBOMxwpl0/6ksU2wefyg+/uwjkMswYNNmbYc3+aFbRjXl1?=
 =?us-ascii?Q?MLzSyfQK8ku6N5G5MEzhgKb7+OBn3VVusXvWhr9XGBnSUK8+Knta1Jp2IjXr?=
 =?us-ascii?Q?fwFo4ytVmciPHGAjNfleY7BJllUa1roOFRIPPPsHw9IEdAiSWmQaMy7Y+ibL?=
 =?us-ascii?Q?GU1nsccheaTgbDqgrtUHQDAPev4UbZMDIlCZWcJ2k1yUMcwim13EA/D1VXrE?=
 =?us-ascii?Q?GXA2bij550WU9ZmVtVGmor0yy03q+hgDZbpkYr4RbQ69c65a2/s9rBLapXA+?=
 =?us-ascii?Q?ItwOF4JpSeMHRGW/HCiMytfTiPdMHQnBmMpCA3vYfZE5KWLZ+9ufjNEAbsMk?=
 =?us-ascii?Q?d748QcguFNeE1V/D3qvjDJ5+secrAnuuZNN+TMcGEdvvHh1Tsb4DPE2/FyFz?=
 =?us-ascii?Q?gjDxBFMXdPLmVvhE6HFWXv3WjJTjJns4fsavy13lSu1Q7yjaaxcDW6Ed+9sl?=
 =?us-ascii?Q?sI0HSxG9wPFWf32mkhIz/i9qLszRvICKWI4qWJcBZJil5DTI27uYNoA3QvNY?=
 =?us-ascii?Q?3YepmYowdkkcSXLlmaUC4nXTXuwo4vQSlaoLtUYHvW2DNRzYvQGo3l1jCyBv?=
 =?us-ascii?Q?Rsseu3a7mknVMTSW9MPfQ/7wgHkmzxGrUone62WJS1QaUhfsPbAMO7BmpH29?=
 =?us-ascii?Q?3kn3+QZziTd12swsdNK5ziRNPmYctY5ydKZsbSzCq9hqBrfi/nyFAD3gz1ni?=
 =?us-ascii?Q?w0kVHMRX5jNlNMXaae15jW5shIZ8lieUhoEuJkyDlueKg3x3AUH4ARgH7WNl?=
 =?us-ascii?Q?hQH+/5IElRslZNBhoUPXIHVKjFftS5pDylDguhKqi4lQRooGeA5ZUd6tAVY9?=
 =?us-ascii?Q?7mh9c5G0QZ6dov5hrUJ49CEg43jBgXQ7g091MbMOYcM3FAGchHlO/y0MfEEf?=
 =?us-ascii?Q?XihvMFfZ5HcqpphDo+PycDc9fWp9WmuZoa0mABwPXXBbtGMHN6mLGeHsJ3bQ?=
 =?us-ascii?Q?Aph0//PJHWmj14kZmVdZ2pCCE5khuOZigniXAjWPj27TecvY82bbQXY5qic4?=
 =?us-ascii?Q?oxZXLNOqe/Kzi4ptp97oX3Ln4/72Utk1QwO6F38aWpLfZe40wMRAeUEpNKF5?=
 =?us-ascii?Q?hrdHKlzJfNkH549V3zPwaJ9fCbpAS5QSCcmXQZBNO/kzQ5CBCVviXOMZkH9f?=
 =?us-ascii?Q?tb/Xspd8xl882XGSSZRdQEwahJ9vs8w3aDZ8dBSe5oTf9LzcXFjEsuwo1ifJ?=
 =?us-ascii?Q?RUZyyDsEJIufh6AD3XU8H8MllsJNuNdiNceKDua6gN2PynzrEmEgPKEvNKJY?=
 =?us-ascii?Q?8hTg3n/e9i3KhkQuUAFTAKbTx/+7HvM=3D?=
X-Exchange-RoutingPolicyChecked:
	P/OnvSaSy7LFp1CEu60kmdxgG8lfkTlblIZ5kuSNbtxVHVrQfTcGMoDZWd0jKUAfmb4gOwJNJ9LG8GNBo4iDuHvkCy5/YUyj4lTp1NZ4AZIhaaWeIt/Xm5C45eTsRJwCAiKEYzi9Hr1kXIjQHSwqV/RB1qHgJw0jKcciUAJdeOTgKeLg8frQXPnQYRVNA4uaN5DyXqDsFcb1JPlK/R4jz0lAt8kuZsdc+fIbcuH7kDCLKrqQvKV+MTZKxToVa5/8DbX1P6JzVTGZCwHa/A6wEVl3tyMF2JdrsQTaiRVxBFdt68b/ETiEn+J/kYOQBm/kFrVoVyoHM71Dm53bK4laSw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fPFenUyLuqZuc+AWc+8clwqO1rA8l0LN0tWfIJ3D+TF/v2SpSHdx0DK+qVIXkdKUtU1AcDxYTSEBnYsLx8RUTYZIs7iBMon6+HMKKXv/zlfOPne4sAV00qH8mEzAIUgXyy8gF3vYGMXlY1Yc8mVkRSowi+PGWVXJgSwiyFTeA6lK9EtgKNKfgslkjJOys+o5N4ibRQf4N5bQCKdP8H+0ZVymtlBqaubTXeRU//RO2w/NlymsyVd8LaeW8XkMQ6IvDYde/zbcqp1pwECdlfgYcgmkDH6eBbvcyyglTE6NsZ9hdlAcXIo2iGGV4Z6zYlu7Rqk90c42dY+PLIJD8y8BPNMCTV4kP4M0IDapBAI1zgJBk2LGszpoc5lW17G0l7kIBojwxANuyqyBu/kjOvrYLtIuW3Q/k6V+4VcRaOVfOfk/sOU0YnH0DhX/ChPDyb/zcKWHI62i6VcTCd/QTrjiHAnqDGvClIm0J4r/IKCWGSJ383gADPTHpNPP5LOCyTzU3Rjq9YVjaItP4iuCkW+TjLEIgP6yvZjqtGAnqGt89aj6190QHmJfIHVg2wE0mmG53zRccMropyXnRzkbKfnOA6aYt7wGEqdmpzC+q8/zYSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a707b3-d626-48d4-0c85-08dea6d19034
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 16:00:13.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xszyWSVx4I9zfBWFWQrn6SICfGhmRZGT0gJVa+6AtnAa4iZz/eOXMDXzswM1RPHuCy98W27t88oq37DEZSBV1m1XgFVekknYFs6oXqpy6ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4221
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=782
 spamscore=0 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604200000 definitions=main-2604300164
X-Authority-Analysis: v=2.4 cv=V/VNF+ni c=1 sm=1 tr=0 ts=69f37c9c cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=Zb2pTaos4lAr7-TX854A:9
X-Proofpoint-GUID: zgAOYJxkxQJjNTWUd4ddF8uG77rwjfSa
X-Proofpoint-ORIG-GUID: zgAOYJxkxQJjNTWUd4ddF8uG77rwjfSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2NSBTYWx0ZWRfX9iOn5QiGfs9F
 upzUmQSWw/41eaq38stYw6UxyIs5SQu2b59rqPXvUxr6YoTMYIfqeilFyawn6smHN2EhgDhWVIa
 4MaU6fIXpnPpe5QM6siZGFAYxsRB/rG/uB5fX2mCYhJXRDM3eYEJlLBUwudPq7HrpN8Ir55Nd6E
 su6VX46CNzDxrg7tRV7/Nu5UHz8OBtSQNnA0Kjmk3bPaNrJdd4zSZJFA6JHCFv7prYtd/0aiKsv
 VQEqQTOVnQX/EmbgjLveuArVmsV3RYuJP/E7jl1WzXBX51JxC4WWaS2eIwbtt7KBRaasZ76Ac5n
 P5nR02vbQchxUBjEYO5G/mnpOVOYxWpXmOSjYsLSH3+/baRKaPJQN7rBwWpOfiTuKpcI9TBJs8o
 b3iH1Gr98CUQ9EvTwSVmx2RniItOyo64KR2ydmLHCC3ipmn+QaG/RSUX2PsCz+n7MZu1Z2em7qD
 +5j+FLfS5Qg6yCNHOYQ==
X-Rspamd-Queue-Id: 0F1B34A5401
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105386-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[oracle.com:query timed out];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oracle.onmicrosoft.com:dkim,ca-mkp.ca.oracle.com:mid,oracle.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]


Shawn,

> This series documents the UFS host controller on Qualcomm Nord SoC.

Applied to 7.2/scsi-staging, thanks!

-- 
Martin K. Petersen

