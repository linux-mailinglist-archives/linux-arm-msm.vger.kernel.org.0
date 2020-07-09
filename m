Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C1821A40A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 17:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgGIPud (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 11:50:33 -0400
Received: from mail-eopbgr60045.outbound.protection.outlook.com ([40.107.6.45]:49936
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726519AbgGIPuc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 11:50:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqD0SKm2dRV9CUgi2KyYPcNyr+Ogyv70O8lerxWBPDOOJ4juvnaKIV7JB0A0SkBb4bc1wfx2cMswEc5QzRWuCIfu4zTsH7k+E3rH2jTU2h26DkT3upzNx3DH7i3ZkmC0eH8XThBXevguc0H2OFcGVOXX6RjKznvHFimzCfI9ISeDkJ6nlo7Q9WupvFouychoFjXekVFTvFQbhAamEaUDBLL6t5QBgger7yPa35O4nINp+6fdWas0JYq0G85SMhgIsnsk77DtCSYMjxFXU5VdCLW6Qpwj22mMBTJICFFB5BGJ09QAZPwvK0tQrt4uZ+tK92HJh+5qeoQKCeQ4ZEneBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fggkiPpDJ2hj17bYf262NLrzhxmGwmKZFfsgR2SHjak=;
 b=nM7aZFLstVQ+Eb2RnGIIGEc5tpPnZBl6krOZ3CIRztSTmZjAzOKJDjL2BHlx4KeYIuPzyTPmBFE63hOEhnfakZ9kGmoe8cdEMcFI8emxfJGURpQMwvy/b5sPdetrRWGBI8s1ixF+SaxPoJEFJsjTFhik3xd31Fql7ualiSfcCRj1vV0yT2mTP6EuyPjoGBQ9xLtVkmA+pbFbUe6hiqlxK4tDr1jVcZj9OPyr0YfrLFhnpLGFTCD8yXVu/OLMcFa7QHYi4G4Yl7436NUJmOaRQBXv4U8+DBK0AR2MY//C8WksPZ3u2Y5OwcHkOedQog9/d9nj5q2y+QuWP42gtVbdxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fggkiPpDJ2hj17bYf262NLrzhxmGwmKZFfsgR2SHjak=;
 b=Z3kYWJPrw2GH+OODhI6k5Zld9JGhZMvWR6PoXttVqTppeIoYlq1ouW06o0ryugER7xjlg07Cj7d99CU2XPQghUey2He0OdWgSZy9xfrhyQrtYESAn78Xyl8OZEBNYkoHHdap+3od24P0I4guMvZihtJHRMu7CSQqAaulcdyNrwM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB5869.eurprd04.prod.outlook.com (2603:10a6:803:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 15:50:28 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::b97a:64f0:3ab5:d7fa]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::b97a:64f0:3ab5:d7fa%5]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 15:50:28 +0000
Subject: Re: [PATCH 5/5] iommu/arm-smmu: Setup identity domain for boot
 mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
 <20200709050145.3520931-6-bjorn.andersson@linaro.org>
From:   Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <e68033a8-fc00-e7d9-e95c-1014498ade4f@nxp.com>
Date:   Thu, 9 Jul 2020 18:50:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200709050145.3520931-6-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR04CA0136.eurprd04.prod.outlook.com (2603:10a6:207::20)
 To VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.107] (86.120.184.194) by AM3PR04CA0136.eurprd04.prod.outlook.com (2603:10a6:207::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 15:50:26 +0000
X-Originating-IP: [86.120.184.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5130db7d-1453-4011-d8ee-08d8241fcd2b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5869:
X-Microsoft-Antispam-PRVS: <VI1PR04MB586982365D350B6B9E9789E2EC640@VI1PR04MB5869.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d5uqTvvgE4D7vpRU9rsPTbIYZ9rrthzz/46TupZA7MrDFJPSAfRQAVI/lFOHRzcrJkkFg+9CTBft7dV5vOdmnKlRVv1K+oOVHZeADXjApuYtfB8De/5+dBw0Hupf/ZlqaknFYG/smU4RnWNpJ47hIy9x0DRg4L4khKZidEIMyb1BxcJkTcPaXdDkh8Yig9pq2ZTLMj+1+EWvPvDYW/zd/+C3icw6B4TXlsOgOLmVI7oPCOhw3YqoE2O3pT4fWBFNyP0gQYWy6XOUTJ45AjBReCovcMl94axszS9HYjv/5WZSdsG0XGaTkmWt5s51YYJ3K5AYIk6ZEiVQIz87MnBcIv+akboH4AV/i5/rHgC0tGTfSe1LG6sljn9nIdAAfwVy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(86362001)(956004)(2616005)(2906002)(36756003)(110136005)(4326008)(186003)(31696002)(44832011)(7416002)(31686004)(8676002)(52116002)(6666004)(8936002)(26005)(5660300002)(16526019)(83380400001)(478600001)(53546011)(16576012)(66476007)(66556008)(66946007)(316002)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8UkZ6fP316U+eJMpHn7YQ4FsQvoLGGuRQ3eaw+uo+PrE9WlmB47W20TnTArxUrGCzc9eSJQTgaPHEQmEvt25riIrd87ZGc4fUSEbDiq77Pgyyjps9CRJ4T0rTlxbZe/PggEE/aI6bK1qhugO9Uf0ntShf/gy/KrG3x2+5oWIMjFMeKfjSO1srE05HYsoVJo+qP5wsysNrOvV/v2dj4nq4t23fnNw19KoSKfkAtfZoxB/0ryVbuGdf1HjduUtO/KJLluGp85yoSt/slEUprrXaw2wqTCk3qGuDtfTt0jr+1mKFvxCSwdPop7fWCVwSmdnehWrPYOolLgOo1zbvhvih/pYlBxp/aYRt9F7qZqYAQ28mYd0prxDHr+yqpiURVxwKYr8TbgiRDCSH3iXt6VFbnja6y9//Y0Xd6W99ZcqiEAgXFJ9n2AS4VCNrcRdOM328fFHVJafc61uvmIaVDvtieHBcHlx01wmPab0zzvxGtK6M0SCkOeAIAMihVpFNctI
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5130db7d-1453-4011-d8ee-08d8241fcd2b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 15:50:27.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aosFFyYNWH+tT4pL6wK5O8amZ7VtkDWZwhJFo9QUOU+IQAiaDA8p8WMIdaoFnRMk//ZOzVdI/bMoyiY++BJsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5869
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/9/2020 8:01 AM, Bjorn Andersson wrote:
> With many Qualcomm platforms not having functional S2CR BYPASS a
> temporary IOMMU domain, without translation, needs to be allocated in
> order to allow these memory transactions.
> 
> Unfortunately the boot loader uses the first few context banks, so
> rather than overwriting a active bank the last context bank is used and
> streams are diverted here during initialization.
> 
> This also performs the readback of SMR registers for the Qualcomm
> platform, to trigger the mechanism.
> 
> This is based on prior work by Thierry Reding and Laurentiu Tudor.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/iommu/arm-smmu-qcom.c | 11 +++++
>  drivers/iommu/arm-smmu.c      | 80 +++++++++++++++++++++++++++++++++--
>  drivers/iommu/arm-smmu.h      |  3 ++
>  3 files changed, 90 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 86b1917459a4..397df27c1d69 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -26,6 +26,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] = {
>  static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>  {
>  	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
> +	u32 smr;
>  	u32 reg;
>  	int i;
>  
> @@ -56,6 +57,16 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>  		}
>  	}
>  
> +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> +		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> +
> +		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
> +			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> +			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
> +			smmu->smrs[i].valid = true;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index e2d6c0aaf1ea..a7cb27c1a49e 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -652,7 +652,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>  }
>  
>  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> -					struct arm_smmu_device *smmu)
> +					struct arm_smmu_device *smmu,
> +					bool boot_domain)
>  {
>  	int irq, start, ret = 0;
>  	unsigned long ias, oas;
> @@ -770,6 +771,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> +
> +	/*
> +	 * Use the last context bank for identity mappings during boot, to
> +	 * avoid overwriting in-use bank configuration while we're setting up
> +	 * the new mappings.
> +	 */
> +	if (boot_domain)
> +		start = smmu->num_context_banks - 1;
> +
>  	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
>  				      smmu->num_context_banks);
>  	if (ret < 0)
> @@ -1149,7 +1159,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct arm_smmu_master_cfg *cfg;
>  	struct arm_smmu_device *smmu;
> +	bool free_identity_domain = false;
> +	int idx;
>  	int ret;
> +	int i;
>  
>  	if (!fwspec || fwspec->ops != &arm_smmu_ops) {
>  		dev_err(dev, "cannot attach to SMMU, is it on the same bus?\n");
> @@ -1174,7 +1187,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		return ret;
>  
>  	/* Ensure that the domain is finalised */
> -	ret = arm_smmu_init_domain_context(domain, smmu);
> +	ret = arm_smmu_init_domain_context(domain, smmu, false);
>  	if (ret < 0)
>  		goto rpm_put;
>  
> @@ -1190,9 +1203,34 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		goto rpm_put;
>  	}
>  
> +	/* Decrement use counter for any references to the identity domain */
> +	mutex_lock(&smmu->stream_map_mutex);
> +	if (smmu->identity) {
> +		struct arm_smmu_domain *identity = to_smmu_domain(smmu->identity);
> +
> +		for_each_cfg_sme(cfg, fwspec, i, idx) {
> +			dev_err(smmu->dev, "%s() %#x\n", __func__, smmu->smrs[idx].id);

Debug leftovers?

Apart from that I plan to give this a go on some NXP chips. Will keep
you updated.

Thanks a lot Bjorn.

---
Best Regards, Laurentiu
