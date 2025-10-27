Return-Path: <linux-arm-msm+bounces-78902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A7C0DB08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5116C4F5619
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E3C30DED8;
	Mon, 27 Oct 2025 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1r/83dx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C488130E0EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568993; cv=none; b=QNs4HOZIzpmJrnJtGP870Ggl13Hyf5gQsL3cddWL6U7SCS3bSc7bbr6zZTC0RQAXHwnlrUpYVRNCwsreO4ALU7KhbKW5zqDOXbdoZs8d6O7pFTm35ixxdJC1omom4Xzw5yxIDrurxPsi0cj0rUD1MpJ1uw/Jv34I9JYHsaRbDaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568993; c=relaxed/simple;
	bh=HpERi5uGFKaxtRcnIprvxmoHJmzJgw/6+EovG8r7mK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Guxbw/YWbHWNPmQ02kSsj1a64vSAKCd023JmgNcS8bevajFYUN0XK1Qzl9ZppdTDzPoJzwhw1B4en8+NZW7ihEO6HnXIcrTdrkGjGffrJ0MMxbSXGnUpQ7hy5KVI+Z0WeJAx61H5ljNM6oh9ho/Uy5A+h+stYEfM/e69li7U9Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1r/83dx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84ehj2232090
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdjmtQpetkz0YQn4BhbUe1OxkW0bA3u5wuojcjr81Ic=; b=N1r/83dxtRdH1PdG
	ld+vkrqOaa2GEiTAQUHgYE1tyMwJu3czrggpwQVCcOPbPbOcGSYZUofUgMs5Fox/
	o2F4/lpx/IkAe01l7HeFUzg69lLC32wCuDWwXr9rz6LxvSakesAojLTmf+XNbG2U
	aCv6gFavGvdqJsF0sxMrQPDPg6gSi1peGzsLhkAWN7SJgMXgVdUXyQSaeJByFY4R
	w1G9Vca4fBrpBtvOGyoD/ftKpEbjR2Buh+9A8nGonT/ZLbllZhIO3eR/Fx9h64Dx
	741FCKNv8sEa4hAOe4UrTw4XCuNwo18YSleuJ17FV1bmWGxuMqYuXrVlKmY+EFZO
	BUS5Ew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn8s23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:43:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-883618130f5so205761885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568990; x=1762173790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdjmtQpetkz0YQn4BhbUe1OxkW0bA3u5wuojcjr81Ic=;
        b=IHq6gFJxBszet/Ppi0sHEUhwvv/0lIypRm4cTkZyrt4GOBh7tY57PjTaCIKLDJk0kA
         BAn52Ltv+WADNwX66XAa/Hq10f0I8SEiHYN8jzE2l6aMMDYn6wJZM4PMoRgqxzDFexrX
         Kb4WQkiwkabGD275dqM04Amjgi+YQFJEqY8do6tib45J+uPC1lkpxfCTdjTSG2ZsWhVG
         PuxcFA+7rRwzg0nc/jwHNJUixwv3lJUC+7NIzjMQRhxS5vS0vxVYRgR8FgbhMVzBfFZJ
         z+Ay+Gy4Qk/nj/J1knRuKrVMltcb9FZXTyEfZcRHOQkZusRN+SI6ZUelGKXoo3RkOb8R
         3P3A==
X-Forwarded-Encrypted: i=1; AJvYcCV8Fb0qHiCIIQYOBXCVK741uOp180s6GLOALJoxzVx4IjrBcVhdMgfBZytPWHabzDA3Z0dzecX04HumyRfM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbv9AE+n3cB3i5LhIguJfCCLmrBO9lzD2nNd+7ebvREfLX9rb2
	WGwUvlMQs421VFMopHqERbdeIQPIQevEXCy15G4AdCkGzBdd59ZDnHcskWF3Fcr3NUHcBza1xhj
	DVj1mvo1DW9t7hsBzRvEiQyxBfgo9Wi3M6R46DDjXqEJKTAxzJqQKGDbnnK2R9XN1G7w3
