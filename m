Return-Path: <linux-arm-msm+bounces-22270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 017A7902F96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 06:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5225BB213B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 04:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EECE16FF48;
	Tue, 11 Jun 2024 04:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GQ10t7eF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA88488;
	Tue, 11 Jun 2024 04:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718080825; cv=none; b=CtnrSXQM9bgyOrEA6613K5FbFdur8BMV6AjCDap1w639tvaNVQv9tjL2vw31gzy8+2rL0T7sHBJJiUJb9aMDwAReudXkZJsQTR07MEGgSi3zt5NmnFixROAbXxjS3oEOylSQFHLRB+gI6O0/hQ91a8N9eCQvMoW+7h/2MlBoWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718080825; c=relaxed/simple;
	bh=tdXTvR04YG95vGC2ed5np4cY7vgENhLoagNUvO9j+Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mZdRU2J84C62xSfO0PPiIsN1Ma08BkXjGPBPhoSEbZvtJHexN7IObxmb2ljWf+MuQ8+L95fhnrJb42SoOJtedIxvqnSywW4R/Ivsf9w8GtwN+FD6bkj9taajXgynSIhxG9Pdx1Umy/BaMOPHPzpc9SFbh1YoRWN6x5ZJy5JMzXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GQ10t7eF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B3AsR9001377;
	Tue, 11 Jun 2024 04:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R46nk5Y8f5YTvCdl64rWRkPICciSGOAHSIkHk+Ko2+w=; b=GQ10t7eFboebjCCY
	95eg3icGoCg+jlFS6YFrmkgBVzuL43kPhpokmGkI1R0a7S32JNntLmvedCbqJGd0
	hWH5KLsigHU/z6yLVo2XU60m8btu5dNr8+IUlm73tr5l2tZ2lovlwehKqIlAWn8t
	6rmR18NmtwhCD0t0LDUZaZYpc2WqITRRokDiFYFZNCZPA9MvfUYEFV4ZWsLTF+nO
	r9ERzXF7OvWUnB7pbbz1RS4SCC1etngJ1a9xjpa1njCGPq4rG8Dd4IeBoRH02HAi
	czkrV6mVkch4C30crp4usqaUzXh+FIUbOBZN/zBkuc57zoL55lhumTPUI7A+Lmi6
	2KWYhQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rwsxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:40:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B4e58O005393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:40:06 GMT
Received: from [10.216.24.176] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 21:39:54 -0700
Message-ID: <33772eab-74c6-c5c3-fa25-3a643a2f9c57@quicinc.com>
Date: Tue, 11 Jun 2024 10:09:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND v5 6/7] ASoC: codecs: wcd937x: add capture dapm widgets
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240527111956.444425-1-quic_mohs@quicinc.com>
 <20240527111956.444425-7-quic_mohs@quicinc.com>
 <ba911ebd-aef5-46af-ace1-84d13bee6876@linaro.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <ba911ebd-aef5-46af-ace1-84d13bee6876@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KrdaIhs0KhVaQSe_Yq6TEnDlFBkT1WmU
X-Proofpoint-GUID: KrdaIhs0KhVaQSe_Yq6TEnDlFBkT1WmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_08,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=775 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110033

On 6/10/2024 12:35 PM, Srinivas Kandagatla wrote:
> 
> 
> On 27/05/2024 12:19, Mohammad Rafi Shaik wrote:
>> +static int __wcd937x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
>> +                      int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +    int micb_num;
>> +
>> +    if (strnstr(w->name, "MIC BIAS1", sizeof("MIC BIAS1")))
>> +        micb_num = MIC_BIAS_1;
>> +    else if (strnstr(w->name, "MIC BIAS2", sizeof("MIC BIAS2")))
>> +        micb_num = MIC_BIAS_2;
>> +    else if (strnstr(w->name, "MIC BIAS3", sizeof("MIC BIAS3")))
>> +        micb_num = MIC_BIAS_3;
>> +    else
>> +        return -EINVAL;
>> +
> See last comment..
> 
>> +    switch (event) {
>> +    case SND_SOC_DAPM_PRE_PMU:
>> +        wcd937x_micbias_control(component, micb_num,
>> +                    MICB_ENABLE, true);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        usleep_range(1000, 1100);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        wcd937x_micbias_control(component, micb_num,
>> +                    MICB_DISABLE, true);
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int wcd937x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
>> +                    struct snd_kcontrol *kcontrol,
>> +                    int event)
>> +{
>> +    return __wcd937x_codec_enable_micbias(w, event);
>> +}
>> +
>> +static int __wcd937x_codec_enable_micbias_pullup(struct 
>> snd_soc_dapm_widget *w,
>> +                         int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +    int micb_num;
>> +
>> +    if (strnstr(w->name, "VA MIC BIAS1", sizeof("VA MIC BIAS1")))
>> +        micb_num = MIC_BIAS_1;
>> +    else if (strnstr(w->name, "VA MIC BIAS2", sizeof("VA MIC BIAS2")))
>> +        micb_num = MIC_BIAS_2;
>> +    else if (strnstr(w->name, "VA MIC BIAS3", sizeof("VA MIC BIAS3")))
>> +        micb_num = MIC_BIAS_3;
>> +    else
>> +        return -EINVAL;
>> +
> same..
>> +    switch (event) {
>> +    case SND_SOC_DAPM_PRE_PMU:
>> +        wcd937x_micbias_control(component, micb_num, 
>> MICB_PULLUP_ENABLE, true);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        usleep_range(1000, 1100);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        wcd937x_micbias_control(component, micb_num, 
>> MICB_PULLUP_DISABLE, true);
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
> 
> ...
> 
>>   static const struct snd_soc_dapm_widget wcd937x_dapm_widgets[] = {
> ...> +    /* MIC_BIAS widgets */
>> +    SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, 0, 0,
> Please use shift here like
>          SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
>          SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
> 
> to avoid doing a string compares on wideget name.
> 
> --srini
> 

ACK

Will remove the string compares on widget name and will use the shift here.

Thanks & Regards,
Rafi.

>> +                wcd937x_codec_enable_micbias,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +    SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +    SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +
>>       SND_SOC_DAPM_SUPPLY("VDD_BUCK", SND_SOC_NOPM, 0, 0,
>>                   wcd937x_codec_enable_vdd_buck,
>>                   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
>> @@ -2007,11 +2312,101 @@ static const struct snd_soc_dapm_widget 
>> wcd937x_dapm_widgets[] = {
>>       SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
>>                  hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
>> +    /* TX output widgets */
>> +    SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
>> +    SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
>> +    SND_SOC_DAPM_OUTPUT("ADC3_OUTPUT"),
>> +    SND_SOC_DAPM_OUTPUT("WCD_TX_OUTPUT"),
>> +
>>       /* RX output widgets */
>>       SND_SOC_DAPM_OUTPUT("EAR"),
>>       SND_SOC_DAPM_OUTPUT("AUX"),
>>       SND_SOC_DAPM_OUTPUT("HPHL"),
>>       SND_SOC_DAPM_OUTPUT("HPHR"),
>> +
>> +    /* MIC_BIAS pull up widgets */
>> +    SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias_pullup,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +    SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias_pullup,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +    SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias_pullup,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),


