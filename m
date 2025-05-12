Return-Path: <linux-arm-msm+bounces-57629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7EAB43A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 20:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE7511601B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 18:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C45429992D;
	Mon, 12 May 2025 18:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iw/a02li"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2AF298274
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074806; cv=none; b=L0bEzfv/IIiq2OAM/DDJG+ppuN3HqiqaXKsDXKB6eq3z65pIXYF7+xXDBGhUn3zq8/IUo1uQn4n6zZRF/vMYBx70JqZ+30os3V5WIu3wruA+BxhSTJAcyZfAA85pH2fKIxZeEG54uQ2eD8yDKKfI9lvMS0nucnKDY2GJ2apfU/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074806; c=relaxed/simple;
	bh=aDzYot1UR4Zcmwz4Eld/x6O1R7gTqHoNaxoeh9bS+LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jm6XWL/hU+I1Mu0YvGKDOJra5lqTL5G/h1Fn+Ahtkyi8RJbfNWaPy2qimHsaU4EzolE5JVzcAD+gLYCs0Q5558r6cVCJLm7qjr1Io9uaGS/fZB18+4gxgwgQp8Gk4Z/PkagFPrBIZKBiNIjplwYEGBdmbRHuR5sYkvdBG9JNiQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iw/a02li; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CHA2ol028534
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxrFhle6Q7x3SsW3S3OBWp8saSxehDwsTZ49UOl2F/o=; b=iw/a02liFRaJEu/f
	XOpE7827hNr1HY2fwuyGRUQMeSJUrxyNX8jdaVFb4TWLVVs3vj9m9FOvziHoMrOK
	LGkgRycaAE9IpcnidEUZCaDhCY3MzmDCAmRYM4Y5KMVnTSMSEUhpTGtWYDSHTfYn
	4Hn+3S48zIAxFLGlwXzZeG6NOMdwznH8GPvlSvdhbZlNf4XP4sqgFbXrp5+syfYA
	q1hBtF7QaOPSU4UHO1RliVCHtgewq3h7omdQ+uZX9bldV920NgczcJhEFh5asGjf
	bw2+MrROoP1Opq6EjDg+YJ82jmOLlaGKH7reKJWlMtfJtiJOibTRrQPy/R5aP9vC
	rhqj7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt95a7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 18:33:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30ab8493260so3320188a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 11:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074801; x=1747679601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxrFhle6Q7x3SsW3S3OBWp8saSxehDwsTZ49UOl2F/o=;
        b=ZauqQhiex9CIVNPMeWsbE21zRVg2a1ym/7kBGSjpBhCU0g7LzaUgP0GlBc37U7Cy8u
         py76qmaZDEOjkAsZXjPQmKJKwRRhj2bJAWVwu0hTiEWqk+Q8tW6qYhJB2IkAqcSg1PTh
         7zresbIudIiBinb7Rs5gdXpLYrczPH5nBQe7TR8O8yXwuc1Q5GeGNp7KnrpR1aDRRJzW
         SVwdZVJz36MufWDmRa1gnbTeY0HcRJgwcLmXnefvmX5RdG9o5XWDtmOyNM2nsgBA+e6q
         sWAVivs2ktH99lNBU6yYSpyNmiDtynpb3GuaW7wf/MEjAklwtuMSlyCB0aIvUshxVnWb
         If9g==
X-Forwarded-Encrypted: i=1; AJvYcCUMo0gm+hSsrArG35BQwyhUJwoVfIzyL5Uxq951xBYCM5rLHbqxm8EMYcozudqKL/At+rhi3jZViVjA004Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxSs6v0P6ExA+wVdhnqLdw5ku2G73FhD44m35bw1QJlZ/t+yKon
	+xGf7WK7M7GdBr+qFbREowA+g0yG4WfDw8JQ4K7gtY92OhUbW9LuvB60izs3pTR9m/qcRN8ktCh
	Owresk844yHOhW3dpn2A7wKiUGFYKHqaQa8mGUgThXZ7yQwFBdvLKzVx0+Qq38hFr
X-Gm-Gg: ASbGncvGXD9W8UXujuvtn2QyYHrvELMje+8H/dwi6kvE2UGXL/WdM6oZaJl8ItK8o8a
	VLfiAjX+fUljeRzk0NnCm+2DOi/R7rjxHzz3y1QM5DsYWRYDlyjL6I4WjxbKA7/SVRKOiPE29qG
	rEOFXfakn8+A7NZOhZ0K36U94l8wX6jwENjUfqP0hW4PKfVe0DFwATtPgXKhX5zZibM190DU3c1
	rfYFhiAA/mBt2XdKTdi6hDopJUIhBQOaUs8hwgi+Eo/6+WT2ENsum4YhatQKpe/EgKc+I0+Ytse
	mbR9nPnCrWky0cE508TTb9LXIhE6XiCSHnlgVOIWZL24+Fxc64uP2hff3TvMeQ==
X-Received: by 2002:a17:90a:d448:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-30e0d961a48mr788704a91.0.1747074801147;
        Mon, 12 May 2025 11:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7h8nksE6voI8ZNDv3lNphjA8snw0h3t7JMhjz++0SjhwNvzvqXw27YDGBnFDpyAfCYyoK1g==
X-Received: by 2002:a17:90a:d448:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-30e0d961a48mr788660a91.0.1747074800705;
        Mon, 12 May 2025 11:33:20 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349325e16sm6094190a12.1.2025.05.12.11.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:33:20 -0700 (PDT)
