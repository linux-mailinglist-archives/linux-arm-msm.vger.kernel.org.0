Return-Path: <linux-arm-msm+bounces-76495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE75BC66EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 21:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C803BA76A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 19:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E7A2C21DF;
	Wed,  8 Oct 2025 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmT5xaWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7022C17B2
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 19:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950663; cv=none; b=lRXOBJipOOpifipme5QaqIpWYUxu55n7TzmX2oEyKeVGXfN0M348vYGlUspWX1wXEaWujsvMD/+g4/a//88SwHjHb50ZEwK/IoiGqYX29iDui6MenA2jrImYNNql3NHAl6VKwbLEZv0yfvzeKwaE9QmBBsBagIoxs+PwVgKV9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950663; c=relaxed/simple;
	bh=Ii5p//lANQpwUR+totbFED/Y+2YNQArSAdIfd7L7Oq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVDc1iOjqpdHJ1JFLWE1uFfUPV8hVAwPxQu1oEBD9KWNX960XVmBtNOx+An+zPiwBUiTxjd5tAkfU1hGcBwAgZ3bLIRn28xV0MRC5BoGLcCCSuOdXIlt1uNRCp6xZxqYPQyadUt3UbUtB0N3hnpRFy5vd+0sySw84xw4+wHckFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmT5xaWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5dso013793
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 19:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2Ckrd2MBpwnD5dVtICWm9gQnW8kfuaGhxbrS62TfrE=; b=PmT5xaWJe2G6LtuB
	yTIu1hnJR6OgEDqn71ZXfUX805mHX84p+e2/iXQjr7YIBySYX2QYS13as5WmdYg2
	9ZjFRKy0d6jVw6fUpKQBmZ6nxje540p7dfyYQzI/jsT2OEpXepFkAT1VUpoOc3lW
	FanPWwdrrLCaqT+5eU0G69Wsw++ajE3iEbvZm2EmW200UvH0VKfgmvCxxWToZQVW
	tHQ3OVUAZhwTyprk6JOtyFzMoFOrvSJy6kbXj4FSUz02e0D4T98vPS++qaWaUgJj
	eVcastXt7dEYwo7338Eav8kuugjqdnJsmpnLp4xVB6aHKr0+HFBCDpHgDt/FNvlp
	tRMZeg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j0bbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 19:11:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28a5b8b12bbso5217355ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759950661; x=1760555461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2Ckrd2MBpwnD5dVtICWm9gQnW8kfuaGhxbrS62TfrE=;
        b=WFQNwpXJ5shHuaTzlLzJbgS+/YOaO+cqUbBdWkcf2cOgcIfIJIYhYTXwHcBOed5Yn4
         Pma8dTRLk6fqCBLlqKJhZiM1oztc3HxemJEH+Ygqt4D5ZQY4b4Xs8fouBTz8GQfq8Hae
         apSlryGOiYAFD3eFj5/akavLRR+ljgWKXcENp5jamwX1d+Ts0ZFp3V6uvtWjb5WZ6cpA
         T+fRGIrKe/6DJLjGXq+jnzNZD+U38QjWJi6iKZJ74wwqUozIt6uC9cYf9z5qVV8O7xHS
         7LUvnGZKXlATVbQsnlCso8UySH98V76oFoV/0m4RO5VMyujKU4O2ASLKNGCnPZtLYw5C
         s1eg==
X-Forwarded-Encrypted: i=1; AJvYcCUjYtczxbIbspIftDLOXPEEptAMcdInXgzU+mz85xzZrxjVLLjUbzrDhVALBDdOa8GPKKeTyx7dab2jVXUo@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+Hj5Xtun+Ki9WaInesLB70DH828uV/UAf/Rd7kKeRHCU7e+M
	tSUfijkHFwCcc0HemIPxJ6GoU1bQRlhnAJ61/xiKo9qOFZL7HTTjvtb3K1ES8041Sp5oZNdBWd+
	pIrWipgtEO1gfV7bSKyZi+AF3qVM1bVsUmqYprgmy38U5miU1wwRWdbSY0XUDxJUOkk55
X-Gm-Gg: ASbGncuAY9zFYPycZzOsvxNbJg0vnpH4InLcVW8m7qAMIGjB3KkXgdwWkQvNL+UQw58
	rpNDtvD7b1AjImmGuJcZvy/T+VdZvmq/o+nRZ/Jg3wfRvmCVt0X57r0AJIMmqgrVYWqnKgGQzTN
	OVn7owICnsx5zDxZMMLR6YR7oWTtorF3rk41nQit7iuZqIGj6XmoSeDR44jQq2CCjRhc7romg5R
	p4X4PZ9JwJLjQZOBiMwfh7ZtAAkGJGHaJqHVqhiiz452jgfIvwp9TQhdCz5zIvGX/mKVk0xj143
	JHz8zVHmCAjr8+TdSanshyLcgYIghkfUVL0dnG5oNTPLQmG8YSWaSLH9qauflnI+js0JSOJTnip
	Q
