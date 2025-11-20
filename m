Return-Path: <linux-arm-msm+bounces-82700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE39C75288
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7ACA4ED7E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6243624C3;
	Thu, 20 Nov 2025 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSk1CVqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjSDBbix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC83624B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653012; cv=none; b=QfM3bE48wS4iSf4rBkfprlam+mnwxmjkIyaD/Q0Jnc7NrhLe9sY23vc0UXrdCMvf4RRQDV8uN6fsvZ+XydW9mfTpEmWG5GeMaIqPiwi0jBGpGPfB/vkWi7z45qnOZ5onRqEDia8gcknRbCJTOPVW7C14F+vCLsFJtPiHcXeea7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653012; c=relaxed/simple;
	bh=1ql/UuDa5J03nIlCEaKKpRNUsWWo0A2ZXV1rArNVUrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7XYDiQP9KfUOUTruHvuMicPcZZCoxd/5Jfk96OyAeUFC7sI2QJzfDyoB5a/vWHmoj/7sBkgkJ7Jtw/Pkf17KlLEXl56gxTX3gPMQ3m43svk5LT/NyRndhHpe8sOQzv9WKJFBaDwdnI43/ZLxJx9whH+VAuq0GrLIHAuf7cT+Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSk1CVqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjSDBbix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKBurdk3543772
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e5mg+zvyUutw7UK0He3cdlBatNPtFBXUZumgkMxwM08=; b=fSk1CVqv037tFUj/
	VFpZc0eF4j5CV9ylPDSR7tB9pi6ooYmcO+kByxxi8lrx+PUC1TWCcysMc99qEKgP
	kG3QP8gUoGZLS4MfCcoyzCvh/86JC/HxEtL9dUkxP7X7pOsRLVFqo0jpOnLtQ58J
	KVMYXdEr2oc/2x/7PAqFcO9mRZMqC8UjjgibvPe+jWJ6O3ZpIMpt1cSznZFcXEoN
	IzjHMwaJ2qU9yByCCFpxv7fy8Z3D3Bj9YRb4cEJUaXsAZypBf7UzOvjjREU5hTFH
	G8DGzVWENfXM5SM7UIaTs8KrTXBUwsjrxlPClvaSBhITeFTAW9iz0YdXDkqQ/ie3
	cUSKuw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t3xba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:36:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so3569901cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763653009; x=1764257809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5mg+zvyUutw7UK0He3cdlBatNPtFBXUZumgkMxwM08=;
        b=gjSDBbixlJE+DkRoAU0RU9OKWzBfsppln2fnYU7opdXx9BSsFC56b+1LNE6sl/MOny
         4Gv7k7fyQKzntPrrEpmXjJM2YU4XxmMe8DTFsj6jcANtqxruHVT4EmJOd05coRtcj0pc
         EqS8LrloebHynDyipJL1kPnTNwSvi6F1ed8HX/OeNVNVLpCrB9rjucWkcKoLLSLdQjVJ
         KWzu61/drMOI9v+M3c+u0SSAceJSSOjSG+lsKAy9CNCAQHB7KZLHrH5V+Z4dgnnzo11E
         qWnzFqc2qc2r6bN4ULbuCbhADdeAV0IMOpi6ljCmKH/xkVlfVxVfsNrpVU4jq94SRiq0
         +tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763653009; x=1764257809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5mg+zvyUutw7UK0He3cdlBatNPtFBXUZumgkMxwM08=;
        b=DP9vMJq0gHoUVWuL5BzdFhvRBdRpKtB+2h5CCy3tcU4YLC7oZslg8fk94KqZ023jbx
         XLVLc7Ce56x8lwsWXrWNvPdWfplF6leJjR4aDKDW+fRm/xE5OH6tuHQfC9wiuaQyRjor
         YIzW+x+U8lJpHVf21lHFT98lrVYRZJgY9ai+BQB/uS6eoU2V+LoUuvBYXSajAkWUFqii
         EcPc39SMF2l+grGq0TizOZ6jbrDHm6FH0vfxnbbLF5FVxNr+kYWNfs8Ki0LUMuC8/Enn
         L/EBVa6KYtNH8rn40cIvzGDAGxUeZ/ojxkXwj8M683/LSF3AmXUPYHLu5VenGMXyxYso
         6jHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPdYyrp7UDn4IdBG2p2i+fbbFFeJ/OW+rtNdmyXc7Y76ALhQhwuPff8X3YZLC4MhNGZHuRIU0iccgihTds@vger.kernel.org
X-Gm-Message-State: AOJu0YxJj883/TnfmZVg4QehTsr8d3vX06A3qTzbdvNS6dFM6TgJ0xlW
	7mlQHbcq1YMMKlOrbR344AfeeE6X+Hd4HAaIKRZG1XpjimxaQ1WJSqdGleILBaUityyIQOlJobz
	LdZPrMm/S0TB0SftBtGJejnCnxoE9hESrnJ3QrPsSx8Wd5iw6T8FIkTRTk0ef+KEnTqoO
