Return-Path: <linux-arm-msm+bounces-43639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F339FE694
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 886DA7A047E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7071A8407;
	Mon, 30 Dec 2024 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oj1c5vfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D60C1A3BD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566101; cv=none; b=aLBku+1qnls9EF0Ec8qH6W2bTpkLyjyma3DBlkTu0OpRXfx5xy/WjyRbTBzCOPQtrsJ+BS6dAEnhjT/JjSbJ7fdKnz6rMhEjwbdEWJOB8FsJkU/RnZpjHpo9kGVzJ0vBHNp0VDNkR2t/7OOkE+DzzkvidlDkNe0K18AYFiNe2cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566101; c=relaxed/simple;
	bh=LKDQRATsXeiUwAvWDOJWQg5fAZ6oC1o0KuBBPZGMO8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCOdAKOW2kD0Xf+XW8jma4iObGV/Gkhm+1gGMswqjfZbCU7YDxBnJXS8s7WT2H8po8xtDdlVmG5kqCPxwuXZrUNiv0OPyb/Jfr9DvJMfkydQrr8Ploz7sPF5Dk9JrYWRieCIu9IBfrGaC/z9reMMxIUV/EyuJPbGWREj0PoXk8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oj1c5vfz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU7G0Lc027238
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIJCb9bUHT+BpLbq/l7gnjZTuaeFM2emrl8FTgeY6+E=; b=oj1c5vfzuXv9J4Wg
	qCTuMJz9L/qPgDztQYpbpBq8jZ3qTJ9w4rNHU7zXd+Ki7u2wR966WMizL8TeAHUC
	nh9IktZhBDbHxUMj7fCw/Q8dfmYc5Npr8Ycpf3K1abHM9zMirWa1axXOzHrY0YH1
	durnFJsKNkMnuL82hOU+66l4MvimFJ1SbaUaW8CmAfm86HDjB02xC2yvQ9y5it4B
	wjCC8hcibbw6vetXR67zjOh4Vn05J2N15a44ECEV0K4e+7cK3GwvJJqhKmqjxZlL
	5R2RBnJceiGKvnDPdaSxFJqtS1oZWCUS00QdNlAr524MXTxtYt+NLarlAlPZXh3n
	C1ux4w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43upyr8rq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:41:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-469059f07e2so24887261cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566097; x=1736170897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIJCb9bUHT+BpLbq/l7gnjZTuaeFM2emrl8FTgeY6+E=;
        b=R4OUyxu2H7yYTteyEBNm+f5l/oaAtjCzkNQDBMrPv4FhAa0KQBZN9ELm1lfb2GLR43
         eIeGt+6PigiidP5CgYA0LBw9b25uRt4pdk9pSjHchPEH0z/yVa0QPr0RiA0QMMDnpdWu
         5ZoNni7S6zJVJ7YkqWa/InqGq5yOOaM7rTMnRQfUV9gW8gi9MOJPE9Jw9J7QbXDYBUXw
         Q2ZrTQra+lu8EHTA9rjuwzze2HhrS2+/a5uIsj5APz4MIYDRYOyY5ziXJpxaUw84WxWO
         FDlT5Oz9VI4my/JSLyLt7lm5vubMeaD7PtHLQD7/1e57L68byayq/zFRkzTPqSjOHLSO
         4/2A==
X-Forwarded-Encrypted: i=1; AJvYcCV2/Ps8V6Zdse3OdRk4CcXGiKlmwBUOZoulbzGzKApZafhc3yKe2Cnlan5qqZTNpqx4VxQH+6zNXWQg8tcX@vger.kernel.org
X-Gm-Message-State: AOJu0YyXnPb6zXlJ0wCtp8hudrlsGzCaq3iX59mT7FSJG6xM6LrfGAoF
	BM85j+V0zbkUVuYrQ5ks2tJQdW46u1FNj+VhLNzMOc4RRAW7hsWVF0R9AzJfBWRPQ3L+Q/jJfK1
	8Qxetlq/svFw11k036LIFPZ9tHm+t1nNv9ICsNbNa45DsqbJFlOZamUel2vRd6S0H
