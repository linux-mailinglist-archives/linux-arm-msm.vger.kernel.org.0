Return-Path: <linux-arm-msm+bounces-44731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4218A08FF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 13:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF203A8BB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 12:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78215205E37;
	Fri, 10 Jan 2025 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrqKtTVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B96205AB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736510789; cv=none; b=DdNEw6Bg9DZuZnXn+G+xO4wj0lBAL2KQba4HBelzVUay+Ec9hdu+1wlZ8LLVIfFvm40ozQdTsbkuNF1KG8syyDazYkKrkg7ncr00tdrUAueHzt/ynHMybZR7OuW6q7BhtDTF2bkvCin19o1AeXHTOsd/CQvW63Qcdlr7ttFbjvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736510789; c=relaxed/simple;
	bh=58FxKuFE5UHZfS9u02vN8sWB2C6Arks6voEKW1eUn9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCJOkdnNzzLEVk7ZQypSZwOnVJpVkX2/wABDjwW/EIBRqfnBHLIJaLeF00Uo2Ij4XCzGECap+2+tcvErzdUKJGrM+QazV9CNiL7Idab3UU79ZMPwyVGblhEFKUDjyffcLbpYQOGXmin/acuX1sz0AiZY8B0POW/iW3dCE2YBklQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrqKtTVU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A9EgC6011861
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+HuAjVYpXd9tYD2PVLCBk/7MmZqwkyVDyJvC+2xl3s=; b=nrqKtTVUF7hayyG7
	qzYNGLBkkKf9NKAfVs9tCg2BIAed2dzZ6LbALqnUd/rY8T3VGEqeUxohSzMrgPrF
	RXIa56SvPyRiMZ8BBHAmk4U+IH+mwZ9rpxvCeS4672go/rOoj6wAJweA/HqpobzK
	DRLVidYJMyhtgCo+b6dCV3Ivtfkm28K30P3AW2xTdYTakV86kgDp2IEbHFOVAasV
	eACoWER7WesU/08wgt+//YEhRknxJ8RrpTDlVZUzkDKB0BPnsDD/XTQ1gLBTQ8iB
	AiAs4AhAduL6hFp/1uE5hZEyEYpFPhSi3rGCPNgw1QORZgsvsFDXZNqOTrOTGp2W
	9dTLqA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4430rfgee3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 12:06:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8e7016630so5501596d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 04:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736510786; x=1737115586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+HuAjVYpXd9tYD2PVLCBk/7MmZqwkyVDyJvC+2xl3s=;
        b=KweWzngHxIEkgAeUmlt4OlOdk36fcGH9pduhw+3lF5owHUevI4BKP/YhdXxeo+pM0R
         63xFDrcp2oPAMbdxDSot+o8OIGXJjpKbwWn9L4UfJbZ1jmZbQyt3B3SV+mbb0dpbCi2D
         89LHjaPWJOdxq185nBHWJLndjIDy4n1Yuhei7g8esosKQTO8xw2IceOXmIgaqQQ+o7VF
         5qCkaMSm5a6o6umJUgwkNkU9h//8TkmlIpYMWkuOBLbkOf991HfNenjYG3553h7becue
         KKHjvQeBOEv5TNT6MCghiI1o6r0RmfX5Ty1FzAXkcxeoACwnNd2/o5Znsl1YzDJGc3k/
         D31g==
X-Forwarded-Encrypted: i=1; AJvYcCWfprQjqyw6smqndygjfYbhn7VoppCB5XApXL8nAFWvdBThMrcZYOHPgJdKTkpqHzVRTzdTSs8D8mtvLHwX@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWvAAPb+hLAA31uGugZLt7m+bP6RGbvl5wXSGtnUnORBzYuju
	JYsfCFcu/Y2P6yE5tlZIwXS0GZmrBnl0/SkfLPNdAuU1r8u1ocw2rSt3kNirQbxcXp126KYlT40
	hjvYlfpssZDmnwmCPvOrNia9y+1O3NDApEmQHKius4wqSBHj7HnS9EmSpfznCphYT
