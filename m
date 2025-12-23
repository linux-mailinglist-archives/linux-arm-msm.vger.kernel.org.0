Return-Path: <linux-arm-msm+bounces-86329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CACD8F24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8483030019CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AC832F74F;
	Tue, 23 Dec 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKpwwWsY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJmSoa6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E432FA3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486975; cv=none; b=ZAmbo+4XZ4hN1arI0kWfMe82TUq3YYHajw4pNOj9Lw7dwfyL/H5njxjIcNiECaGF88wgrIKBA3Pp8oDpa29B/btiMI+ZdtjzNkxnZg7AxpTI1xKuZrnK+hlssWzM5CJifjrCuo76OWPjREwwzfnspzQrfrzHndEhmD4Lz46Jzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486975; c=relaxed/simple;
	bh=ChHS2JPkUPRNHFx0VAyUavKlUBubCODN4tuB4XTsI70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aATsMN9o172/82m4eCRpaHpVAy6jSSyZ1xfwGwBUu8l7yOJ1FUiSdNGyD+SgoRmCGNnGo+iZIquYZevAuXixAX9rIo8sXSeIHvEvD2uXXH0ZiVMqntbG7TVhbACl0xFhr0azFjL387H+rL/ZdzTby7MWByzvfIHgFuTyO0ZV4zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKpwwWsY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJmSoa6Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAY4Q71568831
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=; b=nKpwwWsYXt9o+EmG
	IA7MJ8Gd3B6ajW3VYsftGPmO+nYO+QEtc5iiIBa/65Yyfo51sUgG8viJCfcAKYo1
	GR2hFoJDaiw6+fYKs8qQJdoL/O6cmZE4k5pe4+kEsTLzEqQtgfQj+Ssylr6lyiaJ
	fW59z1Ivfe36POumGEA1kBg4vyeijX7JkFD67/I3C1f/HIUflCVF8SdHpusWVmki
	stQy9gIJ502yrmD24K4NoLh+zUQ1u0c4w6VyjO7BURtGu/gr1SudaL4TtUyQ7C9r
	Si9gn58U1vlPwaPNCRuzlbN3fbG0FJDOBXQX0e9NX8i58Jt0Yj/ylDwqKuDLOoPW
	Rbp7lw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy3bhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:49:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-804c73088daso1484586b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766486969; x=1767091769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=;
        b=jJmSoa6QVEyL9dTpaYlHKI30NdUtp5ZxVtSG7S6zcJvKuwpKR+y17P9IfV+D4OdUaa
         VZNoaJd26Kl2L0g0BJodzrjyrux/NrdC3kV23+6nZfYVCL7jbTxwPKDSXO5Se48c47AB
         Rt6MCT02YmYxHi9I1y2YWozjMxtiYdysv6z2YtsTNsntFZcIrocQ64IwPl+Va7VyEqkE
         M+a1ZreRG3/SxORf/+306xHTdUnp91xvpQwfBrWUXN/ohSr8TSrv/CRGln/AnvtvEbQk
         3vBR6rOAMHOUnweX38UKFDpTNnmUEHujq45vzeJUCe4A8GuJDWZAUMv1dcXsPzWS/ny9
         boNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486969; x=1767091769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=;
        b=n4pu2usDQQ5VtstE18Fcda5RzW2v+By1/V+XD3FDmLF1hBHiIztl6NAjX5kV//g58F
         DDcxjBbDoNetZY8IA0iUTHMflv+MHIJ+zmz3On/CYn1sHfXTxYFxJH8qywpywVQ3vFmH
         y/uVYKCAkiZeNdC540tpVqjY1nxHGmPCZfonPHajt2xDIK8ViJ2jYB9+0Dru0AC2xged
         ISeSaE0CDmVUhoYBZu0AIJhg3m049epOqpd+XfeBCcujql8eWix9Dlq2fS8iLDq056cJ
         8SR3pxjVac2JD64DHamlL6FkDDMVyNY5fj6yV0e9VK1F/QRrtceRwvIGaU8Gjj/NDY4Q
         mb2A==
X-Forwarded-Encrypted: i=1; AJvYcCXshD+o9Hjv7a+q61hHGC/7Yf8O92eRbMoIP+7tu2O2xeXPKMKRDvwdYZl6lJOtTX9RTAAfrlV/ovIdPx7G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3aMeDRyfuSoK4f38JIbwUop4Kmdo9wzq2LcjQ9YaHqvUhp+fZ
	A8chmlbP27pg3MaKzmoUjIL6W+F4v80GtM1BfzCXbqgOnkRQCByYaLDRaVEN0FeSjwD1FcF3eQ8
	H19wUunXMgIJQlXBhH0dpo2QnrLB/aBUd1f67gxd12fEYVmZBrmhK8FW7yGibxeZz86M1