X-Gm-Gg: ASbGncs0mYxI3NJCQ2JiQKHWYOsQIXxyjB7fWhAOUUKNbV+l/nx7i3EEcaNWwGl2ywv
	vCoyXGzbDap1Qbh7iRYd3xQQFDVWfNPzVMjQc2BMJV1NjGJVyJ5074+H0o+YvXHtdthjKBSZOl3
	wkcnnIVNDkG9CTe7sm+fmgJ4l5g1jrQN2xxFC65IZaFGcJ8e02ChGRzH30WF3r0D+bRc61ifz8F
	A30i+1QEtxkS190EgboQtZXbF9SBEb5qXFvGjS3RAO3Y/ec5z1Nqqu/lBTHN6W9yHtPjSYixdpO
	K98FK3R28kAj6m8wzIvWwyppNxyuK0JEkaM=
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id d75a77b69052e-46a4a8cdd7bmr221369411cf.4.1735566097228;
        Mon, 30 Dec 2024 05:41:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQC8g5fQxR5OWpdYGka9tohqozOHDYfdcnZjCgP357idaZA20sTwIp+mkevqm6vGIE4CKDYw==
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id d75a77b69052e-46a4a8cdd7bmr221369061cf.4.1735566096678;
        Mon, 30 Dec 2024 05:41:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701c9d7sm14702866a12.87.2024.12.30.05.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:41:36 -0800 (PST)
Message-ID: <1a3c7424-9cef-4fed-aa53-ad922aa4d3cb@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:41:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] PCI: of: Add API to retrieve equalization presets
 from device tree
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>
References: <20241223-preset_v2-v3-0-a339f475caf5@oss.qualcomm.com>
 <20241223-preset_v2-v3-2-a339f475caf5@oss.qualcomm.com>
 <piccoomv7rx4dvvfdoesmxbzrdqz4ld6ii6neudsdf4hjj2yzm@2bcuacwa4feb>
 <d317c51a-3913-6c49-f8db-e75589f9289a@quicinc.com>
 <wjk32haduzgiea676mamqdr6mhbmm3rrb6eyhzghqpczjuiazx@ipik3jhjzmhz>
 <7bc9f3f2-851c-3703-39b4-fea93d10bd7f@quicinc.com>
 <ntag3wc3yqax2afsbzesev32hpj3ssiknhjq6dtncuuj4ljrxh@23ed4qdwfrxi>
 <49ccd5f2-8524-eba4-25ef-4cdc39edc93b@quicinc.com>
 <7busek7zgost2s7mjklgvlccaef3lgz4k7btki72nkr5et7fdn@wkv2z6zbicdj>
 <fb17e142-e66f-85a7-353c-0e498892b884@quicinc.com>
 <CAA8EJpr=ktQ4c2dGxnCQNF4rLOCuCLRr6OYT4yVkyOnk2nF+Og@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAA8EJpr=ktQ4c2dGxnCQNF4rLOCuCLRr6OYT4yVkyOnk2nF+Og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 98T7b0_FBl2EuwFnstCuJ8cjJAGpONhc
X-Proofpoint-ORIG-GUID: 98T7b0_FBl2EuwFnstCuJ8cjJAGpONhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300119

