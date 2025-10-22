Return-Path: <linux-arm-msm+bounces-78370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73540BFD013
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41F214EEF8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391F826ED29;
	Wed, 22 Oct 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwAZpgPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C3226C384
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148988; cv=none; b=gTDCvtgYFuoCgz8vYZByU9KNX/uPiJwgs7WSDJ2bAYrJwdTIoMEsB/jdCMgpCFkQR0rmLJ9oD4etw46XS/qmGn+rejTKRfYz2eLVuZK8PvP4aIziNGzNFp6rBiK4Jswi4Ov/kpt3TkPbSl9A5fV5pC7aV+iUi5UoZpwl9A7GkSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148988; c=relaxed/simple;
	bh=6/x4q1TD0Vfpez8lZM9NmTtdfX6AcobeeOsSKpt9cS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TS55tAtYwa568arlM76pT0Zvcw7z2HK/MLezb+sobM457qsq9sBKbkMmjQkgCd2JbsmYP6yUV59O0ZvVlDAVSWDkt3LSh3S7xEE7Zso6JlvLWPpXvi4RZFfUwhT+3WSFUcYLFuc3KPFgo5NArBghI+WyWGZwaB+4nhFw05UswNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwAZpgPZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MF6Vcs012419
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJi0OYMjtb7TI5hXccKCsroVX33ScGfPgbLnqsYifaY=; b=CwAZpgPZtZC4BmqH
	S6YdD7pK7D0ZZCn9IhbE0muq0MxaeOM1MbxkGWbFyr6cidsSuOPU0FEn/AtnlaKS
	F4IgLX+UM00QDAVPT3B5gY54DzJprP+89jX1Hb/gLqIS1MAvspEqrh+mTO3fGkiW
	nvOOCrScUu9xrBAYWwlA4mmgRITCR1EgFP/3WyAXuR0Op0g9XD7RvUJrCGTsbWnu
	LycPKgqEAXyJEEFcosF1wGk6/642GlfHRVzLg+rUjImiKvrExgvyyNGjJN+YKK5F
	VcjC8bZ1hgSvP7hW3cyrxjat1J0Otl47trdIXREPBaF2CGFREA7kcyvHt+YNNhGp
	9PXHhQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0k40f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:02:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5d08f3bf4f9so624482137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148974; x=1761753774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJi0OYMjtb7TI5hXccKCsroVX33ScGfPgbLnqsYifaY=;
        b=Ayb5zQ9Epzld1w8SDdzwb1SLc7iOVrSb0EMIVgG1uC3898gS+U5DqztCfAC1zoSo4l
         O+2Hurf5SxRyuj0xsC7N5ab+XpgZ8jygG+LR2Mf4uGBw00JHqFOCKqv/yUP+jsHCMUID
         aDI31fkYN0jrEanmfNrdandY2tGJQ+9id8caBdyGLeSabVITG/t5fLmoLCf72dQWX3eA
         AqNGT64QIgIOK66YrkO/XO1s9FkxvQrMI0GVFM9dIT/ClLLLemy3AJPUTnB6x5a2K404
         qRsSZ63he0PlbXcDUOwC/Sm7wfC1u0oB9qpoCBEj4C9IP0ndNITG/ttMMS+uyH6DFo2x
         cfHg==
X-Forwarded-Encrypted: i=1; AJvYcCUylfCrWTKB7cltB/dunhVpfZBdqcPhsy0gyCYgKHdXy6gHCdm+bNx1C6KAqajxHz6ELn7d22Gixdz84y7L@vger.kernel.org
X-Gm-Message-State: AOJu0YxpXKxxFik4xW7XdhfopEE94z39EUOHaOOUfKxZcHeUZQXG5upO
	wLCiv8SXRYVEPgN0mpCXMQATcBgG600YvUTSXaCIOIu98MjgazGWYQwQDr8G7/PW0u7apTlVbp0
	wIJwC2CiCBeU/23d9YszoeUUReo6WD1mSqxz74O4ZulST1UGFIRZlmddFMCl+aKy9RArv