X-Gm-Gg: ASbGncu+WDyn2o2nwoRCwAhKFUVZrBZ+yxuTtPdgwT5q0RHsjlZCXpr+h9p8+fnLgUH
	b/TqKKVztKiYijp2s74TbYfWIKMFFpT2298rdJrC3DbCAPFCAdtlaZQAv9sKmXF3wPJ2SRQbZ+9
	wjYqZ/upEwz4QR5CLIGrGA3Rj44WzAd+FFb6it9Xa1vpoloRemyyzdrXLYgzqyKwPCm0eNP+7H/
	T5vUfD8kgATxCAMFUUb/jdVKnccQd/Yf5v0Zb1eErg4pS6XbxhIzJ38m+j/ZrRKgKfz9k1EBspa
	q6uglMjXJjf43A77VhM6BQ0/szStTS6AKcg=
X-Received: by 2002:a05:622a:199c:b0:467:85f9:2a67 with SMTP id d75a77b69052e-46c710a9aabmr59344021cf.8.1736510785687;
        Fri, 10 Jan 2025 04:06:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdt8AcvyR/ts8no9wOkat6iVC1QOs4wy80V4lSEAw0cIlpw37qO84MdfTeqA7fn2CaCJGSjQ==
X-Received: by 2002:a05:622a:199c:b0:467:85f9:2a67 with SMTP id d75a77b69052e-46c710a9aabmr59343841cf.8.1736510785225;
        Fri, 10 Jan 2025 04:06:25 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9562ea8sm161470666b.93.2025.01.10.04.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 04:06:24 -0800 (PST)
Message-ID: <6e1ed6f3-100d-4e45-a9ee-251513749f57@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 13:06:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: add missing cache node for cpu1
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250109-topic-sm8650-cpu1-missing-cache-v1-1-0e85148a48a8@linaro.org>
 <549d15ae-34db-497c-89d7-c9b9c18d8681@oss.qualcomm.com>
 <99747e37-1288-4d70-a678-0a73bb4c3b3f@linaro.org>
 <f105e797-4b78-470f-95b5-6d6b025dc576@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f105e797-4b78-470f-95b5-6d6b025dc576@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J949fuJITYVVtF-qstbIcxHsp0rc71Yt
X-Proofpoint-GUID: J949fuJITYVVtF-qstbIcxHsp0rc71Yt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100094

On 10.01.2025 10:49 AM, Neil Armstrong wrote:
> On 10/01/2025 10:44, Neil Armstrong wrote:
>> On 09/01/2025 19:30, Konrad Dybcio wrote:
>>> On 9.01.2025 4:24 PM, Neil Armstrong wrote:
>>>> Add the missing l2-cache node for the cpu1
>>>>
>>>> Fixes: 20eb2057b3e4 ("arm64: dts: qcom: sm8650: change labels to lower-case")
>>>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>
>>> subject: missing `sm8650:`
>>
>> Damn
>>
>>>
>>>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..832f3a2c400e8348847bc24b27397e2a0dc08db8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>> @@ -119,6 +119,13 @@ cpu1: cpu@100 {
>>>>               qcom,freq-domain = <&cpufreq_hw 0>;
>>>>               #cooling-cells = <2>;
>>>> +
>>>> +            l2_100: l2-cache {
>>>> +                compatible = "cache";
>>>> +                cache-level = <2>;
>>>> +                cache-unified;
>>>> +                next-level-cache = <&l3_0>;
>>>> +            };
>>>>           };
>>>
>>> You likely wanted to hook up this new node to CPU1 as well.
>>>
>>> Reading some Arm docs [1], it seems like with A520 specifically, both shared
>>> and unique cache slices are permitted, depending on whether they're
>>> implemented as single- or dual-core complexes (not to be confused with
>>> multi-threading)
>>>
>>> [2] suggests CA720s always have their own cache pools
>>>
>>> In 8650's case, the slowest cluster has a shared L2 cache, whereas cores 2-7
>>> have their own pools, so this patch is incorrect.
>>
>> Damn you're right, so the cpu1 cache should be linked to the cpu0 cache somehow
> 
> Well, stupid me, it's already done... sorry for the noise and thx for your review

cpu3 should still get its own one

Konrad

