Return-Path: <linux-arm-msm+bounces-61884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C364CAE1964
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 12:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBFFB7AFA80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 10:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3AB28467B;
	Fri, 20 Jun 2025 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="piaOoly6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76BD255250;
	Fri, 20 Jun 2025 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417173; cv=none; b=ejb/ga1wLGCDqhpOKzKUVP8QEjkwMNum1Jszw6Do92avN0ZwZSJyXQpPdu0NFhOKoqqM/Fkdhc5P5MoLLO/NXUNc8Fhh4zRL9oZscezuRykHE/SopYg5kMvgDwGvTLIX6n0pNMO9M9vQNLOuZnfq+ktvaTzH0LBVwk86gfkghLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417173; c=relaxed/simple;
	bh=0Gh0K0xRFhKRF8AXu7ZZ0JwytEf4US5iUdrDtxqErbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cGKHqwKGUF2d4FMZgJGd4z2ilAN3XxcOAK29Ika5EJLU+djDHzeVIAta3a4e9vnMeVV/Fdrs3b0KviEWiPcDVHof35lJXCuArZ4JHlggfxR71MK38oG9yZp2+63bSX2EIpF2w0Q077YRtTKG76QLpYRYZl/shDoaLKqFQ0BXjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=piaOoly6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K8lRtW032388;
	Fri, 20 Jun 2025 10:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fu3w1v+rnRjSpeA3zYgBtl1n21MunfueBeCZusnnoY=; b=piaOoly6EaAIiN7U
	8wcBVDuu1kSFF/VDqUgC6HVgaWjRhDpvJEXDmrBnWkyYO54BDZlF1bcvMlFs1Cdi
	FCa3+eHUyeVnKgWs4BD1DBeSf30jV7AQjNg8vr02y9B1qg0PQETBR4FZks3CJ0UN
	+qTKIy0hNJqHkdL/KmccVfQTOPuZUb2bsEDMlsyIvIq/8SHzIKZDCdEtNH7gm1Lj
	VToOMgEv0D5ANZZGkYWHii7XeaKGehGFs6ZbkXdEjzKWp5Oq6YLqshH/IV3nvu59
	hHbqDabh1dncMTEgkSaY5/fMQl/oRBaon0bUna580mN34MIaWEQuNLkbZ0t3OQ9C
	hzGFAg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mtwkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 10:59:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55KAxPTX015654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 10:59:25 GMT
Received: from [10.216.41.11] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Jun
 2025 03:59:19 -0700
Message-ID: <71b180b4-6f4d-457e-89ad-0021c455d773@quicinc.com>
Date: Fri, 20 Jun 2025 16:29:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <SlCtr38wFck_Zdxg3nfChaMwe2uSvlQdfRCutdXc-Z2BTqoUOPd9Z9QY0cdREgcdxl40k41wXpszBkVTBB2T7A==@protonmail.internalid>
 <20250606172114.6618-4-quic_ptalari@quicinc.com>
 <2eea0b19-1a82-428a-8c04-74ee465e7516@linaro.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <2eea0b19-1a82-428a-8c04-74ee465e7516@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3OSBTYWx0ZWRfX/b7i/UZpB1fx
 Rnw+A058r46sTPyiIi8/JkcRMc7JbXQ4C5K3JlNLFged+aV5e3T1LLg6hqaiDT5ZVfedULbk8h4
 LLbnGkh20QF1cgIo2Ja9ulNcZhzR2EVPHavkn1TAhx1Q2QaPyOyosrqmjoQgoGl48nc3x1NbARx
 b9yf6HwHxxDYqDRucGOhWdhJfcIJaT3kF8Vuw2XKsJk/EUVFDVB9oO0jjXelVl5XRr5S5SoYqlw
 eycaSGU5z8DQIvEN3EdxfFPraHLlEAaP+YHbh72IARJht2+0oQ7N+zyB8IOqOs0GLHmrmxUIweT
 qKT9fP695Tdb09wdH0vcErx3ZmqQZg+JXyPOfOFQ+5HRBYNYLvAc4W3MWuxEaO9HLICIiX91ux7
 rUcJOxTK6HbJ7omoDuBF8k+NCid5p/L//mUf3SQzYJB8jIjkDXSTziFafEf1V9eBqBerL8y1
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68553f0d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=YZsGvGvhtn17Bq1j2ksA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9u2nym_CVBotSDrQCwnF4QyaB-xE6RG5
X-Proofpoint-ORIG-GUID: 9u2nym_CVBotSDrQCwnF4QyaB-xE6RG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200079

