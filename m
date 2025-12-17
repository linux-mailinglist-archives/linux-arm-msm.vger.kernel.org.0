Return-Path: <linux-arm-msm+bounces-85515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6ACC7EE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3234D3008BEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022DA35E527;
	Wed, 17 Dec 2025 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCIYQNOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IimxU8ri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737EA35E537
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977670; cv=none; b=HFEEqsd7Qccit8W2HWLUtdNujeWsuvG2VEP00trUpajkThR2HjtlD2VhQ97fHORB+s3tB3HOAJhvVBWGxXJ+uSu3nznNDiWcMw5+kEg4ezgaaAabSCHH6StLh1m7zwQ9cHBGxLWInDg6dzsnYxFppJXSekNLJuedLOiSf6R2Iwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977670; c=relaxed/simple;
	bh=PrMJYNtWuDLiGCMX+bzXs0NDArAg0Prs6L+iwEdRe3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iUxgoL04ZIru+YIcwXOzT2iMR47hVZE0ANyl+NpYa0MgohGBJMHqM87SSE36ThCTLoOfVr/K/U9UMoGnVaxo770s+TKvMR5zOQAG/fBhpcTlijSRl70coi2T6/xrDFJDIevp4zyLMYdfgOMwon7IiL8wR9plSeQLlntwtIzRXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCIYQNOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IimxU8ri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKvfV2465252
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=; b=hCIYQNOESCXFCU6p
	YKEuFyRLxurXofKMTnPM6vkrbSDP2L3maLCCXacWh8c1Fp+lv6QLnho7LJI4kLtA
	TCRYYz6KahCduqLm91Q6aREt2D6HZPsl6L48A0exhuX/zheING3fQuxrFaCsdu2f
	2IKc7PE3sNcDETH0g4EwJ/jRMStJGKPfiKWYK5MTq+s2ECFmlVXG6w7fKPWd29X1
	3bnbrL+N0Yy9qxZKZTkNM1Y9OrxhU5KpOtawmTJZHSZ4P2YiahJnWHgpnOMK/xKR
	BD6KYtzZhmAdLiAaywOEIS37pOxhmM6b4fp8fPRYikTo6Mlji7K8m+dES/le2eDh
	51rEbg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2agc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:21:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88885bc90a2so14835856d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765977668; x=1766582468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=;
        b=IimxU8rife7fHu1RtRxHL/uagIMP68hqpguNpWRUQC/mbOu5iyjwfCh4ogm7z9n336
         NaMblpROYraC7qgV4mXFTwjfv2lTuQw+ko7/d83ebhwQbkyan+WrxlwO31xPyCpYWiN7
         DAtyD3XByEmev3q477369PLIfJDOjbi9YQFT5AY/MsdjbrkzR6I7ExKXQ9A0V4WartxU
         Y6W0IqV40RoZSSMTDM8hfaXgWxaLFDFDEduxzFvptlDj/S/Q/xpvVZFDX3yDKlPCoe9i
         jd4ql/CteQQrDh+YiYC13GSXpsjP7U3R3NUznjcyeCStt/Tp9307HFMmyTdkWRZ3dsHb
         kVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977668; x=1766582468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=;
        b=k9+O3sJJPCPaGnXmUPAl1p8kQ1iKEbqNAhYR0s+NSyHNjeNjNLYHB9n7bJ/QnR4GUT
         eKxMx+BB/UWl8EbUBM5sj9XK+5k5feObQR+UPb3A8SqjEDuQvYpJNU4g4rxHqfOO89mH
         Li8OskpKXOYP+g+ph9MMvkFqcrXfqsgOocLpxBBH8GVga0m7zhf3ctUp13WYgT4W61qL
         An5eKXfwYEoZpDOPt2nhHZj5EqzTWucYLjfawqd+ZNarv4kmn5HixBDB+6lrBImCa+w3
         6zwpu0BDzOeVNNFpeF3WMSE5Xxeb5W9mgoSFuxGFBXL4rWtERG4qFsl8cvcXxBZX48Vv
         mThA==
