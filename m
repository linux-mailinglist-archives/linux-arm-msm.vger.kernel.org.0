Return-Path: <linux-arm-msm+bounces-67825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE7B1BE74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9D0D1890EB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 01:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534EE1624E9;
	Wed,  6 Aug 2025 01:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UhlOGNr6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Qak16m8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D5578F3A;
	Wed,  6 Aug 2025 01:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754445294; cv=fail; b=oGGX6mgj2bgv4yWQyM0uKfD4La/IL7a7oMZp/5tjvNWirxQn0qsnN5F17LU4xwEr9j/2kP23wwiLWdfX41xDWrbS6ZbgHKJDZMsC03h3SQjpeBzq/PURVvABOIKl4UBrL9ZYmbFiYT0rHl7j0gymssdFCVfiB1VCFgyIMFmCi7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754445294; c=relaxed/simple;
	bh=PZbMFDaZsFzhdvExbukST8Z5MdqoS6zKYmmV76YaI30=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=g3AeDRrzXs6WhnYvcZs4ujlASxwDRSdnAs6pgw4BtmhGpP7NqFwbDowJlGAl/o7/X9FDajdhj0WDOYLFx/sP+rEOov853AtMYechxrxn1Z148CEqsd1lqKpzQ57wZiqh89mAkXVePELh6r8g03WtSpIXP0wY5rpo8fwVcqT/rjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UhlOGNr6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Qak16m8T; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575LNJ67020270;
	Wed, 6 Aug 2025 01:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QBPUIEkkgtKCz0lIh6
	y8W8XzEG+CTCWnAA+KMMkGG4U=; b=UhlOGNr61CotoqdmQ4XViMnCNQarC2ILpj
	oo3BeboQGh9WGf7U7aN3WHqSHSoz3H+dCwUiz2I8O0/fs/cfH7gbOF6sJeVkjEN6
	9e2vJQyGFdZZzISLf3MtTaHznTxwKhWGwI+kgRcCqwJsKCIiNlrenYtjwfpCLo19
	+Yr4XVK2xDRzBvUTtToq6eHxITHt4GWrVYUZ2VhennxFAM+QujYPT1Br0Fr8K85/
	PVjVca5lUg5bi4KF1bvcrBRK9MH+4+cF8xfBeUC3HDBEtxy+LVzFjYKrCRCZA6mG
	9QyWRMLd4TH3QJ5cjWq3c713ULYm0KhL5dBqpIrRTzdXZwINX/zA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvjrkbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 01:54:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575N0W4K027087;
	Wed, 6 Aug 2025 01:54:34 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwmcq56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 01:54:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2dZucpJtA0E5rJpr9gylqDw64qP8Wa88EBXt2l88LJiaCCsuB8WJ4ULtcYSc2GxWErtkk5jE2o+fGk3+K4VtWwDVN5cyFr/i7x8lMsF4SnbEpC2lzSVEovCo3Sbf1RHBdBv80S7D1gzq3FYfCVYhorFyRLHLdwWlCVb+cXU1pdT3cugZhc+8OM4KVy7die3LS2C8KJvjo2g5LPrXUJ3//VKIzPU8KaXfRYykuam5Nnl50Xs17qSI5kGB5U1iWKQJ69ZgvrjjpthOduuWZzAKimcVLH0tP3gsx0w0r8StxcIu+KUNnf45akhEX73Ihj9ojTwRI9XkomfRbgaHgcmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBPUIEkkgtKCz0lIh6y8W8XzEG+CTCWnAA+KMMkGG4U=;
 b=p9gi6RkO3Hl515zq/awXG85ihE+8tYkWHtKC0QLMES3cssUW5YXJW2Seb9DDv/ReBouikkjvlJCS/e8J+oNiV0GAccFWQGIydiYwwmLyEfTSyKlJmflKGNiltha07GfL5WtnpnbqXlHPaPXAxVUmkOHh64STehH7tZkiUtJ/Mr3S2ZlihB0TOKf41lfja+jVBY/8+qY+xVGiElhL7wl6UOljvkkkVPKyKosTXpmI0PpsoJdKLwAIb0uNZuBF8WN4vlBRckNEdvPrXdkWLs6VZTReXxoPum43UzP7WCpWpHidfnBiO/xGeRLjWat/gqQntpEzA1FXZWTHEoHSBRHK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBPUIEkkgtKCz0lIh6y8W8XzEG+CTCWnAA+KMMkGG4U=;
 b=Qak16m8TBUznL1f5E+YH/aZVnZYh/KvV+rz8BoBUMpERRLdanoTuTVjqSWLuNcnSlkJWOrwgNSyIZFHBh98goiTY97S+q41AX4jnIlLjEhggM8KeO+qbKiqlb0+5dD8aDLKVsS2KQvOcnCRjduwzB9fK6ftEIQucY0rXxHHnTdw=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DS7PR10MB7153.namprd10.prod.outlook.com (2603:10b6:8:eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 01:54:31 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 01:54:31 +0000
To: neil.armstrong@linaro.org
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org,
        James.Bottomley@HansenPartnership.com, huobean@gmail.com,
        mani@kernel.org, martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com, andre.draszik@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Palash Kambar <quic_pkambar@quicinc.com>
Subject: Re: [PATCH V1] ufs: core: Fix interrupt handling for MCQ Mode in
 ufshcd_intr
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <0f3a7ae4-08a1-401a-a41e-cb8db530de36@linaro.org> (neil
	armstrong's message of "Thu, 31 Jul 2025 10:27:51 +0200")
Organization: Oracle Corporation
Message-ID: <yq1qzxpb4fs.fsf@ca-mkp.ca.oracle.com>
References: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
	<0f3a7ae4-08a1-401a-a41e-cb8db530de36@linaro.org>
Date: Tue, 05 Aug 2025 21:54:28 -0400
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0097.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::15) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DS7PR10MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a95c21-e232-4a47-f9be-08ddd48c2f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K44AcuYy964LU30rdealahsa8CHKmBhPhw84Pt0szVwVPjDGo9szul2vntcj?=
 =?us-ascii?Q?HFEqwlmIyF2jxGD5mLvHRDc2nLEMSnqFK57V/FFOWJVPTSOD35ggCXD3Y2dG?=
 =?us-ascii?Q?JgAbvxDeYwt0NhWY1TRsTYgCGExf5s3kHYS9pcFI0lz/UvX9I3k5IhEf5yDR?=
 =?us-ascii?Q?DtLm7v4k0e/sTQIc65ZXFNWMWZwxt2Zu2lXnF3AfxOZoK9+xiC3KupREluEW?=
 =?us-ascii?Q?pdYBv8eokrWxvEToQ5Jd/f9nDNC2SbE9H9Ot/qOVchk/F9ck8KrEvbE47kde?=
 =?us-ascii?Q?MtmrGa3cfe0/ee2duY0W5DoFioWiG5+kA50cBeKZhwl9zn5sMfP0VW6AK1z6?=
 =?us-ascii?Q?cdmrNJPh1HTz44Pjo6ESTrn7PZonePnLzY8ua9U2F7NiEfoSk1tSf0+xCVxG?=
 =?us-ascii?Q?ayyfTX3s2ImFHUZjMMqprKjj9nuBdo0Q2/4LilJHlBMHZ8nXzo6LPE/XoSAd?=
 =?us-ascii?Q?5UI09MxxAnZtJVwLDuCArmUjTE+pK1BvaKa8Ifg6GRJYqeLFvbFS8f115yXL?=
 =?us-ascii?Q?NRew3CbRy15G2UheIkVjiCoY977RJheHhgHVykPGbGphViAReuD8avxyjX0N?=
 =?us-ascii?Q?Bof+OjsTZDx0Q/9ocpxABd4sXjELnehaZZbbsA3zuFDeQIPBW70s9ZZDReT6?=
 =?us-ascii?Q?IJO39K2s6wRdNO039BN+NX0bbBwPLREepswsrtQTsjhJQ7j6QNjqsMkb2RGT?=
 =?us-ascii?Q?iXmD6n2xEAyoghhbYqcrppXdHG/PGJKVgvNsEf4VCIPw/SWImrpURjQEHxo6?=
 =?us-ascii?Q?2MD9ivOTCYIR+szyiCEVYnoXzQAYPmjN+saMbY8xQy0D5WmYK/GpYN6ClaXf?=
 =?us-ascii?Q?jggN+HenVnXE+iRmvcTFYswKCFTQ2rC1RVYUZLqSVXtHUM56Vczx4RTCJ9LF?=
 =?us-ascii?Q?Ks1inx3W7tJChm+gv6Me4gAGv3n0NHPS0kqDxBPaDPWYmzwK2DNut/rcXSOA?=
 =?us-ascii?Q?WAgjY8N8UVfq5KRUPju2gNlo8FvPSB7/G25zMGTrgfMHcV0RbdiwwRA6F44b?=
 =?us-ascii?Q?6ynLn8a0z63y7E5M1TxhNwCtGTzzfLyTvl6TFM6IbZMKh5cnR7q5wanaCaYI?=
 =?us-ascii?Q?Q31VCObxPyFxKaGoA3WC8rIhymGpVeE5gq+YaC8RLPkY+eq7JSinDDr6bYNe?=
 =?us-ascii?Q?GzH5ECY5JZTwEJmcKfXejCmmPy8GRBhtShI9zG3/dp/XUIQKm06RMjwV1Alw?=
 =?us-ascii?Q?lmLC35QWdTSpV1kKCIPp/jtZW+NRERmzJDNpVF394WquBEuMIy/JOBDMXYqB?=
 =?us-ascii?Q?rJ3s9Vo4n/qYNFFUL/QUAQQlbNs0KoEwMjKeePE9zKEEssfnlsQdY5UVs5XA?=
 =?us-ascii?Q?/jSWEgrzzHOJTSTLcLGq3+pC4cib956XZE0+Y1hl+QtPToaw1gLA4++Jfq54?=
 =?us-ascii?Q?w9xywg1VadZH67FJ44g3BytOoPoO/NHuZHaU0aI77X+qOXOmP2DYxcoP7RVj?=
 =?us-ascii?Q?s5j26cKZEJI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0pxPvI8a89PSLbZ+tV3lqvcYiKIA3/Rm4j3VEEHCcfVDiLekNXC9NbcaalUH?=
 =?us-ascii?Q?XekhHveEjJZrtDH6h2mSAFG8P/uhtxc4yB9ImfSBC8kcmnJae92rmnMihhfk?=
 =?us-ascii?Q?dLtQpiEqd8SWq9sBc9V3tsb6BIh/49Yi5M+hBHsLie9swr1ZWltvcH6NBLzE?=
 =?us-ascii?Q?PnTLdANdXIurNyLhTZ7GB3+SbQMJh+K2HDUa5s23jSjZsmpcUpbjV4+6Z6uU?=
 =?us-ascii?Q?WpQ76Cx54mZxIDmVql2nsMNOYUfrZvuPmb4vkTl0ObqlrnHwDNZ46g8FbQGz?=
 =?us-ascii?Q?bDgx48rApH5XiNi0SmhwrhCr7eAdnER9UctY0EGLmz2iVwSR0lM3BgX+n7p7?=
 =?us-ascii?Q?bYlGNxEu7TvirjXXMucN/TtbpSkLUmfofLY8oQXQUEfeSjv4+VwZGm/p7dvw?=
 =?us-ascii?Q?Cwh+oldLaqYQUlFclahxNO/yeXLzOfndTiTLLQ2GahDyR1M7VX0iMsagu16c?=
 =?us-ascii?Q?1jBjW1Y1Cpyo1wEVNQdpr8YRZhEO0pPzgum3ThKVfJZGaomzgWM1Wt+6ZBPM?=
 =?us-ascii?Q?w+Btz5BozVusj9IBBTv8cAF9IQACUUgdgECLjWgdu4Z8L27FZW+x+jvHaf2D?=
 =?us-ascii?Q?3kX2x0h6HFeOkJWg2gQrDCNWWVpNSczb7LvU39j5j3nt92NaoQA+OWJy6Jq+?=
 =?us-ascii?Q?kxpK/JV+KrbhDh06J8DORUmODzOJyUuI8TLcuQy20H0XDPGl0Ny7RNyTvjQm?=
 =?us-ascii?Q?lp/WfdY5pIaX4bv5EGPLaonVc2GCB3NSeWGWrCtndfjbNY2C3Z9npCgFnRpL?=
 =?us-ascii?Q?pEZGg1UZ8ga5j/6rJoVBVpRcTGymtWfKHN6AJDgcwmik/xEwQFwyfEgX2zmo?=
 =?us-ascii?Q?vyv8wobAInatoToJb+i0Fw8R5gMI5Vy1UEgXo8t55fH4zOLKGLgFHg/3PXYg?=
 =?us-ascii?Q?f16PJeUK0xvVDuGq0hC0RPjWHkOfiVz1xlhrhQzWWh91CzOQCHMecz/+hYyo?=
 =?us-ascii?Q?CdcYl8CfVmmhnAQPhkwjn8bM3qh3K+CAH2ohEJXbocu6d8txGX283eTPSr8K?=
 =?us-ascii?Q?Eq4MKFrNKiWrY8SxY37FPgmknk2SeqC7GKwDYbwqS5cFhR0PRPpvi7Q2G6To?=
 =?us-ascii?Q?3SbOpHvIFaz0n3HTWvUSc/hWXViq6BgLMMRqF1j0ko5maUSb0YBejFHjNZyQ?=
 =?us-ascii?Q?cUARL8vFirPBx/BLD9qjn9zChKN28Xyhcwg5Dp/881Vgb9Haz1zTZiFzvfUt?=
 =?us-ascii?Q?/FrvYVCpYaQoj5f3Dm1yp4lfGLdV9LC5c2K+kBxTE1Lnma8bIDml73xrA5To?=
 =?us-ascii?Q?jOxHwdLdWEVIK4oUYdL8K3ItMLzfqSwZcCQymOwfAfp1Aq1LULb8VR2bWdVG?=
 =?us-ascii?Q?2DgDMyVVnlszdFbOy85MLUpQlCaPnhh0kYiM7QK7RS6O6/YU6vMQu+mLm93L?=
 =?us-ascii?Q?vWDQQUV0kvXKY0NWY6U/UfjO/oQ8El3QFSJR/vdN1qO4PCZWIXXOjlhfsvh8?=
 =?us-ascii?Q?9/J1la7DV8LsLp+TZBVN8s3eW8Kho0zM+eEZhS/xEe/1DqWlzvaJVGywY158?=
 =?us-ascii?Q?h1Jjnp+FAbNq0/GGabqOBtTgIRAQQMHwaD57ig6FJ1Pu2dpXfOi8dm/peVbR?=
 =?us-ascii?Q?9MkvQC4UOaVq8EUITZSCUQ6SGlaiqwR1TBJqF/I3krJbl3tCNHj5y6ufWFiW?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zU5n/m6/hcbr8urvTloq7hdO0uyROLEca0dIieQ5PXQ/iJPn+wWFacLS7l0kdxUv5hS+RIYftFSP96f9Dr6UT+dEgDg/swMYIYPF/1jVl9h6uB0BULfuUonXL+46qtGNQb2grl/Jxx80qg/tKti6D8YrbGBbaTfw2QIGVlmH2+W/fmfUChbrmn1CkVEfxBbU4b9j8mVPpQ20hg562t7hu3Q1HjSOXSQxzcB7mIGh6JbCD7ngXmjv082Iq0v8VDmwX6WJYkOB6l0pJd2jtxmxkqDz8D/7kjUH5U/CtaW8bV+bq7zqpWk/trtepeNCLld0UQvmlNrZ5RGIB1VnE7Yv+8/bEyvO3jP3EwGraAEQQ+SzYeKnMNj1L4XzXH7HwudalVMWJ7sgiyXWKSZr3dDQKAppubCx7J8SsRf6xzjTrHzKiuwu7W7PnvBOGezoBktRW4nF9o3hrcas5Am9E05OlbdX6uBhufCks83Vhdhg4y4YiCDo88t6FKvLmlMAzlV9ukEWp/6Zxlscd0EbLMNg+SMuTtAp23fv20Y2gzqLfRX94yipWs4xNNfhOad3iVmjr9MD5if/cd5adAJjeNSpXuT5kzTRUttIQ8y3U97nge4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a95c21-e232-4a47-f9be-08ddd48c2f13
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 01:54:30.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piiJHAGxXpX9jSGTQ0kMQc3TFs1piPK5ZzJqJ8vs+eF3Q1Pny7eQ4KiJ26b/dTGqR+oenNEPfoLd7+EfAT71VJ717HAfQrvi/ogqGnCwuZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=774 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060011
X-Proofpoint-ORIG-GUID: zvijljyjOLpesTzsnHMSkS7_CuaPeAgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAxMSBTYWx0ZWRfX379EszQ7C/cJ
 tBnyleKHB21J0E4pSPV0lBTpwN5P662WBHvP88U6g17O0LwUxNZ8cTHbor7iCelSBQrBdyV981q
 PD1yh2Zt9VY7kRXKLueyPMIKgRsR79qnhpgzSvRPCiUae08sCbnWLLdrrz1tUGRUAt0K/Bw8B/A
 TKVuuINziDTlAdXdx2bVDzLgdJhq09K2dLEvMGOmAPenb5XO5AbTdlBqH4rXd73dvlJvo2CmSbt
 Qilz7YE4opj0NGnJbFFstNxJ20e4D1dpz5DJVP/h8Xk4Hc5vmATxLyk1WBViWEpyqcAaD+VJFIZ
 dc1BMT2W8Dx3XQhEHH07TiYht9o7Yvnw2cpIAK0/9ULfWrWtb3gXpJbFQWr6f//adbeF/ydYnQT
 BJ0OlQoF7xE7Me/ifrEGTJ8QxPO87wpObS1SB6rN9jOQoAHgr2UBO4weJF7l+m0W1rdzvBBI
X-Authority-Analysis: v=2.4 cv=dobbC0g4 c=1 sm=1 tr=0 ts=6892b5da cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=cewXuGIsSzsw8c2jRYwA:9 a=7jBqKnKQzRwA:10
X-Proofpoint-GUID: zvijljyjOLpesTzsnHMSkS7_CuaPeAgF


>> Commit 3c7ac40d7322 ("scsi: ufs: core: Delegate the interrupt service
>> routine to a threaded IRQ handler") introduced a regression where the
>> UFS interrupt status register (IS) was not cleared in ufshcd_intr()
>> when operating in MCQ mode. As a result, the IS register remained
>> uncleared.

Applied to 6.17/scsi-staging, thanks!

-- 
Martin K. Petersen

