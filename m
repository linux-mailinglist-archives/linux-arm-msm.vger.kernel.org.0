Return-Path: <linux-arm-msm+bounces-70723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90798B34617
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BE371A81A82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 15:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B259A2FE054;
	Mon, 25 Aug 2025 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JK+3iD5m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cBY7avmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E572FCBFD;
	Mon, 25 Aug 2025 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136561; cv=fail; b=VKloOJSLvdft+288s0qxC9dxbd6N8OzBGYtlLmzBpjYhxuiXqEsW8QP95DpZwSuHDhXTAScocE7sVxPipgjpOIBfRg2qVCSbGG7tLC2dh2ErsUevQgAC8EQCjyHwQUpCRk+jVIMr9rAEZ9d2akQmfGKjabv/OTHvKH1C7nfpJB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136561; c=relaxed/simple;
	bh=JpKwFjSkbfQiggd9zgjemfYZE6jrdfi8/jc0MyWlsvw=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=lKuaHpY2xOEUvjrhap3cHfsiE5GserYts9r0iFGsJoVFHkfQiYDdDnZPezj7Vzlix1leKdoVnNfedUkWfatj+iN0ydQ2hCnRCfG7VK+F0PiomFK9mFcXK5YpVVCMFKbOK9wpsAoDRJSE9m6AA8TQ+rkCE5j61wG9p0APp+6pcRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JK+3iD5m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cBY7avmx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFfnfL012618;
	Mon, 25 Aug 2025 15:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GehUguqUmitgw+xFIF
	VdAoQzO8eC+48f1JL+aH38Q/s=; b=JK+3iD5mfpMAkS3F8AJa27rkzTelQaEnNW
	raGqp9M0s/G5uslz/0KJ7fqh02hBYWi22Dx0k7snbBSP0EJ/nXnACfo96/cEsCsh
	26wKIlAQDU3SFqqlj0Zu9tI9uMNQCdvMm4gLhyvIHEzOJIvumCpDtA/fKuZoWSIk
	agWVaotutXujAbCwgxU/lCodZzFVEBiTkvAGHuGC4nNqm8aGNfdd/ya9mNM2iqJD
	ASSBRAqQjuscsaNQD3zay+dgdUgdSYTFO6Anfm0ehvv0jb2jlQHO1wPJc8FdPFkz
	HIGXkx7AGzcrrngNz723WH9bgBivqWREQZc2+OvPJrC2mtg/cPhg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4e22krs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 15:42:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFeFF3014625;
	Mon, 25 Aug 2025 15:42:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q438c5b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 15:42:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFaysUB3OvHdcTB08emBHW/t9XYmGH0oVOm/G5TSt1BoHMq2oXXDWoRTYNNkq4Qy9LIU2lGFqoC5KZ7UwCkdgq3p9TjPCLpiIDuySzr5DDx+opKXfmyWqm9oH0owNUHY7Av8FQaDgbV1tojvbP3Tta7/QGFuTecLL6m2vOmt0CGew3oAlEMhU/i4J98vQ1TkbngF8ohypx7qJvzo+PDtW2ZbrI4/as/O3hZ/CGPXEtv0mQgTGvCR22WESiFqY+gYnLrU0alumSGLNMNEgE8Wq/DAgFICMjkOaeVtpii1QM/MlnSRSzi1xvOai+8RaJjnCxxSPaGP90QIohaFhsXS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GehUguqUmitgw+xFIFVdAoQzO8eC+48f1JL+aH38Q/s=;
 b=whlS44IbGFhpVJEj13Z0g444s0gIU16rbTA+d/Uvgp4qCHwHJiZWMLRzFuqh/n+xzXGl213vK+39NuSZB2pI79VdVa9UQMAUqlVNt2u3jW21mXONtoaV9oL8h1sLHlVks16RJFSp23ta4D2aYe0Hsh6dwIHwv82HG6zcvXEnnH5Rxs/4W35xqWtmipdXjwNbVRItGr5VC1mrGie5ZermGYaHaByhdTnCNtpKS+SUUqDVx+YDEtkBsOxvJaJDCKRTeHp3hYX6Zsa4LSwhIHDytbLp2z3jViA3583fTLJGYugXt4+tjTs/Y2kw6/qAxLSHcRi2ByNjVbyuLtRG1aLQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GehUguqUmitgw+xFIFVdAoQzO8eC+48f1JL+aH38Q/s=;
 b=cBY7avmx7jWmwfJ9Dw5RxS3TMMgd8X8znOcPyF/e5tmMBEsglTqe0PpjQVDcGdeznhanZsgRee8tmm5DmhquLBX0WP3I2Lrw/blrJG0OX776j6WoR/k62q5NQ9mUlIVM2J1s11CZzsi1twIESqXA+01tWotR3b6yM6Qc3/CpS4o=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH0PR10MB5209.namprd10.prod.outlook.com (2603:10b6:610:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 15:42:24 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9031.014; Mon, 25 Aug 2025
 15:42:24 +0000
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <bvanassche@acm.org>,
        <neil.armstrong@linaro.org>, <konrad.dybcio@oss.qualcomm.com>,
        <tglx@linutronix.de>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH V2] ufs: ufs-qcom: Fix ESI null pointer dereference
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <37563dd8-341f-4db4-8a4b-c7f96dbfebff@quicinc.com> (Nitin Rawat's
	message of "Fri, 22 Aug 2025 01:01:47 +0530")
