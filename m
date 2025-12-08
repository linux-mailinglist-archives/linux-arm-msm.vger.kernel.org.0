Return-Path: <linux-arm-msm+bounces-84652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44580CACEA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 11:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C924300AD8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 10:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC622D94B2;
	Mon,  8 Dec 2025 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGmmjmC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNUQbYmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D32D7DF1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191005; cv=none; b=EmhEAchgvn13MBUB8l0PfvdVbgk/hiKIlvG4UbfaZzNdSs8BY9mYJkb7v7s2dKmVOCxwjEQw7wZzgaYsvPaWH+pp86Cxk0zQcjTTEEyaXJa37KPjJiUWcs2RLliv6kWrmyiO0InKaOasSKC6x5RxAiVH/NTacILHQtVRC3s9nlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191005; c=relaxed/simple;
	bh=MmwKI0dfI0/9sKZQ7ExcfwjAUrch8FDscecj4VmcIzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=na4OZhsCPHof1HHlcU4BWTGSPmGHE/YFgLD5IOekP2bHPozbu2yc/trunFcOVUOYZR9NX48ckThN4RMWDI8QSR2fmNIjLUSvKHGevbTLUd3PuphOTZk4v7G+PXR8cwsB9RVS1QeLDvNldSaomirCX900B4QxuoEjwiyAaSsSfgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGmmjmC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNUQbYmJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B89F8Nh3863010
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 10:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujOrAVj7xpofqe5sT4a2YafdzRvSd0wCy4FOowjtYZE=; b=MGmmjmC8Ab0c8n+d
	BUyBPDbRocVcwuJaQ/TN4hJ8lVHoOQqwYCHItBzbRGY4AvarOO+Hd9JSCgXpTkFY
	9b+raXgM/P+Bn6sbYMoAkddOB/n+Ett7327HKXnVTZPp5b84NiV+GYJpZq6YGk1F
	QWLgyKATcblP7E5raQAIz0poF9KRftWL3gZ7jhJA8J8qaikWr8qYKDtAXP6ceBMW
	ym3YMAN8JnqKJOuptS2xNoTs2D3Ygz/ODYf+xlodG9BMjpO41B0DsGLhx7gQwGKS
	dokViLaYoi5ewG8b7I1HXq8L4kmmgXdOX1RJGVyxEYo8jOC1RzQNrPeLbiFO8qnB
	0WZfvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuvg094k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 10:50:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956a694b47so17773875ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 02:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765191002; x=1765795802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujOrAVj7xpofqe5sT4a2YafdzRvSd0wCy4FOowjtYZE=;
        b=PNUQbYmJHmCCVf5vzcKcVOb0Ek7NUCgDPqlwal5oNMEWU5UkpUl0XJjBNC/YlfUGpt
         IrrVfnhX/6AIQsmJggbbsbRCVIjfEQG59pbcnhzEdLvxdlYJ81LXcPVFHOg/lbbpJZ8r
         DttY/qhvEGrDjHz1iOhqJXEGNQTc4ziw9ojL0PZ3wuI0PY6a3pFU4gpFnLkzOoYdpDyG
         9DcnR8I5XeRYhe61ykl0Kz0g1iaIgg4F/UW62lMj663SVFfIxFYrUMaXe+yce3InbluM
         94cmHKAxQE+OuBSmIM6fIWvZuf0Zs7SV9tsCkDo79EyeYEyt/b6zZmE4j3xHkmlxyG8A
         omHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765191002; x=1765795802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujOrAVj7xpofqe5sT4a2YafdzRvSd0wCy4FOowjtYZE=;
        b=qdgdvnWCKbJMUtBkAI4a8eO0DFbRQq7EuG0ICP0jxot5kCfimg+RoYjvI72VOq75pF
         e4Qpc7Z8J17WcPtPL2Zmbsf1EfkDwhLCWYdTf1vcYZwSAAiEXjEfbvFCXQM6rSl2OpRb
         QBKwUuFiZfFNkmjnfO7hxJYrDHz45veqowIApE+zcAU9TpahbEmhMNAwro5XE/rUnQ1G
         DAcGld9b/d/6/NrviU4BQYZ1UYKcYty3jhvJpbjuUHKhHJpGJNI9uevquq+CbIa6+X4X
         LfLKg3wewcJNTxq+Wamp2dz9YAM27UAudih/sehiI8Gh6km2e6T3NM/9u7W0kFot7Sal
         XkHA==
X-Gm-Message-State: AOJu0Yw/gf7CuCIABqYZYFxptOeHewegE928+4itLCPwY1FmTK3hKuec
	U359Qnp/qSI8J4arPedsWvhc+2JoHyZvemoxCLSZQr8FnFee5JvvkomLyT3W3Z+6up0bXg9Q+y9
	tSOlokagQAM7rtXa7qvlka0j+A9moAIXV2JgtOFE7PylqAJxfqPinpk/DNnGzHR6Kphxo
X-Gm-Gg: ASbGncv/Ja4TrjyywkSQFj9l6BFxISA+4/NsgWT8JS3F2i1JB26HODaiztLyEAGeZkY
	ONkCyHmUZWRvOVijk5wUA9V6PzKO4j+0rdsaT3XnRqFIdR+vqAlE4r4QLZyCSfJu9uBHJ/DKMaU
	ySpy0q77Z9LooqzRzCVCLjLm4/gsB9CtKkNA35ZZlRY59eImJRHXOxc+t8OtGwh/Q/vBz4ObMPT
	vzIPS0iwsASMGix020QXY46EmS7dtEpfSDqBWKXe2WWvyJnWfroGLdlUozxJlh64rYDnGZqFL49
	vbTCTIBtEyYZXyWBpDdmxIJp7cOR7BAdafV7rTaZlVg/wN2oY9eIHXpHmuGF7Ixedh3FDLapqFz
	wXhsF7OgfesVYHxCPIf1tLtTqmrG0L6pzVUp2Can9
