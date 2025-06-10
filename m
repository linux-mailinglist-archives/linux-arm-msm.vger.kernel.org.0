Return-Path: <linux-arm-msm+bounces-60790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D12AD38DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B10B39E4AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4192951CA;
	Tue, 10 Jun 2025 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drLTEoAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704A26528D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561036; cv=none; b=gP1gETqQjlvmB4nQ/AXI7GLsCqHYmsLXwHyHyzCmTfD1xBDjTIwBfg5tt7n4LxMlEPIT9a11sIweHVX/LVVIafd8R4Eswvd3v7AwPA2j/tJ4/aE+GMlxetxT75u40piQMiPywS6mTgjAA2MlfjtjLgkOfesqWXZRsQEO/+2hSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561036; c=relaxed/simple;
	bh=Ts0Iw3Ahis8cTAYQdc2ZByvjVGvAPl9GgjB4tH7AWbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSh6t/stLaCArsYe0ZVVWnfrPCnANtcijWmJvahwgb4Egup/bPLOxnBX9VAaJKMlnrEotjL6CakR/0pbsBqZ/GYH50zB0q0ZjoFXmy5SHt/GS+zjXl6vedxfwBYf4QTHDj9AVjbQ6AJ92AenFp+Xc6JEXwaWbCYA+s7a/8e8Jy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drLTEoAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9kMbk009358
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0fnG7LDpMxmNetZCySRTc6QnPh9ME2bTSyY151Npfy8=; b=drLTEoAgkWYtxu6q
	hEBfxrVQfeodxY+ZKHE84mxQAmMmwt9H0cpUOe3guT2WmAUOFE/PXsXOvGzhxEGq
	n1goPiQ2fmlaujKSI5udVE0+BMpna+WnXSHmQ5ynrzijO5eDzRBTIOUl8/oZRrLd
	50tc0QVlYp/nhgMn1ck88kyjH0EmIrbOHpMk/Sr9+nk1XjmtN7IdhmLLfxc1r7bQ
	YQdaMHhIiIErf9nBdNS/95Bhidg7sTXk5HruXlaC/FSu4yNGgMmg5dp0qcV512Bl
	4VyRTHJEC59mfBvcNED2JIsu9fGyCdYRuLa9mh6xUz8WyUEg2ckLfZW+wF3/uP18
	KTkZqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9sjrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:10:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so97870585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 06:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561033; x=1750165833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fnG7LDpMxmNetZCySRTc6QnPh9ME2bTSyY151Npfy8=;
        b=heK0UFAhOym1UpTbWaHayZ5n95Xg/ttLcklo1MsyzmucyV776+KB/H3i6iTkBocJo0
         4cJG1kb3cJcFc+xoTnR6VvHjOxvLi4Mn6CNfeUYFttkrLM1nTrD3K70MMZs6FN+WKEPH
         Ts55z8c2uQNu6i7xa0/8XiZ8deQOekGRURs1wchc7ecUoxmmR4/fb4al8DyE9SrstF2t
         /w8r5oHi6sxe+R+vjKZw4DSbEtTrFSFc57G1E27av1L1P1nsksoMGniJfJXuHG9plcXN
         nQ12YWmsubNn9vQgBKIL6hujEIJNZDHSzz79tuea/ITO6pPgQ5ETjyt/JG/qCipgPEoJ
         sR0w==
X-Forwarded-Encrypted: i=1; AJvYcCWjvNcPDp5rc7n4mKDl6N1aG4U3QvZ61yNKz/54Z6n4MIuBT/hsYxGFSIH/POWn2PXntNFCKzyFoEJgSu/X@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf45KqUOao/LBQ7n4VXJQQQ3Nb6DKJY7oEo9HLTTL8y6BG3X3x
	LTQk4ix5kNHDjBy85FAQZYDBqxl2GX6XxL1namauh2OhCymCv9i9dOtATZGYK5/fCxQkQUIKg4K
	ULHCSSmR43fW/0HosFfcuvU2iKDugCirgXhNFujQmFr5sbecuKAmUaK7z8X5F7R8eME5X
