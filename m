Return-Path: <linux-arm-msm+bounces-83948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3DFC96D8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 12:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB9E73A2911
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 11:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E758306B33;
	Mon,  1 Dec 2025 11:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqfLVYgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxogJBYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60A306B21
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764587637; cv=none; b=Obpci/h/GBnVL6CX0JL8kAF/sO8hGGvc5DpvPa9R/+ShjRz3x1iUaDVvn6qaxluxMbZIxRR1KHZp8zXNIrC8RAG/6IbfoGKsWf1s41kS1peSylW7X25sPsZtnfbusB92FXcLteRavatJuzvkEYIRckZdEAejNfGT+pr0rXcBSi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764587637; c=relaxed/simple;
	bh=AMfPjmEM9c+LTOIgmySZa1BtZ2ViPzn5ACZ2iqVB6VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEzVIKF3XwI7DMg/TKpGOe6Pqh7qVRaA1wG+AIpahf9IEEps55sCgrKp4h7e2ATLYr+Q4+bbPKeBPdwxw7ITrH19/+AbJ1OgiyvByNF+gPvDgIYPnWlsRBRQJDTHYRwY3FNZpn9WMRDxmqbszdkF6hUNllKWSiETaGwuftcD+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqfLVYgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxogJBYh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1AxT7O349146
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 11:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzhSoqwHUWpcDroYtGd80qvArFZ6RjR/U0aJ4Jcx93U=; b=AqfLVYgVegh6nq6p
	8mD1thkGuK8qydG0G1hi74ec4vO4/hTZjizVY52UBwG5cXcJG0l+m8x3jL3mqUjI
	DL0rJXkBzobWUs7I+M4rPCYp7kef19frsTuUDPITGGQGBjqDxdkZ4wyphZdcMdKO
	rAMC+TBsxZ3eXdSr6JDZNVuZHJALrSSEUQefZ1/4pMtN4OHObCIbOzFbV9lFwJig
	J3/xQKU8vWDVo0Bey9TrGOyMnW9JCe34zdsw3hxZm8Kxp3xoysLgvuAFNgRN4T8j
	sPhsaX3Ec/gdV9b2Esv1aRFZ6qZcogynJmVRnt0ek0R5tRkaGu49DeKR8CqtQnW5
	vdVbeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9re016u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 11:13:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so13910351cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 03:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764587633; x=1765192433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzhSoqwHUWpcDroYtGd80qvArFZ6RjR/U0aJ4Jcx93U=;
        b=VxogJBYhbASK8UtILvlvRQWf0A2IaMZu0dLkLPPr/rcBSRGy4lORqdmdxnehEy7s73
         BnTJS0bfarkzcTLqGgBaF74Bgy50G8gbu/k5cqknx590DltsYPVSlSbDpWPIRNR0EorJ
         TVaTAhQqptHSLhQuVDVbxjGr0Ftb29OX5ZwZpbkpPCisctLEkCC3X/Wj1dqlWQDeZvrR
         3SgX2KZGlHTh6AqGPYnXfRP51ZQkwR7M+AsOytjpv4pgp1ZwomyciPRujtEGg1qo6duj
         9V/1h/zss/ANqIcA2eXvvjgoB/oil2PnquaeQhV93Pkiix9IHrPNG3NaB7D0a/NGuaTX
         gi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764587633; x=1765192433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzhSoqwHUWpcDroYtGd80qvArFZ6RjR/U0aJ4Jcx93U=;
        b=cjBW3Q3ClM8vdt7yBImq1Q7MCw1VLRu0KElTb8er9eUzSte4Odin27BJYVmBaK2Aqt
         NYN9fmgnzgt6MKGeZCous8gMMmdtQGiSCtOeA4bXdWu3h/qAowBYel9EQJY1vkc4u2JR
         4SJ8ZkD7MvgDp77K+EVVEmJ5eFgf3A31azu5YiSZ6T6FUoN71EjeE712rSR8vyW0Mtyx
         UnLZTu0DARZgRogFiSyIHS+ogsGDzINFB86/5XQafJw0UgFbKpwhDoS2fxYCI2FR10qW
         FWm4Er/28GB+CKlz4R3uJk0wCH+WQJovmgVSGFN9aKq/Gb6xUhZ5ZPRMEniUvfVmFIhR
         vWpg==
