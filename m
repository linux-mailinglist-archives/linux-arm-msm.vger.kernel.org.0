Return-Path: <linux-arm-msm+bounces-83051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0475C8037C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 12:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89DCD3A188E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721871D5174;
	Mon, 24 Nov 2025 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVKkwr6R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRQxEsUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B059726059D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763984034; cv=none; b=Ihhfg56E5WFKC/asOO3EEJupUns9sjawAwdmBbFHhuM3cSLRUb6Y0VMprW1fC1Oa29h2YEq6IZoiPfHkIiNIBDErzrNtWV06F5phNyykkp52aSJo6aJFiZ+OfRI3pDNxzS4dld9q2Y14cnFg59BAt1cnjGh0lArNXpkxc+9Ufi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763984034; c=relaxed/simple;
	bh=4pEMp5qq0x/FDxCYM6BCobjZwbZu48rRSBfgkjagGC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqHgLB0AhMZtQiB82pd8t2IsGAcw1ohCrkNhkaaHwdLc3SI6oM8BPNoLtOSaifgFYMz2E5/4Gi+OqA66F7U6U1R56xKJ858z+71AWQJ8ppRNS4iwHQpM+jZ/xwYQ+30j1cnF+K7moMorWAHLp0ETDR1ybKTa+QqaT4WhS7yICnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVKkwr6R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRQxEsUj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO80Xqm2427270
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eM6O+3vF3+wrKyJRs/qI7N15qxA0YJ8evo83XuY2Y9g=; b=ZVKkwr6RjfW0aJpX
	3n42381hFY4iQ2FIki06lfx6IaYp/bHxCOS7rmLi1F/Mp0ZcwPFGPTeCzJjUK/or
	eaJiwaZlFqjaxTkPtbOQ1vgvA8BAnBV/9qTxVVKEqQ3l1pwhNkpRcaoT+7W+XAEQ
	8Q2wXMF4ypF7cvggWpBpFOQI9QgbJyaiIyTmY0HqEis8r9d+HHHQNvu28uyqFR/w
	/IQidG+FdNvBUBJ6LLSZiMXDK98sDJvv7fkssixa3Bsj8dAbam4pw6TTet5ZCjRZ
	5x/HvwrkqE5Lio7GIENs8KcAv0fWiHtmLWZPz3VOefwIFyWH91TCdcvLCj82uRFE
	5f288A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ffctkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:33:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed83a05863so16915411cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 03:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763984031; x=1764588831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eM6O+3vF3+wrKyJRs/qI7N15qxA0YJ8evo83XuY2Y9g=;
        b=FRQxEsUjtzndvpP5m+z2XPSQZD1fYwmCydyyCQUvD3XZseDzl7+Lo3jLDk/8VbHsC9
         S6HMEL1kxJh3L2LSR1RxbkypDyFSOw5f6nyUtN6L6iiUfRyMMUhxVGP2Vn1/UM6j/2yC
         cj1eLdar81NQZKC17Rh80zcKnu8lDVWvt5UTlV571wx8K/elVzzGDBCjQqSP+N5pyceK
         9Y1eM48H0wRgWknEqfp5JY3PmT3K5lpTcAjWKNvJBZ6b5rNkXLcOD2k8Sq6ziQzg2T8Q
         +NLYmpLuHtcZSIUOvaI/Xv7DWM3U4wF/7IAJA+zUlIns3nxlneuE1n9xt7CXivCMmkgD
         CP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763984031; x=1764588831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eM6O+3vF3+wrKyJRs/qI7N15qxA0YJ8evo83XuY2Y9g=;
        b=eNpP4F49WkKXzA8Q45VqY+7bP1gsgW89HHb4Syb5hL4/O0czq+FpLVlvs7D9ijH/BI
         15Q9/Hnt0Slw+PTmZ8teLI54nW+muygxNPQvqMlXNQRf/IxQZrXdOyVgjGqIBxgL+HtC
         rdG8Yw0AY00uIs4gaHeC+AdjOljkBlt4e3ubkHro2744+U5aOq7IKiMa6vJXjFcsafcS
         26kbeYZMf0MDeWBDbCm/RsVGIfxywAGdP3ZPPvfUMihuR/sH6RCJ00qPqXeA3fJiBONS
         aRyO6iJ64LKFQKVwgCZquyYu5KgTpRXkQLH5lk97JY9qvhIEW+ZyUP98FMB4KkZgEGrw
         QoTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHXvpfczXvc+OK1UFBgtkJBWvD55e4wqCtmE4yl3YPSSoy/ptO+alldmgQOTJxjdt+d2Buvh+GssmgnyOh@vger.kernel.org
