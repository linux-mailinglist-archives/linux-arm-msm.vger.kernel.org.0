Return-Path: <linux-arm-msm+bounces-72004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC86B43666
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2A901B23BD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332442D061E;
	Thu,  4 Sep 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1QR0R6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E32D0C89
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976362; cv=none; b=EvWfuFWAwzNCLBzB5JaDl6oBj+sP28QS6d8JFufCsAZj/tSK7b08fm5z9NSeYUkIXyCSxAbDrNr3i5h0TLEsvBKFG5qFwkYqWOcJ/WjufAnfwXJhtcIIxeScaRenweappV7fvMVmSOAkmuCsoxKyckHCRNBlOw77XjQDVHeTnTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976362; c=relaxed/simple;
	bh=KD7ktfeuQPKUZSNiJGcYWicZkMGhAXrv+wnTlCPpiCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSWnQkO75s4VAdL2cLwiLzCW+WpXCUC/0Et3SgVsghrBY15c4u9tnuWz2cLXfDJdZp/qMeaa4mcTHezOzts6fEG8sqJOUTV3rDWHUsJrhoDzf2vb/P/lEUXPYqhX/QP3BfcDY40+0DSFmlXYkZqgarLNpZvL+ooX+EmvHW1f+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1QR0R6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58411eXG007597
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 08:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6SmD/lRJtpl+jt1dK1UZV6pTcf74vgfYRGz8fZ0E+A=; b=p1QR0R6FqrKgJvqz
	mH00+D1s/Cm6/E1qDhkfOnY7o/3dFYQBm73kQMw/Y6BVC5Sp7bcq+xo1jXmgz95x
	oCfcGPOS6YNJpAcUQIGIP4l9kmrARXRUQ1qOtUmrZAtc5WWBC5TyBgzpbPjJRipl
	+SyvQnZnaDP7Cv7SOYdTL2Ks/xPmhCSoSIMr/MJqJNpS4OPlV/0IV/mQcc6ViQXx
	8BPzYVGcRDsKwjHN7wwkbN5E2m0TCsT568h4u6RgnHoC7LMdaZeon48q395f2Oq+
	DOG/sbwFmDVQ9112RtUSfVaK3eiBSbfqeXbMb2wtP17qRNitoHvGLhQ8X6SbBldO
	1QbjkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv713r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 08:59:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24c9304b7bcso9646055ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 01:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976358; x=1757581158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6SmD/lRJtpl+jt1dK1UZV6pTcf74vgfYRGz8fZ0E+A=;
        b=N85DgdridNy90NIkhXQPpTf1ezTMiKIOooDHhhPA11x+nuzaHl0Usy5pzrVziR0wLm
         AEzow9297rAAWDW1gqyiyM52EnyCKThTHPj/Rs4bowK1qyqELa+LrZlT6nU2/9eZ/3f/
         aBBzYbS5cXSXTdHIoqtjszdYbirI9O2CLx8vUcxFh7I9AF0ub8Kz3sOFKuhTx35V6sOI
         heVxFdeur3MoJvbluuA7I8XTe4P/lXZ8Ut2s5Hiw+z5uEBR/1NR8ahY5A304uTIzy5CD
         U2caMuEPtCOAAu+MXPz6YefeD+FGtgSUqqkSpyfrfSG1FbycSVxmg9Cp4vESz4W2PSOT
         1kyw==
X-Forwarded-Encrypted: i=1; AJvYcCVjY5pHYAurlch8Kl/zAJmH5CQSAI4lS1tGg6uLMqZArJ35OfQQjGI2hha9axqeY6nH9L8UJI7HemprpWAT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2NX5AFyhFm3SO4D6Iz88mbdtO462iU81SO44amTMu5QFlx6rY
	gr4ypS3OBeykdMtB7U3nzLcrL7XZaRLpIdLxkGzA/ImZc2k3owbiic5daKuINLPyvT5Uqa0Fgy5
	5GJi/0IQ6is8oYiBQSJWU+uGTtkVFiuALrI/egVdBiJr90Q5wrSfDittss7uw0gqVgk+T
X-Gm-Gg: ASbGncv82qqIf9rGp6UxPtogQ0Cx0gBDYfN4p2s5d3pN2BWXigDGOWX0i1/BVUurSwM
	j5TQpmCTTuuVYf/ZmV2+LU76GLBSgUNQd6z2DybK8qlzW94xnp9KdCvvlN41mTBOPcrc7nL0TTd
	2rLbIkt9kpmSaCQiwo5h9Em7/8sUfqFz+z4MDsMMWQ+2kucf9blL50mqZyw4AuTzs0n4220Sw2F
	snOMtBQsGII21P9BNIC49Gy9CpMhN1b+Ehi0zoaUjAkutr16kIV7265ulRaMUyr+TMXjkjhUlgE
	d+n0dADak8R/O2R9IpVXyVOPu6DIz+LD30zznsP4UL5VijFZWr8S2v0WvItVE96rknZyY4ioC7O
	u+cLGMa9Uq8kNmSKGQ0yXXMsC6oWY
X-Received: by 2002:a17:903:2309:b0:248:96f3:408c with SMTP id d9443c01a7336-24944b1cb74mr283245615ad.31.1756976357809;
        Thu, 04 Sep 2025 01:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxWuT4vPU835vv5tJ8tYhEIyfyj+itB0O3M9+Ms4yaueqkNroOnRQHh70sZZFhz9A9lgG84w==
X-Received: by 2002:a17:903:2309:b0:248:96f3:408c with SMTP id d9443c01a7336-24944b1cb74mr283245125ad.31.1756976357320;
        Thu, 04 Sep 2025 01:59:17 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b020a7cb5sm79081045ad.115.2025.09.04.01.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:59:16 -0700 (PDT)
