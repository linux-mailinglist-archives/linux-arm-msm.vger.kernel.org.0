Return-Path: <linux-arm-msm+bounces-80330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6FC31A7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 15:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44875460989
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E9932F75B;
	Tue,  4 Nov 2025 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQzm5Yks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkBxlg7A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F832E75C
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268017; cv=none; b=K3ECZvdynwAjYwcNpGpnoklMsSt8BfQqQnSP1E6S4RSBKAbXftQuv10/0e1l2aMgCFfowQZuoTP3XE/mjeX9j1i6CySWoLz6HU8dCPweZEdwIJnFtPilgZSkU1Z9hOUJW74vUSNVi0oFbU8zlWZiPiaMVC5aiqWiRorq9g3OX9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268017; c=relaxed/simple;
	bh=cHB74vdMdM/PyE60x2eafaIirCM8GUdqD0rzzIoXHxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udq4ITRuJ7bJFgujNj+CXTsmqd/OoXdgjdrIEnAKphW3d2XoSDMaQ0+3zgltDwmf4r4peJMdgNJ3Qlyoqw9B7QRLnqd9s2sS4rLcZt9uc++n62IwIvhxyvX6PHq3aCI/BeJh7NvemtYFozd8JptulRk6SKVmBVAzVHhCsoOU3RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQzm5Yks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkBxlg7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CgD9M1975947
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 14:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cHB74vdMdM/PyE60x2eafaIirCM8GUdqD0rzzIoXHxU=; b=fQzm5YkssjMO5gmp
	vSJVG0C0vDf82X/6QzblspP/83xyP61oXVkHDvtZEspedwRNgP4Krj9FfMf7fjG7
	NnGBKLl5n0y5gSmwCkOgXZAbk5cDOsblnwgLFH0CPaWoMAMIra1XviIlbDYfIpgh
	nZL7QIclDrJp3FW6gulLOJ6lb9h6XspSoX9ZQZJ0IrtZEOpPKh3K5h1I8JT48S9V
	XnQLBnc+EdBgyVP88ElXJmgOjIJX7qELQ1D3CZD9PoEgzgDOpj+9CrNlEARnDj0Q
	qWQ+jQIm2P/SUz6SPeXEE17COvsiDmpY3MchiT2Tk2SzwNl21yEDgNYS0Ta/8pf9
	TdY7Vw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heagckf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 14:53:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8a223d563a3so189900785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762268014; x=1762872814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHB74vdMdM/PyE60x2eafaIirCM8GUdqD0rzzIoXHxU=;
        b=kkBxlg7A0NCvmu/rlZMPdFCJLUiFKZnMZOaapARpTwQfx8Y++Wudh7AzL3xpGs5UFk
         C1TWRr4KA6+27GRQTcLs6Zmlp6vTlAJdenHWX6a2cEreQGo8t/IQCh/R1CF+sfFhJdI0
         yUyr6GFsAXlVCBbnj4KUMEzjy+eNUxDq5wEW8FBY2bRNpg1bBWByGSMES2NmQE23EhuC
         wAtz9rvaUczMraqc22thN/qM7skxzilKaLEolvOGOZLhHJyXU/PCd0jI1+McY8yrc/ci
         HIrEqd9eZ8371DZP8pV0rozTfKL8MxurVoAnT9CBSWkvT2sGgsWNta8/tBgWlrZhqWPP
         nIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268014; x=1762872814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHB74vdMdM/PyE60x2eafaIirCM8GUdqD0rzzIoXHxU=;
        b=SsdXFOrL3s9EkXTh6YiM1wUShlVsgjavwQyAIVGmszLJz7wm3xNvoHl6OwXz48zbIr
         hsmEV5bl8c7WDYB75kIpLf38xIhCPbhuSo1nkE1+/9MSpgbpHbqPdjcUCyNkZHERxQKU
         naqIeNCJ7R09rZknMZedgjyELrKFbhzseYL465j9rafg+lzZEJz91PoK5Iq1m7YBIcLw
         vzMM0LePx7aVdTQnbH3uw5mKkO2H9iBny4gB6Pu8fIxWYyx0SU6oL7POOZMA+yydG4zd
         4fLN9u6uTUba36TreLf+c9Ee5gPJZDKzJH6dUCZhNg9l9EnLk0HgrawkZDGdB1Z2PUnW
         mn4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8EHA13DU2C7l55372gDmrYxSfd/7PEuOtLiy80wLWH2Kv1X39/oOLWqS8FzWuW2v7qXB9V0YkWeXzY7AT@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8NSguizYuUjYT0ydSe2qSKUxVqul5SgCEF9H+kSUvCPAqap+
	eC+ornTISRPJjSj1hZ2iKjpxyYP6mkkpHEVYGan23hAkdVzsjd7BRiusrYCn2e3USq8H9ggqNqg
	SevnPfkk0xIksaReBBK2VBHbbaTkhdCOrRcom+jpEhm5Q5BgNb8E63C3zrLKDbGtOjqT+