X-Gm-Gg: ASbGncsUlDypmKMe6aongnhk75cYO0WRvFjzr62v88Ka6ab9GqmROp/2VHkZK3z2SK9
	0andy3K9d1E+iyPVGZRjZhlpRSXQc1onpOO+lmSRKv7nZ3XOY5SpecD7WJsKu/I48D5S/jq5Nny
	XXH8oWCAPQ0SVGMIob0NYEaztvXCWm2b2JkG16ruFVOm7dpFzvUfYNB1qtf7pU31ol10vFxpoot
	NtlGB6H6kaPTa8NuPP7Hifv6yFAYdvSodlN49Xzf46gbWj2Zu0PSSljBl84aJ6BKSH67QlQf4Tr
	g8NAeb25JRX55PEFj9+0Q7bg9PtyJr72mLWsMRCZOVc4GAGJaFxfh/xo2OKzq9B4YZNs6TAPs0L
	TI9Elw8vhFhX3LBTXk3wt+JrECPYw/x/dSbsToBFnuHuR1qELzGvnLVyx
X-Received: by 2002:a05:622a:1a04:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4eceec8f9cemr45634561cf.7.1761568989547;
        Mon, 27 Oct 2025 05:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1HqeE9MvodZNYXC7WwzDrvESBdzQm1TEemMfGCepQyLUEGzFaK7Rb8u7ydwVzQs3atb4nNQ==
X-Received: by 2002:a05:622a:1a04:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4eceec8f9cemr45634011cf.7.1761568988857;
        Mon, 27 Oct 2025 05:43:08 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d854763b1sm747106966b.71.2025.10.27.05.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 05:43:08 -0700 (PDT)
Message-ID: <82971ca7-8f52-4350-947f-309e913a6886@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:43:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
 <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
 <a3808dca-2356-4871-83e8-c535cd0cce86@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3808dca-2356-4871-83e8-c535cd0cce86@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff68de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=7pKaQVV4AfFCDnn0ZdoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oPLgQms0-voaROuP8jtSbFSyaO3lXsao
X-Proofpoint-ORIG-GUID: oPLgQms0-voaROuP8jtSbFSyaO3lXsao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExOCBTYWx0ZWRfX535UtCD/VhbP
 DXBbbspA57QzkfWHe1jNjSP6+MzR67sMcaappd2FKrp/cH1G7aY0CwtVeAIVBG72Cy4U6DJfLQP
 k7HqYe/oIKXaOHEsYu9VXwvBlAPK5I9rB7z6gbgX/a1DTSWw/YIftYeKRgNs6T5MzrdL7orV+PD
 /O5wBEnMVxNsczO6TsX0VwtrteVGlyW1DG+ULt7oGCuq9iELec4MiNnXCuWCZ2UrFJrufSCSEe9
 W9hNp8MO//sRwBCxxfni4I8SZ60gTWjx8yn77l2yz55A3La6XHfT6n9RSPYrF3sd8rYxBrRDfT2
 EuhtzXMjViI5wR5Th+WzbWLmGC9ealFKJVMy5SNgfR/X8YK8Pvu+lcWI0xUl7rsAY6b8z/hK3aI
 HLqryrAzMBpkLrnP2EK9IZtPLtpP6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270118

On 10/27/25 1:38 PM, Krzysztof Kozlowski wrote:
> On 27/10/2025 13:20, Konrad Dybcio wrote:
>> On 10/21/25 1:10 PM, Krzysztof Kozlowski wrote:
>>> Add necessary DAI links and DAI name prefixes to enable audio playback
>>> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
>>> should carry respective DAI name prefix regardless.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> ALSA UCM and audioreach topology will follow up as well.
>>> ---
>>
>> [...]
>>
>>>  &mdss_dp0 {
>>> +	sound-name-prefix = "DisplayPort0";
>>
>> We should probably push this into SoC dtsi since #sound-dai-cells
>> is there
> 
> 
> Hm, that's important for user-space and represents actual naming or
> wiring on the board, so it is strictly a board property. IOW, there
> could be a board which does not have DP0, thus mdss_dp1 should be called
> DP0.
> 
> If you are sure that such case does not exist, then indeed we can make
> it shared.

On at least x1e, any of DP012 (not 3) host can be re-routed to any
QMPPHY output, at runtime, so I'd rather keep this bound to the DP host
index.

This is utilized e.g. for USB4 or MST. Or if someone has a fantasy for
remapping their PHY<->DP links for no good reason.

Konrad