Message-ID: <a2e3bcf2-80c9-4c8b-ad88-bd91c33137b5@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:59:11 +0800
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
 <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
 <1cef4224-1f0a-4c51-937d-66823a22dec3@oss.qualcomm.com>
 <961258a0-3cc6-4935-a305-80bb2c2c0597@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <961258a0-3cc6-4935-a305-80bb2c2c0597@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX1V9igCAVaUaJ
 +VTzSthoVgh76haruGiD7VLHkGBYoL3r9zIIP+z+6AsXSXYFrmuE4hor9m/pzurdA/Weqc/87eY
 unhcz1AyBmnm630KmqpWPFc/HJiti+ORFZYhyZexMsNPjQpDh1CGXAL0pwkB44m/LlI9DMy3ViN
 qlQzS5jVHKC/hwezWQPwa+GxRrGsJRBuavS0iSrhrBPFlQQTd/7U+xgptV+14keg0QVZb3aP6FI
 EQwRu8eODjGDYbduufEtDEZTgj95oVkdAzxalnGnchT/vgVZHTSoHzOrZcG+/Amfp5hB284JfPY
 u6HuesIaxuf4MjDRQFDr5E6orbeMjU6zyNCCaJPDmPay3JkjHXnkBcnxJ9c2DQxoL4BjFIDMX63
 ogGZGtVy
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b954e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pVyM_Y0qywZFV96uxSUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: TyCzCzHvqQu1xrD91OIVgzrKKczZVj8u
X-Proofpoint-GUID: TyCzCzHvqQu1xrD91OIVgzrKKczZVj8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031



On 9/4/2025 4:50 PM, Suzuki K Poulose wrote:
> On 04/09/2025 02:12, Jie Gan wrote:
>>
>>
>> On 9/3/2025 5:45 PM, Jie Gan wrote:
>>>
>>>
>>> On 9/3/2025 4:57 PM, Suzuki K Poulose wrote:
>>>> On 06/08/2025 09:09, Jie Gan wrote:
>>>>> Some TPDM devices support both CMB and DSB datasets, requiring
>>>>> the system to enable the port with both corresponding element sizes.
>>>>>
>>>>> Currently, the logic treats tpdm_read_element_size as successful if
>>>>> the CMB element size is retrieved correctly, regardless of whether
>>>>> the DSB element size is obtained. This behavior causes issues
>>>>> when parsing data from TPDM devices that depend on both element sizes.
>>>>>
>>>>> To address this, the function should explicitly fail if the DSB
>>>>> element size cannot be read correctly.
>>>>
>>>> But what is the device only has CMB ? Back when this was originally 
>>>
>>> We have CMB TPDM, DSB TPDM and CMB&&DSB TPDM.
>>>
>>>> merged, we raised this question and the answer was, "Only one is 
>>>> supported, not both." But this sounds like that is wrong.
>>>
>>> I think we may not answer the previous question clearly. But it 
>>> definitely has issue here.
>>>
>>>> Could we defer the "Warning" to the caller. i.e., Let the caller
>>>> figure out the if the DSB size is found and predicate that on the
>>>> DSB support on the TPDM.
>>>
>>> Understood, below codes will be added in the caller to check the error:
>>> if ((tpdm_data->dsb && !drvdata->dsb_esize) ||
>>>      (tpdm_data->cmb && !drvdata->cmb_esize))
>>>      goto err;
>>>
>>> Thanks,
>>> Jie
>>>
>>
>> Hi Suzuki,
>>
>> I've reviewed the logic here. It's not feasible for the caller to 
>> perform the check, since we first retrieve TPDM's drvdata, which adds 
>> complexity to the code. I believe it's better to handle this within 
>> the function itself.
>>
>> We are expecting the element_size for cmb if the condition is true, as 
>> well as dsb:
>> if (tpdm_data->dsb)
>> ...
>> should obtain a valid element size for dsb.
>> ...
>>
>> if (tpdm_data->cmb)
>> ...
>> should obtain a valid element size for cmb.
>> ...
>>
> 
> Ok, fair enough. Please resend the patch without the dependency on the 
> static TPDM patch. Given this is a fix, this could go in without waiting 
> for the new series.
> 

Hi Suzuki,

This patch has not dependency with the static TPDM patch series.

Actually, the static TPDM patch series depends on this fix patch because 
both modified same code snippet in function tpdm_read_element_size.

Thanks,
Jie

> Suzuki
> 
> 
> 
>> Thanks,
>> Jie
>>
>>>>
>>>> Suzuki
>>>>
>>>>>
>>>>> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB 
>>>>> element")
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>>>>>   1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/ 
>>>>> drivers/ hwtracing/coresight/coresight-tpda.c
>>>>> index 0633f04beb24..333b3cb23685 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>>> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct 
>>>>> tpda_drvdata *drvdata,
>>>>>       if (tpdm_data->dsb) {
>>>>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>>>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>>>>> +        if (rc)
>>>>> +            goto out;
>>>>>       }
>>>>>       if (tpdm_data->cmb) {
>>>>> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct 
>>>>> tpda_drvdata *drvdata,
>>>>>                   "qcom,cmb-element-bits", &drvdata->cmb_esize);
>>>>>       }
>>>>> +out:
>>>>>       if (rc)
>>>>>           dev_warn_once(&csdev->dev,
>>>>>               "Failed to read TPDM Element size: %d\n", rc);
>>>>
>>>>
>>>
>>
> 
> 


