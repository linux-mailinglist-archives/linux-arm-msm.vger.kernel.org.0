Return-Path: <linux-arm-msm+bounces-75231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B06BA21F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 03:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697E8385DDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 01:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D03115CD74;
	Fri, 26 Sep 2025 01:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH3+g1WE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B5158535
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758848968; cv=none; b=El3IpfZT923vb1wx5dJDyDoIcsdATUOWSBkZWbcICCcqb+Gfk37Sxj68zfslctIHEBlF0hoOtmoeB/O6mCHvsPXugtFOGqnNvjzo5WSBjhlcAZY19lMinWF4Oz/xcDycIQ5CcfET216I6vjbvZxhcTsxE3v2yX1QkSk4YE0gOLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758848968; c=relaxed/simple;
	bh=r53tXrc5jgiO4gQcViEs+jKgFfCrZ/4F5Ycb2Fhnec4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYkPh4PFl3d9zD18RWxyGo38ehDQNUqEdMPHY7eQs+JQfHYJjwj7KD4u6SqMLWqsKW5Ss12bY3FpGJIi72q6uLcjA2Mu19OGSi2h1aulknzpyzMbHcrGFErcZ8dEJQptIyKt6dzmmzby9hei1SKrVBb4/zPtz6VJ7Tz0AY699fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH3+g1WE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQXvg005410
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 01:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DltWIU0EvBMC6TRw17cAj1fVJR8GrOrBTSW3UTokzk4=; b=RH3+g1WEY/nh8lDP
	oSthx3aoHtK8rR+R74tfvXFo/E8R1No8IDpYvBdPlDFWui2R0zbU3cxGy9uESJzr
	YTPWsNNXZ2Jgu/KjWH2RXsQxFNYgTOewceSBv4ai/MSsTfu/IdCrpWXjFqTaSzFW
	4Q2TMTA3uOvpo0GyEFdeG3GLIfJt4k1hrxDVHKy09TvmfHqoqr6Cdfh8v+kOS0A3
	pJOVe4UudcEaqR+y3dlAXI0SI82BUc5wbTnVsZE0nF25ayyk/IgWrswNYdnNSqp3
	ceMq6OV7yxfB5Gzhhsekc0fPLF5cFueUXJyPSpDVC94F4/pESLuLzDEY5rY103ts
	S2UPUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u0uwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 01:09:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27ee214108cso20026735ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 18:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758848964; x=1759453764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DltWIU0EvBMC6TRw17cAj1fVJR8GrOrBTSW3UTokzk4=;
        b=MTNz2OiFkV4ySY9oa1+hyiskL4hZXvq6skpKoonwcaEkj0o+yEw+EJJNEpFpKl/uOm
         SdHsiEOIieZ7QFg8RL3qF3h4yU9LmdKHhndIWYSxdC5HuEqMnUx0UkF2nN//ItmZ0Quf
         4JMUvQc+886ulWsxpDV8AwzEUkLvJrh2m1W4uFO3IzG+1Hk8xQ+LUTRqfUPdmNVHL3Iv
         FprLsVgYOGgqkBQ9VE0U17UxZKwvRv1il8pQdRCysC7D9p9Dn+je0q1jj/jkINe2WojC
         mIdXb0Xp2S9cFBs3yIvY8AKZG0X4m5yGoL/XKA5aTvsOF/ewjMmRzrJD676qlxy5+M0C
         k2aw==
X-Forwarded-Encrypted: i=1; AJvYcCWsWNjK0APmfsUXfdF4jzuEgp6dCK+1jlOLtH2qSndEtGfU+Ph7FmwSnczpqFrGnGP8P6dAtmYHWtjO+Lic@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6qQeTStBAAKWHE2bD4Ozh5nUxzvHx25eAQmDSX1TlTTKrzXZ1
	Zspx4SIq2q0sIp4T2zaAZS1mSyWcFGUGgo7Har+DPLIois0XHyGny95lImGh2BGUBfK9UHECmRa
	gSWVB357h5Gay896erR3WoAqfWOifYlyCftFI7P0A4qCB857foxRrb+DsmubI+VlmsuFB
X-Gm-Gg: ASbGncvHQ4XsAetDG+BQBoIeRh4EMnNKPiF7kEkBtKeSKb5U8fOOhdK2FgaFXwFjCVY
	7b8VDEXdvYFx1Z4fuUmAeJEmwCi5E08CxlsHuQTH02koRzaVrg/NaJLKj94eSvquCmJccVD5/7T
	b1FVYIErAFUgV+dbTiqlNv1avXcN0QZMPkxzQXD/w4EXiGHBmUL1cWq7JYNmwJfsljXA41C+2FQ
	2xzqmn91wL+5ITlL18iKJKfigVdA1x4v/gMdHz5w1Zrk/UWZsydU+CLKSe6jq8YuBwiQUhAze/P
	EPUEO1xsv2s5hIkBa/g+wHngqE5uHQ/e32G8XlehFjPeQ9oChPq+bh30BtPLNeVHl5JOc1FpAHc
	YB/5iVm4=
