Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC11326321E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 18:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbgIIQfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 12:35:10 -0400
Received: from mail-eopbgr150052.outbound.protection.outlook.com ([40.107.15.52]:38372
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731105AbgIIQ03 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 12:26:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm36+6QfwIWiXyn+7xHcGvEFRvhJjOSLI8VLQ42gA0yvfDXAsp9TFgEzy8/1v+ySAWjp+6woEDg3pCQcOaFgqS+7v1abYvHJAhgNrJWab8ZB+ZEupy0MSn/w32okkyHF2MTdxI3PGfEiEYQUrtusqO7bvSW9F0ykQRt4wxjWrBs+566e+RAZan2gIWZyP91C/WnS1bUMglnkxR2UIH5Tgb7/sD2v4TLAV/LJNpL1paNcmqPtsKulwWsappCwURMQNaKV4bo2uT5264U+pWszyn0UEoNI1Bz97xiEmxfzmT/R19LPrBcj2s3g6/wtsVq3meAixMMR5zHlEnQBl5aoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/PMyM0lVODWMLqPg64kWdN8rSO+9ozQ2/X2Z1qeeQM=;
 b=aPB0ek9sXx/HDFqbz/gG9uzJCetr5XbdgxHD3DyiFZTHjTyPmM/v6P+8xlUvVnIn5O1iLrcE7MDiuSXA7/q7lP9f3swMQFsR3gkD1+qnyeXVDFoNVBpBCf/wmv45wiBtb17qjEFMZXW8MX0FIsUc5PVM33luFb9I6rz7fgxY9ccbiI93k4s/nMQkB+mF1rtlwU5S1MWPnQeOLg9k2668NRfsQDYPCdPO6f7oQ8Ivz3cmqTEA7y0/5CNApPNujuUlCwkHwI2V8gL0XjvlOqIW/iI4AtbOF5fSdYL/j2Dyp/3LFBcJEFdhgjM2iI11cW2hOG+ePBo1jobXHQrPwOL6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/PMyM0lVODWMLqPg64kWdN8rSO+9ozQ2/X2Z1qeeQM=;
 b=Tkve2/t5Tun5CSfFe4LkNazNdwTV9yxBqSySJBwmiUXYHuy3xm3rivoDLig1yLeSojagg4JE1W5AyzhjgSkDrljxFs4kde7kTnuyML/javQltDmCPbul33c12PYhH/8eyq58e8K2s8Bfv574pRmBTt1raVhAQjMkuKrHbvNeV+M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB4239.eurprd04.prod.outlook.com (2603:10a6:803:48::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 14:46:49 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 14:46:49 +0000
Subject: Re: [PATCH v3 0/8] iommu/arm-smmu: Support maintaining bootloader
 mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
From:   Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <e0a34fde-83f4-7698-0be2-4da1a9f30ee4@nxp.com>
Date:   Wed, 9 Sep 2020 17:46:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR07CA0005.eurprd07.prod.outlook.com
 (2603:10a6:205:1::18) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.107] (188.25.99.125) by AM4PR07CA0005.eurprd07.prod.outlook.com (2603:10a6:205:1::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5 via Frontend Transport; Wed, 9 Sep 2020 14:46:47 +0000
X-Originating-IP: [188.25.99.125]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77ac3f64-d8f0-409f-95d6-08d854cf2e9d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4239:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4239A437541BD321BA58C78EEC260@VI1PR04MB4239.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fbDClgQtOGGvI9YInoT4bpMnOTX7UueDsq7RL3CP0ldMgvCV1pvSPsmo+p0vbwyeQ5gnt+uf6Mfq9EaaeXLi/RF8cvfTq6qsnOTKHqGUMDGVAevB5AifJGRT82ujpOJb3C6OzsJSI7qYXJeHfLDjWw9k14pjSXeBHx9JRgMTM5rdWjY85y1Hd7RpG8aKu3xt1dXXUibpNxU1hlMgTJLh6+v6HlXuvGMzM/PkS64oMnbB9t4/NXeCYqbK/qxlF0P8T1B04a223pnuRfrtgOF/pVmyOC2Vo7RffbGAQk2x9MKt4R3GmxNiYMQ2fjrV8rYd1JDSfquLu7/hNPzzFbXp2Lr9MQn+7IbF02xiHc4TcAbksXzv4puqVF2uiZtILiyBb+9+uLOuxbcIkCJ5Kwmx/Kr4i21GTuAOh+8vb3m5KTlpw0apD7IYfmsDC1234aPdOcM0GRvOK1fIDu8n8mNLgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(8676002)(4744005)(31696002)(66556008)(66946007)(66476007)(5660300002)(53546011)(2906002)(16576012)(16526019)(4326008)(52116002)(186003)(8936002)(966005)(110136005)(83380400001)(26005)(44832011)(478600001)(7416002)(2616005)(956004)(316002)(6486002)(36756003)(86362001)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XPK3h1TLfNSsRh2D48N5Fm8BkoseSlRrEB/EvW0egY2I5+rllgsZ7Lk+4ToEbwqGbXmEtX3lGuCj4wQoTpMsi5xt/W7IRo5lB52I0qz75ZLR9Ev4+Oaf5JhxM9uMhL+K+XsMjdAXXVJ4+mA7igVg84XAJNehHQaQTgXftWsUckXoIPYfTpbRjRK1d2lxbC6dZ0EmK1Pe4JOgcUFczhs0ARJkVHSJv/DK673OtRriUiQ7CW766uUqAHcQvOp2K5Ts2mLnwdSjKiX8NQDKJbGH8XyQAbWgtEODvDvvpcweB82sIqDFiTxZICmfdtGM/17N+RIbX/b4h5FE7DZJh5C/dQ+Le8Sn8Umo0YP0tO5xRZXUeRaq9vO3twWRyLeoX6la8h2GR23P2bEJ+6NEimXkLnTJKBZ/qy2oLIDVz3E29lCRwdi1XBpX1UoWFsmUwiVLWPrf1k5Tt5VltcxOlR7pd1Qys1CsCuoDtXIhh2pl9GQiYB8mrItERtVnDKyA6nz0URk6H3yZAz0ynJT1AWfZjCyRF0DMQZPIba3B8HpuF3brNzL/Y4a/TMNBjObSTwNzIRWoAxCGYJHOUD62ONez/PyMtjIDULKraBI01yIBbQCfGB03EJEysprAEXC7M4vvLPHWKrPYQIz8MQEYVeNHkw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ac3f64-d8f0-409f-95d6-08d854cf2e9d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 14:46:49.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmIMyoAc0wagaG7jlarOAGqrnyl4RsKlf8Nvj5iFUCQWZ4oHm2nBxL7Iy5zO6nlBF39wXCPsxKGY4dxJCM574g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4239
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 9/4/2020 6:55 PM, Bjorn Andersson wrote:
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash or
> efifb.
> 
> Per Will's request this builds on the work by Jordan and Rob for the Adreno
> SMMU support. It applies cleanly ontop of v16 of their series, which can be
> found at
> https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/

Is there a git repo available with all the patches put together?

---
Thanks & Best Regards, Laurentiu