X-Gm-Gg: ASbGncuQ8AQ1VONQuPEuHEOf52BSS/tyMaF2ZjNmnM19ajjOtDSbuacwkqg80WHwrsW
	+Y9UF0+f4ORwLTqI9f6vvaGzFWuLQxFX8gntXFzJHHt1637ZZrCmrniMrYPC9xoyAQA1Bv//L+o
	VFtf88vukd1HEFIklWLoVvUQYvjDkD9vbJ/gRubpo/afC5+oZlo9+o2dJDUHUGEgi9ur4dV5aEq
	rkscZnjIjb0cPKqcBW5oFYsrIBk40X97bL66NOLwiYBLS7jM0RIyuzMZQ08odzPn9S8xMMJtULy
	irwPhXuOuvnn4htB32oC7rUdrVI4To/kfk5ukEh5IBAsa1KHfRbB4cdCnwRM3tH6EAjw2E/PEQH
	Wi/Fyq9y/R+KnwomV6n97V/NwGe40MEEfv8eovLInJoE5465zC2Jngm55
X-Received: by 2002:a05:620a:31c6:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8b21f8df1c5mr31646585a.2.1762268013622;
        Tue, 04 Nov 2025 06:53:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjbaCJNTd4JCMzhcP2fE6bDyiUfjuyPQRBF0MYao4qLk7yxcTazmOZsoPR2sao5ZTs0uBycg==
X-Received: by 2002:a05:620a:31c6:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8b21f8df1c5mr31642385a.2.1762268012756;
        Tue, 04 Nov 2025 06:53:32 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fe3b899sm228701566b.66.2025.11.04.06.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:53:32 -0800 (PST)
Message-ID: <6ce3c769-f733-4e0f-a4f7-7b1b39ba3c3d@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:53:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: r0q: add touchscreen support
To: Ghatto <ghatto404@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251014044135.177210-1-ghatto404@gmail.com>
 <20251014044135.177210-4-ghatto404@gmail.com>
 <e114504e-4bdd-46b9-b708-8eebc3075163@oss.qualcomm.com>
 <CAMQHOhfjsi1L+3j3TrcjEjPp3xkn94KOdsrVZvJCyUDFBBSeqg@mail.gmail.com>
 <d06a254f-bf54-4bdf-bd09-3ee5e5b31bad@oss.qualcomm.com>
 <CAMQHOhe=WYhtsjHMcRnJOi8UhnNNBfveTWRGSZ_bg24gFysAEw@mail.gmail.com>
 <8bd5486f-38a9-4104-8d09-234f642b45fe@oss.qualcomm.com>
 <CAMQHOheTkKC8NcRrPxKZdB_h0SJGNJVMd4NUD7TE4becPouWyQ@mail.gmail.com>
 <73d30994-3ec3-41bc-9b07-638d4173dfe6@oss.qualcomm.com>
 <7C2DF8E1-D84C-428C-B064-3D8CA16FEA29@gmail.com>
 <7e5f753d-a26d-40fb-9cde-ec17eff85c27@oss.qualcomm.com>
 <E9C95D16-18DB-4AE9-8C50-BE3481A25FB3@gmail.com>
 <a04742f3-8a1b-4d69-acd9-5d8dbd5a8886@oss.qualcomm.com>
 <CAMQHOhdmf5TvF3bA4QcTdBY+A2ao1_bDXPPya5aiOjHJ0yLqbQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMQHOhdmf5TvF3bA4QcTdBY+A2ao1_bDXPPya5aiOjHJ0yLqbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=690a136e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=fGO4tVQLAAAA:8 a=EUspDBNiAAAA:8
 a=WALcMRDYb64__XNgrWQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEyNCBTYWx0ZWRfX4Z/z3p01n8oo
 sCEO3m34DbzhSJ7Zaht8yJ/+CPJbvA1Z9K2tyT6OAELunrxYdt9zWXy5Bc4q1smQ/VlorrWCgJq
 fBZr5ZWyU1evIPwF/bTuVKdoQKVlEjDPfsA19nRbRaisP6hBDuwfmnPcY0n4oP4XR7/Jyjdo7hg
 gUpqTbuUQQTGUTfVG/3ZLBenh72oojRZ/0aQ7RkVxEAMRKhAiAmHvzyblUieOTEi8F3B1bhCEwR
 mLPBMmP89G8rAZecVcA0ZjjL5StdrsN47Q+QvimdGhjVSFyK1HFqvNgU4qnryCqjiN2vN6jRUMt
 fZ2uHG+o5IGcagFO+pmJiW4MO3qJrgZLM9lPyEB1j5Dll1giZRaVGMt6cP4yfriNLuU4bNsYnzx
 jBGp2G58/NbCxfJszqaLXZm8IDnL/Q==
