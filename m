Return-Path: <linux-arm-msm+bounces-71783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED95B41A56
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 828B03AFDF0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397F22D63F4;
	Wed,  3 Sep 2025 09:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjbaNc07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959AA2BE03D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892710; cv=none; b=r751K5rWOFZh9xjOK1aNOcQvZSlrHuHNDIGiTkfcp7S2s2jGzOfhCeddd8VHpAZOpSNmPfy2VcbkJvlmR5SdiD4yCfDF9ZH4StE0tcyS+5BkDPHW7r2bsGmaoJDoD+CG7HiPA/cg06qIXvYwE0/Eb3mHMxzU01N08vZB2unjFxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892710; c=relaxed/simple;
	bh=q2v6qcZzixcAqEr1REji/2UUZTWKwLk2qjxlSyh0MnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgmwPYrztOTki923kgiNf3gfvXKpYhbklZw5sVF29RBDH6DVO9xaA3MuZXcWDyKkL64nXR9CvmKx3LOLTRPUVlbFRWZlqQZvAeRu6PAtT7BHy/Hdk5MqI3vQLrG5R4R1XX4FQNtGTab894BJEfoXo1sVEZhVxbdVzJCSHsP16+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjbaNc07; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832A40K001977
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8WRXDLSRnC8XRPAbQ2iesTlZT33OnNC5zDDlBuSNGI=; b=PjbaNc07VLQWPeew
	KfcHi80Y+0EX57nMpBmXgS9/I2NIN0F8iRzvE4GD89CBguJys9SeHUOmTD6n9Xn7
	wgTeGrw/6pyGiSQ71Xb8udoE4PwTzERaBXhAmCSNCQrYD6vrwfmk0dsw5UcPGwbr
	P7xV34myPe0FLGnk1wlydipkRJl55SHSdr2P8U0kC2Pg1nEDjutyTnF+w+txpis3
	zbl3IkXeXUr9jHLnh5x4G2nelojxg5C4z6euavCvgZFKQNhcg5koP8lCxTHcXUYW
	nNWCgtYw9fzla2JX8mXgSsPw83zlES0D0aTsAhmHjmR3vMWvvlm6CW39VMKGhpfd
	BWL+sA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy6xte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:45:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so6204468b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756892706; x=1757497506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8WRXDLSRnC8XRPAbQ2iesTlZT33OnNC5zDDlBuSNGI=;
        b=fhaiVyFNr5F3nguxc348Ti5PoZlNNYYzbVWFDkQxErK0T32M8hSQD1YcT6B7MGU+Jc
         WpzEY1IwFjufIYRzJUCgV8+DwINJKHnzC68d5iyv+yBbp4XaPMHqgzl2NXiP2l4x884W
         g4PWQtJXLcTshzZ6Z9GYhUacU/fo4erkJ/ICVmef+zKlEFmVxr/dgQ4n3y36gGiJbxvj
         QwdhsB5eDkVniIaoiaUi+FOZqKINzvUsIRWfWhNFhxrsWZjCNiJWVN2wJxs7nVO1FBb9
         kWYT0tXeMDmVTBlUYjTEqZSTB2mNoCUgZnP254UQFk89wWHF/GlxRa7RgZj/B6RtG8kX
         IQEw==
X-Forwarded-Encrypted: i=1; AJvYcCUeS9eFjzxVJKkm5pSFJ2G5NcKdTcw8/S76elaZjN7aXkn3yXUY7VhJJ9fN8c5yebthOfk4v9GPo62krJX5@vger.kernel.org
X-Gm-Message-State: AOJu0YywUdZdsEHe0DNza3gLwdn7NIfkK4zwUYZjlWEvpSdMy0moEgdE
	BwRxRUGQgWVjQLN+0JXTzzPDcqhf86Kl51aLLTEDoobvZp7yj+I9395dJ0ZbtasqEC5Q7dDqiHk
	xXZf9ZukMlC7W+OI7FOagcuqXgUlQjCUDyk5joIhRAx+nZhIaH6agMLgnSwyOS4uPQdD7
