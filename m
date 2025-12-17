Return-Path: <linux-arm-msm+bounces-85521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D7CC81B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B23630487ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941CE2D77E6;
	Wed, 17 Dec 2025 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzh2k3zn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuRrxJ1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4F217659
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979232; cv=none; b=NyO5WC67hnfHCM83jBUEypXSg1RGF3gMmzKF0bLN8SDzHgRK53Vxhl8ynYsnOJMeSxu1tz1IEon4REyh9vpIz+UrBTuv+Z5G3L/Jzi3ESmHXK1/gmPJ4FvU1B/zKe0G+ZfBv1tQADYWoutS7Wa+A4ShJGeRz1LEWKIBkmAPyLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979232; c=relaxed/simple;
	bh=XHRK6oiNyQLxnri+lSe0epDvnCOah2uyq5F2o8shLoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1mLaHatTLDFce/cbOoZ1/4Ffz7M5wfwSVY9LEYl8xzF5et8CqtGTh8BjtBE/y8fAF4LvXIJoTI02PS4M9sf2/SDxDWxhyyl75nAmYB8amJkgKFbRRmDgarZEIF7ZYX0XvgclTcEg86/SrGMAjjQ15pavlZcZERtsm3on3tlRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzh2k3zn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuRrxJ1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL7ml2684331
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d9FX+/Wf03q1qhwepAn7WlbeBYeFfLurb32y+eKwQM=; b=jzh2k3znqP9djxlI
	vKgtceqFIjsPUYPcOS7XJN4xgGfOWMyHIaeWVBqVqmanwpNy09tGDZMMA435Px4n
	KOPItPI2EDubxDbMiuu1RnasloNKja3Fb9Lk0Pe0qJNQqMU/WItTCenJ5sJvDfP+
	Zzj/sL+EmFUlDYcDaFhMhLiwV9qITWWBuUfh4G/IjcCrgVY+hWF+1PJvbTPA2r81
	KOOsknC9xAZMsQFcYMpLmfmVaxJFFZWTZi52t17es+vO0KhXy+xHcgN/4bfhMeA3
	XSLp+f7R9CyP/fSLt7UhbB9LC2BUzksyY7p+4y1zrN1AxNwAYYkj2Uw+C4mxbQSf
	ynTm8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkesyhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:47:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34b9ab702so3113591cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765979229; x=1766584029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2d9FX+/Wf03q1qhwepAn7WlbeBYeFfLurb32y+eKwQM=;
        b=LuRrxJ1laRXzvYPDWWUjBq8gH8uNqycwyfPw5QP6CVP6+kF/4nt5JaR7Amggb8D3D/
         cwIWoRYtHwwpUaVYKlJfJwt6T9uRcf24QhLSLaVQog8Oj4jYDivA3MY0x6yT4vFcuM9E
         LQUUwLHftA03wef8rcONQGMccjqvVIenFhp8labgKyFG7qPGzaBboOwne9duZQRvimtG
         L9JPbuqdWlYoYGjmhYQFzBnwh3TWizTyDHe0T/I4kbjaWxZYeV9CSqJ0A9oQOjrX0uev
         ZIl/RbSTLRjRr8ncfH4s002XFe0JyFnmb5HWTuw5629kVhhxJcL8HQN/xZ5vugdieiuY
         qg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979229; x=1766584029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d9FX+/Wf03q1qhwepAn7WlbeBYeFfLurb32y+eKwQM=;
        b=eh11aavRi98lNwVfyXFjJ3+Q7s2P8fQSm2Y7DdvxBhWHrdmRecyicwiXBGKDqxa1UU
         rDRGz51PoaYpi8b75U8w86kOTlUE9V+UYZmUCRjrlkAHZ0B2uSUSx48hFuQiVviveqFF
         q40w2axllmoluRTNz2NoFx14xSRTAFsT/RD0BbAzTWEBhny/bOV4kIuRaPouSFbWP9A1
         Zfh9p7Zxs7mNn03Ti8yB8+MqO2JH+ofzVuOXYIWaWgF6l+k4KFPSO7PPCMLj2m3rR1he
         /rT8Uz9ox/kFq/g1LyyrK+u2kKVrsptW16lRry2ya5cyyCUMGLnAeqQ+L13hR1/8qtox
         mBig==