Message-ID: <1347c6de-1748-4e35-a0ac-4fd77199045b@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:33:18 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <3d162e4f-a15f-4943-8639-ac8c47a77b93@quicinc.com>
 <723cb707-2bc2-481c-ab6a-1146c9677821@oss.qualcomm.com>
 <9ac836c0-2c41-4656-b922-5dc20aecf53f@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <9ac836c0-2c41-4656-b922-5dc20aecf53f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MSBTYWx0ZWRfX68xzNS2URdsc
 kwbHxaz++HHT41dz/M9S6WfLQYMA30AIA0CXeWvoBxZtcYjmpXkjGe4pXxNLz39/L+U0RcV5frm
 ePEN9xZi/snD6BuSjzUMcnA6xLdhb2YYdbLGH8nkE002sOL6utuudFzfZyOjTJnVzMrqLlBCsXE
 l7GfHUH/u7XGOb0lCsbdlo80TskCI5EstkrCFcxrAQ0C8qSqKC+wxNlY8m7htDV8TrIBpy+iPFR
 DSbGLY37bWu/P8cW+akEIg76SWdlGEztfES3aU6RsVIqDVMSQdQl7V30zvwwPvPK5wsJq/11lJr
 JZ3gl5UvkGezztNH+PxmPFyEktW+YIKcdTeVKJs72nA+2xKGuqoAa19qAnQ7MfWRhxEOdqRtdm3
 rCRJavS+472sXJBxaIliFlPC0u3Sykjm74RSVH8BrYmVpiDAr2hFcu19iCgKeul/KAD2SvXq
X-Proofpoint-ORIG-GUID: lwp-Bnmmi5mst-q2WD7dSMEUMdguDqZQ
X-Proofpoint-GUID: lwp-Bnmmi5mst-q2WD7dSMEUMdguDqZQ
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=68223ef2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=FsthO6bNoa9-iHtu9tEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120191

On 4/28/2025 7:44 PM, Baochen Qiang wrote:
> 
> 
> On 4/28/2025 11:09 PM, Jeff Hugo wrote:
>> On 4/27/2025 7:37 PM, Baochen Qiang wrote:
>>>
>>>
>>> On 4/8/2025 10:56 PM, Jeff Hugo wrote:
>>>> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
>>>>> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>>>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>>>
>>>>>> MHI control configurations such as channel context, event context, command
>>>>>> context and rings, are currently allocated individually. During MHI
>>>>>> initialization MHI bus driver needs to configure the address space in
>>>>>> which this control configuration resides. Since different component of the
>>>>>> config is being allocated separately, only logical solution is to give the
>>>>>> entire RAM address space, as they could be anywhere.
>>>>>>
>>>>>
>>>>> This is fine...
>>>>
>>>> We tripped over this when experimenting with an automotive market product. The FW for that
>>>> product had a rather strict interpretation of the spec, which we confirmed with the spec
>>>> owner.
>>>>
>>>> In the specific FW implementation, the device maps the entire MHI space of shared
>>>> structures in a single ATU entry. The device cannot map an entire 64-bit address space,
>>>> and it expects all of the shared structures in a single compact range.
>>>>
>>>> This applies to the control structures, not the data buffers per the device
>>>> implementation.
>>>>
>>>> This restriction seems backed by the spec.  I can't find a reason why the device is
>>>> invalid, if limited.  I don't think this should break anything, but more on that below.
>>>>
>>>>>
>>>>>> As per MHI specification the MHI control configuration address space should
>>>>>> not be more them 4GB.
>>>>>>
>>>>>
>>>>> Where exactly this limitation is specified in the spec? The spec supports full
>>>>> 64 bit address space for the MHI control/data structures. But due to the device
>>>>> DMA limitations, MHI controller drivers often use 32 bit address space. But
>>>>> that's not a spec limitation.
>>>>
>>>> Its not the clearest thing, sadly.
>>>>
>>>> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers" table 6-19 (page
>>>> 106) -
>>>>
>>>> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT
>>>> registers must be equal."
>>>>
>>>> This means we have a 4GB range (32-bit) to play with in a 64-bit address space.  If the
>>>> upper 32-bits of the 64-bit address for both the base and the limit must be the same, then
>>>> the range of addresses from the base to the limit can only vary the lower 32-bits.
>>>>
>>>> Invalid:
>>>> BASE: 0x0
>>>> LIMIT: 0xffffffff_ffffffff
>>>>
>>>> Valid:
>>>> BASE: 0x0f_00000000
>>>> LIMIT: 0x0f_ffffffff
>>>
>>> as an MHI controller driver, ath11k is doing
>>>
>>>          mhi_ctrl->iova_start = 0;
>>>          mhi_ctrl->iova_stop = ab_pci->dma_mask;
>>>
>>> where ab_pci->dma_mask is defined as
>>>
>>>          ab_pci->dma_mask = DMA_BIT_MASK(36)
>>>
>>> clearly this does not align with the 32bit requirement above, however there is no issue
>>> hit.
>>>
>>> What happens if the most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT is not equal?
>>> SYS_ERR or RDDM?
>>
>> On the device we experienced this with, we would be able to transition to M0, but the
>> later the device would have an internal fault and crash.
> 
> so with this patch, MHICTRLBASE/MHICTRLLIMIT are untied from iova_start/iova_stop, meaning
> current ath11k settings does not break the requirement, hence no ath11k change needed, right?

I think so.

-Jeff

