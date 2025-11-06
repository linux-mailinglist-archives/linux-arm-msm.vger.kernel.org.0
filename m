Return-Path: <linux-arm-msm+bounces-80618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B307C3B967
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 15:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE6444E5BB7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 14:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51AF25522B;
	Thu,  6 Nov 2025 14:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQvZ+d5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crdGjc9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9C6286408
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 14:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438065; cv=none; b=IxC/4JE2AUobEq8ZQgWUvdOig3oB/xtIXs0jk163Rp4FGDw8K5Z0xbbi/w5POLpq0PhACgjYBPszbmO/j5dqEcbUS8dobGzPWrvvcwT96C6Fc8btZWwERdD+JkG8wJZ118Ve8/Uqc7rBRKmfaWnldeNtN4Iee+KQ39pSVMMfA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438065; c=relaxed/simple;
	bh=SOccKiy5Rdbr6pq6sB0mWtUflMzLr3rVH64LwrFeOVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sy0Zj/zuvydXYwAwMjo34n9nFnvVjOeBI82Bb02rdxMp5PINHS1dDNBUyC8IxdrBBz6WY0KmPmNRskVDkIBeUWHHHIoCEh9foUHO/Dv7r+mNB/Hz4xpaKxyAmMRwqTj+3W9Nj47yGaB8uc0mSyP6ey/R5+MEqXStO2Pun7SSn7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQvZ+d5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crdGjc9H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6DoAVr3217607
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 14:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlBnzVB5nxzy+Z7vwR/dqDEVVZyIcEzuFRGM+j8huts=; b=QQvZ+d5AIl179X7G
	oNgzd+fA/TENVGJ6bfTJwJZJ2yI0qR6nhARxOCIwxPl4eTZu/+OvD6EYlwjMt4mb
	0lSfkkyv7HTPsm+GAcwHINSubnm0wC9DdsNRaHJ/b7buC1badIHer5IQo0THbteL
	ZRup+VGq/Q5Uftg76iR8Ex583V3FIXh0UeKpkcF6YEKnHOAH2ZIcul8oMf9kej5E
	v7yLps1O5kXDHyZphCBXtBc6Hrpf423CHqwjkh93na6EK1hyS06PldPIkOENV0Xh
	RDA0BdingP6TbQwmPkGXi6sYApeIg7SxcqSpxDR0t0o8bloYfL18abGs39KWqXTZ
	eTS6ew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8n7phf1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 14:07:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3405c46a22eso1372391a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 06:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762438063; x=1763042863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlBnzVB5nxzy+Z7vwR/dqDEVVZyIcEzuFRGM+j8huts=;
        b=crdGjc9HnTa+VhBHLl6fkq3p69JScJaWrIyXbqpGD3cikY9LhXxEeTU0RQ2iISBSxb
         w9mo21SWpmFZva0uLXopf+1pMnDluY3+s4WaYiP5+LpMkjbZZapH/wSBhOWpsbRpE/kD
         mO1Y9UYJRi1JIKYu/S9RbvoIibPxSSrnLBH7VnXXAHBZMHA/iYaxocs9xL2RUNN4g/BL
         GC/iYbwHuOeQxRr2q1Lvstgo8fMfY5H9i+je+C7KkUIZBeHg7n83L7Ydw8StETtQjRfz
         kZtP1CSbtMYUkroAlCkLvAe2lcCqLHq+af7E33ACMN779H1L5MSlKPgqHQg2t8yDQ9+S
         GDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438063; x=1763042863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zlBnzVB5nxzy+Z7vwR/dqDEVVZyIcEzuFRGM+j8huts=;
        b=tgAs4C1BZNaa08tD6X9X6H2fQAuCgSFpHw6yLElrv9/1ozeObLJcDA1jQaZGTR5aMC
         6/8in3Y5G+nF04PD5Zc7yoOov1QXyO9zZgO/wRidF754NH07QNLroYcJZdWgNs2BL7Rb
         Fs58iHaU2hDkgbROLXjzZt/63haWxBmkvnBzw1D7s+dWOBsqAglELNntPlzzgYkXvChE
         wYj34m2EZQKwOAzqoUJT4X6COC3uwc4srkWjs9mTZVI9KIcDwgzn22iaBLN4/i3iULOj
         FYfZQ5vKfjUcDK/+WYPjfDuat99MRgnwY7XdG8jHO1+Vy0xCLbEkf5P4+AjGt4FE2qhc
         ebPA==
X-Forwarded-Encrypted: i=1; AJvYcCUAZ5Ci+yidLjTNVgnfaXQ+v8uMBRi4lm+/2fqyKvzlCBl9FyYY4WY6leGs/ohB6BO4qC48OP8LWxD0Uk6z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1sTyk/OADz2IHeK8RXtgdChCiPz8HlrL2qnyjiWV5hX0iLU9m
	bCNNUpYDvnGwbGgCqfpOJtO+CguHSW357CcgI5x/KVVFAhXa5YsFL732NwkrM8Vg/OOGXl3W0ja
	Guq/FEv84/RU2gl46R0G7R0F0zl3KGrvtVuHrC6cUQHO5M/rKHlmVEj5TcQUpjIgk3s+p
