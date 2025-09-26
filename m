Return-Path: <linux-arm-msm+bounces-75287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53711BA31AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1C2A324E1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA1F1A9FA4;
	Fri, 26 Sep 2025 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmaCLpTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F41274FD3
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878324; cv=none; b=LDqS8bsubJeF32ja1H9LqUtTebyEY1YrdzY/GwC0LhhO+vPcvuUexxpk8ixjbjbZ+uqINjsc9mbI6yx1TiQOQk87iRNPDAOoWRizXsKHXa4VITDG3fVqqBqEil/wi82Y5/80au9GgN1GIaXMD/7o6CCiSEpYaRMUXPetgfLhGvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878324; c=relaxed/simple;
	bh=rvO3y3/5JAXHInb4ycTcmOW2bVUrrDYIJ2o+IzNAf0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaZcGEBrTcD3kXgULw8vusS82gA9rlWrnMRFScyl21PV+sD78O2nM6//IYJ9T+U6TvbLAs+PG1CDGU7969tYcFnfMMMAxBoZRbNxuRnYM0VlPldXMu6MqFncZEUKO/5H0ECxMAmE6+MG6wHqVAMpYXs+okpW5deKitnHlRZoMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmaCLpTk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vo8r029627
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOinGqMz0tMy8RVDVP13kAvHKKpdZ8bA0MN36ekzJAk=; b=cmaCLpTkhocavNRl
	lPz/e9Qigm1zvnFtNb/NJtYqx/wMYenNj+jJi+YcsX/La+4w7bAKF7bkrLUR/a5a
	a8Vjknvg5SkbRuUcIwsjPFd/KvlzTxJXkPSfcGpAD3sLo4TJveXvEGUbecmJkyCZ
	iF5xQNnXaYul98pS6gzFLsurGrfuXQNx0YMNcFAQpLNMhkcUX2nygeuVorxCoroc
	UUQgTGyP1YfrZaAGWSrGutqwJU5jC/XSaGwm4pF21obGc0si4y0vQvL/AuDVw2WI
	HY38CSMCMH2n4vMAz3OCHywSuWRpamI7LrNEUnhQipnI+z5WJWFKrBuFKNuDfimG
	jTie4g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db32287x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:18:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33274f8ff7cso3036899a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 02:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878321; x=1759483121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOinGqMz0tMy8RVDVP13kAvHKKpdZ8bA0MN36ekzJAk=;
        b=KPqu2Js27rl2oRAs6Qxppynd34Ro4rhGhdY9ybKLwMERsH+gafYomRIAw9wTs7wsFE
         VGMQbk2zmG9lNUYghv8V3SXxJHtulLb5s0M0oY6ZKVQzxC2ysAfXRsbIV0Tyt0MxXVBO
         fgcSBDanCkt1K1K04vE1ltvTcEXUVvrx9tEaz2lLqxI0thtYvwVZmUEhlCzDiaZaJlBA
         I7cviN8ko57nvxN4aeV1yJnwRXss8DcgucHZXmE6tN5kt8IyNBpHs4HSiDESsDqh6Xht
         mVd7l9hDA/WhcmPoPAxGiaS173q3rkxytjnR9OVBR9HqfhMGeMh9G05axu019Us/VEHO
         0GLg==
X-Forwarded-Encrypted: i=1; AJvYcCWbh/hGN5qeqZdWJQr0CgA04HBV1stiWjYPBpI9tjzVBuTk/tnBWbpC6XxXSMfr7VgQmUXn/jgVuyT2GFi/@vger.kernel.org
X-Gm-Message-State: AOJu0YxmrbRvoSQ3NvOLPx5kJgvZTdThhBOVxYfUNJos9eMZ3XLVfqWp
	R4inCY+cB/g7KTbchwwAxxqLqv9rIj2iZD/eO3T195USPYDtok+KGNsYvmn3XMSEH9wkVX/ywzn
	LpWd+bJSNzO3bXt8OYVC+4VK1pp3Cr1bzK56s6zHZIJYeZ1En8JyFruqj5swCGYXOxO9P
X-Gm-Gg: ASbGncvNAR7ppVLIIyLA92Q2y6WqaSbABXdkiANtVsYdr7hBKYWQYi1rkPgouZHqg09
	ZZWyH9yRBPwZFKZFPJbpXJoSmLNdU0iokf+7komqdYW/VSZqyFjdyalOBAvm/ZSViVzJm1+uDwq
	VyQ50NCdhcG+rGo6H0N/eG9ksTFQ+M/t1UXNgKB3PjcBMjE4OhMdCCa2KvwBwwmBRSAW/pQGHhM
	s7x6pI6d3MFdogxXD7pDnMTDIPTig52pgtV8xfAO9pt5k7YjQWweChBG/aEPzcBdfaBiRdKT2kK
	V3RudQNkG1InR0rYS/HuI9jKMJrxDPoW7LtNU0NhJJX0AcpUxnDCp6yzKpzzboedzFhE
