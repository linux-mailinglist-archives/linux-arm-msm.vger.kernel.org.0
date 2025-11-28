Return-Path: <linux-arm-msm+bounces-83716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECFC91809
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66D7B4E19A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E6F3C1F;
	Fri, 28 Nov 2025 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayk4GHCr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpPAHxGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8F22FBDF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323199; cv=none; b=KY4vsIJMO5NdjDsbDSD3zTcUKBjDknb+vneGUDBtn+pVYuqUo7cLm6dHUJpfcEkXpeaQmhc/bpD62fZaswzHvwfHgdrzhFeYuusWXq3k1pQ8gUEAHfDwX8C8+VSRdSS0eq9r7qpU92fDlpkI9kHIhQMtgWeSxbkoaYiMbyT9+os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323199; c=relaxed/simple;
	bh=7OzJaWaM5lyXpZBh6bMCU8NMZdoqoAZvFlym2Ju0qcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEj+bsvzgBMDHgqdi42XbGAW5jovrqhXpzvsyx8gsMi8fvEbbOkho0epW3Q7Ctm3Ci7AKQT+Qo033MXcuLRmoO1PZ9c67uiu2ASDW66qRkCVhIpv6tRfLOv8folUSErzTxRchZKQTysYhlHX+bveHWs037z9eIazKhwevp+8xhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayk4GHCr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpPAHxGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Ogh03627248
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpMn4VRpJDtfIU++J/SixgW+7oaCQy9UgpDukSQPW6U=; b=ayk4GHCrEHmD2++b
	FV+xg/QzFTWKQVihrrPIb8+DJZexSxJ9fSAj9NJB/vRuDN0G+rqlB1SOP39rc5aw
	AdvE7+a4rGGuVSQ4vEmETjKhEJODf+SVQZULTbXytcg2DooJ6S76H5ZY6EOXsZbi
	ZTFF6jSQ3NudeskAIJwPXmsXvLcnXTNsub2UaIQ8JFNsdzgXYFmkGRhCDWRjg5fn
	OPllAosXAaDBU/q6CYtmanGlgXbxMO2/4ekM0vhrM+uTrrrd03+etq3WTjfwsz6b
	xO9CqC/SVNf9/IeRuYD+zwiyFUj8yoo2GzzTekX187Cyu4PTAl2e5GXd/UbMy17m
	tE9R9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmyntvqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:46:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so47572085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764323195; x=1764927995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpMn4VRpJDtfIU++J/SixgW+7oaCQy9UgpDukSQPW6U=;
        b=UpPAHxGvXnUEy+Xz7x2wC0J1uzBO+AFeM1xV109gqhjUIKKtIH6e21lE8J8shhNKXv
         EQ3KYfv85XTv71r/TvM7UZYhypN3LrzlvUE6NoqLblz84HW9Wt8sqEc0d5YnRbsKCiZ7
         oM4tzBayeqXhw0s/NrSR2pc8Do0lJmOThJ3PuHGwJLCcPYQqIDbWJvipAT27ZFyejxw/
         NjSe40BX22BrEvkf4fTw5JOqNzXsxjgfiP4ka8R5rZNFavJ/DMMHFdnjKCrHg2aZR9sM
         e3VahODQtsxr9FVLP5jkctfe+GEhFliep/E4RRBdo9o+ZIRjYJ5jT/BkZarY4BDPBXWZ
         1wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764323195; x=1764927995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpMn4VRpJDtfIU++J/SixgW+7oaCQy9UgpDukSQPW6U=;
        b=YwUz8z3QkAwXwEQh+ZknpnqAEwvJ/xTZHhgO+jxp4NY3wo6uruoArO+hBtoOytsE4w
         MRk2DciKl9ROVZ1nRGyR81dYA60c9AkIcH51VSnZnop6hc4IQuvObh+4DGO4E0klL6ny
         IHZRqW0qXxrfw4eJlCF2tPVzh5eAnj29yuwgc3Wf/Cx59EHzZFteceP4LFPrnizTfR/K
         rMlIXDzVuvgVgwG68fNRFvxkqi4wWLuslvFzn7INE50p3DWFhW6L0zxLN2nXfaoEE/Io
         en17WZ230/Jb+8i2WdTbI/x3HE6FOSs8Ux1P9Vvt3IlONV81R/sgc2/7tDckp6o0Lrqd
         5UEA==
