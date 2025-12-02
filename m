Return-Path: <linux-arm-msm+bounces-84060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87BC9B0AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 11:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6313F346C74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 10:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D28630F939;
	Tue,  2 Dec 2025 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7FBKA6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2odpmc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12B30F818
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670407; cv=none; b=Ctl2wMWPQBFiekqvSRafwr7GPP0/TPw4OxFKG9hJMcUeGbhYohUcpfbdFLwTW66+udnIoD5cqmrYHnLPncNVG0dIZ0i5laX90LhELfg+CCWKfgS9E86WmKFwNJENYYGOkKXTSIt6iWhHtHRNdBpO6cMxxzzoIH9TGTAXswV7/50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670407; c=relaxed/simple;
	bh=jkD0PgX4AYLD/tWeanomvQ7p36iUYtXramiDJGNxlqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fp601nfl/QWNQwx+hgGFkRiy81FmnuA3VXuDxSvOFcczyqFFgIl67by7zO5drpoHCWSzK78Yz+y4VX1T+qr+/+hS/grje2iyK6wJgLP4aKJsJVHdhN/Z/7tWdDC+FXuh1CUf/vLKlSZajYdqUt4YfPwJ4KYIZT+1tTEejO4196E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7FBKA6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2odpmc4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B26cEod1146909
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsmArkF89BOUHhGXQUlWFZF2aiQoOW1ZrRrGna7xdxg=; b=T7FBKA6m/ge7cXxt
	AXpuCZXKHfSJS4y+bY0aaVnQr4Fgd3vhmQcJz1p/CmJpjFtM8Obz7+j7Rgw9zI26
	DX5mhc5PDqf4bJxyKhtCxk7ToPh/sEND4h6Jt48sjxdEbBDxtcYBldwzm7Cu+Zwe
	w1gE5HFrUT/YPw/UCzOANxGS07yRASCudBSnjWsCFtpIFkFz/nQjR4wZI8bPJKKB
	K97Yeq5U9AJosGbQqGArzbtjLYi4ijvYPLyoDHj5TCeD+nEDYkHUSfLhvEMzSfyn
	w/9/d/Dxi42kzCnJLvYD2OuIofHA1ImuyiE4X6TFCJdFG9GodeE34jfnGSsbj7qj
	1GkM7A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asj5ea7w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 10:13:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso8984104b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764670404; x=1765275204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsmArkF89BOUHhGXQUlWFZF2aiQoOW1ZrRrGna7xdxg=;
        b=V2odpmc4ypMEQtQyAR1x303PwKwZwzY0Jj2E7/YyeutsNyUfAVGGLds9uZmSwCq4eC
         jrwqnS6Kxmha96p8N+VU0/C2YzynLu94czRigHOPXqDiNb2bnKyp1Ba52EUb9UBQMR4K
         jNlS65+kk4KAtdLuE3RWauQHtWvfH5aonXsSWHjIs/1ZDLhmj3VVpoclECTEFlUDEnMT
         5+C/OULPHtfaCQS61QrK2vv/XqhkdlpY4fy7nw4URXQS1Acp+gL8kd3/L3yMLtJz63b3
         q8XC72EAXLPEI7gq30mp6Vx03Eh9fcw9FGOwFXKuYeUMxGz/VAngv6egCf6gSR3uJdzE
         6Nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764670404; x=1765275204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsmArkF89BOUHhGXQUlWFZF2aiQoOW1ZrRrGna7xdxg=;
        b=xJ8qubPemC46KqN0HgN9fsBJxz5BcGNBDICJqpjFWKJPrjo8RHgCj11EPm8uLbEhnE
         IkfTfWSNiX20iOro+z8sE7XnfqsVGPEEYdmbgWKOTq/daETXL7kkMYLeezPhEH/cQ1D2
         4Ui/2zMcwFiUUGX23Cpx9KQJQZfYvt4+7FaMm9bviKkYQiHbUZPjtdfuKAqTFWrbPQ/i
         Hr379Q7ALpsefnIFmeBOwa0XRQSlJI8nNnRtFr8hxKb+kBK6iX5Gr1cKiJGOy1ccy+B3
         jF0oJEicj1hfCAC4TH8MXXREhclHA8bT7HDkAEX9IznL47UM7hkLU8I/OxEAniH+F+i9
         ZkZA==
X-Forwarded-Encrypted: i=1; AJvYcCX37A5jCXMcCoqbfBs0cFJuFFKNR+Q3RCEwCOJ5IDFGJoNbAVyZuvbboluzWLeGVSpVJ382mCFN5bnNLHP6@vger.kernel.org
X-Gm-Message-State: AOJu0YwmvhDaDlG2WKXIAV1K8fLcqQUTnr/gOTmFo5r8nx5zSSGkd0W4
	hHa6q04mxMnYhWVchTsHFecRu9hUwrhC0p+sq9Mdf815FpWZRz4Sp28MeLM7877x0n6YphC+pcB
	c9uyAoIoUB/z1PK6WdMQM9yhm889uB2X3ySkLuk9aTVd4zM6jgjfKXBdRBsbRvrbsjqIE
