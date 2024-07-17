Return-Path: <linux-arm-msm+bounces-26405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1329336F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 08:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 888D9B20D62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 06:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB3A134A8;
	Wed, 17 Jul 2024 06:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y13qOaEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A9717C66;
	Wed, 17 Jul 2024 06:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197517; cv=none; b=a7b9DIGeFQ8h9PztsXULh8ROguEp8NsbOjpSQD6k1IKeQYEBmH30x4d/UJh4/e3J3ZpkiaP4iYVoQpTogli1AVY4mP0JJFeY2LYbXMsP+4mRpguoWyfefPaVCLIP6Dpw9Kfae3rQ+WwNsaEtJi1gp+ghWz8pGgIZ1QsVkl9qQgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197517; c=relaxed/simple;
	bh=eu9NsqAnralX2IavkGqf6l5znlIUTAKCUEe9e3UaoSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pjPqBQrmPH/+jOsvpdnNL9rW2E8H5+5rRcRrvvKJPqW2zOPxXTMR5VAvrK+iqr57p210NJKkm410GWlrtHbChfEBhwt4gwG/+/HuUBl13oiQVclkiYLefdqkPsa3jcf29Kj5nse4nTaNnpdhl7NfqdmO2HKCSxty4Ukk73mRPeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y13qOaEQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHev6H025096;
	Wed, 17 Jul 2024 06:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qztvSWpQ0tlCk0IZsqrQ7t3x2QYlFLXOXSLk30UIYM4=; b=Y13qOaEQ+5XH0udd
	A3WPZtUEQ0+ts+e3YzPewXFhBEuZ0/6I4q6xJAftDbzkc+jQZvQublXIqm4SKbCG
	R+crtXZoB/S3wxjjw/8+6+96YziEmy9eBwnY9znZATX8XNKzEHjpteHIaHTMSOof
	gH1AN0SWsn2eY7oHEUSCbE8o5Yhutr7+PnOg8kkAPNn/UD4BdCSDEqJrfZkvXqF6
	GUy3s9hpAMQea+Xo7ajJrQ9EsuZxXu9RClvjgk+71A0h902yfjklIb4TkXge412S
	eqlimT3DJE5HILj2rN9SQFcbB3UULlSh/4rz5SjxKc2DbM9t1yEmhP5yesK3YV4s
	sdfOjg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfphavw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 06:24:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46H6Of3O006632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 06:24:41 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 23:24:36 -0700
Message-ID: <0b84b689-8ab8-bcdf-f058-da2ead73786c@quicinc.com>
Date: Wed, 17 Jul 2024 11:54:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for
 SM8150
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
 <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
 <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
 <e235f19f-26b5-2cf7-ebb7-36e4dabe9b9b@quicinc.com>
 <CAA8EJpob5Qov78JfNN5BE+c1WyvnuBcQLYENHL0c1GTS+PPfSQ@mail.gmail.com>
 <503c8ba7-585d-4222-8e81-7f4c52f5f513@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <503c8ba7-585d-4222-8e81-7f4c52f5f513@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TBawKkM9EiYE2AYGiOK4qwzdIS0sBxMt
X-Proofpoint-GUID: TBawKkM9EiYE2AYGiOK4qwzdIS0sBxMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_03,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170046


On 7/15/2024 8:31 PM, Bryan O'Donoghue wrote:
> On 15/07/2024 11:38, Dmitry Baryshkov wrote:
>>>> Does it apply to SM8150? For example, on SM8250 RCG2s are not parked.
>>>
>>> Yes, it applies to SM8150.
>> Should the same logic be applied to other chipsets supported upstream?
>> If this is the case, which chipsets?
>
> If you are representing the "top" GDSC inside of the CCF instead of 
> doing this
>
> +    /* Keep the critical clock always-on */
> +    qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
>
> then the clock should be parked else you'll find the GDSC doesn't come 
> out of reset.
>
> and... as I look at it now we have a logical conflict in 
> drivers/clk/qcom/camcc-sc8280xp.c
>
> static struct clk_branch camcc_gdsc_clk = {
>         .halt_reg = 0xc1e4,
>         .halt_check = BRANCH_HALT,
>         .clkr = {
>                 .enable_reg = 0xc1e4,
>                 .enable_mask = BIT(0),
>                 .hw.init = &(struct clk_init_data){
>                         .name = "camcc_gdsc_clk",
>                         .parent_hws = (const struct clk_hw*[]){
>                                 &camcc_xo_clk_src.clkr.hw,
>                         },
>                         .num_parents = 1,
>                         .flags = CLK_SET_RATE_PARENT,
>                         .ops = &clk_branch2_ops,
>                 },
>         },
> };
>
> Patch sent.
>
> https://lore.kernel.org/linux-arm-msm/20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org/T/#u 
>
>

If the clock is modelled, it can get disabled during the late init call, 
when the CCF disables the unused clocks. But, it is a PoR ON  clock and 
expectation from design team is to keep it always-on for GDSC functionality.

So, we should not model this, instead just keep it always on from probe.


> In the round I think we should avoid these horrific hard-coded 
> always-on writes where possible.
>

We have been suggested to make such clocks always ON from probe on 
previous upstream discussions. This is also recently acknowledged by 
maintainers, please see [1] and [2].


[1] 
https://lore.kernel.org/linux-clk/6286a410-6faa-4996-8a9e-dc334dd9421f@linaro.org/


[2] 
https://lore.kernel.org/linux-clk/664cca91-8615-d3f6-7525-15b9b6725cce@quicinc.com/


> Personally I think parking is better than always-on specifically 
> because you define the clock and "see" it in the clock tree.
>
> ---
> bod

