Return-Path: <linux-arm-msm+bounces-65706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C720B0A997
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 19:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3033C1AA86B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63EF2E6D34;
	Fri, 18 Jul 2025 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/7pbHCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36C156678
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752860253; cv=none; b=JfVcUJFeCCW850mGq6/p3Bq7qg/Oay/wYqTcWFysryWYV/XOjn87QHCyrgTTKtt/8HfnEIGZERUweMyd/XfCZbZTYiEtlBCYPSfF4Mqp0IhOXLGnJx621KARJF/LoYFBZgPRyqOc54Z3YVcTPZCn+2q99R5nk8jdRoC1XtbuSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752860253; c=relaxed/simple;
	bh=Jp1XqFkdELGuoMkw/LjGQL5oKQgMBjwV/r0rNb05WHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1FNDdudK2vwczEMyD87mjVwA6US9VaX6icIWN8dVvG3rvDooRgeo459/t/wYsRT+WBimd3yZGh3xaEe+SvLOk5R7MGCjJSJEhyEvgCnN0rI5SpooWsBHEujfWHYA0EHXylEdTwW6z/rlLQgo+Ha0OGx3SDTuojN1lUsoJVCNYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/7pbHCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I9DESF016003
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DbmW9l10evhVj/WcPjTCyWMiSSALM7/4VQmz6IFqWv0=; b=I/7pbHCNKoxqjt0d
	p9wMuOFhH2rdGi+3XLuuJLcfUwd/5RaHKxwdyXJNPFumvuRqFKKsMeG7g4r7rOMb
	CIs9AslrXszcPrdE0bKqwc+10M9bh4gH4ACiPDSNjs/ClEGKlrgznsjAmq9VlfCu
	w6tVuyZb/jcc0EYFm4WKxffWg9CHTlVOlavnyjh4iF57NUpk6gDV6Me6w11BOqCy
	Evx5A3WTTVq7koEHgj2LFUPkrUf3ACEBSGd6ljPLvS0hfM5EaASqu75m9LeYtsjd
	nbLdlR0pDSFzjrGtshLeakqx3/fxvSIsxG1CPGm9BSPHnKvsx1x0gewdK848eR51
	183yfA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc4bsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:37:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so2173107a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752860250; x=1753465050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbmW9l10evhVj/WcPjTCyWMiSSALM7/4VQmz6IFqWv0=;
        b=R/H7g48RWvVJw5ZOiRdO3r2RJ/VpdGGnD88guICfxhcDQ9cd7/RfxarEpG/VQ9T8T3
         qw9zoNMk/pj62yO+EHHd+f9h7W8T3Tef/gSwGmkm7PhXrzMkPddfWNm46O+mCk0kVBXn
         SMiNqTh0DUVhGY1PVC/+ilIwQs0IIT+6M8q59eZ61NtzwMEdOCeMYZ9LB67ztdv0jRts
         nuPuCaP5ZqN+xvwx/xyKh77rfKHBh+HpZiOjr78PM7fud6ZWj0hnZp97ndgk7BPiL0gR
         HyZTLjfes7wBjoT89a+7sx68R/VTSXxJjxI9GAFX8ssR1KYuMlVNOKfxHbIyHCK+4z+j
         mqzA==
X-Forwarded-Encrypted: i=1; AJvYcCUpjAGES84wSrl69gfCzkPLgBfWhLghEUw3miQDiLfrvax33B9P+gtg7X/kOAQmbIM04rgPSLAPRgZjne/B@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbtRyMrqekOPh7o13FIicels0YuDbyLogzo+fNKO7CZ3hwmMe
	P0GsX9kaWUYCVzalG3G1p0Rpm8i7mm75Bb+RLXdJOQQnEADQijGP2vk+tApu4ekvuo2B8AXWbPi
	BKTBY16GEQQmnI73jxDDdpM2uIgQy8xpdlci1b+KTex543HNFqZpjCR/23qALjK5vIdAS
X-Gm-Gg: ASbGncs30BKmMMVLoyY1RLjyVY1L3lq0TeRwlqQnOwWBHc9HuEOPCQZfbkuHUX7im/d
	mtfp8iIqQ6eECOamcOPgjxrFpbQBIBWrG5xepwQLbL8bOtiPn6gmt9XK8841aBwoOTC3IdGDzZP
	HRA7pCw9giRB0Fxe/RwM/jhLrNPLe4JO/rijd4LMC2rWkBrDxwZYm+evm03yHXKEOer16XG3INO
	fdcjRhxd2UCgsYJMCbJTA/GJoLJyyfS5umnYzqSSTmPaLCjZnpIFJAZZjFjKjK0S9aQkRgzS+X6
	C8aJrCCcW/m7nAn5Is7YSOPG0gqaN8cEEDh5iGeHGxIRMdlu0Zdu9/Ek/AGBlK52AxU=
