Return-Path: <linux-arm-msm+bounces-75314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59887BA3DCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D0381C015A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB15279DCC;
	Fri, 26 Sep 2025 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZpmijKy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB522DC346
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892893; cv=none; b=hr7BApZdlHxVkYJg1AJGJbxx7sRsx+ihhXI5ZlpVDQ1hgguMlpZyVzKA3AhEQg9w8o4m5OQudbv1/5n4s8LNZgMKxfIXKD4hpUfXtHYiRo5sm8+8ikXBLhZ31MCIoTpTakxcHPRJNkOd3cm5CAJn/Dx3qpnvNZv4PEWlQOiS5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892893; c=relaxed/simple;
	bh=6UK7sC7g60oZo3v+HjqWDlFdtqGJFknhMavuRW6Em4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0Xbw9cwbRpW+KZPuoA6VYm/QeYfwONCPcKMc8hWGFNJut5xnfM1/TMT44o4ckffKsGgQmtSb0CgM94ObKwltsGHxBjzcwkNHqeHccBbHopS7g61oqoCZk/RI6rrYQ7+hQHXui+UQ9PEwLkvgBvumOymNYAW+yq05IKgJBKWVkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZpmijKy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QBZlJW031812
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZn3+ViDkvz98DvcqF6j3iIY1pg2ROgrLSmJOsp8TOs=; b=HZpmijKyleTwpdqd
	2NGZSaVx6TBwzMbZ38Uh+v4xLGZnuDl6pbEJXHe9vbjm7j0pCy2o83+AqfhBBw4k
	JEnY4gNNo9jwmFNQp5qYUsoDvCdWQMtFfQ0Wx+wJEH9+U8CaU7G18Wk5njxKVHhW
	Dcr2A4cSbqU4aG4khVNsnYG5z+RWtlqj1RlxgyploIPrbjxNzPkPyWxly+xp0aJZ
	o/YdNzyAgh92tAQ5hX82OAbpfe/EztFrRpQvS1drK8AW/qnLQ7yhXbbmQFf5eLKU
	QnUlslEm5xHvogGMHl3tzM0J/teUc6PJRoqsn17kTrN58gYD0UptzTFFWVYZ40aR
	d4wU2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49dt3g88ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:21:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4cb12718bf7so5852691cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892889; x=1759497689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZn3+ViDkvz98DvcqF6j3iIY1pg2ROgrLSmJOsp8TOs=;
        b=Bex/rgVLbGqAzvSx+TLrlPkG1qH2mN0e0TjorBccevFlpqPwACKHI5bIjdCjKuq5q4
         m/R6/FnEAH+dLsWTBFE0ZSliKQNaGtBxGKDLrvngamZOqu69NKt2SnzRjQG0z1PJ1Q8D
         zjK05YWTxjx+0oAuuBfcbXDMYyAZ/QlXZk3FJ204JPW1vjuxMt3KMHKW2SIgYw/ji01w
         NmpvXLBjsZo/YuX8tgS4ddUzkXgYhW9+Ivuk/wNeULYV3lDEaZaVs+23YP7YkO8/IJUz
         NGT+CqD6SA0+a/VPDrsc8WvDwrDigA3xK2Am7uTjSoHvJJttiAqugteKg2axwNj6mImC
         WQJA==
X-Forwarded-Encrypted: i=1; AJvYcCW3s9phoSapVnsE6t8LfJdiPwORtGyKSkvn7RFd40aXQlYDYaiwSr3iVcXAHd1Idj/QiBdmj1Eih7jk2y7r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6DR5Y3Z5HbXr5+OY7xjh0vIpWnCeDVR2QLg0e02kD/s/cYgcl
	tQcRrafmP0YJw8Y9oHI9+I36xwKpqsLA45z5s7emoElMvHpqXNcsB+Dijc/7a091q2b6L9c/iiT
	aFBFBHhgJINsflkI8mjdzhRqgUXB585x4Aan9IC7ZIUd0S4RVUMCNmxWGkNkAQpBxiwM5
X-Gm-Gg: ASbGncta1bwT4AIN8qo4qWajS2Jift5yxnu47cgGLP9iRRPJFdbRHWFuLqtZ2A8O/Jm
	XCCmrNiQqmDqSQRLZu/pW8k6gS8WYC+sdSdxtI0Zo5jKBa3kBwKr4PcUV1BqzfKj3Rg7fBUlo+y
	rhVPUOUKdkYyIhGcUKms7SJdSE+/7iwhJt7Wz3bTekB5cXipCzv7ZrbRUXt58lC6ACm9f1QoL+e
	U5xQGTyhVQw+XlYpE9FbN6FOLMYzxNfQFLH9jadntfrhVL1sUNKq1bx3kK8L++hkuvX6ORmBGVD
	sHy268nzWYALKq/XWOWorTxfFCp7g/RHF9IQGsyizw6S8D0QUSTDjS21DYInBNZruyCl1dEKhSm
	2mnabmkdWZjEfVwfDJwyi+w==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id d75a77b69052e-4da488a2d68mr68988371cf.5.1758892889188;
        Fri, 26 Sep 2025 06:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOs5AkFGBtCeVybInal7Dj0JBGaxf5TiuRZY/p4RsOAuSofCh3ljWxN4/nJ+1DTFBl2D9FzA==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id d75a77b69052e-4da488a2d68mr68987781cf.5.1758892888545;
        Fri, 26 Sep 2025 06:21:28 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3af4fe7sm2958276a12.39.2025.09.26.06.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:21:27 -0700 (PDT)
