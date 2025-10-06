Return-Path: <linux-arm-msm+bounces-76088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B82BBE691
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 16:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D081899962
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 14:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85EA2D661A;
	Mon,  6 Oct 2025 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxySLBFB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0B62D594F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759762495; cv=none; b=oRJvWEEoJ19dlSrPb5UmaI6k2w0G96oNMDgDA7xc6Jjn9Ss+H9xbXFFkC2tdd8kotWtUklCHHe5sQLjoBsrLH+wX1FCahyzADzSrOMCQWWmtX8ynIAdQjMxu4Xh64/948OxPSS6DnGKDtSN+yBS2DMbZKb+5oohontzR413uq3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759762495; c=relaxed/simple;
	bh=yDy2w1S0KhN7tMnISkGezKrN0uuY1YchuCd4+CT6oCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F/opsqGtLdMce9D9VVp5HrdVCS0vvB3GpgOPSdwg7t1FnKeySWkGY5qYFhSu4qn+BImLG3ST1d1x6C/4Q8NHmWGPIiIn2xLWem++5FbEX1mFjGaF388+pU5C2w0bTLmsQiH/MBjs1R/Df2XDfhnv0D3kRSHjsQCqJmb+TkzDbao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxySLBFB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NSlkA027970
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 14:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cv6U17bN1wDjwnzmSzJzW9obeBLdedq7KNTbC1B9CjM=; b=TxySLBFB0+PVd4Z8
	sL3+HQ8DR3L0o4fPJeyJNlYF4TIJPPi/1dFl2JHCyQ1F4bx7h/+ChZkXrXwNtMVx
	As2Q/Oovan6s9xsP+NPtP2YccEdZbPSCIuWqqZNLW4WL2yk6MD8fn0X4j/6ygkko
	g7A0VsxwQyWvr9Y2imRDozOQZETaa7g7o3e0BMNhgZ7e32zkX0Z4VKsp+1tUVZS+
	N0/I1REPW9IMt9BDyhuM2ptfG7rEKnMKtxy5f+xp4EBHwP0D9/fooPGtgG9wLNCD
	2KL3tAiNaJ2094TH3W2XAlpK2TKQNCc41P2GHALHLOyHNMciOFizNGb78XeV9GIh
	4OXarw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhm0e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 14:54:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ded29823ebso8656521cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 07:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759762492; x=1760367292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cv6U17bN1wDjwnzmSzJzW9obeBLdedq7KNTbC1B9CjM=;
        b=rNw0OkCXtGeilpomtWHgUCK4Qyh161e/4WKJRUfPb5yV5QE0UjN8bmCJO7fJIEx5KB
         lcp2RkYPS2p6M0Br5UIbwl6u/FXi3H3nHNhcEMsb7gzzeW8XslYHdkywtx5X/igceC+E
         D5cJi3rO+2dhDzffjyzXfxvGOj3mji8fC84wcdSx9V38TYMbIJ3k4pgU6CNxLt1+L37M
         62uLU/RnFk3emLQFS+hdi69IxwfJbxrVxMCTwXpFWSoNRPZwfS2GIUjxrRnlbkX/YKeX
         0TT41SxkiXp3OuP0bGmySZNmR3vG3c2wFL77yhyFSOeSi2E8T5+Lad9zMntDcZBETeRM
         tQPg==
X-Forwarded-Encrypted: i=1; AJvYcCVVndRR7zKHcJ0Ca9vXHWYdf7M3ZU4mJuvamt49HmrZJ0EIEQNj0yeL+DYlDhTny8yC4WnGjSk32+VFAgaZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyqO2w/fL24nUyrryxtcIxOMFNWlqg5pgfyOipscNkO5gbOa5Kk
	5hSm3AbndOKgFwWxMhKEYyBaZ/KjIZ7szuhiijnz5qemywiH3JX/Ony/uFVpI1nt5XhlGteAJ1K
	W8RF3KJbw5xG4zpVZkkCkIfrMrJX7Hy1J/HAp819Fn2jeEbT8vsBE1i3d58IucwgLGK+j
