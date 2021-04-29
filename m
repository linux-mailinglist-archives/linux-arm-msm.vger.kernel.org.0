Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8AB36E388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 05:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhD2DMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 23:12:00 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47158 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhD2DL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 23:11:59 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13T348WS158495;
        Thu, 29 Apr 2021 03:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=V9GewnwuH7l3UhnK00eKBBE0zt5FFbN9AkOE7FXJSvM=;
 b=lyCNNxQc08JjTqlDGOAmievelku4qHHXR0Cru4A6uh4HUlY/od4vDe1LxDpiDXjATr3w
 2lgp5q71HOgv3ajQvkTX9nzFRrFJA/z8ddIfbwMv1OaPc8zNWph7idXyKIyQEdVRBZVY
 nNHJpPvP8NlJK3GZCGDc6+s1NxFfrdk3NU3Ejfz9zn0F5ZDVv2ktAk8Jm7zngpYE6zwi
 jZamVVcLD6cpQ+TxX6gxO33f51aNQjVnrVSHVF/xjoNG74YLdF+yIJz4C2uKmRmAvcnU
 vWbCf7wHzg9J1nh4Aqijz3X8yzXX+INpvkxAlESIuhECzay74qMvUCtgjoaUgo/qlQsm Mg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 385aeq2vu0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 03:11:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13T34qTr131510;
        Thu, 29 Apr 2021 03:11:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
        by userp3030.oracle.com with ESMTP id 3848f0ekx4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 03:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRuSpRZEpZeeDqutobf98YZ37ZrkxvO3gYurm9dfJFYlLPSKw/8R3N9yn0qPfPOL/3EFoug8OxpQRDnPYg5oyePrTfVsGrEsMLqH/V4A4AwU9Clh6EQoM0Zyzw/8/K3m/NYpOtjtyQ8i0ikH2j6ipwPjlEmBHrZ9Su/Glqfwe1Xab/kO0fv59ONegCoLJqAh7ssuExMXv3uNkxfNkkMUD0FCta0GZy0kmpuHi2m9AXbtPJIO7ADoLdMYRFDKfjSiGsISZ766pZL5K62Q0J+cld5lriREKPiET6XCFoGkPj6aw3igSCG5AnxMQfaC4gHUCjltmeYEj04pc4xpVpFZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9GewnwuH7l3UhnK00eKBBE0zt5FFbN9AkOE7FXJSvM=;
 b=nQ8PZ57AGaMaP7ZMS9wwyyVakRfFHui6yWAzoirWwmV2F2Kxid+REzJUyYzGIGdKeRFWj0uA47J5vgoa/BVc7swfHHnYt2SjI9lVChW1/QY/+HfNUe/DytJKtZaauBK5e9eNQ6VkkDWTUE3QfY2SBS9Y7Xo8jfw/dd4fyQ9+giH0Xu6m0UR5Z9pW8yUY5VwhIFvbp4qRNHxp71OqHbEoMJZUG2MSqaHF5nJSWVd6apAIZz/eNlItb+ZeWtgc2lJ38c25PgJb5vaugEj0jRaIYQkbuGHSpTHbB/Ls0gh5+8FD96zopx9r6onKYZ5XjYjftaTok3FLIfUliZXvxzRtkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9GewnwuH7l3UhnK00eKBBE0zt5FFbN9AkOE7FXJSvM=;
 b=qB8l25C9nIoI7buOdm+UqWasouRwD5nt7fbVfV4W6/TfNAm87exDUH7M7/YvMKSH+f0xaKaAocpladD01E8uXBKEjLXVsj2yaBkd1Hoowk5Ykb45QlSfHqczm61FfivKdscd7BrldJ6aTIPAy3NHXUuE+YVc4p+uq7JpUZodsIY=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4727.namprd10.prod.outlook.com (2603:10b6:510:3f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Thu, 29 Apr
 2021 03:10:58 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688%4]) with mapi id 15.20.4087.025; Thu, 29 Apr 2021
 03:10:58 +0000
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        adrian.hunter@intel.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support)
Subject: Re: [PATCH v21 0/2] Enable power management for ufs wlun
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1y2d1lr9m.fsf@ca-mkp.ca.oracle.com>
References: <cover.1619223249.git.asutoshd@codeaurora.org>
Date:   Wed, 28 Apr 2021 23:10:55 -0400
In-Reply-To: <cover.1619223249.git.asutoshd@codeaurora.org> (Asutosh Das's
        message of "Fri, 23 Apr 2021 17:20:15 -0700")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: BYAPR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::26) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by BYAPR07CA0013.namprd07.prod.outlook.com (2603:10b6:a02:bc::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Thu, 29 Apr 2021 03:10:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46108b51-17f7-457e-19c6-08d90abc692f
X-MS-TrafficTypeDiagnostic: PH0PR10MB4727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4727E94BD1C625FF486176098E5F9@PH0PR10MB4727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ppuzDK6xkH5o/a6VXbkptPAd8qL5oE+TIqWYVBtIMJZQBvEKpaKDmsOSCeDRQOmR9LMfDkdra/258IhH69UX2Sx2R97xFKreZAiqvu8YINBthQQR18DQ4vYL7LC11DrdVTWNi//UufjV7BrYfQiyyS0RrUih0OQdzAn7zNHbcSwglrB1RfXsuL9Fj/pIxZVjMiPGdilz+VipCUFid6UvuDUpv/9A8Xgj+5d48g4JzRFP3aopqRuxgVwh+fQKW1al9BidbBjP5vQsenkRXcUOQ52Uv/2skemX0QQ/lQcI13esL9e774o3+VCOic4mRKalIrVpt3SwsjWe8/pb/6PAWgQgoh+BsDZ0DDS7oycJJXBQJTZQZp+0wsog9McnZrYtlj1zqVyEaoudEkIV54X3DLVPF8nS05SyQcbZegoor05SB1twtuk3xJYL6KCXZO8RWpQm+s3EldiSNrq96IWm+qtn/rkpMeXaLzOmw5gaJsQk74GiQTXetL6WsREa40MK5cAAbgVcNJclEWkuFquKARx4B6eu8/sn6rvs027Rv3KCdepPZ/h4OE2a33ZDG2Vz3+UbOgCU8y2rc7FZT9Allqg1rtkBZpa6l8SklmKE/tydhQC3XBZZBUHDfC5bpzX9H9jX+weIPMl4kiRe0Vz3ISIsbVMUPxY0Os2FfznEJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(956004)(26005)(6666004)(55016002)(478600001)(38350700002)(186003)(5660300002)(6916009)(83380400001)(38100700002)(16526019)(316002)(558084003)(8936002)(86362001)(66946007)(36916002)(8676002)(4326008)(52116002)(66556008)(66476007)(7696005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FpiBXl2q+lib6uAtj2zAt9gSGibP6zniDMchhCDS08oRtuHEm/r4s2lZo7o+?=
 =?us-ascii?Q?daOePPXM7j93AIYWn2RKLcinQz45h9UazzGHZ4Ekad8sUR6QBaSpzEmD3K4r?=
 =?us-ascii?Q?MSuz4jE59Pjh+85MjqZwVNZ2DXbI6Z6RjG9Xq91JC/s5TlZJGKcdlyA3j2Zp?=
 =?us-ascii?Q?EkccrV3kATzu6mikL7XZwt8DuKJJaWufI133GaL6EtUtkwUToB6A1sgQ5qex?=
 =?us-ascii?Q?ZK5J9WziIS/YlEnfbwVekYzl18U7OzgSf0cCJLq5/HReks/X8kqmDLduyoDp?=
 =?us-ascii?Q?Gh/5BbOfZr9/WA+iDW/xmYX81S0o59b9e2mfzBTNIs3rBiwnATybXGzrdvvj?=
 =?us-ascii?Q?2bkMPrKg+d0OL3fPazVoB2RjhnWSNIAjpbdmHDEAjUHXdx+I5AizEdVIyYme?=
 =?us-ascii?Q?GwNFJZdGjrqV9x4h6fGtWwJ/dLjRmhq/QemxXfrKWmqYQ++Z7AfPhx86EnE0?=
 =?us-ascii?Q?s9LSw7zgjA0/u0wugQFtd/bNwCjJT2BnmM8aw3xFN1S4O9fPurL1Elm0txIV?=
 =?us-ascii?Q?0cPpOYiUw9hvCXw9erGSuLtsurtqEDmts0C3hmMZePLGuKQkN/sXdffOWaaV?=
 =?us-ascii?Q?OmigTxQjR52aPN6a2J/e194hIKnNEowGEYyLVH/DHsZUsgIg4a86yt5KsYYN?=
 =?us-ascii?Q?t2IdWz0FdyZ67uQ4Hn1govX4/PLMU3oMPSiy/JyNnq2VrCrW79pSt0svX5oh?=
 =?us-ascii?Q?fJqK/Echt4PIzSq2HKlY4eizWkQ1aRdDf6Q+MN9rfFRPzvOCzju3+RItx+uo?=
 =?us-ascii?Q?GQt1k9OkOmpsEVdXr1ZEbojnGcXN3IhKzsimDZAX+BkadyeZ8XJy1nzPEBB/?=
 =?us-ascii?Q?PvzwmxoGIlqPqCiuFLA/a6SCHoPbFEAdIK0pdrrV2w1HxEJHcIQeoisGHzq0?=
 =?us-ascii?Q?UNkVvzrFxC3+mLXaxoBAlCaW/AQOhkWe5sFcs6udNtiID0Q2BAhHgaUoXsgM?=
 =?us-ascii?Q?sb2uIhooomyIgYf50vfYLKcJzxG1rWel8IPDSNPjU/+1xbi7lIq5yYQJyrd7?=
 =?us-ascii?Q?IiQfKuPCjyD9vlqdMQ67MZTwFfA4NqFxW4t4m64oy/3rtVX32Sf0S1GqnJnP?=
 =?us-ascii?Q?DPX59qk2O4Mc59sFdBObGNGxMjwIzpA0sYA7Lkjd4uqeU/Ck+tMyZVjglX2V?=
 =?us-ascii?Q?MaPF89Sk9ZliqZSb0Csf1BEKtqrw7PHB6rc5FB0WvYmYE7mDRFR2D9Wse0o1?=
 =?us-ascii?Q?oFRd7RB3h2gjcfjnr2zCAmEgDPVI8Cz3FmSXpO1CNMlg5kevehor3w3RfXwZ?=
 =?us-ascii?Q?P+5lOrXxSiU+KoQZdG7NlwiWWh5xjmhB4yns/V8ibFH94a9TqBgfHR0sEs2u?=
 =?us-ascii?Q?i3Anb9vlfWjGlgMy+uljDceX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46108b51-17f7-457e-19c6-08d90abc692f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 03:10:58.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk1lwqxvYvmWA0GaSC0gbq1SrQ8F9m30z1OO9+JerzLzzDDd6UxLC5wNGKhHQ4n7gHANeiZTuzlcW5I4YIB8KE57QDH+vNDmjLtaKF+4qek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4727
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 spamscore=0
 mlxlogscore=909 malwarescore=0 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290023
X-Proofpoint-ORIG-GUID: x_Ver-lVdGr1JlUXp4LHnqtexQIs7hjP
X-Proofpoint-GUID: x_Ver-lVdGr1JlUXp4LHnqtexQIs7hjP
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290023
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Asutosh,

> This patch attempts to fix a deadlock in ufs while sending SSU.

Applied to 5.14/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
