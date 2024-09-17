Return-Path: <linux-arm-msm+bounces-31893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B23397AD01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 10:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B752B2CDF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 08:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A237E482E9;
	Tue, 17 Sep 2024 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MsvaIlJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD43BBE4F;
	Tue, 17 Sep 2024 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726562442; cv=none; b=S7YTgJ/C5Sw0tt6p6izM8zES2Nek2YviyKgmc0UrFlVpJPP7OXDi61KYDULfa319FrMe15Za3h0pIUl3zsoj+lv6lKiz7iXl5ObaZD5sCcL8ooHV5PzSNyiLq2LQoamrg0O9yA0KwThSu3LHqOF00pYYRtI2p0T1EiK5pbybkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726562442; c=relaxed/simple;
	bh=NF8DhioQ/xhUbzri65xECX0ukXDtl68Q5q6jb1aozwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Paze2WUkMbOF8bxYELjQuQbwxLSnmLWHyLOjfn8toiSwF6e9xRLt/Sgpou8Pejb0wE6lV0/pjmz/jqtp5f/a3JETXAEhqMf6dO6scWZNgg/2AWd33UJR9c8w665sZCX6PCZqKaiJSy3qBmXfqOwDh+nVq/qGDkIjPkrJP7Kvx5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MsvaIlJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H7ImM1003647;
	Tue, 17 Sep 2024 08:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNmVVqJ/mbN61tjwbZuFKzRaf2S3xTimJ/qqkaE6le4=; b=MsvaIlJ8nKVMp73M
	gZFoJ5kq3ThDXFvNHTLE7iG2pkTX54Tfp/2m4SVJyUyV67wt09i0J8hOM6sGJ0US
	UV26y5Vlq3Rv4+XzhAr8hh5xQD/WeC1fJ0km5TgH9CAO2/sF40faIUbZQuhv2zfS
	dJ6vsYxdqC2RbpuRUHk4GGnt++gJsspiGH71jPeMVR1LqOMAWsr1K6N+PiHzb/9k
	94zW2eBOif+1aAw2X34xxlWnsNoeHZ2BRtF3KbveocScCaG8811KDJ16t5oghEY/
	bWbmSM5zkP1EWiYhNZ3EShcylsMKmWOleu9uFcO09pMFeRS6/f4/EZCGQpajnb9V
	0UsyXw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hex8kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 08:40:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48H8eM2a032454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 08:40:22 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 01:40:13 -0700
Message-ID: <3ea1189b-8b06-45bb-9d60-178f69ee407d@quicinc.com>
Date: Tue, 17 Sep 2024 14:10:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <konradybcio@kernel.org>,
        <andersson@kernel.org>, <simona@ffwll.ch>, <abel.vesa@linaro.org>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_khsieh@quicinc.com>,
        <konrad.dybcio@linaro.org>, <quic_parellan@quicinc.com>,
        <quic_bjorande@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-3-quic_mukhopad@quicinc.com>
 <CAA8EJppddLmzJ9WSkLLr-nwM-qe647Sm6jV8SpHdB=0vRQT-=Q@mail.gmail.com>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <CAA8EJppddLmzJ9WSkLLr-nwM-qe647Sm6jV8SpHdB=0vRQT-=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EW7-YFs4rYSVK7VBeqBZUWpboj-UHtU3
X-Proofpoint-GUID: EW7-YFs4rYSVK7VBeqBZUWpboj-UHtU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170064


