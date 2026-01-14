Return-Path: <linux-arm-msm+bounces-88985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC2D1DB0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23CD43025712
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBDE3816E0;
	Wed, 14 Jan 2026 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQ8P5KQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcaFIMfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529B34EF04
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384047; cv=none; b=rW+9EH9wrMv35s7bEPWGJL31Mxt400ohpZ6re73Lh9pZo/nD/UrQ1W8HOcC0rd5qxP8St2f0S96a+nzscjRMFyV8C1KWTrePa20ZDz5cHNUDINQUX/ceuNBsoOiFhkBYeoQRPry4TwAuwUDLDC92nP9n12UpAYE4gLI9GUaklQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384047; c=relaxed/simple;
	bh=1H71ql9A0jfornXBpw2ODC7HdqJ5XqT2KE8qRlC4Aiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXiuRhUvR5lUPWeG6jW3J63lb+p9x71PyzqDh9cKOTW+xCItwqu1wvVKy5Z3kkK4II9+YQZCb2SxF1UF4hkRFFhEOzrdTlESg/XI+t23iu2MR8pteK7mc8T2OdjpwmWe4ennm0dBbfFQS6M8Y3L24RdoBahugvJLRri5KrqW5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQ8P5KQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcaFIMfZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E85nwx1942995
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99BKTGBFsYNDyPjzQ1FB6HexYu4nx2zw91fFccvYOwQ=; b=VQ8P5KQeWsq5fNOC
	TRWqDvbdtCbpsAzfxnMut/vPb/l+nSLKR6WOTToy0IFDo98LFWyUNwcPo8kzW6wS
	LL0BQEZ1akEvSAtagp92liu7K4xlxbU1XyETsQ5iMBif1+R3mvFanJE72JudTKLc
	Pm8edtiVHZoeuNihBf7fS+BUuku+yd3z5YhBciiI79qk8/EXXjAgSmzD/yXBSccC
	3+5z7EJYsVK/7aQg3qJ3dzljXHdCliUBs4nC2x0UO1wBapTtFu9w34Ou2SCimCjC
	t4y0vgVigADWtqcakC9o7RP+pJgpKV7XjYJwdzHI68vi+Oy5fQUU9LkfSrGExli8
	LmL8Nw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6rcf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:47:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso26983431cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768384044; x=1768988844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99BKTGBFsYNDyPjzQ1FB6HexYu4nx2zw91fFccvYOwQ=;
        b=PcaFIMfZDw2ECLFgdzjjETCsIG0B5vITHxyn1t4pGZPESU/cfJyYdT6EHF4RYxuxh8
         wNoFhDlRR4kJ7KYjnGKhlnEeuO5ZjIvsZv5L/Z0TgXp0UW/twOHtqCwI8ZzYUC4I1Rc4
         LrC4WlUucnRAWCEeDhxXMJuxPGyXv1MRFGuUM953ZRi/GbT6CpUGkXCafNYhLH27xHyQ
         M6XCWvN5dxczqx3rdtYx9s5TL+1ls4tl1C+xsM1S8B+ETBDeLWKHmQEySiffp6FAuuYc
         Jb9dMPXEWlH/ZOilzOq9P9vZ2xhcMMPjRTHzTeMFtwnNV2+/G6xbrGMDh4piBshblr36
         0SRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384044; x=1768988844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99BKTGBFsYNDyPjzQ1FB6HexYu4nx2zw91fFccvYOwQ=;
        b=KEGw1mNxsDo3+NAS0wmRTgfGx51lgYUx0X8ZztIPxyQE1UEPzexxUtmSCzPF9g9efV
         E+eybxkW163tIt+gZ8kGWy7sjke4ZGtU7yOOBXD4j1WTl1051rjUMQhQQraBzEV5XwX2
         ePLTPZryPI9WRnpQ01AV3fX5hSyut+uHdtdPnPWqwI2hFSvKZjB5+8hvOrXsKQCRCKXv
         2WThbv7FLyzYX3ecmvnKFyXzLHrYYepmcUX2HIrf4fH8VLyqQxmLfDdtpr5rr4A3dda8
         /x5WKgSBjHgBETLEaosYkCsYwhWAoS8VMM/ogdf7dSJ+X89A/2nvWFAOsIWkbJcMgzfv
         7HAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOUBh6cla7GLbcCWrNOXFOQfbKHQJqHYspx/ZlCWXYH7vtwUDo3h6UPcH+vD/HuZoRmD4yoRklKGi2IRzg@vger.kernel.org
X-Gm-Message-State: AOJu0YxmzO8Yy6YFeN1pxv/FCS7z6WUPKiksKgMh2CHsWmF4Lp64dXIS
	WGqGf+pN6+rWePxXhBzwB1ck2V8gIreRilH2G77iOCaB4SocJKIAN2k9QHPn7jCUed83N2w6h9s
	dAWbFOHAVK6pwrqEmFxB48z4njeGRpx8nQzNqbZowVlJ/Wv95zhqdXwG//d28jeHoXvcC
X-Gm-Gg: AY/fxX5Ip8UztTrewkoorNxafJtgLFLFCDEkodM8zWf/8n7HP+rqPf7etdSpPvOQFIP
	aSXZFywYrdQXQOwWygJGxJSgTcHFBRy9P757cB+fhUnkvwJHpplwBHmy8Jn+Q7h7eOpjqXZBgjz
	FSEC7lZ9wlGlCkj8L20dk318iJKAxeXIUUmtWD9sHGK11H0fbNU0sJaR4n53oZM7F+9wv1Jg/Aa
	6+quO8O/JnJMpZKnGe2a7M9xB7JJAvpJ+17QlVdwhJ0EK1QErBI6t0X0ZGsd1QLZwrEH8e+qYbg
	28i+kQomUFcPCGSwJXkhoeSV4lvfXTAs4tEZA9KbVuy7B3a1bYxAKNUHgy0rnx51fHdORMljex1
	O7LTsGp13r23SW+xlmmAK3nEHI/mxGFCrH5yBVntHbStBQty6JnEMKYYeB2Gw09yYwM8=
