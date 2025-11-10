Return-Path: <linux-arm-msm+bounces-81042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A160C47450
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D6204E3B48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9641F31282D;
	Mon, 10 Nov 2025 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfILjCMM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNDHg5NV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D68318CBE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762785708; cv=none; b=YbUl2g+OpdErOP41Z+zBYyQ2ZM3JYVim6f00jJJvpl9+YnhhG6wPJu6aKDFYYw9GWFKR3qwcbxmGCF2NPJMNbd0w323WmIUnT8sZ/3cAKu/8phhvfX9Sc4O9QvTuxWGpaJighIKgeGGRP5/bKWhQGWA9YoJoQIak0a12/tmstu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762785708; c=relaxed/simple;
	bh=EGsoQ001UBEf7yxavI8ZABTjuEBgxU+e7Nmf8KHADdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJ5dFXieEm5K9/WTa6gwoaiVrrHvE1aMUCBBBrQG14Az/L1iEUxb6/UxGrtcnAXcjjQWiuJAAP95Z3hCedj4QC+GmlX49ah1mmY8JbqRg8qOmV5aWPkdDXTKdT763E8qJ3tCJa/b3esZ/SbAMVezl4Y5mvmSKiMag8w4iM8Q4Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfILjCMM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNDHg5NV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AABZWW93271032
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 14:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYPBMmPMrl74VcBNfaZK6P0Th/jmEX2D4ZwvG4S3pO4=; b=bfILjCMMjXR9ll5x
	cD6jtvxG6fD6T52Kv9T5eFgtaACKtgd2pxJrJYkaEhSdnaM0G+6qMOnEyxVw2yen
	nmcvAkwEwJggDXfQcRGcs/MT52ntoYywDMTghWYOAfQDTvazF2IIX6muvRRypGTt
	x8vgomIVGqrxB59uYFQIxGMx3TZWKb3fmh+SmVuUNocYD5V7cwCQsPZaZs5F2/RB
	z5OlpnaqX899nLntx4ApLqe42zY1vRkWgA0SMYsI+iKlLn2JwNGALeD+zMx57m3c
	hyhkTX25wcuYf3cNxj5vL8BW4eS4tRJhRvSUdnKFh8C33GUfWnHecHjyk0tCeDsj
	yWYvEw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abfafrgcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 14:41:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b9a72a43e42so2768278a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762785706; x=1763390506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYPBMmPMrl74VcBNfaZK6P0Th/jmEX2D4ZwvG4S3pO4=;
        b=LNDHg5NVywSXuikZeB0U6w1nob8Hm8N8OBTwhUVJwsqVQyOmz/x4k319Xdl57EHMbE
         VBG0oO5jiROiPdUjPwo3pvzmQ8XoTI9UqR+DmIbnvohAL/H4f+m/bLsTjd5T27FutTq0
         eJ7tjTPNqZcG2Tkco3IsRZyiyeqzYyD5Qkm5fz2Cpd8YwUpXv0dIlvJZveESHLJwPhUP
         SUTjUHYly6RkVwUiKN9b8J5H220wNibbnIKqxvc9hxOf5ShDAeFkNpYqVjAf2WXFVLYo
         fZ2Ogo1OisN+ATuni/6Eb0NPVdGBv6aUN2hYUBIqVgOCFtqHShHbukcJS7FkeV1q44Rm
         7C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762785706; x=1763390506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYPBMmPMrl74VcBNfaZK6P0Th/jmEX2D4ZwvG4S3pO4=;
        b=E789KkCGaC7RYsu2/wscMomnMxu0FwagIdfyNpGZEiZf1JY0BBDpj/lXX2oaYrXohy
         N+HvSg8psa2KCiGnci8qZZj22RgGs6gZt51sKn0snq7IkWSFAe6hFt3dfbo/6aBkjAAV
         YGwhBqatkHnwWXJUBB5/QTF+3mX5j0SIe52TF1+xG1xw74oHnRYerPXC+FSJZZPiu56b
         U7U/f98NRruE/WPmbMZXKTWFC5W9se/bylJVzJuX89XPMpCt+hOcVzwzTIanN3JHzYda
         8R3Zh43nNA/kDACGoTRgLh3ruWtRhS2YOq1SZx5z3HuwbqmWrXPM0mW5wxIqpCWYmKb9
         McLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwLJl9zwfnOmy5pPsVvsWcxud5dCo9X4CYPEV3/hvQGvB88/ctE0HOTcYVrKXXNUFrfe61FYzDdNXcxigp@vger.kernel.org