X-Received: by 2002:a17:903:196d:b0:295:5668:2f26 with SMTP id d9443c01a7336-29df6311348mr67569145ad.46.1765191002249;
        Mon, 08 Dec 2025 02:50:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFly3q41atOK9g2Od3Y0EUCaedULHM+82Pw7hLaKvU0uHfKmbC4sxFPzMaQge8d0q3NRemrA==
X-Received: by 2002:a17:903:196d:b0:295:5668:2f26 with SMTP id d9443c01a7336-29df6311348mr67568895ad.46.1765191001738;
        Mon, 08 Dec 2025 02:50:01 -0800 (PST)
Received: from [10.217.218.62] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c8a0sm121146155ad.3.2025.12.08.02.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:50:01 -0800 (PST)
Message-ID: <9937db19-de90-459f-844d-bce60abe9f7b@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 16:19:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add host mode support for
 USB1 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        andersson@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org
References: <20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com>
 <ffd6dc9a-372d-4db9-9c2e-92f126cb5ebe@oss.qualcomm.com>
 <49ecd190-1aee-42d9-9e6b-c155170aa38b@oss.qualcomm.com>
 <638f4184-b582-4a48-ad63-7c1fd2db492f@oss.qualcomm.com>
Content-Language: en-US
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
In-Reply-To: <638f4184-b582-4a48-ad63-7c1fd2db492f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA5MCBTYWx0ZWRfXxfyaxeStDrZe
 6oXWcgt5ZAYoxkpBph3QcZszwWPtVsqO6XbrlGqMZA9OcVTekJBKL4dj5eUs6fAPADQMp4HSZ80
 Iz7y5XMbH0vP1r7FyOwqUCo5HY8CmHLBci+P8Tqwd1PaYGFAG2MWe97v3foH/WvS6Iylp4cZrFO
 PVxHVMbqyJ0CXNSxKm2I+YS0ii5MZbSevlBLslMQ6spCdJwH70Aluf1wiPMceZdbCAxd1JUiyc1
 qPuZ+n3MpCBO8TvrefKbW4RpVI59zCCFJPcFW1qx6OMaQpxwZBMYUW7Nq9jGS741isCln8gjftA
 d/amq4/Osk3WEgNz5bNcthWdb+MiSv4E9k0vPIi7wpb7SpTqcy+pn8S+0PbRzYdbkVmV7WWIaLV
 FUsZDcS2MxGQxefK79WOEScQ6wCWVQ==
X-Proofpoint-ORIG-GUID: m0H2aq8LopF0GoTlJFNFSg3_wW2B21g6
X-Authority-Analysis: v=2.4 cv=cqSWUl4i c=1 sm=1 tr=0 ts=6936ad5b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FdhxupDzWI1NN_ro-woA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: m0H2aq8LopF0GoTlJFNFSg3_wW2B21g6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080090

Hi,


On 12/3/2025 5:17 PM, Konrad Dybcio wrote:
> On 12/3/25 12:41 PM, Krishna Kurapati wrote:
>>
>>
>> On 12/3/2025 4:59 PM, Konrad Dybcio wrote:
>>> On 12/3/25 3:42 AM, Swati Agarwal wrote:
>>>> Enable Host mode support for USB1 controller on EVK Platform.
>>>>
>>>> For secondary USB Typec port, there is a genesys USB HUB sitting in between
>>>> SOC and HD3SS3220 Type-C port controller and SS lines run from the SoC
>>>> through the hub to the Port controller. Mark the second USB controller as
>>>> host only capable.
>>>>
>>>> Added HD3SS3220 Type-C port controller along with Type-c connector for
>>>> controlling vbus supply.
>>>>
>>>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +                hd3ss3220_47_in_ep: endpoint {
>>>
>>> How about rename the other one to hd3ss3220_0 and name this one hd3ss322_1?
>>> _47 doesn't really tell us anything and may re-appear if there's another
>>> instance of this IC on another I2C bus

Thanks Konrad and Dmitry for the review.
For addressing this renaming for USB0 controller, shall i keep a separate patch and should i address in same DT patch for USB1?>>>
>>
>> ACK. Can we rename them as "usb-typec_1" and "usb_typec_2" ?
>> Krzysztof suggested to use generic names and hence we used "usb-typec" instead of hd3ss3220.
> 
> The generic names rule only applies to node names (text before '@'),
> the labels are generally only expected to "make overall sense", I think
> 
>>>> +&usb_1 {
>>>> +    dr_mode = "host";
>>>
>>> The connector states it's a dual-role data and power device. Is there any
>>> reason to keep this in host-only mode?
>>>
>>
>> As mentioned in commit text, there is a onboard hub sitting between SoC and the HD3SS3220 port controller. Hence device mode can't be used. This was the reason we left the above port nodes empty since we can't connect them to port nodes of controller.
> 
> It would have helped if I had paid more attention to that message then..
> 
>> Can we mark the connector as host only and remove the empty endpoints ? Would that we sufficient ?
> 
> The connector should definitely be marked host-only, but the endpoints should
> still reflect the physical connectivity.
> 
> If I understood your case properly, this is analogous to what &usb2_2_dwc3
> does in arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts - see Commit
> c02716951e66 ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing for
> second USB connector")

For adding, onboard hub which is GL3590 in DT, it requires adding SS hub bindings in genesys,gl850g.yaml.
My plan is to first submit the binding patch and then follow up with this DT patch on top of it.

Regards,
Swati> 
> Konrad