X-Gm-Message-State: AOJu0Yx8w8HOwRR20HXhWtAL9UXRsfrSDIAFuKZ6mqES846FYlPgAv6Y
	Rul44XqIeGLCK/nyhIPfGQLeCkLknL8tHX6TXbX3MhF1+/btwOZCGabaDWzSe/06IehlEzaTXKc
	5f/uexVg0r/vwbxf2osiwzilHhV7Zxjb8mUnxmuoJ1QPQq/ojIppMXjfl6RTblnzsYjdN
X-Gm-Gg: ASbGncuExPaIJJ2uz5u5L/xa+mSL6VR4Nerke+QD4meG4hSwOYT4y0O4EtD0ToVM5No
	DejS3T3UL5LtIlQaUibWLRr6ETYi/LC6ts+DiUJK7JDprRFmnt1eKzvcW71LX96rO7kO+nPCiiS
	+UU0Jti/dKEluO8jjAtWMYho9LvzDGk6uKoqXW+Y+dDf321J0+k2jcLDO5bx20M8Y5CDXe/LvQd
	jQqHEqWxLjTzk6t9UFFAsDAN8kPfGAIyt8r6XsvoYl64RpEGtsAwmitZF4IYNkAXjugLSfmadfF
	sbqZvWnlsEqT6MACmRfHH0mYejA5qlEwzR00G0YJ0h6P/4hTwlgDyhcD3ABD6sT1eakifHJvfsa
	X69a1mYhL1ECz7A1ho1P9IrQMOhrBMyG3f/ixyICiAZ4BqOQP7/EsLbPbwJvwNiubWmM=
X-Received: by 2002:ac8:7d0a:0:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee5892610bmr395259761cf.8.1764587632583;
        Mon, 01 Dec 2025 03:13:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXCa5OQhC6mrFXDfpgsHMTvLzSwTJ0reT82Tm5ST7WP0CXQ2UtnA9siHZRFmqSaU+ebrfhJw==
X-Received: by 2002:ac8:7d0a:0:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4ee5892610bmr395259361cf.8.1764587632128;
        Mon, 01 Dec 2025 03:13:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035d4csm11986116a12.21.2025.12.01.03.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 03:13:51 -0800 (PST)
Message-ID: <c80db42f-518f-4682-8e43-3fa56fe569f6@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:13:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: oneplus-enchilada: Specify i2c4 clock
 frequency
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251130-enchilada-i2c-freq-v1-1-2932480a0261@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251130-enchilada-i2c-freq-v1-1-2932480a0261@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA5MCBTYWx0ZWRfX2HBql/H5FCw5
 /27WkX+RT+94m+IG5y0DKNY8KCz5aB/vSRP71Z3Kbj9n+CHuchUc+ZpoQ1jSuAhB26h8fUTl/7D
 9U9v2U6PbzDT57pRYAQ7ZIRl19vFi+nf/4mIJPjWefGBNQs0pIRxM/2wRvJubEDY0kyAQAg3Xcn
 WxxBfIuMltBr6WO5KBo3cubiv6dBrsRQPnlLLhqagFS0s+5fcKdqHDmxLXzwhUk0HvVlYHIxb//
 7XDTOzPmZXznGK+Y06CK6Dmy06b1g2T9oPtlA0YI8dWza8MOUQzO0RrYacLPft9k5PxzZtm7wdu
 Gy83iNPh1KCFDF1btpFsP4KDWCdbvAb/1caLz8bMf02w6b5nTiNMExINgblJj7swsWUGeMpEwfN
 UoppKVpj5zoGnWr25JuOq1ayGIt3kA==
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=692d7871 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=aJ-x5TLSXszB8K4iyzMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: j-L7AKDx0qlsN5V7Djm1xteEv0G-8bUL
X-Proofpoint-GUID: j-L7AKDx0qlsN5V7Djm1xteEv0G-8bUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010090

On 11/30/25 12:22 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Per the binding, omitting the clock frequency from a Geni I2C controller
> node defaults the bus to 100 kHz. But at least in Linux, a friendly info
> print highlights the lack of explicitly defined frequency in the
> DeviceTree.
> 
> Specify the frequency, to give it an explicit value, and to silence the
> log print in Linux.
> 
> Downstream doesn't define any frequency, thus also using 100 kHz.

Could you e.g. run debugcc to check out the frequency of the related
clock to make sure?

https://github.com/linux-msm/debugcc

Konrad


