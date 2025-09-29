Return-Path: <linux-arm-msm+bounces-75471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75452BA8106
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 775463C32D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A309D23BD13;
	Mon, 29 Sep 2025 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IK2NNqDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F92367B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125997; cv=none; b=EL8YQfh1Z9PzlrBd+kdGhwFa6PKL4vjIbACLr49YsbYtgzKa6NkVhHvtZgZ8CwwpU6meN13mSQ58DELYyju79QOS8X1+dtpuQrXvYjF3shsIjkeoSs+Sljai75gM76Im98mQqZZUZJ9kuSYPTSvXj4YlVUa0b0gGvcOltHMpqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125997; c=relaxed/simple;
	bh=f6eb6fxoe7BeqY+cEMOqQNNH6VG/7YpmLuYjkF1xnt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQjg7laJNuSnsN1TvDGnIbn+0CzlvvKTTD1jx0x3L117DLfR2Yi22wavwebq8wpajVA9hTff8xw7VLe28SewhMjlBnYzxMsY2pUdJfMCR1PgXA4KJAXFqWZnaMd9FfddSE8xLm/+3e4g7GE/gVzqEI3DTV99Gyt5GkdimFlJ+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IK2NNqDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T0j5GT027018
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTrdBp9lXsdcKgw8haPbbC76qwmy0QVMCAGujtDV6io=; b=IK2NNqDaroVF5gr7
	u+5yGdG4nadiphIvn23DeGd3i8e2nZTd0zX1oxmt6CwaFSiyR2tFT+ljmW8zUJPp
	q5KQhP2/qR2CcPmgjXs7Tk+Y1GndqLIqcWJXxYcqutQa3iDUZUZkHzHznlbZe0Xx
	py19Hxlpb51ubIb6fuYaPLn2ULVNz6bpCR9YxJm9gCTnpzpnvUQFr0PuRZWL9hW7
	MtJdVQ9XVlG6RqwNUzfs12eGmP4fXL+5ZoBuOMxNPwwlbdsM/X0nVog79DuYMDYn
	6fbUa7tBF56GirHC2AkuH1dtvpOdmQUlS73AjbScxzvmDKxp8k0C9hmSZog7qXwy
	KLjgzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hbu99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:06:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ed9dbba55so1185920a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 23:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125994; x=1759730794;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTrdBp9lXsdcKgw8haPbbC76qwmy0QVMCAGujtDV6io=;
        b=FBeFzfyf6yqiaQFixbXoApejBtPnlaSfqX81WXFJImEwjen/Bo0Zjf3pudJn1vENiB
         g2Bm+oOd4LT7AOuJtoWKHeik7qrzPpLYkm4B2K8EqaRKSETjvgMUPwl6T/5uATYSeMUM
         dh73DXndLH7MQpVrstjl46iTk0BoPdbWyppW4s0dzWVZFaV8U+e/3+5S71uvuQlSYv6Q
         o4pJdPxE6uPKaPssoouLjWJzYXDjjVeFwzga9bYGKZZgKyCQnhjqAgX+k3gOf7ZhnXAO
         UqQeMpODRNeD+PQmQw6i2i05q6soiEdx7pK/3k/gmfs+cXC4UdpYAeOmq7CmYJIwjTeI
         QUbg==
X-Forwarded-Encrypted: i=1; AJvYcCVA2GNSMlFEITh7QwqGzKiYqDgsc8E84qLitsgE9LYAEgh6Jw75OOYqI2wyGaFUr+/VoO0vRYoE2xksly3N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyqfrh59TBbxG98qFS7+cIPkHgVll3iyXydtSvO9f4yzQvO458
	MsR01NcFSDsELUM90JMfBCIDwiU9w5zHyOV/l7tRLXXTpYt/BEEqOevu3M0dH6b9lz4/w+fFr3q
	gqaQpIZWvyO4zr8ZLpsJUD45VntDoKCSXrngyepfstj1XuQvpUt0h+npcYAYnsq122qMh
X-Gm-Gg: ASbGnctpWP6ipjPaYqtN+u5JLYVOXyMN2ChDi+uUHgz7GH9loshL+rZjNjDZFIGoxf/
	H6aqduE9P5OPMiFXx1rb+wBJ0iIJ/UQUE9qziIFz0DpmRzSDQgXvbRvpaykN4cAJBd5J5+3brYp
	1IxT5JpHe5or+OjlxKq573KUMQrRdHkFuLXIKgHK8xRUpts9+cH2OqVw4eVvrZ5+qNZ2P83WUhK
	d6EdrEsth+guu+ZeObTAxHuTKCgZKt2mtVzczvWYAu9jIyU361QDAJpVH5teHS2xKLs6TXddEwm
	vftUr8VA8x1IeJrOejthBtcVuiPD75PkxD8/dQeFh5mqSPFdZnttmf5VWXoOgFQ3QfyD5NhdG8B
	dt6vXkcwGU+vcqb1wLEp41X7DiN+xslw=