X-Gm-Gg: ASbGnct9bqLlZarlhkwCyKLnSav42azutwFJKKdPxVS2cAxuKUv4b/jUBzslevRR1Fy
	wqTSwC7dpKxCWgv4nYJKlNZMc4AQLXXL1vP0ME8Mx5EgJov0NtVxp95xQbwbU2bYMj/2gX2RL55
	7bYyqj+gsL/sMm/Rks5qPX1FQoNcOQFsVY3pBOLJon8CvO3sVnZHu68PXsD8RocK/QPo+654r9W
	8foY1QfxUAr2TIQEtNTs+vgnV3iHr3qGzkMn28tWmyheu4tTtrEzh2ZoothvYkk0wS83XkJdttj
	Jf97b+vyt2j1cZSZCtPi3zvI3wEIupfgSQsz0KZRmHRc7aqaVCjxWqkbYahBeMIeHJ2cKpPMpNW
	8sr4jyA0nN05rSsrvyeJ+N7F24HY5
X-Received: by 2002:a05:6a20:b925:b0:245:fdeb:d26b with SMTP id adf61e73a8af0-245fdebd5dfmr5431182637.15.1756892706120;
        Wed, 03 Sep 2025 02:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhlCR8GZ69GjRWnu7qYDF0wGBonOzAihcPkBljNIdZqZmqvkKzLdcmu02p66LMVveec+jfhQ==
X-Received: by 2002:a05:6a20:b925:b0:245:fdeb:d26b with SMTP id adf61e73a8af0-245fdebd5dfmr5431151637.15.1756892705626;
        Wed, 03 Sep 2025 02:45:05 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm12597072b3a.4.2025.09.03.02.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:45:05 -0700 (PDT)
Message-ID: <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:45:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
 <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b80e23 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLniPwaoQ1pyRlj9UEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: VeRYQmHUSanNWiaVdFkjXIlwOhpfoxb2
X-Proofpoint-ORIG-GUID: VeRYQmHUSanNWiaVdFkjXIlwOhpfoxb2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXwAMLtFl/TfFS
 Qhqzuc99FFdiRa44YUkG4yAUryyC1E04AV/9gPGeGM3RE0DWYbi+L8zFpmsrubKChOPLdhcco4A
 vg0vOJjCsXUsUDIvtLximfCi6XllGWUj4StCEC0zft3dEZ32+efzaOOsr+GflkSKJIAdARWFJUv
 qIsRGxuEK1SWEKZO+GGhYNEJchDTrcOGpz76LAUIMuyufbsRrnLOHN+4rhHiUZErpaHvmzRuSqm
 NQ9vF3Fk+PEhTZD4H7rMTkfz0ZMmB+Wpnw2QqHy4S00t37FoSRxQUKpmFof07MfCE9pY+eFoDj/
 9kUYVz7gBiT0wtQANjSCWPquLkx1qtXdFJjZiGCGnv+pBwqiFVocljvKp2O/ig9CIF98FwUTKDE
 9e44dvfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101



On 9/3/2025 4:57 PM, Suzuki K Poulose wrote:
> On 06/08/2025 09:09, Jie Gan wrote:
>> Some TPDM devices support both CMB and DSB datasets, requiring
>> the system to enable the port with both corresponding element sizes.
>>
>> Currently, the logic treats tpdm_read_element_size as successful if
>> the CMB element size is retrieved correctly, regardless of whether
>> the DSB element size is obtained. This behavior causes issues
>> when parsing data from TPDM devices that depend on both element sizes.
>>
>> To address this, the function should explicitly fail if the DSB
>> element size cannot be read correctly.
> 
> But what is the device only has CMB ? Back when this was originally 

We have CMB TPDM, DSB TPDM and CMB&&DSB TPDM.

> merged, we raised this question and the answer was, "Only one is 
> supported, not both." But this sounds like that is wrong.

I think we may not answer the previous question clearly. But it 
definitely has issue here.

> Could we defer the "Warning" to the caller. i.e., Let the caller
> figure out the if the DSB size is found and predicate that on the
> DSB support on the TPDM.

Understood, below codes will be added in the caller to check the error:
if ((tpdm_data->dsb && !drvdata->dsb_esize) ||
     (tpdm_data->cmb && !drvdata->cmb_esize))
	goto err;

Thanks,
Jie

> 
> Suzuki
> 
>>
>> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB 
>> element")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 0633f04beb24..333b3cb23685 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct 
>> tpda_drvdata *drvdata,
>>       if (tpdm_data->dsb) {
>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>> +        if (rc)
>> +            goto out;
>>       }
>>       if (tpdm_data->cmb) {
>> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct 
>> tpda_drvdata *drvdata,
>>                   "qcom,cmb-element-bits", &drvdata->cmb_esize);
>>       }
>> +out:
>>       if (rc)
>>           dev_warn_once(&csdev->dev,
>>               "Failed to read TPDM Element size: %d\n", rc);
> 
> 


