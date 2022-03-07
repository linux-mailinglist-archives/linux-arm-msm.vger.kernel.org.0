Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1098A4D021C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Mar 2022 15:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243643AbiCGOy7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Mar 2022 09:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243671AbiCGOys (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Mar 2022 09:54:48 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692393C495;
        Mon,  7 Mar 2022 06:53:39 -0800 (PST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227Ekc8g028616;
        Mon, 7 Mar 2022 14:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=t32AurbP1X+6CNKeL88rNWeykMMW+CaX1shq4dUe4DY=;
 b=oNLFT+F3goQrsWA0VkfS6rBqg4LSU5E3x5tqERRz+/S9jx4bJOohr9qwW8fzM7qNJeEX
 j8wFNP5DIpDc/PevsZXFp5Rk9QYObPjiYfC9kMMST/KFmKW7/C+idPD484mQ4MUAWuwL
 JNSQ+4HhIHkeos3IjK4QGwaagkl4Ag//l8uejULwGl1FgjA1tv8xluMbrObf1q0Fh8T7
 IGcDB6jqkpH9OSg3C+13dmg8F2CUPVuyOOsKvi9IQkc3Qm3sX6fu6F8bHw1mEfsvnStd
 g4wPIpmtppoB0MRmAnyYKM7doyphKjgEjaPL2mhwdvoK30FxUK67M2XzzDDWieDrOQpZ 5w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekyfsbyrk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 14:53:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227EkIlT169237;
        Mon, 7 Mar 2022 14:53:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        by userp3030.oracle.com with ESMTP id 3ekvytkk8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Mar 2022 14:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dU578MTo0deUhU6I8pvM3Iq0zG3hTjRHdem23wepNM7j6K0l56BzNQeVVOpgtQr5Xc75GMDyrf/5KgMAV14QaozuESOD8PUm0JS7E8NqTQWngiVNAFZQQSEkLJ6fJhK/yhf2149XYq1BQmfZqQVwo75Nk6VxiP97COl97iTDDOs9j/sSg+2jGUvSnn8zztMa2fTLWna+6W9qBfphP4RBZVWpjfie4IhGN/B5Pbibecmn81RiHkaAo9bCYrfZkJZKHf4V8aBurP+JxH7mRuwy0fu6XOVjLGYfHUMcl6jsWGBJCBb1TTzJ9Yzuu+1gqlgWcTnPfXjvchvepc+4m7dS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t32AurbP1X+6CNKeL88rNWeykMMW+CaX1shq4dUe4DY=;
 b=chvS9+kZ8euWA4AQMmm2BLw4TLwv8+0crvGxoeSiWzEfVdCUOOlr+EhmaP8K672oAxnbrkYgHi4dYKVb74DYnFMYkKB9L9bD8IXof840oNrTGYtMwNdJ2gegFo8sQBeVv1uM4Pw5xnh0+J4BtRRPqrouFB7wov1TwTCfAkMk2o35meIvxpdkOgH5LtGa9sJGv7BB9IFJ/9hG38+iv0GBE55W+p05fdoarrc82gxLR95Y8JeePwnJrxTBjqw3YgsayPYBV7SvdLu1dX9Cu9Tl+D77r8aEHorTaqprJZgnXzMHY4NaeIb8Pb2WARwimDgSf8uL2KOS3UmYg9FAzuOGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t32AurbP1X+6CNKeL88rNWeykMMW+CaX1shq4dUe4DY=;
 b=hFbu9LZf29zXImZAL+eW0UY2DbnykyP0CGedPMo/xevzyBcWSxsYazeJYhcAANlyzlzsKUP7GK16gcJdPr5KmiyElGcHizVS7zDz71ZM4pqp/0kFOnyopJp+S9Pi4K8d8iUrBWKgFsp1/mIAWhR7KnmXBE55FQaGvJ2Qf2aNm+c=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB2726.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 14:53:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:53:20 +0000
Date:   Mon, 7 Mar 2022 17:53:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Elder <elder@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Fix signedness bug in
 mhi_ep_register_controller()
Message-ID: <20220307145306.GD3315@kadam>
References: <20220307142822.GC19660@kili>
 <62773196-bf38-258c-8537-4baa84959a6c@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62773196-bf38-258c-8537-4baa84959a6c@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7991b78f-0d09-4652-01e6-08da004a388e
X-MS-TrafficTypeDiagnostic: BYAPR10MB2726:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2726F9765B1523A2291651B98E089@BYAPR10MB2726.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JAxK5C6Klm0rHm0EeN8DzmATDwbn3o0pnllGWTdE+2MhCSm9xzWIcEczaJJAw8i4G2lZYGaJfI9MHxMOf9B+HbgNUV3/caFd1Vx+SgCbwFB8RI2pEqKFo66LFVb/S7vKovSf9B+BjjXPq8qOnq4nKj7lRx8PF5zUQ1vcmZFpSssENManz9MNoa6swLrV0lJEqmQ0il2SkTUzXbZYN/sxNLgTOZn1H4pZ1bCEF8lfnVqm83ynogmzFn5GZ41uktUGdplvAiMIHg836sPyOoHAn5m4UKv9Zx4OZuAPxbocuTLw12n8OZhcWm5cy1EHpGAiv1ZJybxz5WB+8anXP1VGH2HGfF6U/L0A60Wm0PHUF6Gxfv+XMRpoSpZa/xo834Kqxiu4PudW5IWZOd5cVcAmirTa4b8D2uRVNzF9lPiuXqMYYfF5tgpQr0rxw8mnXu6sVB97JO8IosLERzjl9Nya3LRGj1oaLiV0Ijs9sZhl1mOYt5BraJT+0nGesHNCwh3xzozfkDKDJsZswp9tM91FItRy3sWMW81pmCQgzQbsxcezlDqnTv0VlPySdFp8KhwbvOR8z+zGmYhYqmw+tfk9HwLHE8oCOslxrega2HY6ZlIHPzGCfw+rIIAiUDKlog7v/p83Mfc71M6uSkyrBLcfA7LjxAtpOUDYLVV2Z934S2dZXP0z8BQ/KZkl0X/LT87L8jXuGln4X2uq8yh7kbXPbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(8676002)(186003)(26005)(4326008)(1076003)(66556008)(508600001)(33716001)(66946007)(66476007)(38100700002)(38350700002)(2906002)(44832011)(4744005)(5660300002)(86362001)(8936002)(6916009)(54906003)(33656002)(9686003)(53546011)(316002)(52116002)(6666004)(6512007)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RALaT26+7mJk7rnEik5d0mSoGwtcaxL87SySgDRLTetXC8k/GscqWI/lam3A?=
 =?us-ascii?Q?OujEAR+gllhfLFZSb/KIymYdjSUErdCsJvNGoAdcEVhbFJ8HOIqXCUqkUXrD?=
 =?us-ascii?Q?84GQCaA6GvB+lGXgmU1KIUhs9fAKbLco5/VNbJu8S/5iNL+7aEibNvrhdWBW?=
 =?us-ascii?Q?rhv1ZGblUdmeZREitXbz33k+D2ldC+UU9CY440p5nf05PklZrBoF0UpR5KIw?=
 =?us-ascii?Q?bq7Uh73IAZvL5op0ENytd2jz7yqnA8m0IvrYf5l/AiJVlJ7dN4oJ/pqrW2OW?=
 =?us-ascii?Q?9iVVMFL/RM8MhcCQY8CkkekhUyLxtPt6rDYU0TKNfWPlwmDhVX8zu11VhL8L?=
 =?us-ascii?Q?BiHGv4zSxeGqYI+5XzQs0LTyFkqWu8u/89KTAxfbgm3skyhAYO3tuXNtA8IY?=
 =?us-ascii?Q?vPahRbA3KxaPBInLKPd4TpguvDZ599mqRXsCHhFdFB9IVe34OWtFse9Mpj/I?=
 =?us-ascii?Q?+DGu1vXqkzTG+LBDFXQLpzRGOTh9Wi29VLfKpT43M5T49Tb2De5GhXxXAMoV?=
 =?us-ascii?Q?qZVpT4HVtXtIZA5pnQW8ldiddCcH6cTjS/EQskL49Geltxb+cuZ7R7OhHZvz?=
 =?us-ascii?Q?wINThm+SsPcBuViCKC+stJJb089lMr45sKTLUvCh2iQqtJdmBmXFmdYccca+?=
 =?us-ascii?Q?g7ZlDE93EzxzbIhJKkb0Em5xt/+UTZRYWGcXGC7vL1u0YyWs9KapE32SEeLS?=
 =?us-ascii?Q?ddxoeVi5+HQO32DKd980WC4LymrAbxNmHWpsmJ60P4TUIldsrNt/LOQWuuja?=
 =?us-ascii?Q?1O5raNne5e1Mzmbm7U1h7sHVg1+iFykt1HrjlwiKznCnvwjZRUF0MSLS5dpB?=
 =?us-ascii?Q?nq9ziU6h2idRi8odCPTlumpogm20JJOK6ZntlHq0cciy3YEv4yQrw7PZGTTY?=
 =?us-ascii?Q?EZXk72nxpiHiuRn4Jaz8hCJRIMVlHdo+NWR15OzGXH316seJhvdjz+0KrJt/?=
 =?us-ascii?Q?WXBiUIwRS9ulinYKhsZNTL9R5qGis19TMbINaFFrDY/EP94K2j3fbfUJ5VoJ?=
 =?us-ascii?Q?QSmGPo1AzLJMl7L+J6W+zulkRraafuW3uizQ/f3a8by+QWiQOrUDIrVBDerU?=
 =?us-ascii?Q?TihwM4JeDgibx3rEuasuqfoMDp1jaU5Z3CrUZphaxjQdwKr4qRC4fctwR9kQ?=
 =?us-ascii?Q?hOfAQCJvvlWuR0v/9KhP45i7UvGUqScOcJyVGYFeZ+1CDb0Alu8kavwrKOmh?=
 =?us-ascii?Q?IayDXYaeH6ydQ5hGpdv/FXfM/ofCxzuhpiY407h0BazHqk6STgpBkDhL/RWN?=
 =?us-ascii?Q?t0kpM0mOyFCGHl0IetznF11SU5vyGoJgGOtLLvxcUkULZXS+bAa372evA5Jh?=
 =?us-ascii?Q?O+mDA62PviPxgpJjFSI9Dp91nMMYdLYhVmZjb/dGR3s22WV9YJP3V8pVXq8f?=
 =?us-ascii?Q?Uzn9l1Pw+q+FVzbXyM0GPouxP9mZErZMeFuzvyqz6MvCmaWDvj+qZhtSmW3H?=
 =?us-ascii?Q?r6lQrSfkSHMq0k5PySQnxO1XsVRwaiV3fzQhjb5Mj5sOThfofdrhJlInxyBT?=
 =?us-ascii?Q?4VC7U7UtzBxRar7L9NN13L9iyzrLVarODTTCb5KSrpb4JAbpgpXESEUFc3GH?=
 =?us-ascii?Q?EI6ZeWxFdMicJz9PHILieHpRUdcE+s2eWPLcx+Tv/g5A6wC5yTRw8ROGmGt+?=
 =?us-ascii?Q?X/YKsKMcWKNdZ3nkkmLynMMANTG/luVALJKI4IvpDL3Q7LoDkinTI9WgGPkk?=
 =?us-ascii?Q?uFbbQw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7991b78f-0d09-4652-01e6-08da004a388e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:53:20.6506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOFiBNiX2g80Z13Cokci4o/OiK0NBZBzBPvoWIVp0ieFljHtpWJHYKZk0qMiIPpy3KmYCCKZqVTfnL3pAeToSe75+iWHfxCQ+lWB5z6nx5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2726
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070086
X-Proofpoint-GUID: 4gMM4CUMHRLl2z8RioTNPtWhIyKstNLB
X-Proofpoint-ORIG-GUID: 4gMM4CUMHRLl2z8RioTNPtWhIyKstNLB
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 07, 2022 at 08:50:32AM -0600, Alex Elder wrote:
> On 3/7/22 8:28 AM, Dan Carpenter wrote:
> > The "mhi_cntrl->index" variable is unsigned so the error handling will
> > not work.
> > 
> > Fixes: 10f0ab9c6787 ("bus: mhi: ep: Add support for registering MHI endpoint controllers")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Good fix.  Is this code upstream somewhere?

It's in linux-next.

regards,
dan carpenter

