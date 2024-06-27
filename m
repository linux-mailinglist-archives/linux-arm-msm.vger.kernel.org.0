Return-Path: <linux-arm-msm+bounces-24399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E6919D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 04:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D83B284DF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 02:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB51101EC;
	Thu, 27 Jun 2024 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QeSJfUaj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VeDThJ4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2B17BA4;
	Thu, 27 Jun 2024 02:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719456690; cv=fail; b=rdqaWJEGZsbGSIOAE7aPYXkLnv/p8ep+9EDtJgCvBGvOqbaUOXUTplyf3AQQVtCwPGuixmUQt9QWUA5OB/cEL0rDCtGdyITqopMkBKlDXYRMY3TkdmHu5Xis+1EzrfTzmnxdM0bvKHGHSDsOqKhNuhx4sqGTjojIvVW35qZWx84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719456690; c=relaxed/simple;
	bh=wMeTWPlxJUI4zQ9FAUrZW+Yl+HsKSHkg5XGTVgGCYwM=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=sC2HQwWPOkEWWqv4hTXlsRZSYCJ/+8wuHOg64jAaMZvk3P2HPDu50wDZcHWs0PNNWAAfJQfvl+OuMox76d6CoMSXKUdYlmASTvK7o4akJU0N3Y6fdTcuKItKsxerDOl87qKOIi0Ov19VsnWgOm4TXYNxXRmvUrkzJVTmyWdfA20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QeSJfUaj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VeDThJ4N; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMU82013901;
	Thu, 27 Jun 2024 02:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=We6RCDGFJ6FKTn
	9FTL8l+iouzHa+SViUHSq+wRHBHdk=; b=QeSJfUaj2jaSiuG4uu5nXhrMel2frk
	deX+00nL4WxJsebgZehQ/n0E763qJ3wkkUt8H0L5EVRH1xwvIFxUf0C+CWdUbd4I
	cISOWmUuaMChLhAXl6PV2NyyxsdOCuJLcYQk9cHxRb59RFgQFGbGTutGL7mtAv6d
	60WmeGN4Bwws+vOU02qm1ukwWuRSeU/BC6pNlvNuwh+1WSRGQm4z1jBC4UMDbga4
	Qu6wjqy9ZhQvkwXZa7JknxiL0gF4WeVxe809Hm7IeOztjcx+xJrVOvPicHIpj1AC
	hTXzbiR8r/H1DjF0u/3dMsBIs72QUf3AAQuB0GY3H+AoQpnhvnksUnIw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnd2muk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 02:51:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R24BPv037104;
	Thu, 27 Jun 2024 02:51:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2ab3ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 02:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1m/eLiS6OlexkawIOUQf8F02pbOMjGuDUTGdxosN4M39nIDvq23A+B+CmwRCSwepAmPEw5KIioX3v/VHyxcelbGmnyXlU7rRb0W6gB+VscNbFG5B1wjlq6B8NgqxcP7ErXPMZOk8vY0p4vZHqezP40RW/6HOZBbsf2tHwcWEDBcBbCXP1GD8aGV5RRyVGy9S3lsj49VyBnQTUgv4FEHfZbuf+qXewfYiBfr2U2wX6JxKo4agyLexdoShaVtvXZAyM3QWsCDlX+6hiJbp9VFD8/I+BHaKJUowTEhZY3o+cztZBS6LxYzt5ltr54L09BAbJ6xNyM0O9XSitphZiFL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We6RCDGFJ6FKTn9FTL8l+iouzHa+SViUHSq+wRHBHdk=;
 b=UGC9mjUVt7XXGDURZ1BDrC66A7wtrvMkS90y9O9TvqkJGozep5jtDNlhFOl/mXpY9WhsVb0wSA8+qKivFNzYjVGDLTgr4HtuFrcS6gn4MJb0IHjSS6BzbiNDBV5iYupH2CwrBoKBgMo5UkOn1luUO1hCoY9tS53gkXdrXtmbM4e22pTZmLiRY4lvln9lXBiT4U4KIrVmEbbPb0O0jN1M7JnXjS/VUff0/5H/UW3UNKJgY17IfpV6ltlMNqbkMnTSheSWfdIb2pP+IueB7Mwvq/8XY3z97yPS0lg8rQ0kphElePODmrGhmkKuYw3vZAQgjMPJOmvMbnl4f0Q6Z5sDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=We6RCDGFJ6FKTn9FTL8l+iouzHa+SViUHSq+wRHBHdk=;
 b=VeDThJ4NJROZgQJbbTqubNLknGdfwxa/eLWefvVIbBdTceRwHHyRbQ0UM4i5tpLUIZkrIW5mvO9T3HZuUSTN5zJbpQUYDb+jXrAY6wd3qqKlz+0bFRYcOQyCw3c+PJDbGOE3kGHdfFzXcULocGl6vrSNcnFybUme0kf51zekLis=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by BN0PR10MB5142.namprd10.prod.outlook.com (2603:10b6:408:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 02:51:15 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 02:51:15 +0000
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] scsi: ufs: qcom: add missing MODULE_DESCRIPTION() macro
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240625-md-drivers-ufs-host-v2-1-59a56974b05a@quicinc.com>
	(Jeff Johnson's message of "Tue, 25 Jun 2024 09:53:45 -0700")
Organization: Oracle Corporation
Message-ID: <yq18qyrgktj.fsf@ca-mkp.ca.oracle.com>
References: <20240625-md-drivers-ufs-host-v2-1-59a56974b05a@quicinc.com>
Date: Wed, 26 Jun 2024 22:51:12 -0400
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::39) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|BN0PR10MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: d73b2286-7603-4db2-b462-08dc965402fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KKXwlE8GeN2bDkShM6S8nAS/gqoRKBNqNYLme5jkWuUy8Ik928XNmWgPows8?=
 =?us-ascii?Q?EFjlUJG93QfjI4b3F2vxL0N97K4ta63HChypGWlan2uD+As/tVa0elhvXASB?=
 =?us-ascii?Q?oLLHpwwDt94m25XRsCa0rKs/rGIaZYp7vqieBhGSuYcIwR1ic8Y55vrIO1P1?=
 =?us-ascii?Q?CkYepVe9DB6rq1zbKvxTdRcxKD/kW7niLHi9TJYwe9mU6H8aCPABPJMR4OYZ?=
 =?us-ascii?Q?7mNSqm5ZyskG0hbqgVzYphj7XFX2NsZ3XYGmgQ1mbMO63rWzvGyY+YMFJEY+?=
 =?us-ascii?Q?gC3JX+Ap+SFbHLDY0mQ+NaZ2TMaP8MqMRHN8H4Spa3+vSTrJp7M6eA78Lgox?=
 =?us-ascii?Q?1qjfd+OPNb/CgBEnUXAS6MS6aSCe/1hKnxjrkMHWR8riG7O2oUd7+CJ6QPnD?=
 =?us-ascii?Q?RYvV63P4s3NQk5TpovFQRM0WwnvtIndownqJQEcA7Xr39+yxS7zsb4uW+uhS?=
 =?us-ascii?Q?eekiKYHu6OYEGhVHLjNttOzzwu8u8m+duZn73ZU3LHh0tQNoxlvhSJExLwy/?=
 =?us-ascii?Q?4O5MgOHuNhb7x5HFuzTydle6U09SVgbHhq/5WmsAGh74d5KenML95QQH5SIh?=
 =?us-ascii?Q?aIOG/Q4xB5ZMzswTsbpnUrEc1XDI+q1I9FjM+IUtIYbvCk9Rqd7uRukloDYw?=
 =?us-ascii?Q?RM+R0iEIrN0K48iqzYPMnBHHZbwPzDzjc1G+rmtk0IreuVKbC0IHTz12o7GZ?=
 =?us-ascii?Q?fNjblP2jbgAE0dVipvPAgK/kccjG4kzbwMPGgxG+sj1ExxvaFC578gbuD2ol?=
 =?us-ascii?Q?3mZYk9pm16BuvhZuhaiMuf50C9XDGg5CSdzjaSQ99wiN1t14+qcNHjeIkiBp?=
 =?us-ascii?Q?8HPBdabGOHnS6IVFdzu5/Xm1AzGV9GWm53MbgJir5FAQQ57pWZlUO444eIkJ?=
 =?us-ascii?Q?GDa4eCaQPc4R6gBZtf5q/c5dNw9YXHgrFQFW6oj329T/+pAJC3XVI3GRz6Hs?=
 =?us-ascii?Q?XbdRXx4JUE077QMT4yX3KE6BQ0Ar8UTigp+Sa4Axuekg3ANYlgI0YD3FlEyX?=
 =?us-ascii?Q?7bdVgqPMmmVWWakWFCictMP9EnnM0AcZ7i0x+tEajPhfjs5HJRZNddooKupD?=
 =?us-ascii?Q?6AWYMu80MOu5Cl5LA2m+TJaawmg6bsYdz3h9sluLGsIFNXImPUcyye6L9Gt7?=
 =?us-ascii?Q?rtOamdF7Z4NbmDXd/H65e/feQlg2M9Hsy+ozstZcclkB3MzHI3sfwseoKzFP?=
 =?us-ascii?Q?YY4hohQQ3VFH344p3RYn9SP74AlzorG6gBbFxU7gVgnuj+L06Th7vweSGgGA?=
 =?us-ascii?Q?+phEzW4bhiCPUVBT3IXfxUw6eQ0jELKQo/BFFFQ3DMwnPMj8wV2xwvpAFeks?=
 =?us-ascii?Q?L/4szP9fKEIX1cIfqf+QdSDz2/4TspxJNSiy0Aax7JtuLg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jmux4jkiO1n83hpDJLjIvT8MhkUeoalKZuOcQVfHllAR8fFehKZBa6Bcpw2I?=
 =?us-ascii?Q?wCHD+leFXpGzd4ECOmzFz8yp5c5zA2Kca5SEVL50znQivriUukc0zoVeR80w?=
 =?us-ascii?Q?NBl5/xYZ4fdUrK+eFIxTyLhVqbuQx/IMX2JX9g9Iq9k4wpgEb6Rgs1M0+K5U?=
 =?us-ascii?Q?6NthK3m9cU09/uz1JmF19UePShzwZkFRi5sl7+7ZFCZUU+IP5o7O/WnFoPC/?=
 =?us-ascii?Q?E+S8lKzvawONHrPUe5goi1kzn0GlQMwIXar9IsMysjDelDlMsFFW1vFZcGpI?=
 =?us-ascii?Q?Q9Zy5C2TeMRmfLhGJ9bAU7lB/7tTnxBhaEB/wbF1N9oEzSeIsWeHas8aGHLF?=
 =?us-ascii?Q?t6BgfhjbMtArzPp+tiHTpZrBDHvga12Zib1uckPUrpftb18grxzQWa+8jHUf?=
 =?us-ascii?Q?s3fGxF4Es8jia5FPMhkJcDnEWOUuUP9qzNI4QJf1KwyjsIUgg96CWPMrWPZS?=
 =?us-ascii?Q?imrIkbNrSIMnh0+SuH5l9pMwgTNqFMuoaHDTmFCKfR9HEbm8PXORMj/U6Dzg?=
 =?us-ascii?Q?kPLlAMMO1TLx1hUXOUawJk8lZfxkgKqnss/7nXYFFU2vqb3ZiAclGdeCwey+?=
 =?us-ascii?Q?CnOIs+xt9G6zBO4HPEvmo8KOS/UUk3Or8LR3DacWxUN3Rp+1bwdpY57YDaLv?=
 =?us-ascii?Q?vn/gC3+oAl5rFzDuSo1CjOIsg3xZylw1vYz7vzH966f0easxn2kULW1en114?=
 =?us-ascii?Q?G28j1T6AAzrAy++cJ0ZR4facpURJv40jH16SQoZuCopkQEj+3YM7yq6CFUo+?=
 =?us-ascii?Q?33zJLznjlNRrjHMGufhtefaybgC9KZnt1W+oVY/wW9/4k9Q0eOaFYPx0oet0?=
 =?us-ascii?Q?GbpZhqWHkwqqMNiBfcZ4gA2rzNaXe/ujCLCfRFia/zfPLItvx6N2TcyRTadE?=
 =?us-ascii?Q?58j3+1R2mA3i8t4HVjjeSo68js7kt5r5P4AHzCFKkA512od9YI5DbM9yTOj2?=
 =?us-ascii?Q?Z/iqk8TTkdkXKZEKXmQIxk5yB0twjKd+AWDodnU23UPKckywP9gg2iFHvxEy?=
 =?us-ascii?Q?tE9P/QshtWUj8K/Bz6FzetCCndE3gUWSdEpjxPfuAxznbjvvIuqP6QDneNRX?=
 =?us-ascii?Q?wtZh5uzvey9OR3KqKk4CO76sWbxSS9ewB2auJXCr7k3tRZ4uENTH4xZ6uGdH?=
 =?us-ascii?Q?eUQQZWvHn8u5CK/Np7UT2CHunzbM71V3EIycdZyyvw/6nyrfmhtziiYSuHhm?=
 =?us-ascii?Q?ocEQUTyRH56IY3DPUBQDb2HK5eRAcUDHr7K/rEv5I2yaJ4mGTcrGntUCzIey?=
 =?us-ascii?Q?ZR9s/VR4JC4t148I/IbQo1gLry5xsivm5JaPNh0O5t4QWKRXnDnxteuKOuIn?=
 =?us-ascii?Q?liu0NX6cJoaIGRCL5NH82sC6V6HRMAk91KZHcY4+BkEM/wWG+TEFI80/klCD?=
 =?us-ascii?Q?X9hrdFWvkL74Kz64nr2OEqJhtFVzLU8tmB/TbbN+gUTCUmMVdxj9wKKJ+yOp?=
 =?us-ascii?Q?hgStJMHcohzFAdYxb22mfGEblDLMV0LMlj3aFIGFCkUQkif3mcbrowy5QfuH?=
 =?us-ascii?Q?3FGGEvKNM/zj4XcO+8hA+05JCbQZBIzHGEHxrq/8vFDl9vmzL7YxxyrvxYkP?=
 =?us-ascii?Q?tTKr0r4c60fcSgeUOVre/UK1h+lT3ifW/YkWyQRM5Fi9iK6bOteEiL8TxpDv?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	DUefdZSURicbonnsOaS8f4+qOByGGB3f5ObXqzF6U2MXLQeH8l15SAq3FuRAZnSveOS/7X1PvcA1JNX1N43sLfzXvz51f953gHViqrXOdzx0X3jGZzeWclgJrPX6DWdRxffh+6uC6oLxI4EDNKh5KyGcgsRc4CJPBEZVidCZeR4kbvHlE7lK4sC1N7bhxOWZtofoGY1N9ny4YpPAXn7udyOzRSqwLg/lozO/zCKBGb3If4YDzOeVYcSWC1ee3fF80NQfnOZDck6uXmc+fb3C4lk4uvSjjEUS0bBSDqbE/CrZD85OOxYieoHiHp9NxiP1xrcFemVpoJkIIE0TfNFfK1b73GAYYc4lYvIKvtb2+rGYY0x/wleD0mQr+1SYtecbuccHbYaQRv93RKJwgeXEq+WBtJ+sHBaRTVjvMTyGsoo5XV0mWMZf574ZcsIdWfQrkBipzaR5Wxx3Hhiwvaz9wMF4VL/ArVjgc/ibtyCUzXJG7Npw4ABrpQ5GCp4c2OLlXF5wtpqXE7bKxzmUFPUfF7Ai4FekffOH53niz/dCwZjRpQFH3caM6LcDkpFA5pVS1PbjKbr4E97UVpoBeIw3BSitLchajydyQTu3xl64990=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73b2286-7603-4db2-b462-08dc965402fb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 02:51:15.5254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBSJbpHf8KipSC8DWkMDxiRJiV91MmeTFzDD5XIhrkz7Mh32DzLwPF7Q0rgT5PZsV1ffk77xDKNlPiG7NOKYSOgESw/1Rpr+zuNpH1K4tq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5142
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_17,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=903 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270019
X-Proofpoint-ORIG-GUID: AhpcHZ9Qj4ZAfelE0aPRLiWlh3uRcYxi
X-Proofpoint-GUID: AhpcHZ9Qj4ZAfelE0aPRLiWlh3uRcYxi


Jeff,

> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/ufs/host/ufs-qcom.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.

Applied to 6.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