X-Gm-Gg: ASbGnctneOg2GSuPRVI/yiBc0rjWE/KNvseAOwUUPbhJ6xAv6/LhdqZ5dNFPjU7laUw
	QBOPhpOhNCDbJXadicGVtNlX+y+yRLsgIDVra5CHGta8mdYvukDQQhEzbO5BL4B4sUvvB/ZwY4c
	QygvfwvM8lSn/bbQM4m8b71StqNHKyztDgoxl1UFTnHh2YS/M+2T50Tj7xs6VNJtMppGZCSeMqk
	A4tIWMRtLQwmsq+zo3Jb46YTLWIniStnKm7E8QT3RLcC7KOZa5s5k8KzJil+vipz9DpEdRm133Q
	xIwqjRgTfyQm4+Iov5tqKMjJ7IDAUDJn9DIre6DJjEln8IFepfLIDJaCvfqPF/3+DHV0a8s92LL
	QgUAkjb80zLvhEc4lQnPhyrWMWj0=
X-Received: by 2002:ac8:5f91:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4e576a4b14emr103259491cf.4.1759762491503;
        Mon, 06 Oct 2025 07:54:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMZp8szVGdIhRKHbYb8bm1B08qHNDYnBZVyPSbgnUlfxnyi7acZND4gc1ucbmgXBp9HciSEQ==
X-Received: by 2002:ac8:5f91:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4e576a4b14emr103259291cf.4.1759762490824;
        Mon, 06 Oct 2025 07:54:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa035sm1134251266b.15.2025.10.06.07.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:54:50 -0700 (PDT)
Message-ID: <8e871a21-5f1b-44c7-ae53-733c91e34471@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 16:54:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
 <74446713-15a1-4706-b3c7-801724467575@oss.qualcomm.com>
 <4bb1c10d-b8fe-485e-b4aa-faa43033be76@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4bb1c10d-b8fe-485e-b4aa-faa43033be76@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfXyK3eXbdJLR4B
 HykAsArIKNXXddBf0m7eZSaJmd54SP9h2ihhfwztd80zaDRxJb0NXW1W/6a5+4IUxDft4k7Mabx
 UlWiEQxSfPqEPOMAat3ZlYXrCYQuN+jb8R8dYizkBL6FW0tREH9ycwU2irdqUjkKYbwCm1/5HVg
 HdsZE6jTvYqlCfGuYEHPOwnSd6yiZNg1VPjwsJcdf350AAKQIWaXsOtJN8QWdUJMYjRLDR5R/so
 TV9yf0BcXNBjJMgTeJ7MoIi9rfdYfpgsLHKGdE0KPLSdy5wQGn4Eg4IS3fSPnS9H0cS5ywzhxU7
 EkLHV+MwGSTJYsGrSlriyQPD6TgwKJkfHwr6itNssiFyxzRBGarvm+Z3PrM0g5RaK5TwnwRAWPD
 1mPhGVnelwHGKDi29XBFEZAzF1ADFg==
X-Proofpoint-GUID: XH3nPfPRj_y90stJsnyyIQ3PQdp6BUCe
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e3d83d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=TjnOBVPGGSnGA_jfKqUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XH3nPfPRj_y90stJsnyyIQ3PQdp6BUCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

On 10/6/25 2:50 PM, Neil Armstrong wrote:
> On 10/6/25 12:08, Konrad Dybcio wrote:
>> On 9/30/25 9:39 AM, Neil Armstrong wrote:
>>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>>
>>> The routing of the lanes can be:
>>> - 2 DP + 2 USB3
>>> - 4 DP
>>> - 2 USB3
>>>
>>> Get the lanes mapping from DT and stop registering the USB-C
>>> muxes in favor of a static mode and orientation detemined
>>> by the lanes mapping.
>>>
>>> This allows supporting boards with direct connection of USB3 and
>>> DisplayPort lanes to the QMP Combo PHY lanes, not using the
>>> USB-C Altmode feature.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---

[...]
>>> +    { 2, TYPEC_ORIENTATION_NORMAL, { 3, 2 }},
>>> +    { 2, TYPEC_ORIENTATION_REVERSE, { 0, 1 }},
>>> +    { 4, TYPEC_ORIENTATION_NORMAL, { 3, 2, 1, 0 }},
>>> +    { 4, TYPEC_ORIENTATION_REVERSE, { 0, 1, 2, 3 }},
>>
>> Would it be too cheesy to check orientation based like:
>>
>> static bool qmpphy_mapping_orient_flipped(u32 *data_lanes)
>> {
>>     return data_lanes[0] == 0;
>> }
>>
>> ?
> 
> Do we want a proper check of the property content or some random check ?
> Sorry I prefer something formal, since perhaps sometime we will have
> a full lanes remapping available instead of just orientation and if
> we have some random input it will explose...

Well you already list all accepted properties. This would only (slightly)
limit the amount of storage the data that you *then associate with it*
occupies, but I'm not going to die on this hill, do as you prefer..

Konrad

