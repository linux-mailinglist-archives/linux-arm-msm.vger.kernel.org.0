Return-Path: <linux-arm-msm+bounces-56799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D4AA94E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 15:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22F541786D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 13:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7CF2517A4;
	Mon,  5 May 2025 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7ZGHnb4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A72505AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453200; cv=none; b=DxlnDnzCuks1fF5oEelKEB6/EpUe+P1oFz1YEB3YleM3Chm7ZZIuhC7haQ2Z3I9b0eLZY0XWKyqbPY+/lulzW/W4Is+pJFFbyxnSLgKb1eEnSmXHuAyG+pVMk5tIFGF4larHqTsiZsYumlc7Nko3snvJFyncOawexycDrJXU/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453200; c=relaxed/simple;
	bh=Dk5TrfYsZTaKAGjfadDJlyV2DgI5O/v2XMSv1VA28qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ke8ZxdGzA4+UFzxDEDc4aNlP9984tQQj1zU8QMYfEPyN9OCS+0YMzyd+nku6R/G9tfjl6wG2AoYoV4nV7oZybZfofjCEJAHRizTqoNJkxm49yrAWsFcy6X13pE27t36YN1jKRJj05h3sldqRApBjAipeuc84bjIW/pxQi+vMDvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7ZGHnb4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BMNRq017933
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 13:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O6JjaZi4RfYIn6ZpfLVOkLDl9POHRwHaQxHd14ACq6M=; b=T7ZGHnb4mBwSi/v5
	+VFo069X/W4731ggJ170f1/JF9v2CTXCZywrbSZ/9XaDH8vawwYHVC4xPUCemXUn
	O36k58baDMpI63dwxkqEiYOOlkcFNFW1tWfEzlR82mtnmCqvsSaEZv4iro8C+0fp
	62zzmiNI1OvoMC5Gs73qVfexJOUK3AKgP0of5opMYK6gl6S4nSKgYUv56LRs3d58
	OvruXJMFq0yHelJQlnCQ0l6Q7FMNa8eWHzJLt8smJdR2cq3vZZ/Msb1SJ+1WAZ12
	e698Yfxbdf/4TR88Ylu/qncIZ0oO2dDIOlkFltzaLW3JfLaSz5JzxCZZmzh/4lbs
	cfhZtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg48up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 13:53:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c76062c513so66342085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 06:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746453196; x=1747057996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6JjaZi4RfYIn6ZpfLVOkLDl9POHRwHaQxHd14ACq6M=;
        b=HkqDoyj9wdFpD2L5q8O3VmvNQe7mEh/lAguUrKFZ2q8UjoRFtrBKSr6PLML8D2YpgQ
         Nnd6JzHsu+FctSPOGmvcccIuk8JiWIpYYjD1hb20XwDX8MVib4CvBxi0sBykUtdNAt1f
         ppk2MAKLKlfaNSO80JgUEXKNuXwuj8IvE4nR4dbrQACbnxHEBU5BmLcjXD3hi9lMzxHH
         4++aj9D/vB/fB7Vl/NYFUzBU7SAnzIkAYBwMLM+aKXOB4QmFrufbOLIV2gW0lH8p2eKX
         XCXQUAzY2P2ApUi9C7w+IlaYHGRLKYFZB544yhvO4JLFCSoODPxD57UphP+kL6SHuHuu
         OUCw==
X-Forwarded-Encrypted: i=1; AJvYcCW7Y2EiqQZlCO4+bZRcP2abK0NE3VMHnhFRzSDHDkGcIOaXCQXUlLw8ESl9TiUdBeo5g5AOgUJEc8qRALQX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+5gKIkrcLl+Se9wfjrNFuik+JS3SwkEzGdY/7NltdPepxS83b
	rCzqHRcYt5EcBSoFamr+QCmZBK+aJYPoucT6OCMrrpc0azn5OoFqUjAN3VPsYZsbDUl2qg0aFYe
	s20T7Yt+m9/fi+NLgMkD3JnWQiX20kOm2YQqrGnM0VJE8od+m6WFg6zSTw5lVadjO
