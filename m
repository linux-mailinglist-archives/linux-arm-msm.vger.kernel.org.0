Return-Path: <linux-arm-msm+bounces-80936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B1C456C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 09:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4617A4E8DFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5A42FCC06;
	Mon, 10 Nov 2025 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIMGygyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfnyEdFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEFE2FCBEF
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762764489; cv=none; b=c5iPV4GsO5gtJkZUueqFDXqYHAIOpZeZk1RskR/FBStFUJPIiEeY7vhk3Vj5sSPQhV9Z+UbEgAMvSJt0xY/hVvx+JUBCfaULVuYdno1KfLK2xzBQN6mhjW8mi7LoFpkhcfsXH2dssrMcPQnIECNheUBtCTWjb5SaawNzqHjCtHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762764489; c=relaxed/simple;
	bh=/09ubiYSvNP90owkjG7kLk/4oieQ68xZfw/hAWa8hFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONMStCYiiSzRsa2GTlHLC8jZ1m3aHNED2Bdt4zGaRiPR4rg1nSMyy7UzWiYcg6bRgGvPPoaQ4XlFJlNFHdfPPERgGios5ojjMzYnT0c6EWNKe4P9Jm8c0JAnGX+VMZsUD/hbyhewG670LPOoG75UEJbilYwHsCj068AwTQX0e5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIMGygyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfnyEdFI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA37gab2166766
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nGxk6cvPgoYAgcOQslEIVapMqVsIaVsOVTbE/MMoYI=; b=IIMGygytKwBRvUW4
	cm3BTV4joWjcSyVupv4d9kQFRR3EVVUJ45SEybdi6dtIC28cCnn4+jszUlJ75LDR
	qt89aafLAXMXV67TIe0V68Nvuc5NULOzfXgaXgU3azJifI6EjwEas8dtzqZNpvQx
	oodL80rpT8N4FFso0SCrTC+tVcuKg7jnRoI4KPh+eO7bcuTcccmA2yGBisaksVT8
	DQNHUtnZGsviCL3wN+z0HT5wHATiEQWolLvG12KypRZJrNYb5lK3cykTP1bpqT4J
	UeCY/j6DEEpp1D+7LLYipGwFGogsmXFvLJP27q2TF9UisysqoI95mvU43JuQQtuO
	SVurYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab7vcrsgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:48:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34361263b93so449562a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 00:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762764484; x=1763369284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9nGxk6cvPgoYAgcOQslEIVapMqVsIaVsOVTbE/MMoYI=;
        b=XfnyEdFIhM24kL0SJiLbHgLY4GkxXA+NqrXO1YqAmi2T79n2s+zQRFKm9D5n91p6MG
         S7ztCZttB0t1D5WgKSI1pu+K1C1dqMpWTkI+V6Sa3k9Wf3zSfymUfynO40SIFiku4NDa
         oh7yqmQTm1mwiraNoxdBIa9vcSl6ma03EZchWNxsrvQKFSM0NmsBS208F6NxH1o55jQw
         WJYzJKQP7U+4GaFltf4LrlQl5WWs+7hxWDwRWIFXLZNgQhZcKaiLX6HZyYw83c2SzlyM
         mes7KbSRy/snBLuDG1VhPpPSRn0Dd4KirxaYyZbbKxQY7RmLogear5bg7XOmsPBcSRov
         grjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762764484; x=1763369284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nGxk6cvPgoYAgcOQslEIVapMqVsIaVsOVTbE/MMoYI=;
        b=tkwm5HPwucb/s2jaCyG85Azi2hZgTjCoA9WI+T3VDaw+MqJ6hVeQCffFeB2qpsTBaC
         weH0kM3Z+IRp6V7J/VbzhTmZOgoFL61hhldFGiaFfa4RdkWyWMNuaZJXhsCXnorJ1Ipx
         f3/1DNMOWOssOCEYaJXBQoChnp2qyMNbQx+uu1/Lesu0MKIbX7qeQ5nc74lfHMN3hyXF
         KjL0NDFVPoIsZE2PFwWoeJ3BqVVaD7EQZhRyOCNtqDrh/VdWuY1QPurR+BMnzQAmKcJo
         P8aFj1Who2Z0YLb8bpXvuFNAQ1j22HoDv2HivG2pbRvrqmPFdjuKJo0xA/bhJZcfAcKB
         ze6A==
