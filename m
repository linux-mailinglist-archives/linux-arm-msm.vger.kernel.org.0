Return-Path: <linux-arm-msm+bounces-12624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7845A868735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 03:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0511F2207A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 02:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DCEF9D6;
	Tue, 27 Feb 2024 02:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="haw75jwh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kh0hdO95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127086FC6;
	Tue, 27 Feb 2024 02:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709001202; cv=fail; b=bWOy+wBH/CiMcSwvzzkybDGfgSmpdUUIO8oC1sMJ+pWeV7c8Cwrapv4z7fKJU9/qXluLb6598C3JrIWuEdJzzaBP+odZRT237aumvChm8IItjNMjPTEH2nnbQU5WxKzhllxVRQGj8/tplB5vQfc6LVIXxjy7TnxodhQNzSK7lIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709001202; c=relaxed/simple;
	bh=0+lrj6sbkGxzjsFomO+RQai1anm8OeUB1U+cqmCPtyk=;
	h=To:Cc:Subject:From:Message-ID:References:Date:In-Reply-To:
	 Content-Type:MIME-Version; b=C3w/lxH+KKYQEiNlrvmHGlAL/+WEAss+jE1ukvajcw9V0XsklyNhGgXZwVIQsOp+hsn/IS9u704miePLby6bLZDtaznK1C+ekduNFIGmR0QlHzvWoyNflb6RmxWH+bTqEXXGMV79n80E+rGfvcpyzWeQaLEPpyf+fV6YEkVoQv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=haw75jwh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kh0hdO95; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41R1EAPD002943;
	Tue, 27 Feb 2024 02:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-11-20;
 bh=k70bm2jXx8h2tsKUi6DoApy1uK2ENU6+c71TIhI0xUo=;
 b=haw75jwh5+fVMk1TzXNbXcCLWhY/sCZVHlAQdMtERk/4DwEiAKmbufU8yDsRzfJIRcmE
 7Yp+kLiQeUyTjcP9D7UxXeMRG9dzbl4u1huVHmCQ89kU+h4BQQ0bvgNYQEM+B0UoHeNd
 NnNyZJmjFg3IfL01A/XF/4UkIJEXyu4jNvfQSMyvaGuetqLM+wm0eYa53BFZBUTgotVE
 wP9wLgW46pnFkpl9dp/NzuYgQdhBQQJGaJg5n5meOhMykee52MHBbGf5V1En7VXo6/IR
 JxVAGiDBm0+sYjSRu+eA7OGCTA/PnuHFBBZ3+w+Wo3PFiX6nMonjXqSM1dEUEqoYMMdF iA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3wf8bb5w7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 02:33:09 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41R0HMwQ001685;
	Tue, 27 Feb 2024 02:33:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3wf6w6gxtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 02:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEf+qVBdag91NQnzkRXkDoTxSs1ppKMCFLLb5Rbe+vkxzPzByZxwZqi5RpPEnac4XfqZNordKhUM1n1buLJO7/O0JVY+BoXEzTfaM4KqcU+N/YwFJcDzIFV2BpdRn+/BOaxihThLfa48geK7q5yN/mrExdyp0qcAWc2nl/DSmbsNDKpPtCNlAvGkir6EuNqn+HOuoNd9ts1ubjMEmctpODCCS7tgh2RM1kt8riMwaNOqLvNwW87mdD/q9rWlGuw7tgQyFmiOkEeykOp3ej4edNnQCvHpq0ccUikkpqIeDshBSPHRQfvYAi4CiP1VE2W9Meww06FlsOlwmtfTbyqoEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k70bm2jXx8h2tsKUi6DoApy1uK2ENU6+c71TIhI0xUo=;
 b=lbQ9Xi0idTaRjhvF04MvbVYptbzEYxjYetF6X9B4gQIEw3HXaAMWaWxvRV4kVKiarbmNEH5ZD9hzaWYZp2ghmWHJyLT/N44DTg5h4y/RSUy6+ulVmUUwPrvaFjuGpWwibyh7XUAWKKl4JIW2PrPmNvml9JyShWciqyicIaMJCFm+pIFyNr1YBYFE7aNHpxtI1DJCMupIlVK0N3q6Us+7mxqZtkpnUHFQKjltZwQX1NkRMXaOf7uzlrh04xSyx0yfTbciKr6WeecyuCqiNLrGaQ8b9Lmpo9TvozAOWTHfVQVpgzRSNXMlHnJ+0hlz7WEOOTiNdpjxdUnLJvp+UZjkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k70bm2jXx8h2tsKUi6DoApy1uK2ENU6+c71TIhI0xUo=;
 b=kh0hdO95R07xEVNT17772vRQLisJaocthMZa1hlA8OklB3YD79yuBWZYAreRYesjVUddsjWid8P+ix3crJ4g1E4RakGNG294fKCHSKdEyDpvji9Iu5/EE7Lx2UOVXIlMjYjHzCkBAIp7e7ohA9YpwmZDGyUnGYuNW/gg9DLbZgA=
