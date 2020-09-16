Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E11726C183
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 12:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgIPKKp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 06:10:45 -0400
Received: from mail-eopbgr130052.outbound.protection.outlook.com ([40.107.13.52]:8094
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726425AbgIPKJz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 06:09:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJspW/HSxCHOogVquAWZSLUPjY8lfHku0pTNPFRUfc6j8HUvAWoUFiBIKzLwn3fEtZj0sbNGKcrQgagLSUjo+n58PfIx4nWU/01JffQ/Q+W36esMSC7goGl0y13TFuaOrZCcJoxdmOQudpqYjRs3xUarYyp2pe9/vLstbNgC5nh7d+sjWLGo4PeBHO6u6J1n9+B+m9KkC3SbvgkdcLJfjG5dpcRTqbqk+W2fWLwi8e8s2ZW+h4n0Pqs7e8Tle+fZu9kAe6ESaZg5Ri26rF15EKMFzKJfP2y0YOR5L73pA6ngSkttbKG0eBvxPTtydJv5bYd9WpV5ACgX4UvofwPzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9w+pZjUhoYiVwRdiUFslJXMSYsTo1gApXr2IxLrupA=;
 b=cBQcmr7dgmD4LLqN8QlkxQGVR/ldhJ9S0UQmsFXg9oZWoPN7RBx2H42nFwv5ezsEteHTk/nmBOgYzZU46hoCmiyWU0JANGezfO1Vn1/W0fteUDS4BPjegnpIl849oSu/8yIV+7U5OVSC+gCRQhFx0GbSmRKNalFJoYy75HOXr9Bwtl2jwX/8GOsurcKdWv3taCm1VjG7vaAM8Dn1GKs9IJh068CAjjJPl2q5ycy8zIjK/WRyYsTvAsGR4LCEhNSy/uv5eOI3BEa3Q6AhheLMA7g/nV48dLpCEWPrLu886uW+AgE/kbVzV0h3Y4ncYj6KM7iCRBRkkot6hyz22nrjiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9w+pZjUhoYiVwRdiUFslJXMSYsTo1gApXr2IxLrupA=;
 b=BSKowub0dlKecrkQ1WwuE03qcho9S3wtI993TGgEQLQHO+Vp/GR2Z1RWKJPt3rNUab91awSZ9mu6pLOlATpWyGbDSokXy8CjHKUgBWsbav4T9m1N2emlPxYqdCVj8ahZH2TnAjYhL+/PUZzD89YsvD7Tl7mFJrp7f3IYA7qVRSY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 10:09:48 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 10:09:48 +0000
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
Message-ID: <1eb59ae2-bec4-aaf7-f07d-bec75979e4f7@nxp.com>
Date:   Wed, 16 Sep 2020 13:09:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0101CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::45) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.102] (86.123.60.218) by AM4PR0101CA0077.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 10:09:46 +0000
X-Originating-IP: [86.123.60.218]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6b47e0b-d3c0-4303-8ed8-08d85a28a4b9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7117:
X-Microsoft-Antispam-PRVS: <VI1PR04MB71174BED601556D71F5A567AEC210@VI1PR04MB7117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IlO/YqtAQaMuAYd/7XlcmJS852upwwGHij4gNKUgYOWJ42whr4e6D0CMNaQZhUyBrqILh1AEpKCt4WFQAISa/+2EXYQgR1Scn4jgYI1jp1kYK64x70MKsAhNKoCeROg9QOsYFgLf7x4QkLBnY22QgJCfdjlyUrW/nY22N9bvpejqdfcMsX1yLApBUpDjBL8USGGKJ+lGCt++DUFojAWp8tSu9iL3jLCdD64+p0xek72ufUKEkw3RSQgR1Hqx6EF+unvl5eWCu5vINZnkGpRhvuJPOi5aHpuZhWkfjU0qRSq8SyvWB6BxJ5KSLAzcpu0wv1LvS+40+rS8W9Zd9dV0SmxwyyXJqQXDad4moOBBz6ABEe5WzHJFoPSKTiDQVnib5JC0l5shi7vnSsVvVXKiqL4CHjXOVdRtRs/pXUACFlq4uHP33Lo6/UtLDBJBq/Bms7gQCpvigoNYvM9zZdFQHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(7416002)(16526019)(8936002)(6486002)(53546011)(478600001)(31686004)(83380400001)(26005)(186003)(2906002)(5660300002)(956004)(36756003)(2616005)(316002)(16576012)(86362001)(44832011)(8676002)(4326008)(66556008)(110136005)(66476007)(52116002)(31696002)(966005)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 9a4pEUDGphRqvgrQN47lxPwhYp6vcfTUVc5lK0zrSagcG4wXKpzLzpXRGkK2jy31J/p6Mbwjrz0k6FUDma83zaxxWKS/FJLn49FPquW+HTYQsIW10nEbMjWz7tH7Bb6MEVC+ngPpLALRPROAr0r9gCCQtUjW8o2i3ZYfrCMGHJ5RmTjzOerG02ySlzF+UsrJqbTqwT+hVRtjAxV+6Gghh8qsaLdT4qEYzo/fIXLz+5s/mWdfFlWHGZ56XDmRiWnqbvtYZhOArPoeN3mGp2OechcvHt12CxLbkbE2W2djqdNRuUBvCyBKiIaIhiuwQdZgVAGTdsYboe7Qhv3CIp9XcWRHrlcY4Hb9Z65gRpYWInPEKHOn5hVWeBlqYoo21N4XehJHImFUHgkznXZlGSuhirJEC4Mg06PtVm+dPc0gfAAmV0hfQrIQVDQCB2RpdPA4BRNYGc+gzI96/kyOKs1CSFkxM7MRfsjr/CPeqBRFxE//oeisEY/SSA6ONUQY8EoDyeoDiaZWw7y33W8dGeyrgINrDU7/8qmQ+P/NUzLwYUAY0jZmFaWyqX+uOL/DP0FEO2K/z99GioUakHySB5OkItVSubknUauJkr2rLNqz3ueoA3b6TIL5akro0tir+RF44iyU5zDwWoGmFpsoT4buYA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b47e0b-d3c0-4303-8ed8-08d85a28a4b9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 10:09:48.7527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeWLi+WUXpfFvurrXd6Lwp/LTd0bgnBhCW8jro/aya5SjYFugSQqytfYiBudvMe3ae/Dr4YB8In6VvdQNaC1iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/4/2020 6:55 PM, Bjorn Andersson wrote:
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash or
> efifb.
> 
> Per Will's request this builds on the work by Jordan and Rob for the Adreno
> SMMU support. It applies cleanly ontop of v16 of their series, which can be
> found at
> https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/
> 
> Bjorn Andersson (8):
>   iommu/arm-smmu: Refactor context bank allocation
>   iommu/arm-smmu: Delay modifying domain during init
>   iommu/arm-smmu: Consult context bank allocator for identify domains
>   iommu/arm-smmu-qcom: Emulate bypass by using context banks
>   iommu/arm-smmu-qcom: Consistently initialize stream mappings
>   iommu/arm-smmu: Add impl hook for inherit boot mappings
>   iommu/arm-smmu: Provide helper for allocating identity domain
>   iommu/arm-smmu-qcom: Setup identity domain for boot mappings
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 111 ++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 122 ++++++++++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  14 ++-
>  3 files changed, 205 insertions(+), 42 deletions(-)
> 

