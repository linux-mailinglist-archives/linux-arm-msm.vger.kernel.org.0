Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775877BF088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 03:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379327AbjJJByT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 21:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378764AbjJJByS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 21:54:18 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97739D;
        Mon,  9 Oct 2023 18:54:17 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399NxDBA002726;
        Tue, 10 Oct 2023 01:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-03-30;
 bh=7NZZGGLMFe8NY5R/eX6Dskn1jeq1PwPyAT8QeE1sZdo=;
 b=gHTfyO3Obp/IRpakYskQmbfIxOEkMvtXHl3WnEr7FmRsK3JCt2tmH6aT4SZIX70Hd1l4
 lE9hvcLoTIRs8l/dyk49/1bGvnjnd8O+kZoriZnHYanboR42Ahniyt9R7TI1fFHIYA40
 bkgqMC8767bXboX3xuFvHndZsN8MZb4vrAQEPSe/5rNexx8tSfkTckJScKBzLzwJk7ns
 0BkP9Oi5dt2SonCgWKOTQH+Jiw189btIufXJQaREAq9aEr0ayy7V1ueZvK7ZuHFc7CC0
 Ch8i0IVZoT/INPkCQGNtkAxxDyI9gO6tIiBCX0jzxUZTTebfDiuWvOlMsh8zjMdyl+mR yA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tmh90sd2y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Oct 2023 01:54:02 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39A0W3Ff015048;
        Tue, 10 Oct 2023 01:54:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tjws6363a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Oct 2023 01:54:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWTs4uYJoCYIOWBNVqJS0JbFX3IFUIk8ptx1GJ2UiQyRg5b3gIvuqileOJ1hhctZfPDLzCYmuM0L7CwHXGFOltqsWV3MX7EOpckMPA7Zfj86kPcL1JDACjeLy9cn6G6hje80YTgcCRLRZy54rudNehrd9y182vsfOsr4IaZdLimGoJPPbdfWIH2qlUfYqOHV4+xSgPxe1TomLQedLRu+53vPL4FijLL9rMiWToAkQZIqzXZ+KeRru61naXJf1+DkRJ6ryjlKAGj9HggQzgbVpsYwrAmLvGHzTqWFZtddGTwHHdwUbAKJP7c7oqHlPHfDlitE0p+gi6ACelPXX9nGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NZZGGLMFe8NY5R/eX6Dskn1jeq1PwPyAT8QeE1sZdo=;
 b=UQS+29PJrWFQMuU2AfJDRWlWDsJJzqLXawyvTB0K/4hAEY2Nac3hCtr+UVjXoPEO45zVx7/De4XcIZdmE88+TQ3KHuGAfBcoU3PgnLWiVGbg5MHE4oN5gszkZ1D6pX2iUYQ3XPuXKpGuf8jJoMEFmiNqkzNLIbNYN4k6Rofkl2iqYQAQGOQmssIFBCAXcSm1BDi/v8F4+PvwDInbROP4tWi321BbjQuyN0l1xr6B8S2dUuy2sMTtBLIQxPi0U6WGZn/2Gcd3aPtzPn0ZhkuVX9FHGDMDmZD7dpkMickAVE5y8RwBcjgxAk363Puh324QCQ19jqQqTQJ+tviLK7o9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NZZGGLMFe8NY5R/eX6Dskn1jeq1PwPyAT8QeE1sZdo=;
 b=Yw4SZeCVhDpWnhnjREhub9sm4+Z4TYMnv7WbictAP6a7WZ/rynlMJqEIaADpOm6StPFzorXpxOcV4v7ueYCTyC4SSLGb6c++zlF+8ClbXyNKwBoGo23U59yLTIw4DP/9yftcCpwgQIKrYSP41GXka3ApS3cfr/VFvoxfgGdU55E=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by DM4PR10MB6157.namprd10.prod.outlook.com (2603:10b6:8:b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 01:53:59 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::1ae3:44f0:f5b:2383]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::1ae3:44f0:f5b:2383%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 01:53:59 +0000
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: remove unnecessary check
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1fs2jnsya.fsf@ca-mkp.ca.oracle.com>
References: <fe3b8fcd-64a7-4887-bddd-32239a88a6a3@moroto.mountain>
Date:   Mon, 09 Oct 2023 21:53:57 -0400
In-Reply-To: <fe3b8fcd-64a7-4887-bddd-32239a88a6a3@moroto.mountain> (Dan
        Carpenter's message of "Mon, 2 Oct 2023 10:03:35 +0300")
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0035.namprd11.prod.outlook.com
 (2603:10b6:806:d0::10) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|DM4PR10MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 358157e3-d29b-46da-ff0c-08dbc933c543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPJo6Nde8Kd6G0dISl71cm4J5kdjLt00ubsFOj0WpwBHyAyGR5qGY3xo6BVwzkOA9ztnbORjmMGzx49oLy++9wp1QNBTeiZDTtpwzxAxpsWC+7V7g1lDIWjNCCk7Dk6c8KGIYkGlwizb9uWZvYp2Wg+jypn9Vf6VpBWxkjXM3q+0GljBkZkX0mfVFz6MLUcqo15/31q4aCN3PNcHyfCE3UeutW6ohaFMrkbnfbtxzeZuKJSvBlKwo4W4MpEDXTacRTofCjRkzsuzbS4rLpaxbS5fT8JX8DL494rznCyVTkXOW2ze9JhKmMS0+1So+pfOB/i+CKhNdsruHAE6LAxHKhfLdPq58dppKCZqKCK7ie6b84TkMwGMgJv9i3vCwSD8oVN65FhojvfEWJU93mrRDyFHo0wAmKxp68ovEbrOUxHDcDGuG57CY9/kvv0hvdjj5PXlv1Ad4Ig9svUtDMq8Izm33Vf0Sn8mYFJxNNGWQbC9jc+t/0BN2w2rwdxiP+lPtd9f5p0ZJKFplMDujKoNHXNH6yQIrjSUgRDVd7RSSSX4FULCdn/8annRT1LyDKDr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(26005)(38100700002)(83380400001)(8936002)(4326008)(8676002)(316002)(66476007)(6916009)(478600001)(66946007)(66556008)(6512007)(5660300002)(41300700001)(2906002)(36916002)(6486002)(6506007)(54906003)(558084003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3fj8/gV2qzH0PGOwjk0AfPT2jMpCubJCJ0BWrOfSVKcKl3ZAGwpLm/smxFdf?=
 =?us-ascii?Q?ndy9v/wYvgKT6ye1SOnxP7jIsBrL6cp+Zeqxwi1prc7H58J83ATqgXqxrDQv?=
 =?us-ascii?Q?syOoSKDYjgOEPHXbxYwV6ZiX5XNSsgJA5wXHkJcpA74DyZo1cN1tYAcfyxd3?=
 =?us-ascii?Q?sksQFD6CPlQp9x1MXBEedDiWJJ0nSjvcsRAPfkit1uF5cGSP+OPpsXNMCTY1?=
 =?us-ascii?Q?A9gNrUhpiegMWbld1i6fOXw2GDrEAw3o1KUbbmfRT6k7mmjTEyohh4xExVdE?=
 =?us-ascii?Q?7isgWuPb4AdHZ2JW9IFuNx06ZOO7INxOCweReqbOTWa1Ry+IZH5TmArllA8N?=
 =?us-ascii?Q?jnWnReet5dsGwv9ZhQyREiaRcCzMYNv7+t2lD4BGI2+pQw/CXW/ui0qEr+Yw?=
 =?us-ascii?Q?39lXfP9M5yTFRg0cp3SDSY1I16Hg9DEKRaNtpyFCV4/+F+HGrsX+MpLbODvg?=
 =?us-ascii?Q?68lmVMOJGEK0KQW9ZDUli2T+eLfv2x4nU27uBkK7D62dw+hjaqwmGpYKmt6Z?=
 =?us-ascii?Q?ewGocnpKQ2xJ/mVuEOTMbiseUWIOlRuNmFCjgIN6KdLgDujUP61zkXHgCLGT?=
 =?us-ascii?Q?UbfCmt/tY02vD3o9NvEFZ1+JoisSDvzJOwU5BFasy7lsOrRL+H0zyk2wvmed?=
 =?us-ascii?Q?+aMeIaahbJ+4PRnD6nOKqGQWi2h7KKLo10CWLdU9ls7XZ4JZYWvetPhAgT5o?=
 =?us-ascii?Q?V9U2x2AfFn0ek720imCMj3dkwcHLyZSbXpuqohcPqG3AIYhRbzBi5xqJHBRA?=
 =?us-ascii?Q?4nmXEKgp/3nqu/gVELdH/GC31caJag81HApfYRx8v0HoLZscc3cp/nIC/0MI?=
 =?us-ascii?Q?XRff1wiKHPEqib+AeAlsA70dsO2g96vmlbB9jV8zktIkY4WU+7j4mSA7o9Ml?=
 =?us-ascii?Q?LjBJtL1/FKFZDRZOrXqiZPQ4cMsDGNvht6n+rp+FVlb+wLIR4q/kSt1E5xeL?=
 =?us-ascii?Q?bLYqtdYylqvxF5hcw0Fe+60tl5po1eHL/JvkCoTILxUdKIIeHPeXfTYmn06/?=
 =?us-ascii?Q?4MhzCOaPa+x9eHmU+g1c9OtpqNhk3cTvO1EYA10ZwgdmmJDD0C74BHdToSv6?=
 =?us-ascii?Q?PQUaxW1r+pE0v0/EET/3NMpKCtRt+2xbBtWibuH4xDa6oEZKKjV3OQqWVawY?=
 =?us-ascii?Q?fTiqdscK/med6V5U8OTEytRhuaKn+OJYhoMEmjkhLlAzQ99uqC+mGxncL9cF?=
 =?us-ascii?Q?lm3idGRt/ZHv65wRxhhtCjrlyN2zg3yeeCF+eCi1ju4UGDW15MOQmEgfHAnX?=
 =?us-ascii?Q?EPHh8k/MjA/ah+ApUfCgTlG6fEk3kLlAm5wWE7ZRKuq7a3iUHKEcuTU2Xv7i?=
 =?us-ascii?Q?byRg6IAkYby0eUxE/jA/ixz+DZ2kTJ0emcjN+1SivjO/eXWVpvxRmUnXk3uu?=
 =?us-ascii?Q?loui7aHRCm5Gy1nujelp5Iuxy2LleCYXmatxP/o6E3JVudSEZqLjg+9S2NCm?=
 =?us-ascii?Q?e67baGRUNaTQRk9WPpjw8jWqlJ3QkNAHy5Pw0nvPeuaBlf8PqKN5+5rilVU7?=
 =?us-ascii?Q?j7YECuXTre0bVnW69zHNYgcYUY/vbpYl2Vr0M1Yl69z7uExtGGFSlDc+u7CC?=
 =?us-ascii?Q?89YyQd1pDrxvZ40L6c3aERKoUwyNVr0WgGA8gbieTaL9x7rxfgWnZssF2JYb?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hQQJ+lZ0zMG+brqPnybgc8p+WTXzIn+oM1jSLw5UubX2mwPPO1WaUUbtpAmiR5hnq4ghIq/N33zOR0SQ5o4+tb2PrL8/eavBiF7ZUhmu01k2Lu0l/bxmyv+HiCoosp8jqzzzQZ61ora6UdvmpF6TLpNx99nf8sQUWRXKATbEfKmTK9zS1fV4gro1BQDj8DszGNFL68Mtdwefv6KpIDFKeoM3DNqMfx20eFiGW9jKAO+JxTpM5Qb7D0LA+b0pxBnN0bRESKRXDJq0Jp88JAn+vvTHrx3FFeusd6xnR/0GKchkEFRs2lmPIMGrBXgc5RPBGLLHFP+ePbJIN/86EZZ9qJfB1L8qkboH770sT7uVBliwi8AlwZDIEua408NwV99xnE8V7gttUnogBxi78WBAewIHB33f/EJek8D0YeabZxMOuV0rhSvpaaE2f0GZwd8Zl1e5jjzXPAG79XB0OYD51+AzSmV4/zzOFUqaNRIbg0N7CxTSUoyu0TVQLlMC5m79Vpyou2apuGNqv2Q854GhgNg/dNYgRTupsg5w142JvEy5I6DD3MT2MlwUsG9tZZOdJMeAWSLxORzmonwni00vF+DghOnzlW4hjG8OIIiQOWx57H6STVgzfTA0mUh9e4p250mBiJjAoCECooCWqJakInbGStZzxPsmb7R3+/5uLKqvDLEuoh3zQEbGQg11IVFESpnGIK2UUiKcYdwLcce76+GNPuEFtcLvYydKytYGgWERsv1srTnKW9bA3NOzVksf8mLluom6hXqNRkB5LjRJiRxazhcjx/nkHyLQGohEg3aZ1iTD7NG7QfgprOSo4xEhiCvjx1QNMzLbnJWLsF6b6zi1r8f5gHaYDBnIMbxs0PM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358157e3-d29b-46da-ff0c-08dbc933c543
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 01:53:59.5230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONmDQF+kPfAr9R+1lgb/WSzzKcisuyZ574KLDmH875mFKi1793SiNYDoYiLqmPKhnHXYmnP4/0xPs1NbIxzVyE3uL+m9uOx4ws1AjZGkbw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_01,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=749 mlxscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310100012
X-Proofpoint-GUID: MaTZOnXzyk6hjEaYYbOs726CuEtnXkxv
X-Proofpoint-ORIG-GUID: MaTZOnXzyk6hjEaYYbOs726CuEtnXkxv
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Dan,

> The "attr" pointer points to an offset into the "host" struct so it
> can't be NULL. Delete the if statement and pull the code in a tab.

Applied to 6.7/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