X-Forwarded-Encrypted: i=1; AJvYcCUC+65APQZ4NIgV6hetfYrF8yn1+r3wOvRXDyfSB+s+kzilGg7e6cwHWL7d6WzKz2EfHRdu47O2o+6h259W@vger.kernel.org
X-Gm-Message-State: AOJu0YwDko2dLHE+MmCJX/EBE1Xv2Wjk7z/Se50JeifT7IpMxCrL9tOK
	fWSFAmoDpT5KVKM9b0UIZdMLzIbcRUaiR32F0P2fcFNJeXx2BKC3XLpceFcUit6GLkk2JTpqzRz
	5xPFABtVR1f+zc7+ItYkK3ceLJhh1xIFgUnZZ/WMdAxj4H+Mc7U7npHHXLAym/4qe0aE0
X-Gm-Gg: AY/fxX7NN2ejFciRWAwdG0n5r7pB3dyUfybEMt7q7Uu3UmhNzbVcaksWna/+nOcfYzL
	ZEnuY1DJhQ8DVLG8tX8OKYEePtkERmCu6QK70e02c5ngf77ObLCA0pwIyFED0xUo49+gFYd74fc
	N5MlOEA18VqwwceACGFF+ecqjSYaO4LT+cUpwI8UvWgKYQy+A0UId900BjbMwTkr5jbvXb9U7Nt
	VPylvUfdWZ6/YvfY9QSmOVcL2KL4E2vzozwg9iDDTDmmpW2ikJA1zkTnEXuK6xamXyHtx671/eD
	F6+F1HDoiI9a6kSghilz9Ih+66kMRHAUGif05ieF0V57fd7h9hibdYq5mSFcCVkZu1OEGGJEZvV
	Q8Nu9mSjeOgbaqCh03lH98WgGhzO4jFCzBw7oCbWhgqkzMz0wTe8xV5MJmu24GzVlCA==
X-Received: by 2002:ac8:53d6:0:b0:4f1:d266:a4e0 with SMTP id d75a77b69052e-4f1d266a5b4mr137571441cf.0.1765979228876;
        Wed, 17 Dec 2025 05:47:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPztR1so6DLGlwKzIMTznpmDe+7THT8T5lREj8mPE65dHt0GrBzo70Mb55k4d3AKOhU3Twng==
X-Received: by 2002:ac8:53d6:0:b0:4f1:d266:a4e0 with SMTP id d75a77b69052e-4f1d266a5b4mr137571081cf.0.1765979228297;
        Wed, 17 Dec 2025 05:47:08 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f519571sm2485336a12.15.2025.12.17.05.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:47:07 -0800 (PST)
Message-ID: <7a0db353-02f7-4188-b2d7-9098548f1920@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:47:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com>
 <20251121-enable-ufs-ice-clock-scaling-v2-1-66cb72998041@oss.qualcomm.com>
 <c04cd051-b6d0-4d98-ac2d-4fc7ffcb4301@oss.qualcomm.com>
 <aTZzD6ujz0+mZD7j@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aTZzD6ujz0+mZD7j@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwNyBTYWx0ZWRfX7NwDIZKKAdHs
 bTH/+yk5m8B+5o8HkavSom9EkPyn2S/SQ5dbsm72OGr1jllPILohGTGkXW+BelpUP9CoEaFO9N4
 GwJxcU6AYZV5CnbZIia7WQGPiqZoo4XH517lR1QIrRQ5hKAQO0lqFIEcB1sLuRno0Fak0kgYkg+
 Arr+ssRUvKHtPJXBI1tpEBIg/a9LDWVGibzH9VSkNirWgEBkqDOrS4MHgaOfZpQmbqeimZ++HOj
 xyaRku8STWpZ6bE16/OBizPztsNlovf4vYLn+WBHKA5elsrNyBQjFJkAsRzmNtrYTONCOeMhIOP
 xXdImuPBuU/7S5UxkzwplCr3fIzFR+uwv1CAvpng0yTzY9g5fyT2ry6JXpROl0BYfMA11PB/fqp
 IzyJlpu4tT6AVR7FflxYVWwa6B3NOw==
