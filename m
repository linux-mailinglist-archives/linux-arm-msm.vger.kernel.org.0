Return-Path: <linux-arm-msm+bounces-62051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9279AE3E0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 363E0169F45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA1023C511;
	Mon, 23 Jun 2025 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1ZvPhgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B4222574
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678627; cv=none; b=Ac3vT+hlM7Nc8PM+597Saeta5mw1phGwn212okSh1XqFqsswz5wQE0MnLq5nLeA0r81rEuCEWvNZcjR+EnfhB1V3XQ7BqsN9HXPYGJ1O+5NJA2rYKFlWh8Dvx7d1PZkxnXNEdeQdUEwmHXGUJIbbkA7q74IEe3kV/zDxuTzjQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678627; c=relaxed/simple;
	bh=YQEAJCLfezUIG7yoU9HGhernWupP/zjzQJHrHDVuTeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1iFos/4JIhvMJ7VZvdoi3yscRsHOVEcsoB/uMQjObPhJ5RFxrVcdm4dLWOc3q0DOYD0YDj9g5HAOyytkR+EjP8jJYXN8wNE4xkq6V3zlQuw+fvHKTcGhbzz390iJbwNifBi17RL0+0jlANuxaEOrorZ+lob03nzwng8TbrNiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1ZvPhgN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9OE23020695
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNES+f92fEjKmzMHA6ySrLrXjwkhHw9zw3WBGAogWQw=; b=d1ZvPhgNu3dU0tyQ
	5Nuzi3JZq8xpQ/7A4oQlAlLJ863p236YYgL99jmePBSYXbOu4Oz2wMF7Nrkc8mnV
	aCDRhOv8ijx4MLtN5QH3li9A1pLQ5Bpr8KxexLTDJPTGa+Rsym7dy9+RwkJUNVYS
	iwy5VBXfKp972WjmMfR80Y+4+KROnoswfg/W3rCsjm/m11iLnpFR2wwHnUuzznQF
	SSWctwpDAYdPG52WH6pKo6D/lJa8tCAdbTg4EmM5iMW0VRKngTk9bFRdk1Ss6irP
	jkw/klJ6uFrA/81EPGidLM58u/jvcCA6W/300gfwRO5mjVVzJBERkaw9DgDiIdtP
	aVJFAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec262p96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:37:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so116053585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 04:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678624; x=1751283424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNES+f92fEjKmzMHA6ySrLrXjwkhHw9zw3WBGAogWQw=;
        b=VMKp91I2UNwZdWCMPkUlF320mg7dDHCNPV3AFyy+Bb1Tw01l0R1gjkTXLxVYiZduH6
         ewYfiV2apRg/dGS7/2mlnhQS+s9YY7GihzxQqre2ANWZr61so6jWnfDwikndhz5nyKql
         x5YN+jN5mviQass0TqxUxRkTlx/KS/3qV6oyYhpzQNPwsBk5MDl9fBxh8zu5WqISvVb3
         r4eYUp2GQpZ44cBn9OYjCWHbB+C4MVFEE5eS34Xa6USy8CT57x/4XFoXPBp2pZDcur/s
         38wXKLNvwIgBlVoKVTGVTnJ4JwJyEfzcj/ZoCVpOdFEh8+CSeOY9/0H35udQLygTs1+g
         1B0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7TErU5R2rXbIrBWVHekM/tbIlwKlHuUcAwY0F0B1DBoxGT24Pe/CRePb1BqY2cRizjVsRR/2C0XtIOTwO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5U3uweGWF7iF1068VdQFyscx5jbrq/JoRqBqtaW+By6H43h8m
	zU5Ptwv28Yskd+Meza7CqlXfRsO2G/rrL1XlXu9aXD7eYu3oc+LS7vg2kZe1PDFSQENq4M1jsDp
	QL/Xr9qgekco2qJj9Q5m+uwZctU94h2Cg0mCM2bQM5p5n+Uuoy+LmwY4ihDbhrelumkMU
X-Gm-Gg: ASbGnct6F5Z2Eht1mfY3eFfViW5wYfAeORmJd9Guckj0zi64cTGMgvphROdhXvGafJo
	2LjizTShkrcTSmrk18G6MWtbq4b83llN4QF17D1SH06pTep8cX1MfDY9WSGWaMvJU2t6N/C7ZTW
	2YEgn/AxNsW58eD1Alx4om2UoHeL2kCMPeymIfVFwrM0R7uZwIUREBEjYmh6dYbva2S3pm7cos9
	177XYQo2qgDuqw6lHaz5RSVwZ2XpzIDQvKbx98m9mj5MaAn8Wvr55eemH452aBTebdFpyeE1qIM
	qAnjJlnlwHwy7P/X/8T35fyBXjuVaisZfnIitrQipdR3i5HISP/r/RZuIpRxA08ns/x0UkwYZcj
	hBm0=