X-Received: by 2002:a17:90a:a783:b0:330:6c5a:4af4 with SMTP id 98e67ed59e1d1-3342a2df0e7mr5798177a91.35.1758878321218;
        Fri, 26 Sep 2025 02:18:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE2VmbA3V5xKxzDOD6PkH2qKlTH1jNQO9LGj1hh8V7XSD/77IMu25QlmTn9kHgwhzPfubZyA==
X-Received: by 2002:a17:90a:a783:b0:330:6c5a:4af4 with SMTP id 98e67ed59e1d1-3342a2df0e7mr5798146a91.35.1758878320750;
        Fri, 26 Sep 2025 02:18:40 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53db8d2sm4185722a12.24.2025.09.26.02.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:18:40 -0700 (PDT)
Message-ID: <555039f9-a168-4a9c-b45c-d4583c553bc9@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 14:48:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <EAIobHjo8rM1e0LwqDqaUllC0qjV5ElMMhk6KgT1oNnFt_-k7ctM2_6kym9OjEtse5o4pOFM7yCkXgrSGRZhuw==@protonmail.internalid>
 <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
 <d965949c-a7a0-43df-9bf1-c1232fc7e38e@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d965949c-a7a0-43df-9bf1-c1232fc7e38e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d65a72 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=iWq2tNaQHCMtPVGnXkoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DGvxxWbykSLHbOfff_CRggVfJfSWHBN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX/DD2TO9+7egt
 YXvIrZLfQMVvpwYS9By5dG7Q5Z6X8zZI92Z3F0jNzJSOwwjmCx5S3TqPz3fyJQK81i+NprrUziJ
 mCkVNzmuX1BSJm5C852bPX+rGFj+slEWnEXOxobBSZ6ekFgce+Ep5+1iwWubZ7fzmAeCPHFfH29
 18diwB3febDi0tbLTJUFQiKRdX1q/KoSOubF0JJf+duKP8/9J1dwXQK8MrbEJ9WTyxqcfrjdUTu
 Ku890+H1RtVyneUenS47UEewBuAkpS3Z7Uapd7wHXhCmmVLN4ytJiY1Kmr/z+TvEZJFuzT/2Lrl
 s757Ggf9ly5a2/zy4vjJX46toovyfa8rDYt4/yNnX3hLWXbu+LsDvTWsTtDVnSANEZTtsXFOuKy
 Yqt76ias4XOOe4sBCPaNIx84fgtCZw==
X-Proofpoint-GUID: DGvxxWbykSLHbOfff_CRggVfJfSWHBN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172



On 9/15/2025 4:28 PM, Bryan O'Donoghue wrote:
> On 29/08/2025 11:15, Taniya Das wrote:
>> Add compatible string for SM8750 video clock controller and the bindings
>> for SM8750 Qualcomm SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   .../bindings/clock/qcom,sm8450-videocc.yaml        |  5 ++-
>>   include/dt-bindings/clock/qcom,sm8750-videocc.h    | 40 ++++++++++++
>> ++++++++++
>>   2 files changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> videocc.yaml
>> index
>> fcd2727dae46711650fc8fe71221a06630040026..b31bd833552937fa896f69966cfe5c79d9cfdd21 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   title: Qualcomm Video Clock & Reset Controller on SM8450
>>
>>   maintainers:
>> -  - Taniya Das <quic_tdas@quicinc.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>>     - Jagadeesh Kona <quic_jkona@quicinc.com>
>>
>>   description: |
>> @@ -17,6 +17,7 @@ description: |
>>     See also:
>>       include/dt-bindings/clock/qcom,sm8450-videocc.h
>>       include/dt-bindings/clock/qcom,sm8650-videocc.h
>> +    include/dt-bindings/clock/qcom,sm8750-videocc.h
>>
>>   properties:
>>     compatible:
>> @@ -25,6 +26,7 @@ properties:
>>         - qcom,sm8475-videocc
>>         - qcom,sm8550-videocc
>>         - qcom,sm8650-videocc
>> +      - qcom,sm8750-videocc
> 
> Shouldn't this be qcom,pakala-videocc now ?
> 

As of now, Bryan, all of Pakala is using the SM8750. We can migrate
everything together to maintain consistency.


-- 
Thanks,
Taniya Das