Received: from CO1PR10MB4754.namprd10.prod.outlook.com (2603:10b6:303:91::24)
 by CY8PR10MB7367.namprd10.prod.outlook.com (2603:10b6:930:7a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.31; Tue, 27 Feb
 2024 02:33:06 +0000
Received: from CO1PR10MB4754.namprd10.prod.outlook.com
 ([fe80::e542:e35:9ec8:7640]) by CO1PR10MB4754.namprd10.prod.outlook.com
 ([fe80::e542:e35:9ec8:7640%4]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 02:33:05 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio
 <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Nitin Rawat
 <quic_nitirawa@quicinc.com>,
        Can Guo <quic_cang@quicinc.com>,
        Naveen
 Kumar Goud Arepalli <quic_narepall@quicinc.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman
 <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross
 <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/5] scsi: ufs: qcom: fix UFSDHCD support on MSM8996
 platform
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1o7c24oyt.fsf@ca-mkp.ca.oracle.com>
References: <20240218-msm8996-fix-ufs-v3-0-40aab49899a3@linaro.org>
Date: Mon, 26 Feb 2024 21:33:04 -0500
In-Reply-To: <20240218-msm8996-fix-ufs-v3-0-40aab49899a3@linaro.org> (Dmitry
	Baryshkov's message of "Sun, 18 Feb 2024 15:56:33 +0200")
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:208:2d::22) To CO1PR10MB4754.namprd10.prod.outlook.com
 (2603:10b6:303:91::24)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4754:EE_|CY8PR10MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe873f2-1a5d-4923-49c6-08dc373c6dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vExP3bmiwB564VapMDSN5Wk8E69zhLW9z4jcYnyFg9dft7jJfEmfBPMBQrp05XAh/idmFRopPEBaXROlmREUtn9A8sJtS/3Qy3agRZfj+gZgRCZihZg7i0xT9Qwoug3fukU/imyVRMAr2kQ2a83o0NUA16h+9lXZQ/ag6GZBAY+j+gxdxtC4rX2PlL6u+Uaz35qkoXoTzNVVQ+KjSwiJzOi1BRPk+LB+bv/sF4JkzjwIKEMQu9z4JATfdtkDZsvP9PXi5cjpzNEDDXqyg2jArehVGPpCYbOLOd+kLo8eWJGQyaqYWTpNapgakSgAUIilBz17MK9lfwCKa1+zPwbVa+WDWdsTdT5y4EPvTFXUqVZg3sqBHf1b8tWRAuccieyg1f6EoPlSCThvUc10TKzGI9L0s24+e6d8GUfxtPl9KTLbGcym9V8dIpaZ8d7MNYyHLoW5oNnMlEJOqQS+95kN1K75WAQsxgJCvYZNOb3IeFeFyEMso//rnJggBER3kbhLeacw1KmzWt7UlDg+1DPNJo6WwuRKb+OPtIBcMMZlq/pytxR9g6BKJfqWV2JHX7gRwrmLyQsud3ckVZr8zikjelmf0fIjQNesayWjpz+/2ZdUbyywiSd4xrylnH/iP9CfXfZb4TgOU8tRPu5bsx3vwA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4754.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X195yqy+i9RLzMak/sx7wBU9UkEwFVt8s973JNtiS+ZDxgf2wm/U3llWQrh5?=
 =?us-ascii?Q?VyZwwawbSZpGc57QDxJBWBNAMcBaPshK4ZVB8yPym3YzzWGDq7VVw45b+LCj?=
 =?us-ascii?Q?TUSOoeNKf4b+Fth2Ve/YBrxaKzOJoWSLntlSAY868kJpYxooVfMzedjStTQr?=
 =?us-ascii?Q?bgvDbW/iCqjU0rBngowAJ1ly3mz2gMdvLhKw4JvBzitXyyBLIbgo2kR0jdSG?=
 =?us-ascii?Q?ia9GPPy2VCbAv5fg9EPA0guAd9nOgtkAly0XJlyzas6EYOjS1ifEEAWuPRaV?=
 =?us-ascii?Q?GRVgfuiidR3eElPHAhP8rWyNqMOLA6ON3JVAWU/TR/l9VzX/fz2oqnkx6OJV?=
 =?us-ascii?Q?IFaOHZBmTDboMB7teg0l4loZT/Mh1GCj8Vs+q3Ruq2H+LV2RMiw4dMJCVlOz?=
 =?us-ascii?Q?8DTBzz9f6RK6FmdRGxSF0RhCOHFoErzVgop5247MI5j4C/8sB1hm166X1+uI?=
 =?us-ascii?Q?pu/gOIjjbHceoruCHpT8a6XiSU6TGjViZvGqv9yBIVL6UNitkhB+Dw6ukUdV?=
 =?us-ascii?Q?A5hjVxu0k/y6i8fVu439m/nSBTvgtApxuxlxQPYxxmYJ9wZbaPwygquaYYCX?=
 =?us-ascii?Q?dwwNI79sZfOXM0/T6ZFKAlcmiV6KlBgfZyX2OqwOAOAKjyB3Zw6gOCE0HSEj?=
 =?us-ascii?Q?2GB/hme9nbwgoyZ8A1Jq+lJpyd98SLBl+/FaHVyZA0sfTmFh1YKXgk75j8i9?=
 =?us-ascii?Q?g/X8uzQz+vOe/FgZ9+B0b0U8fJ18ZaSTJjAc+gfFfCjkpESc7phlKLezc5PE?=
 =?us-ascii?Q?/K2rU53J7B9KndvwSMGnEJuc+BFrM5dXtuGJ7yChcJslT4sITRijjULPvr6s?=
 =?us-ascii?Q?utv0s1qtyEaH/Wlay3l9Uwtxd8XPoNCxshVRur8gs2w/kh6JBLFRIBF+xRDH?=
 =?us-ascii?Q?cJoyNSXhAYJfBVlHJP3gzAtQffGD1eIyIzeNEQBcCbpUgr7MGTaU2Fan57ID?=
 =?us-ascii?Q?vUwb3eGmfGRGysdC3sHWmUdSPCvZiq1kaJ1d5M1XpetDwDAXyNf46pcEG4lh?=
 =?us-ascii?Q?l0uM50V2vRa8TZ0oH5rVATVhhNWcdvXA3d4StKqo/0t8IxkhGyJOh7TYBNAw?=
 =?us-ascii?Q?wosx7iAUa+/byTlylWi3F94cUmRwpABe9mTD8xHeyB3sefUUD2sWq2eIWmKG?=
 =?us-ascii?Q?Qz2qiJ2tupVF1IYevtf+jd8JGn8o5Z2PuAq/PfnGadhOgKmOFzMe03lhv2hG?=
 =?us-ascii?Q?xyzueNtUHJ4Gb8jInXgyRhHIwy+ZvzPNfeXrfxEGpmZhOwBeURzeuaUR4nFK?=
 =?us-ascii?Q?zbtdFzRXBHlfmA2rtDBSMogc0LkW4/+/wQTIwsZWEJ50GvGHKJT5M+S/X4z4?=
 =?us-ascii?Q?E/dDk2Pc55viUVBPoGlnJV2Cc9B0BVqeJXkK6yFI0cdtDwSQNkQs05BPBYCy?=
 =?us-ascii?Q?3V2POXh3O5Tv3ChDekc4t/I1wehqxGC9Mkmmxejn6qogLM5i/ZmHQHc5rtk0?=
 =?us-ascii?Q?mkPe1G+e2V3izGoG4D583nUFhJikGrJyJpkra9N8YiYdLPb+jA4MqORLxoql?=
 =?us-ascii?Q?neR+PXtZ2Jplj28/WUHW7mhRurNqQ+zD3IynH5MgNXo+O9mlwnQc7PM1UX5f?=
 =?us-ascii?Q?yvG3+8Xob0hHLXE4GQk5+HDs3lOcbstysp68YoLf0Beqckla18ip+KBXuo0F?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fYTQth3Qg+aVl+HOcRW7cMH7VsLM9AzaaEvpBcjCBfVYOMCwCb2v11B0zxb4Hoyry+INt4oY16hFPs55Ji721WRgXAE2dlhn43vMf5CZFu4e3DW804Ai7G6we4NNLM1ttaW9nHM0zskG3UolucIDPgdZJqS5okRS0yl0ONjP3mi1THtLYPp/Wd7R8tAfowVLAHHOceJs36AN75GhSQgwlVVuCF7ERpJX2Nt6eTE51KxXHoB5R0xlP7yaGDsWKfYg3evgiErfGADUWKhbUN7KtuBl56RPPrdC4AjngLQ99OLfPN3LZnpsAb6Blm9nPVv8wsezIhJJ04Gj5t/Be/HUfj2wvG7SgGxln724DsDJO9BdUCm/Fp18xmcg+ss+mdrl44rQHvb/Gtg8C9uUm1f67gyqdDGXi/gE1N3sDruFrZqqu9BVEGjO3JD75WvfDZ3Q8HKG9ww6Q8SFLxd/cf+4IRywacvheiLTqI2zd7/h2+0wxqfrUIAB0nWUIKGMisehb/5gkaicGB8hg1bV3C0+jQYYuXBho56Nj893r1Z6CHCe1Zxc29k0P7eNBQ9QUFCJxTJ30oO+Qg8GPiTexWCtnHWc0HlnUjz+fXsjmEjKC/c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe873f2-1a5d-4923-49c6-08dc373c6dc0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4754.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 02:33:05.9348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMUQ/RIKpUAmJ66ha391FfKtyDppwroDu0TUxTvd6EAs2dGlZvDsyZhvsX+Q1dABbe3RhJeDteXWtPH41SxAeyXKkaLYCmmRe0sUPo2XpA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7367
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402270019
X-Proofpoint-GUID: ooq0jAblNDqNe1e-CmQyV_9TcF4oSOuM
X-Proofpoint-ORIG-GUID: ooq0jAblNDqNe1e-CmQyV_9TcF4oSOuM


Dmitry,

> First several patches target fixing the UFS support on the Qualcomm
> MSM8996 / APQ8096 platforms, broken by the commit b4e13e1ae95e ("scsi:
> ufs: qcom: Add multiple frequency support for
> MAX_CORE_CLK_1US_CYCLES"). Last two patches clean up the UFS DT device
> on that platform to follow the bindings on other MSM8969 platforms. If
> such breaking change is unacceptable, they can be simply ignored,
> merging fixes only.

Does not apply to 6.9/scsi-staging. Please rebase if you want this
series to go through the SCSI tree.

-- 
Martin K. Petersen	Oracle Linux Engineering

