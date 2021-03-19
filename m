Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDB23413C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 04:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhCSDru (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 23:47:50 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:47204 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233668AbhCSDrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 23:47:18 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J3Tv72170664;
        Fri, 19 Mar 2021 03:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=0LWP4SqKDKNPoF9MJ7Jp2u7zX3b9b+8sE8cQSK7NJJs=;
 b=ZSjSAwTt3AwRd9+6/IMVZPmlr/M8rMfMjtlceV5WWqSk8y3Oypf5nAr3pOG54ah0FyXx
 Qu+R9ULqPwxVWxnVGmH/Du7MP4p/KPjzNlCWWxorAqDIp4zdSydm/2sTHPfIw/o+ZZMT
 rUKgS2Pc8GWcfEV0dfDjuZ9nF+U0FcF+gl4D9li827OBbcFt64Ml8yYM97/T0UQ4wI/a
 rr3OuHQK4mpCkjMi9JlUFidYJvkkYxkyAm/iaUvUO7lYla4YCFDGcTQ6oDCs4j4TdPkZ
 YxauAjUQkisEMeVRFnaCLb8gcj5ANI6OaCz1JXuKqtUQKjYXcoLacUj2bHj83aPhI/ES 6A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 378jwbsken-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 03:47:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J3U8cn175034;
        Fri, 19 Mar 2021 03:47:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        by aserp3020.oracle.com with ESMTP id 37cf2v0ds7-6
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 03:47:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM8J6UAWa9IJM3QtQp2nF1eC2Vbp830c/5EzvWs2Fjh+rJdp0GDrDR+WxRnz/kZfdBCcVBhzrqJRZ8C0B7RuQeQLGPb9krMDQ6184n0m69WFK60OsCpEQZLxJI9gALpoZFrcjCgNHTQQ2Beyqs8DXKIZ/rHo0/N6QMmRjH0tADZCzzGxfDh95J6w8Je56VpgPqDaiYke/3xt4r7KJHJAZ2GXJ+weBfCDB+bojTgMEHi+K4QgJdgjVT+zCYdGIwH0iKk3THHtY4mpKbAesoniWYjIkTx//75Ez0y5OcDvFdIfrJIgyx6F+nwed2WNSX0ObRO+TxLsxy7H/zsNLeRqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LWP4SqKDKNPoF9MJ7Jp2u7zX3b9b+8sE8cQSK7NJJs=;
 b=Bl4hUs5NsJ574XC8wM+zlw2bZpRJCt2X2nERn5+rkHIunOOm9iQ+dvmttwqL0qDFIfd2wk9R2WceX8/4nAQuwwtUHlrrsirKO662mPdXkxstScYyMX3ZZUfO85jdsFuFAvIITHcrZ6VTiQJcZBr3riK4jovuzNOuxqv5KaR8mTzM4DNUQxUJ50vHLYyphNGyD5ZHnBG/NBSWX3sJqjZQKFFsCGTR/CDM/B8yC0QfHX+c5b+4oZ2M7rOFdFRCgfmVcG/F39A7sztA+/X5CWIZaoYSWpuMGP/ts8rSz4MLeqDeuKVGcNmXRf8MN5iQasLps7ANmUGfzqs+AVMIAyqGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LWP4SqKDKNPoF9MJ7Jp2u7zX3b9b+8sE8cQSK7NJJs=;
 b=TtOWLiTrPJUfDfUejwVRvJ6nzCYLLPSvGKuj6QbY3Hlz4QS05GW9n9392BntSpv33K1BMEpSfdrF46Kl2GxmwemQk0i0GosfpSxKwoJGEnxa56vU/nfNTOPXLahqgKgOFh4dnRXN3jFzBk3BcmxYgy+a6MYTrplOnq1vGgl5YW4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4470.namprd10.prod.outlook.com (2603:10b6:510:41::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 03:47:11 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 03:47:11 +0000
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible strings
Date:   Thu, 18 Mar 2021 23:46:43 -0400
Message-Id: <161612513548.25210.16538113182511881021.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210204165234.61939-1-vkoul@kernel.org>
References: <20210204165234.61939-1-vkoul@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.200.9]
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.200.9) by SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Fri, 19 Mar 2021 03:47:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec618d7a-e12b-42ed-4a26-08d8ea89ad6b
X-MS-TrafficTypeDiagnostic: PH0PR10MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB44706A768DBFD8A5A4191C1C8E689@PH0PR10MB4470.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uueTsdb6exavY55ZYBXLyegbI5nTpsPLuRqZ8xFVYitas4bM/7wYvPGzAS0DPKRk3al8kRVHG+H6EQAkJp4rGaNHPqPRW6Qvb7wh2BgpV43GQqt9au5U6K6zniEAOkKpJjrvFN0Z2db1IwiEmWCn+ACSfoMZfZon8l9uqIdKiMirX94YIy1vGXKb5n8x1cAPAyiAfdBHxmlV2JBsaDDNIA41VXPp9M/3uO1gZBxhq3TEOg9I/a+QfajrBofHgXm4EIR6XnNSDQGUpaaANhWmIG/Gb/QgEf5FfnyjDf4KENE1Gksu23oKsBJymFxhtXCY4hzqBAwGPRWE1wpLenlCAJ484gbar+XV7L+pNer1LYpi+z+yZkedWNkqi91NzvooYjTLcLlkpbWjunA6UQhZAl7/suNGgOgl0N8oYogCbkWrOlxHMl5Mn3O1P8ilLn4RHJ/FpcO6+2SsLMCk3Q+PD4/13eYmgPn1lME37CQS0HUswij8+j9L6jByRyE49ymdlMsHAT91kncmluO9Soypn4iEIcAuYJ5IU4P/WfrQxZFtQBMbJTWJFn8KAu96U7yfANfJALW3+RAtKNaEXl/NJFpb+3wwNMTrlx25OIVjiWEJb8pfbavqfihCEaQGtIkIIJN0R8A9yR1liOD4m5L/dwABjEim0yBFpbTsJrpk6cQ+4jZAf1QFcJ5GVl5F+mUhHClfZrlHzF6TlpMMjkoCXdRUnhJSF/cZLGAd3bTqgqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(346002)(376002)(136003)(38100700001)(2906002)(4326008)(956004)(6486002)(5660300002)(8676002)(16526019)(66556008)(186003)(54906003)(6916009)(6666004)(316002)(8936002)(103116003)(86362001)(966005)(2616005)(26005)(4744005)(66476007)(66946007)(36756003)(52116002)(7696005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eVNKZFVYbjE1QWp5ZDZQUURrMmE0eXZDVDFHbzVhN20zT2J3V0NWTzJnWGho?=
 =?utf-8?B?NTBQaCtWTFd0d2RUNzFHWFB3YkdhOFJjeDJod0lsMXpnNjlDQ0RzaHpPMVp6?=
 =?utf-8?B?Qlh5WnFpL3NoSUIvVkNEZXhUS3grUE9WS1RSVUtYd3BlbnBMd2YwWmVCU0tC?=
 =?utf-8?B?N2tYY2RjRzBiRlkvZGk3THBwRHlicVNQbm5lVm9XMFFZV1BPeVVHcjVxRnhX?=
 =?utf-8?B?RXZYYk1KcVNPZWFDeHZGWnU4UXBsVThYdXl3YnNORHZsS1Q4UnlVNWVFSUhJ?=
 =?utf-8?B?Yks5WFdSS3JIY0c1eFRLYUtOODBub25Gd2FyUTNUd0hWdkFDNzEwTnBKL1F1?=
 =?utf-8?B?SU5wbTBYdWdqOGI4OTZCMm5pTTF4emZkMW4wWlRMd1dIK0FwN0JJWXlwZFov?=
 =?utf-8?B?SEQ3UEg1ZVdibmo0WGdFbHlFRE51MEk2NStyTGkxT2FtVjZObGk5RDBMWE9H?=
 =?utf-8?B?SVJ4eVFqd2Nxb1dRQXVGV0NmeFYyNnU0VTlmYXVkeUpFTjg5aEpzZDdNdVFJ?=
 =?utf-8?B?WWE1TTJjaXdUTUZUVzJCQUZRVjR0M0VWc2w0eS9WUzdNclBhNlV0Z1Bod3VQ?=
 =?utf-8?B?UUlHZW9RcTdkbWMvcXV6V0pMekhjOUZ2SXN5ZzNFN0w0Z0FKYXByeEV2ZEhq?=
 =?utf-8?B?Y0RNd1RuYnpRbHFubld4RTJVSEFpbG5zaml5b0NKc1JFU3l0YWxWUWQ2N3Vx?=
 =?utf-8?B?N1lTM3JBQlZQVGZCMnNsRjNUTkYvVk5LblNRTDRMUWgyVmkwQ2pETzlUMExp?=
 =?utf-8?B?SUIvdEZxNFdKWjAybzB2b3NVUFhEd29SYnpCcHlJd0s5NGZ3VmpCUWpwWFRs?=
 =?utf-8?B?eGxwYW92MFllSXBDVnFjSXhkbjNod0NLcUNSR0dmOStWeUtRY1k4dEp2a1hQ?=
 =?utf-8?B?cXkrYTdJMmEwcThrc2cxdUlGVitEZTUzSVB1eC95NUV0SVQ1ZWpZcHhsZld3?=
 =?utf-8?B?T1VHNEh6dnBMRFlrWmdZVTBMcTZNT2ZWZ3ZabDZxQlZEbmJqYVNoU2tZcVVy?=
 =?utf-8?B?MC9lZGl2TmE4blgwTkF4ZzVFZlRES2Zma2k4L1ZvNW5HNFozSVNKRmIrVWpL?=
 =?utf-8?B?S2VtOG5CdFpocWFkRFJocUh5SjRkZG5TYnBFTUZyY3BhY3R1M1d0TkdtMGhz?=
 =?utf-8?B?bXZSd2w3bjJ0am1tM29tb05pQ3VsL1ZmN1VmRGdjbHBRQ0lBMWFrNkliVnRW?=
 =?utf-8?B?TERVZCtpYWd6aXg4MVRQNG1uMjVqY2d5L3ZidEsxOHdicmVjR2ZZNThIZkM3?=
 =?utf-8?B?SUgzeWNtVVpnSWtmRmlIU2VXR3VjUEl5RWg2ejlzN3ZQYno3eEp5bW1SU0w0?=
 =?utf-8?B?aDEvUVhLVEJCYzJNQTlEZjZac1ZpV3JnazEyMFpQY2kvVHgxU1gxYzV1MGov?=
 =?utf-8?B?clNMUGNUQWNReHpHRGlIQzNDOEl0QWxqZ2FUMWU2d0VZMkU0VUo4ZEtmbEhv?=
 =?utf-8?B?K3BleTgwUDI1K3lUejNQQmFpSWVzTHk5dTVTcnNlN0YyRDNyK2YwMVNEVW5z?=
 =?utf-8?B?SXlzSnpkVkxzQXBvdTdzSjJiQ2tEOVR3ZzcvZWdKNjV0NGZWbXN5NlFBckow?=
 =?utf-8?B?UEdsdGVJUUpudlpMMGxPVUo1NU1nV3crbnptMXIyYW5QYlNWTTlxc1NHMWRP?=
 =?utf-8?B?dmY0RDJNbjZ3N3hRbmROOEVhaEhmL1pZMWVUTkhYU3ZBazFtZzJyclQxcHlC?=
 =?utf-8?B?d2lTR05mZGN0T2xhTElnQXFtM0d0NzJpdnVPaVZzRFFuRWJCemp2S1dsZXZO?=
 =?utf-8?Q?NV+VFFOYlL4gtTkEuVt75AIPVXbaFhrAlYmIw6J?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec618d7a-e12b-42ed-4a26-08d8ea89ad6b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 03:47:11.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrQKNJor8Spw1wkmg3/aMwxOSJBVSGT4gN/shh+skNbOo4nvnNZRgD+9UX0a7KnbDpaTgwPrCKf2wM3oBjfWy6TR0XpAR19CRodJYjWQ1jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4470
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190023
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103190023
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Feb 2021 22:22:34 +0530, Vinod Koul wrote:

> Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
> Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
> documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.

Applied to 5.13/scsi-queue, thanks!

[1/1] scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible strings
      https://git.kernel.org/mkp/scsi/c/4517e77eb83d

-- 
Martin K. Petersen	Oracle Linux Engineering
