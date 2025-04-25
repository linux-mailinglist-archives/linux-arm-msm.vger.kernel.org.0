Return-Path: <linux-arm-msm+bounces-55680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C4A9CDD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07AFB7AE70C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C3B18C337;
	Fri, 25 Apr 2025 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgGaURLn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160018C933
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597466; cv=none; b=p303n45VlsTvz+gZAVSftaQDXW5Gshfbrddyr2z+SB+vrQbSAoKjCdWg14IZt3XMzM2cNSM0v4VxywB9lTNyAdb0tJXaJm1nxcW6n7Gt1Y3WwOxNLaKwPMwRalW/dTpJELC4KYKOLmc1V+d9DF1oge++oHksXTvHfiO0P9GFkpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597466; c=relaxed/simple;
	bh=kyXSdPUuw/vVAlQRBSkB9d13MW7ENNLlR7wZk+1Gqkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwqFfcTXQ7yBF0vT++ldKZUclCYQX59AmZ2eB+QcDxlqE0oO+0PnLrecOkYkHRBOXy1PKVKlVjfvL1lIupxr5mJg5W9ueBbUMRWKFJS2jeKo3Tvco8IlPteO5XIKYeAzdK5VhyTn4+E9MAEYUfh/i0plK6PVUQPGhoPBco0Nky0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgGaURLn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8THF1012251
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RElAtBUh3JMadqAp/lUXLP08HTrrFyJ/4SCZtOIMXWs=; b=dgGaURLnJKgMlQ0Y
	SMmXUhc0Q212Ckq7NIqIlDyrfbEhw5yYmOxqQZ2wrgQtP16kvaJcaEJUGJTAyKOO
	kEpnALgq0/j15w2yKoqjxN6tJWtKy5XvcQo+Zw4f0vmmS88wKvCtNaljzb7EvUTt
	gavwdkJ4wtAwAKKmUj3UTBRRtScLX4psGEOf7vgxrvoGoEtrA6jVxOas6ot/yRit
	UxBCVOZjUelY0iu10RGtAgqPmFaoUN2hGjUMs2aIXeGkE7lHunhTYPvgLMZ3/JPo
	5kYsQZMyjaUVqmyki+h7oIeavn+TziZqbGqRXJWzBSvLaWvxQLwZwr6AHQ8j0XfM
	5JWgdw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh19h71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:11:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2240a96112fso38808035ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597461; x=1746202261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RElAtBUh3JMadqAp/lUXLP08HTrrFyJ/4SCZtOIMXWs=;
        b=uH2ZOaL8tgk3+lEwyHCC4WhdX/iM9iwV9F+COvicL6aaVJAEAUt9UESqo1KBQPFdPy
         lPTs6woEZN/pk+zv2LGWQ4Q9upjPySlyKCQ6aKqy+vlUu0kKaGqEoth8wWDMYuiwAIKs
         dlL0JaX1acmUaf0j1UpCcI5n+7GmSCX1RqK7jyddS8H/424YJ5nW79mj+3Fbl92ZVomE
         9/wFnZRLkIcJiS6g3CgcCkJGS+kkUzfjEut/jX4igk3m30GPXNSw5VZfcvsI6W9zXat4
         GkvjkAjygdtrKeikVylwfql8VrZR8JxcDxDx2vojtyNB0oZMZUAj9HN7LylXIpB4NLzd
         NQIg==
X-Forwarded-Encrypted: i=1; AJvYcCXuurlpwxg+kJgL8EXRwt1FrxPH+i5YTun7SpwJNTQfaSmbKh+Rf7lkOwlZWE8cYukpUpbrBmMqrl8MMdWL@vger.kernel.org
X-Gm-Message-State: AOJu0YzAokgIlFGWtPPcLSJvZRdV1pPJRGIAx6bL34tsEoPpmN26isZf
	S8TifSUeJ+Qg1nopj/87GlHb6eyuuQPC88LSNEg3O5tTpAWXAbEUXTVnOJBvjjdp4VVpoV6n82d
	OL6MttrA4nAXvY99NgZL5X2XAY0ZYxRQ+CHah5yye2vepTMKvfyU1JVZrnkctY9t3
X-Gm-Gg: ASbGncvOfFjafBTSA/oXlSuVjrnSfPks8Sn/v9+1rlOSTo73fr0Dkt23dkY6jitWcva
	uCwmkwO0KxxPMYwVzrPBWjAzgQEaEFZZ1lyzAN/pi0StLmXKCJvIXJVtfsdnPuuCdtqquoGXtPr
	gWVArw7G1yO//tuihtcJZmFTafYWmPX0aNhUUyEbC5uZynDf3Co++3Nr+gssIhaZhOIwVj2oUhn
	w1e7zfTYY/a0k9KISPodR0zCVLMuyY6PSgCzfVYotWq/kYh5GxAnxp682CnL7NafCZPQqhN8zbP
	fYKXOIKidxHq441DxRI89M867JFzBrzrS//MPMF2eMjd2XgWMnj3NHWpHcESLw==
X-Received: by 2002:a17:902:f687:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22dc6a684damr2158355ad.39.1745597461482;
        Fri, 25 Apr 2025 09:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+iKresbEHMCAR10tWIKzWkb6iN1Onwn3haKXlAZ0Es+wfyOdv61jmnXzmWzIAafdyl8Xpzw==
X-Received: by 2002:a17:902:f687:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22dc6a684damr2157905ad.39.1745597461048;
        Fri, 25 Apr 2025 09:11:01 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc5aaaa54sm2693295ad.227.2025.04.25.09.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:11:00 -0700 (PDT)