X-Received: by 2002:a17:903:1983:b0:24e:95bb:88b1 with SMTP id d9443c01a7336-27ed4a5a871mr55646185ad.34.1758848964433;
        Thu, 25 Sep 2025 18:09:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECOycQ6vKg034cdLVh9hclHCCz1rE/ItIEpfU+ohxFrptWNw6FnBMNm38y7E5EAEaGlTEbwg==
X-Received: by 2002:a17:903:1983:b0:24e:95bb:88b1 with SMTP id d9443c01a7336-27ed4a5a871mr55645805ad.34.1758848963732;
        Thu, 25 Sep 2025 18:09:23 -0700 (PDT)
Received: from [10.73.53.199] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671e93asm37367225ad.57.2025.09.25.18.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 18:09:23 -0700 (PDT)
Message-ID: <2c576766-bff2-27ab-2805-298a9d743b09@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 18:09:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: glymur: Add USB support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-23-8e1533a58d2d@oss.qualcomm.com>
 <dzjj344c6zlkg4rvi455xoedhd4d2kjvodi6yftv7svhvvmxbz@kwq7rkq45tms>
 <66a5084e-3f7a-452d-ad5b-5867528f57a5@oss.qualcomm.com>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <66a5084e-3f7a-452d-ad5b-5867528f57a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9PoKMuHPeMgxVwynw8sP9PeOTnM1xCAd
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d5e7c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YnZyo49zVung00aZBBAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwnqJkAH+N2Jq
 2chsv7URqWptWguju8r9m3wW97r0C0jx6L1vHd6uDV39rkkPl2UDlngetv+HRQgNBhQdt3+KVre
 kt9HUI/hWzCOnlQWbHiaFZiBdC/SVub29uJAvqGwltStARhjyjqYSyt6tTQpYQez0mJzuKOMBSo
 fDLNy5CFTP1mGIjj6SQJmLGaF7xpJ0bGFLEy3LSrT6AnVOGb0x9BhWGn+jOaBJZ3elqZqb8IQK5
 ++K2OwIA5mkizXcSgn0scQoT066w+Ra9cKMta/dA/4BXP+peHGXwoLmGCObcevznb08Vv2tA4Op
 aWGrbNr1oQ3RyrjEYfkqT8frjKso0Qk6ztEGPkViYu5CPomQKJYNHleWHwjnJqtSq93TSeBtOuJ
 M/JwOechBbGngP5etOJF/4JaAGOfqQ==
X-Proofpoint-ORIG-GUID: 9PoKMuHPeMgxVwynw8sP9PeOTnM1xCAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 3:59 AM, Konrad Dybcio wrote:
> On 9/25/25 12:54 PM, Abel Vesa wrote:
>> On 25-09-25 11:58:29, Pankaj Patil wrote:
>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>
>>> The Glymur USB system contains 3 USB type C ports, and 1 USB multiport
>>> controller.  This encompasses 5 SS USB QMP PHYs (3 combo and 2 uni) and 5
>>> M31 eUSB2 PHYs.  The controllers are SNPS DWC3 based, and will use the
>>> flattened DWC3 QCOM design.
>>>
>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +
>>> +		usb_1_ss0: usb@a600000 {
>>
>> This is usb_1_ss0, but then you have usb1_ss1 ?
> 
> I'm in favor of just calling it USB0/1/2/MP/HS because that's what it is..
> 

I never really understood why we have:
usb_1_ss0_hsphy
usb_1_ss0_qmpphy

usb_1_ss1_hsphy
usb_1_ss1_qmpphy
...

Not sure why we have the usb_1* tag for the primary and secondary PHYs. 
I think it'd be simpler to just do what Konrad mentioned:

usb0_hsphy0
usb0_qmpphy0
usb1_hsphy0
usb1_qmpphy0
usb2_hsphy0
usb2_qmpphy0
usb_mp_hsphy0
usb_mp_hsphy1
usb_mp_qmpphy0
usb_mp_qmphy1

then controllers can be

usb_0_ss
usb_1_ss
usb_2_ss
usb_mp

Thanks
Wesley Cheng

> [...]
> 
>>> +			dr_mode = "peripheral";
>>> +
>>> +			status = "disabled";
>>
>> So you have the glue defined above, but not the actual controller (compatible snps,dwc3) ?
>>
>> I don't see how this would work.
>>
>> Same for all other controllers.
> 
> good morning!
> 
> 6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")
> 
> Konrad

