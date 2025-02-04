Return-Path: <linux-arm-msm+bounces-46838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F47A26A84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 04:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C961C3A829F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 03:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA2C1531C0;
	Tue,  4 Feb 2025 03:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yh2bA+e6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="escmLWFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27101509BD;
	Tue,  4 Feb 2025 03:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638330; cv=fail; b=WRL4+g/+w1IfUXqYZbS3FqVl1rB7CnwvyV1sUhPSUp5+lZl+KmF1U7BbtZg7sToCP8Vvw1dfu7NxKDDrhpw3cJae1VL0vWYV9BpkP01e6FwZsB/5fjMtybfRukGAHFfCNp8gL6WNmMrT4R7YctiZCi7R50NrF3d+GmQbbsz2uKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638330; c=relaxed/simple;
	bh=ziUB4VZxCaeA4UM0SSUYnYq/6tKQdq4qJNXRgXh9eMo=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=BM6Khg7dwSBjA2gYuDUud3gO66223esA7tV826vuctCHI2X5wvPskN4m3YiEy+OsszYyRqGa5glgfQtCe2fRjuAuKTAxo0j5tZAc5YQDg2PT0box00lrXUKRxAB3NcYrDaR754+4x/QLfUHGoSJitSLNbcXeE5tHpzohJs/2gPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yh2bA+e6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=escmLWFr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141Ms5L008602;
	Tue, 4 Feb 2025 03:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=S2YfC5OImo9OMuhWZ3
	+5Yc/djs7wXP5KT8tB+OHB538=; b=Yh2bA+e6nkh92Sv2MLznaDFIvbJ4u9L8PJ
	lfjuOL+3MGaMBW+McMvpZN7bbpCwZfjReuJfWG8m87sCjefkHYRmFoEJK+EnPNhV
	ZzEhB1YQHe2tAyg4NxfIwwNFJtbJY24iaDzOgNQUQ8Pomt6eQZjVzNM/l4YCiaHJ
	QykoFN/O/g36d2os9x+36/5TdUaQ3jJle36QjiiV2XE8WJtXfQo4IcQc6LdJbaPP
	jIE06EeyymEtTurnv8tt68fPSWumHEkqnAgI5I1+RjqTV94RUQUFiqjwSa282ngi
	7OTlIe4vgdNO+pwRJN33sXx5nRr+hISKbYRsII583quBQpRQFyVQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjtux9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 03:04:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5140NgR2036473;
	Tue, 4 Feb 2025 03:04:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fknst0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 03:04:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqQqcPNChO6HC14A9cCy+xTB5yYLY7HXoolA0Xw85Xa8h3FKn4JhdHF1cSBamVvYPwe4dO/x1LuvRRb5gAPgl64laLXx8pZN2EW5EZoFOBc5lPbOPHnBL6p3VzQkTl1qu3tIypi0DfTIMh8bPR4U0YpRLwBcFDYBxDDGjfiIbFHYOwRot9R6ADLOtJq1ER+MmDpLJHSGjf8IWu9UQJchM3qi0L/M2w8uTTKs+7pg+uilv/obZgd3y6/Y9jSwx2aU0t/LZIMuGgl8jTgidOv2t7+OoFmdmzpWGkHviAbFM37sBOoRTN/oKw5nLZv0Vh3e/2e4I8uvn/qzA+rqq+wIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2YfC5OImo9OMuhWZ3+5Yc/djs7wXP5KT8tB+OHB538=;
 b=zNcJU5HIM4yIUEFGhvMeHuVI740qcdVt+sm79AzXd2GKyrjIjhYaM16csP1CBZaLoB1SozPFBxigBdgYI6yrvkvJs8Sj2iv7sAwCo+xVKgItroHHRlxSU/3TZHcZkTfGsEg8ET4CNwE6jsU86WRijOFHI2amUygVmPzwwffkMB+VZTUjR1znYrYO4bKDmfvxPqz0uCUYw9YoD8Bj6x6kGe11sQEMPY80StJ06SUQFRflhIiEDtvEO2ocTycOozeNEWJGJ24bGMAzIE145jXpoBP0NZ4zbqx0t96DixTjmdccGjnN01Je9x4tzhUBAZ7/AP2LGmGmlCWEMjnizSVRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2YfC5OImo9OMuhWZ3+5Yc/djs7wXP5KT8tB+OHB538=;
 b=escmLWFryshdBAMw9Kn+PBmUKI/WgmBnh/hkB/aRJxBp05+ihmwOOkZ6q8aZ3LTq2OhySlqwC198d8x8fUi1zcL0SGw9x4F3lA7QoXaWrPLI+GkkPKTc9J/Km47rJseWIJ7A/9Pf9aXFFn1F6uf3nMToynS7fiai3QGKAOAGDHc=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SJ0PR10MB4670.namprd10.prod.outlook.com (2603:10b6:a03:2dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 03:04:15 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 03:04:15 +0000
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>, <bvanassche@acm.org>, <ebiggers@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
 <quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V12] scsi: ufs: qcom: Enable UFS Shared ICE Feature
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250203112739.11425-1-quic_rdwivedi@quicinc.com> (Ram Kumar
	Dwivedi's message of "Mon, 3 Feb 2025 16:57:39 +0530")
Organization: Oracle Corporation
Message-ID: <yq1h65afm1o.fsf@ca-mkp.ca.oracle.com>
References: <20250203112739.11425-1-quic_rdwivedi@quicinc.com>
Date: Mon, 03 Feb 2025 22:04:12 -0500
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SJ0PR10MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e3720a-1bb9-4961-89a6-08dd44c89b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9oas9viMNa6uCyP/0iY9iZNzj/LrrELGmQY38wJrPZTGHW5KwWj4fG+4Sk/7?=
 =?us-ascii?Q?Ak5y3g49VIXT9bKvHkbTh3f0rc+OxRqadmvgw2bSHgGqQ3L42bnPAs8ejINh?=
 =?us-ascii?Q?+VU7G9S+fOQ2nY/F7GV+5RnR2oX3BVVdvnd657zIt7psxcWxBqy/ZwHCk1so?=
 =?us-ascii?Q?0G4SRzs2W4VbWZueehqBazXdjDNjVek2YtPJw0h/y0WU7xlvnM9YSuhuhoJZ?=
 =?us-ascii?Q?eNsR4xVaHnUCVRCYAdy9rqXCSGoDawEM5v1gfH6uzAPzi+i7ZT2iteQ93NmV?=
 =?us-ascii?Q?dti6s4Lr7/cJO7TCXahnM7FMFpME2XaDLcPaxjxqo89aP1P86BGlFLzTxfc2?=
 =?us-ascii?Q?RD5TYNkOoix8Q1IWgXe8uIELpaB7PFNz2W3cTFLIb4N8Rit72k/Xlc72WSGl?=
 =?us-ascii?Q?EmW7OAY4xAupnsTjF/MY/9w3eLE9itX6qFZOmoUWciVJpQnXNzHiDkD4ve8H?=
 =?us-ascii?Q?KHNO927M8dHQQmIWSUQcdRUYCZ2n3N7J6QMkDBg3Elh/w2rdlgh8lazqDPxs?=
 =?us-ascii?Q?BRGTVTkiNMngEBUVocPJAey95mW0KoWiOnEVveQdS0skGZh+Ox2QlvTnC4Ul?=
 =?us-ascii?Q?9pKKU8tXrg6eeAIYaqzL+5l/JTrvjSuYvJdt13Jga9ibJHHO6IqMRLzWoUUb?=
 =?us-ascii?Q?U1fjxaAKo6fs7wXQlR6Ebmx+hVGqnhkvUd4zsyetASmw7XMT1dfBM/kew6y+?=
 =?us-ascii?Q?JEgqOqM+dlhBA5fCmIj0BCjfv3HsjGDEVhmfVm8dmx/R+sofOXKk22tL7Opf?=
 =?us-ascii?Q?PgzE15h8nWiKDPJcJO6HWUemACC2B9VV07eZzfshkgOx5u+cEKvokEbTLfXi?=
 =?us-ascii?Q?o24kL8TRaS+dBef5fgteDbD1DsE6g0FRkS+vrlmKKy7QqYE2PR6vAk7o5ixP?=
 =?us-ascii?Q?lDgBMXX2FSMLJpTS0b1mxrqWK6zDsDC2c/ES6HAjk6/vDGOu7ZdmUvDctZXj?=
 =?us-ascii?Q?gmms4KROihiMlMuv/VWMHUBvwsx5YJLtM3JrWU+7eFp8+9B43cW5Wy/l9Z9M?=
 =?us-ascii?Q?VtOITxyhBKFSOTAjPMeGC+5x7pCH/yB4LaIBXdKhbtlhcr1KirImd8H4Ee27?=
 =?us-ascii?Q?ZP9qg+kwxP0Yspij1kdctm0fVVjHQVtzik387FWbKJ5n6FAtW0X/cLXMstnA?=
 =?us-ascii?Q?aoPjO19sEKnIr2xcbSh+NPyG8bEQzBKaHV/vJDhy+Kzovt1eug4nWXE8RMZn?=
 =?us-ascii?Q?kn6rBDqXDtLu8Ocdr5DcPIxdl+1Jh/LZbE8jksnbe25Ke62Y0w0c55t27sqm?=
 =?us-ascii?Q?kk5Iwa0fNJyIwB9A5jA6SG25kDKVpN6J1seth4enKbTGzKwIC6u8CsJVIfl8?=
 =?us-ascii?Q?WpYY1bPYIP525XJ4Qfokz0vQb9X9ix19Wi1DaNoXYLrV1chg/PilrLYaIx2K?=
 =?us-ascii?Q?rxX64g43RIRZRyY34O5C0/K8B7NZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sqOZkZjUriWM3mij4pdcvXY2BSE1dWBYMVxq8MauZMKCQq1pHAK6rOkJKgW1?=
 =?us-ascii?Q?EXjzlb7mdP2XpsUuCLcxfu+r9U/F9WYdvfHvDpWqVPrDQAWMnMFOq83IEwFO?=
 =?us-ascii?Q?P/H0bE6CpsO1P0uOd1Wn8qf1BRBLeYOQ958CGprS5br9CW/uHsgTrFjN3KOS?=
 =?us-ascii?Q?OK7ymFAd4O/gxa0tOitpqdb8ixx8v4w+LnAHyyg/F8cDovsgkRTJpVg80nz6?=
 =?us-ascii?Q?tw9R+i0mCNakM8H+yoGSI9WeWnVh7H2m6HJazeS045EKNI+svtDS00i64nK+?=
 =?us-ascii?Q?1IiBfp3S4MJuQdHIHnBME4DHBzlx5W6VF7WWe4wyRllTJgVbK9TxOKMBGWwD?=
 =?us-ascii?Q?RX9/Xkdc7VImiMmK3K8wkYj6TaOyWFeYo28SoZ11v7GKgNmSdBbchwvYU1E9?=
 =?us-ascii?Q?sQBaTvTL19pFuSsUh9R/mObsoQhaz3Pq5OE/YDbrEktGGVHVNX8haLVKXqjh?=
 =?us-ascii?Q?jgTiFVJ1cyHaSgdp7oNWleC1NShOfyjaO4JrOI0D4Lyw+xscUPEp2p3PPAVU?=
 =?us-ascii?Q?oUe1YR0h2Dj916tHDBEPTp94xPv7gY4kY6v5dT01SPGcGhi2HXCQvmo6q5Pc?=
 =?us-ascii?Q?Sx3qwXeg4x0vfWnSfl/VcWavcEgy93+JdJag+z6oAOzkWPhzvtfmlmpJ0Q7Q?=
 =?us-ascii?Q?mrl8NHjx8ydTMjr/CP+QutE0XQ5Ef/6XMr3gl8aOpSksErqaqM6Utxv1O+di?=
 =?us-ascii?Q?4GIdDaf/Xux/x1uUO34MPFyLjOHr3cNaLH4/VLFsDZ4oxNjTjOEzYZtk/LG9?=
 =?us-ascii?Q?tg3mi/W0RTD0fJo6RFLvIfM3PN+Px5KnNlZHK+fALm8HTty8MTvaDgFwtcJz?=
 =?us-ascii?Q?AKtMjwjCw+Z0PTj2TUmxh6+hEWIUS6t2I48rlicjJ+a9T23zKn76QYFHvlGg?=
 =?us-ascii?Q?qC47z8LG31ZS5O0HGaWIa6PASylDHpt9uI7H12yUAcSJY2s/CRKFSJ+eBe+V?=
 =?us-ascii?Q?vwloonpXyPZNORqI8QZme1vBRv5k6fT3CIG8QNZvRWj8EAgmTWHjmMLPrJzU?=
 =?us-ascii?Q?6OxWNnjbkmgZAxZKs9AX7FV806vJMElsX5jaWGMl25Uim6c/P05EjsZhPYj4?=
 =?us-ascii?Q?nJzV+1Ai3em1VnW9J9A3XcdbrLMD7H+NGKQV2GeVyYzGRWEj/eip/bG/kDKr?=
 =?us-ascii?Q?K1zGScDqf743VdSiKM+D7AWFc8PPL7gppMiKL6aabEeCJEU0Tj8X08rzW90h?=
 =?us-ascii?Q?yF+pcZHsnf/iGQmzeoUPWIbYWjn8gKlV17uUxtNtihacvHNgtOfBdZ/Jpmks?=
 =?us-ascii?Q?kTzhKQ2hqn/e5sipC6eyna5dCtT4t2nDu/mqEyLdYRvlRvGkTJ7zOGW6h3YP?=
 =?us-ascii?Q?uFAgY5JWw1CqlOK20+qfoTQsOm8jH30Ud/KH1CmoCMLtYfxKUZkm9q+npwgX?=
 =?us-ascii?Q?YT+NT6cWu2oIf63Mbr6bDc5QrpXpFUsJnPmuy+EKbFKNwdwjC4XXxwTcVFMM?=
 =?us-ascii?Q?kxU/R3+zfWgHSi5Vov7vbV0qs0werk2jLehO5r1tO+XQtK4KShQWTJRLtSK0?=
 =?us-ascii?Q?AOkvZtrpVr4uAqrsa/zp1yD0Zg+pjflHir+IQK3mkhD3a+/jMU3HtW/VGZCQ?=
 =?us-ascii?Q?7JGAyKruhN7ocmol2co5csmE9Hi6BLuugVf2UHD/fFdFDVhfSDv8FEsmdeNj?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z/rQ/xcC/5wK0Lfw9rv85AYu4mf25fXcLni/xKKZ+5yLYKu+kml2VuuCXIZ5jvoybYtnFKEG/mA/HxLC7dU/c0PXumlJU1PfYEjGDBEKMfZgInDrCHklt72CV91Q8ZZBzCJoLgv+xMqn+z2gr2+brMgL6nc8l3IYt48buKyvUtumeXUwH+OYnuqz/ygmL7pCeoAxSgsj6+apIXpk+twQApzYeuDi/yTHjAYAz+vfXoanazRWNeEQUg87FtRoTlpb1nX0bxYwbiOjWRWUCG4HiEeXJXGbQK6dqgxc3Jz17GaWoyv8BHXPgBT+ItKlurhBtuDRfcQ82oZOY8HANczigvXYt2pwDUxQ2Lo8GdF+dTWu9AIngAEnQ6KCV4rgdlcWRIsTNTY8hW8Fcqf8eXFkrFHFWuwJuTojT/S+OtALQO5X+TnNzB741QbpodR3uw8AugRbVlQjM9Rouo1fWwvAbY7dN9llKTzePRf/JFPT3g8dTAN1wz3iVG00acphy7QAX7Q5/4kbEM5X4CU6LhZUQvzY+M7KiOhdxhvOl3PKIaQSVG+6AdPLPYo7WNdauocMBc4WT2n/xrrjvNhU1Ss9uEN9ORwWdhEL/cgIHjgci+U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e3720a-1bb9-4961-89a6-08dd44c89b70
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 03:04:14.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/nnIfaV8ejwGYPGguF8p/KTj3I62JzrQ/nMO+yRBQ5uO0RmV8jM/J4X+bXOTrtEcsA+eTg5IDgUdWemzB276Lcv60Xf8OktIUX0E1jVqF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4670
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=903 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040022
X-Proofpoint-GUID: zmIZKmGaKzesYO0KiWsk7mcWnyEhFJdF
X-Proofpoint-ORIG-GUID: zmIZKmGaKzesYO0KiWsk7mcWnyEhFJdF


Ram,

> By default, the UFS controller allocates a fixed number of RX and TX
> engines statically. Consequently, when UFS reads are in progress, the
> TX ICE engines remain idle, and vice versa. This leads to inefficient
> utilization of RX and TX engines.

Applied to 6.15/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

