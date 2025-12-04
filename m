Return-Path: <linux-arm-msm+bounces-84380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DB8CA3D47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E631A304D431
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB4F3431FD;
	Thu,  4 Dec 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akAP/UWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFUvsBvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD68342CB0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855112; cv=none; b=BSgd/YEVyWvaUSq48p+UkMtGU0mfsY4b2kZc/GEokA72Pj3xylretpxotOGLO25sgs311PGvIp0qVEZpOdAUkDZ7Ajabe+72Lv5i8ba5zLrNXm9xBO6UMGQ1CTjThj8adoiE4L9MpljjCgNKxwTvNOubblWRN2KDaco6+yVAQ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855112; c=relaxed/simple;
	bh=BHlLCprP4bZQNUAnGBpWmi6v5rkaUx30VAeYt9NrmAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFLR7nyht/bOTjdqXtYQ0CC8fHFLsrLVWrwAEGBlQTFnOGj5VwMX4EWxyLmwMxPhrq3yvQbvz9K52dMgdSkgcYlKPEen32yFg36Ep5lcJEQY8AN9VOG1D9MaDkdcPWKVzp+7hgNYWm/csVQQC4WrvNMRp5wMuSXqjm5WeIk78Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akAP/UWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFUvsBvY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEqqu1130912
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8v9MZRcYSWOYsXns5st4tio4IBnhtTaYNkIBg1TWH8=; b=akAP/UWvqksz3lyA
	8Jph2gO2naruzdQK+Wwm2EttLRqlfR/rBsZPsFn3U+LQABu0+s1h8Z6JuDN5BfNI
	ZsVBLSiXNHaEW0qKQbDQ1RDRjheuRryV+YO2A32HkDPg0BLqAJALkRrDKqc0zxcp
	c5pqGaQbfA/R6Tj0i1dXyJQRad68wEGl3+gQ7nfDFnHCdVp433x1v7+W+wBo9OG0
	XZDI6jYzybAUODwLmasBL69ZtihHTNZo+CLnxskO07pnp3n0ivIeJj2J28Z2GhUA
	DqchubnZe4UE1Bu+Fpz1XhfY/nLOIg9flNO/wlfVrvw1b+aS/a+iOhTxfkn1LguH
	7OguoA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f01tr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:31:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55955f44aebso21067e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764855109; x=1765459909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8v9MZRcYSWOYsXns5st4tio4IBnhtTaYNkIBg1TWH8=;
        b=iFUvsBvYPxZLZpexWdsEZOBv/XXJ3V2Bf3p9/bQeMmBNz5KRm1QA2eNv8bsRsaKBUW
         UVBIvb1rbKzwm15Ict8u+mnLI5MSkgUCKEFl0mjEnM0FevAL9WrL0d82NK0wHRtBBYWg
         mMWuCA3BPf33puYa9ZqTd3H5fFKra5azyF3SYHPHNfkEPGQbyXIFM3YGmT9oe3dm/b8m
         Z40sR9T7t9OYk6ANwo6jDT3kOv8C0ssOeh7IeYTib/ULkf/CuQSY4xVsxWmEWpLYOrai
         fWKONQGZ5tHB4ehbImKoSqOYjqpppxUHeXAtCmUuMj2wFsGIN0YC45INU7TzmWYoak5u
         gi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764855109; x=1765459909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8v9MZRcYSWOYsXns5st4tio4IBnhtTaYNkIBg1TWH8=;
        b=kJDgOY1stCO80Y6t6hnAifvH1MnjRAuc3wMKwpEc00RKH/XWuWVVrjfJmrxdXQYwbR
         PLlg+xxb/8i37Yt3oTl2IHac8DwgKAqTsWkYBS+fFimYO9cTOu4We2AIqRgUSA/jMupe
         EcXwRiiPd6XL+KqrYh3JGjGgARHQgGX5mwxt/SrN9dWzBBHWqspY1NO8+Bh7kQNv/kq1
         zqLa39yopqaAYROzPLyPiLvKaeFtxo5dIbdfNLSY+/0Sl5sYKSA9vWyaGpupi0Pf8ZJR
         DUoQyyoWj12Cee7KgV+6eWG2icC1ARnjAfuVVrYx8SOJi55VZd6+dx8AtwA/+xQGZLFR
         tbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUek4/u4nm2c7Kj1mwIWhPRdQ1BZNzT4jHMJ8Y/4uqj6/qQ+C/hGJMBNhSACivIkFRORSURJgRn00DeR7k3@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgGFjFs9SBfiCthhCbx4ExMZDjLGSdEAS5myvFejfL2RtRvQX
	icf89+0dlxl6ZcET+3/3mikI6tIx8K/yL5o1XD1CD2ZV92FFOPIQG97Z430ufegMENwf5L8jLDv
	umZmoHBDHEPMl/bpx36sKEoKhbF11N/SbJ3Ko2QfDp3DaZ/UTDELqqVSknfIuX8TZMW8J
