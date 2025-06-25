Return-Path: <linux-arm-msm+bounces-62447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B881AAE8287
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 771601BC0204
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0B52147EF;
	Wed, 25 Jun 2025 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYiyE+l6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AC258CF5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854065; cv=none; b=d6TfrILdrYYuXPtR+nMpowb9zhyJRoky16WdvPHw5ZJNXxz/Z7rnsJlJo55jx+sId/JaOEYGFgofdu+wF+iTBE/OkMJx5wAvcPOe3quu3JpNgfwqbpu2ZCBEYkSHRA+0fIjrz4b+Ywd7uJOJARTQFprHUqzfDIniPerBXqoOs3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854065; c=relaxed/simple;
	bh=5yqfQFrzXljuR9WcvKD23xmEcWvqoiPzYpT8pvVnSUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dveGIdAaQeAlKUmghYR6lmW6lIwTTcONifFUoBTUfG/QaYmgUiiTRQqRe3c/83oHpzNInMfuQj8qnDh0WZS+upHmqBaYAg986URsxtZjgGJbROsWyIm5wRRjMtJAAqTeabTfqdisA40uqqpWyafgShjntnm67SAdOjop8wP4+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYiyE+l6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4ldrV017715
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXaMYHHdy1hSo129ywhFjHkER1funcnc3Uc8Wtr6BfI=; b=SYiyE+l6QwX1B73R
	q2cYdl84CL4p4tXbUJuBHITc+8Y0KYkt3IT3uPiF6s7oMjSmE2IHnsqnB750uvhy
	gMS9mr8ynlH+S9NYpKshx6eXitccZRS5e3z7EmOD84aTbnuiLA4frYzf7bPBYmbX
	Mt+jbVIVF+Hgtvit3dAQfHMG8jjzXMQIFDr5Nw73ftF6NvwtpFYCniz2AbOg88FG
	vK4UfiP/4aTV1QRrmWS3//P7DWuXxkPTUm9XFfqIOO+IzX7+bK+HRfcg64OOyBNK
	DG17QjDTYg/M6aNB/PkCX471S4VY4mTxpwucays0xc7fdpRjPLyVhl8s2WlmoqLn
	6n2AMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5rwg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:21:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so171234485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 05:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854062; x=1751458862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXaMYHHdy1hSo129ywhFjHkER1funcnc3Uc8Wtr6BfI=;
        b=t+O1Jveo5bsMGJkENxPsYmqvlLvOWsfLXtAsGaHMcyYcSDZw8ddz9V74fW6PXYlDaV
         vLkEyu1FfjcEAS8Ce1pW1IAi4iZ/+A2TiJJ5HtFmbNT7HqIyius0Oddlk9GI9sgOC9Ov
         7tddP5EKMShq5oFO00v0Wexc5c/LNP2n1r5L8ALLzTLdns5nHRySCpNIKCRLlPetEqV3
         VIKqeCtjdSHHnIMv8ykAf3vAgO1u+ZN6MxWJNKPhlckTbDmEthNlsFGDgfHjT28r2tbB
         bZGoxz0lkOUk0CL7rzqtjpJNVZvETsfdG0z/gL39psD5IcwWgjiniCbvraY/x/3JqjVG
         MksA==
X-Gm-Message-State: AOJu0Ywau6P70AV+g7cnR/SNORYqC/abybW8MdAaiWBR7yprcsPWuCCf
	zQuUCxa/XOGBJidHP6AXfTlVgJ02q+exqu5CjykN4I94FghH/NxZEhY3ziSu8cQm54Snm2kO+PD
	hbo1oLA3iQabawB1U3bMECekijJwJO1qjWEKsGbAYecAkNXYB6r5O69tKED23XQyfg+Xl
X-Gm-Gg: ASbGnct0QRPJAeyHp4oQa/uHDcvCvuRBZmzrsydpDb/zbefPYAM5A87xMpYJ8K4B34b
	8nsxxgT/cQde6CxHAUIpfUTzIdY6dn2/XsXCnDjgZOk6h+8t29AIHXx1iq9w4wOEjQPw9cx/p0c
	HB0dLjqJz/cCBlchjd3CPicdEJmTpD6PfcK7gLY/77lV+wcc51m4ejE1EU8j2QfMsYGpu5XibqU
	NZTJifXzqm5YT/Oq54Y6LL2jZPjYPz0QaC87HhGabxA26CV8ttMpZ/xWZyJk+8WLDNteOvOUFkP
	Lhj71aiF5X9njdOJQpwg8IZEXdxbZzsERoszX5vO/y8a+55GXCZBmo3fGG16Xg9Bi7Jcx6FzYUE
	EepI=
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr121900685a.4.1750854061741;
        Wed, 25 Jun 2025 05:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCditgNqKLkT3Kcb/76zkTHjqL5rN/Om6Fnze1yjtsZfzkyU25uWLCyTODkKMaOCcRJaX8Dw==
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr121898885a.4.1750854061275;
        Wed, 25 Jun 2025 05:21:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm37502066b.135.2025.06.25.05.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:21:00 -0700 (PDT)
Message-ID: <4f8fa0c7-a208-4ba2-994f-ec7a5da0d39c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:20:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
 <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RPr97roY6bNu6YXXDqGEbE6iZgf7tmbL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5MiBTYWx0ZWRfX24saHH2kAiHF
 MmbCIvaCjdWWQXh8g6bZZdeEY7ummuebSl24+AkYK4mF1mKSIPcsUf/3MQydsuxykHJbnRRBFu0
 V1mkpWp/h+myfadzrKvUNBeyVKxV9myyHIxbjQV7bGgcdbMn6NekjO9U+hknBP2hPMilxnOtuw7
 66kz+XUNfOymSZ7/lkbcl21ChbvelhT32j+HDLqA5xjtF0Vv4hV9+JJDV6FfpGJZfgvAz25AHKh
 cyf2gr3LkMTkk9pCzKLiqy1Ox/5vhpqKTLtaolJoCEpnoOROomRBgThICaeDfOj1XuGKaVFwy9K
 t8SRWCkAV4tKDHjCZl0kiVU3McI4xQ24vKZn5mncylC3lTnQ0d65Z/4n8Ztldz4likY8bVQY2S4
 L08mHR/W58x1GqkvHzbVAyqSmpX8yr6R7kVtR+XCSaIVJ9Ioe61nnShWz+w01L5vHoRX51ka
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685be9af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: RPr97roY6bNu6YXXDqGEbE6iZgf7tmbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=763 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250092

On 6/25/25 11:11 AM, Luca Weiss wrote:
> Add the PM7550 and PMIV0108 to the pmic_models array.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

