Return-Path: <linux-arm-msm+bounces-59104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0B5AC13D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CD751C00B4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D0D20FA9C;
	Thu, 22 May 2025 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZr6OBVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46220F078
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940369; cv=none; b=e2MgygoToPwf+tURkWg+4H2XA6AUc7NSu7/dvRr1/LuEyWK3qIMVeedBoROaxVrBqJCxkTewNNg892KOnTBgcVA8E8MqjIe97CXwK1s3Iv4ToNC4xBk7n4VZeWrddajWulPvmWT7z7RHSy+PjJKo3qMJ7PL5k7CYo+ZDH2VhwF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940369; c=relaxed/simple;
	bh=ur7YbUqNfAfABg/WZQGZKIefNXNm7QwnkWAijkrsaMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gF2jzX5IWOnl69PCwdRxF2NHPZhGTZi3fdaf5kFN71HBF1YluyInMzn+aTJPyUJ+KLlExAQTeUFl2qSUB/RXM7BWN68rI/TgcvNFOugzF6ljYt0d2fl3oz8f7S9DmfC6E584CNagEsptg2JMkl4vDjgFYxgtXVAUS6Cb4kPu5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZr6OBVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGannQ016660
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3hythJW7O3Ln+CjN8TBZmcFFx5xKO2LTaidnlRHNd4=; b=KZr6OBVVTRIRwofL
	PF04cRXBMhOQiM1kMLiIsfCxis7pzSS7wV6Kkeocb3LgfWV1Wp27h1f32ZMBu+hn
	m4rpH7rv4DW/yh9UHWqn5KVwqjL4VUtxK1v5F3Tzp4D79g9v1sKxK1Z+gfJ72QzK
	6xTg/eM/k1mxpNvT7eI6l2jTWlAreYjKQxnQSb8XTRD2LiqERJyqDPchRWGuT3nb
	6ipihpJhunUY2ln5sHf45qVJlvYhBpNEBiiMKaL1NGQ451Xfd1qdnZlaHmGRIt/v
	vGb/ZvZSGM1q8tGHCupGQLAaLnKb45sEo9uFMIoq2Mnu7t+NJGJhHU8xapdCJWFR
	ix5eMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yevw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:59:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso202036485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 11:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940365; x=1748545165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3hythJW7O3Ln+CjN8TBZmcFFx5xKO2LTaidnlRHNd4=;
        b=NQYvPFkM8bFlDkmKeClRPhOn0vJrb3TsGM2h+ff0kHKQrcZUzROQbI4zUVbOvfzEDf
         9QyKyBHQkuXFsnj2TMuRYK5F3n5TpUSOnHyq+PnSoDXVzAuxMDDdPTga9gdNU+H+ieHL
         RueDktO/p7gp4M9OIz5JpVBKK4jJGWVa8TpQNS1HZlVuJ2cI8Dj/b3p3g2N75LTrgGQ8
         TB/BJ9Ng2qiFYnba7QdPUNA+nZEqsbQnRgUGuhuAuKrJzSs0p3gmALOGamPAZp/Wb1vj
         x40AwgbCU7eHd+nCa/l1FY20d1/GX6bTLOQnpjQ0KaJipJj7CCBx1ZJl5L00Rplu9HlB
         q0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2jfKEHlloAQyqASj3yLA/bEQLetZiVSHJj0SMhFpVDgczI1Gy2dffhm0CjDELgT3aD4j1nIUOGqnx2hRY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ER4NVlIXk3E3DPxmPDnqmLEpypoagdX7kJpzNcHiSzgyVJO/
	hdFOw14I4MDcDjuIektYNsUb/YshButgFlWZgNSIHKINxklNLpW0WGsypDZXKDgAGKjB/PlxKbQ
	06y7/Wtiy5lE8Ojgd0ajLOOSsAt6C1dBSNVX9IDKfZ5zF0ECniHv/b9l7KJ5LKeGR8QPp
X-Gm-Gg: ASbGnctxYGVDrhdsnLpO5facDT00bOVsRe5N9GQq5s93hAXQ8G9PfakWNNiSSCV+ubJ
	inWiiieha2KwkyPlGEI5uVpepkWjeAskGgoIDNL91Xb03ci/l/0B8rCuN8Pkoy1vhmc46Ie3LA2
	iv2rgxSeJvfXYx6RaaXJ5acOp3fDRqYOwu92gEqDyz9bYmk6PIXVpRwy659edtUJ9pch247Eup0
	ZyqjI0zY05wkH32LLoNTCpzldu6aYA9B2Fp5B/KOY/74AwkmcB8hP2EoKrmilpmH7MCsct5m2oU
	cqhx293hb2xu6/kZYaocqtML+X8R9OAl56AVpsBUsxhLszSUfmUfZKvu3xNK+cTtNw==