X-Forwarded-Encrypted: i=1; AJvYcCUFKO/XEj/d2DqUxG6eBJdPlieDh5mln1FqOulYjdCVzn6w8LaxIDpxWPrjHLzJojyoW2cyeQaMHJzqIxYp@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlJSz53ZdBqUdtoYsEkGkMoVnOKJHAnL5bG27XBd26wv6OJJF
	nAuMAZRXJpiUDQFNpjeCCbbLBDUb6QaYoDa407rqD7aBFaFgnVBzaIDa5XyJeJke6jE6F/6YNa3
	SvmexbJoWHfWkzXOUC9dnCDcNehIKL2YHRUsfRjitUkYEyWORFrQLv41XYTqMT849U7MN
X-Gm-Gg: ASbGnctyozTxc5f40QhiO35JtktAGxiGCEIPRpqLUXoy2SljFgeSMV8ywmja9f2MFk0
	ev6fbRO8wTOuM85Hxg9kkrSsgzToafw2FIK3GeZ8nT7+Da4tQniTN2wIQUk0xbdd+hran502zoH
	bX/voJ+x5MkOu2ZxQ6YG8ogeISS2JFYn3Q13KFENR2qIb7NZwEDVaDQ00GJYdhGfQFstv+S6DX3
	7jpYgePz60heqqaZFKAfgH0oK4ZzTRpwpeJ2Wj7KMHcVtRZLqXT0XpvbY/P8QihtmekfS2BmEbB
	h+u258NF51uhaP+8CKYkFWKJ4bHA2OcWgUBUo0BeIGKKE6oPU8se/HHgcPF2K0CGnk1Ldh9yuOl
	0j4F9ibP/sPobGEctVBbF4dkkYNjQek2t1NRiOv9pwqndkpFJuNt7gHroc2Qcfe19lL8=
X-Received: by 2002:ac8:5fd3:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ee5b768c8dmr270032021cf.8.1764323195461;
        Fri, 28 Nov 2025 01:46:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJtbIudD1ugx8e0TKffv8v8kePYm5B390qcQmgp7kOWlH47WKEdh7RV8Fmhyygqvz0mmc40Q==
X-Received: by 2002:ac8:5fd3:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4ee5b768c8dmr270031771cf.8.1764323195063;
        Fri, 28 Nov 2025 01:46:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e2b2sm412360466b.20.2025.11.28.01.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 01:46:34 -0800 (PST)
Message-ID: <75c088de-7a6b-4d24-8ca2-3fad39ca7861@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 10:46:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and
 SDR104 SD card modes
To: Val Packett <val@packett.cool>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251126012043.3764567-1-vladimir.zapolskiy@linaro.org>
 <bdf3f54d-a223-4eff-aa71-0d74a83ef46d@packett.cool>
 <3b609409-e19f-4685-848d-807a4e840ad8@oss.qualcomm.com>
 <f820c42b-4cd9-430f-a1ee-4f380dc9ca8a@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f820c42b-4cd9-430f-a1ee-4f380dc9ca8a@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xIOhu13lUBcqhqRP9F2ClqDW4R40jemw
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=69296f7c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ztM18gu7BI-AWQJq1_AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3MSBTYWx0ZWRfX2EUf/hgsCyPV
 xLVHzkgBXVzgqtY1LgfD6BMpYJeOgcP0iX5/2hAF05OjMVencyX+rwiGXaYvSNJ/L0eB/VfgMdH
 BxzCob5atNI8x3Dy7PXxqRCIXJbBLG9LO7wlSqtdQ02NwpP0BCg7u8mn+KAzk0qn/mqQjR/ReD+
 ux9jBw2ev1flanj5h88pqVB+A6Ur/C4rG/Ugr1DBk4tImvADIbvzD2AEIPCmnsgIVFVk3pfX5tR
 iossSUc/iLL/0GbhQ0PSygrWJK+OIQmUZhMBcBCXSAC9tnSIZnM5QELuWsWrvaAz86kXj90GSYd
 py7AmfXo5p6fr9ECdD7R3AjochKcenTeYO9Fhq6c9keFHishcW34PmsdWPnqI/kdrIgpPqXcJ0C
 5SryRRfQYjJXQ5+TSuD1T1pouxKYvw==
