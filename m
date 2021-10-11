Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B12B428994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 11:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235443AbhJKJXK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 05:23:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50750 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235445AbhJKJXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 05:23:09 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B8faVY030029;
        Mon, 11 Oct 2021 09:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=iQvv8T6kvqc1NSWz0gVruRvnss7vNarH4Tw8o3H7aX8=;
 b=rF1m+9+qoCwTbhVa0yXMSy9YSxLAtjhjb7tu3taShQdFH2DLRtzgyJoN3fwxlNrfzbjW
 F9nmVvg7WJJhDWYjPIHsXiZ4zay1hpshSmV66vgHT2cV2Lk53Tgf9x3J/fy82nIIcC8f
 2Nu9Mo72bHh3o4HAlHF79Kt7D0UhwkCGrHPubZylVMvmXSDXR6dMI9PSu9tKPkgxr7dX
 mLvP5kvLrg7wiDDCcHW3pAQfN3p5KBrG3cW+cbEkCdhqqVw0X6eQQQ2hMwe2EnXdKpPa
 ua0Qi18hDMRyes/oS1mO+S19yRfIfmGthq3cwoJIfvokfYxFbv8b/lMAwxTvmattie17 YQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bkwyuk14w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Oct 2021 09:21:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B9F2fU139798;
        Mon, 11 Oct 2021 09:21:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
        by userp3020.oracle.com with ESMTP id 3bkyv7y20k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 Oct 2021 09:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDRHT5gfrUdusEygEAkZ1S1smiEqpmSKnq3tTGktdZ86s9D/QtLdyaL/NpiFzQepErmsMlyX3xlle0LHaqg3hNFQqRy5K7gRuCWlJaWcKjtc1zhkb/+rN+y33UI+KQFBGIyXHIvNT/w//OoTmO45qHMHnFEGtQE9uG5LJhRbGdNj2L7/cCgLZWcyI0ue0GLTbfUQQBZEpJpxzrJhxKJ+XLsPRHhwNh31Vxa0jYV19MA3mUeNwHyAYxc3OztsGqhDHRTs3fecDdhN+Pc4L75+7xJN9u895ays1MM8xoG6L/NdVqIItPKI2hgnQ9N1hOrbl3ulnn5bVmMNGCfdCUrOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQvv8T6kvqc1NSWz0gVruRvnss7vNarH4Tw8o3H7aX8=;
 b=B80xbJWAqLX/NZMnLMp8Zl+5Q4woaC1SyT/rUiXika1CasZ9Z/67JAWELC3FhT8d3mQU3b70aZUfXWHrXPXegbcZnoHrMmWTqgWd8HCGrCxbz7tuw9ctVeWd1ikkdfM85teKEFru4mrgasUQSOeAOuohV2d5zNFi3borbsEqs2n5wY7elEmem+yoky53OlTRN8HS0yUZYrE7xD2fQPeRbEfiDgnDKEjeg3rSU7ulEF57d8MN3SORBntzJVb1Ww0+zeTaQhuNl62GUW+F08Yq3sKJ+8OnzxvPifnTNytPnbD+rA6YoczOQ0ilJgdofiSqn5KhRA5lYxTFvtY+L/Fjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQvv8T6kvqc1NSWz0gVruRvnss7vNarH4Tw8o3H7aX8=;
 b=xltBfA508y0uN1VneuTPT1ULia/ovBzW6G783rHvNJsc5GFU8C4u9v50EO1inMs+rfOEhucRDE/TmAnxmNN9MEPjcki76mpwq1HL2iwALjQezC7Y8EntHgO/9WlgOdxfkb/21rsBe+xVxXP+D3iJfVBogjh4k6Is/XDSwCP+gds=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5411.namprd10.prod.outlook.com
 (2603:10b6:5:35e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 09:21:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 09:21:05 +0000
Date:   Mon, 11 Oct 2021 12:20:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     swboyd@chromium.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: [bug report] firmware: qcom_scm: Make __qcom_scm_is_call_available()
 return bool
Message-ID: <20211011092054.GA6793@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0103.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0103.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Mon, 11 Oct 2021 09:21:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2809b34-cf53-480b-3386-08d98c9873bf
X-MS-TrafficTypeDiagnostic: CO6PR10MB5411:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB541153FC9CAAA0E835ADE1828EB59@CO6PR10MB5411.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xi3xweHia+4Wmhgp/lvaAhGh0pdkDeQnAQZ//kj5eV9DyJbjkK86fy6CqS/TGSd/x6GYYBoCwsiFa5yZgdpUvP5BItcBKJJwIRRCQl1TTEXrEfD9dSHhDuVlurJwF3ysLGZ8vxvadlqYSutGt3YW2rGLefJuLic/x3fpyngcvOBRsHeDw8iw8uegtftVd0sH+LX15efUsQ23gP1HNRBWqWB5XMYNxnZHEOHz5GrwmeApNaw7c5y6ezu+lcOiYrsWISBXhuGMNe4Q7KBxDGGjwgac2vXaO/YZV0ooqDbBCUidpnSXtgG/+TN5jo6Z2DYaag/RL7+j/ebXtaXhRq/oOnh7Hg2Rw+Twk636m93LHPBysKsmf6wFn4A2dkITOctzLyAsKkkrOvdbz8RDuLWv6JsXplB0WnDIrnResFnn3bsNUWZAOcgTZpu6KFtkQeBIGlRH+16hRjIGAz08wSydEgGssxfLUrcr4ASdQU1rbjw9SEAzPZ4lWvzGwmtoc0LgghnCGJDqZccTTijfoFcqrg2zb2mOnBGCTX+1+gEpgxNfUEpwG+AdiYelbMlItcoLQ6sXp7iSt68VhOOHv5JrPDXON5L1YFQOjp4XU6SZJY2AP8amRtkh4UcdpFEPD2JauZePJIxkAmDmgFBBr21RF3CjC7ECfn6kIHUGAfUy3tY5ENr5gem0In7CbXc2BavYjfxpGDCtVbtYNRtaKPYYMERpYWB5rk2APW/iHMk6JFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6496006)(38350700002)(86362001)(6916009)(4326008)(2906002)(26005)(33716001)(956004)(44832011)(83380400001)(8936002)(38100700002)(52116002)(1076003)(316002)(6666004)(186003)(5660300002)(9576002)(66946007)(66476007)(55016002)(66556008)(9686003)(8676002)(508600001)(33656002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?11DhB+mBX3ZZD7XwqoOilPV/nTeojFn/G6jSOVTqlgt9k4LqVvyxAGjji66C?=
 =?us-ascii?Q?R1+Ae7oom9/58DTuqqYg+OzAhpXh25wHE7uOXGEe+cJY77ZepvZhcmbKGWB8?=
 =?us-ascii?Q?QFUrz9SIJjhFpYOl38lMcZaeE9k9JrsTI5TZgH4po5lYEX8RSBobEwfzhoKH?=
 =?us-ascii?Q?Vgb3ORTl0sjojCSmxrp4M3k1YQM+JFPntRNIUez7OXaAZIeYDy3lt0NAJYYq?=
 =?us-ascii?Q?C3571VoxVUWebBe5RgIXos8R+0x8GZAENpgZnOzifD573PZ7NVwP58KMhpAV?=
 =?us-ascii?Q?1VW052yDWZaXgH0Avtp/nxxl6QXEH7kCHCKDQmGCbVnRhe5anhVCy0ftXWNc?=
 =?us-ascii?Q?Ws4JY1F6Etec1L40cYMd9VfX+qPRlseyvVO0O2ycKjhohWYX3O69VBNg8TDj?=
 =?us-ascii?Q?PNYMwwj8zM90CLTdpSinGvi/y4CbkwOqEQ3Ny0bGYRvrEO6nswOUvUEdgk/h?=
 =?us-ascii?Q?9ycg39xbpSZbv89b3MXiDvdGEel+y4a8zrj4AKfq5s/suZuzKL4Bb0lDPkiK?=
 =?us-ascii?Q?uKoF4ANh6TSSIkuDCQqtWJ4Iq4fjN+AVBeat6Tgiz3F24PG3FGAtpVNsTzBK?=
 =?us-ascii?Q?mUGk2MJ6V/Ro/G2Fe5MSGwpf0XRT8ZKCghieJREJ0ME+RtYw9+kk3zIAtkl0?=
 =?us-ascii?Q?0KAGxeqskDoQ8AhCYdVJBJiSIcekjNn56fd7vt69yDztj4ehcmWB3JQpZ1i/?=
 =?us-ascii?Q?BI3qU0N/djGSzt3wuweDj9hGh+WA8JA1wGL+9UyS0yeQ1Xfe0+CNgKcZmbjW?=
 =?us-ascii?Q?NHdS6VwYm/R58SEUecOEGEa+FMhMkcZEC5GTQJYMQ/49vFPUYWCbQQZx92Gk?=
 =?us-ascii?Q?74+qj+xclKtctVI1akC+42okpTlKTkdQ5raISe0EJYk8P0JF2IHis3cjtdQi?=
 =?us-ascii?Q?6uxy0L3EY2AMun/PcxaDftBwWPytvboXtBuOLNNyChkdy6beGu7NfeHckBNt?=
 =?us-ascii?Q?eu1TPIWlvpR8HMGDKafouGiCQvRmZuUQtCAK9dUwF3mkyp+HWf/Vlc2GPUEA?=
 =?us-ascii?Q?t3otY6TbkoJYzdfB5n6nE6xRkMxNJ/yrq3SM6Kjqxj9WzDRsdBh24xptL/7L?=
 =?us-ascii?Q?rC2VE87IPVPdbxMGnOEsmCAdQ2N/nd95+2agPH/eq7cWl3EaZ9Hx4SGIkTLP?=
 =?us-ascii?Q?kKaMnvwZKEOqxTpzcCcriZq9zBBVR9x5W5gAQxY+6EFKjYfrnURSdbpi42sw?=
 =?us-ascii?Q?Vek4PEUyTuFfz156lLZ/4PyLMpp10seS3lr7RIjf8F3jbMgcCJ0vJbw64HVU?=
 =?us-ascii?Q?shg1xXPDrvc3k/JBAltLIgetTE2Njs7L2pogwYDEpHu49cCE88ZyrExYfZYj?=
 =?us-ascii?Q?bAoOgb4e/nHEgrkd0wdNNCQd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2809b34-cf53-480b-3386-08d98c9873bf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 09:21:05.7432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJiJW4UwUieujdj5GACaO97FhEfu85W5wFXF9e1iSbrrFbFMlK0FeTUpiwx3OHvuy9iUkUTt3pTyEl3sdLFjOtcPET9h1VwZf8d4aIxm4Mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5411
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110052
X-Proofpoint-ORIG-GUID: VcoOqQ5jXmtYWwRqQadMJiphiVd9gGZD
X-Proofpoint-GUID: VcoOqQ5jXmtYWwRqQadMJiphiVd9gGZD
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen Boyd,

The patch 9d11af8b06a8: "firmware: qcom_scm: Make
__qcom_scm_is_call_available() return bool" from Feb 23, 2021, leads
to the following Smatch static checker warning:

	drivers/firmware/qcom_scm.c:255 __qcom_scm_is_call_available()
	warn: signedness bug returning '(-22)'

drivers/firmware/qcom_scm.c
    232 static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
    233                                          u32 cmd_id)
    234 {
    235         int ret;
    236         struct qcom_scm_desc desc = {
    237                 .svc = QCOM_SCM_SVC_INFO,
    238                 .cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
    239                 .owner = ARM_SMCCC_OWNER_SIP,
    240         };
    241         struct qcom_scm_res res;
    242 
    243         desc.arginfo = QCOM_SCM_ARGS(1);
    244         switch (__get_convention()) {
    245         case SMC_CONVENTION_ARM_32:
    246         case SMC_CONVENTION_ARM_64:
    247                 desc.args[0] = SCM_SMC_FNID(svc_id, cmd_id) |
    248                                 (ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
    249                 break;
    250         case SMC_CONVENTION_LEGACY:
    251                 desc.args[0] = SCM_LEGACY_FNID(svc_id, cmd_id);
    252                 break;
    253         default:
    254                 pr_err("Unknown SMC convention being used\n");
--> 255                 return -EINVAL;

Presumably this should be "return false;"?

    256         }
    257 
    258         ret = qcom_scm_call(dev, &desc, &res);
    259 
    260         return ret ? false : !!res.result[0];
    261 }

regards,
dan carpenter
