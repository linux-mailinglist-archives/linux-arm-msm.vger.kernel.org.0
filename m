Return-Path: <linux-arm-msm+bounces-89206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FAD23E67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 11:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2AA9300D427
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EFD337B9F;
	Thu, 15 Jan 2026 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lli9wUqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZYWPrZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9D2221DAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472393; cv=none; b=iYBxXnHWyTiFT9TcTzaBfWbZKAbOGfGlPpEyPN6m1LeSeNqOYUHUoHzNyZo8vZ6R//OoRR0Un118MpR908P3Tbwfn+ZQ8Ti2LIueL4PBkfNsq7WwygxObtW6Jlr/gyh38M7/PxsyP02sNzuiaRuvf0+YnuWlSkNS+SS+4IJQLBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472393; c=relaxed/simple;
	bh=3V4uCAcPNq3dSdV/O+Tlp8FlLTxB6bpTafTOVyxjik4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajN6REjDnj4pIFBkbg5UmdRbPAuZKYHQaRHHxmbO2fGiwVB1fuvEsGZ7GYrcQzdXomVbqec8hNsn8vOWLS0Y/4YAwTub6Gtc50rZu7+i/7R62Mem92zcs7Tl+NAI8xx30bT2+kVYz0aUDINP2KA+nyD5MLKw9cHofhn6DV/FJic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lli9wUqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZYWPrZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F9WiK52057855
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Il3X9Wlp8C2NMVxdP3pGfX/fV4JJqh1j+hN02p3jjlU=; b=Lli9wUqWUgvx+D+f
	1sv+twj4jafqbjfttzi7e0vYDy3fKgMMis+H8HpL1fUAFSLRvOUYvIQfZqtUOavb
	e3SNnzU/i5YMHpJwo74xqqOJTIqen1HfI5WyABkdrvl6Yutc5QiVAIVnASHdg93D
	/pItrfmU2FXXnM1QTBcYihpLzAYGXlg+3ebv/xvGuEbzKvSMoA38tWmUDMNmV8Bt
	86H7k2i1E2TV6tzTee2n+tIHiNhhKJV9WQny1E3Z9HrC6ifBZEfy3VV29N5BkUr1
	dEI8QoI6b6ERi8l+Kfh6DSdSIP08Qpk2/uVrvYjHD47oManP29eaRf2QFB/G/rCh
	la4wvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxg4yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:19:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c532029e50so27534785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472391; x=1769077191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Il3X9Wlp8C2NMVxdP3pGfX/fV4JJqh1j+hN02p3jjlU=;
        b=RZYWPrZkn1bxcGrN1J6ew6etxiIwmtrYqATeNcwVXESgylWiAnLmgU14MDFGVqRaBR
         fTm3yN1ff+/0gCDFQdEEYhIbamc6go9ucBaMZZ9N4JKMtXJJylcwWdsA+zV8hDxuSsOu
         f86BkSoGUEQebwPNVBGIBZzDiXhDyrw630S4x2TMaXDbEVBSTAZBljpwgKTYpgUsdURI
         qkaLL9N9jih89sxSxNaEa9JJ45RjPvuJ84pTIffm5rWLM2OqkR2Q8SXLZk6zz1CFZokp
         LSCFmYNC2YEOO626Z34fltH4TeOGX4YNXE1Z8yHVQKn+VMDeEOP/qobhxWRMrUpte9JU
         Tu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472391; x=1769077191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Il3X9Wlp8C2NMVxdP3pGfX/fV4JJqh1j+hN02p3jjlU=;
        b=rFc3d4BsEw8K0pfMU2FsNnHpXCkMtUN5oBI9ElWwORECSeSw8rxyQC72GsWmJeZWIk
         t/V2NZfBDibPnzS3qzm8/JZuECBD9th3ULW6tk3mKr/wxcC33Va2Rbi7KjVB788Gn8Iv
         00pQdHC7oOalZXH8DycgPpdRvSEmga6Qa0arRw0kmA7pRFrP10mWZzKwxrNWA/7NESyr
         5cgjs540PYZTKBf4M3ubBFYki9XcQAll2rgMxl69l1+2RAwQIdxl9QHUJvJLdMsYKqsu
         yhPJGb4cysqbU4elox1DL2bCJLXdqo3ecycT+sF1sExau+LOzIZj+cUz1f0CG+Q+wTT7
         SswQ==