X-Received: by 2002:a05:620a:46a9:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d3f98dc881mr756578185a.5.1750678624267;
        Mon, 23 Jun 2025 04:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE64KulbHhXpkGuf8qB1USD8QxfJD2kcnD0exRsp233FiT2+hiKockefxscwnsSJEqw7UcENQ==
X-Received: by 2002:a05:620a:46a9:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d3f98dc881mr756575885a.5.1750678623807;
        Mon, 23 Jun 2025 04:37:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bc9absm700991766b.145.2025.06.23.04.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:37:03 -0700 (PDT)
Message-ID: <519f9e21-466f-4e8b-9bd0-dfe0448920bb@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:37:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable
 PM8010
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: bjorn.andersson@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        laurentiu.tudor1@dell.com
References: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>
 <Z9qXFLmnae86_GT9@linaro.org>
 <a7zyhmv5lqxl2l5rdg2x5g55wokm6ztwvzwrfkyeignwdromjr@afpe7zwsmkt2>
 <d2eabc30-f1d2-47d8-82f9-86f6f7a705bb@gmail.com>
 <7c850205-0c42-4e6d-bf5f-f1255367d53a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7c850205-0c42-4e6d-bf5f-f1255367d53a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2OSBTYWx0ZWRfX5sw6G94ChP4j
 vuDb8VWyMwE9PHUbNPgVHYiCnZgM9hsXRmhBG1JAuonHMmrKn/uCLmyUF8EG7vKwGtPDZ5xBIZI
 1YO60LilCPg9RooJxeCoVrygOkaGkr2wShnhQ54YNIlrhgHQKwGSDha+D5y+4T2y8cBdOkusEae
 2KI5BM1dUsbu6ckV4DYgbfWly9ZLzMrvyxvvqCMsiuqZS5ktDDmcHBsTOCerzP6lJ7Jt+eAuTq7
 pmAarLEicE1iEyYSx7oW0fEv9Zx/z9jZuWme2gMYgOyIuo6Yt9/jZrmr/QdpKBf7MFBZhdAv67l
 50hJgz5VHmNIxwM2IGCbGJfhF6T1MsddNWOqDg8nS+KXix0jkuMUaXeB3fnMuvYZww9Jt+/jbWA
 j74jUrUR9Io9IAd8j/oTrsRZDTtB1i+Nkk1jdy4vG5F3ZGJu3B77Ett1owbG6qY+2mVi4phn
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68593c61 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=FUMimz6QtM2Ddm9xIjYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RsP4xHnd8F2AI9ZtVOsN-zgdGWCKwqyS
X-Proofpoint-ORIG-GUID: RsP4xHnd8F2AI9ZtVOsN-zgdGWCKwqyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=876 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230069

On 6/16/25 10:09 AM, Bryan O'Donoghue wrote:
> On 15/06/2025 19:29, Aleksandrs Vinarskis wrote:
>> Hi all,
>>
>>
>> Revisiting this change in context of Dell XPS 9345 and now Lenovo ThinkBook 16 [1] (and upcoming Lenovo Ideapad 5) as these do not have pm8010.
>>
>>
>> Perhaps safest and easiest is to simply disable pm8010 in `x1e80100- pmics.dtsi` as proposed and _not_ enable it on any devices, since its known to not be used anywhere _yet_? As its a camera PMIC, the only submitted upstream (did not land yet) change that utilizes pm8010 on X1/ X1E is Bryan's CAMSS series that enables camera on CRD [2]. There are a few other laptops that have patches to enable the camera (my Zenbook, Bryan's branch on Gitlab for few more laptops) but those were not submitted yet, so can be easily changed to explicitly enable pm8010 before submission. This way we could simplify this change and not have to figure out which of the upstream devices do in fact have pm8010 onboard.
> 
> As a general principle, unless its used it should be disabled.
> 
> pm8010 is a camera specific PMIC and Dell has its own way of powering the camera sensors on XPS, Inspiron and I'd guess other models too, presumably as a result of reusing the x86 design with Qcom with minimal changes.
> 
> Disable by default. +1

Sure, we can do that

Konrad

