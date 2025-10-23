Return-Path: <linux-arm-msm+bounces-78603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36474C017E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 15:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F051A07378
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A64432B9AF;
	Thu, 23 Oct 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5HxI8CD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0649315D54
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226311; cv=none; b=XCRWfB2uN3+9q2fjFEctSxbpvLkiGeTJj31fchj0pMFGM8oLiG/UOsiG0vdXPPiINnz5U9FRUSO5cz5c09t2Bolh8ezxiaEcqVpldOAkTj0ZsV2jhkKcXvt4eTXI3dQqKzjvjnIh7dm0IeJSk0PAmlzmiCK7Hh8s95xqpULMr5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226311; c=relaxed/simple;
	bh=9ZKyN3cdb8SM8RV2bRmg2Dr4cVLPODTsGcnFJEUCYzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCEkpalSqylIa+UKXVEXJiE7D3Nbih5cWmnnJ3uD6GjRh6HQxclMuGAJ1tT5KBMo5iXXI2DSNO1HTWrBl/AMR0E7O1riN1P7tO7/6gR5Vk5nRF+CSwy7+X2rq9n4PduYtQfIpLAtLGc5DYKJv73Cze2f0+mJ6HHih+5Q+iUjMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5HxI8CD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6sh2G018549
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNvE9iSxoXTP/UG2qG1WyVpzFpKobLzR+EucBkWbTNc=; b=b5HxI8CD5xDzQUTd
	CHhuxudUqqwfII+P4qSWjh6Zp7qVu2MzBPYjuWPt1by4Aq7LVpJiaSzDFGP+LBWX
	MUPmiTEZMmundJTBYrvZI8wX38F8WXbHCBzRvaZEfZPI9yYibRjjY5qAmEoUcGur
	fhfkrI7zxs25Kh4B7cR7t/TJYcL7CXeL1ua8tgipYDiACgM9BEzyGHcD/JaNRo4R
	73Vd4gk6UYaziqBzNeR3RZmnyGNeDbXwWOnU13wD8rbUfFAMW9COa4ZQ8agZwkfn
	dW0F2hgnBYK6bHrZGKUHzOszsgAJAo8ELtnudZjEt2vRzQUbnLAtS8LCh8bFGlTC
	zyp4vQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08prses-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:31:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5d7dce38a79so87388137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 06:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226308; x=1761831108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNvE9iSxoXTP/UG2qG1WyVpzFpKobLzR+EucBkWbTNc=;
        b=LwMlnI/q08/XMiVKWn6H9jZ1MTLVw/49NyC3harSuUmHv6IKOsPJyN01Z6Dct74lY+
         GkMkjo8Fxsk/Ss+c2B5SUYcrYZg5oTm8GYomP8CvtLtA6JQVrJV2GTGi1PpSntX2rtqB
         Ih/Z5mucDBrnaQy0ifXcKOrlAdHNoRiWq0+6b01aUPXmjHMxOO+7/IgJue0UmFVah/W9
         GuUqUpQegYXnB9RORK3ZsszR/l4sdH4Xb4EHsASwJF+LNsJgZ95YW4ED9Xz4YED6EKZa
         Q5+yviav4YCXGQlD3N5Wb0bk+OMOOiHxBpUlN1Zp8WmtgAUHyacwquBFvvIIjFrNKxP/
         5XkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz543+M6GGqbJirfq0dJFMAtivEw3yttwrYZWyMVoA5AH1EsvxjDGXkRMsVYdkSQZeiXHtCmQtFKyVMBWt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv7gPPbORCuOfU61T4PMxnUxJBpk7jzaXup8VL0ExByw5xx95l
	DyAWzRbyBPWqNK4vrkP1XOglJ2bkgs/93RE86SjdWZGIzQn3mVvekl3i9Z6gbPyaGic7eFGxRUm
	slbrbfuBfE/vitIqvH+SBfOYO3ckQ0vFxYZqcdnVAoRTKQLLRHzZNR4Ee7zNCadohJbni
