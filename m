Return-Path: <linux-arm-msm+bounces-67781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E3B1B35E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 14:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4BAE7AE5E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 12:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029CA2727F5;
	Tue,  5 Aug 2025 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfGnsAWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAFB2727FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396804; cv=none; b=dqzaYfetJP7KW5TLEM0YBRWuxqMVTwcGkhz/V0QS0V1uYl16o0XiSpqlIEt6iF9cLIpIlizYS/W5rTryFHSKqg4ALweMp51IVYkm4S9nLPJF8RCo/PigvXfhZqa1h4czuU8L+3TTQXVCUv9qDYjG+jOZYe0sxDV5K8RRu+an3Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396804; c=relaxed/simple;
	bh=ljY9GgX/i79FhFLesLpbCq8C8FNyRyDzkOq04/esudg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK8BU4ZSbQaSWc3eiowGKDtVCeswmGQe9B/IulkIljFm+igPvdI/e0JaRkc+wKgi3mrSBKU1hG2yyRdawdTFQzWDE+Z2xkSMyvkl22C/VtFfoxsy+9MYKKfidKQCRUzNodL1AWRt6hR3cdwNAcpM//9tE1/WaLB7XXVps9O8/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfGnsAWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AKTgl017446
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 12:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czu/NJl1TSk2ux1ztbgQmXFWRXTjEbgvSc5lgIlAp6k=; b=PfGnsAWwjxFVvuQT
	xQywcKw6H21EiUrZf0wnqGK0l7ppANpNEuef4mg04aDRdV8rbfwjwExO8MGrkpIq
	exXNMUw76Xd+JAAqO/Dapfsh/EIkSuZV6oJPz9nZaoo09V1VCfeWMLKOkGZtVmd7
	OFeGE7bgJZM3BeaFkEbtjLDHey+ccN6NnnX7TkorlaieHHoF5ekISPye2cABWByO
	zfKBNqCW3+bQLb7QNOqQBTk47Eu59AhdqpflotoLIiJRX+OEeakKKToc0S249go9
	AjLSwGj8eWset1sKHYK793uWzD5zfLsYgdZxrbeePcdd/Yz8e+QjNCIn0QInCMFC
	BCsnjw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv4p9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 12:26:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e698aaff5bso10348485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 05:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396796; x=1755001596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czu/NJl1TSk2ux1ztbgQmXFWRXTjEbgvSc5lgIlAp6k=;
        b=gpCnBoO69+BgORJd1LxY5N7fVtwoRV/Gf6gxXFNbHgKEIDiwRD1YAFqseIW6uZkoO5
         9IqbR9IUAaGSHrbEQf/rVns64yha0A+yVxrMkC2GdT6sL8eNbWpESb79LTw7j0z5FV4F
         u0i3vvelnKQfMrFiTiC+IU8memEX7g5y2PMnAI2gOhHdrKNPnEun4/0YzYN07wzJqJE6
         xMr0VaBrsIHmH3eUjHA4dnPbFhZ/OGPuwWYOOnp8jv6dZm5m6kKSapX8xZjjBVluUOK+
         VkSLPQ1NkSQd3M5hD7ub70VqbY7SZpst6T1jSYXTmZsSTE6H4GCuro44eEK3Gv661FGX
         a1aQ==
X-Gm-Message-State: AOJu0YyZf7ygsK5PcbCzO0EWVo/ixDHwBGws7320ok9S5ZQjNHJXlgZc
	b71BU/0CTrHK/eO8hsg3PJGsjWY056w43z3FLabPhLzTaKNaLm705joF0sNprdzezGfgVj0abrb
	KTQP5GLCHbGRmCfgqRfEmtw7zFM6ZY1TDA7UcaTwkCxADR674Abmz0S+9NSEYcDDgN6vS
X-Gm-Gg: ASbGncvlqf35RXa/FkisbQUjGN8xwwCX0ZYvysudPk41ZhgQaAoCo8QQx/pj8xXm3tG
	4lMyw4fX+CBR7OSgk6LShyh7V1S6WugcZ5sg5nGJwR8mk1cKZilJWndiH18GeAfzXRI+TaZrPU4
	IlFJgVpLjgHwLfi4ZXVu5YnlIibqDAj6YUppmUnhDK90skRrqAWXTw40nZjRJWcMWEPsHIcYpsW
	IWXRF3Tb3bZt+WgFTz6344/IiFu47LSrDevnSwL8++r+9HNBe3fOumdfAUvtkZu5OmTPSCJ2kme
	Gzr+WrsxRs+JP1R48jZRaUxTQCda/nYFZ1TBYsUpCDTy58V3YYtcaVFXZAJMRLOz3/dF2/AjjXy
	GqzCL44PMUdAIAjBO+A==