X-Received: by 2002:a17:903:3807:b0:269:4741:6d33 with SMTP id d9443c01a7336-2902737a672mr59928995ad.23.1759950660785;
        Wed, 08 Oct 2025 12:11:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoltEn2VRkpyMuHU5UPRZwV8um+jjn0mCO/9YfDOkYq9eUvZtXCOTDt/5dwPosSV7tuY7/xA==
X-Received: by 2002:a17:903:3807:b0:269:4741:6d33 with SMTP id d9443c01a7336-2902737a672mr59928625ad.23.1759950660344;
        Wed, 08 Oct 2025 12:11:00 -0700 (PDT)
Received: from [192.168.1.6] ([122.181.205.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de5defsm4950085ad.15.2025.10.08.12.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 12:10:59 -0700 (PDT)
Message-ID: <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 00:40:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
        saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
        mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
        abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _HHLMmEJY8r4Q_HjLwCemsKWwBYESkxW
X-Proofpoint-ORIG-GUID: _HHLMmEJY8r4Q_HjLwCemsKWwBYESkxW
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e6b745 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6JKELlXEPSgWT0DDZg8VgQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qT7v1YyD-ofD8Pk09kQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8w+jhXCQawnV
 lqDOuf3afvDyhN5Uf/8i5sLatc3CghNUz+45/Rs2sFmFJQsriCFMrGaQqjAjpDJn/svtcRrB/Dt
 NDqhB83zzUjSGKsgwm72tB+om5/QLt6ym9AOPm0ad2Rk50ATAIvQLYQnm1hVFv4+zg8fh7Y9OHo
 eAoxuvgZLSOeoKwIMak1B6jDDQL0jAFjWiX1qSjclU3K9fVt4Bv0l/yBPUJ+Fle8rG2LNZU6i3I
 LZQ15xF66a31ttG21BGFex1CVUQuMbEO0dllOgebeR1G6qCwz8GFTUgl9xyFD9WiwQCicbR6DoS
 vR8PePhY+eGS4ZCB3ttcq9QFE+q10WPc2U3b8XeYObSaZidtIAM1lBkdt8RWep3TOiGBDMWd2o0
 eWpnY5DgAn58F9hQmIuWlRUncB8AXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 9/29/2025 3:50 PM, Robin Murphy wrote:
>> USECASE [1]:
>> -----------
>> Video IP, 32bit, have 2 hardware sub blocks(or can be called as
>> functions) called as pixel and nonpixel blocks, that does decode and
>> encode of the video stream. These sub blocks are __configured__ to
>> generate different stream IDs.
> 
> So please clarify why you can't:
> 
> a) Describe the sub-blocks as individual child nodes each with their own
> distinct "iommus" property
>

Thanks Robin for your time. Sorry for late reply as I really didn't have
concrete answer for this question.

First let me clarify the word "sub blocks" -- This is just the logical
separation with no separate address space to really able to define them
as sub devices. Think of it like a single video IP with 2 dma
engines(used for pixel and non-pixel purpose).

I should agree that the child-nodes in the device tree is the easy one
and infact, it is how being used in downstream.

For upstream -- Since there is no real address space to interact with
these sub-blocks(or logical blocks), does it really qualify to define as
child nodes in the device tree? I see there is some push back[1].

  > or:
> 
> b) Use standard "iommu-map" which already supports mapping a masked
> input ID to an arbitrary IOMMU specifier
> 

I think clients is also required to program non-zero smr mask, where as
iommu-map just maps the id to an IOMMU specifier(sid). Please LMK if I
am unable to catch your thought here.

Do you suggest to extend the iommu-map to give the non-zero SMR mask
value[2]?


[1]
https://lore.kernel.org/all/ogslvjglnz56lz6nria7py6i4ccp6zvcd4ujpiusrq6xutydsm@xb72os5wk67r/#t

[2]
https://lore.kernel.org/all/bffc8478-4de9-4a9b-9248-96a936f20096@oss.qualcomm.com/>
Thanks,
> Robin.
> 
>> With the classical approach of representing all sids with iommus= end up
>> in using a single translation context limited to the 4GB. There are
>> video usecases which needs larger IOVA space, like higher concurrent
>> video sessions(eg: 32 session and 192MB per session) where 4GB of IOVA
>> is not sufficient. 


