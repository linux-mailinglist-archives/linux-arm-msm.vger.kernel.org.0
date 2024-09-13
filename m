Return-Path: <linux-arm-msm+bounces-31663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9279797761B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 02:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5491A286203
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 00:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A5B10F7;
	Fri, 13 Sep 2024 00:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S8wURHE9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ItPVvJwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD31373;
	Fri, 13 Sep 2024 00:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187536; cv=fail; b=QPMgYyG6vLR314kW61qcOPoDWJ7keE+P+TekVurFkimJrtBeoci8neQkebnn7tRlZYHBBmHIEo1cfDkazomqRxnLMUcx8mgeZkxvIApbT3xRejJEBKIzDNcCtkuY0H3vej6TjVF3lKTMUmxKXqxXwYpJp4MQXuu7YTKOaAijxDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187536; c=relaxed/simple;
	bh=XQc+ll6usGvea9lWEL194UcLMfPzm9rKWwjdfL+6WTo=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=c0wG0JWq6YDjUOaUWnjGcyf5+iFD7+FFsnyQ7Co1KHqBmlrQQ2oCXrjhgJ3CnEwXOrQoyjhx3NpRolhC4IOBxPZoiX6nxENIkYSUuUrrUfV7ZyoGMp8ny10tdYpP5hk0mjQYLwErXvJTiEVB6TQKChQ123QQXNDPt6sXaDAq5t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S8wURHE9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ItPVvJwA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMBbrL010076;
	Fri, 13 Sep 2024 00:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=K1Isv6fO6R+iUC
	Sxthwdwki5Fg3GM0Eu7k123LFzGhM=; b=S8wURHE9UWjYJFavOC/Rf5GGxHhlak
	/uD+s3q4S+dVkBfMfSiFl/ipq+Bc0FQNgcFyVvRZfeWLpOBAL5Aw2GPaoIp9ZjfO
	LnhQG++Ed4JrGwPnOnupYaQguEyvH4/PU1XCoAGGWHeR+XIIsx8kYTijn17+56fa
	OJ5WetZ+jCdd9XwRij6T6f44/deuEgrPSG2sD8CVY5m+aToAkdiRpKe/6xrJh6zy
	65ZBvXIuaCZHSQC0TI+g06dtIn/oHs7zRfExgntMGTbxYUjsKei90oLwznX26z6E
	bj9ofCWawnZSu6sia8v3wmF6znCswXY0CeOLjkDRxf2MRQzypL4G5EOQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdrbc85j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 00:32:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48D0ANaG033561;
	Fri, 13 Sep 2024 00:32:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9c0e45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 00:32:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wS+ZinxOFmucBzUoXxNKzhxBlKYmvPC3pAwkXDHXgfHkNqlbYCj//3GH5hTNv7YpuZLheAdG18IXP9mE3FIxWevwS4ngH0RJRm5T2BDaixNYwiMpSl9YkfboRPuXidJW2D+uqxQiZBVrJ+vpyfng9tb/qN9q4fGrGjARviemdEvPZo2wAbHpDw6CiDVlx2Uoegl8Qv9C7kHeIDxi9P6mf2Z1rGbLNdmNZJTyvawtb6E+ccLUHuGCIW4tjTXApEe/3G5TkvBPXCm3YwyovQcMeIS4C7t6CKIvt6hRIP+anOLgF/mmJ+G0Zx0hjAKpC572AgmnEIVjosvwdhGDnEvmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1Isv6fO6R+iUCSxthwdwki5Fg3GM0Eu7k123LFzGhM=;
 b=f6ci3lFyIltS1BwTChHooRjvkQZpF67NCfTV7Y3uDqSwK48BoAzrcWjXbDn81xSeY/CVONxwvycCCZDsVvqiUdVKtVRS59bLzWpNCcHB5iH7g9TwFNxeODK3I1mN8NhJMrcSYoknNif0PTOHufn70SCyzfwat+yqbQH+Odnx9SVBvS4RFl8g2VrUsxqiuPgxLnyzWxwCAXaXP4GwpKVt0fgiMjTznF3O8EwsGYAPso1GnfJP6i/OB1z3bx0znR4CWLpHq6KRBto4t5Hdptqc2ejmwpChnjfuzuAJTCmY5ZdzHwmSE/rfC9p7ClKNNbdRLhDoCDBEKcYn2PR0f9iHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1Isv6fO6R+iUCSxthwdwki5Fg3GM0Eu7k123LFzGhM=;
 b=ItPVvJwAD1Tev9trxIVCeHqR24klX081/kboKbIxecxkecJwkZF/D+sBmD5FAPHE22o3QPniImO4+FzuaXGfG/TbUWC4VoaLGtygI+AAVzvUnOCgcPcntLs34v6bRE9Wmlxa2jdpLVBTqHJmH1LZTZm355gP4SGxjvRIf+ir1Ko=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by CH3PR10MB7161.namprd10.prod.outlook.com (2603:10b6:610:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.8; Fri, 13 Sep
 2024 00:32:07 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%3]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 00:32:07 +0000
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH V6] scsi: ufs: qcom: update MODE_MAX cfg_bw value
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240903063709.4335-1-quic_mapa@quicinc.com> (Manish Pandey's
	message of "Tue, 3 Sep 2024 12:07:09 +0530")
