Return-Path: <linux-arm-msm+bounces-36356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B889B5B12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 06:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C07371C20CA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 05:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91230196C86;
	Wed, 30 Oct 2024 05:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lMCMlvKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD890BA4A;
	Wed, 30 Oct 2024 05:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730264882; cv=none; b=V5hmsaOcDqxNZSIjce3iaMzuO6hp27pZUXB1gybgj2TpJaB0c4NUENtsTtJXNtDBJVs0iQurX+a5h9LSp233Niayjb85Kw/XMvgIz2BDiUEzGBv1DWMEQn5wPyYxs20Of6u8Q5PracSehPIpTiZB7uhIhBqOOIsj3urcHUz27N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730264882; c=relaxed/simple;
	bh=dN6dWGsj0J+OPpngUYV8QXJlh0F89unqq6bsVm2JvYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dlQwFhn614Mf9rrfnDEvoALBXxuNRL8rbMFwF5WaQNf7rYOAD1IJZRpzDblrC5tIDgYSeslLTm3e7iCQLyYkkrwCTJQm/GInAI0S6M4B8JZgUKdwSa0TamRX+veNvZ60qQfvpuV2Ukb4iWCa5+UcO06n0lG9y3D8bclYuRqeuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lMCMlvKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TM0eSA012773;
	Wed, 30 Oct 2024 05:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EaiPV8HgOn+AOMbwRUCE8i+sVD4MK8Fvx+leJhokhw=; b=lMCMlvKW9/Frk9qy
	+GjnzZGQigvOUDxtQW+qXN6WPoQmBXsdi+/UyC3HnG4kvXaw5TxQdt3IFTipPrdm
	nwCAyq0wZDFNfW9sdZ2s5L4s8BrFK9d6xFetwGzJEd3pap9KqB4tcDh1I6FuiOei
	2ol6qEKsG7m2Is4hfm00+W5qTt27ruXbWYkVp5G/ymTk14Vb5QviopCEDCRF3+FB
	o/+9ESRPb1fFXgjdxAr76FIKGqUje/N7dmwWmbDg5p7JOpqGYfgQ7/pcYt0pikmZ
	EeufpI7M3RclCcTXO4RirDn4khPhYCHnUf4tUBelzw8BO3DPd265Gt7Zp4VWo8w+
	6EDPVw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgujrf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 05:07:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U57THl015152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 05:07:29 GMT
Received: from [10.216.49.160] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 22:07:20 -0700
Message-ID: <d98bff34-d7ea-2b05-0c0d-eaf0392aef3f@quicinc.com>
Date: Wed, 30 Oct 2024 10:37:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static channel
 mapping support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>
References: <20241023061326.3871877-1-quic_mohs@quicinc.com>
 <20241023061326.3871877-2-quic_mohs@quicinc.com>
 <qzjbiby7w6a7m4e324hdatgklmejlcxfwv7tszzfmdqahgrbu2@bcwsdlrpncxq>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <qzjbiby7w6a7m4e324hdatgklmejlcxfwv7tszzfmdqahgrbu2@bcwsdlrpncxq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VHEgHkQ44s6yuQoIlMFokJ7O4BZ33SqG
X-Proofpoint-GUID: VHEgHkQ44s6yuQoIlMFokJ7O4BZ33SqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300037

On 10/23/2024 1:22 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 23, 2024 at 11:43:23AM +0530, Mohammad Rafi Shaik wrote:
>> Add static channel mapping between master and slave rx/tx ports for
>> Qualcomm wcd937x soundwire codec.
>>
>> Currently, the channel mask for each soundwire port is hardcoded in the
>> wcd937x-sdw driver, and the same channel mask value is configured in the
>> soundwire master.
>>
>> The Qualcomm boards like the QCM6490-IDP require different channel mask settings
>> for the soundwire master and slave ports.
> 
> Different than what? Other wcd937x? Which are these?
> 
For Qualcomm QCM6490-IDP board soundwire master needs a different 
channel mask setting.

