Return-Path: <linux-arm-msm+bounces-81483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CC855C53AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6F8E5346F2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142B2343D64;
	Wed, 12 Nov 2025 17:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrducnoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMCytAZF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CDB345CC6
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968304; cv=none; b=IJl1IJLOog07t1KcCWriXRhB2qb/LohGSD5T6HUeyH/iWq4Yfhp71JDyK+UcTxzeNtm/QFRHPXqZqbV3Un96xsmP8VgfJg1CB1X0CY0Kius2yBA9DUjA76DdKv5qQEfHfccOGEUuQglFjtcUBKdnyl75s9vUOdjzy3pNiI4Geeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968304; c=relaxed/simple;
	bh=igQk7IJ58jSde1RxsW+nclhIn6i3+FsoP+UNSE9F6p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyuCbD/Q6f9kFY10lFwzf88s8mre1BMYOd7cbMo07FewFltJimaS/dvFw+BXSjVTTB+X8Bo+HMTR3lDRmYYWC5GtiBPULBN4vKCoH+HKPekF3Jtt4U4+Bqx3ikQcvzYWG4v3cCdgNbLd8Xz+jp7SFiaYNXK9AfxUOtIajbsWSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrducnoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMCytAZF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACHDiEf1109209
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 17:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Km83Z8dJrIrAX1ZOXyhzLK/42gxeDh501oYlNSXd5M=; b=IrducnoRl/XHdZ1m
	nPOFuvT6IUNwXU6pESjJu8QQtWRqvRMmy0aLhekGsQX0SHH5xUQ7uK/tZ+0pmDGk
	AoRSC6L/KseWHCh7O9bbna7iVmY33VsE+SaZyzsEbWeQLE136pn0/U+V9mmsz3VE
	pBeknlq85Jipuznsr2thcQ17IQOX8FTLfp96fsgvyHkZkSqIf9d3JPxxmLTPUdmB
	DZGvaqwmWODxgJBAQh5pwWfskJ/0hd5dxkUnCDTT1IzV0LaSzAkmc4OIc0nErCxZ
	8+KGdc3KoPSTDbKXnwyGe0CLfSPf56Exkn4OiJuw+Deu35xs+miY+xSCoEY+7qWX
	DL6SNw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum1cut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 17:25:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad305681so22222761cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762968300; x=1763573100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Km83Z8dJrIrAX1ZOXyhzLK/42gxeDh501oYlNSXd5M=;
        b=fMCytAZFygBwHEujR4VNE2Y07fzTcBUnlDPwT0ZHZz5wgPPtJ6smpo+NBAWUsV4m8t
         MmjlVt4FznyeW4AGPK+zsQ3q+y+Pcvwftsjc4X0svMyaUiyflN4dr5LFhUGV4fAx/rVn
         kbsaWimeedSAOpJm38v51+ZbtpBe3HhG378So1ig+qd/orA/kA4JiAKIW0rXm57fdHcO
         JZm34/ZPA8c6J4CuCRzQ4/NRFvZIQDMOMJm2PcuuUv5sohBVyGW7bbZEHy8R9dmc0nZ4
         yvKSG/rF1eMtXhCMngbe/YSG2SY1kW8/baJYD6Bbn6TP2mFXAPbB1qtXsgpeH5gfDD6G
         tdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968300; x=1763573100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Km83Z8dJrIrAX1ZOXyhzLK/42gxeDh501oYlNSXd5M=;
        b=XvflrVJktPDKmey4exYpIWZDLeh7aC7i7pQmyeqlq0zdZSQrEdTxGlRNdoTx/4rAyU
         otbsaElF8znve5l95mE2O7gb3jsPVi7g0AAee/tq6hEEF8PTe0mR32uh3/J/hpAaJYCW
         YUlrHg8GO2QiVOfr3oxrwZDMKXj6KqIdRfSrRsBhzi3SgmDSEWtRl5N/ghjc2Lf0SSjE
         Et63+ECPq563CvgCZt9y55IMVkgw39dN5dZo5TsYO4xFiridnNXzWO8Wmck8srC5fpDX
         VTMhgAf6jRxsVEeThc5zsrXfr/yBrYKGtUADCv5S7sVjMFxvpQ9qAEKT2pbbDBOGT0Ub
         p6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUs63t1Pq147eUCpBNNmkdanIK2QEMtpH87W0g4PkVXDyQn7qrJfH4qcuL40ahRzIdk5D1qm0yT1a7pGsCA@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNuFH0sN8BqXMLKm6gSNqRVJ3DMDx9ZgPggHvyxxTRY+0Aaad
	Gsx5obXWIAjUoVjrGkFTagf+NX+CzhF+39DRDn5p8N17IMOCa5MTyT7MUQom9rTK4CdG0Z5d6Uq
	tkQkslZrK/B2yDjcLEE5bb86IEyksXVyC1DGpW6jJiGhdBcGjaVkA05qwYoXNrHK+E7ey