X-Gm-Message-State: AOJu0YzcnBtvdSprvAo3RSulXVGF68hMs9bcgcb6Y213cayy1NaN5Icy
	BMdfaIEvyPAQVa97ppXgwK0nNNRBKyVA2v4ao4pIhSNhqONqN6FbIseXxKavusWBl5ZRkH6tSed
	jXvSmfq4WlosqbArTERMy+fL9bIwgLGBeN1qnw7yINIBk81X86aSZmrmVj0+P289gbUzv
X-Gm-Gg: ASbGncva22HD4axKAFwNC2/3N47FHOktM2TUy/ylJ1A63wbsEQj+9Eib/iR86J+CaRn
	4uD5eNFnzBDszn4KNKvv1MKNbLmdRaSrLQR0rg+LbOJeA4fXPq23rTR9dPoJTNKXK7RbSlLKyel
	VkbyaaqX0xO/0YrFuxIKdjp4/MRdJiLafGDaQN0wwWs2qVGvHmWlF4Ug3uZwJDG0Olr7TV0nv9L
	TvAQmRp0ZIgl5w57PEtDnAl/+Z8NeliR7VqJ/IGRzkIPagZiaGyKBovRDd08akoKtTLAuthFdBB
	ZoxoUFvU4woacMKxrjJL5Cc6spuFZGdu2ICqdzgZiNJZiLm5GUDGoay5SpwQXnFqPxXVSwLp0bL
	CuzvqKMykwCGPn5DOdzSU/Rkaracf/xYUxxQTfKf839jF7na1E4GETSeYEO4pcEADXAw=
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr116888371cf.2.1763984030832;
        Mon, 24 Nov 2025 03:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbZdMYQtSbABkwF9unrpnseE6Um66/JBffyT1QXzWsedmgYIyvoX4SmvZnITrSAW/3BDjHaQ==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr116888081cf.2.1763984030346;
        Mon, 24 Nov 2025 03:33:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d3bf64sm1251702166b.16.2025.11.24.03.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:33:49 -0800 (PST)
Message-ID: <5dc2f787-56f7-44ca-89b2-754a0c46a1dd@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:33:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <238adfbb-3773-4318-93d3-b23697aa4b18@oss.qualcomm.com>
 <20251124064558.aaartbglgvcj7w5r@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124064558.aaartbglgvcj7w5r@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9J78zHu-sn7ZPqZFMgaR1Qm-yUTtN8Wt
X-Proofpoint-ORIG-GUID: 9J78zHu-sn7ZPqZFMgaR1Qm-yUTtN8Wt
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=6924429f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=V2s36H0OMS-e-j4Qe80A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwMiBTYWx0ZWRfXzzuOKuij4Wkv
 Op0iU3dtzHFBxjoDbK7vaYi1Nt6MTxGouVgJTqepiY1yEidKUzd0MZ53SxYh15FF83SjvYCAP7Y
 On57HzT1LqmLqQMrOBzfOQUwAVxVMjpZOtytFk+yjKv4mzQ6oBafC3rg3UTJseHrHF3nQZQgfOm
 //4Tt1czMVlDvA2wg3aLZs3+IxKRMuWD++S96lqAX2l39GNb9L9CEzAX2PjrBqW7YM5Q6AoQseV
 myOF5rMFhPxZb6HPEa2/iK/qDVxNOPje1O8yP76tu+EBIXQ4ys4RNosVJpyRu0eNRYIq/zzKbky
 h2qrKuvXANq8IYBVCRIEJsy7K+ACxxUol40n4EnxjdGIEqdfqqqhDDMbhk2VU8wlg6Esk+3eKXC
 vHWj7WlAfH3Iyn0WbA8LAfGKzrfm2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240102