X-Gm-Gg: ASbGncvTQaMheAx6kmp8HzFyLhsQvTwowNYbH1e/nhu2xZqLAYMKgTfZxosHbKbkGpY
	d6IRJ1+rqCCflNMjg7jdm6FMbYq2vydYz2/xEKR4E+uaShJUKckvTorNvEXyw9/AD5GLsqNb3KL
	/3B3rAR/WtOniAoLVq865mfHyRQNiIIOF2RAHLa8+/v+SBNLW8W2h1wLYCPD9EFYIOYCpe9WeMD
	b8L+qDKQOqrvZ0NHlD+9LycpLftmg6Yhp0kELRDvErzuDVNPerK3BH+zf9Rh+UdAxUcQbuLdECA
	M4NiiQUlHdDh8YubOm74OVYtXQARq5NiQBW/s1YLf1Keit3Tnzilza+oEckkkdCImm0=
X-Received: by 2002:ac8:5815:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-48c32ac855fmr62114141cf.12.1746453196688;
        Mon, 05 May 2025 06:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7r4e4FpvQ/V6W1AbvbRMkK18p34iEe3+n9QIq+e7sfrj+oYLch1ohMk37fGgJoMdInSkBEw==
X-Received: by 2002:ac8:5815:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-48c32ac855fmr62114011cf.12.1746453196200;
        Mon, 05 May 2025 06:53:16 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c032fsm491532666b.123.2025.05.05.06.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:53:15 -0700 (PDT)
Message-ID: <7f2c2554-2654-4d10-b264-fb59ed54152c@oss.qualcomm.com>
Date: Mon, 5 May 2025 15:53:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 5/6] arm64: dts: qcom: ipq5424: add nodes to bring up
 q6
To: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-6-gokul.sriram.p@oss.qualcomm.com>
 <5a17d866-a459-40c8-9e3f-90bb1cdbd846@oss.qualcomm.com>
 <e6d58532-dcd3-4c12-b70e-f765c01ec286@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e6d58532-dcd3-4c12-b70e-f765c01ec286@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0cVocQ_I_guB2M_ZV39_nhyQcIbbTT53
X-Proofpoint-ORIG-GUID: 0cVocQ_I_guB2M_ZV39_nhyQcIbbTT53
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6818c2cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=b9x4X1nyoVVrWMxn6-kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNCBTYWx0ZWRfX/4y1IkMajYXl
 07fqFW68u8j5OqEhCcDfLYJimV+yvDTdMd08UMfENl2ypQCK7VkraAl1fYl4L4GwY8l+o0ZhSeh
 PnrM8zMRlHnPVLU1MMk7CJFJkNDhxRp7IObWyVchPE8of1nQ6NaVrG1qzdJEe5EeM1wuRtzVrY+
 FmOUDUaNJCXgihfWOUoveJcQvui8pz6baLJaaqo31XwpMVvRpXKIWj/cpY3HM+9jFjrUcd0IMkD
 q3YvML0IvkUAiBafo0lp1Q6AeR2MPiTQNh778d8QzLQlZRQes4mPKqnX04FZpKG9fxGT4rr3pO9
 CNyq7HF3oNwPRDCbxhkFr+gTsE61301La8kqFA/NUZFJkcg3/CMJuS8op5r+W+yL2htoK9NrSUd
 v8o1ENTkKfnLXNcaJyFBIpLoVgbW4s7ot4ufmw8PKYcHzbJ3zjDO/+H9uIci0wYRz33QJeTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=736 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050134

On 5/5/25 3:47 PM, Gokul Sriram P wrote:
> 
> On 4/26/2025 1:57 AM, Konrad Dybcio wrote:
>> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>>> Enable nodes required for q6 remoteproc bring up.
>>>
>>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +		apcs_glb: mailbox@f400004 {
>>> +			compatible = "qcom,ipq5424-apcs-apps-global",
>>> +				     "qcom,ipq6018-apcs-apps-global";
>>> +			reg = <0 0x0f400004 0 0x6000>;
>> So either the offset in the driver is wrong, or the base here
>> is wrong
>>
>> The IPC register is at 0x0f40000c
>>
>> + length is 0x10_000
> 
> with 0x0f400004, In apcs mailbox driver using offset as 8.
> 
> Should I use 0x0f400000 with offset as 12 ?

Looks like, yes

Konrad