X-Gm-Gg: ASbGncuDgn8p5SdwUloNVyoLLmwhVRHR2kLA4rk0Ima4+ynMoIvNXBhSscJJn1wQuWk
	u/PzaS9irpU8HIVUJEH+WDUWBg/41iqwvqrL8dIfexDXqR3n3S5VrG3YbBGR4JY2J0/d1EVzvKd
	XxHo1GQFksrH3VQazWd3bWSPqU5K1qIB2BxPmkdKmmt82UVBGjsz30GvX1fV0A7flJEib586mhY
	RJNL1zrDA6q/30p4wpZy5GQDh9r9Spsy3sMRulSDCWYUAMT5wJT3YyTBAZ/Xiaci4pYjK/3rOQn
	2ap6oTmD9yr1T5NFQZMntxvFMPC0j61aRolI0doyqNMkyEp6BVpoflNTj9DNldCkiGUCnGdl7NO
	x
X-Received: by 2002:a05:620a:f07:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d33de1d9b3mr786601485a.11.1749561032649;
        Tue, 10 Jun 2025 06:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp/WxiFPl2Uz+B0dTc3m6HRocZqolxA8939CdsdLCwBpvayFGBjAVHPZ8s8uQ5zvefRraTMg==
X-Received: by 2002:a05:620a:f07:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d33de1d9b3mr786598985a.11.1749561031741;
        Tue, 10 Jun 2025 06:10:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38a11sm715239266b.116.2025.06.10.06.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:10:31 -0700 (PDT)
Message-ID: <74b7aec6-b76f-4296-b212-0e417fbc89f1@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:10:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: dt-bindings: qcom: Manage clock settings for
 ADSP solution
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-3-quic_pkumpatl@quicinc.com>
 <171b980d-9c50-4891-86dc-e30d712f5384@kernel.org>
 <13b9cbec-3d7a-4deb-b356-685e73fdf2f1@quicinc.com>
 <a126ee43-3e2e-4cbf-9c36-c41415df78af@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a126ee43-3e2e-4cbf-9c36-c41415df78af@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2ODA63YkFDGcfpkbrtwhfTOCPT-pi8EK
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68482ec9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=q4Xfe6m8orEoT7kQ_3MA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2ODA63YkFDGcfpkbrtwhfTOCPT-pi8EK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwMyBTYWx0ZWRfX3Y6qiQQSCt17
 uAfcnIxSLitrOEIugWNNrNnEV0+JvJ8S5enmX6lkixxx9xWlue8i2mORZa5E7T1MT2WwgDDL3zR
 1dot5bNObt4FoqAjGCEH3hIb8QYdhOj+xOrVb/nysxF/PDE4trg8Ajw6L6MPCY6exyn7ted8aX6
 fPUZsrhfa2ZrthXw4+HggnPouxRcjrFpZKmwbVvdZX7UJJa/1jqS3M1OYDYuZbZ/eqPVHPZ7pUC
 m7n1Xm8xRhdyPf8cIuOiCkwuXP8tLGnW4Hi7v1mS8Ofo0PT40ZuGpGTyEmuhXvVA1BgUSEmCzDN
 nlmTo0JUl/YeqbQWegq3of/REsI97XqHLpKbzu7NgxEfQ96VpnxHIZ/HePjXeqdtWjLYA+2OaC3
 D/Z2zAF2ZdFgnj+OJ3LG1dI5u+ASVx1iLqUBtEdCAHn/aLVY3Rh0OTCPAOaG1enTE30zF7ND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100103

On 6/1/25 4:50 PM, Krzysztof Kozlowski wrote:
> On 01/06/2025 14:45, Prasad Kumpatla wrote:
>>>>         properties:
>>>>           clocks:
>>>> -          maxItems: 1
>>>> +          minItems: 1
>>>> +          maxItems: 3
>>>>           clock-names:
>>>> -          items:
>>>> -            - const: mclk
>>>> +          oneOf:
>>>> +            - items:   # for ADSP based platforms
>>>> +                - const: mclk
>>>> +                - const: macro
>>>> +                - const: dcodec
>>>> +            - items:   # for ADSP bypass based platforms
>>>> +                - const: mclk
>>>
>>> This device always receives same amount of clocks. Hardware is not
>>> different if you decide to not use ADSP.
>> for sc7280 clock handling only supports non-DSP based solution, macro
> 
> ONLY?
> 
>> and dcodec votes are placed using CPU-Powerdomains. Which are not under
>> clocking properties. In ADSP based platforms macro and dcodec votes 
>> should be placed from ADSP.>
> 
> I don't understand this, that's barely a sentence. Anyway if that's
> ONLY, then seems pretty fixed and I don't get why you make it flexible.
> 
> Expressing clocks as CPU powerdomains is not really correct.

I think that's some jargon for "power domains controlled by the OS
running on the CPU".. I really hope PSCI has nothing to do with it..

Konrad

