Return-Path: <linux-arm-msm+bounces-55925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D51A9F419
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 17:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C5631A80642
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 15:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C6926B962;
	Mon, 28 Apr 2025 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mt4LGlGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032222D79F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852977; cv=none; b=uQw09UrR7Tji6H6BJI47gtV+pbeUBQwps9yrMRw0tGQHazElCp4sjBqWUXld2cEQwxZ9ZmDdbFxQuqrLxCAnrzvuo5QkPxrbMp50alKeSOrelaSlw5DrUSMgPMUM70X6LhihsUReMMOb5AAdqrCOEedhJwP6Hi0sdpOzn0izBZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852977; c=relaxed/simple;
	bh=HCAZ4kto/mGJaVyhqTgPefL2klZ389e6US/vm3Csn6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VgQ/UUJTRYETHuIbXa9SWV9kP1BFobGomq189V4JeMAnold3BSzkThMQDyikqMQt72l2w1oxVS0LhCYQpFJ4GVa+MO1Y8HSzcXohUQlXXyV2Rd9JJzxldigQ7rbHlraQFDt1Mu/4gfZuOpkKjkTFLvm/2l98SVSZknFBjFWyFHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mt4LGlGy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9slLX006372
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 15:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEOkZ6mFuMRqr/HXy2j51jt/b9iumegqKoRWn+Qv12E=; b=Mt4LGlGyk0CPhMoK
	TZEoagfDspmi7PlJjB3BIQRoOCzIMjxJWa9gRgvDuyS8w7gX2d8NCQDEEB7BcjNq
	9ZW12JhvgX5yB5snPUXKQfdnHECs50HUZ+qe6c/rf2bRUcDkkfUzLykzP4NqWSqh
	sOYfXAj4glCfBPNKcs6VBEHOfoPMzXfPBzJbtr6p+9Hd9BCdi8HeHhO29nyrvV8N
	jELYBQTImV2KI78fXazwuOPrM8RjOrrbp/KVutfqocFy2Y4Wv+2v79qJhhIFlZTQ
	spN9MG1MhzcKvuf8KDjl8NmKthjzAoJa5HtEcJXC/tMc9t16eM+gY4i7usDb5fiP
	1UnUZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevgnp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 15:09:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-224191d9228so58769545ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 08:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745852974; x=1746457774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEOkZ6mFuMRqr/HXy2j51jt/b9iumegqKoRWn+Qv12E=;
        b=rWzageQ5bc5Wgh/KQL70lODDD9LOHQhe8xLUr2G8ua5A+bWnSK9e6F+Ub3Qr0h7fTA
         jEPeg97nExHVT7R+cf3ksdJS2VGS9zIt56AW/jqqiCcMMzKGRMdPh3jA2DeXehrP2R/+
         n8NJp2OFCO5HoVKJPE8mG/EGrk6V1IOK7HOkWSNuDqqHPJQFSd/l3g8pXOYkE8+ZqplM
         GnZ86roUEPSNLcuFfznigDdKR3vmgKlnN/lYjpolAOHeJ8u2ip0udo5NY8+FJUugWWZc
         iIHpA6wsA6R0Y5J6WDJfSf+QnZzWSAH2oIXiAQSUHbLWoKDH/X7QZS2Gkzcr9D60L6f+
         2IzA==
X-Forwarded-Encrypted: i=1; AJvYcCWaWTGy4zZDFJdOAWJRGb2r53PGthQNZNB6Hb5HWoeTUCYWGVwJHkchfdIG9L6lbfSG568w8FhLYUaFvQwA@vger.kernel.org
X-Gm-Message-State: AOJu0YwdV3GWTvjPLkYcypg98F2vRPpHD3EBY2Hqpzk0MqmvkyVTXI0L
	SxsYpCTQxqMY3iQy2EiLx2VjmqDBchYQFmEcl6gPgxt6QHLQHC5LdTAbnJQw6V7wDphRzuu6DXr
	Mw8W7wRT7WDFtHiktu6g2pNu/Fie6Xc05xaQPLm4fKMGMMRaYeXfjzoX5YOYb0zoSGxzOZqTw
X-Gm-Gg: ASbGncv8YXlHSj2lEnEo5pAV9laopzrQw+Ixe+iP6wYhpknsuim3f0b7maxZWtpxE52
	RYLs6ZFoPqOb/D/YPvKQw2pPRlAjDUjwBlSzyZ5QUNd3ZENztMuW3O4nJRwvrvxs//H7gqFIFzd
	6pNePWdwcg3qcAHs16KRJ+WrSBiFuXd83jzFcOCNIaNh3pq2cHnGxCXCgqD1qoTDtmrJHQCUg3l
	44rkuNlxWnxi7bFeiVNpRaJ5T1blVdckbuVtAIycwyYdzXTkWIzXrRDUIYaRQ1xy/N3wSQPAYiA
	nfOdpobPSO0PP5O9eri+U1HZqNZmNSoYZqOs0j+aYB8/zvcoHWR5J0EdBZc4yA==
