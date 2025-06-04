Return-Path: <linux-arm-msm+bounces-60184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F4ACD88E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 09:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEBD1165A58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 07:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EBA1EEA40;
	Wed,  4 Jun 2025 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dj8WsLub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF92C3246;
	Wed,  4 Jun 2025 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022137; cv=none; b=jF1uSl4O8twE62pppmzRDLntXRrUOcSfVn58whkyS5QJGjvZW2OrKB1wZ7bb5WSs5+/alLqP/prPJiodX34TsoSirAs96BhoHagOnYwj+GzwmnebaMka2QmKWCISNn5+15zlrSWrbUF92wCMxWl1wiTF2WCtmnSPMRJ8rnsXf58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022137; c=relaxed/simple;
	bh=OLcyeaK0QaFwX/QD+b6vr3goVzhNT5ae0rF/7cGv6DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CVi4yPLbQUKzDbP2J2rpFn+gnzqyqVGkR2hwB6BQM+yD7O0w1SIQ4RD7q4jMQ5mkaDqdk7WWG19WzOnMgkzGFGflhbijQwnQBj+7VOeobofN3hWnQAGZViicI/j61xfTOZ+CepOTkWp0nl6SgXF7OeJvNogoppM49mIGBW1ZVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dj8WsLub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553Jrjql027289;
	Wed, 4 Jun 2025 07:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u488RfVb+B5wzmvfwRwAr9mI64t5M7PCEZ6lB41OcjA=; b=dj8WsLubuC7c18AM
	MbU7EWxwaup6ZgzF3NzJH5l7EeDICqeKR+9JlpYeUXWd6i5Qh5oozdbz8AVxeYEt
	X/pVkPNfsB7B7jyfrww6UYjzDeWetd4LfiB/SEszTva5ZbQaYvTYyyPPiQpeoNli
	qe4vpWjHT6+2gZ2oDE6pGaBpEDgqYeoSLOtCApnepiHgJngZ4JbeYd0CO2jsBY3m
	3V+L+S0AvUx1qcUuH4IX+4I6RzHAoku+H4cYnYHfwuHb3vyuid7mUu8U5IT2PV+Q
	8XEIp6rmh+VvnbJHuy27iQzu8F/JTzDUnjFTQfTHRMnYy0EEWKxehztdoDYISEMW
	rV3HGA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8sw674-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 07:28:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5547Snn7030313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 07:28:49 GMT
Received: from [10.218.32.171] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 00:28:43 -0700
Message-ID: <85ba8e7b-a1a5-4f70-9660-bb78e7169acc@quicinc.com>
Date: Wed, 4 Jun 2025 12:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
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
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <VgXAbpS__r4C24FLFz5nqCPgygil3nr3-oNHbL7bQxE0X1GnDStFaWlnts8iSxCeG6TCqa8mzIFqOysqIlWeJg==@protonmail.internalid>
 <20250506180232.1299-4-quic_ptalari@quicinc.com>
 <e6517c54-9163-48d1-80c2-4fd964dac349@linaro.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <e6517c54-9163-48d1-80c2-4fd964dac349@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=683ff5b1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=A-9vhQJTosZNU69VUx0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MCBTYWx0ZWRfX+H6QsDyPIo7Y
 dSyNjfZAiaeQz9Ycve8F55B7SnHZ6lejl/cW2hFZ/WPnspPBEckuWqQBwlCzyuIqUqXKDOF0YOO
 OiE2n5tMp32PZnwh3/PGN7RW8ejwT/szXvkM/Xqo7A0bTwCFOdoGamqfTmhAeJQbh6rT7iYNRIz
 +xrMtDY7AjdfybCCqX+Qc3gGTvlctsQZ8ynsQkHNVvu2KNA7wgeLdqdXB3jyw0fAzHDb9anbCj4
 rI7E4nezFjoRlIxgD/lR8G9uC2EdreagjBgzSMDXSrUAJyNDjcCTTEfHpiD5GSpLBvAf2NuAelb
 oCR7nsjcb1QrBDjQo93MBPcRHMrMgpwN+RT0HlRxtZ8QRSmeoIidVR8z+iJ0DC+kjXIOOn6+s+H
 7s0+xGAs2Bh/1S1hazU/mSi99X78e+zRx/RcHY0JLVGsSJ2f+Qhkw7WX32Ciyx4XENob006a
X-Proofpoint-GUID: b1JSqOmHQJWpaQnaLH6hGB6qWUK8yNxG
X-Proofpoint-ORIG-GUID: b1JSqOmHQJWpaQnaLH6hGB6qWUK8yNxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040060