X-Received: by 2002:ac8:5a95:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-501484c9737mr17815391cf.8.1768384044493;
        Wed, 14 Jan 2026 01:47:24 -0800 (PST)
X-Received: by 2002:ac8:5a95:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-501484c9737mr17815141cf.8.1768384044059;
        Wed, 14 Jan 2026 01:47:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6648fsm22238117a12.28.2026.01.14.01.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:47:23 -0800 (PST)
Message-ID: <ae46b504-58d3-4042-be05-f31e9e01091b@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:47:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
        andy@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        srini@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
        sre@kernel.org, sboyd@kernel.org, krzk@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
        melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
        ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
        luca.weiss@fairphone.com, mitltlatltl@gmail.com,
        krishna.kurapati@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
        kernel@collabora.com
References: <20260114083957.9945-1-angelogioacchino.delregno@collabora.com>
 <20260114083957.9945-6-angelogioacchino.delregno@collabora.com>
 <aWdaWY2tWUMllOHH@smile.fi.intel.com>
 <8bf79979-0946-4ed9-b8d4-c442a6e54833@collabora.com>
 <aWdbPze-f_2_5EbL@smile.fi.intel.com>
 <401c5e7b-ff33-44e8-98a5-8cc6af4f2a87@collabora.com>
 <aWdcy2ouQHtkPd6q@smile.fi.intel.com>
 <647b4acc-3310-4329-ac7a-77e86bab74a3@collabora.com>
 <aWdk-RP-59cJeCBo@smile.fi.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aWdk-RP-59cJeCBo@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LGrburgdJKbQsD4VQwOTP15zM1HyKh21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OSBTYWx0ZWRfX6kNToWkjG1fA
 X+NtMKKO/LEKYs3R4RA/DHCN3h7QUVKBH/HY5nECK5NSTQvZKT+pN044yy6ymEbMSpkOX3CmaGV
 Wk+0gK5oYfcZZSnX7kgthTvOPVSZF5ntLk+f/xf2ZqocBqbzOQdodIslsrsa8kAOBg/D9z6QVfr
 tZ1k18WvOGalhPZeyshuqpmg4EZJQrHqbJydyIOyUf5NDLOVbOWPpW9ng5mSsDTKCC9tx7wiCk6
 6TrVlVGSIZnPKwlegACzObiLclK3TdMWeubGeMRSnJpdxvL8YCfL4mgVa7YzEpv5/FXzqFhqZyq
 j43yeefMCgyy3vCnsajgCnmsWGOs93sR/5QHNr+GcxN9JVF+IqK4kkcVVwWJ7iLxu8GCptxfklt
 Coz+0nZzUFaXZkaujR6iB7kNd8A5TWA54v0cYP5LbyOGANi1feiONm27f2y3TKANDjpmVzPJw69
 1obAgH2RupJrFSjlqrg==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6967662d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JqKDa6lEAYI_ZU06WeAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: LGrburgdJKbQsD4VQwOTP15zM1HyKh21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140079

On 1/14/26 10:42 AM, Andy Shevchenko wrote:
> On Wed, Jan 14, 2026 at 10:09:45AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 14/01/26 10:07, Andy Shevchenko ha scritto:
>>> On Wed, Jan 14, 2026 at 10:03:57AM +0100, AngeloGioacchino Del Regno wrote:
>>>> Il 14/01/26 10:00, Andy Shevchenko ha scritto:
>>>>> On Wed, Jan 14, 2026 at 09:59:40AM +0100, AngeloGioacchino Del Regno wrote:
>>>>>> Il 14/01/26 09:56, Andy Shevchenko ha scritto:
>>>>>>> On Wed, Jan 14, 2026 at 09:39:52AM +0100, AngeloGioacchino Del Regno wrote:
> 
> ...
> 
>>>>>>>> +	struct regmap_config sdam_regmap_config = {
>>>>>>>> +		.reg_bits = 16,
>>>>>>>> +		.val_bits = 8,
>>>>>>>
>>>>>>>> +		.max_register = 0x100,
>>>>>>>
>>>>>>> Are you sure? This might be a bad naming, but here max == the last accessible.
>>>>>>> I bet it has to be 0xff (but since the address is 16-bit it might be actually
>>>>>>> 257 registers, but sounds very weird).
>>>>>>
>>>>>> Yes, I'm sure.
>>>>>
>>>>> So, what is resided on address 0x100 ?
>>>>
>>>> I don't remember, this is research from around 5 months ago, when I've sent
>>>> the v1 of this.
>>>>
>>>> If you really want though, I can incorrectly set max_register to 0xff.
>>>
>>> Why incorrectly? Can you dig into the datasheet and check, please? We don't
>>> know what is the 0x100 address means.
>>
>> I don't have any datasheets for Qualcomm IPs.
> 
> Hmm... Can we have somebody from QC to check on this?
> Perhaps Dmitry?

0xe6 is the last usable register today

But I wouldn't mind either 0xff or 0x100 because I don't want
anyone to pull their hair out if a regmap access is dropped some day..

Konrad

