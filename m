Return-Path: <linux-arm-msm+bounces-78863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF375C0CB7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848C7189C2C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EF32ECD26;
	Mon, 27 Oct 2025 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3rDCtgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1C25486D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557993; cv=none; b=jgICDpG2u1912fgOskZPCFWu+dOJZFKiZnM8LjBoS+Vgmfhghg/E8Ls3aISm64w3u7Pqvby1R/pM/YwXh2eiarx2e1m+pU6zBq7H5FciKhiYnuiwjWzh4odNWrPpufqSHLCaS/PhkMrWITzlsh/rr8UITKfNfBBYSYz/D357M30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557993; c=relaxed/simple;
	bh=x1eD3ypa++GUosEHlVEkZWWY+H02Ulxoavh+j44FobY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7da152ZT7qfner8X9/k3nYyQKD6GjOrvi7OpIk8LSydJqULX2QFOt0UPfcxQVdwNxzzIscgbv/1aA5qUPgXC4eiYEpuKG0ZBdbE62XAiFQoNlm7/GYEQyfOrbQN61N9ciXzGJbfWh80NhIfl0KhP6mP3fQ00BhkbuXZJhRI6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3rDCtgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8iRr41150866
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVAVXiaS4C13gqYVelUdXFWxcm+/koQPUdSKUxZiA6A=; b=I3rDCtgiflVBvHbB
	Erv2tHcJhv6eohVk9B/o3ceyWQ65tobjixiVDydWwPN9zxWTVLzWGx7e+PfnNi7L
	yGOkudkojJaq0dyKh8YLiywWi4BouuvQNQKLxleLEq9QWjJ8A2942ABsCBSkw3wb
	4EromqbCUCectdJfR9BYPEpEjm9pc2PNzAsm4IEHfqWjIj+WhqFswQBeHjd4KXZk
	Chp9pkF4OggBdv51B/tAoC1DwUrCZ/zazYD+tB0LQBOUUCKQKImHVDngxOjY1vIa
	OD4J4ijvhoBNvexaw5siXL32M+3tfNdB858ryH8qmtl5MDY3/yK1jftGTSkQBbf/
	iCe1vA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb45cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 09:39:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7f5798303b3so11305236d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 02:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557990; x=1762162790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVAVXiaS4C13gqYVelUdXFWxcm+/koQPUdSKUxZiA6A=;
        b=xS861hrdc2y9y1bqQT9ndiVTU7jtlcu2wenUtO3cY8eyx0JNtFg/bhF6EZ286kPiS8
         nCXCMjg2oacRDLjTzPWoFc/N0dFWmOzMAJzowAftCcAf2Mupq6Cs3YF8anTdemyEK1//
         2uogAQzPD3GkS+7hY+Xwc5t0xsd3O59gzO5ZSqUVsDYQbFbqPyldI/2tenapmGYnEyqm
         H1Ic6w9nwKK2AlQVDVC+gi+xhp5zpOZBXHsRM0iFkCBBZH0ao1IU8LYvD5JQCir0bhST
         pzkghMRzaoqORuzR6ETYUuT+sPqhY1kkK3JOaNk5+AMnUe4bqENq5ypzJmr0p0fkh0oG
         zyVw==
X-Forwarded-Encrypted: i=1; AJvYcCWtf5qO60nx/UVKe1Aqdw7DqmOBrRv3OIbSmPRgE2WHKg1LoLqiXvddf88rnR9GihEGqqFIOdEn0WzunuUp@vger.kernel.org
X-Gm-Message-State: AOJu0YzvNiIpJuzpPlFG1Yu7VawkA0I3fPLDlqcvFuW04XI0u+Rcfq3+
	oUbKa9kyyscyLnppdyfGvwywRBhVWrU5e+7ZBPxYQvJTF9NU5RVImPkvG2QFb3lxi4gfe1XU7aN
	FedKqdl84NBEyAujXGpMDSdGvd9L/o2ggtYNz4tR6fZQPUk+s5mOi28AJLkxUnrB8Sn4x
X-Gm-Gg: ASbGnctX9VxNi59qSPlxXi62LQOiyVoAx7MMsmN1azUqaOZF1+godIjBwybi0OOaJAa
	GKOw1M6fW8qERdmFoaFUKBddr/qfdpT7+djNvGDEgItb6k5+yLg3RgUjkvmsivgKtjlsPpxwn+E
	Ceb8CGZOyUwmSBHD1jeQ2ggLjOeQ1yVdWdLOHIfHYFlVMrqQSDM5poVqMYyjqJv7m1ykNsxycig
	OCnLKhEGrreCfyka2WKvZ/b0uxEKJzPJw6SlxVlc9CFskW9+Ad3pAq20xxBVXZPY6gDJCaN4R7f
	yhltJu/iS7NPebicT97dWHaNLiMzWYFaUmuv68TJhzPx0uPFr6dOzmvT3i2tdRpTqS98ENeJZwE
	owdoVLkgozSAIQfGrSRi3xXe5vXIUt+wHX1sxUuXG4BjlAP3QSA5TM8WO