Message-ID: <3ceda07a-7261-48c4-aa60-fd5ad83ebf34@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 10:10:58 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        quic_bqiang@quicinc.com
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rTkbsTAxC-kKuj0Yo5X0nUumXI5i4KFk
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680bb417 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KGs-PxyYlbaIbUy0pvQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rTkbsTAxC-kKuj0Yo5X0nUumXI5i4KFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNSBTYWx0ZWRfXwhNwEYNXD/pl zpbi3/I2ibowJdHa+6R79HNPvnRafGwJ36AF6IZeUQQGqtQL4ivSZnspBTs1tfL6pQZhFHHWT81 gHKkYw6NlKcbTAMvWCF8kMNJpgDxwHq96lxEUJYhoWUC3yi/fuoa0jrQtufZw345ULFDsyMbqk6
 qKfO1WQd2ZxjfvyM81KnpS49UQ82m6HbtopepA3BeInAtkkwHdb2QLuXLcNcwoIRK9UX4psb9sQ 9P5AjQaN6+HvAcQV7SCDnblQFuHeEIsz1RZ3t5xUVy4ZGjajosMmlESzE4t3TDbwgU4s1qmHgDZ qvMWjUqafP28xwA7nbX9LESqaIYzOKR1fzFHB0nMZtVd2lD1FQhitq3KL2dpZpv4KUn0lPR/NQu
 4mHaAK9S3S/2vEjVnj6Q+VZHmGjKneEM/4SzvF+3gMscikYn8D1RcOZX4KfoKmUmxSUczqOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250115

On 4/24/2025 11:37 PM, Manivannan Sadhasivam wrote:
> + ath11k list, Jeff and Baochen (for question regarding the use of reserved
> memory for allocating the MHI data structures in host)
> 
> On Tue, Apr 08, 2025 at 08:56:43AM -0600, Jeff Hugo wrote:
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
>> We tripped over this when experimenting with an automotive market product.
>> The FW for that product had a rather strict interpretation of the spec,
>> which we confirmed with the spec owner.
>>
>> In the specific FW implementation, the device maps the entire MHI space of
>> shared structures in a single ATU entry. The device cannot map an entire
>> 64-bit address space, and it expects all of the shared structures in a
>> single compact range.
>>
>> This applies to the control structures, not the data buffers per the device
>> implementation.
>>
>> This restriction seems backed by the spec.  I can't find a reason why the
>> device is invalid, if limited.  I don't think this should break anything,
>> but more on that below.
>>
> 
> Yes, atleast I have heard about that limitation before.
> 
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
>> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers"
>> table 6-19 (page 106) -
>>
>> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and
>> MHICTRLLIMIT registers must be equal."
>>
>> This means we have a 4GB range (32-bit) to play with in a 64-bit address
>> space.  If the upper 32-bits of the 64-bit address for both the base and the
>> limit must be the same, then the range of addresses from the base to the
>> limit can only vary the lower 32-bits.
>>
>> Invalid:
>> BASE: 0x0
>> LIMIT: 0xffffffff_ffffffff
>>
>> Valid:
>> BASE: 0x0f_00000000
>> LIMIT: 0x0f_ffffffff
>>
> 
> Ah. Didn't spot this before, thanks for explaining!
> 
>>>> Since the current implementation is in violation of MHI specification.
>>
>> For example mhi_init_dev_ctxt()
>>
>> We allocate the chan_ctxt with dma_alloc_coherent() as an individual
>> allocation.  In the case of AIC100, the device can access the full 64-bit
>> address space, but the DMA engine is limited to a 32-bit transfer size.  The
>> chan_ctxt probably won't be larger than 4GB, so the size is rather
>> irrelevant.  Can be allocated anywhere.  Lets say that it gets put in the
>> lower 32-bit address space - 0x0_XXXXXXXX
>>
>> Then a little bit later we allocate er_ctxt with a different
>> dma_alloc_coherent() instance.  Being a unique allocation, it is not tied to
>> the chan_ctxt and can exist anywhere.  Lets assume that it gets put
>> somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX
>>
>> Now we have a problem because we cannot describe a single range covering
>> both of these allocations via MHICTRLBASE/MHICTRLLIMIT where the upper
>> 32-bits of both registers is the same.
>>
> 
> Yes, I get it. I do not have issues in allocating all the structures in one go.
> But the problem is with MHICTRL_BASE/LIMIT. More below.
> 
>>>> Allocate a single giant DMA buffer for MHI control configurations and
>>>> limit the configuration address space to that buffer.
>>>>
>>>
>>> I don't think this could work for all devices. For instance, some ath11k devices
>>> use a fixed reserved region in host address space for MHICTRL/BASE.
>>
>> Why would we be unable to allocate all of the control structures in a single
>> allocation out of that reserved region?  Is it larger than 4GB in size?
>>
> 
> I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> reserved region for the iova_start:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331
> 
> So this means the firmware will only map the memory from reserved + 0x1000000
> for MHI data structures. But even with current implementation, the MHI stack
> doesn't know anything about the offset, because it just relies on
> dma_alloc_coherent() API which will only honor the reserved region pointed by
> 'memory' property in the node (without the offset).
> 
> So I'm not sure how the firmware makes sure that the data structures lives
> within the offset region. This is more of a question to ath11k folks.
> 
> But your series is not going to make it any worse. Sorry about the confusion.

No problem.  I appreciate the sanity check.

-Jeff

