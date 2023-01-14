Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA1966A897
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jan 2023 03:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbjANCSY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 21:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbjANCSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 21:18:22 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D71A8BAAE;
        Fri, 13 Jan 2023 18:18:22 -0800 (PST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DNO8YF030816;
        Sat, 14 Jan 2023 02:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2022-7-12;
 bh=7feMUwf+LT6jmrNU6xVo5trCnSTaFhfs30EfsXV8O68=;
 b=HYBTMpSIGOOsj8hrjXBlU2AahjM1FzwNd29z8uMFdUgNaDSHV3Mx8DBYVyILUnS5JvtL
 i3tuCiQcjFiY4bP0bnP+ifxWCwluDFbSFfrJ8nX6vGYDtmHe7emKFE0TcljxFanHFyhw
 IQsS6NknWD1A9Bv/0B4+BzztprSrFWVgXDdr0zGxyu9j72OXmBaXYLFK4bXvuK4Nno5y
 yYG1CbsFgvcVnv+qt7ozIfGcD2WQnlsaVnPuDM6kfSBdcK9+aUbhp8YXp+h3cPKKaH+a
 IuH22XmmN8MxllEylMJ3w4jqymh273Ch3Se6F4CFqsCsIocUMdHZJed4rvtujCaMTSbK Mg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3my0scp3ep-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 14 Jan 2023 02:18:10 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30E23lNa019037;
        Sat, 14 Jan 2023 02:18:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n3k9fg84s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 14 Jan 2023 02:18:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcC9QS6WB0hLM5USOgRM1LoHtQvPPVqbZtLrUCsDWJ7thM9j5Z26DwIl/UJMg5y8OU09wCWL10ZpLpXPfrjrV72XcAgzx4/KHU49EwPiRI1f2PIpHXWqvqVKPu3/5vc7fkXDudzRRMu79gQVfJkIqUZszP9kF6jon0KJ2hW8xxVL4agDRneFmrd+yS+v66KWGtmsTWWOmd9dQcc5CEU83cTc8Gn1r3+fm73bx6QB6AiHjPakAVDLUEzhd1xJlTqoL/14OL/h87iFVwwa+teBAiZAOe9ClFbs9kVz1BWf6THYbH94i61srURVDcW230aQhNPSwmhUac69gyr+bwpB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7feMUwf+LT6jmrNU6xVo5trCnSTaFhfs30EfsXV8O68=;
 b=OHf7xpN9AtuVvr5DrgAJIgGPfJj3iyGWuDjrIvoDpAhgP4tF0qZB46X5KvDmW3eP0OqV4focuJpYySynfJWFYBZuQK3IzPXTSLLTIu+5r7HdQl/lNHDPS7F2UEmlnAjPhDDF16OiN4l1NPnZB0TWNlx2XbdqcFvyNlRoG6Vj+gC42j0ebE0LOeGnUHSHJPfWu7c+1QzmTIMfBc9Z85YW1r6kQ6AJ9JhoBK3GQStyzx59BExY8a67F3e5agQhsIDYlZr3esARTt0kGCG306bfzoGml48zg4ADBWJMIGWmoNW94z8l67Y2m3Pu6QIctymOAg40lK+KoisokobBmzOpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7feMUwf+LT6jmrNU6xVo5trCnSTaFhfs30EfsXV8O68=;
 b=PUo1DV7nI9S8H+xrij8s+FGHx2vxObQR5qjeoFwVlKdPIaA16JA933d7+fHVhgPAavtxxMe6phaCE8txVeqpIZP09mr8CehzEY24Eb/Ace8n0ZUMCI2Pz+7XDDgaD5EQs8lcyOVdeBu/3l2yniXU790b/LH1DTC5rei7kt2CTuc=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by DS7PR10MB5999.namprd10.prod.outlook.com (2603:10b6:8:9d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sat, 14 Jan
 2023 02:16:36 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c7e9:609f:7151:f4a6]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c7e9:609f:7151:f4a6%8]) with mapi id 15.20.6002.013; Sat, 14 Jan 2023
 02:16:35 +0000