X-Forwarded-Encrypted: i=1; AJvYcCWedyrJ2wfYVQA72uSlIrPEH+7CPKWaqcN6+ASucqnIGOhf/ASsrY3bjvgYvk8lexDFg1TI24/3uGShFxDg@vger.kernel.org
X-Gm-Message-State: AOJu0YzER917Ql+hQ4N9r5wa5uQqM+qDLv4KvBYjUAldgRIHsTuo17Z8
	p/2mTR0XoPJ7BOja1/rycloSk5eZAizNc0yt9b/H4vCS4lswqmnlEkU2f6AkIDWvx49qfr3A3zM
	Pd7k6oCrYzd/5d7eO5ydZVGoeQbrm91OKtotIRdpER1sW1JyX3NTn6I/65PM2na21XnSA
X-Gm-Gg: AY/fxX4dGVhalR2AVKWLXlPHMSJgj/XCPEwpLn6UlzW1qCE7CfKpbK/qRmSGINceKjI
	x1NDhmhRbOtmfGuPw6XDwDBa4hzSPf+Q4Wq7q4qjTTHmqsc1y/JPR/p03RuCN4Q62dJDlCAxta0
	Ri286sLTvTsuEBe/Um+SCQAtW7eNojzXEeoshzE9MnHRfhv7wqbfyAH1LlASauO4xAm8JXZTx7P
	iw6XwMlhqFP1XeQugbX6zjy1tONow1uGHzmnlPTBVLOvnKdfy72xkyRKr6tYTqnddsU1UpoOzOV
	zmlUY5M+dqEhZZrXwpdjXMOojos0ywNTc3ZmQ+SfKQ5Da3QPoxI8kUsKdDcJ3UB+y1GrsyaJg4P
	tzS4uGyK294zLLxmbY8McjNbFMR31FepUoM+vyc2OBDopmMbc+IBxJEYqehKrrE6+tx0=
X-Received: by 2002:a05:620a:1a0b:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8c52f972925mr593058785a.0.1768472390791;
        Thu, 15 Jan 2026 02:19:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a0b:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8c52f972925mr593057985a.0.1768472390324;
        Thu, 15 Jan 2026 02:19:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87099fcef6sm1353880466b.22.2026.01.15.02.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:19:49 -0800 (PST)
Message-ID: <59ae6b16-7866-413a-a1d2-4a735024c108@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 11:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: cpus: Deprecate Qualcomm generic
 compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260115083503.43796-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115083503.43796-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=6968bf47 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HDgntgnsfx8HdXrLBxsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: _nUezO_oiEvLaDELjKf5t2xjUu3SwxIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfXzPP6kgaQ0cgg
 U87iMCyI1GojiuUhFbF3FFwGVjWrP7s2gMnVGRcXaSEo1V67T8OCrnl5oCCI/3f+TMR6uNmpMZG
 De/P4Yb4bdHDtpNJmP3Ul0sv2qrI2KUsheC19AZbVNCJKaU/Ge7EnZZuPybGumOFEyK2fDrMDJu
 3GVg6hUasc2vShnMfHYctqApVOQAlP4Hqvn/LPtlPCghpuJWHiYUiIEHBg45U4HXSVAIAwTOeDE
 /gAE1JPS66Y/KerU2bePGNdEDMpe9J4qojU0tSYIO0I8ZwPHqs30r8j1lq5nxBsTlK0wZjsYQeo
 WaPSfL3rX7LT0FnWfVxFRaUTsih8YSTngdgOfmsyjsuK5wqB5t5ASW5d2WhGmESBsMA8cxZ3SBL
 dB8rR2SwDl+KuJH9GU7wdh+7JiglSyvr07/P35kFBMvjtg71hLMow/OtdRpr9WAgL4JzK8pZpDm
 EvmCbrMyELM/PSwZO5A==
X-Proofpoint-ORIG-GUID: _nUezO_oiEvLaDELjKf5t2xjUu3SwxIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

On 1/15/26 9:35 AM, Krzysztof Kozlowski wrote:
> Move four compatibles for Qualcomm Krait, Kryo, Oryon and Scorpion
> custom CPU cores out of the enum into separate one with deprecated: true
> annotation, because these are too generic names.
> 
> These are names of the families and there are significant differences
> within individual processors, e.g. Kryo6xx can based on architectures
> from Cortex-X2, A710, A510 to A78 and probably more.
> 
> Just like other vendor processors are differentiated, also Qualcomm CPUs
> should come with specific compatibles.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> -      - arm,armv8 # Only for s/w models

I'm still bitter about this one existing

$ rg '"arm,armv8"' arch -l | sort

arch/arm64/boot/dts/arm/foundation-v8.dtsi

This makes some sense (see [1])

arch/arm64/boot/dts/arm/fvp-base-revc.dts
arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts

These seem to be spawned with a specific virtualized Cortex type

arch/arm64/boot/dts/nvidia/tegra264.dtsi

:(

[1] https://developer.arm.com/documentation/100961/1130/Foundation-Platform-introduction/Platform-overview/Processor-models-in-the-Foundation-Platform?lang=en

Konrad