X-Forwarded-Encrypted: i=1; AJvYcCXknenCDoKiJAaEv4/TznFeW49OmJqH50yRfVxDGDIIW9xh9yQxaFe5j8jpIAlnDLSYOBZA8aUvy6gpL+Q4@vger.kernel.org
X-Gm-Message-State: AOJu0YypbOqR060tyMVw2IbNDVUrRVuHRLddIOxpzJkkXAUXcg+dTzq8
	ugHuREwblvA6bl5WEwGUHkDzEZ9yCAxLSlvVBJGBWsf6tHyzO/wJ17nwRfaBm7hvRu9exrMydjK
	gjAiIi4WkByESy5a4maJVD37yEoEYoxZeft2K2dqaP0w4qivGR5D8wNktr1WWW2lSqHIy
X-Gm-Gg: AY/fxX7D0fDGV2VEPBHWb15Rl4YUuiAhY2kYT3kq48UhE8HAsR+Wxs9Q4SgVLlsrUKq
	leT7x0aTgZHcLGOLeZCLjQGMIrNBDxBnR326LqDiSPyTcbHxxSlKxG5TtnFciKRNslpkCCpzEvJ
	L5baruO7FstULf4TrsFhALtTnGGG19lRjj2qekVyvo3cM1A9zecapemwDM3wlwrwFTVh2RTvdnu
	y2tiGYjmDXQpA3mZChfC5CG4nWf/mSLQgmYLHE+gp4vhtakz++A8QnJftLFU88D9+juX7pOrySS
	YCVYpbJ22kVZkwjqJQBphd/A9zfXJHkQ4S+1xcTRmBtZdaGd2vi7ss5qtltOGup8Iw30r8JTAgO
	fIJh5GGAuobGXvGmfoygSokfUaEPFKbNIztIas5IgClv78vhMT+Vz7JHR/jTMQPfZag==
X-Received: by 2002:a05:622a:1191:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f1d04b1b70mr183152661cf.1.1765977667824;
        Wed, 17 Dec 2025 05:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsGyEI9MqyBXHu9MJGYHVWFgi9POwUHY6EBl4git78m54J9h05gobTJiMeDB2CkmGRH8oTkQ==
X-Received: by 2002:a05:622a:1191:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f1d04b1b70mr183152181cf.1.1765977667204;
        Wed, 17 Dec 2025 05:21:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d0b20sm1997438666b.64.2025.12.17.05.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:21:06 -0800 (PST)
Message-ID: <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:21:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -kDURy28OR4BFxvca5kAKuGxw5GI6jio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMyBTYWx0ZWRfXz3HweuH0UPA8
 6uURS1aGZiZ+tuGiKW3Z2BAk+ClxnDcfuG/s8q9k05DFF/TyHAUKoS48675BANFe9ErVNRdVRAW
 /AyUZH/gELWcl3+7xJedpCgjLP3GCRG4P/7LSzvpojAz1bdueK4Yel2ihwCTGpo4QjTPf9PNPLJ
 kwu17s+sHRU50/8q1ojVf19ZRgJV8gsxwKZKabyjUmeWbi4NOvwjsEOmGjhDJ2jy6z00z20Tpnz
 yHHW5+8wKK1lbia9etvyAem7USS70e61qUh0impjkuM0VvGqQ5EGWBOTSUY7EohCUjxeBfKhElO
 jEjVluWGYY2iNzT1zknqIBeKJpUsEOjmKxmwwUQPe60x8aIvTdJuTm6pZp2HbP/NbFn84VwFEWQ
 BM5LTYhg2eeQfv88D8Q/M41m5IPezA==
X-Proofpoint-ORIG-GUID: -kDURy28OR4BFxvca5kAKuGxw5GI6jio
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942ae44 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=37dNUGJFtcrBIb5saPwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170103

On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
> On 17/12/2025 10:32, Taniya Das wrote:
>>>>
>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>
>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>> matter for choices made in bindings.
>>>
>>
>> As it is still a clock controller from hardware design and in SW I will
>> be map the entire hardware region and this way this clock controller
>> will also be aligned to the existing clock controllers and keep the
>> #power-domain-cells = <1> as other CCs.
> 
> I don't see how this resolves my comment.

Spanning the entire 0x6000-long block will remove your worry about this
description only being 2-register-wide

This block provides more than one GDSC - although again, not all of them
need/should be accessed by Linux. I suppose just enumerating the "extra"
ones in bindings will be a good enough compromise?

Konrad