X-Proofpoint-GUID: xIOhu13lUBcqhqRP9F2ClqDW4R40jemw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280071

On 11/27/25 8:33 PM, Val Packett wrote:
> 
> On 11/27/25 10:47 AM, Konrad Dybcio wrote:
>> On 11/26/25 5:14 PM, Val Packett wrote:
>>> Hi,
>>>
>>> On 11/25/25 10:20 PM, Vladimir Zapolskiy wrote:
>>>> The reported problem of some non-working UHS-I speed modes on SM8450
>>>> originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
>>>> for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
>>>> platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
>>>> SDHCI SDR104/SDR50 on all boards").
>>>>
>>>> The tests show that the rootcause of the problem was related to an
>>>> overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
>>>> ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").
>>>>
>>>> Due to a missed setting of an appropriate SDCC clock operations in
>>>> platform GCC driver the workaround of dropping SD card speeds from UHS-I
>>>> to high speed was spread to SM8550 and SM8650 platforms, and since
>>>> the fixes in the clock controller drivers are ready [1], it should be
>>>> safe to remove the speed mode restrictions from SM8450, SM8550 and
>>>> SM8650 platforms.
>>>> [..]
>>> I see you have tested with dd on the raw block device, but have you tested hotplugging SD cards that have partition tables and filesystems on them?
>>>
>>> We have this kind of issue on Hamoa where we get I/O errors early, right after the card is inserted and the partition table / filesystem headers are being read:
>>>
>>> [  714.057106] mmc0: new UHS-I speed SDR104 SDXC card at address 0001
>>> [  714.060567] mmcblk0: mmc0:0001 EC2QT 59.6 GiB
>>> [  714.503873] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
>>> [  714.505660] Buffer I/O error on dev mmcblk0, logical block 0, async page read
>>> [  714.513632] I/O error, dev mmcblk0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
>>> [  714.516469] Buffer I/O error on dev mmcblk0, logical block 0, async page read
>>> [  714.516512]  mmcblk0: unable to read partition table
>> Before we start debugging, could you please confirm it's using the internal
>> (&sdhc_2) MMC controller, and not one connected over PCIe, like it's the
>> case on the Surface Laptop?
> Of course it is. I'm quite familiar with the DTS on this device, I pushed it over the finish line into upstream myself :)
>> Are the regulators supplying vmmc and vqmmc in high power mode?
> 
> Yes. regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>; and no allow-set-load / allowed-modes (..hm, maybe we can actually add those to save power since sdhci-msm *does* do regulator_set_load..)
> 
> But turns out this is not a consistent problem with every card!.. At least *now* one of the two Kingston Canvas Select Plus cards I have attaches perfectly every time. (Another one of those though often fails to probe with "error -84 reading general info of SD ext reg" and sometimes has an early I/O error, but exFAT mounts even after that error — but this seems like just a "microSD cards are crap" thing.)
> 
> It's the Samsung Evo Plus card that consistently has early I/O errors preventing the partition table scan from succeeding (or if that succeeds, prevents the exFAT mount). There is a *card compat* issue here for sure, as the card is not corrupted, it mounts every time on a different laptop with a PCIe card reader [1217:8621] in the same SDR104 mode. But consistently has these errors on sdhci-msm.

Would you happen to have access to a Snapdragon phone from a similar era?

Could you insert it there and see if you have any issues?

Konrad

