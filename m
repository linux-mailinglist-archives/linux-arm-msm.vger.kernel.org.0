Return-Path: <linux-arm-msm+bounces-64851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796CB04679
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C34F1A60F97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4621C2652B6;
	Mon, 14 Jul 2025 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jREPKz6b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="azJT5/4f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67791D5CE5;
	Mon, 14 Jul 2025 17:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513942; cv=fail; b=dgYLLhS45lHCBef6wobTEk+TFVIIDm1YK7IvB0KxSsyhewYVbYMPetsDzdmywq63uM9lBowKW2+S+7tDzj8h7MpaKZpstGPR3ENUR8zhz1ka8nMUqXlQma6ioJ/0+WLeMuE/hGk+hDIOKklhpU647+8CUh4jlkICsvn+Xz8dEwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513942; c=relaxed/simple;
	bh=1E/Bvq22JRfuHOrMGZM44lBkDZ5AuCaLfXW5FMp6spA=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=afIPgiNSOWrdycKO6dIhXBGeRRAwjED3pIIxtFmBaNXatPQRN52sghMvnfaMCMN2uBgf4RWvMBFtrazAbrTEud6KMwJvD7OpGzRIX4oMJck5LOKjxBXVk0CmNQrP5A1anHLfd5sfR1bWRYVDe6aLWIVhnYGoGhhg50LiethOh08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jREPKz6b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=azJT5/4f; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGWLJN001302;
	Mon, 14 Jul 2025 17:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qmq9nnBlKxmSG4lAak
	+R7uaiw/6qRxuqA6XIw55bJCs=; b=jREPKz6bSInrvxiVGWkLfDvKM5nUooF3gD
	buGNbT8H2Z+ScRLk1lvmAbi0lnPpoWKC+Ubsn5z4T5o9lfp4e5phT3hRcZly+/Ap
	fqLXwwOtQW2ufWoudGqAQQ6HVQJWcG6WpNYkc4RRufGIH5k/E7tkk/f+Obb/8llg
	K340aaxBydCY3C+mj4bPXhMkiK0e5WVTW301RuK2M3jW7QF/vpTq4S7BF/8YtyV8
	Bh0DqG0NdgN4hoNuRziBMtaxx5SdRn+MTl4wjaKE0Gqyc5vY3QycKcgVJFgyB9E+
	BoZr6Kc0LHt/GABgav5FjFZxi3GD05P77u21HXAN5EeSHXiebDdQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8fvrqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Jul 2025 17:25:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGL219030415;
	Mon, 14 Jul 2025 17:25:29 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue58ttgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Jul 2025 17:25:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFIzmhJzz1QcKrQlSKP3V6klKLWtFOgomy0HJJ7HXMyx6myEZRvAc4sxMK28xNlwDpO4R2idZXrsndCGDxOhW7LVOxFk3niXbsna50WkBY6PAi6D3C+pbMOa7h9nQtDjDCId1He5TmuY9iM+FBjqmn5KpR25yWgkubu1n/IyWs/LkEuuU9lBKzXifA5s9r5gQQc5ytyHLoeE7xOdiMQmzzk2sVSIxXlMTWkCP8mPbDZg+d7oi8HJH5H/eWGN0zR7IJvcvVSo7QvfBos3OamrUBAv1u8UNg+SmJKSZ/xMx/db11oe9uGwhKxYSRo1O/dOuEBzPr4ie3lDeFc4KZG6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmq9nnBlKxmSG4lAak+R7uaiw/6qRxuqA6XIw55bJCs=;
 b=i7bblv/lf9oErHedz3n5HvrnuY7AYRsaABxT66TsOXqvohzPIqihxd4JUuLsYJVly35ycUi9v3YwB3TkqOPqVwC2MZ2xTZKidXZhWVqlHLCoc3B2c6GfQgvjEI1W5esy5i/rYSJaPPKXcdrfo+N65dn59WKvCC7j9KynkwL4aP5+dycYzoESmYMFnj5gBQT2fVm+F2r55xARlIgSYT0Gq+GetS33x2Pkxkj6jDxRDVNfnlop6pjRQLgrJ6sKVk800RfOHIIIPEVdIv7GJxlK0Taspjabq4Q0VMzsqlm5gank9n71ai1OWAWqx2v2B2IC6TXrEeL9x1KN5uWh/BtLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmq9nnBlKxmSG4lAak+R7uaiw/6qRxuqA6XIw55bJCs=;
 b=azJT5/4fVPy9od6rLx0onM+DAElXBSNYLVa/w8sQRQgB63OztdDGi1PjTJ4hy6XWUlz5Vdt5cNNlzBLfYOHrQgAcz83PjHCjhrST0xM7tfbNf5yc69FZ45+0S3WddowZJnXYmoN8EfP0QuhjMrv0dKT15zYCgbk/maFyWi8oJ1E=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DS7PR10MB4880.namprd10.prod.outlook.com (2603:10b6:5:3ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 17:25:21 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 17:25:21 +0000
To: Bart Van Assche <bvanassche@acm.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Nitin Rawat
 <quic_nitirawa@quicinc.com>,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        avri.altman@wdc.com, ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Subject: Re: [PATCH V2 1/3] scsi: ufs: ufs-qcom: Update esi_vec_mask for HW
 major version >= 6
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <5a1bd678-c935-4c1b-812d-a249f1caebb7@acm.org> (Bart Van Assche's
	message of "Tue, 8 Jul 2025 09:18:42 -0700")
Organization: Oracle Corporation
Message-ID: <yq1jz4a8z8h.fsf@ca-mkp.ca.oracle.com>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
	<20250707210300.561-2-quic_nitirawa@quicinc.com>
	<ldid3ptehto2kmzyixih73vc7tszwdiitr74rnwklxeeekwxrn@mm7zmyfickda>
	<5a1bd678-c935-4c1b-812d-a249f1caebb7@acm.org>
Date: Mon, 14 Jul 2025 13:25:18 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DS7PR10MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3c5ffd-1a7e-46ab-1bf8-08ddc2fb68ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IV99icouQ897Uqt/MIQNWqpMI8ZFX5s63zQ+vrKSz4xTW/5r04NdH7AvAdTD?=
 =?us-ascii?Q?1CW1z4wsRkcXYjMu7o1TQ02UkW6MY8iXZNA1aqN99wilmNVvh4J95Gfi/DCD?=
 =?us-ascii?Q?90yk7c0QDXjAo5Zsj0o5OROydcnvjg7n6sVmI7fvbRjevrHSuHzZW2LDFiSJ?=
 =?us-ascii?Q?i4R3OOKk4UgybQZqH8diH1NJMKPBYHR7/g1OaBBAwdRQ+V0F6M5sx2cuRmA3?=
 =?us-ascii?Q?QcaEaTj9BmbCMANK7x2RhjnSd3KzAQ9pkpNWmlb+9WY7+4KU9ylG6feCYwfq?=
 =?us-ascii?Q?175rBVK5JEcLjQeSLIlEbn8sMn97bFbUtPu+cXw0INHA8tWHSdmmrnYTgz6l?=
 =?us-ascii?Q?t1/1GrNzJouWB92zQBCC5K1XjVbTF+bEhqSQ1bR1UOvoslvg5g6RU7Q5NFdT?=
 =?us-ascii?Q?eX7BlO1NPnnh0LlK61juvIuyB/zDrdpbK2Ebn1zvR6pa47RKsKhzwJLxfm+m?=
 =?us-ascii?Q?Pb9ZL6ahnfeS7ieJaowMmzvwDaGHO7jL6blOEZ5E1VCdjNJqF8ED1p3bHxq0?=
 =?us-ascii?Q?iapJ90sNWYTeHpFS9/wsSvOZ3/u087Vbcj5Ix4S+rwGX4oGRiuRHleg8Lxie?=
 =?us-ascii?Q?S2705mAZD5JfX+raKZYIIk5kBV0xj+gauGtddbhBi2hugr3RkEkyQ15QWpDI?=
 =?us-ascii?Q?dpDMQhOs+cTrzY0gUHreS93CZCpMOyAqq2FHk6PfrUCNGsJIzGfRr2ydSWFy?=
 =?us-ascii?Q?kNvu1WDCCOemr7M28QjcAk/3xuNPMKMPlYLCQGeMDjnw/L3RWXhTu1clz4ul?=
 =?us-ascii?Q?4Ac9oXRPV+Y67x4Zlom1yLdprr+ZKCY8esP/jcrqrFmNE0damEg9ywu3x9FJ?=
 =?us-ascii?Q?C480Ppqwlq/owBMZgpUTB1zy8FAe9j4wTdSMWmJ/Alh4xT248aXFb/z318co?=
 =?us-ascii?Q?ABEtx0sOQsJipNK14vun/oKI+z55HzqB6aUpnVhNc0piih9+IuvyLd3bKLZu?=
 =?us-ascii?Q?AzJ550+zPxq7OUDRVmgnD4AWJeQ+zjuGo3XWoxysKCxxvot0zZh6k/XnAgNa?=
 =?us-ascii?Q?xE2NP2I9nChgnSZ50vhN5x1v93eqWI/gRrPTiSrJ61FLrKLwls7ltRuSBusG?=
 =?us-ascii?Q?k2KOChPMKnY6hIPoCso7pR4w5KYSzd1+z34w3zIxC8BGmWV4DfpBfjhu8J1l?=
 =?us-ascii?Q?KN1Lm2q4dptJ8nkJT47a5W56pZkIGwi1a1oZnTt7t+25qmpME86S9MODSBMz?=
 =?us-ascii?Q?EOjEMopai+YMQ1I4Q/rIie3TNqTI5hUwY9nwqEKT5E7A2bt9Am6h5T7P79aE?=
 =?us-ascii?Q?jvpICyqUt1lHjAIKTzRIJFhdFYTg2lBCJgDnBN36kSay7SJSjOiyeXH1WEcq?=
 =?us-ascii?Q?CP1D4iCZr0Biju1aXpcJDXNpdaGrRv6zrtpFba1rf7WSlbzSlVbqyZJR7qPB?=
 =?us-ascii?Q?VKmB6ln9T5K0azjc/W9G9vlr7f6JYR310ITiHxiBgn8pmhMTkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IF7dQ0wEXv4USsWpj/BYcXl+lIJB7ZWOhP2tsbKxqP2RDpTzo1OezQjJiBnE?=
 =?us-ascii?Q?/4u4hEbcbp6QY4qoeC60PewG225GxY9j8lGUumY2sWfbSpQWmt3vXEBAsnZb?=
 =?us-ascii?Q?OslD9o3fU6bNVrbpYoyPoTaDfyrrilQJiOJW2bTbRzRFTpUAlxp2IUUQvkRm?=
 =?us-ascii?Q?k9WvhlGLrQgIB7ALgRoWcZ3v9dmAd4sWLJFxlcIV2+tokfI8vwVYDcpEaYQa?=
 =?us-ascii?Q?/MF5OaMC2TgXZCqO72DCkIcEyyfkj8syvJbHvCseWfj0a2xcsd62E2rW/yWZ?=
 =?us-ascii?Q?VAUzuCDC/jKt+O6PxFiS2LYRgTswbf7lQNLpO8GCg+9x0DU+Y0yOuZTXk48D?=
 =?us-ascii?Q?nkKPvKuovLBy4H3ZWbll3GBd2/qi/3rmQLrNKRWasMUPrBXhr2BAa0kuOPYR?=
 =?us-ascii?Q?GDut/Dx7VNdQ+zMU/f6vAJCsQsEpS6NWcN4/TsDTj+1vqu8Hr4rCjLwCIQ5i?=
 =?us-ascii?Q?ZuTUb9mViTDy8Nw299WZoxjJI6+pTCbgDhjB8/y231NyMWNlshBi/6+siioT?=
 =?us-ascii?Q?SY9Wg6Z+t+/XogcTPpM25XLonEOpb7Yfrl2/a0FRpTuOnHvPtxFCLBIQX9pa?=
 =?us-ascii?Q?6NZAi16Xul+CkQXX2XeXyTZAkM53XveWPS+OLqhEL4twCo3W90/CHqDs/GYw?=
 =?us-ascii?Q?7njozxsDMKVWUrL9J1sRY0zQBSqNuvUIMN+2GCo8F5J5EdxkT4HCJS0/5oZ8?=
 =?us-ascii?Q?0PA1EnrXk4QZVpqPZ0sutxor3Vud3RtY4XQLR4RnAXMHlqLdybTburPd8/k6?=
 =?us-ascii?Q?wk+wcsVHkYtUG73wKw+Dn66I+Oi5Cbr2KSExlC+3nz13EJJipWR0LMoktL5L?=
 =?us-ascii?Q?LMPTaiYDoXtOyiMZBH3OticKU1diTy4m4E/HCGKJMENKsFPKAHzSD3YuSM00?=
 =?us-ascii?Q?sMsusPnC3WZXHoBSLSV/YIrIQB4UMGBigKKl7CgIfWQkMpQIUnPPvO4Jz5jM?=
 =?us-ascii?Q?ZigtDW4NHh7tzgIMVWMXpCuaS7J4RIyV/wO66y6tU0bi8EOCU8fj5BjmoL7+?=
 =?us-ascii?Q?6pkq3VSVEa9QWvbHpEgKL4pOxOp5ont+rolp6cSXd5eu1VSHl6CDRp0TVAP8?=
 =?us-ascii?Q?SNguXRQdD3z/iCdBtJbzk+lSLXvIina7pViCrWD7EPX4z/h3Lk40zQBYtIvf?=
 =?us-ascii?Q?sNZIQuLJAdnDHblVNiwBqbC6aZVpsjIiFMiM3G2ZjFQ+l8A9FzeB7Acet0k3?=
 =?us-ascii?Q?NUDvkoozv1F3L79zFIkCkXaaTD0ozJIOmrsfNsH+GULYcLoAJOIT+6zojd8V?=
 =?us-ascii?Q?aoGTdFGyrYhMuHeM7VlPdzWKfoSb0UQ/l4vNkU7HM4mm9BEH7JtnhW4fGZ96?=
 =?us-ascii?Q?13eKy6jO4OoQsr5tAnW7R14xEtEIg8jwYDdDd4jhQuxzHSid4epanFIQMO8T?=
 =?us-ascii?Q?N6QNq0VC/ZkaerwrQgAmAhy5BmpUBHxFEOyiC5sotGAE6DBOC/sdmDZ2PvFI?=
 =?us-ascii?Q?XX0YdKYtwXvswC0tlGfaSh/B6d5aUJAXRKvJS9nT1WlsnU9eyQlzPN949zOA?=
 =?us-ascii?Q?VARF8odF1rOh3VJXkLdJ+kLwPTMXErVaGQb8+g8+yCSvKQgaAOBEVNoMSUbd?=
 =?us-ascii?Q?/evSR+zJOssqp6iAiShwYabs99F4CW8NhorMnE9hi9mpQSSb+ipiDMctyGyU?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1Y4i0o2YW6VUYn4dVMQCUhP3vdtM6kSt5ayGJw33BCGNDnW5fazTnAJF95weGFqHvW0lixX3NvzfU4lBRtNpK62DWpRsZKxxjKpZlk9GSqe9iTfwbSPM6lTUQUt+lc0JM6OqWyPyFcjVKJXB09zOnuvdopmXWNT7I9hkF3OUWzxwcrMkT+NJliQQDNHKPOG21HXOuda1HPJcTwMqQULrAtC8fp30MNdSYu3GMOvn4i+D6BJA4fJBCc/F3HWdJzZG3Gfn8kZER9v3PUbOMxVPlN5QpaBFhJCwHCaSoLiUkt1lLQ3TSD7+9THZBiFkdR39ur5o4QXCp0H1hCdnmrDfhK+FkecJlObzqnnwx/rMiVbwBhVthCqB1EwIRKAZuz3E+4Ncq7kHFz9lb2Ef+jBzFF9jfJiqY8U2UGO7Qop6rSptntFtN9udmaUIOQYHGDaBsXx5k2FZ+QnxCyiA22SYj5bVu0rXHRuxf6aF1/LB7mVSsEBL39lQ/L6r2CvcJWctygyYhvDDpOgnZ1kVDYHM6VtktB2KUj36/+nScUDoSA/lmeGyRl3eI+3zWQaY5iYk0xNTSLDvWrckNGdNfdGbWU29B5zM4N8y7/AUXBqmVUk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3c5ffd-1a7e-46ab-1bf8-08ddc2fb68ef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 17:25:21.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjUn4JkjoabelGR4WuJ/+B2Erad+8RlfP3Z2Y5XAC22TzuGsIaxM3BIq4Vd3fta/jLglY2mha9Hx4toPHwQN/jf9O9uFVn96J8kBU6vMdYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4880
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507140109
X-Proofpoint-ORIG-GUID: 4LtHyclOKoxZMPnDLoQE5Z9P1d-ICVFr
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=68753d8a cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=LmH7vPD8zB35acN_4aIA:9
X-Proofpoint-GUID: 4LtHyclOKoxZMPnDLoQE5Z9P1d-ICVFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEwOSBTYWx0ZWRfX2X5wzSd+gUKx 3KUywDh1bmpL7fKD+iiCsTDfX57wPGL0Tp2O/HnM3LJW5yCtZJrfFjfVjOS56oIiPy+vJGafkCm NsMJEeHCp3gm2m0XO7PctGZMbPpgNb3+rkfViBZ1/T7l0levFX0sdzsYCLDe45RADwx46y+zMu8
 g6HZMLxXdmDZdLDrxe1fuKcBiGy+qH4P41ZkED3QJ8UAFgVnab7ekW7OfpdC1i5zQ/tOKj21zGl 1jVINEdhASEEG9fyQUZGpbyATMlcSvcm5EUocbrK4xOZbxwqkmR++EgPcQbw/RpVA8UkPqOWuY0 l9H79wUherP2qX62He2wMY3rrmlChDh4wHHF6LKhg7lPgvzeKk4qsNSXVbJQ4QLOPQDccPzKdpK
 BCjVjwx+ikbgxHFvSV2vQd/DFOPkkpg0u2haW5q4GvTEwQ5Oxsv6HL5VEgghqMo7hA5ABlYt


Bart,

>> Maybe we should get rid of 'scsi' prefix since the ufs code is now
>> moved outside of drivers/scsi/. Bart?

> Dropping the "scsi:" prefix sounds good to me because this prefix makes
> patch subject lines a bit long.

I have attempting separating SCSI and UFS a couple of times in the past.
However, there always seemed to be at least one SCSI core change
dependency per cycle which prevented that from happening.

I don't think we have had any for a while so I'll try to do two separate
trees for 6.18.

-- 
Martin K. Petersen