X-Gm-Gg: AY/fxX6qAFWMIphS/R84co8anzyfVLxT6zBbWGZvj7RjQ/Xj+e6MrFYEfJ61o0kIFUh
	7eseklUW9e/ul1Ds7Jzjfx3zb588qAFFne5d6Z6h/yHoED94VCRd0FEpyEag6LcdRzQWXv7thkT
	yqiS8nZn179EbZuJqSeoLXIFkHtJBjvnYg/28kya1S8DLF//MGyiu5MskvQwX3QZJXDnCBT24FX
	gh1ZodxcFQ9rgQYvnM6r/rVeQbHy+52LUH4VKWZHUzq/R36iPUQoQEMRjr9zG7l6Guv4O0NBNZZ
	yUMbVZyN44pyXPV+RZ50pR9IXV0s3ul6kSek9T7Eg1CBtY3uTHK8ZfeVU/zZj8b3C29Uk4RvyJl
	PO26YlufWzjmHYTcZbbBLRTxdwmjM7rwaLKQV+w==
X-Received: by 2002:a05:6a00:6b93:20b0:7b8:acdd:23c3 with SMTP id d2e1a72fcca58-7fe0c0fbefbmr11463453b3a.11.1766486969228;
        Tue, 23 Dec 2025 02:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1v/1HacvwG7DWXzwiLrvcU2Zusz8BK/bUppipGd3g3H//7IAWFp+IVDMaldG9feohRs6Z6A==
X-Received: by 2002:a05:6a00:6b93:20b0:7b8:acdd:23c3 with SMTP id d2e1a72fcca58-7fe0c0fbefbmr11463420b3a.11.1766486968718;
        Tue, 23 Dec 2025 02:49:28 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm13327808b3a.64.2025.12.23.02.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:49:28 -0800 (PST)
Message-ID: <a63f2bc7-11af-46d1-a950-60a25ef79bb0@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:19:20 +0530
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
 <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
 <701a7b2f-848a-4cc0-8924-ec72155d93a7@oss.qualcomm.com>
 <65e5459b-7509-47db-9089-6efecead3f44@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <65e5459b-7509-47db-9089-6efecead3f44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4NiBTYWx0ZWRfX5VVyxExSaMZN
 YBhB1HtxqRhVSW4dyCyw+9zXw1uuI81JYXbbLSYwyAl34fSOVHntdVsmfciaAK9ugDpXZbNz/2l
 HW7ePLXuxXL14mIol2Upv+Ibz3P05hf2r8nI/JRRbHWp5rzbk7ouJja/nhpgC81pBQ8TNAQWkx1
 tD5zQHwATZgBTjCCp8ELawe3fPl4FgS6GFJnUIwIS7EiDU9cPQra1GeW3QOzBtpfj1g3vrRDYp2
 xr9zbiiEZkQ7sB2ZvSzjLLMKJSS9e5vtFwr6P1fMFrWTw4J1ikNtHmDcxsXcKkDhsAUuVymlX7F
 jx8QvO0BOGDuOwuy3LtOfj5WBYQYcSHDjQOsRsZe2ZfsCikFloqOeBGmBpCceuvNNmz59BODp7w
 idCXnI5or2LeHQdO9rkdMPxYjEiRC6KM0/rl/MM2ZUE/14HbS0bCXZJO569HfH0OgiqtKY3Whh3
 7nLOBdlcxMITO6jnPXQ==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a73ba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PurT2Iiaq-uxMnD6zWEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: K-LAefr4nR8mF8GKiQFCz7xXje7Q0iLt
X-Proofpoint-GUID: K-LAefr4nR8mF8GKiQFCz7xXje7Q0iLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230086



On 12/19/2025 8:15 PM, Krzysztof Kozlowski wrote:
> On 19/12/2025 14:02, Konrad Dybcio wrote:
>> On 12/17/25 2:54 PM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 14:21, Konrad Dybcio wrote:
>>>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>>>
>>>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>>>
>>>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>>>> matter for choices made in bindings.
>>>>>>>
>>>>>>
>>>>>> As it is still a clock controller from hardware design and in SW I will
>>>>>> be map the entire hardware region and this way this clock controller
>>>>>> will also be aligned to the existing clock controllers and keep the
>>>>>> #power-domain-cells = <1> as other CCs.
>>>>>
>>>>> I don't see how this resolves my comment.
>>>>
>>>> Spanning the entire 0x6000-long block will remove your worry about this
>>>> description only being 2-register-wide
>>>
>>> But that was not the comment here. Taniya replied under comment about
>>> cells. We are not discussing here some other things...
>>
>> Right, you omitted the part where I answered your comment from the
>> context, so I'll re-add it:
>>
>> """
>> This block provides more than one GDSC - although again, not all of them
>> need/should be accessed by Linux. I suppose just enumerating the "extra"
>> ones in bindings will be a good enough compromise?
>> """
>>
>> TLDR: cells=1 makes sense as per usual
> 
> Either list them in headers or at least explain that in the binding.

I will take care to list them and explain them as well.


-- 
Thanks,
Taniya Das


