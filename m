Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F79666A88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 05:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbjALErn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 23:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbjALErk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 23:47:40 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6951FD132;
        Wed, 11 Jan 2023 20:47:39 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30C4Bm0d027084;
        Thu, 12 Jan 2023 04:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2022-7-12;
 bh=nEt5mDA/ySvpk1MRXHx3HENEDLeM87ruwz8N18+lGdw=;
 b=OpfKmyjdWYHSBalVCIs/HC+oLg19IPVNH0yxhxqpZoehfcE7RN0BNAbTu7JWJJIhLZDb
 RefmO4rYBNujp3kepL+t6KGBNLomzIhPQAq+F7zpvCN9fHWn5NX7Zdo2uJtCcE6t97tl
 S5Kn2LSCXkwBUGo6F9HdHL0NbwbNS0efmonvUKvjHczTAnY85Hh2xvOxLTcb7rAFfYBS
 UtOXXKQ2b8jJc5tO+brnFRQopZ7pVcHPM4mI/yf1hkOOfNhtwTy4EAH4jLUnEzM/P1Bs
 QaPKjY4gZpIsKcSe/CjZ+/25B4k2IZlujS1tFd8XNWoDUVxItb+7uUCzkhGTnM7UEopv aA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n185tc92t-11
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Jan 2023 04:47:30 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30C3MpoI016150;
        Thu, 12 Jan 2023 04:30:48 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n1k4q6a6y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Jan 2023 04:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZsVUvrOBafxqCsDyJxjD9C/oVZycJddMnNv1qSMhhCi3AYrv2MTyE/8HB8wmtdwPuxDy9iE8IzxxKdZzmVb0a20oX/zAUdRvfNrE2/IiqnZg7DjMd3McOc2IfmdAiBJN/NNvJP7UfRxe7fQEkcXvd4wY4jJrLLHosNOLsjrNh/fW46EJZP6VEGRdTCkt0ZS9WpABXqsrrHNGPWFNGvnxAbi/uPAGDLhPE2R4GFi6/sAlGTCWIfqjfZbJFfZc1jgmifoZPpHILh0yMqA2Z9ML7SdgKBZZQ7SdiPaxhIs79TqUnjjIRyvmiFlYt6sDpHWdEMXaE28mPEO2+dr8NWKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEt5mDA/ySvpk1MRXHx3HENEDLeM87ruwz8N18+lGdw=;
 b=NVE6KAyDyHodRlKsuh6Rem2EDG5kL5uCS2mGJAbT4CROTPmtiYWlS/PIIjd+nY783hwVDSqKemBmXxEb+NriaZ0457A60lOdhW+u5K4+AhrAy1gnVwMDgL+qwJlMmX+1RYvUJu+6WoP7/b6W6wA5bnTERWTVmSn1A8YqxbLrsXgTWyyqQUE7zZ49Tc19kkAguHKqTzsl0t7J7eN5DbQFFOgVsWn/IQeuxA14phea5jWapROiJ0kUoN3aAAZEIcxWBtu2doF/ETddWJ/hY55kUac5jewvvrcWSeu6nqbDUc3ucWP7rWae8EE6Y/4rVLiX8ioyDtj2Z8HBMWDmp2HLvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEt5mDA/ySvpk1MRXHx3HENEDLeM87ruwz8N18+lGdw=;
 b=jkPXsguOarlIWgpR01/T9hJIhMRKq/iqr8zZ5hbsZBOzqZxE2JcoD81M6JNs5wHzHEnQ4ksfDD4SMtHJA57RrKwr3mIyaheOOGPXGTpmcPp3h9jnIXVAKu44da07LJljtNsrc5j4C81GivJDG0bDvSKTGe8qhVHyt8KVLPP9lik=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SN7PR10MB6286.namprd10.prod.outlook.com (2603:10b6:806:26e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 04:30:46 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c7e9:609f:7151:f4a6]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c7e9:609f:7151:f4a6%8]) with mapi id 15.20.6002.013; Thu, 12 Jan 2023
 04:30:46 +0000