X-Gm-Gg: ASbGncvgsCJn7ljzushJObe5PloNX38mSyBM9ucUCSa0moq71CqtpDr22IAyLpmTqdl
	QKsjxmnYYTTicATLcldVI5YpxMn9gr/uRV0RjbygoaDxEra4Pi3IydgMznnLOJucf+UwjetfLuJ
	nHRF/nAXMxM3pb4szUEVlHf+CuJA4lD+7M7fduMxNbXJRxnFRxmkejJyPlAnrk71UMD3QBwXe3i
	bE0knq1e2GzPVUVfpMjyflIGeWIgkpxhELI3qJRdUcIY5Sj+tadOIms3pjym6I3UQU5f/5saN7A
	ao5WJOcdX0eucKUctQX6qkDCveAwk4CGNWTekDuh9UGF7NUte8hCtImJEZ+DowqQux4fXbWjlId
	8c3SWTGjeHH691f24N3fZBfg4w+tHvMXlDA==
X-Received: by 2002:a17:90b:4b83:b0:340:ff89:8b63 with SMTP id 98e67ed59e1d1-341a6dd839cmr7917823a91.22.1762438062729;
        Thu, 06 Nov 2025 06:07:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb5xADXggWF7dRNeF7sG95acRl1JztjRAlFJmaO2OvQU/vqH3pUikfwbJOHiUbUbKUov+t3Q==
X-Received: by 2002:a17:90b:4b83:b0:340:ff89:8b63 with SMTP id 98e67ed59e1d1-341a6dd839cmr7917764a91.22.1762438062062;
        Thu, 06 Nov 2025 06:07:42 -0800 (PST)
Received: from [192.168.29.63] ([49.43.224.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d0daabd1sm1131993a91.8.2025.11.06.06.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:07:41 -0800 (PST)
Message-ID: <96c49d08-10dd-4a82-a6ec-345701b771d6@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 19:37:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] schemas: pci: Document PCIe T_POWER_ON
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: andersson@kernel.org, robh@kernel.org, manivannan.sadhasivam@linaro.org,
        krzk@kernel.org, helgaas@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        conor+dt@kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
        quic_vbadigan@quicinc.com
References: <20251106113951.844312-1-krishna.chundru@oss.qualcomm.com>
 <7v5bmbke37qy7e5qns7j7sjlcutdu53nbutgfo6tn47qkojxjy@phwcchh5gs5q>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <7v5bmbke37qy7e5qns7j7sjlcutdu53nbutgfo6tn47qkojxjy@phwcchh5gs5q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7pntcm-oRRschVSS5gzQda97tuwgrQgv
X-Proofpoint-GUID: 7pntcm-oRRschVSS5gzQda97tuwgrQgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExMiBTYWx0ZWRfX9T6mdlKyYMC+
 XjUkqa61ehOlwpUloDA2cslYrttKt0A2sYTATNrzyPGsxYJQtId2NB1gRiejUE+eX9nCA191HI6
 cjFUrbLRKk3mTlo5L7P11vMro0n2ByjWWre83iRL1B7/JAWeiuYYbwTeFU0wtTr92lTqDzenP9S
 dyzIVTb+NfLwiOnIZrH4gyA3HyGULVNiZG0TM2VSV7Q21iiG6FcckFcEZmf4NNeU1gvw2b1hOfG
 Th2qPFlFBgwmfx/9WXXa40/J7Afglv+v4wVBKqMV3toOIeNu8ydfdDSl8mImWAtEgqKOC7h4xEJ
 TvmR77AjeiyVjWqWVMYlI2Kh3UkNapGNKZz7IDxy6lljDwZ4PpqifauDFHs6cfXp6GdUJPPFImC
 hOur9hK9XMU/Lq7qXWUEbMc7tynJbA==
X-Authority-Analysis: v=2.4 cv=ErnfbCcA c=1 sm=1 tr=0 ts=690cabaf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=1uN4TIezCBQZsvcDmGHwSQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0lSf4L86Ka8fYzTnLDIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060112


On 11/6/2025 6:08 PM, Manivannan Sadhasivam wrote:
> On Thu, Nov 06, 2025 at 05:09:51PM +0530, Krishna Chaitanya Chundru wrote:
>>  From PCIe r6, sec 5.5.4 & sec 5.5.5 T POWER_ON is the minimum amount
> T_POWER_ON
>
> You should provide reference to the Table 5-11, where T_POWER_ON is described
Actually 5.5.5 section has only table 5-11 which describes this, I will 
add the Table 5-11
reference also in next patch.
>> of time
> "(in us)"
>
>> that each component must wait in L1.2.Exit after sampling CLKREQ#
>> asserted before actively driving the interface to ensure no device is ever
>> actively driving into an unpowered component and these values are based on
>> the components and AC coupling capacitors used in the connection linking
>> the two components.
>>
>> Certain controllers may need to program this before enumeration, such
>> controllers can use this property to program it.
>>
> I'd remove this statement and just mention that this property should be used to
> indicate the T_POWER_ON for each Root Port.
ack.

- Krishna Chaitanya.
> - Mani
>