Organization: Oracle Corporation
Message-ID: <yq1bjo3s9c6.fsf@ca-mkp.ca.oracle.com>
References: <20250811073330.20230-1-quic_nitirawa@quicinc.com>
	<37563dd8-341f-4db4-8a4b-c7f96dbfebff@quicinc.com>
Date: Mon, 25 Aug 2025 11:42:21 -0400
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:408:fe::28) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH0PR10MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: d87ed906-b92b-44c2-8a3a-08dde3edfcb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kmBDWuaDWPLwBcmN+rJClIx6D5kCyVi3e8Xodq1Grsg1IV6KUHQAsfbJC640?=
 =?us-ascii?Q?F/0G3WAFCn2e2wZt7NuN5PU0uAiHiyPM4v4+IG9ln9m0WuoYxsppIuWV1MPH?=
 =?us-ascii?Q?4meAiv1+LIfw/9I9Bg5T/54kbIa2Cbamm/YvISDUMCwvGTMq4rsdgzK6BnpD?=
 =?us-ascii?Q?UbuBIPXhLt7Aji+1MxAww0OaSUfirRhqgw/ecChlNUsMCOBe1zskvI8UKjut?=
 =?us-ascii?Q?pzQqW/dsHlC4sccNR0B+5or5Y2kNhI6ZeCJ4prMgBmf3jKEEQuWd+/kPZwTl?=
 =?us-ascii?Q?zvCLBxVqCzlz+gErR1Edlr07YOJwW+GGDNdK/jaCim8u7NhyuW7PZRKPR8VQ?=
 =?us-ascii?Q?t1kiY46b/dkwpZdqTDS18Vh1h7ukV6VMok7VoxGz0gY9JENiaAlWDECbQvOe?=
 =?us-ascii?Q?8Huv21QjpwQa3dvc/vWSVc0JDpF+6xgMhQDdnoyDuLzZk60V2isvSkvF7C7s?=
 =?us-ascii?Q?Go42OtAp4A+/wlgrJT42HPyenyJ7Ef3FfDSM6FB7Iu8VqebtSPtE2uWPd52p?=
 =?us-ascii?Q?m8O8Gby/KaOHciWHbHmNdLxOBpzGOM1jsKraO75WxzaFw0rATKhbEyg88bhs?=
 =?us-ascii?Q?ICqFn1byEWsGOPZHXmfKy72zd5NcjJD6BnjK51up0tyDN5TW2uvCDRmsQQc1?=
 =?us-ascii?Q?1QhzLDbVlePLAIfCcjuisopSfAh9WGd9gByke4bW7Om9TYaF291h6WuRIVNC?=
 =?us-ascii?Q?XYKrQLrega7nZtWADu60WYr2KotZeLSROPrKp+WaKj49ARVVPYo3mXqTMU/N?=
 =?us-ascii?Q?WdvdAkp054sarKhDlp/okOBT4Q79MB5sw3dLBYIQ1ho5mDhP3lVZfRO9vA82?=
 =?us-ascii?Q?fNPpzlTAUIgj8PgvSlSap7ybUc77QtuBwNFEHOmWf775llsH2U7N/GiW4tYu?=
 =?us-ascii?Q?4TAIc3/FY7L7EbLG3rmCqDrCuhft32s7KLFWtL+H4D5g0+IsppQChlYViNiz?=
 =?us-ascii?Q?KoZfaZ68xwtTnKbsV6yc08rAwqa8G1Y6M9Qc+u4vbHN0Hr4FdT6vz1ntn8J+?=
 =?us-ascii?Q?ltBSCQOzf5EFzd/g4OaAvSyHEBQ8rRQXNRHFBd73Eo35K2FuBb1MFRtBQzoK?=
 =?us-ascii?Q?I3zP8ZyfGmQxux7F/a2hMl8vr2wAXfKr/ENTWZJ5D1PKvDpn1ErhNE4LDSgG?=
 =?us-ascii?Q?SowehQ67qDyr3KXvF6kj4mpr5ywGsnuwPeV0ise+AROqm/CdtC61GsupTY0C?=
 =?us-ascii?Q?dhfp4Wd1dYps6d53OE4f6skt6V5hXuE5RWwgzkgkS4IcCE25CVNkpsZsPYPO?=
 =?us-ascii?Q?TiT34OJB0MslxuXglXlanC6Y78RXeoJuT08hFjxHfGRfL93+LwjSKWt7Uq/q?=
 =?us-ascii?Q?5v4EyXdfW2mJN6L4c9u0978AoKUcMLWBfo8jxoeFOB+JvKM+p0vu1GsIuyGe?=
 =?us-ascii?Q?OZXoYwHOqZucFLbm6/CesfGAI6g3lwfPrUk6TBM13SP928OK++9It0j5McOO?=
 =?us-ascii?Q?uxhmgG/NJdk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/HXE90ZbRmZdQCFjh6znFrm52gRKwyIy5dn/yPzMpSFO/ZSXM9tnCwmmBy0V?=
 =?us-ascii?Q?0hPZdEF9ZPuZjFvDhXUDffPV59lEjs0V5qoo8FlQD4KyCvXh7x8O3Xdb4BR6?=
 =?us-ascii?Q?1HiCrAZo4hajUe5wv+HMaETj1i3JiXSSGVRhqLFUO2DlKb3sG+DAK2XbOM+m?=
 =?us-ascii?Q?TCRMahAZbn1Yz87IYZHSOwDkTFiDoGe35/l5FGh78oYLDevNg/v0izZEV1cW?=
 =?us-ascii?Q?OEzmulo8qHcAZNVjdoydqFeu7JC/Y4nIPX/Bbmxyq5egxuysxvdSY1I1dymt?=
 =?us-ascii?Q?9p+91UNSaylrMpr7IH90E1dRtbKf6R6yEsTofyyYCeoskkX03f/eDReVZZFK?=
 =?us-ascii?Q?aoziAO/V4kl28AH1XpbtOanJGs8bZQBdnOcRwk/Cqmmk4qQM2vKy4cLhTwZF?=
 =?us-ascii?Q?g3bWte4iknGQgh7CAgy78h3BFhoCqN2gujYJQg7MbknUC9rr69dNvo5YJsol?=
 =?us-ascii?Q?Cx9qiUfl6Ns5MObXvViyZ/JUVnEmc1WtpUdy+//V+2vYZM8BxgZjvYlMdyzQ?=
 =?us-ascii?Q?K3pCuQWWPICA99IhVk+gQlpn24gmntKpHiFI+95KffF49pcG0ISuuwxgqEt/?=
 =?us-ascii?Q?xuFPxfNd+kMfC/GzV+wzBMu+HJxtGbHvLx8EvC9X6Typdd9rg0aogdIsc+CA?=
 =?us-ascii?Q?g1H/GEgWarp+0hmARdcrztPEp24qmsA7AtCn/ny7MC7JvwHulQwUKISa1kUb?=
 =?us-ascii?Q?pJ0EuTJksZymhBOPeRskfKEIE3KI3QpE9vB91bHNbCrbHsYBXkFf5BqNbXUi?=
 =?us-ascii?Q?V4USJyNDsPtaTbp5WMzgUSvjdYvpVOEUDsAWkcDSRVQSkC0bvmwuOH9O2d5r?=
 =?us-ascii?Q?+/or07Q2mJjwJttCXKM2ASqbqMC8w89TKgPeGNb0DZ67B24yQSimqUiHj3mQ?=
 =?us-ascii?Q?cC0DRGL7QEqKvnN95cvRlkoNWfkkF7tFXhMdiz+5UqnvbqTzKRmwp7vJ3696?=
 =?us-ascii?Q?E2EZchIJoMDjOw+bh2iUB3LGwGW2iTYj1zrWMP8yZULJi2c5CgLNRhYSdWVJ?=
 =?us-ascii?Q?mF5iYOGGGm/d1dlboq97p4hRdCLCq5celkYPF0xDetnLkEvK8zkPsaiKmtEg?=
 =?us-ascii?Q?PTDcb+pqrTYtZxiXhv0INPwn4t9Ychv0hxTkifF9JAU/VHxf2O8dOiredMEx?=
 =?us-ascii?Q?PkT0FXMYWCO5aYe8fPIMwZOIAa6CgnyGtqPK8/+QfNh02ee1xRlSA/SrdvQE?=
 =?us-ascii?Q?cKbORX/aVJYammi8LSnt2LAbBC33N/xSD+wMk5beGpt++4DbZnNrToWzgnQQ?=
 =?us-ascii?Q?ChBTeJHyw3lCiG82yPYKQKoDiRZPKoWst69h9/yVZnH5VwUfJykkTZKWs/ph?=
 =?us-ascii?Q?Ek7iRV1zXNS9fo0AB37yx9cMNx9uAc4oO0/wj7wwJm+yUzpljZMduDSuQA15?=
 =?us-ascii?Q?1XS3Imt4nyveQHdP7JW3uv0yu68K0fEoc9ekrJO3C2tASEYLcFCheahtpnIh?=
 =?us-ascii?Q?BzQPU9WnDaED9GM9awfizeoGTegFRERBv8MY3wwXrCv5QTw14MFqcIXr1KR3?=
 =?us-ascii?Q?T/sIcpnonv/6dkZmmA8uMrBnubtJZQDkENiOTjg1n0FWX+s9CJJeI5QBflsp?=
 =?us-ascii?Q?KbvrCnnOtkOgjYEdljdAkMfNNN8K1/c/GRK+M2KmT37MA2G8bIEQzB434s39?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/gv9odLjHvxjg9+8MjckSYri/3mol3/zRweoDYdFc77Ly0vbDQJ01ceF2Bx07BDzqX0c7GLvzWnhiG+AqNGpPeh8pKFFheyrTPR2nnfbgfDOplubkaXC6IfHyz9Z6Z1NvTTdP8EF7y9IerKI+UPVSPyieXN/xnnSj7If9fLigbvfd9apptBrZIvMqTcDd1sTjJELzxjZhgogelYLfNiirxiK75a+Q9kosYpNEQzeswICydlmHbGT21QkPX6K+HDBq5yVvi/09sZKgUcPWjvubwfOEJiMO4lsVg1FHAy+Bdje5riGiIJjKyhxlHnTVhPiaQvFRdUmYkYA2gSIc4m6XPr4f2q5EWQqy7tJhrROkqesNBM98ZeE6YqJLHIFwci/yEGaYzDaOULdSu3kFBrySCxjCFLS7hs9/2c8nnQwI2QbGG8FkZmw36LH6+fmlGylJTuyWMyk/0kOc6zEkbn/PCzY9r5uzqFaRNOF5L2OdNIl3L96Kny2xYjSVD4Byac/HYO4pgeiPz6ng9YCRM+q+cV00D7A8D8AtF1eshh37jjBO2AOXtR1/yk1wj/9HXUnbeWwEMWdCqgkIQVHN+xkSVELcYheYz3cJ1yIKXs5BOo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87ed906-b92b-44c2-8a3a-08dde3edfcb5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 15:42:24.4903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yxjp4ToyxyYIZUGF3wAYDsJI2J0vGGifJClOfduxRyhzfsD3OwGb62hnhr/3UIK5LRHEHNxkM0w1un0XnAYJSrK7Havlpq6vOnNAnZ6xW58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5209
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=932
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508250142
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxNyBTYWx0ZWRfX7Gl4zGKt9I94
 gekLy4cWJl3smDwFIQrfKyt4KDLJ/uHDXtKhmQTGEyJMzAKKyqmwbkyZqAv6BY2zPNM/tGdWAXx
 BLTjXYRrVGcsCmwmJBl8mXSd01IcngbPXAboqQukLKOuMZGT9OZoSgIETeV9nbZyu4CzISsE7WE
 kbT1qhS0WJ2lmH/w+wQZPIB/eJwjw938dVH4Sy4zd3NOggNh75zDpveAMgY0XyTEv2jFY3ouMFf
 ukuYH9jiJ0swluapuu8vG/2ocYwHavnnhmqLXVsvkPiG0NvZvNZ1LNt4edz4E1Nyf2G7Zy7X5iQ
 GJHKcgpf0OYWxaiGVGeLW53/6UVv3mI8wTfk2YkhjAXosRBnghWakWkbxcEhzebEfsBrK4MJqkx
 k/0SasUuJuTwjjicwJLUsrXKrS9cgg==
X-Proofpoint-ORIG-GUID: h5MW82MJYhRHDUImYAIjCMD3Svz9KTcV
X-Proofpoint-GUID: h5MW82MJYhRHDUImYAIjCMD3Svz9KTcV
X-Authority-Analysis: v=2.4 cv=IauHWXqa c=1 sm=1 tr=0 ts=68ac8463 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=y04tpmO5tCGq7rHjvBoA:9 cc=ntf
 awl=host:13600


Hi Nitin!

>> ESI/MSI is a performance optimization feature that provides dedicated
>> interrupts per MCQ hardware queue . This is optional feature and UFS
>> MCQ should work with and without ESI feature.
>
> Gentle Reminder!!
>

Already upstream:

  https://git.kernel.org/torvalds/c/6300d5c54387

-- 
Martin K. Petersen

