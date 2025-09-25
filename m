Return-Path: <linux-arm-msm+bounces-75015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA4B9E198
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 078C34A4F68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B773274FD3;
	Thu, 25 Sep 2025 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6pEScOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D8251022
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758789854; cv=none; b=A0L0bG8e2DHVs3LDMaGyb7E49PiFOEpycqFKsUAYOWEhDDLga1U1nBioAhFCh9CE2wvmlCshxAuWU0Nkx02aVdJ1DKJt6rNeb8CBOZMgUs5DaC6M4Gjx4pU88QmA2xF/mySwgogxXt3d5GdG6fNYnhkBEeBUJAe2p1PP4q0E3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758789854; c=relaxed/simple;
	bh=lOmZm2NYdnU1g9B64OCOuyPIweqw+BqEGm1w7g/Oqi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4Zgu5WoXACcwfqVlw3BaWKZLc5BgApOGziSs4GAlkWgsxzjY2qptlEA6COHueaSKzlr92GpckVC4Fub7NQ/5yA/VKqgVHn1kkuovVrlWsiHcu6M+vzVLnxRWwP8N51Y4nsQGh7UjEh2Zu+K5Z4bp2iBY2PnPGKvF/PPlt7D6GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6pEScOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0KfIA003961
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBT7rTwERo8BHIfakro0N3iM5Q9lW3mzacSjwxIquI8=; b=j6pEScOBZmPw3Rxn
	FdJp3S6HavZlYMK9KkSaGAAgDXJrHL9ucgZw5atdyBSCGtsPElGKT/B+IaJfZEvy
	t0S7L/GjBW+MhJBcDSr27Kr9h9AtfZzRks/Jc4uJg29As3uHgHgZBKszqFCBh2hO
	HdXHYTM6ZlJvuGq4g+GSqnhaPTtyIInJCRexcZm8hI/u7aqDqo7Ho714TSvWDyC/
	GFJ7Fx+54g5vlEJONe+K36IHU9FL11MAf0d6EMELCU/Eum4DsIQhAWMfGn7MLMzl
	3gsDU8/hggDZa/6oeXVu6H3WlQmPlAUem22OCLGxr4DRyF1269b23UgcToAIsMBt
	H9G9NA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf1y2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:44:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6ee6so8709225ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758789851; x=1759394651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBT7rTwERo8BHIfakro0N3iM5Q9lW3mzacSjwxIquI8=;
        b=ELEzgEur1ddpw05+YLKd+RhNjDTEYidashnBQNXE+KnF0UEe9ql8EBvOIrmimycLlk
         0k/ylwF0QCGJS91DwljFj71jZnbCjJSC+phYaOXNlgfP57/UewZgg3mHvmfK84vKVyDp
         McnBJ1cXrqWRdplPTKVxA1M6cxsf5sb6jq2oeh1sBJ7SCFbb8FLlKcRPqT1W5jmoQgqx
         QgTPCyPhnR2+L1aelAOLU7WpTW8wySdU2yc8TpxdR4YKepZoRKxG284FzNHUd2md9sOx
         W+IU5LZ5ofr0rbdExe92XiYz9T+zWNGXXbndDVpr7d5xMkBqC5J6tZZYsFFOQSWlr8M+
         UpWg==
X-Gm-Message-State: AOJu0Ywk7vCQQhkItGSb/jy3oOmgcc1naQ+oB5gsxXQlPBCciXML1+PL
	xWGWAj/7FpOFnSoclKkfxFiqBUey2abcbzu63zwixX6bkYeJV/fRM3DBJns08x710RqDDcQ6Cl1
	mBnqaxZmXaXUQyTWcb2Os4LCJ+SYLZjeuJU2iqjyxffCfryMYucWma1aoydzU1K1+h0fS
X-Gm-Gg: ASbGncuYZ+brIi2UoRS7LDT3UNjLugKMaW6h3r1jZ42XOeJjWtG7Lq8XRinpmMldgYC
	nnzpzyfUvbVHtYADbZAYzxSxyJTiPLXiZEJhQW29wccY0zuj6YsUGY/TwoJh6DzIXc3wHkszdDs
	Uo/r4DgrTB+TvL2scN5FlbDG4woQerZqMSl+oahqlIk1ABDknBdoUW8TicImdBaL+lJQZgS+cBB
	UC6D47PtOzTwrLrw6Hgigat4GAUhmlbzQd1ItvFG3vvFT2eoIEtGrc/Z3zqaBrSzU+isrVhvda7
	SrgqRdMVY50f1tyLH7swoSvKvJ/iM1NpGxDzS96ACN3md2xdSKOF2Y8mCbjAASxGMgI=
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr29763185ad.22.1758789850660;
        Thu, 25 Sep 2025 01:44:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEteYAh52n1ZK6YfsOt/78cpYQ1O0vITDWQG8F1u35YkHePDlHA6DTWb9y/kavs8tH2Xnef9g==
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr29762945ad.22.1758789850210;
        Thu, 25 Sep 2025 01:44:10 -0700 (PDT)
Received: from [10.217.216.93] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53db8d2sm1528142a12.24.2025.09.25.01.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:44:09 -0700 (PDT)
Message-ID: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:14:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Bryan O'Donoghue <bod@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CKpscOxyW3MZbaegltgAzPki0fiJzZX8
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d500db cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-DM4tyH-3wswODK-JwcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXzCswJsOu80AM
 5hCjpQo3+/8+9uDNp1j0wvvQQGQcIN7CfYcQ0LtJHMEpMpg1TNAX2ic9q+Ts2Oy6HD7lKSNjgED
 XdPrumS63RBkEG8regMZbghuOhlDwZ0xQCqWhAUIXFjWW5oQN0PIMiRXIgg/ddbod1QJA/i9dei
 p5Soh1glbTL7cvCJLjebgeW+9XmRUJe9c4YhmuzaRSbW+3bGFSPwvMBIXVq2mgEVSWJCpCtX8gO
 xX9GuMw3T8uHaEtoq7moSskE2Zf5kxgBUC52Mr9LamYT9Jf1fUUI+EuFbvAhdRc4BGysLvHY/IL
 3KM1nxXyGD3peANMl6zhQIq/Hqvt2lLib7cja+O78G0auniwAsAi7V1fLGiEi7z0jO+hl7z/tYy
 uJ3bDv1X
X-Proofpoint-ORIG-GUID: CKpscOxyW3MZbaegltgAzPki0fiJzZX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168



On 9/25/2025 1:59 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:56, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
>> which now supports both MMCX and MXC power domains. Hence move SC8280XP
>> camcc from SM8450.
>>
>> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move
>> sc8280xp camcc to sa8775p camcc")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> camcc.yaml
>> index c1e06f39431e..dbfcc399f10b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -63,7 +63,6 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> -              - qcom,sc8280xp-camcc
>>                 - qcom,sm8450-camcc
>>                 - qcom,sm8550-camcc
>>       then:
>>
> 
> This is not a revert.
> 
> Where does the compat string go ?
> 

The compat is now part of
Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml as part
of this commit "842fa7482915".

> You are missing the part where you move the compat string to where you
> think it should be...
> 

It was already moved as mentioned above.

> Also why is this patch appearing in a series about _adding_ Kanaapali to
> CAMCC ?
> 

This was to reduce less dependency on the series.

> NAK
> 
> ---
> bod
> 

-- 
Thanks,
Taniya Das