Tested on a NXP LX2160A with John's tree [1] and below diff [2], so for
the whole series:

Tested-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

[1]
https://git.linaro.org/people/john.stultz/android-dev.git/log/?h=dev/db845c-mainline-WIP
[2]
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -190,11 +190,43 @@ static const struct arm_smmu_impl mrvl_mmu500_impl = {
        .reset = arm_mmu500_reset,
 };

+static int nxp_smmu_inherit_mappings(struct arm_smmu_device *smmu)
+{
+       u32 smr;
+       int i, cnt = 0;
+
+       for (i = 0; i < smmu->num_mapping_groups; i++) {
+               smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
+
+               if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
+                       smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
+                       smmu->smrs[i].mask =
FIELD_GET(ARM_SMMU_SMR_MASK, smr);
+                       smmu->smrs[i].valid = true;
+
+                       smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
+                       smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
+                       smmu->s2crs[i].count++;
+
+                       cnt++;
+               }
+       }
+
+       dev_notice(smmu->dev, "\tpreserved %d boot mapping%s\n", cnt,
+                  cnt == 1 ? "" : "s");
+
+       return 0;
+}
+
+static const struct arm_smmu_impl nxp_impl = {
+       .inherit_mappings = nxp_smmu_inherit_mappings,
+};

 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 {
        const struct device_node *np = smmu->dev->of_node;

        /*
         * Set the impl for model-specific implementation quirks first,
         * such that platform integration quirks can pick it up and
@@ -229,5 +261,12 @@ struct arm_smmu_device *arm_smmu_impl_init(struct
arm_smmu_device *smmu)
        if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
                smmu->impl = &mrvl_mmu500_impl;

+       if (of_property_read_bool(np, "nxp,keep-bypass-mappings"))
+               smmu->impl = &nxp_impl;

---
Best Regards, Laurentiu
