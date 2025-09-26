Return-Path: <linux-arm-msm+bounces-75249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FA8BA29EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 285DD4E0121
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775AE284693;
	Fri, 26 Sep 2025 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdeGhIFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DB7283151
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870400; cv=none; b=Ozx/SGRGaOT+cejhlFvNr1TYgu+duP6AmqDyaIwid4kvkP9+uNBZr50Gwzg9dFRuuq/tPUIoiDiQDhQEI3gyxEZZM4cuDFaQfhm5L21SMNKf03JPxhOqOTkvbxKY4F3dooSmAhcU+BamQKgvlsIO3fNEuQTSXelyfLgASrwqWRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870400; c=relaxed/simple;
	bh=PxIyYiPf4XBEPu58oCPBVQYBlGZTT3vIV7tjE0E41ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/nIEtPFy9yJ+hJm7gKGqZaNWy9IbFzcroUk+NyPdISRXMDSIGHYvctb4BPxjV5V3z65GGT/2SzBLIlciQaQocfEZSYW+fwKDVYwMCVrXaiL+vemb4gun8qYb5iezsYYmQU4xjmekD+uLov5SqRrxj3HLpzZrj/u+BfvmNFNfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdeGhIFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPeJx021553
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=; b=VdeGhIFrddl8aPhy
	qwsCpJ0VEXQf1zHy+ga7hXD6MLL/w6G4dRe6p7UminlE04zS6DC6yTcxT3v12YRE
	87lKfuGlSqUUy02HNh1b9G4IyIwdscIAjXsuWqZW//RycZpSMHjYyn+Adm1a9ofW
	TNuVzuUJrkO+h/lQjCmdCU2xwdrXxpEtP10ftclb0jcpQ9kZfnG2zGDWEPgq/I04
	hIKva8agjYhyqIUiiI3Weyi8f1JfymXvOdGaJ2hCQu0SWImyU/IlZrtRp1mqiZVQ
	SOyDWo6Ec5S4X2UXU1YJkHM3PqObcitwJ5t6NnzJPXMbbHo3JQUAjBQq1ObVCaIk
	8EQ9vA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qsss7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:06:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26e4fcc744dso13394315ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870397; x=1759475197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=;
        b=fBQdA7pz3F7KiHvU4eIvwQ+EoTGRsVIQWBw69LwmISbp5aMNE4CShDBKd9K2qXcs3w
         LKaLU2IPdE9FW2seiHSY/9Uhp3ywTBXlPL6/UwmlDOPjBqdX45lK4VIheZXvL4xbD/HI
         s+jDNJi9ny+Ks9DRv7lHcR3eZ9UjEreWojfc3iNdahtgROFCjKM5vLJw9klv5It6ISDV
         3FLSan2FVyVfj2HiOMvMKx6eOaFdU+gIo3e0RrEkHUbPjMDsFc+xafKcB4OTLoz9ks0h
         4EovsXGIRDPP2kNN7x0oDhWI9RgwalUy+W+vzjkMmnP8S01LtB2ErjpKAYugdwO9XR4u
         Pd4g==
X-Forwarded-Encrypted: i=1; AJvYcCUCHrOCQBK2M0s6ZVosT4KCPfJadkSoa5IhICRXcSgBiBbS2J/ZD1bPoPvT2OI+H+fFL4wj13pd5AQiU6c2@vger.kernel.org
X-Gm-Message-State: AOJu0YwpWob2olpdtG7YH/Je+il0MX3O2ECF7a1EfuI4hQTuyXn09QMx
	U7nwV4CtJdq7cNPRAfAdK9kUFo3P7WBWVY9hYXWBJW/9+MdC3KKB32SuqjTGfx2F3AeTqMWZHOB
	joDDoXqP2QOMCoF2W20rPwjOmwFQIk7TMQVN83GaiM9Irto5lKmYHPKbpUfPaf+UGQQDG
X-Gm-Gg: ASbGncuz+8BffiyKPiXIliopM4osHhrY2/puKRjiz35Rpr9FBEeospWSmYGfn8QG2p9
	LKvt9JGFW/rguZPA1AdarOoJ1TefaOyb1hUQ+B7LqnHKBWj0COie1bus8/UGEkpxGSyxZmW1yu7
	a7gnPQ17qpxR1gmDDvAUDDxvikoT52Lsa0MMWYfMshcmgaYbkJe4o3qVUWHVz2hWAMa+NnbyeA6
	2I3KlnXD9Hx/euYPTWGKNrttiqhZQWxUeeguLjKgls4KcFtYDizDsIIRlDxTQkI/qJWi82fz9se
	DCrCTM8uuqoPkV1G7+4as1KeJZDeoNsSHojdefxHSd4zHeTMSvVBgVeNDJHLej+siEMw
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id d9443c01a7336-27ed4a78d72mr67605305ad.59.1758870397179;
        Fri, 26 Sep 2025 00:06:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkrMZxqylZt6nJiE1ocYHpxscY4Q1brp546AbBdNAbAkmq0vd5XGrBNZjqUvbPQf9USLOYyw==
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id d9443c01a7336-27ed4a78d72mr67604775ad.59.1758870396700;
        Fri, 26 Sep 2025 00:06:36 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821desm45499775ad.91.2025.09.26.00.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:06:36 -0700 (PDT)
Message-ID: <5aa92e19-bb80-4628-baf8-887199ba2ec1@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nkckEVljA88n7w9b7HUpYkRB3LaOtnsc
X-Proofpoint-ORIG-GUID: nkckEVljA88n7w9b7HUpYkRB3LaOtnsc
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d63b7e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0pmg7TuxG_D_0s_mfB8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX6iliOsXEwSLh
 jWKhXd4fABUkrmcrTYKNfqGcPykCFMiarxcRacr19jZ53zmM3fZYOdijFNtWU2+LyLjo31fs157
 YCr1PF8y5pfOWfa0McQrJF4Hp+ahvjAqpTtcU1rX1+IBQ6gcvGsRWdlNOtPhcKLUiKme1/wnk4E
 QA2DsLb3YvcBmJ1T5RO1sSLfHwPMqTNh31PCUMx0sDRDg7XlbYHr7ZX1cBEszIj89yigkpwVlDk
 /Wg1Qy60ndtbcknLDgRhzFWyxc6Xe2UWwznq2W4YbpZ9f0bFfvqIOyftjWuMY00Kc49CZuxW2qD
 8iP9Up53rIFVq0YOMuG35UthIS/qiuVh0eHUBj9biPLMhQqoJ2FrYNQepDHWqCu8MhoboKur8dn
 T5aVzt28NFT9zlON19QvJHgqWuXkgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/26/2025 2:50 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:56:43PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
>> which now supports both MMCX and MXC power domains. Hence move SC8280XP
>> camcc from SM8450.
> 
> The commit message needs to be change to describe this change instead of
> the generic facts about SC8280XP and SM8450.
> 
>>

Sure, Dmitry, I will update it.

>> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> index c1e06f39431e..dbfcc399f10b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -63,7 +63,6 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> -              - qcom,sc8280xp-camcc
>>                - qcom,sm8450-camcc
>>                - qcom,sm8550-camcc
>>      then:
>>
>> -- 
>> 2.25.1
>>
> 

-- 
Thanks,
Taniya Das