X-Gm-Gg: ASbGncsqnM7Q9jW1j3NiRlEuO4cW2PXW39kjTGtyDWDu1RZP73udvhaNQ1Rr0oMNSsi
	Yo6nckI/bKfbEAeBGEtNNkJ4LQ/zYK/1iYi3xJksT5V5bDRNF5nL/Bu2A68i4YW0UE1R3eLN6Pw
	NV+3duI264xEKmO/rCC3xyjfpnDpKr/T4yg9zmRWdDXiZqnqmeePHfJVFvLgZ89xdnNWqfuBaqn
	Bi3lejWAWUEVMt/gY+E/wCTgK9Y6zujwZomA7qvuPBkSwC6V+yPak49zcMhhCfS90CR4eibP7Rx
	mHF6+6H8V5VONRLqBDONubQzzs40z1iDLRUTUuH3tgcCfeSM5T/AHvsB5OHdNCxqdmz2PhvYVKG
	uzNhzQGQMo7CCEBmxPaeA/mrGqg==
X-Received: by 2002:a05:622a:28a:b0:4ed:213c:1582 with SMTP id d75a77b69052e-4eddbc4df56mr45383511cf.7.1762968300157;
        Wed, 12 Nov 2025 09:25:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/HxFt1aiBzX4O5TfxsQW2cuwzf8525wYzeQqUTuGj+dwhgfdPm+309s2XwH34HG9G30yWJA==
X-Received: by 2002:a05:622a:28a:b0:4ed:213c:1582 with SMTP id d75a77b69052e-4eddbc4df56mr45383201cf.7.1762968299645;
        Wed, 12 Nov 2025 09:24:59 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4778bcfa2e9sm798635e9.12.2025.11.12.09.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:24:59 -0800 (PST)
Message-ID: <db5dca8a-d5ef-4182-9ccf-52b2bb56a2d1@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 17:24:57 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-6-9eeb08cab9dc@linaro.org>
 <1c7d62f5-1816-4ecf-9376-2751ec06830b@gmail.com>
 <DE6VXJQPNX0Z.1LE0XW9T5T1LR@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DE6VXJQPNX0Z.1LE0XW9T5T1LR@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0MCBTYWx0ZWRfX40/g79KCeH9L
 wnqF1X8Epz3+ZKXB4xtvx4bvLvHyvP4SxqBPqWnBLqSvyD1Mzc5ZX0ntujGhMJZ5Mwnu3MGqZLu
 NspkEz6p3eIgWvkLcKCTMW9l6uGTwG+UhYrGtcluHcTOFU47xHFBdpgzocIuImkxMovwXE8uphN
 5Gc1mcmqYRbq21dCU9YPa9bz0WLqTpIOON3FsQ9J4cHQNcWqtedehRUmVtukLng8f/uMjidvL11
 NULIAX9h5730jQzyKAT3bQI9gbf8XTmRKtTJ1T13mlj417yET8gdoTLO0YokCkt0Grm2idjO4DQ
 4+JOpD9/UZDnn68Q59lCJzard2vGcmccjuj62gKJaw2rCZvfnV6PYRk85tiVmu7hNGZm76yPqDw
 GMsEZIf+LCLDnUn+h+QWdePDhLsUQQ==
X-Proofpoint-GUID: sWYL-a1Z4bMxE0t_mG3_Hz2c6YXw98fZ
X-Proofpoint-ORIG-GUID: sWYL-a1Z4bMxE0t_mG3_Hz2c6YXw98fZ
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=6914c2ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8-6JEL_qhUNu0U2AKIkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120140



On 11/12/25 5:16 PM, Alexey Klimov wrote:
> Hello Srini,
> 
> On Thu May 29, 2025 at 11:05 AM BST, Srinivas Kandagatla wrote:
>>
>> On 5/22/25 6:40 PM, Alexey Klimov wrote:
>>> Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
>>> family of amplifiers. Such amplifiers are primarily interfaced with
>>> SoundWire but they also support analog mode which is configurable by
>>> setting one of the pins to high/low. In such case the WSA881X amplifier
>>> is configurable only using i2c.
>>>
>>> To have stereo two WSA881X amplifiers are required but mono
>>> configurations are also possible.
> 
> [...]
> 
>>> --- /dev/null
>>> +++ b/sound/soc/codecs/wsa881x-i2c.c
> 
> [..]
> 
>>> +struct reg_default wsa881x_ana_reg_defaults[] = {
>>
>> This does not make sense.
>>
>> All the regmaps should be same, it should not change with the change in
>> interface from SWD to I2C.
>>
>> Could you calrify this before we start reviewing rest of the driver.
> 
> It was sent initially in nov 2024 I guess and that one was v3. v2 was
> sent in December 2024.
> 
> I am currently reimplementing this. I obviously agree that registers
> are the same but why we should be 100% sure that regs defaults
> should be the same if the mode is different?
> 
Am not sure why the hw reset codec register defaults would be different
for each interface.
There might be some additional interface block registers which could be
missing in the original list, but the codec registers should be same.

> Or do you suggest/expect that, for instance, analog defaults should be
> kinds applied on top of common (swd) default values?

Codec + interface specific
is what i was thinking of.

--srini

> 
> 
> [....]
> (The rest of original email was sent and quoted but I did not
> see any comments there, so I removed it but if I missed smth there
> please let me know)
> 
> Thanks,
> Alexey
> 


