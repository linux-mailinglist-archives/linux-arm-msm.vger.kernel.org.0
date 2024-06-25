Return-Path: <linux-arm-msm+bounces-24158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F091711A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 21:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 460FD1F23608
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 19:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BE917C7CA;
	Tue, 25 Jun 2024 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G+o8+Jfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F41DDF8;
	Tue, 25 Jun 2024 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719343730; cv=none; b=N+iU4yJS0qnkDcyvglffccjwWnjYUZED2QtBxLi/FLOKq8TyNX0bOlCAOuTTCjfN1pECspYAGOgjPEgK0pMpbTckR/yM3EzQ0Ot2CveNIdnHZSPiotAYaB2AoN41yoQYRewXv870y0ircyMnRjrfTqHGJfsCJcom+arladND200=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719343730; c=relaxed/simple;
	bh=wKw4fSRujlZo75BKDNvURIpV5MfBvi3SuA6SlYPTn5Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=l2QwrrroWf7Ybxq0iDgNPNhg/Kszrtg1QT5k17Kcoq9pRfwHRkTetkFnLKBYMdma/yp0sXqQzvLlk8qQTKpgWr+pVx6g+f5Q0vzBohF577pR4HjaVRuE4kW7K8yUsVyE+Fpo0iQFqGZE9R4bdpsqo5SbKT4Mad+wj3CsK4YwMRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G+o8+Jfs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PH3oJg020248;
	Tue, 25 Jun 2024 19:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orE2l7vLp3K+/lBnEiUd9c/7VBeiu96/Mu0S1CV9vpU=; b=G+o8+JfsHpwph/uJ
	INOqvSSkQ0AIBg4nBIu67BZ8i9GFDIqkXtOczk3j+edoUgsOISVPcOTcsRaqvR5U
	ln0ffeKQCLw38g+KK/YT2jM+W5AFiIaHLqeJqhE+uZ7lUFkITwCC4eykS7D4yjb0
	K3KxN/l88XtK2fu5ChvEj9NUX890bsRRRL40I/BqKCtQAYvQoPRMpvA2x6/ZbKWT
	o8e0qD1ESvhH3OwNLVKCHqPWh1cgYNQnH4yYmNxWy4l9vRpfjsQlYz8yQ/iUWihs
	H8qRpMJBPVFpv6OOyvuNC6aH1UHGjNkyEUQSl+/EcOGND3rNwaDHW9CjZbNPgoqV
	si5ryQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yqgwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 19:28:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PJSclL021413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 19:28:38 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 12:28:37 -0700
Message-ID: <3a5f68fb-2487-bda0-91a1-18ecd414937f@quicinc.com>
Date: Tue, 25 Jun 2024 12:28:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] drm/msm/dpu: Configure DP INTF/PHY selector
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20240613-dp-phy-sel-v2-1-99af348c9bae@linaro.org>
 <bbdb8f56-4948-b0dd-55bd-ca59b78ed559@quicinc.com>
 <0ae0fddb-07f4-3eb9-5a62-0f7f15153452@quicinc.com>
In-Reply-To: <0ae0fddb-07f4-3eb9-5a62-0f7f15153452@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xlA2HGlo_tNSHn39_g-kC_FWwMjbJY3Z
X-Proofpoint-ORIG-GUID: xlA2HGlo_tNSHn39_g-kC_FWwMjbJY3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_14,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250143



On 6/25/2024 12:26 PM, Abhinav Kumar wrote:
> 
> 
> On 6/24/2024 6:39 PM, Abhinav Kumar wrote:
>>
>>
>> On 6/13/2024 4:17 AM, Dmitry Baryshkov wrote:
>>> From: Bjorn Andersson <andersson@kernel.org>
>>>
>>> Some platforms provides a mechanism for configuring the mapping between
>>> (one or two) DisplayPort intfs and their PHYs.
>>>
>>> In particular SC8180X provides this functionality, without a default
>>> configuration, resulting in no connection between its two external
>>> DisplayPort controllers and any PHYs.
>>>
>>
>> I have to cross-check internally about what makes it mandatory to 
>> program this only for sc8180xp. We were not programming this so far 
>> for any chipset and this register is present all the way from sm8150 
>> till xe10100 and all the chipsets do not have a correct default value 
>> which makes me think whether this is required to be programmed.
>>
>> Will update this thread once I do.
>>
> 
> Ok, I checked more. The reason this is mandatory for sc8180xp is the 
> number of controllers is greater than number of PHYs needing this to be 
> programmed. On all other chipsets its a 1:1 mapping.
> 

Correction, number of controllers is < number of PHYs.