The wcd937x channel mask values are hardcoded in wcd driver.
https://elixir.bootlin.com/linux/v6.12-rc5/source/sound/soc/codecs/wcd937x-sdw.c#L35
https://elixir.bootlin.com/linux/v6.12-rc5/source/sound/soc/codecs/wcd938x-sdw.c#L37

In case of QCM6490-IDP the soundwire master and wcd937x require 
different channel mask settings, not the same.
For Example, wcd937x ADC2 connection

                           Master                 Slave (wcd937x)
                      +--------------+           +--------------+
                      |  +--------+  |           |  +--------+  |
          ADC1  ----->|  | PORT1  |  |           |  |   TX1  | 
|<-----------ADC1
          ADC2  ----->|  |        |  |           |  |        |  |
                      |  +--------+  |           |  +--------+  |
                      |              |           |              |
          ADC3  ----->|  +--------+  |           |  +--------+  |
                      |  |  PORT2 |  |           |  |   TX2  | 
|<-----------ADC2
                      |  |        |  |           |  |        | 
|<-----------ADC3
                      |  +--------+  |           |  +--------+  |
                      |              |           |              |
                      |  +--------+  |           |  +--------+  |
  DMIC0...DMIC3------>|  |  PORT3 |  |           |  |   TX3  | 
|<-----------DMIC0...DMIC3
                      |  |        |  |           |  |        | 
|<-----------MBHC
                      |  +--------+  |           |  +--------+  |
                      |              |           |              |
                      |  +--------+  |           |  +--------+  |
  DMIC4...DMIC3 ----->|  |  PORT4 |  |           |  |   TX4  | 
|<-----------DMIC4...DMIC7
                      |  |        |  |           |  |        |  |
                      |  +--------+  |           |  +--------+  |
                      |              |           |              |
                      +------------- +           +--------------+

					
For ADC2, The Slave needs to configure TX2 Port with channel mask value 
1 and
For Master, it required PORT1 with channel mask  value 2.


In existing design master and slave configured with same channel mask, 
it will fail ADC2.
The new design will help to configure channel mapping between master and 
slave from DT.

>>
>> With the introduction of the following channel mapping properties, it is now possible
>> to configure the master channel mask directly from the device tree.
>>
>> The qcom,tx-channel-mapping property specifies the static channel mapping between the slave
>> and master tx ports in the order of slave port channels which is adc1, adc2, adc3, adc4,
>> dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
> 
> I still don't get what is the channel here.
> 
Typo error,

The qcom,tx-channel-mapping property specifies the static channel 
mapping between the slave

and master tx ports in the order of slave port channel index which are 
adc1, adc2, adc3, adc4,

dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.



https://elixir.bootlin.com/linux/v6.12-rc5/source/sound/soc/codecs/wcd937x.h#L599



Will be fixed in the next version

>>
>> The qcom,rx-channel-mapping property specifies static channel mapping between the slave
>> and master rx ports in the order of slave port channels which is hph_l, hph_r, clsh,
>> comp_l, comp_r, lo, dsd_r, dsd_l.
> 
> And this description copies binding :/.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>

Ack

>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> ---
>>   .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> index d3cf8f59cb23..a6bc9b391db0 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> @@ -58,6 +58,38 @@ properties:
>>       items:
>>         enum: [1, 2, 3, 4, 5]
>>   
>> +  qcom,tx-channel-mapping:
>> +    description: |
>> +      Specifies static channel mapping between slave and master tx port
>> +      channels.
>> +      In the order of slave port channels which is adc1, adc2, adc3, adc4,
>> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
>> +      ch_mask1 ==> bit mask value 1
>> +      ch_mask2 ==> bit mask value 2
>> +      ch_mask3 ==> bit mask value 4
>> +      ch_mask4 ==> bit mask value 8
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    minItems: 8
>> +    maxItems: 13
> 
> Why size is variable? This device has fixed amount of slave ports, I
> think.
>

yes will check modify

