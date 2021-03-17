Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8884333E5F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 02:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhCQBW1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 21:22:27 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:50478 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbhCQBWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 21:22:11 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12H1F1Qb001143;
        Wed, 17 Mar 2021 01:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=E6/9Z664YoFekYwswQCP3lmERumeysmpPMrZ39UTVYI=;
 b=Eu0IpJMnl++fsD2P6Jl3MbF5sP2DZk/CisG4YzeuWoWaXlWo/qDZHb2HP/xf8GzzTsqm
 l1aEDVfcoDCo+MkCcnE4N+ILU2wUcyFTLppmtj0NZrUq36iIw1af69Fuc/EmFVVi2xRe
 rswAyc17ey4Scvl8No4RRUaUikxPKbaLrlpxQwMLjtIMI8vLo8Q8d/nJpx2CSDQIqgKD
 YKadMBTU18I2NpCkfFgm7PWWZGVI6HruJdWYAuLwNk3UG7/D2tkm5OaR52QowAsl1+Pj
 sNkI4yS9fnBK40V7+maI0JcR81UsPd/AEKUXhq0dp5+lawIyhfcjLRTos5WiZxhClulQ pg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 378nbmafnt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 01:22:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12H1Jk14093207;
        Wed, 17 Mar 2021 01:22:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by aserp3020.oracle.com with ESMTP id 3797a1xwx2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 01:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxsT3E8+IEOp4iaK9pmEdlRukfnnraiIBiRgWNNw2xuGIm6446gc5sPfB0WU9WOdNeZQ/fKvASBUou7TpSbmZFps1UPkfmr/wknlcwssKVPIha85SCMZcp9vXyU20Ov5UXBKEttM/wRwnUKDQOr/9cbRqL0+r/JiiaVZwBVn3CqG7E69JWWdaD7MNzelmfng0qZGvHTVP5e0t2v7L+OkcvSk2sLxrX9yzbwWONoH4hRME/inNiirU46Jc+fgdfMKZvIAwvadnXtbIAYZbQT3jhwJOJCyWtrNxnU94jZapgfzhCKeRgKvimjmpcnKKxZN2VNSFGeKlrMrwbHAb0RK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6/9Z664YoFekYwswQCP3lmERumeysmpPMrZ39UTVYI=;
 b=aXXqeI0lpjjxDwEvzLpHR7Eov59oo+YyPSw/ppnrOKjwk0CBnDceo7I+vZ6UL7lI0Q2UjZAwK06fvIPobd5z8R9MwkVBFAnb+dLyfUZozyAKHf9jiTc4po+hYjdUPb0J5SEb2T04bOK5mFreLZirRrSYYyfXPdztGMOuBfaZ/jFhuncnHuOoW2P1coQMjL+Dz2x6DMSSFjczANVYtdQnVpKBwT3ggd8uAoQnAWSnVNEs8mQkGy7YHDFXCSSt+U9HoStDcGZ2svySCvRivRTsWiyZ/MbWFNiXwulBpeCgAIOKE9tufqgDJn+omdIJY1rwhLNCvyeNsE0BE8bd4Q49tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6/9Z664YoFekYwswQCP3lmERumeysmpPMrZ39UTVYI=;
 b=pfqALFz33hoWUYwHYiO/7FknVVUhbNMJ/BSeCjwxIAllFCwR5Z0/zDQhwKrVD50t3qc3QrnwNgmH32yxSXg7Rw5lTPLZs5ifSjpTyv3ErYClg+cXyTlA+lPdhruNCS2U0xZ2G200C5vMIK6TeIbUd1eVB+FBp/FByZjx/82H4H4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4534.namprd10.prod.outlook.com (2603:10b6:510:30::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 01:21:58 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 01:21:58 +0000
To:     Vinod Koul <vkoul@kernel.org>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: dt-bindings: ufs: Add sm8250, sm8350
 compatible strings
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1mtv237a1.fsf@ca-mkp.ca.oracle.com>
References: <20210204165234.61939-1-vkoul@kernel.org>
        <YEr3kg6vPu6Htnpw@vkoul-mobl>
Date:   Tue, 16 Mar 2021 21:21:55 -0400
In-Reply-To: <YEr3kg6vPu6Htnpw@vkoul-mobl> (Vinod Koul's message of "Fri, 12
        Mar 2021 10:39:38 +0530")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by SJ0PR03CA0233.namprd03.prod.outlook.com (2603:10b6:a03:39f::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 01:21:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87943598-0538-41f9-0670-08d8e8e30ee4
X-MS-TrafficTypeDiagnostic: PH0PR10MB4534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4534BD7C845821D3A3F83E078E6A9@PH0PR10MB4534.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rkV4SADDrMtgDhGgYmFi5r+UnFkABCAw2dK1QueK7MQsPbkxcJaqrzHnp+ODd3lLh5euucH5MeHQWPzVskzLV7KIaPrmYiqMiFzCjIZTGzygtxQI5VYzCcOwALaSxs9gZH4ROd9sA/tbWO8XEDxvnjjIyy3o4SNdrm6GhEPbOLPKGM46uE3iWOB/FveyJt1xiGqU4nFgCss6V2Gnh1Cv5yanl5iEigeObskbGB8OcHV+zltXFHVzy/cbibgD3eWWCFma3bfFk7xtFp4O/Ar4LZDw84LgJcXwtvcvVCeCxol5OHtUxDBI4rx/NFWIE1hWuethuMiTJ0ZqEF1Be0C8HRjBe5fC+KH0SB16lFuP7SiP65R8VIQ2t38CedolsoExZDYngjG1ImN3VbMDMGiEmZ1MElM9FlYvdldfesYTpKQ4k0ovi8f0GlB84x2bJAXPHSch74KhoSxpfrhACZkDtEP8Eyd2RBZBz9W4y2IF9Pdqo/HB0Z+uHg1/KPTpZBQ3rq7ilbxisgFq9YjACDQyZMFBwEeemc4qUwVtkqlF9bZxuSeGYbFQZ41Y2xjeUpol
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(136003)(396003)(376002)(346002)(2906002)(86362001)(956004)(186003)(66476007)(83380400001)(16526019)(8936002)(8676002)(66556008)(4326008)(478600001)(6916009)(55016002)(7696005)(54906003)(26005)(4744005)(36916002)(316002)(5660300002)(52116002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aBBTSgr48OcqB98+D/XLXrHLZje60OWiWzuU2obw3gmlPH3oc1xt4i5Oo9yA?=
 =?us-ascii?Q?egxqL6r0zQ/BtRsc8oej84GYHnunUKD/gk0o8YaYoaIQt03dyc6U3pvSijI7?=
 =?us-ascii?Q?5jw7QY5dpxSyjihWwaKlUrfoZqZZ5jd/w5fGtV+qej+ZqhkZnvR5txjVIqJC?=
 =?us-ascii?Q?IK5kOm5new/lNFtTSnV9uPfNXxiHtLwbyU5fMNfi6M4xvSTbKanrOzuQMnbF?=
 =?us-ascii?Q?zVzNM9PvuDJRtQBZi/n90KY2yJKCQwy9DyXAAGJbFpqDdKXes33BnZkIYV4s?=
 =?us-ascii?Q?ASMfqrAP0ysTy73rmLbWk74XahPBOYyNyu8tSA61WgzjwmbT5pHVUk4E2WGo?=
 =?us-ascii?Q?AyKBKONcjOuXCBsbhlyRm1FZRbv8euaSir3xDzYlpRcgbDLbeeVQiDfcMHod?=
 =?us-ascii?Q?mwk+zmuk0M0T7NQwSeUChbGt+hokyIO/zywHjHI7UtGx1jhaaVV3dNZYbDpF?=
 =?us-ascii?Q?zhiPXPX7/MImeCo5H2UElRPZ2cppzwj9xrSjCh1oCZvbXqgSWSU3FUgEJyqL?=
 =?us-ascii?Q?9WAwqoNh9spHwlnVNyZ7kRlluW4ZFwslRa/BJx7vjbI79TEa/C/+n9S9u2nu?=
 =?us-ascii?Q?8w2jP6sCmxIybymHApPN2slXM8WO0e53RXm1ngQQvFoPhDOCaWH14DuqTaAb?=
 =?us-ascii?Q?P1eppnE/iMdwKkEwasE+sgS8It+JaMLpau6raAgkessRprmU45e92BYgqtgo?=
 =?us-ascii?Q?05SbKAAxV+J9Q/TWJNRMYVthSQ42FQwjHxiTBFAQdswr6FrPMMzpvhjCByPO?=
 =?us-ascii?Q?1TdmPKoSkFLIjOahXUxBcnGS97mFDser+2r6cJV5NzG5AbC0lVt5iFfqBlkM?=
 =?us-ascii?Q?NFvt6iBzCYHHQV3u8/0LX0r9J60glRRgoRRNb9DcJStnsahYhMHGrIdvWnJt?=
 =?us-ascii?Q?2KRTV285zsqIzaMdq225lsLOr8uWAPkU3r/tw/vUsDNmBVQcAFNW2WAcFO9u?=
 =?us-ascii?Q?F2DmGLd/HltVWYDWbooyKNkAqmr51HUV14N4BpaoY2v3VIw6rfNOCS65ZC+9?=
 =?us-ascii?Q?ISO5iXkd4LOxd4l+fKFT4z/nsHVu1QExFi2be57rtKEWCI357m2RYqtwgGJP?=
 =?us-ascii?Q?SZL6cD+Ad8iExXRfDwSEvkr+myVKPN1V1oFjsoDq7Ix5vQcWq+SN0OvqBLKg?=
 =?us-ascii?Q?ZD/oZvCeYPGsPm+YYQe4ohIgTKBpp5T3HBR00W5PFjeNJZn9RRkRxryizzGh?=
 =?us-ascii?Q?Q31hBOk4AjlfnHFDx7SueOTKGc4eFgZoUSsOBqOr1//YgDEVPf1qvMsBYLCy?=
 =?us-ascii?Q?hW2Z5L1h+/hf0zbP6hAEVi6ZQavXW0DzQRkEWGjmXFiyWzKgd7kfDLbGRkJj?=
 =?us-ascii?Q?aY9KSXcTxpJ2L2jnudstmvCq?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87943598-0538-41f9-0670-08d8e8e30ee4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 01:21:57.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDjePVPTmNMRn4dpa6hAYR52cXyXFH3VjTzQRl7Ig/hdjF62XOpZ2cbvfnSZwZB9Lo1nWFPN2OpJVja3ym7749qIgonWHkGLUZZWgCylS+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4534
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=891 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170007
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170006
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Vinod,

>> Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
>> Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
>> documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.
>
> Gentle reminder for this patch, Rob has acked this

Was not really expecting a DT patch to be routed through SCSI. But no
worries. I've queued it up.

-- 
Martin K. Petersen	Oracle Linux Engineering