X-Gm-Gg: ASbGncs4t0EueJeYLZTXyd1gt1PM1QPrQyFut58qaiva/se4wSNy/8irIgHFtCTASBt
	TyL4JLUn3LP6FNsVX6Q7B6E9+BhBaJCVOoUiFNb+VtqJ6i3Yht6NhBSJZujHoUj8jGbkUSmGGb2
	jshLGYOoC9Kzt53+w70qfYD/lFPxIfFZzjcE4xGEV77CDTtSc3z2sJlhjnMyaArSLvp9ScS7HmJ
	Hu/ePC3omt0piFJWmmxJw2NxJ/xfEii6OhZXa13Zaw2RGnZJSfF+/KlzBo5ftUDvyVHKSgk4l0R
	f6g+K+twkSn0rPeT3sjtLEpcWF85P19gyjEz1vKPUqfu6wc1qtS1LZoW/l7cq7+HVpc8zgRAHVh
	dmMqXyMoRHbLuL5dn2ZZivgskj1rfKhqfdP2mC6NWMA==
X-Received: by 2002:a05:6a00:17a7:b0:7b8:383d:870e with SMTP id d2e1a72fcca58-7c58c2ab7b5mr43279795b3a.2.1764670403815;
        Tue, 02 Dec 2025 02:13:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESsZ966I0XhgbDr2ekmgjrYiAu9aQpL3u5Xnmdj7BMfBxv2ve0RBT+vHWnMSj5FtqfLf96iA==
X-Received: by 2002:a05:6a00:17a7:b0:7b8:383d:870e with SMTP id d2e1a72fcca58-7c58c2ab7b5mr43279759b3a.2.1764670403377;
        Tue, 02 Dec 2025 02:13:23 -0800 (PST)
Received: from [10.206.101.67] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fc08bd1sm16402354b3a.63.2025.12.02.02.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 02:13:22 -0800 (PST)
Message-ID: <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 15:43:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
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
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
 <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XinHDgqxJtJPQ-afF-mZN95f3PWbYjxa
X-Authority-Analysis: v=2.4 cv=GMsF0+NK c=1 sm=1 tr=0 ts=692ebbc4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Ajh8_egcEEMJNl95zMkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MSBTYWx0ZWRfX0cyTYopWfeV+
 CNmtu0ZvXBG3pE1uHGmuDoq9zJ/6C9nZVPIU6EN66r3Mlmu59OJ8Cc1FBF2XLOvGKc52TuzXu4P
 qW08KuE/Om1qQvwhlgmyhBM/yt2Y8w+pdX+D6SNgQiBYD7F0TOMWOd9fybB7QQzJn5xt8pOVBCN
 /XNplAV+Fw4/4xdwGakMYMM9VzFlAHJBdgDVDD3xQ1geA7LWuIuZY8quzOD+P7vewjDyiW2Kohn
 gbz9E3gcNy8FXzRlBaKHi6lr9/nbTdV1NxImk2LbxTS2iZlM20YHMDCCWjdd8pTfOvL+yf4m3PT
 EYFuGf1XewnQqDF93hI1VZGnT5DuS2JqiSHiHGUPD3//YsDfxSqKIOfV204GYdiDD9RkRPL1I8l
 Sxp111COIQYOLPkKT/wm+VT0Ii/oXw==
X-Proofpoint-ORIG-GUID: XinHDgqxJtJPQ-afF-mZN95f3PWbYjxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020081


On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
> On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
>> On 21/11/2025 11:37, Mukesh Ojha wrote:
>>>> Sorry.
>>>>
>>>> Did we actually come up with a cogent reason to omit the video firmware
>>>> loading here ?
>>>>
>>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>>>> getting video stuff done and storing up trouble.
>>>>
>>>> What exactly is the blockage - is it something you want help with ?
>>> I replied to you here[1] and given my reason..till something concluded on
>>> "multi-cell IOMMU[2]", I can not add video and block what is working
>>> already.
>>>
>>> [1]
>>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
>>> hyd.qualcomm.com/
>>
>> Why though ?
>>
>> You are mixing together the issue of multiple SIDs and the original loading
>> of firmware which could easily reuse the venus method of
>>
>> &iris {
>> 	video-firmware {
>> 		iommus = <&apss_smmu hex>;
>> 	};
>> };
> 
> I completely understand what you are saying, and it would be very easy
> for me to do that if it gets accepted. However, I doubt that the people
> who raised this concern would agree with the approach.
> 
> I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
> banks separately. I’ll leave this to @Vikas to answer.

Not exactly as a separate sub-node, but i do like the idea of 
introducing a simple iommu property, something like this, which Stephan 
proposed earlier in the discussion [1]

firmware-iommus = <&apps_smmu ...>;

I understand that we are doing the iommu-map thing, but a property 
exclusively for firmware like above look much simpler to me.

Dmitry/ Bryan/ Krzysztof if you are good with this, we can bring back 
video in this series. Please share your thoughts on this.

Regards,
Vikash

[1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/

> 
> Also, I do not want the video PIL discussion to be part of this series, as it could
> unnecessarily give the impression that this series depends on it.
> 
>>
>> That binding got dropped because it was unused in Iris.
>>
>> https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/
>>
>> I still fail to see why we are waiting for multi-cell IOMMU to land, when it
>> is expected to and what the VPU enablement story is upstream in the
>> meantime.
>>
>> Blocked it seems.
> 
> No, it is ongoing, there will be next version coming.
> 
>>
>> ---
>> bod
> 


