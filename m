Return-Path: <linux-arm-msm+bounces-89798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19869D3C583
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C79E74949C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE0A3ED135;
	Tue, 20 Jan 2026 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsBdh0gO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGyX7bHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DEC3ECBFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904902; cv=none; b=Wb1kLzObH4+pKoK45cLFWIJmc3mY8FL08venNYx2VO4fnm/LDHPsRrs3xVToXGnevK4Fb0mvvYmeiS/sJSueObOudWc6FNN6oZtYAbvkJgo1RWAdC+vlZisNpJZ8dr3IJVQIiA4s+OJvh3eBYmI0nEIF5ip1N3gUNS8SXmXb88Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904902; c=relaxed/simple;
	bh=TY5qQnkr/Pb8Ou6iqJK29XJmO4JIFAiFZzQ1J33xdNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7OFyqvDbZpKd/cqcgmmuZs4+iJZLzLhKI4ccJSoIMjJ9MEx8dLsteFZmmqlYiCF+13/D1nlr9V7klIdz6vkKg/I9uCEcZtZmlZYcXmZh8XOsiK0aIL6KfKcnN4Yc80DAGn8Juip7E9ZSbljR/Jb2kEalUdgPMWZzNMn1z7L9vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsBdh0gO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGyX7bHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KA7osu3837257
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1shmyDtjl7JzNfLWDCQha71j8cumzBtSwogmSFUnB3E=; b=XsBdh0gOohdz0SlL
	m+9he5yCfJtMlog6VlTfxSnARPQtn5uPVvEGYNs+IOqCdZTWXSXOhSRjiu72Pyer
	3SaYUJNNT8ZrwLvBKXFfGDZrjcAaNBhYvJG4jOUeJsAy/Wl7yRX5aUlxx3eEsfqc
	hufmVMDT21URDXCQY2ad8RFLDAUWpNWwWYghHVbYMOpfEOQxR2wpwlOhuJu40XCP
	ZRYcZrS2MzOl3/99mPvF+AKFlJwzdPNR6aqe5mruQHV93RX9DPcfyPC7K+wdN7nX
	mL55fGtz2a08a5shDDHxP0xWiida54xxiqtIwWQ/4lTiJuEYk68zBzmeRvucVKmF
	uKW5oA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt7pb81t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:28:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c522c44febso121643485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768904898; x=1769509698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1shmyDtjl7JzNfLWDCQha71j8cumzBtSwogmSFUnB3E=;
        b=SGyX7bHk3dmMraFCclRUD0u67+vS9Jq0e7slRTGdndm+/glwvgbYsXTKv0iuU/LwdV
         VNtJgNSP/3HrbzSP9BCTm8bBhm7TElt5rs7wOxM+SqZNQFtB2T/5NVbLp22Z4/m2genI
         a0ozcCL722CsXiCvfniSBks8Ub1hfG7pNCwztDls1kBMObDaZ3ujRNa8T5LwJYTKlNY5
         hMYTnGSkM0xItbNkXZZwbYlPacsxc9brv58LL7lu14d9QI28xsDHx65xGGjLdZpp7xFX
         XQ/rKkbwUcJdOIdIpvj2DQewbkpUKV+IFi3KLpbk9RPsgazej6aaz7meLYcZyehm0Bhe
         gI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904898; x=1769509698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1shmyDtjl7JzNfLWDCQha71j8cumzBtSwogmSFUnB3E=;
        b=hECXmFL6QH5NYscPj0aDbtE4GQlyczsbxW00q2kvp32xy/zqIIe0KLwdeJK6YslKkI
         pn787Ol+rx5MQHTUT4hIQgy/npvmZDPtSC97BvMY4I9xrAccyAz4iZ9F9xL/9TKh4R28
         Nipd90ubYjWKI7Cx6KEWAL7AcF6Gf1ea+0tEVNOcESj0YcKwN88YXoYxJMnEnVT/VGof
         Sel69bpfdvH2SuJNZYvpP78k1WN9bRZvBKItR176RUgeJyxwdYmjttHMqoMnre9VJn8x
         OwY/yzPBYMbC+2jW45QPbJVKCfYUY3Jqa26AoTpj7WSRRBjvGldmDaYuB3tUZOdqd3DC
         9n6g==
