Return-Path: <linux-arm-msm+bounces-78915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31169C0E0F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97FD1405EC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683C92550BA;
	Mon, 27 Oct 2025 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4cWG7sN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E923D291
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571822; cv=none; b=K8UUbDVPSY/KXttmepx1WnuVzZ31Diq5JSOj+NuFgVmTnsR0eaUEWfQ7XtkJyJq6PB1rEeJibmGIXFXb+lVDgfN+/47lTVNyrpLOg1Sd1lrtO+/RQT87o8rARNwdzLe/g3f22dlSMsUR2lpNqSMZKUw/i0BdveN5f7Fdm6oGm6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571822; c=relaxed/simple;
	bh=vW+3Cg96/GGdIsFW+xE14HRicHDveM3PCshKWTYWVyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJchDv3kQeqaY/4dafz9EsoecdN0F8PNwsc5orGl14ERfoNUTlO4lSx2pJeP1pZfuLSt7yST+9kG5wm4tpZloniJeN3BOn/yQPaHJdPycbRHcI+/OaDsuvSXK4Yp7XnqGIsN+0lzCs9XKqkeT/GuZ5asFKUNawypBF7sbaYFRQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4cWG7sN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7jpDC588480
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6UaOTLMn7x9VTIqxGPsRSr4UE3ZlhhU7LhpxBk46+U=; b=b4cWG7sNCCP/3B2W
	2RANAwIlUcvvRc4wo+Yoc/eXn8YAgIB6XG7YgcDawaGdGZv+ia/jHCDDWajkAyu7
	NAMie3WA2BbHydpgUjrp8ZSLoPkUBGr7tdM0xcWGkLOsPjuLDX1sR3b9BzUsfvIR
	lBqYvdQeAUh6E6clDW0fUKQKIZRmVhbj1nyVn51loL673ksemeHqfz1vuFtnaHKa
	3fxE4cp+JXzc5xANnwpC3vrV1EEgyDjSIBpCGk/04jUka6nZ6KYFjLoRuGRl3PY0
	dcpir5LjdtMoB+HHaRmyAxw9mkspNPvkD6K7sS3KSWE2xfD2X+L2RP8n4v1Ac8eu
	9mBd7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps14nn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:30:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eced2a52ceso6117681cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571819; x=1762176619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6UaOTLMn7x9VTIqxGPsRSr4UE3ZlhhU7LhpxBk46+U=;
        b=bTHh0IeLLwzaUKy1HNvJJmhwEDiNsdXYGjRzbjxJPdFXLwh0h7kZ8g2t6Bvrm9l6Sc
         3VMSgIox8B6DBPo2NwXZUX4AUJ/UN7NJHsNHSHOP7Zg9aKQx6qJd9vu+XZsDaI1TYct+
         QkRo/w37o88DY/Ju9MSzT/dVcRDMs+V6dIjsE3ADxruPjsolFHNt5I1n7gf98M3ut+Tw
         hq7buKxRkj2zZ3/zqErKWIyL7Ox21GXswMjHsp41hY3HRwKgSGg6LzEMs9C6fao8mHKw
         OseXSLy8Ffe1aTl3ba3O9czdXFQE9dwlY0nyi+WJCJREi5Ipke+eA9hHu+MXJgtpH1Hm
         WTCA==
X-Forwarded-Encrypted: i=1; AJvYcCUP6S42RzWcdpxDilf80Q6hKehylnxSr+ATLqdno9EsVmRuIxgtY9p0eGwFBYxJAYC7PX4m854yrpV0X5xO@vger.kernel.org
X-Gm-Message-State: AOJu0YyjTJEBsDjcDH/NmKXqjbzY9okIQFwpZI8V5ZAh64qHpWuZyY22
	xyI9GPq7iYoNCzVlWUZb79zfYYBa3cgB5xfn79zkmWQ+miSa6ppLWX3Vxl8cWDOIncW7JPkyssI
	YENJ1zG21dbd8+ZD7/yB/IdUXB+yGlwcUlF1syFamNbSbaMXBukf7IlYCCJ1RTeLg0jDXrM/223
	Fk