>> +    items:
>> +      enum: [1, 2, 4, 8]
> 
> What is the point of using bits if you cannot actually create a bit mask
> out of it? Why this cannot be 7?
> 
Actually, these values should be fixed: 1 (0001), 2 (0010), 4(0100), 
8(1000).


If required to set 7, it is handled in wcd driver based on mixer commands.
https://elixir.bootlin.com/linux/v6.12-rc5/source/sound/soc/codecs/wcd937x.c#L1199


Example:
WCD937X_HPH_L -> channel mask value is 1
WCD937X_HPH_R -> channel mask value is 2


The final channel mask for that specific port is 3
>> +
>> +  qcom,rx-channel-mapping:
>> +    description: |
>> +      Specifies static channels mapping between slave and master rx port
>> +      channels.
>> +      In the order of slave port channels, which is
>> +      hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
>> +      ch_mask1 ==> bit mask value 1
>> +      ch_mask2 ==> bit mask value 2
>> +      ch_mask3 ==> bit mask value 4
>> +      ch_mask4 ==> bit mask value 8
> 
> and the value is what exactly? Index is channel, but what does "ch_mask4 ==> bit
> mask value 8" mean? I don't understand this at all.
> 

                           Master
                      +--------------+
                      |  +--------+  |
           ADC1 ----->|  | PORT1  |  |
           ADC2 ----->|  |        |  |
                      |  +--------+  |
                      |              |
           ADC3 ----->|  +--------+  |
                      |  |  PORT2 |  |
                      |  |        |  |
                      |  +--------+  |
                      |              |
                      |  +--------+  |
   DMIC0...DMIC3 ---->|  |  PORT3 |  |
                      |  |        |  |
                      |  +--------+  |
                      |              |
                      |  +--------+  |
   DMIC4...DMIC7----->|  |  PORT4 |  |
                      |  |        |  |
                      |  +--------+  |
                      |              |
                      +------------- +


The PORT1 has 2 ADC connections,

ADC1 -> PORT1 ch_mask index 1 -> channel mask value 1 (0001)
ADC2 -> PORT1 ch_mask index 2 -> channel mask value 2 (0010)


DMIC0 -> PORT3 ch_mask index 1 -> channel mask value 1 (0001)
DMIC1 -> PORT3 ch_mask index 2 -> channel mask value 2 (0010)
DMIC2 -> PORT3 ch_mask index 3 -> channel mask value 4 (0100)
DMIC3 -> PORT3 ch_mask index 4 -> channel mask value 8 (1000)


Will check and add a proper description.


>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    minItems: 8
>> +    maxItems: 8
>> +    items:
>> +      enum: [1, 2, 4, 8]
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -74,6 +106,8 @@ examples:
>>               compatible = "sdw20217010a00";
>>               reg = <0 4>;
>>               qcom,rx-port-mapping = <1 2 3 4 5>;
>> +            qcom,rx-channel-mapping =  /bits/ 8 <0x01 0x02 0x01 0x01 0x02
>> +                                                 0x01 0x01 0x02>;
>>           };
>>       };
>>   
>> @@ -85,6 +119,8 @@ examples:
>>               compatible = "sdw20217010a00";
>>               reg = <0 3>;
>>               qcom,tx-port-mapping = <2 2 3 4>;
>> +            qcom,tx-channel-mapping = /bits/ 8 <0x01 0x02 0x01 0x01 0x02 0x04
>> +                                                0x04 0x08 0x01 0x02 0x04 0x8>;
> 
> Keep it consistent, e.g. everywhere without leading 0... actually not
> sure why this is hex, either.
> 

Ack, okay will check and modify.


For hex value, Actually took the reference from port mask values in swr 
DT entry.
https://elixir.bootlin.com/linux/v6.12-rc5/source/arch/arm64/boot/dts/qcom/sc7280.dtsi#L2528
>>           };
>>       };
>>   
>> -- 
>> 2.25.1

Thanks & Regards,
Rafi.
>>