X-Gm-Gg: ASbGncsD4YfthM8wHNBQb5paibbH/bnwu2/6fd9zFn0MNw22Fvpc/qsAbJOwj6PgotZ
	8h5zADepyehyhEvkEw8SrEZwl9KbztFIJKo/IZIkjZue90KeMTtcQgMbANbh/i5Ze56vw8wdnpg
	vWnpRdCsvcTeccvjKmw2P+Agjeyf2X/Qv+lkyspsgB7uXAyIZdU9qwiP6GyTsh18eKyw8jAJOI+
	tEnaGjAPjZKsVuWEcEka6wTHfnpMP/Tm99G9+FEDwFfMsxzCYp6cdkfgSQio1cJAtDYohraITf5
	IWonRJaus+xBz/j7AzvXP2y/Tg/u+i86n9fSzaPXj9wUUFCLZjt50Y9Roct7GVBObw2sjGNAz5k
	GuRaLUbhImpIgb5+EAyL34bz2sxaEQvmm2ISaCsZVMXzZLGDmz70afbe8
X-Received: by 2002:ac5:ccd7:0:b0:552:40cd:4d8 with SMTP id 71dfb90a1353d-55685efb75amr1145195e0c.0.1761226307716;
        Thu, 23 Oct 2025 06:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqX+28d9ltJg5RXmi0zz1Laxbv+UmWM9hxqP0xoVRd+VBPPciaDezjwwmWDGu+5ZMh7iTJrQ==
X-Received: by 2002:ac5:ccd7:0:b0:552:40cd:4d8 with SMTP id 71dfb90a1353d-55685efb75amr1145173e0c.0.1761226307229;
        Thu, 23 Oct 2025 06:31:47 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144cfa4sm211886766b.60.2025.10.23.06.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:31:46 -0700 (PDT)
Message-ID: <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 15:31:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
 <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXyO7R2VnmCC+m
 4XhOhCXpxlB3Yg7QoooiKE+Lv5onmbrUqZTKQcVdhUUxt1u1NEKCjVUP+ubQtskQJRTsZbWdbmy
 KSVc5bB5Yr+vKzu6iQsDAUAj6Gt/mbwywaqfwOyDz2ggzbfU4AwSzhynl66BmIw45pPidNeEJR0
 dIAYUlLVUk/zEkiNY6mxVu3dkzQzyeZcZkXShfO2J9xpKBdPt+U2O08CuWtCV78xhtVCSoLWBdM
 ViWz90py38xhmNX2MtfPxuhcfT5AGPnyY2/dlJXk9itqig1sFEssDaZcOSCD7IYfvl5KVGiXJIa
 CkdfVMuLpD6Mmj1GorpIEtn8BbjuXsYmP9yESPsG84JK17KCtujIWt2yg5hfYjfb+g7rz1z5uFC
 Em3X2XO/Ed1bAoOzHxW6Dx/xyxH8dw==
X-Proofpoint-GUID: VUuqcZJbSRM7FmcfZ2MoIFZ4E3L2jWwc
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa2e44 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=n1Ua2TvkZ0XBjMMAIBMA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: VUuqcZJbSRM7FmcfZ2MoIFZ4E3L2jWwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/3/25 3:01 AM, Dmitry Baryshkov wrote:
> On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
>> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
>>>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>>>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>>>>
>>>> WDYT?
>>> Well, I think that potentially complicates the driver by requiring
>>> support for both HFIs for the same platform, it requires detection,
>>
>> Doesn't have to be anything more complicated than a reserved string name.
>>
>> BTW you're right the main reason to support this is - in effect - ending of
>> support for gen1 firmware.
>>
>> But then in reality if that is the direction of travel, its in the interests
>> of upstream and users to make the transition.
> 
> Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
> with the T2Mobile cert and I assume it is fused. We were going to drop
> support for sc7280 from venus in favour of supporting it in iris. What
> would be a migration plan for FP5 users?

Just like I explained, the iris driver would load in its place, it would
retrieve the firmware binary, decide which flavor of HFI it provides and
then decide which ops to use

Konrad