X-Gm-Gg: ASbGncvMM7RASLep2uabe3G6AdB8FEf8ZIwv5Kj5K7IUK77231Vj48I5h3wc3X82xpJ
	dchlzgNqX23a3TX3Zv0C15FWVlO3xJXBlBb5HroeETAva10wf0Urs8q+UB+di+7vC50vPZDvNhZ
	mfJEAAqdUG0e8tKKq4l1sBIdJ43rrsKgsOzUB4FQm6RbQYbjJkPPD4IfhQ7Uix2UJELCHy5fHpm
	RQzwTPQbxUf97zKElHmT8mQCpMd1VZ8pRBaj684PRf2/kLLufQC1sUPIoGTuwQX/G4jVrk2PyHE
	IuI4rfSWdhKchw/01cP70qQMmFsULf/yGwJb/s/FLyv5GGKzDVRF9oA1NGtOeKOqHGZxJNrunf+
	WWP5Pq1m8YKmZQ3/SYuyDNrBNILsDnNLqxUF0ITxDmUy4Zs6PF5myN+qBJzvIZ42RB/Y=
X-Received: by 2002:ac8:598d:0:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee4972fffamr31809751cf.8.1763653008655;
        Thu, 20 Nov 2025 07:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnOTH8PO0trW0TWGHubhIETfCFdojXrEbc5Euw4j3mVrbNZgE0HWns168CycpWGBdRJs3oIw==
X-Received: by 2002:ac8:598d:0:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee4972fffamr31809301cf.8.1763653008144;
        Thu, 20 Nov 2025 07:36:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6453642d267sm2272412a12.22.2025.11.20.07.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 07:36:47 -0800 (PST)
Message-ID: <57bab427-d8fd-490d-88f6-358b79367ed1@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 16:36:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Maud Spierings <maud_spierings@hotmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
 <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
 <PR3P189MB102003218DCCE87EEB69A0E4E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PR3P189MB102003218DCCE87EEB69A0E4E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691f3591 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=jBJ5OEMDLcug7rvSSDIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 89790Gyky9dcDuIIODPZE_6IM2zUCxp-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMyBTYWx0ZWRfXznET40b1X/3w
 yUQEM/TrJc89Naxry+AzT5nTuv2I6VnuA4VO4VhuE89pV7WlWcICSOawAmMj4xgW8ketYoUS+oP
 NySnCcK44zXa74BRogpedzbvgnEMooVlTOznWVXihKEcRfJnaM8KQcAXxgUvulyXE7LY2+yqICr
 DvfvBVxCh16UP7IEX1xXvgUBlgsqSYyRD3Pr1OGI/iH8VJg/PLoJiwl8GRwnu0fj6k5fY/K3O6c
 n/oR06yms6sPim3mRb4hL0+Q2JGMGZhn4L1Qs91bmbZEwwvjv3yYpZuos/9zj+RdBPwSRHnnnV9
 JNaM9pHeEwnIqOw98IU23u1caXETs4di+M27M2b+iO0DHcI/ef8O/oRUO6i8XufEHnH9Q6NwIXu
 8rx9B+nG/i4sVFbLe/uOwfxdgjHBRA==
X-Proofpoint-ORIG-GUID: 89790Gyky9dcDuIIODPZE_6IM2zUCxp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200103

On 11/17/25 4:44 PM, Maud Spierings wrote:
> On 11/17/25 16:35, Konrad Dybcio wrote:
>> On 11/17/25 3:13 PM, Maud Spierings wrote:
>>> Hi Konrad,
>>>
>>> On 11/17/25 13:59, Konrad Dybcio wrote:
>>>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>>>
>>>>> Add nvmem cells for getting charge control thresholds if they have
>>>>> been set previously.
>>>>>
>>>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>>>> ---
>>>>
>>>> Have you verified that e.g.
>>>>
>>>> connecting the charger
>>>> setting the charge threshold
>>>> rebooting to windows
>>>> rebooting to windows once more for good measure
>>>> rebooting to linux
>>>>
>>>> still has the settings persist?
>>>
>>> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.
>>
>> Hm, I wonder if Windows/UEFI overwrites these values or whether they're
>> used by something else..
>>
>> Can you set a threshold in windows and see if Linux can read back that
>> data?
> 
> the values in /sys/class/power_supply/jada-jada/ are zero when rebooting from Windows into Linux after enabling charge limitting in the Asus application.
> 
> I remember my old vivobook (x86) also forgot its settings each boot, but given the nvmem cells that should not be happing here I guess. It is odd that there seems to be no collision between Windows and Linux. Maybe the Windows mechanism is doing the old trick of writing it in there every boot?

Odd indeed.. Does it work if you reboot from Linux to Linux?

Konrad