X-Gm-Gg: ASbGncs0wAs7Btoq377DoVyyiRWyUtAtdLUprkhBgZlarJdhsmAQgEHH0ZcD9ITVeD/
	yfhbfU7ca3Dm0tE8lDQHQ55Bh6zRvrybbqZYYrVGmcSafYdJN/khL2Nb1FzXeCOcZNOa/DgjRZU
	e7ofg45Kvd2JzyK0pw6SUtq/s+iVuBKb7WzFSmK8WVstQ+vwstWiKUUCG7Z5XrkHUAADphA5kgk
	/v5Z9psAr9V0oxpPVfJjwnNp1nsSd4HAZj9FrWtmKY6cdt9Uf80GUqLrSrpsCB3tybU11JtqpQT
	KCNO3+CbPRBE+dWM8Tk/3idLhoOj14fXj2JywxrIq/J3rTqXyOOfXe1RkXaUxXpFCMrBuvLMf9K
	lQW6cO62bQuqIM3y5Cb7sQ+SEQqfafeF0q4qdd2NxWtT8N9PAZ23iU7gJWTb7gRpCxA==
X-Received: by 2002:a05:6102:304e:b0:5df:b52f:58ff with SMTP id ada2fe7eead31-5e48e379a6amr1243339137.5.1764855108990;
        Thu, 04 Dec 2025 05:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeaJsm6K/kvkrh1Lx6h/U5lKoBJw/CsJHPt4Who4H5sTNAg64kPQk7dL5ILDp+u1Q5usvJ4Q==
X-Received: by 2002:a05:6102:304e:b0:5df:b52f:58ff with SMTP id ada2fe7eead31-5e48e379a6amr1243321137.5.1764855108567;
        Thu, 04 Dec 2025 05:31:48 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975c88sm127980466b.35.2025.12.04.05.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:31:47 -0800 (PST)
Message-ID: <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:31:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BotaOLBzBna-EHUZs_MQ5JqGjih4mnAZ
X-Proofpoint-ORIG-GUID: BotaOLBzBna-EHUZs_MQ5JqGjih4mnAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMCBTYWx0ZWRfX26ok2f8L4nHn
 w+jQSjYfARfAJCQwdLq5b/JswON2BRbP1bGS8eGWtBYUVxR53cgS7QD/5IBHmIzazyOYqpitZn2
 AYTuEkFPlrVpjZpQneSzlsa9IMzPYsi5p5ctv9qKkjC8ViTs2kEjJSOKCvmgZM2PqumUP0cJgDk
 wdr+OmTj6UTlNv/rofPafMe1PZkgw0C1WzG91QMPVDj3ZhgVLcn7MRZt0z5WjAG8Vb36j0C2cej
 zLG2UAzw4/d+S5dFNc3ouOlidlahh0EICpWhtPImo76XgqK5NsxY9HvoOu4HcPI4I4A255Q/UoA
 MUZPBs0sVg/Y4Pa9M1/NO2nw9Y7KOcEI8Mk4ogBpQPa0TKD02PraCP9T95AA7iEZmOp77lHma0K
 4r5JE1SuMJpXhdD9cq1gz8zreJT2Vw==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69318d45 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mMOXnzwY0fgUwPJIr_EA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040110

On 12/4/25 11:13 AM, Akhil P Oommen wrote:
> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>
>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>
>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +			gpu_opp_table: opp-table {
>>>> +				compatible = "operating-points-v2";
>>>> +
>>>> +				opp-845000000 {
>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>> +					opp-peak-kBps = <7050000>;
>>>> +				};
>>>
>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>> or mobile parts specifically?
>>
>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>> here.
> 
> The IoT/Auto variants have a different frequency plan compared to the
> mobile variant. I reviewed the downstream code and this aligns with that
> except the 290Mhz corner. We can remove that one.
> 
> Here we are describing the IoT variant of Talos. So we can ignore the
> speedbins from the mobile variant until that is supported.

Writing this reply took probably only slightly less time than fixing
the issue.. I really see no point in kicking the can down the road

Konrad