Organization: Oracle Corporation
Message-ID: <yq1a5gcxukh.fsf@ca-mkp.ca.oracle.com>
References: <20240903063709.4335-1-quic_mapa@quicinc.com>
Date: Thu, 12 Sep 2024 20:32:05 -0400
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0008.namprd18.prod.outlook.com
 (2603:10b6:208:23c::13) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|CH3PR10MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 856231f0-85f8-40d1-a3b6-08dcd38b7f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c3c1609O8T3XQ5/WPuab5FMmVtdYWInnugy7WhhMgjE5rikO/dJ48phee5JJ?=
 =?us-ascii?Q?xIkluM3tiULbozQmrTD7/GMmT4ptCigc1p1MOq2wKbhUFmaTCuvp56iVMocU?=
 =?us-ascii?Q?jatt0qdkba1nYZNU5raT0OgXLXMFreWSNY+4nyWEF1tN5og+imevvlpvQNms?=
 =?us-ascii?Q?Qk9mmellndi8Lqf7ZQOLqCkM2jbJg/7JhMa2xVo5TI4YFl9DlHAJXtQAG1q4?=
 =?us-ascii?Q?LzVXwZlxOmEnKAn75bP71SZmsEp/d0I/HAKFwBb8cUog8GRiPBnkEyQPrve7?=
 =?us-ascii?Q?LjgKqx2qytWaJVzL5R/Uxc5gOYhuonv9+n4JJ3klDlv6fZ012Z2/2SZ8S/Gd?=
 =?us-ascii?Q?OyMk6PMz2FlWbCDUwo+ZcvQuxXP+hlQmTfT21lQ1zTmcCQ7VUUIly0MlHq4e?=
 =?us-ascii?Q?p3WFhs8maZZbJYJLFmMD37BghWrQTVjPKIJgCphqiPq4JjGDHazGEiDpmX1N?=
 =?us-ascii?Q?4/hJNaZUDSFkrkJUBjFc3FgcUtrAA43ZUAc8CJo5gttxURgIe6LUSLfd22Ta?=
 =?us-ascii?Q?IrhZr/8YQlFgZBBmwUcds9AdpRPrD68fkj8t78QeRJeVd0VdDp+/RtizFjVQ?=
 =?us-ascii?Q?AjbrJkc4GNdXCm2S76Gn9uzfD6KwB90Aif2IqoY2wio1aTlktG1iXhQv8+Q3?=
 =?us-ascii?Q?J7d90LmAAT8V4TPZoI+BmMvtUWw2Rv5VC5Ji0pUaX4egM9DSSsPyVdjcfqLz?=
 =?us-ascii?Q?vVKmJ4K7hfAoNABBVSU2xFPq0Od5UfcvLsPLFg16r4nw4oQM+eVEqThmO/bz?=
 =?us-ascii?Q?9kAfVI47dTFI1Vs2hcjRUvjMqRxaz0Lhc7o0rLVUrnmDnnpZVQ/yQQtVKSNF?=
 =?us-ascii?Q?1lk1XgqebhrwiQtE4aZfOMdbkZZwPDegniGxtcdu2KUXnYhCCVgy4+tRKCNY?=
 =?us-ascii?Q?UZV+tvpbDDK4irlZu24QCl4hhJbjbc8jOsi1W+HBVqvsQ5Sc3Itv4a9NkYdI?=
 =?us-ascii?Q?l1KinUKJ6ezJjDiHeQcV9RfMWaemNsS4E9PfhtdHMSBVopCN99+zZTRjisFA?=
 =?us-ascii?Q?7Zv/3sk8/d5gmSntS8Z9PeWWZ9hSrWHcBQ2iYlMgAuaWNMatmzV9ULHh4Fen?=
 =?us-ascii?Q?mwAmlUompNhp1Bt9jb2A3sMP7q/lBM7B18t7Z0mLipB1vT05uj5mRjqcsi+g?=
 =?us-ascii?Q?lBTrE49gSjrXnaIo7YKypjhuAUctXZMDHXY3JZrFLl1xJn9Ts7Q9AEz9G9FT?=
 =?us-ascii?Q?ZIjtbU0OiJUC8wwvtVbQIcEOL+iBguPoTlzR28M7tMvtRF7x+5XK/P73dAb2?=
 =?us-ascii?Q?lW4pTreRnH4u/ZLs9dpxCaTSb5sEa2WF+JL3Rln7rstpmu/7VAEj7yahQUJW?=
 =?us-ascii?Q?UGTqaHCHhXvUdlfi/5PjBcArdmZgg5Ug6OdbbbObTIxx7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tj1zbNO24VVT+C47L6OCVFgLQ0J7O3OdUidqnRCTf6rZ6xEejHRCRU9m8d8U?=
 =?us-ascii?Q?SoTsoS6IJHHf5fkOm3N4V0PfsdztL+v/t714zcGXAGxvaM0wKHih+On1GOlh?=
 =?us-ascii?Q?9VRiWpbTq3uWUpI+b6ZLA8kFSaDMITY2EKo0PVk897rBzgzlKcVyHf4K1vcu?=
 =?us-ascii?Q?Ul+DIK7Ge0wwfE9Opd73D2kHZXk8f4sea0VxmGkPpl1GSu6Ha7Q4WDdKm/Ip?=
 =?us-ascii?Q?8DjM/mhCahtPwTGgtcPR4/D8vHKPiY4vn8xQAVCMXmQvWh5qlvK8AxTKw2eY?=
 =?us-ascii?Q?J2GJSKKTpToQ8+TNlM69qe+YWWouRrncEU5qH0jBG4WfO78a8ADOhaj90N9j?=
 =?us-ascii?Q?UEb3SG9MTpGaHnP0DXUbJ0eV3oy/ZTXLlnUT2niTEcD5ixltUDaDs47M4nT1?=
 =?us-ascii?Q?mtXRvevUbIywYP8t3G6qSwr1yqyg+RI9HsdwOPCWJ63LdZGVEj1dd5CMNbY0?=
 =?us-ascii?Q?Zic1pccnRi0aiir38yoq4x1DTh/f8KUS39TO8+gn+uTjP5PQCEB9HlcnFber?=
 =?us-ascii?Q?maNM9uSAz8BIP3IL4kG3P/0wXJAoYiLkMzbnmienlFiIB4e4O6kX+mNgLxSR?=
 =?us-ascii?Q?PR+oJvqle3vkS5vIauKTwVAIdADIGKlwcyk4GX5IfAYNillJERLkLTTISwRO?=
 =?us-ascii?Q?TNaX2+K+2B17BM8ZLT8aYpoS3LWG9KpvaoPUuu/poj9eEe6xbKEmCzHpnb3m?=
 =?us-ascii?Q?hZEu7YhbQYLmC4zAj7qw7OPIfZzCoOyJa/0Jyiqi0yiaLgRPFSj4/bxcjx1c?=
 =?us-ascii?Q?SrTjWnfmpsoWVaIIYyWR8TWFlrK7yKgdFz7ndaWbKeYYiRhMLPUC6WQIwqJK?=
 =?us-ascii?Q?10BziFYUy1QHPBv1APnDoc+1jXM690NoyW9D/ai9QjvUhXo5otwpOsK9WGv/?=
 =?us-ascii?Q?U/vXc+YmTc9TPP1dn+W2+9N630ktNiy6CPzoemeaqtW1HQ9dQf/nL+z31L2V?=
 =?us-ascii?Q?DLcjpCEFPm4xeF224zdrSaHCbXH2UoCBD9jO9YaFCRd1oSwhDlsa+Iri4UL6?=
 =?us-ascii?Q?GFPJ9rif3wOSyjjBrYFU0lg18m2ftOkbo03izkwjMl94lFbJuDad5ek72jqv?=
 =?us-ascii?Q?WmGp8cUCK4XfWauogquLYGhhbYcyju7McNPDlQRNRrs0+Ysh5pMUmebb02Cx?=
 =?us-ascii?Q?XMB1tTEeqsfsvcrdh+2erOnY9/fi1zeYxgFJLUhk79LT1BvSAYAT3i3MeARv?=
 =?us-ascii?Q?ke78VZA6HECCxgExbCu5dRUPi7g78WDASv+cbz7K2kVtMdjVXib6zcUegK9w?=
 =?us-ascii?Q?750So/vz21ZWBzUBLBVm3EVEa/MZE7hY21ZveiA3lfc1rVXsgW0LF1B7q07e?=
 =?us-ascii?Q?D5XXnRVRcuZd3iEDovKJgUQcvRG8lD34vffFHbZv/8t7p++cmi8hXr7tz9Md?=
 =?us-ascii?Q?0ypvuhomZT2rTBwMSk04ozALjwqhFEsX3cfPdrN+CJZtwmaiq89yYNn4Ui49?=
 =?us-ascii?Q?eoNQTNRx2nio/3+i8oxIcD9SYpwNX37rKbm2vohIM4ZF9vAkmtw59wbfkOC0?=
 =?us-ascii?Q?A5nTcxCAkJa+etpRetzQtjOgzFP//+JU1rBlK/aAeSXyVs48xoS5C0nA3s/o?=
 =?us-ascii?Q?XF/bEQYBkvyBdPSXkKsGeP7R+pPjMW1CD2MAzpfrscl0Bs+D07T1dDIehpQp?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	74TGH07fGHOPLJR6bYAn2KSD+nkbIKsb/mzBasiNhs0b1d2z91bkMTxPsO16+YMeGE1M+oeVL0TFCv/TT8WUOK01GN46t7sv/cTVbHzFNY8IDDd+rM1k693LdfcIRLlkOiA5pyqrmwEluWEQN7sT3U5Q7o8/2sujRR3YaRtHyZZz4SsXvnnuq88MhfYLUsmreYFPBDNvjim47L4CU2P86m/igbChBzE8Zxw/IeKNwW+35NrD8PcRU1SumHx22GbUUxnlfV1T91K5v9j5X+4mQFCBeUJgsNUUNWKHjgFH6GG3Aq7rYPJVMkUaIJgcjtH2Uc3JZrrst8AIZkqcU56riRxN6lcbTDpAjzvvjj81sKWfw7xOrplXs5429f2McGPcvL1GszmdCSa151MO/LnrBCOXOUF4ea8btyw95MKzVKm0XuL8Occ2pvP0QMS7iiTktZjWovCcEpieGhaEJEhs4AtNUcnPbYHA6IU5Qpfw/svTysiJFudJLwXyBUlofSSo/gPol9FH3cRmdQIqo4xwHoSKsR7GiNoK3W1iUrTfFbUt1wpFkSRX47G41B55DMUxhHFGDl0kwbzU8Td6tFtcYk1h4KyI4FuZ8OOlVMlP6T8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856231f0-85f8-40d1-a3b6-08dcd38b7f6b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 00:32:07.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbgKn7Y5K9UAF78OYi1oeHG3EXCtGaCrQsu5rmOVUAWyDn769VMvLv/xYsckr0WWHEVMa450yeIVd/u0fFRW//8M9lDYo/Ij+51Z01yWAyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_10,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409130002
X-Proofpoint-ORIG-GUID: zQpEEgRX1k5i6KnnUJAxxnBv2dPYjUXE
X-Proofpoint-GUID: zQpEEgRX1k5i6KnnUJAxxnBv2dPYjUXE


Manish,

> Commit 8db8f6ce556a ("scsi: ufs: qcom: Add missing interconnect
> bandwidth values for Gear 5") updated the ufs_qcom_bw_table for Gear
> 5. However, it missed updating the cfg_bw value for the max mode.

Applied to 6.12/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