X-Received: by 2002:a17:903:32c8:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22dbf5ee6bdmr183111745ad.12.1745852973912;
        Mon, 28 Apr 2025 08:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu18ANnj4a36qONwaL8w3obR2ut06Y1UcDSPMiihA60mbLWURzJlp6wajfLIa479txER3WLQ==
X-Received: by 2002:a17:903:32c8:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22dbf5ee6bdmr183111355ad.12.1745852973498;
        Mon, 28 Apr 2025 08:09:33 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102721sm84123075ad.186.2025.04.28.08.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 08:09:32 -0700 (PDT)
Message-ID: <723cb707-2bc2-481c-ab6a-1146c9677821@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 09:09:31 -0600
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
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <3d162e4f-a15f-4943-8639-ac8c47a77b93@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4PrJR0ppiftBMpY8MdW8p70RI5dFABjb
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680f9a2f cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=H3YptR6XEMwMqONLRA8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4PrJR0ppiftBMpY8MdW8p70RI5dFABjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNCBTYWx0ZWRfXy3sjFRYiVMQ8 g4rX3hvXjytO55tw/Brlp4V760KC0oV4BBJEH9AmiS8RzknTBD+N/4ytyqAkrSaqaXXCRmUOlUI y2Q9RdMabcLAOtbY8uVEIO+KF2dYERVE72cKO1eEeqw+SwsDw01t1Vb4Ip3KBjsqTNXiWHhrwAu
 RtNad5Hj1kMG2/F0qfVEDNT5sQbQJ6kQzpOBzr2k4lxLQxyye9pYWT9WCBKRV42tM+/ZHTxX2jg Cr7QNa9w4GuhT7Nub8ZsIdOsB+oMQhbCgffH3rW5t9dEMBuvGv+Q8EaEugYSC/2HzILj8tvtvTc TJIVC+UQAXzQ4DdoBfaIy64QrU/kdW1oMoG/vHt4ULzb/2VTveFoEsPQX3a5w0f/WNPDNCB91fw
 mrtCjQkeWRAG2/5/2cHBFGaSIb1ZiiA7hTpLtpoP6KKhqqPHrvBTzg8d4mSBOVKfpuz3dlIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280124

On 4/27/2025 7:37 PM, Baochen Qiang wrote:
> 
> 
> On 4/8/2025 10:56 PM, Jeff Hugo wrote:
>> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
>>> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>
>>>> MHI control configurations such as channel context, event context, command
>>>> context and rings, are currently allocated individually. During MHI
>>>> initialization MHI bus driver needs to configure the address space in
>>>> which this control configuration resides. Since different component of the
>>>> config is being allocated separately, only logical solution is to give the
>>>> entire RAM address space, as they could be anywhere.
>>>>
>>>
>>> This is fine...
>>
>> We tripped over this when experimenting with an automotive market product. The FW for that
>> product had a rather strict interpretation of the spec, which we confirmed with the spec
>> owner.
>>
>> In the specific FW implementation, the device maps the entire MHI space of shared
>> structures in a single ATU entry. The device cannot map an entire 64-bit address space,
>> and it expects all of the shared structures in a single compact range.
>>
>> This applies to the control structures, not the data buffers per the device implementation.
>>
>> This restriction seems backed by the spec.  I can't find a reason why the device is
>> invalid, if limited.  I don't think this should break anything, but more on that below.
>>
>>>
>>>> As per MHI specification the MHI control configuration address space should
>>>> not be more them 4GB.
>>>>
>>>
>>> Where exactly this limitation is specified in the spec? The spec supports full
>>> 64 bit address space for the MHI control/data structures. But due to the device
>>> DMA limitations, MHI controller drivers often use 32 bit address space. But
>>> that's not a spec limitation.
>>
>> Its not the clearest thing, sadly.
>>
>> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers" table 6-19 (page
>> 106) -
>>
>> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT
>> registers must be equal."
>>
>> This means we have a 4GB range (32-bit) to play with in a 64-bit address space.  If the
>> upper 32-bits of the 64-bit address for both the base and the limit must be the same, then
>> the range of addresses from the base to the limit can only vary the lower 32-bits.
>>
>> Invalid:
>> BASE: 0x0
>> LIMIT: 0xffffffff_ffffffff
>>
>> Valid:
>> BASE: 0x0f_00000000
>> LIMIT: 0x0f_ffffffff
> 
> as an MHI controller driver, ath11k is doing
> 
> 		mhi_ctrl->iova_start = 0;
> 		mhi_ctrl->iova_stop = ab_pci->dma_mask;
> 
> where ab_pci->dma_mask is defined as
> 
> 		ab_pci->dma_mask = DMA_BIT_MASK(36)
> 
> clearly this does not align with the 32bit requirement above, however there is no issue hit.
> 
> What happens if the most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT is not equal?
> SYS_ERR or RDDM?

On the device we experienced this with, we would be able to transition 
to M0, but the later the device would have an internal fault and crash.

-Jeff