On 24.12.2024 11:57 AM, Dmitry Baryshkov wrote:
> On Tue, 24 Dec 2024 at 12:36, Krishna Chaitanya Chundru
> <quic_krichai@quicinc.com> wrote:
>>
>>
>>
>> On 12/24/2024 3:25 PM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 24, 2024 at 02:47:00PM +0530, Krishna Chaitanya Chundru wrote:
>>>>
>>>>
>>>> On 12/24/2024 12:00 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Dec 23, 2024 at 10:13:29PM +0530, Krishna Chaitanya Chundru wrote:
>>>>>>
>>>>>>
>>>>>> On 12/23/2024 8:56 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Dec 23, 2024 at 08:02:23PM +0530, Krishna Chaitanya Chundru wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 12/23/2024 5:17 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Dec 23, 2024 at 12:21:15PM +0530, Krishna Chaitanya Chundru wrote:
>>>>>>>>>> PCIe equalization presets are predefined settings used to optimize
>>>>>>>>>> signal integrity by compensating for signal loss and distortion in
>>>>>>>>>> high-speed data transmission.
>>>>>>>>>>
>>>>>>>>>> As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
>>>>>>>>>> of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
>>>>>>>>>> configure lane equalization presets for each lane to enhance the PCIe
>>>>>>>>>> link reliability. Each preset value represents a different combination
>>>>>>>>>> of pre-shoot and de-emphasis values. For each data rate, different
>>>>>>>>>> registers are defined: for 8.0 GT/s, registers are defined in section
>>>>>>>>>> 7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
>>>>>>>>>> an extra receiver preset hint, requiring 16 bits per lane, while the
>>>>>>>>>> remaining data rates use 8 bits per lane.
>>>>>>>>>>
>>>>>>>>>> Based on the number of lanes and the supported data rate, this function
>>>>>>>>>> reads the device tree property and stores in the presets structure.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>>      drivers/pci/of.c  | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>      drivers/pci/pci.h | 17 +++++++++++++++--
>>>>>>>>>>      2 files changed, 60 insertions(+), 2 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>>>>>>>>>> index dacea3fc5128..99e0e7ae12e9 100644
>>>>>>>>>> --- a/drivers/pci/of.c
>>>>>>>>>> +++ b/drivers/pci/of.c
>>>>>>>>>> @@ -826,3 +826,48 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>>>>>>>>>>        return slot_power_limit_mw;
>>>>>>>>>>      }
>>>>>>>>>>      EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>>>>>>>>>> +
>>>>>>>>>
>>>>>>>>> kerneldoc? Define who should free the memory and how.
>>>>>>>>>
>>>>>>>> I will update this in next series.
>>>>>>>> as we are allocating using devm_kzalloc it should be freed on driver
>>>>>>>> detach, as no special freeing is required.
>>>>>>>>>> +int of_pci_get_equalization_presets(struct device *dev,
>>>>>>>>>> +                                  struct pci_eq_presets *presets,
>>>>>>>>>> +                                  int num_lanes)
>>>>>>>>>> +{
>>>>>>>>>> +      char name[20];
>>>>>>>>>> +      void **preset;
>>>>>>>>>> +      void *temp;
>>>>>>>>>> +      int ret;
>>>>>>>>>> +
>>>>>>>>>> +      if (of_property_present(dev->of_node, "eq-presets-8gts")) {
>>>>>>>>>> +              presets->eq_presets_8gts = devm_kzalloc(dev, sizeof(u16) * num_lanes, GFP_KERNEL);
>>>>>>>>>> +              if (!presets->eq_presets_8gts)
>>>>>>>>>> +                      return -ENOMEM;
>>>>>>>>>> +
>>>>>>>>>> +              ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
>>>>>>>>>> +                                               presets->eq_presets_8gts, num_lanes);
>>>>>>>>>> +              if (ret) {
>>>>>>>>>> +                      dev_err(dev, "Error reading eq-presets-8gts %d\n", ret);
>>>>>>>>>> +                      return ret;
>>>>>>>>>> +              }
>>>>>>>>>> +      }
>>>>>>>>>> +
>>>>>>>>>> +      for (int i = 1; i < sizeof(struct pci_eq_presets) / sizeof(void *); i++) {
>>>>>>>>>> +              snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << i);
>>>>>>>>>> +              if (of_property_present(dev->of_node, name)) {
>>>>>>>>>> +                      temp = devm_kzalloc(dev, sizeof(u8) * num_lanes, GFP_KERNEL);
>>>>>>>>>> +                      if (!temp)
>>>>>>>>>> +                              return -ENOMEM;
>>>>>>>>>> +
>>>>>>>>>> +                      ret = of_property_read_u8_array(dev->of_node, name,
>>>>>>>>>> +                                                      temp, num_lanes);
>>>>>>>>>> +                      if (ret) {
>>>>>>>>>> +                              dev_err(dev, "Error %s %d\n", name, ret);
>>>>>>>>>> +                              return ret;
>>>>>>>>>> +                      }
>>>>>>>>>> +
>>>>>>>>>> +                      preset = (void **)((u8 *)presets + i * sizeof(void *));
>>>>>>>>>
>>>>>>>>> Ugh.
>>>>>>>>>
>>>>>>>> I was trying iterate over each element on the structure as presets holds the
>>>>>>>> starting address of the structure and to that we are adding size of the void
>>>>>>>> * point to go to each element. I did this way to reduce the
>>>>>>>> redundant code to read all the gts which has same way of storing the data
>>>>>>>> from the device tree. I will add comments here in the next series.
>>>>>>>
>>>>>>> Please rewrite this in a cleaner way. The code shouldn't raise
>>>>>>> questions.
>>>>>>>
>>>>>>>>>> +                      *preset = temp;
>>>>>>>>>> +              }
>>>>>>>>>> +      }
>>>>>>>>>> +
>>>>>>>>>> +      return 0;
>>>>>>>>>> +}
>>>>>>>>>> +EXPORT_SYMBOL_GPL(of_pci_get_equalization_presets);
>>>>>>>>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>>>>>>>>>> index 14d00ce45bfa..82362d58bedc 100644
>>>>>>>>>> --- a/drivers/pci/pci.h
>>>>>>>>>> +++ b/drivers/pci/pci.h
>>>>>>>>>> @@ -731,7 +731,12 @@ static inline u64 pci_rebar_size_to_bytes(int size)
>>>>>>>>>>      }
>>>>>>>>>>      struct device_node;
>>>>>>>>>> -
>>>>>>>>>> +struct pci_eq_presets {
>>>>>>>>>> +      void *eq_presets_8gts;
>>>>>>>>>> +      void *eq_presets_16gts;
>>>>>>>>>> +      void *eq_presets_32gts;
>>>>>>>>>> +      void *eq_presets_64gts;
>>>>>>>>>
>>>>>>>>> Why are all of those void*? 8gts is u16*, all other are u8*.
>>>>>>>>>
>>>>>>>> To have common parsing logic I moved them to void*, as these are pointers
>>>>>>>> actual memory is allocated by of_pci_get_equalization_presets()
>>>>>>>> based upon the gts these should not give any issues.
>>>>>>>
>>>>>>> Please, don't. They have types. void pointers are for the opaque data.
>>>>>>>
>>>>>> ok.
>>>>>>
>>>>>> I think then better to use v1 patch
>>>>>> https://lore.kernel.org/all/20241116-presets-v1-2-878a837a4fee@quicinc.com/
>>>>>>
>>>>>> konrad, any objection on using v1 as that will be cleaner way even if we
>>>>>> have some repetitive code.
>>>>>
>>>>> Konrad had a nice suggestion about using the array of values. Please use
>>>>> such an array for 16gts and above. This removes most of repetitive code.
>>>>>
>>>> I don't feel having array in the preset structure looks good, I have
>>>> come up with this logic if you feel it is not so good I will go to the
>>>> suggested way by having array for 16gts and above.
>>>>
>>>>         if (of_property_present(dev->of_node, "eq-presets-8gts")) {
>>>>                  presets->eq_presets_8gts = devm_kzalloc(dev, sizeof(u16) *
>>>> num_lanes, GFP_KERNEL);
>>>>                  if (!presets->eq_presets_8gts)
>>>>                          return -ENOMEM;
>>>>
>>>>                  ret = of_property_read_u16_array(dev->of_node,
>>>> "eq-presets-8gts",
>>>>
>>>> presets->eq_presets_8gts, num_lanes);
>>>>                  if (ret) {
>>>>                          dev_err(dev, "Error reading eq-presets-8gts %d\n",
>>>> ret);
>>>>                          return ret;
>>>>                  }
>>>>          }
>>>>
>>>>          for (int i = EQ_PRESET_TYPE_16GTS; i < EQ_PRESET_TYPE_64GTS; i++) {
>>>>                  snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << i);
>>>>                  if (of_property_present(dev->of_node, name)) {
>>>>                          temp = devm_kzalloc(dev, sizeof(u8) * num_lanes,
>>>> GFP_KERNEL);
>>>>                          if (!temp)
>>>>                                  return -ENOMEM;
>>>>
>>>>                          ret = of_property_read_u8_array(dev->of_node, name,
>>>>                                                          temp, num_lanes);
>>>>                          if (ret) {
>>>>                                  dev_err(dev, "Error %s %d\n", name, ret);
>>>>                                  return ret;
>>>>                          }
>>>>
>>>>                          switch (i) {
>>>>                                  case EQ_PRESET_TYPE_16GTS:
>>>>                                          presets->eq_presets_16gts = temp;
>>>>                                          break;
>>>>                                  case EQ_PRESET_TYPE_32GTS:
>>>>                                          presets->eq_presets_32gts = temp;
>>>>                                          break;
>>>>                                  case EQ_PRESET_TYPE_64GTS:
>>>>                                          presets->eq_presets_64gts = temp;
>>>>                                          break;
>>>>                          }
>>>
>>> This looks like 'presets->eq_presets[i] = temp;', but I won't insist on
>>> that.
>>>
>>> Also, a strange thought came to my mind: we know that there won't be
>>> more than 16 lanes. Can we have the following structure instead:
>>>
>>> #define MAX_LANES 16
>>> enum pcie_gts {
>>>       PCIE_GTS_16GTS,
>>>       PCIE_GTS_32GTS,
>>>       PCIE_GTS_64GTS,
>>>       PCIE_GTS_MAX,
>>> };
>>> struct pci_eq_presets {
>>>       u16 eq_presets_8gts[MAX_LANES];
>>>       u8 eq_presets_Ngts[PCIE_GTS_MAX][MAX_LANES];
>>> };
>>>
>>> This should allow you to drop the of_property_present() and
>>> devm_kzalloc(). Just read DT data into a corresponding array.
>>>
>> in the dwc driver patch I was using pointers and memory allocation
>> to known if the property is present or not. If I use this way I might
>> end up reading dt property again.
> 
> Add foo_valid flags to the struct.

Some(u8)/None would be fitting, but we're not there yet :(

Are all 0x00-0xff(ff) values valid for these presets?

>>  I think better to switch to have a
>> array for above 16gts.
> 
> Whichever way works for you.

Sorta-answering the earlier email, I have no concerns either

Konrad