Hi Bryan,

Thank you for review.

On 6/3/2025 7:51 PM, Bryan O'Donoghue wrote:
> On 06/05/2025 19:02, Praveen Talari wrote:
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
>> v3 -> v4
>> - declared an empty struct for sa8255p and added check as num clks.
>> - Added version log after ---
>>
>> v1 -> v2
>> - changed datatype of i from int to unsigned int as per comment.
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c | 73 ++++++++++++++++++++-------------
>>   1 file changed, 45 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c 
>> b/drivers/soc/qcom/qcom-geni-se.c
>> index 4cb959106efa..b6e90bac55fe 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -105,6 +105,8 @@ struct geni_wrapper {
>>   struct geni_se_desc {
>>       unsigned int num_clks;
>>       const char * const *clks;
>> +    int (*geni_se_rsc_init)(struct geni_wrapper *wrapper,
>> +                const struct geni_se_desc *desc);
>>   };
>>
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>> @@ -891,10 +893,44 @@ int geni_icc_disable(struct geni_se *se)
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
>> +    wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
> 
> It should be an error to depend on more clocks - which are specified in 
> a descriptor down the bottom of this file than MAX_CLKS allows.
should i keep condition before assign num_clks to wrapper->num_clks as 
below right?

if(desc->num_clks > MAX_CLKS){
{
  	return dev_err_probe(dev, " to many clocks defined in descriptor:%u 
(max allowed: %u)\n", desc->num_clks, MAX_CLKS);
}

Please correct me if i am wrong.

Thanks,
Praveen Talari
> 
>> +
>> +    for (i = 0; i < wrapper->num_clks; ++i)
>> +        wrapper->clks[i].id = desc->clks[i];
>> +
>> +    ret = of_count_phandle_with_args(dev->of_node, "clocks", 
>> "#clock-cells");
>> +    if (ret < 0) {
>> +        dev_err(dev, "invalid clocks property at %pOF\n", dev->of_node);
>> +        return ret;
> 
> return dev_err_probe();
> 
>> +    }
>> +
>> +    if (ret < wrapper->num_clks) {
>> +        dev_err(dev, "invalid clocks count at %pOF, expected %d 
>> entries\n",
>> +            dev->of_node, wrapper->num_clks);
>> +        return -EINVAL;
>> +    }
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
>> @@ -906,36 +942,12 @@ static int geni_se_probe(struct platform_device 
>> *pdev)
>>       if (IS_ERR(wrapper->base))
>>           return PTR_ERR(wrapper->base);
>>
>> -    if (!has_acpi_companion(&pdev->dev)) {
>> -        const struct geni_se_desc *desc;
>> -        int i;
>> +    desc = device_get_match_data(&pdev->dev);
>>
>> -        desc = device_get_match_data(&pdev->dev);
>> -        if (!desc)
>> +    if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {
> 
> There is no desc in this file that has !num_clks I don't think the 
> conjunction is justified.

there is empty struct defined below sa8255p_qup_desc.

> 
>> +        ret = desc->geni_se_rsc_init(wrapper, desc);
>> +        if (ret)
>>               return -EINVAL;
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
>> -
>> -        if (ret < wrapper->num_clks) {
>> -            dev_err(dev, "invalid clocks count at %pOF, expected %d 
>> entries\n",
>> -                dev->of_node, wrapper->num_clks);
>> -            return -EINVAL;
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
>> @@ -951,8 +963,11 @@ static const char * const qup_clks[] = {
>>   static const struct geni_se_desc qup_desc = {
>>       .clks = qup_clks,
>>       .num_clks = ARRAY_SIZE(qup_clks),
>> +    .geni_se_rsc_init = geni_se_resource_init,
>>   };
>>
>> +static const struct geni_se_desc sa8255p_qup_desc;
>> +
>>   static const char * const i2c_master_hub_clks[] = {
>>       "s-ahb",
>>   };
>> @@ -960,11 +975,13 @@ static const char * const i2c_master_hub_clks[] = {
>>   static const struct geni_se_desc i2c_master_hub_desc = {
>>       .clks = i2c_master_hub_clks,
>>       .num_clks = ARRAY_SIZE(i2c_master_hub_clks),
>> +    .geni_se_rsc_init = geni_se_resource_init,
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
> Other than those minor details looks pretty good.
> Please include me in v6 and I will review further.
> ---
> bod
> 

