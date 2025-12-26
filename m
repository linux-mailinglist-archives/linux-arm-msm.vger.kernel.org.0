Return-Path: <linux-arm-msm+bounces-86658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D12CDEDF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 027143003BC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6D4274FE3;
	Fri, 26 Dec 2025 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH3IY2Pu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEkDKG+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AA2DF68
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766772033; cv=none; b=g6/8q2Ews70dwbS0Q9AfLQKscpRTCz+7I/t6QSOquAdJ10QCdY7uMMIHNhK55s1NbjEI2GVp5NmB0CIH4khxJkoFCoiJnvcaG0zui6lOmcFc7r+wce4hUa+FF+ICkY3MXASXvyHDha/BWnqSAyybUZu+FGKvfmYtUo12jHpmy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766772033; c=relaxed/simple;
	bh=Tw0hpYujlg+lIGxFPAT+vDw7Mbm9lvuZ7L8uDeKIUek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jj/ObLZ8rqhwZq5tmBvSi3R/DbSs9YE3jrWNSPLnH14PVhCjVITb+GbgmXvTDy1t7fl9urLV8fxrJBw+pjAVDyoewZzdSgiwrDsyI1p0kQwIiw404U9bbc0HGvCQZDc/ONNLDy4uEMX46HkLno6ca5lP+NM4KQRtInfED5wMsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH3IY2Pu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEkDKG+l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bm6p1281146
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMuB0hXI/5B2GptpbNmP+iRFf5l17u1VGLcI/EUuwcQ=; b=nH3IY2PurkfMMKbt
	fH4fDw1dbuLFkvjZZf4bn9LlAEFebd8WY2/4zGVV0Yy33nSmjl4daGtDZ3A8cMGf
	0u4l5vXVHsqKUai9o9AcMQr2ZZwQhOcIndgDGl89HlVfzS7oxTAANYmYzDrU5gOa
	O+WkQqgYbKeaPRgag1bExCo1Xl8UtPsgeuiHqC3EpeMzyLjBILRQ/A2/XEEWvdUZ
	iNfOyxdnAmu8/k6Y0G3b8LiITCb4suwZoDSC6f6MCIrOZ4+JICBe5z7FMVBkU/mT
	YrTbClRdes/t6VoWyKUzoOz2UiMLGfjr0uNu8GpKhqnp4FpFJ7lGk5/9XqyIaQn9
	iZJLRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p4945fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:00:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f27176aa7so158238125ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766772029; x=1767376829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMuB0hXI/5B2GptpbNmP+iRFf5l17u1VGLcI/EUuwcQ=;
        b=GEkDKG+lUN02oWxttCIbAaJo3SRP5tDaONHOiTSo9lg0mnt5f5h+/41vtspgAdAw4s
         C6w65EGhS5iszwHfQbxzU6tom4xxqdpH9nBgxWxUluwwkVs7imTG/gD2LlvnUEzUebpk
         oGHorY7gRamJ/KrOA9nIKm+TvAQACb0RtcpSfk/o5oPVOkV+F8DnIHMeYBHO7otOerIF
         vBecJhzwVdBFGxr49zWofpGJnKbcncfbvLzHww5lqL1NFd4Lln0sTFEfgVNrLbEhmpPE
         4ao4IlIAI9Bze+2jxtXnoAxpMC8Cwk1Kbfo+STAJXcsSiBYxDc35jbtCk0qUdz/1hLlp
         N1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766772029; x=1767376829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMuB0hXI/5B2GptpbNmP+iRFf5l17u1VGLcI/EUuwcQ=;
        b=DzFedGt+d8tOI3l9Icup/dJCL9TqGOEOZSHPxYi35iZtYOsX6lJ4TGn4B8tCD149rn
         LRH612Fnuyz9elghU0RpvEbVt218BHRAVBkUoyjjXczxDmk1qgAGQDI9mkSs5/6eK9am
         dkhWmkYh57engazSZkBT2/Vorz4dBgVUBoUMcFVUScKT+4s7TsDL2uSHRI02foUcWMik
         wVdLBkmFJkO0+LyUGPMcV1nw9x7RdvqgvYNlJUqvgQqPYw509rp70uStzCiJAMK0QYXU
         phD3iemS7MHCp8wUABXloJo2o1ONP09mSpeDVawnf0OGHjM/rnmPF+l/RmuIBJXVZP8f
         iLRw==
