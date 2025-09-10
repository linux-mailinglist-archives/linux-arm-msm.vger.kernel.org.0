Return-Path: <linux-arm-msm+bounces-72895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A657B50BEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 04:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21521176A1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 02:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A24233D7B;
	Wed, 10 Sep 2025 02:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YD13inTB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AUfQ/4i3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C89018E1F;
	Wed, 10 Sep 2025 02:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757472871; cv=fail; b=s+nEj7zNsVCbL26IlQEizZf/ZUMl4FYRd9x4ZD53c2y6QVbNDX+tHf4B2R7Tt0QPVo+kzE2oGbjcpE292ywryjS0nQscqgflbkepLfYzL0bnPrUYGQ0Eqr53WEZuf7yUux/f2DBxp3RwmRIg1VfZ857kZGzuZhTQtzsRyALGz00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757472871; c=relaxed/simple;
	bh=znfsX1vh2i9IWmV0bDebpee8ghkNxGkulbQlol4h9Fk=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=a5mi78W6UdRd9kRe94QKEFEv0HCpPz5fWhm8vBGkr40c/epWWUVBfKVCWT8JZqfRRdirQCJrk9npVfwJ+Du8IFg1z2QzUF6jYyGA6cy9u6s4c6hy4Ywx0POuhr5hnha0INyqN8sCVwXvUW6B/3pDLa+KGilQiY5YrVZZD4rNBYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YD13inTB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AUfQ/4i3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589L1Asc000941;
	Wed, 10 Sep 2025 02:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WvYCxKNqsXlMz+jcA2
	KELeix95qkBmdsKH4YaWcBaoQ=; b=YD13inTBG1uxOeyhwkrTn7zylJFVjD7c/R
	jpFMMYbulmdTu2x2cPjsgwNAaMFw5aqV41n5BAQkTlWGQU1KUtl1sIatH334Jogl
	56FVERYDZGkfqJcNQ+f6UGd2WMeKA5wnGXU7Z4RC4/4UwdV00xuZJ9JLqjWnl6tR
	NKD8YElz29/11imCUUTcpdaAKDzrM8Yopis+oMwxros6OBDwl5Ixu0LiBhINCkcO
	KJltFfM6YcPFt185VIBPpnwveisyZlu5PjnUoff+rP58TQWxftSqvHWoRY5mL0gb
	1EEuNxDwBve5bs2J7aWw6gzPEmHqKJmC2DJ6rVfycMo8BK98o33A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4921m2u7v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 02:54:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 589Nd82w025921;
	Wed, 10 Sep 2025 02:54:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bdaen5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 02:54:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYiaPx6CIaNXhixZtPVgVYNLUri92al5csIL3a72SsEEVCbrQNNmQONf43n/CLCs7qboH/AqqEP5xdjT9cKTCWM8YDA28uk9hjGLCKGcSwCDAy4VCunBMVmVwiAhZHvhaOmlsCfVMXB3WYRUgx71o8AWoKoBCX7bHc1JEPh7ltTDDGCbsMVoITWuxfo7BF1xCmsBxWL+1vV49Ajyb1oiVJsDASfD5k7W2J4gqlvHhsQGe4OrwjBfem6oRMhn5Xnv4BpYvbMctVX7O+LXk7Qh78ockbYLvKx2HBcacqYxaXGARimQvU1Mpw5TiI9w3cHgv7zv9CFGw1HqLoi/zgRFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvYCxKNqsXlMz+jcA2KELeix95qkBmdsKH4YaWcBaoQ=;
 b=hl0ZWaOX+0/VaoBzXr5u6Y68jvX1WsG7FJSIdf0KTJnr6DpaImk148PvNZNzf0GbaK5gpWlOtgcB3c8wLC0qyP3tXoZv897cHY+xa+DJbehXNm/oWeTEIJd2b27FhRZgGU+r/6ob741DtgGE0w3BKo41cb/UZGvpvVUROqVFPoo6ON65rshFkvwRIeon0IGif4P1wij5xArZseVuCp+H8gD3ie5PThNr7WgSiVgGmi+t5mhQNEVJVUi/IIb0Hh3Bzb+Kya/FM40+3EVfxE+9FPvQDf00C64h9HjULm2LGAqOlBbBcWCOlzg9To98wCqqkSmSgf/bD4+VxWaaX/mU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvYCxKNqsXlMz+jcA2KELeix95qkBmdsKH4YaWcBaoQ=;
 b=AUfQ/4i3d5PsgDkBIMrP9pkfcyW4lk43U2zSHVq3tbW5ZH6OV33P5OLpzXG1M7v2clzrgUk8Wm7rJj89WRMsXC9nuSJ/ov6juyKsksoAqkR7ExuBbj6EWPZPsVxd+JV2KjMO38byJLUZyv0BU4V0m9c1bExAQ0IrB/YRn+KFRME=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by IA3PR10MB8275.namprd10.prod.outlook.com (2603:10b6:208:577::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 10 Sep
 2025 02:54:15 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:54:15 +0000
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 0/2] Simplify MCQ resource mapping
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com> (Nitin
	Rawat's message of "Wed, 3 Sep 2025 13:18:13 +0530")
Organization: Oracle Corporation
Message-ID: <yq1zfb33tmd.fsf@ca-mkp.ca.oracle.com>
References: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 22:54:13 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0340.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::17) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|IA3PR10MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 454f5042-7060-4349-68ee-08ddf0155406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2AmKkOnsmHcW5GuqcICH2K30utu9Sa0lteWfcFxGM94GltxymD0N7TmJEUuo?=
 =?us-ascii?Q?7q79rwXUm7Y5E7PB7tCKsG3l3DAh4XPOgbEcCCImIuMVXDVzGimqIjhUrr0H?=
 =?us-ascii?Q?JUkI980+6aYjZLWJ2L/feYtF/gYb4/FDC/heeaVsPCrf+ox9Ji5VKaq3xEE5?=
 =?us-ascii?Q?Ma/bYnCoLTdPc5vRc3ULgrq76q/idVALcTWc1Rp7DDeB099QZDlDnnlflUFX?=
 =?us-ascii?Q?Fs22igX5yXkDUg1pEe7PkLLs1ehjDQOnKx6sokEPc14fStx7WpwoWC8yqTln?=
 =?us-ascii?Q?aNVFuEP0qHilreiuwoov8XTj5uTRFU4oMorGdQ5UDMvEKJC3Gud33HX6mVlG?=
 =?us-ascii?Q?OnDghVjl1xND8k4JYzKNDpKqEbwe9UWnY64nskP0/3i9Gf61vGiRqryklKIr?=
 =?us-ascii?Q?yIRjVtBQCGCzeS1fUxTsFhBsWyZRjudYPu758N72W7coqd/uOrnE3MdS1/8x?=
 =?us-ascii?Q?s9x7HwV7wMjeEQpq+FzUpil+NUirK8LDVDS9axz1WcLPwmQ1FUCKEDiDrnMS?=
 =?us-ascii?Q?U6Ujebf/s36kf5f6XvdZgT1iojsvtkuoCySsgqjuTDlAuA7r/5IAoeqPfYz9?=
 =?us-ascii?Q?oNYdAgr0/IM97+Q0c23jxBCQyisdLyb4J+UkV6Gub3dKwZbt2gpLoHhO5Z1U?=
 =?us-ascii?Q?ziVTAlr17SCXaEuAyN4WCvGeHAul7pU9PoHlf9FelQBnWxbx4eAv+GwJbpmj?=
 =?us-ascii?Q?dELIFoFMa4hv/+h+/Fv51Xq6dIeAD29UgI7/Rw0gY4dLzoGnfc7xc81I+0b4?=
 =?us-ascii?Q?BEkae4S2PfVsLkS5SHmoegy2rkMMSuJ6D7ouEyeitaet0GRlL73YOHKSDC+n?=
 =?us-ascii?Q?70B1DxesBPP9hCs1L5y7x5bti1VbS9JmKXya/09Q4gEjMjsAOEDA2wqdUSPl?=
 =?us-ascii?Q?fn5ww7IeAWMpcSgSYUTprT/GV1ky72IEU/IbByMJ3KbW37x71oIa3vdorhgo?=
 =?us-ascii?Q?f5HYHWiRX8H87FH/9lkH/4U79Xet5AJGxFIxNZ/XIgri4W9gRKGlBf8/76kp?=
 =?us-ascii?Q?V9kdwwBqBiVySJqY+1xyqBjRipJpK6/Oeb/1lRn1GDycG0QbTfNf7cM+xFmM?=
 =?us-ascii?Q?iKj6ys47vz6EJzUEUv/0KdG69KcWmGVFwlY3K/PIKSoEV2gAjReeGpFiB9Ab?=
 =?us-ascii?Q?SwBYsDHHkWiIJH+Yv6LObCKjgvrS81DbajohWbxOBcp1V6p9oFACleATkA6h?=
 =?us-ascii?Q?XyhoHWutFncZYWybmKU0GBiOM0UTVM0pQ3v1FA2B/seSYFoz8ok+YlTffRop?=
 =?us-ascii?Q?04YNfP4b7aaUhegopg1f1LZCRCWAgBE6tTlw+fuPdB+MT0qtn0sCwMBy8jKK?=
 =?us-ascii?Q?kBTw+QviQ7p+hr/3D+4pK6Q1yLFTR1XpEBsidaC+1LFT7IzkyeNmnI1kejDI?=
 =?us-ascii?Q?fwgFj2x9xPpMvraSR4RcUoDSZitz+ebJya9cdbrtwQKxponlIH8TcYOxUJOM?=
 =?us-ascii?Q?mcd65Q+UNrc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f/WT0qPIgR2iXIJRd0grE6SlWoB1cXQ8Gn0Qzprtr7Q5qlfvdqlkT1CXzw4v?=
 =?us-ascii?Q?Kx+Oo9wyQNeK+yHL5Jo3lQZ3QEhH3iL9YgLDODyvBpC9gMqg8oV0U1YfZOTx?=
 =?us-ascii?Q?QugRdqlnoQ5NjTYLI/ubx1vPhfGiWgBblAGTFwb3zlriNP4II1lQVNoWjtnE?=
 =?us-ascii?Q?bPyimOSRIsaXq5bcZL1X1iAsq9LjhhgJsbl6HGCrEGf7XKFGSvVrAdgn8jj3?=
 =?us-ascii?Q?WvRL2ZHQYL7S6kRUKFlPlEiNIYdUQ6n1bfo/LPw58clpnPcSdSa4utL4GFv+?=
 =?us-ascii?Q?o+OIHLyQ9Fms6CP0Z7FvPg8dprdXekmRZqutfe484MJHqjEx2PSniGJslyn/?=
 =?us-ascii?Q?tZaulzSzkVipezpucg9ssnwOGf2aYrwqnaWKCO8/R37okOWNQCOiURhhz9LV?=
 =?us-ascii?Q?5733WBLOWgr29N8vpBBEsEGLjiEAJ3xpawgnbGoFEp+8bOUerq0JPknfVYmn?=
 =?us-ascii?Q?K4giwSnIegkkguInGQzQ4G0n77DVEwK1UcVunzthOUJNed/oK/90hpZ8I4s2?=
 =?us-ascii?Q?NkRbPssgo0PdBrf1TLRAaISjR0BfXq7rPhTzj9ZTKCGyoCQWneiqXSt1gWQF?=
 =?us-ascii?Q?kYitolfekButfsKqmm83xyacWDrSgIqTobQ0fs9U7xDl31a/TV0UeAwjeFwk?=
 =?us-ascii?Q?Z6pjMgxp2S3DdNyNsL2DCiGJrB5aPiBHCpp5pQ15sdnF9siOoQZzun8cUo+u?=
 =?us-ascii?Q?BRDD7CD3Eck3TNWuwWQnOth8DliYyUaQcJBhH7lAOpimof/JqIWImJepdDOh?=
 =?us-ascii?Q?+wp++cj7IX6NqNe2b0YgvQ8F6/5Gy98UtQGG2/e8IuGLIHNiyBtes8IIHR6r?=
 =?us-ascii?Q?9f4H7WFeiwucwLAJDv9UW/P3OjDoad75rDQoAbBj+sVJiGu4VtmzHND7OWyM?=
 =?us-ascii?Q?mqOej9E4/QLbj+HkYMULJXG0IIAJXCsz+n6AuXfBiy8Vc01s37yGtiqtbiHn?=
 =?us-ascii?Q?iT7ycYbstUFKqD/Q2NMwLHFNTAZ3mKGLeOYxk5AC3ofIwbIwFNN+aFPGKQbv?=
 =?us-ascii?Q?L7R6l/8gKhlNzCnARpx4QOCGFvVExSpljSrhY5NNdxzv1wiTFKicDeXABYmj?=
 =?us-ascii?Q?iEfC0YRecMy7sWqGs6rQDdEXoI8Ao9T89rL9tjrZ4y+XUMQFv2/b4yC/WhG9?=
 =?us-ascii?Q?WlNo1M9m7Pfk9fp0lr2u+ntcyXYmWf4B9yjONAUJEL7zoG0ceF4KXyuW+H0d?=
 =?us-ascii?Q?fLYplFOgbeJeY3eJjfkci4VKqmeAnqPZr+wxKpvSiz+dW4JA7WXLtes2sKHm?=
 =?us-ascii?Q?ru+0HwKKQ/59+Am1kyFRkdhqnB410rafhEdo+RAsmWP/19sOma8Q3JvIp2bo?=
 =?us-ascii?Q?dOpUEWNN6bECaykK/T4loPo53NnSIxORisIjLnRhsGMJFpR1gvHcU4a7SPau?=
 =?us-ascii?Q?yKAlZRgMon0Oczaj8AE3qw/YUmH8heJkZZKKI1mQtfKaZb43UPe4m+l2ZlN0?=
 =?us-ascii?Q?/FQeFelmEVm4q1UJ6wTyowvYX3e9k3N/Kb9T1mOK8k7ycRtXDGbSI3C7D9jp?=
 =?us-ascii?Q?LU+JWWhjicbahSG7XBd9QMvtrpt9JJ11zkgpBdqYL1tr+XKfZYZ3c+1Y5f+L?=
 =?us-ascii?Q?qrUYfnbiUUE3np0Jf2Db30OfZqEIp0OUKrWGZ1DPuJq2fnK+dNcZV9ctvoMb?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VegoINGv4F8TNh1yo9speOe3X+94IqZ4FGqLufapsozQcBmZpFAUwaycx1Nd2oTWwbRi7I0un8xuG7zEGVzYPiBSj/bVRKPkNhd45/rjI8UyEjWHpPeFeP6htMuC5VGggK6oe44Z0/EyacsS0TYUHQLoAyGepfa3Vy6JNexIDM235EwVPakfCwNy1ThiviFUnFKhgdQ6fFLQE7TdHVMB6MEUm50i/pBzHDfw1B/EWGU5gQwUt6WV8RHSZfCBvKnCJLfbJJOQhxUtYwPImJHmu0zdy8yeNxXNiva7Clmv6jTFYJrvRgPAL7Tnd8UmC7bzlFO6eqvQ+crRUQqGZSVYqSGhvwiqBXWmCPD4dztQCJNKEL6ASY9gI4EoofkiizRFUW/unkpUrwSf19YKcI87UxJ76Iw1m9bJ9FK+JBoEVRPNihqQGLtouNTUN1ZAo3dPL6/qGgfZyk6O+z7xOJvTMnjIB6i16gL9sKvWnN7zEeDghxemQaRWc2p+gokMHSRPGPot82ieC3Kz4OvMKXoAnRFIFBsauc7oxM4uTL0VS44y6zrK/cES4ThWRJCe1UKC1RAlmOsJai8C/ICx5k+1wK0xdGOQRAbGwF4ar9bf0Bg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454f5042-7060-4349-68ee-08ddf0155406
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:54:15.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2I0dPQvGEfKWsit3JeSdEUwIEdktc5sX7zoNnJrwiZwr+CWUEwn4Qo+Ive5bcpVCZET6ZSkd6hCMltRqEdbApin7WBP5UFkn2oxhvbnMW2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=683
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509100023
X-Proofpoint-GUID: GpnSKWAs_KhdAKtqzIea4yAAKkBj1zaM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1MSBTYWx0ZWRfX4wZdCR+8I86p
 mJXWjvLwPQExSm3eNHzBaNh91fN91RgHCWioUvMQQxuFUtsFvycswIXaAFX1c2G3Xwv1G71Vjdf
 HxbROfewxXaaR2f8H6cyxQItAjUWHnStRuIqW5lIPWKlfd2Ir0CTHsLuuuZ6pf/7iVeOIRxo1Q3
 qDFVAyVB4dwBDXZaHJp7iuu5cpKrxwtw7h0kE4KumwOCcq5FdFDWt7ELAuVI148pj1um2sewvo4
 uZ9R/i07rwhAyAzUBsmJbnkSXjVWvLbhpZ4/kfQwOu+oZ5MzXQuq7juTKc04Td8QfsdqackMljS
 MM65GcoVN+0CJ+5hfFzEsoXF7TByVII+CsE7xDiZnMHb9bn+LQrClGnKYusrI4Ztps6+1YCw7qT
 UltLL/D9V3oVMdbT23fVzpQsQV5SRw==
X-Authority-Analysis: v=2.4 cv=Dp5W+H/+ c=1 sm=1 tr=0 ts=68c0e860 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=CEIZDvEd9kZ5D99qYfAA:9 cc=ntf awl=host:13614
X-Proofpoint-ORIG-GUID: GpnSKWAs_KhdAKtqzIea4yAAKkBj1zaM


Nitin,

> The patch series simplifies the UFS MCQ (Multi Circular Queue)
> resource mapping in the Qualcomm UFS host controller driver by
> replacing the complex multi-resource approach with a streamlined
> single-resource implementation.

Applied to 6.18/scsi-staging, thanks!

-- 
Martin K. Petersen