X-Gm-Gg: ASbGncufRvBJiTlKVt1OYEvBAv09lU2CO6K8EL4AZJ4mKiBtoYWdWCmtEuhUTUHR1Dy
	y5iiaFpEqum/8eSmT/wLS4hucVyGkD1ZjqwF84ut0KIqEDj9eZCOypE+EF5ELwKwqxUJ2QnTJv9
	yZqWukqmaoEKnE1swn/d2qD/Ksxd8LKfbxtN146nYzJkqKIc4L+VGqr4foIy0sLk4NMKMHCWQPW
	sZigPM8FfsXzeGriySgRWvoxKxr2gKPkNxhrPvgDYRlS3mh1TvjueSkHlrAnMcILVejXwYXh8hr
	G+SKkiVa8UNxieXV5s0RMoRl9Uq8A007EDykOgWZiCKwoObWyrwL1lxWfzC9ySCmUf1EC7B3i1Y
	ae9Cx/4HsNZRYGp57+iiCOPk+97pgNLR/lzVN5tG7JM7jxs/vhGrZ6CRW
X-Received: by 2002:a05:6122:e053:b0:557:4f6:869f with SMTP id 71dfb90a1353d-55704f68872mr118818e0c.2.1761148973037;
        Wed, 22 Oct 2025 09:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi5mRKbI+dib91eM8Z7Q+hS4s8HODIdacNkDVMa5lXczhBdSAgA5tmb1wtM5M/KDWuV6wPhw==
X-Received: by 2002:a05:6122:e053:b0:557:4f6:869f with SMTP id 71dfb90a1353d-55704f68872mr118782e0c.2.1761148972412;
        Wed, 22 Oct 2025 09:02:52 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb52603fsm1382657066b.57.2025.10.22.09.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:02:51 -0700 (PDT)
Message-ID: <4a4a24aa-d8a2-4150-a7bd-1d0a4b141116@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:02:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6150: Add camss node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-3-e7f64ac32370@oss.qualcomm.com>
 <b0224cd8-fe81-4229-94a4-c314c7b19811@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b0224cd8-fe81-4229-94a4-c314c7b19811@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX+8mEls7Ge/QX
 ST1tIhx2/VdbMHHtMibzq6CIzSpui0kWWYUhR/p5bSLe+TrQkQX6vgxjKPbCO5uxL4DcYz27zr9
 LiPf9rGI/XFZ/JC52ggGR1BDdcVXyaiWhJ7MgV/pXfqZjANCjVIIntqOuMvHql16Jy+Vmed4vZl
 o2p8SVvdtnOmPxhXhEsepxbVLPeSYQbNhlcg5q1AAnK6h869m+MMGjj5fMgCESbos88rd+6czGF
 tdy1/BqcDl2F6WI3amcfx8kTieGNZfdvz7Ma86PlFsoAGdPSwhXKQqLKzY9UU2q+ZJjU85hpfRm
 v4trvlVs2O9jKBwVeYErG+lhifqxKqIlfkm+mAQfBq8TMXZzPynfG3mB73kkCyek/TQI19/8FcY
 J9Fwh3JERjMSoazBT4hmrmVwGpaOXQ==
X-Proofpoint-ORIG-GUID: eLzzsQUCSYwvW9azmgQlq83j8RPsaR2u
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f9002f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sD1Uv7CbK0E5T9jcHE8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: eLzzsQUCSYwvW9azmgQlq83j8RPsaR2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/16/25 3:48 PM, Vladimir Zapolskiy wrote:
> On 10/16/25 13:22, Wenmeng Liu wrote:
>> Add node for the SM6150 camera subsystem.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---

[...]


>> +            power-domains = <&camcc IFE_0_GDSC>,
>> +                    <&camcc IFE_1_GDSC>,
>> +                    <&camcc TITAN_TOP_GDSC>;
>> +            power-domain-names = "ife0",
>> +                         "ife1",
>> +                         "top";
>> +
>> +            status = "disabled";
> 
> Please remove empty lines between properties all above.

What??

Konrad

