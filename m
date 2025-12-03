Return-Path: <linux-arm-msm+bounces-84203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA67C9EC77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 11:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F82D4E11A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 10:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D004E2F12B3;
	Wed,  3 Dec 2025 10:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMReJlXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJuT0dMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFEA2EFD9C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759321; cv=none; b=Gvuocf6HtJ4tk+csWSE8Ygna+zVTO2Dx3R18hlTZiDlW/PciVt+jk4nsowqBi21b9YQOeZQr8d6mE6V0+7/xOFujyBHJ689FK6xBzG6yH9j0jMOyUaXIP44OJ9cgxnMjRfgAVA3vGbvdvOXAK5nnCsyvY4wBcHyACSiQVurClm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759321; c=relaxed/simple;
	bh=em0K/RKU+ni8P7BtpuIB9udj7IIR/3vLGu2NcI6J6e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ms3pdxiAeOOoTzMISZCpi/JX4GznhgJxtptY/PZQGawjAthBvWQT8O1AiJxLZIcrGGHuEH5pYo90hUXVhRjTPW25nHJ5rGgdKw4+d3+8H7uMinmLjNOIhKVYMtfBN+Aq6ymjlKcoOJU/bt2gfYhE98DVHbCSCLUJEYW4F97xxfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMReJlXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJuT0dMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39NjKZ2114191
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yR+MsDICLydQbvdRhlBaD+fr5LdUCemOlfiuqXEK1HE=; b=BMReJlXC8GRp0ZX6
	hBNLGeac15ARnLAXokBvDIVOwicCh3SlOa02C0kHW7AZ+GfLgR5seqrFa5yUa0z3
	9vJpBn7SK1IATCqUIHBcJMlIJQlp4bHGHAO2BEHZjfFOkAM3N0pz5BF7myRDPVYZ
	I+SlPHlZEiTb9UKrPABrcVGsJ2z5xs0zcy0YyWUfIHHZFJfY8lOAYIqO5uf72i8X
	vakbp+AsYEmRPs7VEq6s8zzLV+z+NnaPRWmIgxDj+l7006jjj/B8dvduZcBxfdlO
	lXcuoDGe5Oe1zuOSnC6x5M9VHRIX/nhE1420tytGgKG2fvozSTfcZo/Vv1kfgn9W
	sy/sEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjhpgcuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 10:55:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6a906c52so13123191cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 02:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764759319; x=1765364119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yR+MsDICLydQbvdRhlBaD+fr5LdUCemOlfiuqXEK1HE=;
        b=gJuT0dMQwFV7ramP9Ik8hjoeeN6ZrCGJotxWMVizoGfD6oBHl3HfNcHMXfHIrkgKS4
         z07RsHaK3uqbu7AiHwoMQHuTyrDq07yLaRgK+Uiy0sjeZZAr55KAaYiDgv/vmVphXJ4L
         XMQ3HxSBfvrDRZK/3SYpNRsRuEiQXM0+l2MDotw4mWzm0hxCJY+bW+qytGrrEipD9YdN
         LWJx0ihr/Ux4sUgLARDHIE9i8aPLUkzchzldDdA1Uyq4OA5AHU8+Yp9GdMqMlDkd66SR
         Y5l8pd8SnJdGMI8vYLsiwxV0KbsJrLfg7XaaINp5mYXx4oU//H3eeCv2PjibbtniVnBm
         Cr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759319; x=1765364119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yR+MsDICLydQbvdRhlBaD+fr5LdUCemOlfiuqXEK1HE=;
        b=mKoyTABDEarU8t2ikBc+Z1x+YmXVop8IeYLCJP6rpytsoS2rbBvxczFQyKZy0Z9Qv0
         1zKwVrsKOEtxKSyJ04Il7wWdXUqWCx8M8zsQDnoL8+HQnfQC5rVvZOy+RKBOZOWVKs//
         BnWfwUZpDhCJCtphd4dJaQEyVagCa+m2pSS+44NRMFevfXUEZzCA23rtejyXsVHBbHob
         BEZpHLl7tVFw65Y1/BN2CxdC1krT335i9Rg+H/EBakfQ4VvBs+doSJUo2Kv3lhfv76m9
         wQe/28ejk6rfPT3E+OyAQq2lfLTg+zW6Rx1+XxwMNYssmXc3KoQrFfh4MSp3EC2w06Nu
         4rgQ==
X-Gm-Message-State: AOJu0YxaqxrBVM7zF8oIFkJs3lWS1kTYRm04avGG0pVNYar5oySzOM/X
	BU63/aj8kht6MlvTvP2jnCeiGBxVb5NmdacfP6doFBQuVHGQZMeA8blP33aS2F+vmffBcL+/gRg
	dKs1IN7ccB30W2SBFrP2WpkIgB/bPZhg8i6QoakEufSZB3V7hT1NaERnPf43PuMeKWctd
X-Gm-Gg: ASbGncvudc4UFurThc5OhPbQrm48kWxPIXuHX7ho914zbWNBLqrxRcxoLNz4l4yEgee
	uUrV31iufW4KgFqOS/ryTGOy+FmP2r4WsTSTlrHvmeBZ1QT65qT+p+VjS8gXbKlLsvuR6RTohp5
	UxVmIK6+7B7Ft7L2aC8bQHzWGbAbu2lcuhdNjSVHU/TFn0SZU+hPDcNvwrOkrWMKw6GJtcQOtVG
	ee6M5EgvKOmpnWBK94FOk3Av5bwYKqoZL+Hi6fycvF/EqMuyaRgvBmjyYeW9NgsGXlLhYYhccm5
	UCF1jCDzEf+DqDBYxndl1rHZAYKBT1/pYv8rzS75LLvqQ7ssQ7sbsQ1+6TZ/WpsINsn45aNsTVf
	0W85IoZDW/XCAA642SJhtwTR0SLAAEm96+o+fPpth71Lm/IEuypjgiRf5f4avvEPvig==