X-Proofpoint-GUID: -T_ZBdcs02r9Yyro6QIS7_QLY_LSMErp
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=6942b45d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cnpu5S7Q13yOoTCDBJMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -T_ZBdcs02r9Yyro6QIS7_QLY_LSMErp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170107

On 12/8/25 7:41 AM, Abhinaba Rakshit wrote:
> On Fri, Nov 21, 2025 at 02:46:52PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 11:36 AM, Abhinaba Rakshit wrote:
>>> Register optional operation-points-v2 table for ICE device
>>> and aquire its minimum and maximum frequency during ICE
>>> device probe.
>>>
>>> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
>>> core clock if valid (non-zero) frequencies are obtained from
>>> OPP-table. Zero min and max (default values) frequencies depicts
>>> clock scaling is disabled.
>>>
>>> When an ICE-device specific OPP table is available, use the PM OPP
>>> framework to manage frequency scaling and maintain proper power-domain
>>> constraints. For legacy targets without an ICE-device specific OPP table,
>>> fall back to the standard clock framework APIs to set the frequency.
>>
>> You can still set a frequency through OPP APIs if the table is empty
>> (and one is always created even if devm_pm_opp_of_add_table() fails)
>>
> 
> We observed that when devm_pm_opp_of_add_table() returns -ENODEV (indicating
> that no OPP table is defined in the devicetree), subsequent calls to APIs
> like dev_pm_opp_set_rate() fail because the device does not have an OPP table
> registered. As a result, the clock rate cannot be set using OPP-based helpers.
> 
> Here is an dmesg ice driver logs for lemans device without opp-table defined in its devicetree.
> sh-5.2# dmesg | grep qcom-ice
> [    7.316366] qcom-ice 87c8000.crypto: dev_pm_opp_set_rate: device's opp table doesn't exist
> [    7.325596] qcom-ice 87c8000.crypto: Failed boosting the ICE clk to TURBO
> [    7.333288] qcom-ice 87c8000.crypto: _find_key: OPP table not found (-19)
> [    7.340968] qcom-ice 87c8000.crypto: Unable to find ICE core clock min freq
> [    7.348832] qcom-ice 87c8000.crypto: _find_key: OPP table not found (-19)
> [    7.356510] qcom-ice 87c8000.crypto: Unable to find ICE core clock max freq
> [    7.364377] qcom-ice 87c8000.crypto: Found QC Inline Crypto Engine (ICE) v3.2.0
> [    7.372594] qcom-ice 87c8000.crypto: QC ICE HWKM (Hardware Key Manager) version = 1

Hm, perhaps I missed something..

> Additionally, on legacy targets where ICE does not exist as a separate device,
> the OPP table is managed through the storage subsystem. In such cases, using
> OPP APIs directly for ICE would not be appropriate because the OPP table may
> also control other clocks, leading to unintended side effects.

This is a more convincing argument. But it also pushes me towards
the opinion that it may not be worth supporting the older one on the grounds
of the description being bogus..

> 
>> [...]
>>
>>>  	/*
>>>  	 * Legacy DT binding uses different clk names for each consumer,
>>> -	 * so lets try those first. If none of those are a match, it means
>>> -	 * the we only have one clock and it is part of the dedicated DT node.
>>> -	 * Also, enable the clock before we check what HW version the driver
>>> -	 * supports.
>>> +	 * so lets try those first. Also get its corresponding clock index.
>>> +	 */
>>
>> I would argue *not* setting the rate on targets utilizing a binding without
>> an OPP table for the ICE is probably a smart thing to do, because we may
>> brownout the SoC this way
> 
> Understand the concern here.
> However, our approach is to scale the ICE clock only when the storage subsystem scales
> its own clocks. Since the storage driver already manages the associated power domain
> and voltage adjustments (even for targets without opp-table for ICE) —which are shared
> with ICE—this ensures that any frequency changes occur in a safe context. As a result,
> the risk of a SoC brownout condition should be effectively mitigated.

Can you guarantee that this can be taken for granted for every SoC we've
ever released?

Konrad