X-Gm-Message-State: AOJu0YwZog3itEJwluOTWeFEbhrBx/rK77ZCH9aVgC9uSN5bCph06iIJ
	YYvf35jgj1RDIq9b3cA+bG4fftJu3lKqv4HmvIIPgp2vzZ9SuTH1AdxX5G3rnbVjOaJBYiiAq7j
	1YRVVwCAZk0Z3kf2UYihfuCnq2zn9ZMHY4xJ+/xWZgox8l0YAJXwgPPwAbPvvt7P44x6X
X-Gm-Gg: ASbGncvVKCIXz3mvJmgJgY2LcMndLlHHWrrtyXgvcJpUjrFGf/AGCJaUkdSB7fjRshm
	n3KqmLrVaxxkPkY9DkGDDovyWckVHr7/PbtvI/xERoIypZgMr9yCrZO1fXmKcZeEN3z9gL3vpAL
	NRpgAaWJqVv73Nt8zygyM9s2gOjO2eufkwuyrUvQPum8MB2lrFojwynKyqas+G7tfmnNX1QWjM1
	0zU7uScnqWcp/7AG0Dl2jkjBzqTjf374+zGkBVFGVqf0A3c0f9XflQUXJVm+lWwBzQbSWraNjwq
	M326oAg8+lHaHJD34uhLzmhB/N8d5CaIDmO242YCP2xMGIjBMicfx1+hMRaeUtUrYQZbyHIBk1D
	a1FkTVC1weRtUQx98dJgRVm+gwryeTpHc
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id d9443c01a7336-297e540dbf8mr103670235ad.6.1762785705555;
        Mon, 10 Nov 2025 06:41:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzUGI3gfRP1roHcIKhz5BZsgRD+n11EwhNGgQ9IIMPUd06GGUlB6wwr56gPGTWX6jx/IrBZg==
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id d9443c01a7336-297e540dbf8mr103669785ad.6.1762785705031;
        Mon, 10 Nov 2025 06:41:45 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34370ec58d9sm7675580a91.6.2025.11.10.06.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 06:41:44 -0800 (PST)
Message-ID: <821358a8-64ed-46c9-3fd4-538e194fa5b3@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 20:11:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu
 <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
 <ec5c9da3-297f-4a07-bb95-512cc607917e@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ec5c9da3-297f-4a07-bb95-512cc607917e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CzGxzabJTMRL2L2Ry3oB1xtIXKnR0pL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyNyBTYWx0ZWRfX2Boq9UkgU0WQ
 DTSq8DN8JniibqqpuQHVBQqVHgOO+47F7V62urwg4BjNYygLRBkiS496pGln/pX71Y30JV+fE8O
 +i70NQfFr1BL1eEWQunYIlV6cYOIRf6q64XuTVRcWCEgvHRECH+6uG2OOsxCZw3jNgmYKvbPW4C
 bIQPfOg7q5RQcQyaTm0+PYEgUxz1GM7aOR4NK1oYz5vxIx1NNgkKJCYpXjEgbGLeoZbl6CCNo8V
 cKtNlk74xLaBI/YlPvwQU+ag1JFi8pi9tgdKTm6+QSRgaD76DtCyAb9tCR2vrYGZ6nzN9yn5TNC
 TVE3zL6UYtXaWXjr4ALplsfGds9dvYNio7w4MibyMqZZ9AtuNd1Ljck6oPj4Okn+5gNgfxmKjrA
 35WVCFdvY8cppGs9fr/ExJeO/6O05w==
X-Authority-Analysis: v=2.4 cv=UZJciaSN c=1 sm=1 tr=0 ts=6911f9aa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yV86LA_xD0RmO51t7RcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: CzGxzabJTMRL2L2Ry3oB1xtIXKnR0pL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100127



On 11/10/2025 10:10 AM, Kathiravan Thirumoorthy wrote:
> 
> On 11/9/2025 8:07 PM, Shivendra Pratap wrote:
>> +static int __init psci_init_vendor_reset(void)
>> +{
>> +    struct reboot_mode_driver *reboot;
>> +    struct device_node *psci_np;
>> +    struct device_node *np;
> 
> 
> We can take advantage of __cleanup() attribute to simply the code paths.
> 
> Declare the variables like below
> 
>     struct device_node *psci_np __free(device_node) = NULL;
>     struct device_node *np __free(device_node) = NULL;
> 
> and get rid of the explicit of_node_put().
> 
> I think, we can take up this an improvement once this series landed. But if you happen to respin to address other issues, please take care of this as well.

Let me evaluate this for next respin.

thanks,
Shivendra