X-Received: by 2002:ac8:7dd6:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f01750b1damr17836331cf.3.1764759318629;
        Wed, 03 Dec 2025 02:55:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr5PQ+gv7K6GuZzMoPFuo4GgPd9lsQ5lQLFmBxYkjsvmJqCdnkBJsvqSRrfwVjViPa0QgdtA==
X-Received: by 2002:ac8:7dd6:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f01750b1damr17836211cf.3.1764759318228;
        Wed, 03 Dec 2025 02:55:18 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aecbdsm1704405866b.38.2025.12.03.02.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 02:55:17 -0800 (PST)
Message-ID: <ed9475be-c3a2-4eb8-9b3e-7e4824a5d4de@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 11:55:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
To: David Heidelberg <david@ixit.cz>, Paul Sajna
 <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
 <adcac270-3668-4b17-b430-d67ef311dd7c@oss.qualcomm.com>
 <803c48742755394d6eabc34ac73a42b36615cc01@postmarketos.org>
 <1d56eccf-1978-43c2-afcf-03ca88acc0e2@oss.qualcomm.com>
 <164f88c182ff8e17a0d544effc7d64cdd73cd4eb@postmarketos.org>
 <de30bfad-a28f-4cc0-9099-11877428070e@ixit.cz>
 <88d96898-3c83-438d-89e9-4bb2bd0dd98b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88d96898-3c83-438d-89e9-4bb2bd0dd98b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JJg2csKb c=1 sm=1 tr=0 ts=69301717 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8
 a=1eIp3gH4w8MLQwSKTRAA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: yaDYry-1NEwEU5Dexoty-yAlpEOynlCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NiBTYWx0ZWRfX6nzW2923N2kl
 BsErGqKYO15jof8uuzOq6FgnGT+4e1SLtvyYJ6K3uVnhJL9EAZawgyOrGM1Nobsbqya32mjuIYp
 m5CBSCxisqzG6DQd39AgQxDTW1f1j9lUKYY1Kc9vcGzMtXopFf/BLidvARzX0joBoe+wgjmtDmv
 4q5Xa0ms3vK9ztMw5jttS7reBhggXbGHy4dYsK5rhRNhjsw9KtLIpUP0g0sca6sP8dF5oMGdT7N
 hdO44b7GHd3rW24gThWT/aF3KkNCFXLGGpHNo1nxi+wTgUhlrA8zDzz8qC5thCgoq8z6GmVpQ98
 TiP+TXCuCnuFi6GVLvt8/06cksAFG6LkAC4TOnvhcoGqWzxPdvMWmKzz3L7IMbws5Tuvl2ilI5B
 IL2C7vo8v4lJaeRQlOmVbUnk67VMzg==
X-Proofpoint-GUID: yaDYry-1NEwEU5Dexoty-yAlpEOynlCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030086

On 12/3/25 11:45 AM, David Heidelberg wrote:
> On 03/12/2025 11:37, David Heidelberg wrote:
>> On 03/12/2025 09:42, Paul Sajna wrote:
>>> December 2, 2025 at 10:34 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com? to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
>>>
>>>
>>>>
>>>> On 12/2/25 5:41 AM, Paul Sajna wrote:
>>>>
>>>>>
>>>>> December 1, 2025 at 12:41 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com? to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
>>>>>
>>>>>>
>>>>>> On 11/25/25 9:12 AM, Paul Sajna wrote:
>>>>>>
>>>>>   It causes this warning
>>>>>   [ 0.000000] OF: reserved mem: OVERLAP DETECTED!
>>>>>   framebuffer@9d400000 mailto:framebuffer@9d400000
>>>>>   (0x000000009d400000--0x000000009f800000) overlaps with
>>>>>   memory@9d400000 mailto:memory@9d400000 (0x000000009d400000--0x000000009f800000)
>>>>>   Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>>>>   ---
>>>>>
>>>>>>
>>>>>> It's defined for both devices that include this dtsi.. perhaps you
>>>>>>   could remove it from there
>>>>>>
>>>>>>   Konrad
>>>>>>
>>>>>   I don't have a judyp to test with and prefer to limit scope.
>>>>>
>>>> This is a mechanical change
>>>>
>>>> Konrad
>>>>
>>>
>>> Sorry, I tried to have a look at what you meant but didn't quite understand. In this patch I changed the dtsi that is included by both already. I don't see any other reserved-mem nodes in judyp. Do you mean I should remove the framebuffer from judyp? I don't think that's wise since a panel driver isn't added as far as I know.
>>
>> I think this warning likely comes from sdm845-mainline repo, as it has extra patches, which trying to abstract framebuffer into sdm845.dtsi, where it likely conflicts, have you tried against clean 6.18-rcX or next?
> 
> ... or sdm845-next repo [1]?
> 
> I sent the patches moving framebuffer from sdm845-mainline repository as RFC [2], but so far it's not clear to me if these should go in or not.

Ok I only did a marginal amount of grepping and judyln/judyp define
framebuffer@9d400000 as the framebuffer device, while sdm845-lg-common
defines memory@9d400000 as a memory region. I assumed they were all the
latter.

I don't see any other framebuffer@9d400000 in sdm845.dtsi so perhaps
David is right..

Konrad