To:     Asutosh Das <quic_asutoshd@quicinc.com>
Cc:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <stanley.chu@mediatek.com>,
        <adrian.hunter@intel.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v12 00/15] Add Multi Circular Queue Support
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1a62owf4i.fsf@ca-mkp.ca.oracle.com>
References: <cover.1672771664.git.quic_asutoshd@quicinc.com>
Date:   Wed, 11 Jan 2023 23:30:37 -0500
In-Reply-To: <cover.1672771664.git.quic_asutoshd@quicinc.com> (Asutosh Das's
        message of "Tue, 3 Jan 2023 11:09:19 -0800")
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:d3::27) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SN7PR10MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: db57915f-6df4-4a1e-781b-08daf455c628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCdlCgMD575Sn/xhbwl9fImPnnn6q+5wQgLv8mD9+9Ax0xi7dGTmkxKGBiAy7V5cWkMkDu1F/CHdcDmawhiEwxkY7m+ejYfVf2lovOcEDKsPDZYRlBZ4PpEztIwq7tXIbYZiX0fU2DyzIRCnOkAs3o7tGI0i/djnUBUMOcJCKWCVupO8DsYro6LKSE0cszDRkQJFdE7y4WP/B0H76M7HvIfJELWu6Zk0QnwBtMtv/pE3j9vHnZiR63ZyhgGhe+e3mh8uNy9fojKRVyEwdVsRs5SJZObnIvyFGW27TiupZgB4ODX9bXWZQ9coHNYHeB7/ysTjCDR1r7gwKabhP/HSkXYBwoJTrkI5xY1HarsGUeGW4CGuXqJUTfWg/7kB+g1wuP+Iv6e9iCDannItMSCxYCd8QXe/vrG+r/WOwcaSH3yKppBmhRpqez74h4ROWyQmV9WsAYxnwFj4dXNvyuK7pnreu3ue3QVoKLlhLWs8zozgRxus+kD2me1Nsz+EFZhPIyXj411e3M9PX/Uv26pehxvf8ebW0fGWy8x5TVMOEpWXzHwscjugEBqBbqzsX44BQ3QC9i+5fbo/qqibYs7LYBt/7G2+0daCFytBzq1Ppl0EI/FTgBD88BNfy8nBBQg0g8Aq38NimYCe3QhPyfyNJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199015)(36916002)(6666004)(66476007)(66556008)(6506007)(66946007)(8676002)(6486002)(478600001)(26005)(186003)(6512007)(6916009)(4326008)(83380400001)(41300700001)(8936002)(5660300002)(7416002)(4744005)(2906002)(38100700002)(316002)(54906003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OIJUFCcnD/aCIFTLyMdJPJ2QnNZRCkE6c+h+ORZ3dR1QCmmDr+45Re0FeQ+y?=
 =?us-ascii?Q?weHN+rBedgjNDk0+FnXb61PpuvsbtBVOeBx1PcZ2q6PxDOMp0Ca/dD1VNaKV?=
 =?us-ascii?Q?GHmFmb4sYZ2yG6QYzswc8WjghKOcDdQ47Q0f9NlecTPUqwwnJiKByJHi6WdQ?=
 =?us-ascii?Q?aWoQ31OkL3cuf6wrvk1KdTLcruLXl4WbkCWr6IPOgUbZRFD4nC5RUjCk/kGi?=
 =?us-ascii?Q?UMy5XrLBqEShMDOlc3LI06SSivyj83ut3B6uweCA136ADsxgxAUyDsT85h35?=
 =?us-ascii?Q?GHVPK+AYKJCnTKv2DzL1vU+kSnIF5MC79KsG/ThtSaiKlLXSD1d1+jnMb1wE?=
 =?us-ascii?Q?pMI/OTgQeR8ngaFzK069u5EynAJqfApGjo0NR4TUr69ccRqd+2ASxlMUfH9b?=
 =?us-ascii?Q?j3JwHN7JNfqOB6WFieXcV9cbk8ou5PGj1zgKQ0ZoyBr43t9Ss7v8V7rMT8yF?=
 =?us-ascii?Q?O1DO1Y+IG/zRbMuMiHEM8NIVUT64pwqPI8ovQLnNHfafQ+0yAykZYeYVDXSe?=
 =?us-ascii?Q?hdEI/bdqicQYNcgZnF7BT/2YgGKQ5S90IUufH/farcHu9joJN1K6RkHZMUcp?=
 =?us-ascii?Q?TAFhHIFz9IZvtDXgFVPiObv6pS/7J+GW0MuhwccDS4HfauyJ0KLT9Wxc2UX/?=
 =?us-ascii?Q?7iI2owSC4hFLF9CQDBPsMRUfAqorGwlEZndN8hl2yNwL5X8L7f7SRZGwMOcU?=
 =?us-ascii?Q?7ufxDbuLRySvbkQTJUZXFVMxfmVa8Vkuxk9kFTiz5MQa1dammjMiFZ7mMAGt?=
 =?us-ascii?Q?3tckOCPA6EZpbrSP27AsSTM2I7KikIjBpuGybv4e0k9Q1A23JMPq8c5zeS+t?=
 =?us-ascii?Q?jaHLL+gnrxVqOj1wkXcfiAVf4dLBQEctXG23QAn/7ycarW/yVdhFlSbZREsQ?=
 =?us-ascii?Q?9RATOtqv/Kim45o3wOFEsrRdUXZUKugBU/cD35nJTaJW714VarvHmX2YFQ15?=
 =?us-ascii?Q?ja/OXEJow0T2gEvkx239bOiS6oNkyX5S4uwK+p2Hm2rnn+HnGHGsGLDopGOw?=
 =?us-ascii?Q?n6mNgWBQvTKor2QCBE8uZvMtwLBqW8BFAws7OfRgLAa/wA0J4OvxXU49PuWj?=
 =?us-ascii?Q?ucsgnQpUz4f2L1aCW2KbwtAeXefcuzCPIQE1C1NHCdCOCOL9L28yjptgma2j?=
 =?us-ascii?Q?iDkin0D6kQDGafA1iFPz2e+hEeaREnXJsC7SUAfFUHpKVwe3uKK1mWWZnBsO?=
 =?us-ascii?Q?s2y8ddvcnaOwU4jYYpOXg8lR39KFLenfLuaVsVKW5kciMPdFroX2tc4mgxAl?=
 =?us-ascii?Q?dyr/WVX0sSlxE3TyUAyfHgRKUgnGpv1hpGrp9Yjc8LZ26X/HVQtQQUycfnhT?=
 =?us-ascii?Q?y55Bm5KC2VBpBQNtD01zDy0WTUSWX2kILrC08xzKUXMZcXwzjGzAAkpj8YIE?=
 =?us-ascii?Q?ucS3Ap0njIYWYd7WJrGSYYtP0Xe+rQd76E68fFUr6ALYiOBRezgB0V4nbA9T?=
 =?us-ascii?Q?It5+16cajDARC++bCjaDEXcbixc3CRGsIZh9lCSKKPbIWeGTMYW8TKQDPwDo?=
 =?us-ascii?Q?iB5aanLuZqLy1vVaz384eNuwz80WJVp+MdyWMph+uJThs0GBK4k/z1O5yMZe?=
 =?us-ascii?Q?RngJVpxxMPDArNwFv8yeJ/ln/VczzVlksix0JzrD5hOKm16qS2OqCHpn0bye?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?hwDxZcd1O5/LeXPhrxUh6Bv4wxRGgv3C5J0gPZMvrmvpsYmzxf30khAoO9e9?=
 =?us-ascii?Q?s31GQpa9aTDIHBPSMosbSbyDIf2BRpdwZoAOV/0WwRJp2B0G+P7LPmwJpxd5?=
 =?us-ascii?Q?S2ELcn4PcHkO6m/W/sDcspmIU2YZ6dXCcAUryovbyqK7XJbjKjxJ5AnPqu1Z?=
 =?us-ascii?Q?ABM0sRBA0m5Vp9U9lL0gmXyL5VC7MdjbT5x4CsvJ01PhqsKdBo5A14iyIWXS?=
 =?us-ascii?Q?YAycETuPFxelMF42dQw04fnf5RJxbOZQtGj8uTy9tzO2TJeprEHVmUsuUPeu?=
 =?us-ascii?Q?epUPWHzjWuwRJpbBsBwuCRwiTfsN+L6UA6Qfc9wr5FfWQ3QnuKJb51KNHC4o?=
 =?us-ascii?Q?qT5rTttnHqlm8fghsYE4UgDRi7bphtI54cvoRPbEHA+jrnCV40YoXtUzi7jL?=
 =?us-ascii?Q?l+kFoh3ajLkHSbPrqDQGKPz9Ch2atYcc0WzQaQUYZwVJ3nXb/f+6TM1j/sor?=
 =?us-ascii?Q?8i4JIJs7zsbFmDXwxlkBw1Z9OXD4HQPBLITJemNUrjuuLzp4M4j4Ev66YW9P?=
 =?us-ascii?Q?jZhY6TUsEINr4F+LWKIBq25A9hOxLrvh89GjuAo9U5lgKdh8rzrWok6TKPpR?=
 =?us-ascii?Q?PeIUYqPllZOfRfEhAZTtK4WsWz3gRU9wETcBlJRyBsca0u3437A9A9VwTzdK?=
 =?us-ascii?Q?+hmcEyFMKcV6wEgfzhbU05ofgmr3GKxsxW2E7Z01rWmp3Hb00hNw+tICGZMO?=
 =?us-ascii?Q?AJbhNknwG/mTUr6QPLITQRrshSuj8v4rjXDt67VVzoOyIdHPTbqatIeqtkyG?=
 =?us-ascii?Q?l0Wmay1rAyvdGozA649PM+QwVhRlcoLUPtLMpEHGULH9fzs2iU9JhHIEzOJn?=
 =?us-ascii?Q?P3PtIW/hatnNFtUpQQEg/bDEqNDKRuPTYvvvbQKIzMyVXoP+ThFWzZW2bOOV?=
 =?us-ascii?Q?5BJYUkoaMBYugE2+G8l2JoANbX7ta7nu335zvUFkv0wN0yyvWrT9isF3WzDO?=
 =?us-ascii?Q?Tjj74Kn9T0ZfUT4DSfCiXw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db57915f-6df4-4a1e-781b-08daf455c628
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 04:30:46.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zGDsxE00IrRiO+Ee0JChF4NXQLS8H+waklnvJw5igEfglx51lfFGduys5Pj+1qWL/Cy85CQQTfaPNZTFNkpIZ8pKfEafPQqXfolzPxRJJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6286
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_02,2023-01-11_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=790 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120028
X-Proofpoint-ORIG-GUID: gTHi_IhtAjkmcZ-dOz7bp5Pe3cjFa8CK
X-Proofpoint-GUID: gTHi_IhtAjkmcZ-dOz7bp5Pe3cjFa8CK
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Asutosh,

> This patch series is an implementation of UFS Multi-Circular Queue.
> Please consider this series for next merge window.  This
> implementation has been verified on a Qualcomm & MediaTek platform.

I'm afraid I am still getting conflicts with v12.

I finally figured out what caused the merge problems in scsi-staging so
that's now pushed out. Please rebase on what's currently there.

-- 
Martin K. Petersen	Oracle Linux Engineering