On 9/13/2024 5:12 PM, Dmitry Baryshkov wrote:
> On Fri, 13 Sept 2024 at 13:38, Soutrik Mukhopadhyay
> <quic_mukhopad@quicinc.com> wrote:
>> In order to support different HW versions, introduce aux_cfg array
>> to move v4 specific aux configuration settings.
>>
>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>> ---
>> v2: Fixed review comments from Bjorn and Dmitry
>>          - Made aux_cfg array as const.
>>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
>>   1 file changed, 23 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index da2b32fb5b45..bcd5aced9e06 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -90,6 +90,7 @@ struct phy_ver_ops {
>>
>>   struct qcom_edp_phy_cfg {
>>          bool is_edp;
>> +       const u8 *aux_cfg;
>>          const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>>          const struct phy_ver_ops *ver_ops;
>>   };
>> @@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>>          .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>>   };
>>
>> +static const u8 edp_phy_aux_cfg_v4[10] = {
>> +       0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
>> +};
>> +
>>   static int qcom_edp_phy_init(struct phy *phy)
>>   {
>>          struct qcom_edp *edp = phy_get_drvdata(phy);
>> +       u8 aux_cfg[10];
> Please define 10, so that there are no magic numbers (and less chance
> of damaging the stack if it gets changed in one place only.


Sure, we will update this in the next version.


>
>>          int ret;
>> -       u8 cfg8;
>>
>>          ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>>          if (ret)
>> @@ -200,6 +205,8 @@ static int qcom_edp_phy_init(struct phy *phy)
>>          if (ret)
>>                  goto out_disable_supplies;
>>
>> +       memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
>> +
>>          writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>>                 DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>>                 edp->edp + DP_PHY_PD_CTL);
>> @@ -222,22 +229,20 @@ static int qcom_edp_phy_init(struct phy *phy)
>>           * even needed.
>>           */
>>          if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
>> -               cfg8 = 0xb7;
>> -       else
>> -               cfg8 = 0x37;
>> +               aux_cfg[8] = 0xb7;
>>
>>          writel(0xfc, edp->edp + DP_PHY_MODE);
>>
>> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
>> -       writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
>> -       writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
>> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
>> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
>> -       writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
>> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
>> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
>> -       writel(cfg8, edp->edp + DP_PHY_AUX_CFG8);
>> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
>> +       writel(aux_cfg[0], edp->edp + DP_PHY_AUX_CFG0);
>> +       writel(aux_cfg[1], edp->edp + DP_PHY_AUX_CFG1);
>> +       writel(aux_cfg[2], edp->edp + DP_PHY_AUX_CFG2);
>> +       writel(aux_cfg[3], edp->edp + DP_PHY_AUX_CFG3);
>> +       writel(aux_cfg[4], edp->edp + DP_PHY_AUX_CFG4);
>> +       writel(aux_cfg[5], edp->edp + DP_PHY_AUX_CFG5);
>> +       writel(aux_cfg[6], edp->edp + DP_PHY_AUX_CFG6);
>> +       writel(aux_cfg[7], edp->edp + DP_PHY_AUX_CFG7);
>> +       writel(aux_cfg[8], edp->edp + DP_PHY_AUX_CFG8);
>> +       writel(aux_cfg[9], edp->edp + DP_PHY_AUX_CFG9);
> Replace this with a loop?


Can we use below approach for this :

#define DP_PHY_AUX_CFG(n)        (0x24 + (0x04 * (n)))

for (int i = 0; i < 10; i++)

     writel(aux_cfg[i], edp->edp + DP_PHY_AUX_CFG(i));


>
>>          writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
>>                 PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
>> @@ -519,16 +524,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>>   };
>>
>>   static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>> +       .aux_cfg = edp_phy_aux_cfg_v4,
>>          .ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>
>>   static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
>> +       .aux_cfg = edp_phy_aux_cfg_v4,
>>          .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>>          .ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>
>>   static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>>          .is_edp = true,
>> +       .aux_cfg = edp_phy_aux_cfg_v4,
>>          .swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>          .ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>> @@ -707,6 +715,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>>   };
>>
>>   static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>> +       .aux_cfg = edp_phy_aux_cfg_v4,
>>          .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>>          .ver_ops = &qcom_edp_phy_ops_v6,
>>   };
>> --
>> 2.17.1
>>
>