X-Gm-Message-State: AOJu0YytVk239/VvNvmujx74j6LLYUJo4e4S0V7UCRK/C62ue9GjfrhU
	1hYz3YL5pOQ3ydtpwSdch/I51WtFeqQzQRx1TgQbf4gEyyznMumgLerSGQnpiBKUCNEvDLu2fEE
	0hVxC/UvijKxGSRUoO+XIxbXvXfbtRZkiuBGsmaOATdm+DUBK/uoHo7vHBOU2+IOp6oRq
X-Gm-Gg: AY/fxX6Tj6tT5WTRIqOWPEe6zgLJn84OzWopigusQJGrZbNcDwCvJ6chwcJbFf4Bd27
	L9XhiAp/vBivTfgKtX8hBPbkY76R+Poc5DKQgOaeH/1mIYoHdMrLbJtGirABDxwG8KiJxIH2Vtv
	LDbnXAh3xILlrL0HTMoSTlY9j9G6FxmhXN3GHL2tH4zjlR9b880o0wgPn5ZrU9h9VrJOmFeNYGa
	T5sVH/W/jJkdPtKwFbAFmVYOTc2+ZwWjToh934309DcVubPxINtKk/u6ZEoowGJw699CwcjB3aE
	y0dUE5vvjC2EC4bNUSJMHZtEs0/CtSq7rrIqVoCD9DQ5R3qZjwVxa51ziCTAnAKIZc38Vyn5Y/k
	w9lc+AQnyia+U+fm96z4dDIKTTfxaQ733cIVsnOjCS+/X9YQioqvph7UPWHwkItb1wXg=
X-Received: by 2002:ac8:7d47:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-502a1633cb1mr152637641cf.7.1768904898317;
        Tue, 20 Jan 2026 02:28:18 -0800 (PST)
X-Received: by 2002:ac8:7d47:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-502a1633cb1mr152637471cf.7.1768904897884;
        Tue, 20 Jan 2026 02:28:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c4aa7sm13263543a12.34.2026.01.20.02.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:28:17 -0800 (PST)
Message-ID: <57840e58-c224-42da-a505-64f07f585397@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:28:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable RTC
To: nathbappai@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
 <20260119-xiaomi-ginkgo-features-v1-2-3c8fae984bda@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-2-3c8fae984bda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OMwqHCaB c=1 sm=1 tr=0 ts=696f58c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=gUDVtYOI8mDOn9tmRc0A:9
 a=QEXdDO2ut3YA:10 a=fFR93BqyA14A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 48lrEvm60Um9gPJuzYPXKkiniXX1i_gX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfXzA0V8rAL8LB5
 adC4Bn8nM+6wxdj//gfvdAOcrYrJbwJyiMOZMcw6wzFgejf67cRshtQD8ogHpJokK4/FP+7R/eb
 ldioj6Pjs0ajagdlNLHSGnj+5ptVWu1ny4hTtMsz/47As984RQE87hCPTPYO9PGg8VhdV9E71HG
 i5frQcgkyOAdlNxtHQvJaoNNZCAZ/Bb/+DTPWNmd8WTJtklu/NXiMsIhmQDFv38+FQBm8DOCak5
 SFsegwipHSUSyF57icyhwednf51Ev/hFMcW+5ZPmnhlwfbk6KHWiFFqZ4DXdUgYqMKdiueHqYDH
 J1zTik7sd+ypbVqoVfqydow1dGRudS9r82IFTX5M3z3CXrZsSCK0x18ZXu4bDIK+g+EzsX3galR
 ljMjKeJ/uROssVEQgBG4oWjB3hnKxI7VDQt8MuN1d6JEzfqlMEmVkSYOHdnDFArVQTPIhO0lFPJ
 eWnuwElybsAorwUAU8Q==
X-Proofpoint-ORIG-GUID: 48lrEvm60Um9gPJuzYPXKkiniXX1i_gX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200086

On 1/19/26 4:13 PM, Biswapriyo Nath via B4 Relay wrote:
> From: Biswapriyo Nath <nathbappai@gmail.com>
> 
> Enable the real time clock from pm6125.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Let's remove the status=disabled in pm6125.dtsi instead

Konrad