X-Forwarded-Encrypted: i=1; AJvYcCUvZgLTAhTHuq4K94gP/Ph3GJbooYjRYsbSMno5XV4Qq4f8S70I9pHsC/83NE98jL5AvbPKzSvIGuQdKCeM@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbWuHetFdytd46GlF4o0fBVWOGUd1dwXlvvFhEXTV1kMl4VKt
	efdJeL/8dJMmJ2X7Scf59OOeC3UbLiu/kfn1xo188GMz77/rY3gHGjFBWS7VGotXZIyMyLn8hDM
	cvPHAscm8pCfV/3qXKbomA4ACs6xwuPlalqSLDsOXugGqk5QllqQHCPVXzeONfYj4lE8=
X-Gm-Gg: ASbGncug2Bs4MVY6vHy+jxIfTFjgmzvwTodvMBm4eND4+RdV9h/z+dGBaO1QGglircx
	QhQcm/3uS7zIZpTd1eormLEap8tD4qSUJ4pqk1+UgM85xXSGtWxwOBENJ3GN8+Gcr2gcfkjw7Te
	RuWA7fAhvLsWl/16V0g+l4m4succu1UcjbtS4SwZwruJfwpgFw+01Z9vZ9fmrprGLcAHGKQJnGK
	mzmM/rYuyq/HddaTPvqUI1m/9VnYolvA8+V/NOfHyZTE5zvr1IVMzdCWyZPqTHDjFmQEEr33xTR
	Jjf/Zitdt401omJSRRpJ4UFtldfuxHURiSuBf82A3OfKW5X9qRXY6aMGoCaPys4LeYduXNaWBNV
	NXwiSiHoWeBkqA0EQRUuN2Q8g8Lh6
X-Received: by 2002:a17:90b:3b84:b0:341:124f:4745 with SMTP id 98e67ed59e1d1-3436cd09f90mr4674133a91.6.1762764484013;
        Mon, 10 Nov 2025 00:48:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJwIzD534772Ry6R4QdPTmPOBMOUdlbjY/PmzhZ8/CXG+4tHCfvMhyh5bIkeKoYzMjfqRUww==
X-Received: by 2002:a17:90b:3b84:b0:341:124f:4745 with SMTP id 98e67ed59e1d1-3436cd09f90mr4674108a91.6.1762764483412;
        Mon, 10 Nov 2025 00:48:03 -0800 (PST)
Received: from [10.217.216.168] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8ffd3f6easm12380935a12.21.2025.11.10.00.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 00:48:02 -0800 (PST)
Message-ID: <74123422-637b-4209-96c1-81167e51df36@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 14:17:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for
 sm8750 mtp board
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Abel Vesa <abel.vesa@linaro.org>
References: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
 <20251026111746.3195861-4-sarthak.garg@oss.qualcomm.com>
 <4394142b-c96c-464e-9e12-80904755026e@kernel.org>
 <ccce6ac2-c744-4b94-abca-f5710c712bc3@kernel.org>
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <ccce6ac2-c744-4b94-abca-f5710c712bc3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA3NyBTYWx0ZWRfXzHZQUmbTzWzQ
 h8fwsVtsAnq+1qT7kDuWBJ48nifoNChzcPW9NUlMMvsfJ7sERN7cZ0kJcGPQjov0S4cOrkXCHrT
 oulg86MF52kic0zFtDoqq+8EuJJdqrzHUZU7hQeMlkIlzLlPFzEAVBCSjtozLekC+zfJ32UgleP
 ZsSQ9DXlMwh/42LdICHm0XNUrjrJ3RkOSGcVdV32V0A7izxpLde+2ZZL4IB9bE9A8LqBZsiitdu
 vLf2FGAMVeoyoPeyIQe4XsykQOc1ELQ5KG9sZ2Q2+7v982qtmshT7KektQE5wGkT5lV93ZFFrpq
 XhaEi1qwMLmw9YsFPqylBhcPsTqjyeRkA8MlIxpV18nQAJsFYq5gATdcU/ZLFkkhRuC7N8PsruI
 VR06s00ipo1gLAJfmuCMiz7bwTRLTg==
X-Proofpoint-GUID: pbZAnpKWWjA0ti6MiQxFINMZQVbnjuM8
X-Authority-Analysis: v=2.4 cv=E8HAZKdl c=1 sm=1 tr=0 ts=6911a6c4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QHloIlzF21OiCPf7oj4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pbZAnpKWWjA0ti6MiQxFINMZQVbnjuM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100077


On 10/27/2025 8:03 PM, Krzysztof Kozlowski wrote:
> On 27/10/2025 15:31, Krzysztof Kozlowski wrote:
>> On 26/10/2025 12:17, Sarthak Garg wrote:
>>> Enable SD Card host controller for sm8750 mtp board.
>>>
>>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Actually un-reviewed. Here also ordering is broken. Please follow
> Qualcomm style for ordering properties.
>
> Best regards,
> Krzysztof


Sure will update in V4.