Message-ID: <c13b94ed-a240-4a32-9f11-f0e323197500@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:21:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>
 <20250925213151.GA2455023-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925213151.GA2455023-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=df6NHHXe c=1 sm=1 tr=0 ts=68d6935a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=UeAO8m2xiAsHg9Yy08IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9t1bfykJj6A1EKTYfTQtRbsVrMW7M78v
X-Proofpoint-GUID: 9t1bfykJj6A1EKTYfTQtRbsVrMW7M78v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwNiBTYWx0ZWRfX1TefyTRWRq63
 u9s/lvNCCIen2/xSUEL4aXZwNCIH+dfnJMVK+rqZOAtdNUgRaq0VgoTCxT7chHG9agcnTWVbe61
 aBfGhEhwCAmwjZ3k/sM3y2QhmFnh+RZBZvrn6JJAOTsTLWelZKPiW9eaHtmIB9nD9Rcq/ntKWQP
 9C5yzIX6Vu+PkWChHQZ9g+uqF9CoymBdJtGVtD2istmNcXM5NPCLvL8RvoulT0HlZ2ZTfb0i+bm
 ISiKbY1+yCxt7BCv39w3X4N/KgOp60212V4mY7wciMgQQEGxZ3w7IRz6Xas9lFKXvCBe74biIAU
 j0MngToL34GjUqit0OBoU5ZEnTLz9cHBtpw4Og2fYVheAXW+tkprQJmF/QI2EzSmvWZYXB+cO4f
 4VMBOFes1XNdhSi2G9AseVXbTVEnwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260106

On 9/25/25 11:31 PM, Rob Herring wrote:
> On Thu, Sep 25, 2025 at 08:57:56AM -0500, Bjorn Andersson wrote:
>> On Thu, Sep 25, 2025 at 10:50:10AM +0900, Krzysztof Kozłowski wrote:
>>> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>
>>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>>
>>>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>>>> (rev. v8) and M31 eUSB2 PHY.
>>>>
>>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
>>>>  1 file changed, 155 insertions(+)
>>>>
>>>
>>>
>>> Second try, without HTML:
>>>
>>> I really don't understand why you created such huge patchset.
>>
>> Because I looked at the logical changes that went into the big squash
>> that was initially planned, and requested that some of those was kept
>> intact - because they where independent logical changes.
>>
>>> Year
>>> ago, two years ago, we were discussing it already and explained that's
>>> just inflating the patchset without reason.
>>>
>>
>> We used to add things node by node and that was indeed not
>> comprehensible. Overall this adds features in large logical chunks, but
>> there are a few of the patches that could have been squashed.
>>
>>> New Soc is one logical change. Maybe two. Not 18!
>>
>> I can see your argument for one patch to introduce the soc. But two
>> doesn't make sense, because that incremental patch is going to be the
>> kitchen sink.
>>
>>>
>>> Not one patch per node or feature.
>>>
>>
>> Definitely agree that we don't want one patch for every tiny block!
>>
>>> This hides big picture, makes difficult to review everything,
>>> difficult to test.
>>
>> The big picture is already obscured due to the size of the content
>> added.
>>
>> Comparing to previous targets, I see the baseline content in 2-3
>> patches, and the remainder of the series being things that usually has
>> been scattered in many more small changes in the following weeks or
>> months.
>>
>> There's plenty of features in this series that are yet to be concluded
>> for SM8750.
>>
>>> Your patch count for LWN stats doesn't matter to
>>> us.
>>
>> I agree with this. That's why the QRD is 1 patch, and MTP is 4 (this I
>> think should be squashed to 2) - compared to 13 patches for across the
>> pair for SM8750 with less scope.
>>
>>>
>>> NAK and I'm really disappointed I have to repeat the same review .
>>
>> I'm not sure what you're disappointed in, this initial series is larger
>> than any we've seen before. I really like the work Jingyi has done here,
>> aggregating the otherwise scattered patches into one series.
> 
> The QCom folks can review all this first because I don't care to review 
> the 50+ binding (just bindings!) patches sent all at once right before 
> the merge window.

Unfortunately this is sort of beyond our control. We don't expect you to
review or apply these patches immediately.

The platform announcement just happened to occur at this and not any other
time, and we can't just ask the entire company to shift it to better
accommodate the kernel release cycle..

We do have an interest in sharing the work at the earliest time possible,
and with all the legal knots included, this is what it came down to.

I (and many others) made an internal push to upstream any pre-requisite
patches that we didn't need to disclose any platform details for in
advance, so this patchbomb is actually somewhat reduced.. but of course
DT and bindings are the main course size-wise and we simply couldn't do
it earlier.

Give or take 80% of the bindings will be "boring", i.e. "add compatbile"
or "add compatible and adjust clocks" because our hw is rather
standardized and the interesting changes often happen at a level beyond
bindings

> One comment on commit messages though. Please explain how the h/w block 
> is or isn't compatible with some existing platforms. Many just state the 
> obvious "add a compatible" or such. I've yet to find what kaanapali is 
> in relation to any other QCom chip. It may be the next SoC for the smart 
> toaster market for all I know.

Perhaps this would be useful to have in bindings commit messages, but
the cover letter of >this< series states that Kaanapali is the newly
announced Snapdragon 8 Elite Gen 5.

The product page states at the very bottom of the spec sheet that
SM8850 is another name for it (although the shift to codenames
happened precisely to disconnect from specific SKU numbers,
because e.g. both SA8775P and QCS9100 are 'lemans' silicon)

https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Konrad