HI Bryan,

Thank you for review.

On 6/17/2025 12:23 AM, Bryan O'Donoghue wrote:
> On 06/06/2025 18:21, Praveen Talari wrote:
>> On the sa8255p platform, resources such as clocks,interconnects
>> and TLMM (GPIO) configurations are managed by firmware.
>>
>> Introduce a platform data function callback to distinguish whether
>> resource control is performed by firmware or directly by the driver
>> in linux.
>>
>> The refactor ensures clear differentiation of resource
>> management mechanisms, improving maintainability and flexibility
>> in handling platform-specific configurations.
>>
>> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
>> ---
>> v5 -> v6
>> - replaced dev_err with dev_err_probe
> 
> You've missed two opportunities for dev_err_probe() in this submission.

Thank you for pointing out. Yes i can see two more dev_err in new API.
Will address in next patch.

> 
>> - added a check for desc->num_clks with MAX_CLKS, an error if
>>    the specified num_clks in descriptor exceeds defined MAX_CLKS.
>> - removed min_t which is not necessary.
>> - renamed callback function names to resources_init.
>> - resolved kernel bot warning error by documenting function
>>    pointer in geni_se_desc structure.
>>
>> v3 -> v4
>> - declared an empty struct for sa8255p and added check as num clks.
>> - Added version log after ---
>>
>> v1 -> v2
>> - changed datatype of i from int to unsigned int as per comment.
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c | 77 +++++++++++++++++++++------------
>>   1 file changed, 49 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c 
>> b/drivers/soc/qcom/qcom-geni-se.c
>> index 4cb959106efa..5c727b9a17e9 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -101,10 +101,13 @@ struct geni_wrapper {
>>    * struct geni_se_desc - Data structure to represent the QUP Wrapper 
>> resources
>>    * @clks:        Name of the primary & optional secondary AHB clocks
>>    * @num_clks:        Count of clock names
>> + * @resources_init:    Function pointer for initializing QUP Wrapper 
>> resources
>>    */
>>   struct geni_se_desc {
>>       unsigned int num_clks;
>>       const char * const *clks;
>> +    int (*resources_init)(struct geni_wrapper *wrapper,
>> +                  const struct geni_se_desc *desc);
>>   };
>>
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>> @@ -891,10 +894,47 @@ int geni_icc_disable(struct geni_se *se)
>>   }
>>   EXPORT_SYMBOL_GPL(geni_icc_disable);
>>
>> +static int geni_se_resource_init(struct geni_wrapper *wrapper,
>> +                 const struct geni_se_desc *desc)
>> +{
>> +    struct device *dev = wrapper->dev;
>> +    int ret;
>> +    unsigned int i;
>> +
>> +    if (desc->num_clks > MAX_CLKS)
>> +        return dev_err_probe(dev, -EINVAL,
>> +                     "Too many clocks specified in descriptor:%u (max 
>> allowed: %u)\n",
>> +                     desc->num_clks, MAX_CLKS);
> 
> I think this is an extraneous add, we should trust the array indexes 
> inside our own driver that we control.
> 
> Actually why do we have a MAX_CLKS ? We specify a list of clk names with 

MAX_CLKS is needed for static declaration of "struct clk_bulk_data 
clK[MAX_CLKS]" which is need to save clk related info.

otherwise we allocate dynamic memory instead of static.

