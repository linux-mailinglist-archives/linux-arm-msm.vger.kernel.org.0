Return-Path: <linux-arm-msm+bounces-81360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA3C514E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA03D34DB79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC152FD7AE;
	Wed, 12 Nov 2025 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3mRdK1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbEM29D+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F8186294
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762939113; cv=none; b=cVlocvNpqSx+aVaX9G53R3JgGUeIuFHuaqkIg+0P8lCUipPN0a0d7uX7StuKMDH6aBSmI1NhSbJh0YoieJ/Gl1lc+zkjdZbdEaHkgR3XspVrv4PqYOjdQvdNK5QlK6u9PuBZiWxWbPA+7/0zQc72+TMYkgQeOX5iQDgxZ+JsA2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762939113; c=relaxed/simple;
	bh=U5QUgzFTz/IvlVLx3nP30IouyyraN4noTBTIRMQEoCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebxZfiHDjX0iW9EiI7jOanDYJ0Ahh4jIgGdIsrLhzOZc265KXlze/HFzskCFC8u9mrq+7ByEXbogPe2z4HbqfdqVTqgvjGlnTUF1loZilIJnIbe+ORlf3Sz8SybdKko6zcE5jN5+7JkJ6wSH04aiB5ttUSLnZ7UfAPldycFQYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3mRdK1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbEM29D+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC4Sbr83060190
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=; b=M3mRdK1RR8PQNY60
	GweKj5OB6mJQfS9anE5lEstnPMnkr5UfAh/gaNwnTtqGpmGiCJMT6tcjd7c9qK4B
	n06Npwsl/bcr0LXw40fQGofnf/AHhZzy4R3Tuo9Nrv9nVGG8OyhuFgpjkq/R+UAO
	KzXT50zZ4T9qKdreR4L1xDAObsSajZ01aLywFE2KOmNeIPAZxLAVTeqURbCNphOl
	qWzmmjG2UuQHVbPiA0XF45h6XtmWFTNBcynHdR75QGuTX+UotG+kO2kDbGhw3qwt
	flYPbOPio5XHn4VvNlWJQWhX8hpC1KgIBi30zF+VUTudBNjFM26Gp8qIpij4OZYD
	2+S1ng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac988jdyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:18:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e890deecf6so1225441cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762939110; x=1763543910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=;
        b=WbEM29D+xUQc2CZ3jEx9xtILvtC/Aa003eDOM9qVKOimJlUxYNdRcPTzbf/WVO9UXC
         kOUExbWxRvAMODFxpRqU6gRVDdCaJKMi13l2fecb+q28LtLurBarzeGVZoLW4RS724mD
         xUoDkbUjpfLAeJGaWjXb/+w8UN2XwKew3GL6MSoX+86md6yb99aWRPPsRlgWRdnghAEb
         b9TcdA6tFctaehnPASvVsjEDpt4QWSgwtwUM99DKnV6x1TjS/0PKCDw4cecHcLZ/dOR5
         XU+/kK3yzo8XC0ljyY31MhFxLGXknJSKI2OHLKk74at4oBct/fJtwIAKi56/QnbPm33C
         7wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939110; x=1763543910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=;
        b=hW0oJ9u+ZfEpEtQ9+QnZxYihpeC/1zoeUcGXzJuKenwtMD19FV+gDB4U4tV6Cdj/RB
         F6QdKmDQ8xIfD7Q+jDZQUyg489E5ZjYc/KAnedFMB+uUGLh/qkyFgrcxCYdxoJB9bz9H
         S7pgaJfT3yuGAp8XUcxDoruf1+bt4imYI7RQEP5QbowAW19pyUO38ZObXTVMgx9MErNL
         mfnvKOEGOE6kIdAZxPrFGT2sUP+dpej0Gypanu/SJvs40/U8IaCfUDQEizp6lkVgillk
         Z0R/8GQ4lDYIYgokDTXDDfi6R95M7umvL2J6oXBQQQU/nu9We+oNsxG8GGQzU989GZsy
         Dw1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXO31mO8E9ISh7hFbKHs5Eup9o/0DvJ1JIiAhyk7/NvmaMO39+HGjoqXs5q73rCUUtHEGUFVtyGiSeXBft@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3VIYRTo4NyucX+Pzj67v6BmwOdCzGPB1Randb6DqH4ga0SfR
	I9/1G1WBTIWZpJ78QZoEfAPP/orqGQ7G2xS12nPoxKMzQOxcJqJUNdLElZi8ZpKqslmdDf4YzuL
	+Dtpfb86jqztE3Lc6H9KC6uQpPQh4Dvv7bdjR6cM6QEzZIUdDh7wnAONEwJ544rN3Q3iy
