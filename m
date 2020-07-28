Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC7B230DC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 17:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730670AbgG1P1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 11:27:43 -0400
Received: from mail-eopbgr30045.outbound.protection.outlook.com ([40.107.3.45]:46995
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730637AbgG1P1m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 11:27:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URgk/0jYiV6Lqhcq/IE7jbFSjSTgyGmRU2sDAwAnfH4h+kYOp8zVrQr3wXhZMByMQ6aG/RpQY26Q79ltx/we0APIRmcZDGW1YEVjS35tHhz+1ZhCAwfxBO32A91etlchPGfqQZy1sOg4eAsUCtkBX0Uw+d0K38clB0ytxcnPQXSqabYUYbVmjpUO/qNNbBcOLF6sgVexd1mi7nXbRvDAdqUs7A7OPCxUZE+NfAzyCvH3X/UZxmCUO6K/damcMJ3Zcj9hv6osfSUIZQeZbfq8Chzy4d+zezb52wb2c6+U5nG+aMGeCp+OCjklk0x0S+O6D0fGsvx/xfr7A7p4iBD0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyIPmu5IPM8atUTY/NMsL5hIPz0g7RgINbY55yzixV4=;
 b=Swiag+fCN6Uazp1ZSrXI7UdAvX4S0Zh+je4DZaEcgrkOxhOJLbfkwsPdT4J1UBnhFyyfmSGNWFDwxFAUA/uN/E2uqsSjSeDgy+0qS/VonwakuTWLm/DUR4rITeylvXhU6/oP7g3Y5ZBKe/BityFg3sSVp3q8M1laIh56RRkefMZSansO93Kn9MRbNdibLuo3giS1wbMALa+OUJPO4781UgM7gP0tRAPHRKsMk9jXVUqFVZgjF2+310Q/9nPcbk4ZW7wzhtYpuxIPFJqwqNNQ0RfOupN3uV3/ahn7sBEFcxdkTgkIvFT3oCeoeROP1NtZe695xDdpGK3qvjKSwkBMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyIPmu5IPM8atUTY/NMsL5hIPz0g7RgINbY55yzixV4=;
 b=dtZtqXKqdFlpJUSDra6A62i+K1fOrrTAQ8iw004lS9PAOMf8RcB2IirA0FbyKoQO4WwTffzIYxjioZR2L0E+nn4QzxjmFnH+H4PSTQQkyJjwN6OStZ3Jl4DcBB3girwnEzJU1JAXkk0eKKTFgVc1l34LzeESzE72qen27NRkApY=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB3982.eurprd04.prod.outlook.com (2603:10a6:803:49::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Tue, 28 Jul
 2020 15:27:37 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::4836:ecb4:a785:320a]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::4836:ecb4:a785:320a%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 15:27:37 +0000
Subject: Re: [PATCH 5/5] iommu/arm-smmu: Setup identity domain for boot
 mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org,
        Diana Madalina Craciun <diana.craciun@nxp.com>
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
 <20200709050145.3520931-6-bjorn.andersson@linaro.org>
 <e68033a8-fc00-e7d9-e95c-1014498ade4f@nxp.com>
 <20200709195727.GY388985@builder.lan>
From:   Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <14d085ad-71a3-959c-9eb8-fcaa1aa3ae17@nxp.com>
Date:   Tue, 28 Jul 2020 18:27:34 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200709195727.GY388985@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0124.eurprd04.prod.outlook.com
 (2603:10a6:208:55::29) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.107] (82.78.77.33) by AM0PR04CA0124.eurprd04.prod.outlook.com (2603:10a6:208:55::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Tue, 28 Jul 2020 15:27:36 +0000
X-Originating-IP: [82.78.77.33]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0024442f-88c3-4331-f19c-08d8330ac244
X-MS-TrafficTypeDiagnostic: VI1PR04MB3982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3982E72457F05CC7F2038143EC730@VI1PR04MB3982.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wnijq/zHTtM4dfBkRxkNLRvwr32Kgx9UGu9z/GZZHOtltOpVu1tbbvu/71njWzzv4XUHsu0ngk7EDeAniB/eB2TKJTyIR2538jEkQHvMlTTkY63FeLsOteVkXq5azErW7Oe56L22SWqQfUhAALaFZJ91G+iDNiCg0fKAxkY9ogR2mltwSzljSyaORdDIQ/1ObW4tJ0pgZdR8IliCXT2o1oMGhic/VdVRHHTjBD1jwbigWfxXmE9QVNDA6MPY15SToj+k9ddLwwLJEh+OELGyhdgRVviqPspdvKAyGCesgE66NcyefQEgZMHpRvaHGAx+ariuwbgbiTeVZNUEdcKPX12Eks8fVINbizowvxN6Ssf5Wj+nigfOZQ+ysgl4ay0X
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(31696002)(16526019)(53546011)(186003)(52116002)(8676002)(8936002)(478600001)(4326008)(31686004)(5660300002)(16576012)(54906003)(86362001)(6916009)(7416002)(83380400001)(316002)(2616005)(66946007)(36756003)(6486002)(66556008)(66476007)(26005)(44832011)(2906002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Dx4+9Nnxnrwm4kTOM+Yl+exsD1asRCRAabRw8eeclVczGwntY8hLJrY8Vu/zHqY3CUJ7tysRu0InpXYC6e+2laxFnnEmSTCavM8Fbh3BJoi8Iim3jNihf/2hZ+7dQdHEQeg4yCY5WYfnWGS6q2t/G/EN3uoMjPVLyCOZyPePvI6h8YsNMSOFvvUgg+1aM6BVzFWMtlWj5LpzrVe5wzLDC31HRs2S6Xhv0rFD9ZR+YjTnwc6z7vT09LSvjW2zBFs5MW3ZiRVsraJIk5qGAk5jHaaFddDDXjV3S4FEHYF4RKpq0DddsJdE16wdEQmRjqhVT1g5v/CUzDQQmuuuTiGquv6IW/f6ZDH5Rky+x8xBHFjzIqcqBQrsj/srmfVZTDMtfX+byzde6X7aHy96VDPgeA0N+oSgEznJaJQ5fXh8pEEk8Z6IpN9FgGWjkCDRrfNEStGq/8/glHne1KZ/wUfNFSjz56D9PXQilVZA7avyzSE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0024442f-88c3-4331-f19c-08d8330ac244
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 15:27:37.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDbuV/Oau7W/g1YlmrwYpKbu9i1r5XOLY+xFN69rji50AioRF8zJ7dbVcEFCvu2otu48MVGmLlAB1FfuUGcROg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3982
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/9/2020 10:57 PM, Bjorn Andersson wrote:
> On Thu 09 Jul 08:50 PDT 2020, Laurentiu Tudor wrote:
> 
>>
>>
>> On 7/9/2020 8:01 AM, Bjorn Andersson wrote:
>>> With many Qualcomm platforms not having functional S2CR BYPASS a
>>> temporary IOMMU domain, without translation, needs to be allocated in
>>> order to allow these memory transactions.
>>>
>>> Unfortunately the boot loader uses the first few context banks, so
>>> rather than overwriting a active bank the last context bank is used and
>>> streams are diverted here during initialization.
>>>
>>> This also performs the readback of SMR registers for the Qualcomm
>>> platform, to trigger the mechanism.
>>>
>>> This is based on prior work by Thierry Reding and Laurentiu Tudor.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>  drivers/iommu/arm-smmu-qcom.c | 11 +++++
>>>  drivers/iommu/arm-smmu.c      | 80 +++++++++++++++++++++++++++++++++--
>>>  drivers/iommu/arm-smmu.h      |  3 ++
>>>  3 files changed, 90 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
>>> index 86b1917459a4..397df27c1d69 100644
>>> --- a/drivers/iommu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm-smmu-qcom.c
>>> @@ -26,6 +26,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] = {
>>>  static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>>>  {
>>>  	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
>>> +	u32 smr;
>>>  	u32 reg;
>>>  	int i;
>>>  
>>> @@ -56,6 +57,16 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>>>  		}
>>>  	}
>>>  
>>> +	for (i = 0; i < smmu->num_mapping_groups; i++) {
>>> +		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
>>> +
>>> +		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
>>> +			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
>>> +			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
>>> +			smmu->smrs[i].valid = true;
>>> +		}
>>> +	}
>>> +
>>>  	return 0;
>>>  }
>>>  
>>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>>> index e2d6c0aaf1ea..a7cb27c1a49e 100644
>>> --- a/drivers/iommu/arm-smmu.c
>>> +++ b/drivers/iommu/arm-smmu.c
>>> @@ -652,7 +652,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>>>  }
>>>  
>>>  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>>> -					struct arm_smmu_device *smmu)
>>> +					struct arm_smmu_device *smmu,
>>> +					bool boot_domain)
>>>  {
>>>  	int irq, start, ret = 0;
>>>  	unsigned long ias, oas;
>>> @@ -770,6 +771,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>>>  		ret = -EINVAL;
>>>  		goto out_unlock;
>>>  	}
>>> +
>>> +	/*
>>> +	 * Use the last context bank for identity mappings during boot, to
>>> +	 * avoid overwriting in-use bank configuration while we're setting up
>>> +	 * the new mappings.
>>> +	 */
>>> +	if (boot_domain)
>>> +		start = smmu->num_context_banks - 1;
>>> +
>>>  	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
>>>  				      smmu->num_context_banks);
>>>  	if (ret < 0)
>>> @@ -1149,7 +1159,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>>>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>  	struct arm_smmu_master_cfg *cfg;
>>>  	struct arm_smmu_device *smmu;
>>> +	bool free_identity_domain = false;
>>> +	int idx;
>>>  	int ret;
>>> +	int i;
>>>  
>>>  	if (!fwspec || fwspec->ops != &arm_smmu_ops) {
>>>  		dev_err(dev, "cannot attach to SMMU, is it on the same bus?\n");
>>> @@ -1174,7 +1187,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>>>  		return ret;
>>>  
>>>  	/* Ensure that the domain is finalised */
>>> -	ret = arm_smmu_init_domain_context(domain, smmu);
>>> +	ret = arm_smmu_init_domain_context(domain, smmu, false);
>>>  	if (ret < 0)
>>>  		goto rpm_put;
>>>  
>>> @@ -1190,9 +1203,34 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>>>  		goto rpm_put;
>>>  	}
>>>  
>>> +	/* Decrement use counter for any references to the identity domain */
>>> +	mutex_lock(&smmu->stream_map_mutex);
>>> +	if (smmu->identity) {
>>> +		struct arm_smmu_domain *identity = to_smmu_domain(smmu->identity);
>>> +
>>> +		for_each_cfg_sme(cfg, fwspec, i, idx) {
>>> +			dev_err(smmu->dev, "%s() %#x\n", __func__, smmu->smrs[idx].id);
>>
>> Debug leftovers?
>>
> 
> Indeed.
> 
>> Apart from that I plan to give this a go on some NXP chips. Will keep
>> you updated.
>>
> 
> Thanks, I'm expecting that all you need is the first patch in the series
> and some impl specific cfg_probe that sets up (or read back) the
> relevant SMRs and mark them valid.
> 

I finally managed to give a go to the v2 of this patchset and tested it
on a NXP LS2088A chip with the diff [1] below, so please feel free to add:

Tested-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Now a question for the SMMU folks: would the approach in the diff below
be acceptable?

[1]

--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -102,6 +102,32 @@ static struct arm_smmu_device
*cavium_smmu_impl_init(struct arm_smmu_device *smm
        return &cs->smmu;
 }

+static int nxp_cfg_probe(struct arm_smmu_device *smmu)
+{
+       int i, cnt = 0;
+       u32 smr;
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
+       .cfg_probe = nxp_cfg_probe,
+};

 #define ARM_MMU500_ACTLR_CPRE          (1 << 1)

@@ -171,6 +197,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct
arm_smmu_device *smmu)
        if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
                smmu->impl = &calxeda_impl;

+       if (of_property_read_bool(np, "nxp,keep-bypass-mappings"))
+               smmu->impl = &nxp_impl;
+
        if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
            of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
                return qcom_smmu_impl_init(smmu);

---
Thanks & Best Regards, Laurentiu