> aggregate-initialisation and ARRAY_SIZE() of the aggregate.
> 
> Like so:
> 
> static const char * const qup_clks[] = {
>          "m-ahb",
>          "s-ahb",
> };
> 
> static const struct geni_se_desc qup_desc = {
>          .clks = qup_clks,
>          .num_clks = ARRAY_SIZE(qup_clks),
> 
>> +
>> +    wrapper->num_clks = desc->num_clks;
>> +
>> +    for (i = 0; i < wrapper->num_clks; ++i)
>> +        wrapper->clks[i].id = desc->clks[i];
>> +
>> +    ret = of_count_phandle_with_args(dev->of_node, "clocks", 
>> "#clock-cells");
>> +    if (ret < 0)
>> +        return dev_err_probe(dev, ret, "invalid clocks property at 
>> %pOF\n", dev->of_node);
>> +
>> +    if (ret < wrapper->num_clks) {
>> +        dev_err(dev, "invalid clocks count at %pOF, expected %d 
>> entries\n",
>> +            dev->of_node, wrapper->num_clks);
>> +        return -EINVAL;
>> +    }
> 
> This code OTOH makes way more sense as we are validating our internal 
> num_clks variable which we have enumerated ourselves against a DT input 
> which we are consuming.

Yes, we have fixed clks which are enumerated in desc wrt DT.

> 
>> +
>> +    ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
>> +    if (ret) {
>> +        dev_err(dev, "Err getting clks %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   static int geni_se_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>>       struct geni_wrapper *wrapper;
>> +    const struct geni_se_desc *desc;
>>       int ret;
>>
>>       wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
>> @@ -906,36 +946,12 @@ static int geni_se_probe(struct platform_device 
>> *pdev)
>>       if (IS_ERR(wrapper->base))
>>           return PTR_ERR(wrapper->base);
>>
>> -    if (!has_acpi_companion(&pdev->dev)) {
>> -        const struct geni_se_desc *desc;
>> -        int i;
>> -
>> -        desc = device_get_match_data(&pdev->dev);
>> -        if (!desc)
>> -            return -EINVAL;
>> -
>> -        wrapper->num_clks = min_t(unsigned int, desc->num_clks, 
>> MAX_CLKS);
>> -
>> -        for (i = 0; i < wrapper->num_clks; ++i)
>> -            wrapper->clks[i].id = desc->clks[i];
>> -
>> -        ret = of_count_phandle_with_args(dev->of_node, "clocks", 
>> "#clock-cells");
>> -        if (ret < 0) {
>> -            dev_err(dev, "invalid clocks property at %pOF\n", 
>> dev->of_node);
>> -            return ret;
>> -        }
>> +    desc = device_get_match_data(&pdev->dev);
>>
>> -        if (ret < wrapper->num_clks) {
>> -            dev_err(dev, "invalid clocks count at %pOF, expected %d 
>> entries\n",
>> -                dev->of_node, wrapper->num_clks);
>> +    if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {
>> +        ret = desc->resources_init(wrapper, desc);
>> +        if (ret)
>>               return -EINVAL;
>> -        }
>> -
>> -        ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
>> -        if (ret) {
>> -            dev_err(dev, "Err getting clks %d\n", ret);
>> -            return ret;
>> -        }
>>       }
>>
>>       dev_set_drvdata(dev, wrapper);
>> @@ -951,8 +967,11 @@ static const char * const qup_clks[] = {
>>   static const struct geni_se_desc qup_desc = {
>>       .clks = qup_clks,
>>       .num_clks = ARRAY_SIZE(qup_clks),
>> +    .resources_init = geni_se_resource_init,
>>   };
>>
>> +static const struct geni_se_desc sa8255p_qup_desc;
>> +
>>   static const char * const i2c_master_hub_clks[] = {
>>       "s-ahb",
>>   };
>> @@ -960,11 +979,13 @@ static const char * const i2c_master_hub_clks[] = {
>>   static const struct geni_se_desc i2c_master_hub_desc = {
>>       .clks = i2c_master_hub_clks,
>>       .num_clks = ARRAY_SIZE(i2c_master_hub_clks),
>> +    .resources_init = geni_se_resource_init,
>>   };
>>
>>   static const struct of_device_id geni_se_dt_match[] = {
>>       { .compatible = "qcom,geni-se-qup", .data = &qup_desc },
>>       { .compatible = "qcom,geni-se-i2c-master-hub", .data = 
>> &i2c_master_hub_desc },
>> +    { .compatible = "qcom,sa8255p-geni-se-qup", .data = 
>> &sa8255p_qup_desc },
>>       {}
>>   };
>>   MODULE_DEVICE_TABLE(of, geni_se_dt_match);
>> -- 
>> 2.17.1
>>
>>
> 
> ---
> bod