On 11/24/25 7:45 AM, Mukesh Ojha wrote:
> On Fri, Nov 21, 2025 at 04:08:36PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 12:37 PM, Mukesh Ojha wrote:
>>> On Fri, Nov 21, 2025 at 11:27:57AM +0000, Bryan O'Donoghue wrote:
>>>> On 21/11/2025 11:01, Mukesh Ojha wrote:
>>>>> In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
>>>>> related to Secure PAS remoteproc enablement when Linux is running at EL2
>>>>> for Qualcomm SoCs.
>>>>>
>>>>> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
>>>>>
>>>>> Below, is the summary of the discussion.
>>>>>
>>>>> Qualcomm is working to enable remote processors on the SA8775p SoC with
>>>>> a Linux host running at EL2. In doing so, it has encountered several
>>>>> challenges related to how the remoteproc framework is handled when Linux
>>>>> runs at EL1.
>>>>>
>>>>> One of the main challenges arises from differences in how IOMMU
>>>>> translation is currently managed on SoCs running the Qualcomm EL2
>>>>> hypervisor (QHEE), where IOMMU translation for any device is entirely
>>>>> owned by the hypervisor. Additionally, the firmware for remote
>>>>> processors does not contain a resource table, which would typically
>>>>> include the necessary IOMMU configuration settings.
>>>>>
>>>>> Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
>>>>> Authentication Service (PAS) from TrustZone (TZ) firmware to securely
>>>>> authenticate and reset remote processors via a single SMC call,
>>>>> _auth_and_reset_. This call is first trapped by QHEE, which then invokes
>>>>> TZ for authentication. Once authentication is complete, the call returns
>>>>> to QHEE, which sets up the IOMMU translation scheme for the remote
>>>>> processors and subsequently brings them out of reset. The design of the
>>>>> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
>>>>> is not permitted to configure IOMMU translation for remote processors,
>>>>> and only a single-stage translation is configured.
>>>>>
>>>>> To make the remote processor bring-up (PAS) sequence
>>>>> hypervisor-independent, the auth_and_reset SMC call is now handled
>>>>> entirely by TZ. However, the issue of IOMMU configuration remains
>>>>> unresolved, for example a scenario, when KVM host at EL2 has no
>>>>> knowledge of the remote processors’ IOMMU settings.  This is being
>>>>> addressed by overlaying the IOMMU properties when the SoC runs a Linux
>>>>> host at EL2. SMC call is being provided from the TrustZone firmware to
>>>>> retrieve the resource table for a given subsystem.
>>>>>
>>>>> There are also remote processors such as those for video, camera, and
>>>>> graphics that do not use the remoteproc framework to manage their
>>>>> lifecycle. Instead, they rely on the Qualcomm PAS service to
>>>>> authenticate their firmware. These processors also need to be brought
>>>>> out of reset when Linux is running at EL2. The client drivers for these
>>>>> processors use the MDT loader function to load and authenticate
>>>>> firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
>>>>> to retrieve the resource table, create a shared memory bridge
>>>>> (shmbridge), and map the resources before bringing the processors out of
>>>>> reset.
>>>>>
>>>>> It is based on next-20251120 and tested on SA8775p which is now called
>>>>> Lemans IOT platform and does not addresses DMA problem discussed at
>>>>> [1] which is future scope of the series.
>>>>>
>>>>> Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
>>>>>   - Addressed suggestion from Stephen which was regarding commit message(9/14),
>>>>>     debug log(12/14) suggestion, and return type change(4/14).
>>>>>   - Added R-b tag on 10/14 .
>>>> Sorry.
>>>>
>>>> Did we actually come up with a cogent reason to omit the video firmware
>>>> loading here ?
>>>>
>>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>>>> getting video stuff done and storing up trouble.
>>>>
>>>> What exactly is the blockage - is it something you want help with ?
>>>
>>> I replied to you here[1] and given my reason..till something concluded on
>>> "multi-cell IOMMU[2]", I can not add video and block what is working
>>> already.
>>>
>>> [1]
>>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-hyd.qualcomm.com/
>>>
>>> [2]
>>> https://lore.kernel.org/lkml/cover.1762235099.git.charan.kalla@oss.qualcomm.com/
>>
>> I see that the following files call qcom_scm_pas_auth_.*():
>>
>> drivers/firmware/qcom/qcom_scm.c
>> drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> drivers/media/platform/qcom/iris/iris_firmware.c
>> drivers/media/platform/qcom/venus/firmware.c
>> drivers/net/ipa/ipa_main.c
>> drivers/net/wireless/ath/ath12k/ahb.c
>> drivers/remoteproc/qcom_q6v5_pas.c
>> drivers/remoteproc/qcom_wcnss.c
>>
>> iris is difficult, rproc is done, adreno doesn't need it..
>>
>> would ath12k_ahb or IPA be affected by this series as well?
> 
> Yes, they would be affected, and the modem as well, when Linux is
> running at EL2. However, I do not see them present in any of the QLi and
> targeted compute SoCs at the moment. Therefore, our firmware does not
> support it yet.

Hamoa's little brother should have ath12k_ahb.. and I assume IPA is
present on at least some platforms where there's a modem (QCM6490?)

Konrad