X-Received: by 2002:a05:6a20:430c:b0:224:46a0:25ef with SMTP id adf61e73a8af0-2390c7f698cmr13397776637.16.1752860250366;
        Fri, 18 Jul 2025 10:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS+WhE3jQDC0YVjY/4E/XNzovaX5vUwzvI27UOQtAKYgfzXmsNsUeiIAZoMDUSIbvOYGM/sQ==
X-Received: by 2002:a05:6a20:430c:b0:224:46a0:25ef with SMTP id adf61e73a8af0-2390c7f698cmr13397740637.16.1752860249913;
        Fri, 18 Jul 2025 10:37:29 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2b48sm1581307b3a.19.2025.07.18.10.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:37:29 -0700 (PDT)
Message-ID: <2f5b5e6e-5041-453e-b3f7-b10b40bc6f57@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 23:07:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <aHjJG2nrJJZvqxSu@linaro.org>
 <40534488-24f6-4958-b032-d45a177dfd80@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <40534488-24f6-4958-b032-d45a177dfd80@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a865b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=tMiizUMu9hGndvLFPAJAbA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZEZnheZsc53CzuolOOIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: lRJwyfMQkftG1LGd1z-jxZBdz5pZdami
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOSBTYWx0ZWRfX6RSeN1/lk/FN
 1yL9Zc37lMGOkqef8AlW7uSO5B9V0hTHAc8218aAzhFzX/bPbfabllRHxZlLvR1tJwIcdysfKki
 KYO/MMH04R7BJtgUjZDBdJ0r3oA29qsL2kOnE6nCP+nPCXrpoR0O0CHkDKzwZx1A0a6yq0Mdvz0
 USZIihthzek4NsnUVq8A4oJsKygGS/woX0ZA5XKQVkZ24XvocP2E6aEN0d7it6K1Sh4y0JrTs77
 ZrrbBZItgeD5Kojk9s7L/tif3FI1TspTQ7MPEUawS9c8o1eCBFryVFlhX3QpeWONm6M2UDHWPvP
 18Dg0pIdjc4qY8+cTBOC6l5A3PDGW4cFvNPN5HwsTlRq0NJUPLl2XdLi6kGMJN8chbc5egayTNW
 FhOBk8A8a+7s6QuFDdSWlogxeO+0BtO5xdFDT66rVxAHTfcNK12OWx+x0L3/aUg3O8aHcSIw
X-Proofpoint-GUID: lRJwyfMQkftG1LGd1z-jxZBdz5pZdami
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180139



On 7/17/2025 3:38 PM, Krzysztof Kozlowski wrote:
> On 17/07/2025 11:57, Abel Vesa wrote:
>> On 25-07-16 20:50:17, Pankaj Patil wrote:
>>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>>
>>> Add support for Global clock controller for Glymur platform.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/Kconfig      |   10 +
>>>  drivers/clk/qcom/Makefile     |    1 +
>>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
>>>  3 files changed, 8634 insertions(+)
>>>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
>>>
>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>> index 051301007aa6..1d9e8c6aeaed 100644
>>> --- a/drivers/clk/qcom/Kconfig
>>> +++ b/drivers/clk/qcom/Kconfig
>>> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
>>>  	  Say Y if you want to support graphics controller devices and
>>>  	  functionality such as 3D graphics.
>>>  
>>> +config SC_GCC_GLYMUR
>>
>> Wait, are we going back to this now?
>>
>> X Elite had CLK_X1E80100_GCC, so maybe this should be CLK_GLYMUR_GCC
>> then.
> 
> 
> Yeah, the SC is meaningless here, unless you call it CLK_SC8480XP_GCC,
> so the authors need to decide on one naming. Not mixtures..
> 
> 
Glymur follows the "SC" naming convention, and historically we've
adhered to the format: "SC/SM/SDX/SA_<Clock Controller>_<Target Name or
Chipset>". This structure has helped maintain consistency and clarity
across platforms.

The case of X1E80100 appears to be an exception—likely influenced by its
unique naming convention at the time.

That said, I’d prefer to stay aligned with the established convention
used for earlier chipsets to preserve continuity. I’d appreciate hearing
your thoughts on this as well.

-- 
Thanks,
Taniya Das