X-Forwarded-Encrypted: i=1; AJvYcCUO+lQDSKGHcGtgmJtp6HEJ129fTXSzjHth30bX+254zEMP7C3eeO/JL9djgCyzBxVOqIMeHvrlR0LRvOq2@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXLZIKtlTQ6IRfmx3LDFDBEqMC5sw1rLmGwzV1ohH04MMoZuu
	CtxZhkC7J9IwevlawKcz+7q7whQ5YNqfUyE/+CODItyNqZ1g/gjqphqjQVlhiwuYGdLcNDaKOuF
	/tX+iB6TlqHT5Slc8nEwTa6AGnTVOmXxbNmIlgFBxzf3jCiHb4s+aqm1CLomuydPWFuXX
X-Gm-Gg: AY/fxX5FhgkfAoiLfO6jQjld86WTvPNQqVKPab/HzoHQ60pxkySRDy0DTwdBH4TXpgT
	gZ4bT5cyLYcBeo0ZRQnt1+Y6eKAqhUSRly3lrEzQFNibd2Bu4dTa2+JbmpyC0R7X2KwwVsznkwl
	UTpT1RwOHa/br75RAdNcDjfohgJmDIdpCvMCp8kUqpiy1DI7lzQuOCFXRHVzuxmi6Y3UiCyS0GB
	5uZaNqjsIbCLXRlLD9b3LpaO1ufG4TuuDq1nRmVOfffnUKkLvDcDuWm0sZ1//95MdacQdJkivvr
	GEvqD9ksWczalGr2Y8aLhVBGp4DvM24xA6oX9tBy90gcS7OtMmPGfANc1Mqug6YIwCazgo72wcL
	hm9SOwR1InOsZ9MXgKUtTPtsSiOE5+tzSSMW5cA==
X-Received: by 2002:a17:902:e747:b0:2a0:b02b:2114 with SMTP id d9443c01a7336-2a2f220697cmr236097495ad.11.1766772029149;
        Fri, 26 Dec 2025 10:00:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTOcClec5lZYyKWh2iYi1rQ15hI+Z9TJS1BmbregQuUi4Yc4X2f6fvZg18gwi1aVYLsphQXQ==
X-Received: by 2002:a17:902:e747:b0:2a0:b02b:2114 with SMTP id d9443c01a7336-2a2f220697cmr236097165ad.11.1766772028587;
        Fri, 26 Dec 2025 10:00:28 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm207575495ad.42.2025.12.26.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 10:00:28 -0800 (PST)
Message-ID: <79483c95-c376-414a-947e-d7bf836c1e94@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:30:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
 <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
 <176661333774.4169.12534802903262524563@lazor>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <176661333774.4169.12534802903262524563@lazor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ezrolK1lNzrh9kRXyU8S5FyTsSA_Fg46
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694ecd3e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=CGk/GHK3MkyyyFueakV4jQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=p2D3aUV_7dyrOLTwZK4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE2OSBTYWx0ZWRfXzgRDMWw4DOwb
 jPA14u9TBCFQRb8V3L8YVn5qmlZb1y1rRKsOtIzl6gQUx/N4HfEeuTqoXgp8JAEqsWyGPDxdv+w
 sVfQuub6Buq0sXW7ZgzSiVxyknOMjca/QEopSSZc2NL22EV5+FIIZTxjnDSJo/wG3NbehS+6j+9
 gIQNUvRjXooDMALEpF7B9WTT0qwO/s5kkArRwn057MYpl3oxUuJCBtpaZWQtZH8xnrJren5zJun
 NqyiJXxSifbMvA88ZseK/DqMqRzz2OGbm1L6twLZ5833opGKDaELJSe3m7kqfUMAo/dDZMm61Cd
 IC6eUfN15JnZtN8I5whBdGNcDJPU5smOddTmwQrdepJDZU/8dBcJXhALnsd4LcScZwtYWoDFb0r
 wr63rF1IOfjn04mVEm9lIC9YuXx1JJ7XOiuwa7QQiaKgW+PNGr9aXCEVL+y+7ljl6CrKif2IhTJ
 5rrnsn8pDKagGpch+Uw==
X-Proofpoint-GUID: ezrolK1lNzrh9kRXyU8S5FyTsSA_Fg46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260169



On 12/25/2025 3:25 AM, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2025-12-22 09:09:54)
>> On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
>>> @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>>  
>>>       n = (~(notn_m) + m) & mask;
>>>  
>>> -     duty_per = (duty->num * 100) / duty->den;
>>> -
>>>       /* Calculate 2d value */
>>> -     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>>> +     d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>>
>> This looks better/cleaner. But for my understanding, can you share some
>> example numbers that shows the problem?
>>
> 
> Even better would be to add some KUnit tests for the qcom clk driver
> functions like this so we know they're still working.


Sure Stephen, let me take a look.

-- 
Thanks,
Taniya Das