X-Received: by 2002:a05:620a:3192:b0:7e1:79eb:18a3 with SMTP id af79cd13be357-7e696361ef6mr807808185a.10.1754396796129;
        Tue, 05 Aug 2025 05:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTqvg7PKrg7RvP+PrWNatruiQOsWWUKhTaUzQtAhQa7cxHfsXBhsvWzXAfiPrDug+//SFE+g==
X-Received: by 2002:a05:620a:3192:b0:7e1:79eb:18a3 with SMTP id af79cd13be357-7e696361ef6mr807804985a.10.1754396795667;
        Tue, 05 Aug 2025 05:26:35 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b6csm896707866b.48.2025.08.05.05.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 05:26:35 -0700 (PDT)
Message-ID: <c93ab714-93e0-4b4b-b059-c48d4c689c1d@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 14:26:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: Add display support for QCS615
To: Fange Zhang <fange.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Li Liu <quic_lliu6@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250718-add-display-support-for-qcs615-platform-v5-0-8579788ea195@oss.qualcomm.com>
 <20250718-add-display-support-for-qcs615-platform-v5-1-8579788ea195@oss.qualcomm.com>
 <1f6fc7ce-5826-4f59-89d7-ac691a3ae785@oss.qualcomm.com>
 <7e4d9dfe-428f-4374-9be7-97123cf36e5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7e4d9dfe-428f-4374-9be7-97123cf36e5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PEEqRj0sFDci_nwFqAacN1mzUzrbb0AU
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6891f87d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lxqpRv2xsAHkpo9PiOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PEEqRj0sFDci_nwFqAacN1mzUzrbb0AU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA5MCBTYWx0ZWRfX7s5xdfDfEldL
 NRGKTA3UxwOaSQuXbRq8dbrHb27FCrwt/svLQPYMvCvwEPLC/gnwU8QiZOvAamFtY37TmTaaCIs
 Sfi9M79mZe4EopJvy5fc7OXIn/sMotminExvNp+unNoIBpycEav1/HyokGpvqquqSXEl8phaWiD
 4wILFNeNzpsTzvP5JqFMd4raE1eGDMoGRoYHU3t/+yJA77ECFCToqbBD5f6lMBplAWsLktKjhCt
 8f/pC1hRglttg9gR9jfUdKplbQvRIgCdpPY+TT/XxuPqm7i9jJNmgU6SXs7rpRMAxGh7oWfIF+8
 FlH/ZpmP4s94ZS9yuAaD9+vFBXvljr2Jca+HAtczUAuY/KuiRy4NnOs6x68ivLfh9mIfGU9GCHy
 OfqOpRXeWEjfrKCTFFw2FDp9rp8wZiWhI07SGZZ65DpuhpSVi/vt40eknmAP29juqA3eXbv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050090

On 8/5/25 2:24 PM, Fange Zhang wrote:
> 
> 
> On 7/29/2025 7:17 PM, Konrad Dybcio wrote:
>> On 7/18/25 2:56 PM, Fange Zhang wrote:
>>> From: Li Liu <quic_lliu6@quicinc.com>
>>>
>>> Add display MDSS and DSI configuration for QCS615 platform.
>>> QCS615 has a DP port, and DP support will be added in a later patch.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +            mdss_mdp: display-controller@ae01000 {
>>> +                compatible = "qcom,sm6150-dpu";
>>> +                reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>> +                      <0x0 0x0aeb0000 0x0 0x2008>;
>>> +                reg-names = "mdp", "vbif";
>>> +
>>> +                clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>> +                     <&gcc GCC_DISP_HF_AXI_CLK>,
>>> +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>> +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>> +                clock-names = "iface", "bus", "core", "vsync";
>>
>> 1 per line please, everywhere> +
> Got it will fix it in next patch>> +                assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>> +                assigned-clock-rates = <19200000>;
>>
>> Is this necessary?
> test pass without this, so will remove them in next patch>

You need to leave a \n before you start typing your reply, otherwise
the email text gets messed up (like above)

Konrad