X-Received: by 2002:a17:90b:3891:b0:32e:1c10:74b with SMTP id 98e67ed59e1d1-3342a2c1f8cmr9523587a91.4.1759125994009;
        Sun, 28 Sep 2025 23:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGyXXLDXNNpY56G4BTxgRJhzBQG7LSrpZDYZVr6MZ9x+je/GnBW8FZfmS8lXB0swFcGZjTjg==
X-Received: by 2002:a17:90b:3891:b0:32e:1c10:74b with SMTP id 98e67ed59e1d1-3342a2c1f8cmr9523562a91.4.1759125993442;
        Sun, 28 Sep 2025 23:06:33 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be2073dsm15843864a91.19.2025.09.28.23.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:06:32 -0700 (PDT)
Message-ID: <ad56ec86-0374-46d0-9962-90519fe878fc@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:06:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>
 <20250925213151.GA2455023-robh@kernel.org>
 <c13b94ed-a240-4a32-9f11-f0e323197500@oss.qualcomm.com>
 <CAL_JsqLCLy0JxPtbg5sbXux-o8aQi3a8EOs0c=VEJCePew72nw@mail.gmail.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqLCLy0JxPtbg5sbXux-o8aQi3a8EOs0c=VEJCePew72nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX6mEYkSA+e8UM
 BmRpW3/JFVvFTKvqarll2chV3pcV8I8NsD8YUOZ2hPOhRAwtHrRkesmH3kKIm9KOObHB+H4xYqf
 H5Hnl6l/qSLtivSlj53yTvNJc48H5ltSZAwXvsVtw39s/DinSDDQxlTRN2WQeIli3cYASeUycPw
 MAIsR7BAh80A0TPWyyss3JaMoEYexQqP4T0uMe7nEjaAoTw9pwAAF8Q/s4k7G3S+RWgVVRo4Buc
 Ylm3eEAWm9dWLiS783Yl+hn/eXTOoH7rB2eMZT1a+rDkZTGKvcRi0VkjaPce2EO3ft/R5Tx+FXt
 mNmJ0UYmQRaRktLl89KUznoonPJnU1xvKQh+OTQA6JeyKSgVy2snB34+wDXZys9F0wWzQi+UWTY
 lGwQy+w6RD2gftFOY8E5BdvsPphruw==
X-Proofpoint-GUID: 4fktfpCQo2PQWj_Xx88fblWMC6-70RVb
X-Proofpoint-ORIG-GUID: 4fktfpCQo2PQWj_Xx88fblWMC6-70RVb
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da21eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=psDGJMaBac8z8NPHNHIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On 9/26/2025 10:47 PM, Rob Herring wrote:
> On Fri, Sep 26, 2025 at 8:21 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/25/25 11:31 PM, Rob Herring wrote:
>>> On Thu, Sep 25, 2025 at 08:57:56AM -0500, Bjorn Andersson wrote:
>>>> On Thu, Sep 25, 2025 at 10:50:10AM +0900, Krzysztof Kozłowski wrote:
>>>>> On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>>>>
>>>>>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>>>>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>>>>>> (rev. v8) and M31 eUSB2 PHY.
>>>>>>
>>>>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 155 insertions(+)
>>>>>>
>>>>>
>>>>>
>>>>> Second try, without HTML:
>>>>>
>>>>> I really don't understand why you created such huge patchset.
>>>>
>>>> Because I looked at the logical changes that went into the big squash
>>>> that was initially planned, and requested that some of those was kept
>>>> intact - because they where independent logical changes.
>>>>
>>>>> Year
>>>>> ago, two years ago, we were discussing it already and explained that's
>>>>> just inflating the patchset without reason.
>>>>>
>>>>
>>>> We used to add things node by node and that was indeed not
>>>> comprehensible. Overall this adds features in large logical chunks, but
>>>> there are a few of the patches that could have been squashed.
>>>>
>>>>> New Soc is one logical change. Maybe two. Not 18!
>>>>
>>>> I can see your argument for one patch to introduce the soc. But two
>>>> doesn't make sense, because that incremental patch is going to be the
>>>> kitchen sink.
>>>>
>>>>>
>>>>> Not one patch per node or feature.
>>>>>
>>>>
>>>> Definitely agree that we don't want one patch for every tiny block!
>>>>
>>>>> This hides big picture, makes difficult to review everything,
>>>>> difficult to test.
>>>>
>>>> The big picture is already obscured due to the size of the content
>>>> added.
>>>>
>>>> Comparing to previous targets, I see the baseline content in 2-3
>>>> patches, and the remainder of the series being things that usually has
>>>> been scattered in many more small changes in the following weeks or
>>>> months.
>>>>
>>>> There's plenty of features in this series that are yet to be concluded
>>>> for SM8750.
>>>>
>>>>> Your patch count for LWN stats doesn't matter to
>>>>> us.
>>>>
>>>> I agree with this. That's why the QRD is 1 patch, and MTP is 4 (this I
>>>> think should be squashed to 2) - compared to 13 patches for across the
>>>> pair for SM8750 with less scope.
>>>>
>>>>>
>>>>> NAK and I'm really disappointed I have to repeat the same review .
>>>>
>>>> I'm not sure what you're disappointed in, this initial series is larger
>>>> than any we've seen before. I really like the work Jingyi has done here,
>>>> aggregating the otherwise scattered patches into one series.
>>>
>>> The QCom folks can review all this first because I don't care to review
>>> the 50+ binding (just bindings!) patches sent all at once right before
>>> the merge window.
>>
>> Unfortunately this is sort of beyond our control. We don't expect you to
>> review or apply these patches immediately.
> 
> It is *only* in your (QCom) control. I would love to have control over
> receiving patches to review, but sadly I do not.
> 
> Then you should mark them RFC at least if you know they are going into 6.18.