X-Received: by 2002:a05:620a:6202:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7cd4a08ee21mr1100096985a.0.1747940365559;
        Thu, 22 May 2025 11:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQOAYGhe6K1LjGcBN6vbBiDnDIWsN+lmRlqcPeMkJaP1WJt5jFRdI44FsjYiPFQzGx3Bjnlw==
X-Received: by 2002:a05:620a:6202:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7cd4a08ee21mr1100094885a.0.1747940365191;
        Thu, 22 May 2025 11:59:25 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e746csm11208840a12.47.2025.05.22.11.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:59:24 -0700 (PDT)
Message-ID: <e3033f51-9837-44e6-904a-9fef6b108252@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:59:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, cros-qcom-dts-watchers@chromium.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, Eugene Lepshy <fekz115@gmail.com>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
 <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
 <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
 <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f740e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=WcJvuXKDj7ErHkShSZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: C_glvJQ4BcEgahrFqZu8MusXFqvzwz-k
X-Proofpoint-GUID: C_glvJQ4BcEgahrFqZu8MusXFqvzwz-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfXw6aqh5i3TeqV
 sQF77IrizezjkCsP1KfA4WpKzlnsnuobnm1Q80vCDQZ6buZXfg7F/GIg0Y3hzlyX4VfNYP6ZaSh
 O2TIU1eX4zv0mCHKuK5iahQkXhofwwbPcNWj5iPsCZTvO7+UD2xVec69bHv56qSKPjuiioVkvS+
 QVwWoojAoHZ+ngCo09GvorAilpMbep5mwbn1K2BHWLW+D5Jp6BG/FGPmPz9M4MmaK9pzcdcgyGk
 Fi0tdrIdwLHJ8F1z7pijhknSZR0kWBe17QhOhPgNtzCij+6MlN3t1haZovZJP9G525SgvfH1kWl
 wOucDwQ+H4i44KlunmUvzj6Xqu6Sy+XKI086fbtCvm80U4Dl26Hr2Jdbyk+j6nvmjseChkk3Dkj
 sDWdvKyYlzrrx/9Lk0xrc0O0IFH3LzkcKsbCAIXEmxjIcXn7f1uF0oT0vhT5q2WavsYQFXeq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=954 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191

On 5/22/25 8:51 PM, Dmitry Baryshkov wrote:
> On Thu, May 22, 2025 at 08:27:40PM +0200, Konrad Dybcio wrote:
>> On 5/22/25 2:16 PM, Dmitry Baryshkov wrote:
>>> On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>>>>
>>>> 在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
>>>>> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
>>>>>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
>>>>>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>>>>>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>>>>>>>> remote heap memory requirements.
>>>>>>>
>>>>>>> Why? Was it not working without this heap?
>>>>>>
>>>>>> yes, it will not working without this heap.
>>>>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>>>>> requirements. For more info, please refer below patches, it has provided a more
>>>>>> detailed explanation.
>>>>>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
>>>>>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
>>>>>
>>>>> This triggers a bunch of questions:
>>>>>
>>>>> - What is audio PD?
>>>>>
>>>> Audio PD is a protection domain which is running on DSP for audio
>>>> specific processing.
>>>>> - Is it a required component?
>>>> yes. it is needed wherever there is some audio use cases where
>>>> DSP audio PD dynamic loading is needed.
>>>
>>> Which use cases?
>>>
>>>>> - For which platforms ?
>>>>>
>>>> For platforms that require dynamic loading of DSP audio PD.
>>>
>>> Please be more specific, we are not playing a guessing game here.
>>>
>>>>> - What happens if there is a memory region, but it is not used by the
>>>>>   driver (SM8650, SM8550).
>>>>>
>>>> It won't be used.
>>>
>>> So, what happens? DSP crash? system reboot? blue smoke coming from the SoC?
>>>
>>> I'm asking all those questions to understand:
>>> - whether this is applicable to previous SC7280 platforms or just RB3Gen2 / IDP
>>> - whether this needs to be backported or not
>>> - whether a similar fix should be applied to other platforms.
>>
>> I wouldn't worry about FP5 too much (albeit it's apparently not easy
>> to test it out and even having spent some time trying to, I couldn't
>> figure out how these things connect), but the chromebooks may be
>> potentially problematic. That said, we can overwrite it in sc7280-chrome
>> if necessary
> 
> What about NothingPhone?

I got Nothing to say, we can ask +Eugene to test it

But I suppose you should be able to check if 845/8150 needs it
and we can probably assume the base-7280's config matches

Konrad

