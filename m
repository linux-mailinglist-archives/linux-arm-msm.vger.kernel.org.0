Return-Path: <linux-arm-msm+bounces-56617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73028AA7EAE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BBA51B633A9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 05:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBBC19CC3A;
	Sat,  3 May 2025 05:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF0QnWQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889378F43
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746251541; cv=none; b=HTh7Fat2uLRHKKsBhXcoTdB1OVB4zCI2HA129voQd3ZM2/vSS7bQ8RsZuehXAwkppNK0/FEOYCrp7H/6RpMkj30qH+izJKjdJb2ZKEkJXNXtqhgHu+7ttkIEYe7fzgKN3U5csCsWfJplnRi9M7kIqdHZDYlpz1/jRqsFamo4DSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746251541; c=relaxed/simple;
	bh=kTzbdef9BeFuRG62UXkxiHxI+do/LrEhk/zWjqxWnbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFnJ0awejNQL439xrD5guYDYU8rlLLrpyZCnOBEbCnAK9W5Ka4l6RMPVWJ9JdE+d+yiOfxhbhOJcjz4YAfxkfLZyeYfqb3eghgRqOluzDuc9f19cOHC0/1i15I9s+Ivp/Md7Psf8zDrGR2ZIDB77bWmxQ/ZIzQDvjBUjNBgG1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF0QnWQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433inSm027292
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 05:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGIyRq2ecXxR1vaSsBOnW52paZ1NEgH9yMTjrR4DNNI=; b=ZF0QnWQo708kR+zX
	3vFxiNYgM8YFncFOYwT6JJWPcR9+VCNsBCHTqcDj2br4hw0teK09bl37z0z1FOWU
	vQsMtjhw7Rs3H9H8REsc5N6rsJo+vc843M43kwtD4sTNd3NkMjjtA74prIaoLVn/
	TY2Bx3w3hXNww21Zyt76zfnz3Zl0KPwKZ6/aQ6jeCwdkkaf2+guOG4+UTt91Si5O
	+MrlfD5RFaHdbYar7+gkVj0mZZ6jdteKFZrNezXj+8apvl/mDvHVq0XqgmL130W5
	rO1ZXp4vPOGHAwgEd0+huO+ywZNZeI0ytNkDddeRrHRxYtPDXG/n3pixZvmHVIb0
	OHmwEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg06va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 05:52:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47ae87b5182so56830901cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746251538; x=1746856338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGIyRq2ecXxR1vaSsBOnW52paZ1NEgH9yMTjrR4DNNI=;
        b=axmADY0+uCklHTL+DW9LBV8fqWCBFFxw5GWu6wgxHV6sw15zsABEmd1Hg9gxjfFqn5
         7ompCKbeTYF8/ebd4gY2Y2zWolbjPc71ASYgXpyQ+f6AEqrMN1OZOOlqo7IF23T/AFnI
         Kt4PqJHO4wp1kOA1VmhUrPUh3emgXvV+8QR0Y3jNuIMXe941leqpFHl/JImyIUNojtoq
         dEmFd6kJqMm3WUuistSF6kIS5qKR7Hbk/sMV152pso7fqG0at4e/lOzH4aCezdvoqPl5
         0EdIrsT5YvrelpVwdTUtBFp37fWqDbwaO8RzCGCBhsFcobs4mYhMvCR0KL6a8S+jo0wi
         b+5w==
X-Forwarded-Encrypted: i=1; AJvYcCXPs1bb0aH5Cqbhpsu5FqAfammaAAJyVXxYTwPqHJQ5SMEijM9oEYkLwe6yVZsuxw7rSSq7l8zdWjjSgn/9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyef6bEfT6hZ/EPHxizh7PrhZd5xwyJUPB9U1yVHwCA8YG6aDm8
	1AA9nDnE7cMRzw0F8DvZkEgaIOJkFzVx6Z1m2lDyLQgNd0vc+XoqnDOhShB1SA1b2MQWuputKbZ
	72nx389RUGh1c0DICJ0LcGJG2vo3Cu3tycRv8fX1IUrPQ3ofOPDrCtcB2E52EfOvn
X-Gm-Gg: ASbGnctnQlaqEpTu/7L/oPwvZOkcyM9d4DrJj7e4+jOg0giVj3roJfQFh/3JGYcQe1l
	eA87UoWnr24Nps7IcS4+irO46D+X7EOqY6xQ+TB+I+2OO2mRjvYHt99bbFgoZMudbISJM47YRDj
	8kJUtzFkj0CKIJUF91SUKbJhXhVBA2e1CG9TFkNC/nW7BRDvtYXfA4tuAVvl5zkERpyIzqIJ/y8
	PXZmxhI25/APKpYfy9/a4kkHfp6prQ+aTZCyoGMSBzSaB+V8HN5fZmTyCgPne2RWKO9vA5Qpz4Q
	LJIFu3U/Tj5MWnCwTbXuvLRw4epgzaq9pv6piKkG611+j9hnPxVAX1/60Nv1XTs1u3t+/UntrD/
	EP61kuHU7VH++Dg==
X-Received: by 2002:a05:622a:2c46:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48c31738b33mr67033031cf.21.1746251537978;
        Fri, 02 May 2025 22:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbq0yURxq1b6IBudPe8v/H/lRmlWawgrLJgdxW2ynKpNHdFhZe54xgLMAowVkzIsAb+lDNkQ==
X-Received: by 2002:a05:622a:2c46:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48c31738b33mr67032891cf.21.1746251537659;
        Fri, 02 May 2025 22:52:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b382c2sm6404611fa.2.2025.05.02.22.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 22:52:15 -0700 (PDT)
Message-ID: <9b67b7f9-b85d-4432-8a1a-3ed3021b68cd@oss.qualcomm.com>
Date: Sat, 3 May 2025 08:52:13 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
 <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PYpnuhvUXYnQFUbA4gU_IJZ-SpKqzEEt
X-Proofpoint-ORIG-GUID: PYpnuhvUXYnQFUbA4gU_IJZ-SpKqzEEt
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6815af12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XEXn59ipE5wXcr2suqoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NyBTYWx0ZWRfXw9krT1F4oWqn
 ne3GbSRJNZU58NXyAO6Z6v6drLXZ+A2j27crIsqr6vXRoB2G5C3hw6Re4kNojCz81GTpQr2RKfq
 XMNApwOjzSyPBiU1eKYvkxSKdVPGX+PjR6PqX5dv1DmbqCAGFu1BI5k9T5J0wAwLUUNhws86mEC
 L+W/0ymlkJYTAgVkNHQhRMIgOQItUGsj8eEgLlpgBQ0AgZ34GlrmCX4SmjjIMvufVT8vUJuFHPw
 ndXEGGTajcTHauzFturAimy64d92pMxZo0Jns1Lrk3rVOi7Ysxuo8IUgKWJlLymjeAuInMq9LrD
 UQopnXDmUFBjQ3So586uauMVS0V7JEwA4QUw7PALRGO+m10KFT3z6GyTVsVHRiJFe2UWAFToPzJ
 2mnmBrzehnYFVmTJ9fKGPgv+w8w8Pa39JCET+O0JAaKWq6QoSnpSz++Stn/uvcbF0I4TFC5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=858 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030047

On 03/05/2025 01:57, Konrad Dybcio wrote:
> On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
>> On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Have your tried enabling it for X13s? Windows drivers provide
>> qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.
> 
> Forgot to mention, it powers up and exposes the expected qrtr
> service on the CRD

BTW: maybe you can include relevant DT parts for the CRD so that it 
doesn't stay unused?


-- 
With best wishes
Dmitry