To:     Asutosh Das <quic_asutoshd@quicinc.com>
Cc:     <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <stanley.chu@mediatek.com>,
        <adrian.hunter@intel.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v13 00/15] Add Multi Circular Queue Support
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq17cxpuahg.fsf@ca-mkp.ca.oracle.com>
References: <cover.1673557949.git.quic_asutoshd@quicinc.com>
Date:   Fri, 13 Jan 2023 21:16:21 -0500
In-Reply-To: <cover.1673557949.git.quic_asutoshd@quicinc.com> (Asutosh Das's
        message of "Fri, 13 Jan 2023 12:48:37 -0800")
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:806:122::8) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|DS7PR10MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ed9d6f-da74-4ded-6011-08daf5d55c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /K/xSo2Wh9D0hGn2evy4yLs8vZyryjWXRA7vzR8hgi+2SeDfvAbaukgymg+FxUmB/SDm4vq9Wd1Kr0cTSHT7402+j9joLz32Jq9k0tz158JlKzkEYmNI9pYFpw0W9rliLbFeW9KiOuSHTEmD/F5I4/+J4t5f7YmZY6j9w2H/arJWgfwMINrzjo+ey+3YYvXYJnksnu6dyyYhA1x4Lw1062qOUmoo4GG4xMyoLk9Rl1t5/rzQizIegMx0v21j2FbfLxrlLUiYsQEFIPccZHfGyVbEI2Ao2rw8IWiAQUmzGJFqQ9g1DxL+AjQFXVVPGPgLDr2K+j96v+PUDPpvFD7IW3Mk8VKCko6vdZn2LC4fg2bcjKEZT02YMakYBBR2MRTRNuz/Ak6gbOqxfAPANbF0DH7JnF3otCPhhs6lyqLSYiw19DoNxmRO6dbEVGyiqU2MXniZuH8HWgNSmxfKhRIU5kCxBdJtWiHRWZ8gyFV5XNIX3yF33/BHPJ1MD0wyXMs/s8HU836tXjdqUwkqCJAMncv4hSWfduzHS1AzHQBMoFoyJ0aqfCizKPIqd0mU+p0ynEvJWgOpafyoGonCw+TuGQayLmvt1pBAuPXn6O8Y381oIrGj4PNiO0X04JiYQkwVjPvsibBD/qqlcf8LhWPJ3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199015)(83380400001)(38100700002)(558084003)(86362001)(6916009)(5660300002)(7416002)(4326008)(2906002)(66476007)(8676002)(8936002)(66946007)(66556008)(41300700001)(6512007)(186003)(26005)(6506007)(6666004)(54906003)(316002)(478600001)(36916002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wp0sGDyJJQQM7juz9N6plRos3kKjK8++602Rz3HshNSOrn4+0CDoB9swxZZv?=
 =?us-ascii?Q?7xENAu9NVpYxLxxGNTJ/dUXUxJWJCM2KNWJvPc+6MpXYAiVKXACjIYBuqhfZ?=
 =?us-ascii?Q?cps3LF41+OV+iKHZCkT5ugX08636gA+v+FoSMW79CmSni+ER9TSmmEVWiMrO?=
 =?us-ascii?Q?NokWAJlsuc/Zdo0F+a/vbC1WlESyYOkhfNOMdG2ZBe5W0SzKhAWZ68V4Vcar?=
 =?us-ascii?Q?NBbes+WQLSw8CGQlOEqkPZRglakQv5Kw1IUtpXKni9NKssxjPOWeYrlMVkiv?=
 =?us-ascii?Q?Jn3YGkMgXDCYvkAtOFQB51/3mIx3NX4rXTfoROPEJ6sX10LFiLLwBU8BqbIZ?=
 =?us-ascii?Q?2ve8Xvy52O1vXwRZw/JFC2dbbrKnRGnizARsaV+4Nmob+xwl72SgwAmIXzMG?=
 =?us-ascii?Q?Elh4/z84ZBMdEnLH5eyHZldIHNWEwM9JmrjxZmjUCxyRDS3ZmiRXsZ/oVcop?=
 =?us-ascii?Q?0UmJrC1dcXVc1InwYC3kFZdvxkZTAnrDyQIunTe4bWmUt41r93VXIi7ew0w0?=
 =?us-ascii?Q?yIxc4uTm2U8aqME57NzECq3Lb22BXFscxfOYicJeFsEz88upsLyRyWfZmWJn?=
 =?us-ascii?Q?D6IvTiDHFq9ASNBT3pRPsPXd51GF5h/tdKG1GhsQScuoVSgHaC+47UVepcHb?=
 =?us-ascii?Q?Ypb45O/pTRyo/2CZMno5KxnvJA5f50Yh/x1t7ypSGaAhfeUagai81e/yXI3U?=
 =?us-ascii?Q?8cuwMoaeYDNOjlc9qjYZ+OqEPNJDpU6CX3elgcGT/z6V0MJlhbE2VmvpB7Sx?=
 =?us-ascii?Q?vWNoFcPSc9NkVLviSd4Di7lRV+PsKXwpP+P/UbRukgKQ4fkSGor44FVO45cq?=
 =?us-ascii?Q?6poSScP/17EIpb/ZRb7D5pu0BTtZAnTmIrhVYInNGInfUfLrcZ6+AtDBlT/R?=
 =?us-ascii?Q?Hdj2Kf4L7QgacOhuqp0sB0OyuLMOVTvzA9E6el7uHEtlUEW4FTlVeJs+9ekQ?=
 =?us-ascii?Q?SktgOHNXFaLJAeGRdW0VFHk61+3lNxugTucR3Ec2Agj+ddu1EI1wf0Cz36u6?=
 =?us-ascii?Q?S6zrwt0ZkTUOwilDhPi7/HW67XukWyGjf0GOv5xn9+f25KpVd9JREuGzGwYj?=
 =?us-ascii?Q?Cn0xZz4T23hc3o8icJWLa2V4VuThNX1k5Yb3U9Vudxg6qxfCEhu3ZKV0u3zi?=
 =?us-ascii?Q?0/UOBGuH5mFBaurkbMSb17dS4T2G52VZMCYDHbPTCuoZarKPRV4q72vqMtGD?=
 =?us-ascii?Q?x5uRG6yqCcZzibt8W6dlbmL0P6UwEZpna2+Tqx4kuRzt/9xNu4v43IbXiVK5?=
 =?us-ascii?Q?CWiyfBNzbL6c3ZZWw2xG9DdoMtEJ7Jn7aTOUjFaIAvXUwZwBXfZ7B0rWe2Nc?=
 =?us-ascii?Q?muEaTfYVxxrUWJbFYSCtq8Ku6dLBoqG0ejSvrbW3PkzkDyFkj4T+UhcDQSSH?=
 =?us-ascii?Q?4gcFrUkXA1fpUIceSETgazk5LcmSrKYheyYMF3N8YXxSJs1fipoMyAIgFww7?=
 =?us-ascii?Q?MhXEOuryGSE80vW47DiDrYAwcv0eWAcTjlirJbOWNeLYkXpnGziZM1rAcfQH?=
 =?us-ascii?Q?kzhqd5e3pw9FOWn/6cOFB1rL/32RBogMnWr4tsTh8REfKmXkpaBhmH6VSoM4?=
 =?us-ascii?Q?Ul274TF5tWVAI+y/8apgp4f5UCO5Agtr82ISUoaIYum2ihK6zApm69chXrx+?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?LR9aQEy76A6+hLEYXK0gxsLhBO7btxl4N6+FrCe2H6Zq/dRgdjtlOCpzlY+h?=
 =?us-ascii?Q?GotRwSHZWdHgLoPEDLn/32DX/ObWZBIOsI9UK5iJCtzHIezLsWn2TfdkHHNI?=
 =?us-ascii?Q?tztbjfKiBMVJXGhv7z10UzT8acTsjzTa2dJg+kBP2LXYfnbQhndtpY8AdxVl?=
 =?us-ascii?Q?Fay3uUV7Ki4hRrJju/qsguB5b9yBH38hM0HOYYC3R3Wm+QiQtk9DZ5zGTtwz?=
 =?us-ascii?Q?JC8vBGsB+BljC/lWa+aZmRbmtkEqkgCTcF6TNta+fssz8Rem5hAiIGEUVhWw?=
 =?us-ascii?Q?1sVvOIdb9X9Z2oS0PqEnhhWjaIib7I70FTvUiMKkLKgUVDB4hCoPk+POynO3?=
 =?us-ascii?Q?n36WA/z91oYUVxnwTboZZ7ZqGWO/h96ABAlXrlXet6Fv24L91X9R3TLwyiF/?=
 =?us-ascii?Q?deZ23HTSBnQ0raKr/zc6RyMFY+5gMA6Xpvy1YGtHYs5PVgjVVldv4TxdLzgQ?=
 =?us-ascii?Q?LbrTe9anNIbS1uGiEroIchOSxxRRi4cKzhmQ0VB1XFj+x5t/hnpFAwIsrmXS?=
 =?us-ascii?Q?yqkoIIO3DmVdYFAFAUu9nNOqGyKzv8JnQcX7CGpNyicpluswOXLgXGI/Oix0?=
 =?us-ascii?Q?5vkX+YpeYosb6UIgHOYw9puYdn/4OZ8VJSJwNLiWDQFUKjO2V1G3UQNgby9e?=
 =?us-ascii?Q?nSTQu1M5o6YxE7S0ddIlQ0IbyKAPVMpojyRIcpsxNbkxPTuO/KuRS/0HvbEn?=
 =?us-ascii?Q?7Idon+i9GZU3OQkSWGd20hb7lqPoP2ZJVEbURozDXmgtW8PYoQ1DGIHdSs7W?=
 =?us-ascii?Q?fBTsyZ9VFF+pbruhD+e4+oFNpiq8cNNIrDLcQ2PcNRZpr9sEH2B2UNZ56qwY?=
 =?us-ascii?Q?YpEewy6pTYrwStLIogH1VsbF9OcsCuhOH2EiOJbxeDzYxntPffyJOw3Z+8cN?=
 =?us-ascii?Q?OozNPCTP1bOU+iOZhVO44ndrvxNpaE0R/CqR6H3iL86oe750Tt/FWEAwFjSZ?=
 =?us-ascii?Q?qxg81tP8bFZI1vmgW7LPzg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ed9d6f-da74-4ded-6011-08daf5d55c22
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2023 02:16:35.6284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUZW7ZaMsM9grY+ZDn0Ilea7gup80a/wiK029POriG75/YOJ7vO6sJh5gWgtfplmqVRVlTxfaZfWoeoWUTAFe7VPaBcMxZJie7Og/lSFcPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5999
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_12,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 mlxscore=0 mlxlogscore=692 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301140014
X-Proofpoint-GUID: bNVY72gwgVJDIcksDpMYelav064X7y0S
X-Proofpoint-ORIG-GUID: bNVY72gwgVJDIcksDpMYelav064X7y0S
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

Applied to 6.3/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