X-Gm-Gg: ASbGncvBPFVAvuoURWyRxf3JI8vGOnSYAGhNgC1YXnDtqEb28yj3LE+K563uMcSOmS1
	RolG+Ex2UdqLha2h3oaUPZoLBgxJzWGwYc+mbcckZhSOyztkgMEbBRLSNqoRHDxww5kKL6f0xxA
	lFdiiTkBVXq/lsdiZquu3ehua+1xdFf89IY/QMFvLsVwlUIiTFN9ycNwV7s6JMALWWBwLwMGaC6
	iMwvZEY05cl9JhG75vj4avncHtyypRwDv5+oeKsyuUSkAbj4GlBmtYzsROPPvwuu8iCwmxU2D4z
	Y1k9ghbe68BhlaKe7/SsL09CEEBf1KsctE0BHz0MlvVhKJu62Jr5eUAAOyOn/hQ7Z7fMEqrDiww
	bH6AqlBLWVx5Fj9uprzhuD4VtGnKKN7T6sRaZIHbDGCE4wwi1CFPjZXRF
X-Received: by 2002:a05:622a:181b:b0:4ec:9b98:7dca with SMTP id d75a77b69052e-4ec9b9882d9mr55835671cf.12.1761571818739;
        Mon, 27 Oct 2025 06:30:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpdkvmRd09hAKf//qW8MThGcOtbL81DhQ9tcmGKDrBH0K8LdeGrKn/Nd1TvHS42fdq6Bvb2Q==
X-Received: by 2002:a05:622a:181b:b0:4ec:9b98:7dca with SMTP id d75a77b69052e-4ec9b9882d9mr55835301cf.12.1761571818053;
        Mon, 27 Oct 2025 06:30:18 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85413b88sm747980366b.55.2025.10.27.06.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:30:17 -0700 (PDT)
Message-ID: <76f2c0ca-8b5d-476a-aaa6-bc1be87c62ee@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8550: Add description of MCLK
 pins
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
 <20251013235500.1883847-2-vladimir.zapolskiy@linaro.org>
 <7f86be1d-3ab1-4936-856a-3f4e87a0063a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f86be1d-3ab1-4936-856a-3f4e87a0063a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68ff73ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DGYIJzoI2ldAB-cFmJMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Cfx7bNggpIsX1E2y2jWxY2C0mIcZ28Lj
X-Proofpoint-GUID: Cfx7bNggpIsX1E2y2jWxY2C0mIcZ28Lj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfX5JX7qsj0NryU
 yjCZnIodVJH2oQggVWRX1h3YEqYLkfr7lbiCRovw1lhNyP6dDWrGOiAJYfTPiWPScrYiztbkZrU
 mtDj1j95er9d0PHEQYiXL5/I2UpZDJv6re/eRF3OY/FxgM1UztYVQ8nlaeHCg+Tcr1MXkm90xUR
 yK5ACcJw7Ejp/REM2BcFQ0gvyOhb8YNj5p2kBKyA8fi1lrgOvVqTACbkWyomyxFaBzXcko2GPSt
 tw8W03ohTR5SeGYXXlLz7NUwE37UxAjfCiKDtlWmGJFaf89DBkRmnAQw9zGgS0o7HbCgOGo6O9n
 5/UxZ0sc0EV1PE91+z8y4GHQIrQebLyjqeBmrjlupNkC8+ZkgqxWwRQn2IyE0U2aXslSJWCQamL
 PKkhXwqkbrGN2mr5KD3GCZnpp27HtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270125

On 10/14/25 12:14 PM, Konrad Dybcio wrote:
> On 10/14/25 1:54 AM, Vladimir Zapolskiy wrote:
>> Add MCLK pin descriptions for all pins with such supported function
>> on SM8550 SoC.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
> 
> That's a lot of cameras!
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Could you resend this with the additional -pins level dropped (i.e.
pinmux properties being direct children of the outer -state node)?

Konrad