X-Received: by 2002:a05:6214:e81:b0:774:48fb:f8f2 with SMTP id 6a1803df08f44-87c203fb3d2mr368209116d6.0.1761557989744;
        Mon, 27 Oct 2025 02:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWDSJxUDsPEoWFtPajh4ycK198jqS4IRbSmuor1SlO4PT+6cmA3eOaA2PlmjRmDBty3f0ldw==
X-Received: by 2002:a05:6214:e81:b0:774:48fb:f8f2 with SMTP id 6a1803df08f44-87c203fb3d2mr368208986d6.0.1761557989318;
        Mon, 27 Oct 2025 02:39:49 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6da1e2226fsm315808366b.20.2025.10.27.02.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:39:48 -0700 (PDT)
Message-ID: <5ee14d04-c908-445b-a8fc-ec07af267f7f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 10:39:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] arm64: dts: qcom: kaanapali-mtp: Add audio support
 (WSA8845, WCD9395, DMIC)
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPfY-CpE_aKd910PQ2+u9ux2EvuVEt9ArzhdVCJcTQJUQQ@mail.gmail.com>
 <51637d37-aa5e-492a-851c-e5d6bfbe421e@oss.qualcomm.com>
 <43ba93bd-0dba-415b-8a7e-cdc4d954f79d@kernel.org>
 <392d2e9a-dc31-4916-ab8a-680b2ec4dca5@oss.qualcomm.com>
 <19639c5e-7aa8-4e75-812d-93d805802cd3@kernel.org>
 <7ef31348-78ca-4abc-9eaf-5041e2e6be82@oss.qualcomm.com>
 <37b1c3e3-5a33-4d6c-b053-525bfd0583da@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <37b1c3e3-5a33-4d6c-b053-525bfd0583da@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UlDTrT3kdjILTc4d3ECD1TWsS2B37z46
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4OSBTYWx0ZWRfXzF6Z/C+HmQde
 QvB5/Ky4mJXbp3M7H5sIfRUqw4Sq5pscQwJPxCztouxMDTbOwGZOCsEeWuiQgN/v7ieO0TxF6Ls
 aLO5Wa4Bhjh3ECOtNT8kNga2dfSWDMDJaSelwP84MH336BxqypGUlcUggZ/pT1ZmQ3SciezAvUQ
 8sA3kmhzJWC0WWP/t5fejUQc0MP8xjkmSuL2/DgdCZaGdV/5tsYqj+jBN86y5wzRPYglgzTZ9G3
 xl1vgRxr04Jyacr7bg5Wg7UqcLTPA5QrhNsvSjS8EsGoesa/dn9EcXGY2V62/K+iUfr0i/2b1fE
 N+KvUwgdUyl34ZKD4RMbAW2W0UOepOB2AYM9AxaonTyRM7PtuqF1o7zaXMZ+BUcsrdP5ZGbsj31
 R93SPYaWXg1mCN1kzAjzMHSWpc/WVQ==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68ff3de6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9ytmuLpv0wEfhbutQIwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: UlDTrT3kdjILTc4d3ECD1TWsS2B37z46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270089

On 10/9/25 1:50 AM, Krzysztof Kozlowski wrote:
> On 08/10/2025 20:30, Konrad Dybcio wrote:
>> On 10/8/25 12:51 PM, Krzysztof Kozlowski wrote:
>>> On 08/10/2025 19:20, Konrad Dybcio wrote:
>>>> On 10/6/25 10:48 AM, Krzysztof Kozlowski wrote:
>>>>> On 30/09/2025 21:06, Prasad Kumpatla wrote:
>>>>>>
>>>>>> On 9/25/2025 6:56 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Thu, 25 Sept 2025 at 09:18, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>>>>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Add support for audio on the Kaanapali MTP platform by introducing device
>>>>>>>> tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
>>>>>>>> microphone for capture, and sound card routing. The WCD9395 codec is add
>>>>>>>> to supply MIC-BIAS, for enabling onboard microphone capture.
>>>>>>>>
>>>>>>>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
>>>>>>>>   1 file changed, 226 insertions(+)
>>>>>>>>
>>>>>>> Audio is not a separate feature from USB.
>>>>>>
>>>>>> I didn't understand this, Could you please help me to provide more 
>>>>>> context on it?
>>>>>> Is this regarding Audio over Type-c?
>>>>>
>>>>> USB depends on ADSP, so your split of patches into separate audio commit
>>>>> is just incorrect.
>>>>
>>>> No, this is no longer the case on Kaanapali.
>>>>
>>>> PMIC_GLINK is now served by the SoCCP rproc
>>>
>>> Hm, ok.... so there is no WCD93xx USB mux anymore?
>>
>> I see there's a WCD9395 onboard which has that hw block
>>
>> I'll try to find some schematics to confirm..
> 
> I think I was checking this some time ago and design was the same as in
> SM8750 and SM8650, so with WCD9395 USB mux. You could argue that WCD9395
> WCD mux has separate interface than audio part, but it is still the same
> device, thus that is why I think USB and audio are still related.

I found a schematic for the MTP.

The WCD9395 mux is still in place

Konrad