X-Proofpoint-GUID: VoAYb3qQvShz5Ehr9DP7kdqwJXOEGS9f
X-Proofpoint-ORIG-GUID: VoAYb3qQvShz5Ehr9DP7kdqwJXOEGS9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040124

On 10/31/25 10:06 PM, Ghatto wrote:
> On Wed, Oct 29, 2025 at 6:50 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/27/25 7:32 PM, Eric Gonçalves wrote:
>>>
>>>
>>> On October 20, 2025 9:18:18 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>> On 10/17/25 8:22 PM, Eric Gonçalves wrote:
>>>>>
>>>>>
>>>>> On October 17, 2025 5:20:43 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>> On 10/16/25 10:08 PM, Ghatto wrote:
>>>>>>> On Thu, Oct 16, 2025 at 6:06 AM Konrad Dybcio
>>>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 10/14/25 9:04 PM, Ghatto wrote:
>>>>>>>>> On Tue, Oct 14, 2025 at 11:18 AM Konrad Dybcio
>>>>>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On 10/14/25 5:10 PM, Ghatto wrote:
>>>>>>>>>>> On Tue, Oct 14, 2025 at 7:01 AM Konrad Dybcio
>>>>>>>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On 10/14/25 6:41 AM, Eric Gonçalves wrote:
>>>>>>>>>>>>> Enable the ST-Microelectronics FTS2BA61Y touchscreen. This patch
>>>>>>>>>>>>> depends on "Input: add support for the STM FTS2BA61Y touchscreen".
>>>>>>>>>>>>
>>>>>>>>>>>> The second sentence doesn't really make sense to be included in
>>>>>>>>>>>> the git log
>>>>>>>>>>> I'll keep it to the cover letter then
>>>>>>>>>>>>
>>>>>>>>>>>>> The device has an issue where SPI 8 (the bus which the touchscreen is
>>>>>>>>>>>>> connected to) is not working properly right now, so
>>>>>>>>>>>>> spi-gpio is used instead.
>>>>>>>>>>>>
>>>>>>>>>>>> Some Samsung devices used to use spi/i2c-gpio intentionally, also
>>>>>>>>>>>> on downstream. I'm assuming this isn't the case for r0q.
>>>>>>>>>>> It isn't, the device uses fts2ba61y on the spi8 bus - I hosted the
>>>>>>>>>>> DT at https://github.com/ghatt-o/ss_experiments/blob/main/r0q.dts if you
>>>>>>>>>>> want to take a look.
>>>>>>>>>>>>
>>>>>>>>>>>> Did you enable gpi_dma1, qupv3_id_1 before spi8, when testing
>>>>>>>>>>> The driver probes, but it fails to recognize the touchscreen device
>>>>>>>>>>
>>>>>>>>>> Could you post a complete dmesg and the precise DT diff you used?
>>>>>>>>> https://pastebin.com/QkYa8nMp (android dmesg) mainline dmesg doesn't have
>>>>>>>>
>>>>>>>> The link has expired 🙁
>>>>>>> https://pastebin.com/s4abJS9M shouldn't expire now!
>>>>>>
>>>>>> And yet it did!
>>>>>>
>>>>>> Feel free to just attach it to your message.. the list may bounce
>>>>>> it, but it will still reach the To/Cc recipients
>>>>> Attached the dmesg.txt file.
>>>>
>>>> I'm interested in what happens early when the SPI hosts are programmed,
>>>> whether there's any additional debug messages.
>>>>
>>>> If your log buffer is overrunning, you can add log_buf_len=8M to your
>>>> cmdline (which will make the buffer 8MiB long)
>>> Is it that big of a deal though? spi-gpio
>>> works just fine for touchscreen.
>>
>> It's like using CPU rendering even though your computer has a GPU in it..
> Yeah, but CPU rendering is slow, while the touchscreen
> on spi-gpio is just as fast as it is on Android.

Sure it works, but your battery would like to have a word with you..
>> Plus we don't expect the upstream driver to have such odd issues, so I'd
>> really like to get to the bottom of it
> I don't think the log buffer is overrunning, where can I find the SPI host logs?

It clearly is, since it doesn't start with 0.0000000

Konrad