We can take your advice for "RFC" for next situation for this.

It would be ideal if most of these patches could make it into the 6.18
release—that is, get accepted before the merge window opens—since the
6.18 kernel is a very important version for us.

While, we fully respect the reviewers' perspective if some patches are
not yet clean or ready. In such cases, we’re prepared to put in
additional effort on our side, including backporting as needed.

> 
>> The platform announcement just happened to occur at this and not any other
>> time, and we can't just ask the entire company to shift it to better
>> accommodate the kernel release cycle..
> 
> That's exactly what we expect. Companies following the rules or
> preferences of the kernel community is exactly what is expected and
> required. Companies that continuously fail to do that result in
> requirements that all patches be first signed off by trusted kernel
> developers in those companies.
From my understanding, the community is intended to be open to all
developers—whether they contribute individually or through a company.
Imposing a strict "Signed-off-by" requirement risks excluding developers
who actively participate in this community effort.
We still strongly encourage broader participation from both individual
contributors and company-affiliated developers to foster a more open and
inclusive environment.

That said, I do agree that companies should aim to conduct thorough
internal reviews to reduce the burden on upstream maintainers and
reviewers. For large patch sets, perhaps we can consider using
"Reviewed-by" from trusted kernel developers within the company.

In fact, we did perform internal reviews before posting the Kaanapali
patches. However, we also respect the community rule that "Reviewed-by"
should only be added based on public review within the community.

Lastly, the principle of "upstream first" and submitting patches as
early as possible remains a key guideline in the current kernel
development process.

> 
> What would you have done if the timing hit in the merge window where
> you have trees which have policies of don't send new content during
> merge windows? Just going to ignore that?
> 

If some of the patches aren’t clean enough for the current review cycle
and the merge window has just opened, would it be appropriate to resend
them after the merge window closes—perhaps after October 12th?>
>> We do have an interest in sharing the work at the earliest time possible,
>> and with all the legal knots included, this is what it came down to.
>>
>> I (and many others) made an internal push to upstream any pre-requisite
>> patches that we didn't need to disclose any platform details for in
>> advance, so this patchbomb is actually somewhat reduced.. but of course
>> DT and bindings are the main course size-wise and we simply couldn't do
>> it earlier.
>>
>> Give or take 80% of the bindings will be "boring", i.e. "add compatbile"
>> or "add compatible and adjust clocks" because our hw is rather
>> standardized and the interesting changes often happen at a level beyond
>> bindings
>>
>>> One comment on commit messages though. Please explain how the h/w block
>>> is or isn't compatible with some existing platforms. Many just state the
>>> obvious "add a compatible" or such. I've yet to find what kaanapali is
>>> in relation to any other QCom chip. It may be the next SoC for the smart
>>> toaster market for all I know.
>>
>> Perhaps this would be useful to have in bindings commit messages, but
>> the cover letter of >this< series states that Kaanapali is the newly
>> announced Snapdragon 8 Elite Gen 5.
> 
> Patches should stand on their own. I'm talking about patches in other series.

We can add the soc introduction information to the each patches series's
change log and resend after merge window October 12th. Like:
Kaanapali is the newly announced Snapdragon 8 Elite Gen 5, and here is
the document link for reference [1]:
[1]https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

> 
>> The product page states at the very bottom of the spec sheet that
>> SM8850 is another name for it (although the shift to codenames
>> happened precisely to disconnect from specific SKU numbers,
>> because e.g. both SA8775P and QCS9100 are 'lemans' silicon)
> 
> Sorry, I'm not going to go read your product pages...


Feel free to let me know whether the above suggested updated statements
in the patch change log address your comments.>
> Rob
-- 
Thx and BRs,
Aiqun(Maria) Yu