> I am fine with the change once the genmap comment is addressed.
> 
>>> The change implements the logic for optionally configuring which PHY
>>> each of the DP INTFs should be connected to and marks the SC8180X DPU to
>>> program 2 entries.
>>>
>>> For now the request is simply to program the mapping 1:1, any support
>>> for alternative mappings is left until the use case arrise.
>>>
>>> Note that e.g. msm-4.14 unconditionally maps INTF 0 to PHY 0 on all
>>> rlatforms, so perhaps this is needed in order to get DisplayPort working
>>> on some other platforms as well.
>>>
>>> Signed-off-by: Bjorn Andersson <andersson@kernel.org>
>>> Co-developed-by: Bjorn Andersson <andersson@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Changes in v2:
>>> - Removed entry from the catalog.
>>> - Reworked the interface of dpu_hw_dp_phy_intf_sel(). Pass two entries
>>>    for the PHYs instead of three entries.
>>> - It seems the register isn't present on sdm845, enabled the callback
>>>    only for DPU >= 5.x
>>> - Added a comment regarding the data being platform-specific.
>>> - Link to v1: 
>>> https://lore.kernel.org/r/20230612221047.1886709-1-quic_bjorande@quicinc.com
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 39 
>>> +++++++++++++++++++++++++++---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h | 18 ++++++++++++--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h   |  7 ++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 11 ++++++++-
>>>   4 files changed, 69 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> index 05e48cf4ec1d..a11fdbefc8d2 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> @@ -231,8 +231,38 @@ static void dpu_hw_intf_audio_select(struct 
>>> dpu_hw_mdp *mdp)
>>>       DPU_REG_WRITE(c, HDMI_DP_CORE_SELECT, 0x1);
>>>   }
>>> +static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
>>> +                   enum dpu_dp_phy_sel phys[2])
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c = &mdp->hw;
>>> +    unsigned int intf;
>>> +    u32 sel = 0;
>>> +
>>> +    sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF0, phys[0]);
>>> +    sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF1, phys[1]);
>>> +
>>> +    for (intf = 0; intf < 2; intf++) {
>>
>> I wonder if ARRAY_SIZE(phys) is better here.
>>
>>> +        switch (phys[intf]) {
>>> +        case DPU_DP_PHY_0:
>>> +            sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY0, intf + 1);
>>> +            break;
>>> +        case DPU_DP_PHY_1:
>>> +            sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY1, intf + 1);
>>> +            break;
>>> +        case DPU_DP_PHY_2:
>>> +            sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY2, intf + 1);
>>> +            break;
>>> +        default:
>>> +            /* ignore */
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    DPU_REG_WRITE(c, MDP_DP_PHY_INTF_SEL, sel);
>>> +}
>>> +
>>>   static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>>> -        unsigned long cap)
>>> +        unsigned long cap, const struct dpu_mdss_version *mdss_rev)
>>>   {
>>>       ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>>>       ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>>> @@ -245,6 +275,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops 
>>> *ops,
>>>       ops->get_safe_status = dpu_hw_get_safe_status;
>>> +    if (mdss_rev->core_major_ver >= 5)
>>> +        ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
>>> +
>>>       if (cap & BIT(DPU_MDP_AUDIO_SELECT))
>>>           ops->intf_audio_select = dpu_hw_intf_audio_select;
>>>   }
>>> @@ -252,7 +285,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops 
>>> *ops,
>>>   struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
>>>                         const struct dpu_mdp_cfg *cfg,
>>>                         void __iomem *addr,
>>> -                      const struct dpu_mdss_cfg *m)
>>> +                      const struct dpu_mdss_version *mdss_rev)
>>>   {
>>>       struct dpu_hw_mdp *mdp;
>>> @@ -270,7 +303,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(struct 
>>> drm_device *dev,
>>>        * Assign ops
>>>        */
>>>       mdp->caps = cfg;
>>> -    _setup_mdp_ops(&mdp->ops, mdp->caps->features);
>>> +    _setup_mdp_ops(&mdp->ops, mdp->caps->features, mdss_rev);
>>>       return mdp;
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> index 6f3dc98087df..3a17e63b851c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> @@ -67,6 +67,13 @@ struct dpu_vsync_source_cfg {
>>>       u32 vsync_source;
>>>   };
>>> +enum dpu_dp_phy_sel {
>>> +    DPU_DP_PHY_NONE,
>>> +    DPU_DP_PHY_0,
>>> +    DPU_DP_PHY_1,
>>> +    DPU_DP_PHY_2,
>>> +};
>>> +
>>>   /**
>>>    * struct dpu_hw_mdp_ops - interface to the MDP TOP Hw driver 
>>> functions
>>>    * Assumption is these functions will be called after clocks are 
>>> enabled.
>>> @@ -125,6 +132,13 @@ struct dpu_hw_mdp_ops {
>>>       void (*get_safe_status)(struct dpu_hw_mdp *mdp,
>>>               struct dpu_danger_safe_status *status);
>>> +    /**
>>> +     * dp_phy_intf_sel - configure intf to phy mapping
>>> +     * @mdp: mdp top context driver
>>> +     * @phys: list of phys the DP interfaces should be connected to. 
>>> 0 disables the INTF.
>>> +     */
>>> +    void (*dp_phy_intf_sel)(struct dpu_hw_mdp *mdp, enum 
>>> dpu_dp_phy_sel phys[2]);
>>> +
>>>       /**
>>>        * intf_audio_select - select the external interface for audio
>>>        * @mdp: mdp top context driver
>>> @@ -148,12 +162,12 @@ struct dpu_hw_mdp {
>>>    * @dev:  Corresponding device for devres management
>>>    * @cfg:  MDP TOP configuration from catalog
>>>    * @addr: Mapped register io address of MDP
>>> - * @m:    Pointer to mdss catalog data
>>> + * @mdss_rev: dpu core's major and minor versions
>>>    */
>>>   struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
>>>                         const struct dpu_mdp_cfg *cfg,
>>>                         void __iomem *addr,
>>> -                      const struct dpu_mdss_cfg *m);
>>> +                      const struct dpu_mdss_version *mdss_rev);
>>>   void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> index 5acd5683d25a..f1acc04089af 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
>>> @@ -60,6 +60,13 @@
>>>   #define MDP_WD_TIMER_4_LOAD_VALUE       0x448
>>>   #define DCE_SEL                         0x450
>>> +#define MDP_DP_PHY_INTF_SEL             0x460
>>> +#define MDP_DP_PHY_INTF_SEL_INTF0        GENMASK(3, 0)
>>> +#define MDP_DP_PHY_INTF_SEL_INTF1        GENMASK(6, 3)
>>> +#define MDP_DP_PHY_INTF_SEL_PHY0        GENMASK(9, 6)
>>> +#define MDP_DP_PHY_INTF_SEL_PHY1        GENMASK(12, 9)
>>> +#define MDP_DP_PHY_INTF_SEL_PHY2        GENMASK(15, 12)
>>
>> These masks do not match the docs, the below ones are what I see:
>>
>> #define MDP_DP_PHY_INTF_SEL_INTF0        GENMASK(2, 0)
>> #define MDP_DP_PHY_INTF_SEL_INTF1        GENMASK(5, 3)
>> #define MDP_DP_PHY_INTF_SEL_PHY0        GENMASK(8, 6)
>> #define MDP_DP_PHY_INTF_SEL_PHY1        GENMASK(11, 9)
>> #define MDP_DP_PHY_INTF_SEL_PHY2        GENMASK(14, 12)
>>
>>> +
>>>   #define MDP_PERIPH_TOP0            MDP_WD_TIMER_0_CTL
>>>   #define MDP_PERIPH_TOP0_END        CLK_CTRL3
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 1955848b1b78..9db5a784c92f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1102,7 +1102,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>       dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
>>>                            dpu_kms->catalog->mdp,
>>>                            dpu_kms->mmio,
>>> -                         dpu_kms->catalog);
>>> +                         dpu_kms->catalog->mdss_ver);
>>>       if (IS_ERR(dpu_kms->hw_mdp)) {
>>>           rc = PTR_ERR(dpu_kms->hw_mdp);
>>>           DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>>> @@ -1137,6 +1137,15 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>           goto err_pm_put;
>>>       }
>>> +    /*
>>> +     * We need to program DP <-> PHY relationship only for SC8180X. 
>>> If any
>>> +     * other platform requires the same kind of programming, or if 
>>> the INTF
>>> +     * <->DP relationship isn't static anymore, this needs to be 
>>> configured
>>> +     * through the DT.
>>> +     */
>>> +    if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, 
>>> "qcom,sc8180x-dpu"))
>>> +        dpu_kms->hw_mdp->ops.dp_phy_intf_sel(dpu_kms->hw_mdp, 
>>> (unsigned int[]){ 1, 2, });
>>> +
>>>       dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, 
>>> dpu_kms->catalog);
>>>       if (IS_ERR(dpu_kms->hw_intr)) {
>>>           rc = PTR_ERR(dpu_kms->hw_intr);
>>>
>>> ---
>>> base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
>>> change-id: 20240613-dp-phy-sel-1b06dc48ed73
>>>
>>> Best regards,