X-Gm-Gg: ASbGncvLM+zANdCXWTSXSQmlLRUncBq59iTGoXu4TrSTb5VHdFnkLk/7opM+hwVZoHm
	3/tJmBUQP3uW8LfMHTvH47uVWnmCwTWBNsT8q7HPYZ4mnJTGiZ5GXS+hHyHaRqPzwEEZS6BNo3q
	EF9ww/oMMO96NSADQGcRuwxUQ2Kj3kszLnSs4TB93Haim+p5HjXfRyg0wJ02s4BU5IEhTywhSmA
	B2Lgl91fKkdQNJjgVIpLIYwqr7Su8jBvfbvbW7zrUe+1XxH/NiqF6AZeSLXimwSLYuGutxyeBj9
	iuMwsVIOyYY4w4HMPYE79VJvdR1RWKxbpp3C8t3QuHKOMMGxOFTC8cDRycDzMIJG+44ztXnF7/i
	07/Apd7mzEv7CiMPQQDvOUGP2AhrqBYg/twEHOVKn8lMaQdwVNPHwE+d2
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr19583071cf.0.1762939110404;
        Wed, 12 Nov 2025 01:18:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4l5nO38ZbTUUbjYXNEyin+4V4OUbwvGEdR+rVes2WfMKu7BFS5vDlEA3PIIQEduH3Cw7aqg==
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr19582781cf.0.1762939109964;
        Wed, 12 Nov 2025 01:18:29 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d43bsm1618141566b.45.2025.11.12.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:18:29 -0800 (PST)
Message-ID: <a0c267b3-535a-4f38-9a9b-d7b141b8fc64@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:18:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: xiaomi-beryllium: Add firmware-name
 qualifier to WiFi node
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
 <wxvtfyfdso3ngqvnhvryeo2w6udoolfp46smv2r3qny2cl7n4o@iawxfnj7qtrw>
 <5c6a1434-1f43-4434-b6ed-0c5b98ee8d2b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c6a1434-1f43-4434-b6ed-0c5b98ee8d2b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qIHuQ0Gag7EM7wxni2XR6SJ1Gi9jSEa-
X-Authority-Analysis: v=2.4 cv=eO4eTXp1 c=1 sm=1 tr=0 ts=691450e7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VEnwf-grGjUPgLEjvqIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3MyBTYWx0ZWRfX/uXbVGB7/kln
 zRFpM+T2NyNiW/ZG9FkhSZXfS0+6pmQmnlc87tQeKIZVnaQgGVShMApJNGXVkWFctRbno9xc3LL
 TCo5GCj8t5XX9gh9bhC7hbfUF07PnxeLk3aTMq9QI1di4Fwhj52Dgn1nX2cZML96dcXMeDoXbnR
 OmnBuPbDv0yw3qCev3wr1pEJGDq1/IS230q9McMohMxYV/SoqgSqyxQygC3yV54/nA3TJ/F1ZvO
 6YxT9FhFFEE4r/DwitXCgIHj28Z2EqxE/0WRtZbgqtBIoSpqrXE2FpSLjONg9702LoylNAGuxLS
 nTtpe+429OhmAdLohOv+ABr0jIkuTNEVRD3cg0/dsFqAK+FpiluDEIXzPzdz5IgEspBxADLYwzj
 NHVRj2ClZAYZn37bO/wYrCOMGamRdA==
X-Proofpoint-ORIG-GUID: qIHuQ0Gag7EM7wxni2XR6SJ1Gi9jSEa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120073

On 11/11/25 3:23 PM, David Heidelberg wrote:
> On 11/11/2025 13:46, Dmitry Baryshkov wrote:
>> On Tue, Nov 11, 2025 at 01:34:23PM +0100, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Add firmware-name property to the WiFi device tree node to specify
>>> board-specific lookup directory.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> index 785006a15e979..9b0b0446f4ad3 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> @@ -631,6 +631,8 @@ &wcd9340 {
>>>   &wifi {
>>>       status = "okay";
>>>   +    firmware-name "sdm845/Xiaomi/beryllium";
>>
>> This wasn't build-tested
> 
> Sorry, I wanted to send it more like RFC to get initial feedback, I got user with Foco F1 who is willing to test the changes, so I should have new version with T-b until EOD.

Nothing in this thread seems to suggest this still awaits testing :/

Konrad

