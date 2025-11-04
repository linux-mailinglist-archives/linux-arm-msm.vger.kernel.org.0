Return-Path: <linux-arm-msm+bounces-80292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B09C3104A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36601885EC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF5614E2E2;
	Tue,  4 Nov 2025 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjuGDS69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avMRRgJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CCF257AC6
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762259809; cv=none; b=tuFnAGyuTBHFonR748OaCYxjiTwN2Mee6+2/NERMCv+0y5ciJJsGie4k0RveZ2S/xM4WMrna/tPIV7CtLUDw2L+NGDYMWDUJNYjpEoBXMEe2SHxPPn4zxPwvJYhUQRwwpy9MstfxjdHccLDLY2oSVDnPyEo4qTZKWDoDeecWjRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762259809; c=relaxed/simple;
	bh=MKPjX0L8WrcR+INRuFdC1ttAlo+vyzbZXTNOgiAExVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkV/tM81WRVrdWE4oED8ja71zZ/t9a3SlAmu7PXdmTC3jWmErvttUxrLegN9BgXtzaxIa3PFqsL/5Lv9/S7b7hjx9UrRlU9NqDVV5jn0esm+TNYL0AT+7PvhZnpI808J79ZLcqHMZyM+++1jwqT1AcR9VtlNMYqul3Sg1AbKz9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjuGDS69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avMRRgJ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A49VFOf1653197
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 12:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8LpgcQHoTetYhZVAG0Kcq0k1eZLVh7h9jjjApr9iBmQ=; b=hjuGDS69DURgF9Zn
	huFkMJ74eyqg3+ue25UgM5CjFhczKD+hhfnzPBLeJJScvsOJ7IF3aGymdYss1VBZ
	dxunKBm3fqkCN7Orus5nqAVcXRJU4M9g9zHUVQCleqwQFuOFdFQoa1V8s0spY4J7
	s6q8N8xY6g2KUnamBQn5BdAi0sgjRn/tiNkiIfgYk1LNVDCE8n71FlnmQVgwp6od
	hSyRbDic5qdSOoArpWFbjCgwWdxuSLo0jUzaoYyvnTw2V9saXes47lrEJQgWiJfG
	485GhHPB3UniGA+/LQBYX+VsJHceM8O76hsC31q/Mn09yH1SgXEZtSTZ7KMEFk4G
	pDkYSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ex7revc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 12:36:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a35e1923so20055801cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762259806; x=1762864606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LpgcQHoTetYhZVAG0Kcq0k1eZLVh7h9jjjApr9iBmQ=;
        b=avMRRgJ7YsaGW9bQPnLPYV/n5103crwEo4gFVTLibr4BLWcJXh5VB1LZWZsYVkv1dB
         vzqvgUo+ywb9B2+ExrIuDmESxLXN+gIO8cK7Jqnv16IXbam5fQL7qCiOeQlbLYE051mc
         bOcJPzxclb2ZiohvTo0UaIBDeMW1k2Rd1qMFNRSdMHABw903nLnrboGM62GcBBR3HcVY
         qA10CYk3ymYuygjLXEMy6iW250bXv8/7aBBvmSYUgt8xE3x7vbF+zoPI3pbLf2wTNEKS
         5la34xKrpX31wRNE+8F0aTv+ddSPA4gur7kYOmooQ2kS+TQujIXJw60DVdiMnUneWoY2
         EpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762259806; x=1762864606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LpgcQHoTetYhZVAG0Kcq0k1eZLVh7h9jjjApr9iBmQ=;
        b=miZgh361xoc8olpClL8b09CtjP39QW1xsGxOaP+RtmIR1Nss+yitlE75aYxBGVE+fE
         6Mtud9iCokjOj/V4MbA3LNRwDWNYdqL1oTwtm6QQDDby3vb3Wcr6CMDA0uOHeY3vV05l
         7oveEVUeTo8W4eV/cgecfpkGOgB5Mz6647lppQDE2AaIv7v8FIedUdd1YMQN5yXytab8
         6I0M6mrbB2Y6cuxxle18Wdba1nNFRn/fGxLhp8Cql5PHw6ZGcSzG80Lmgm3Pmsu8vj1c
         3Rcxd0cRYggQboOx5C4BPEJJsU5yvq7Ts5SzNqP3ZrstOSfsR5Km7tRD1ea5RjGgkOj4
         s90Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhzN1FWmGFqfUeP5GMditixEVpiqg/yXukfrPtN3DDjw/ziqy8CwA8MgzmIJdiBvWKuCidSbfxkGD4ORzR@vger.kernel.org
X-Gm-Message-State: AOJu0YytDO07zcj68U6adz/ECp7ZvJSnxFqEMKpYdQ4unq50uV8CHdW/
	A6OdbQfRM6GnFHkp0CmnEx/yj6mYmjgW/v0lnyFH00MvhV8gnU2rgFXVEbIBAPQWATVXBmZPqza
	RpO5crfVFM/8dBakVBgRQ4aTKPMm7MkQe+RhsZNHxiufx2U97TMBuGkrHf/gtcNI+iFfo
X-Gm-Gg: ASbGncuihjAd50/CJ3TFFRTfhcOHwaL8+tt48DkgEv92SAzIkNp3U5BBggqltrCfuRi
	ero8Jegk+tibLreRvPygjwbD22l8uw9jV27Rcsq7dJn/Y8SXcpxgHv8i2VO6REw7sdSFymliASL
	j2NduWh4PBDHrLzyTuQtPhgPu/M+Ni7cvwklCLt2hrnZPlaSwFQNV3qU8gKEFXpE50OZ3QIySF1
	vY3GhCVgQOep1anqa7Dqqt9EHKikweGTr9lDKVfYJDe0T2xWf9k9PENENah9/Jw5twEZ9y7vWmg
	atdqvZm6Ei3uALP2qv3SALvQ59dnW6a9HalyJ3vRtZiONng5qp8/I4eEbPxu4Dic0f9LKA17fON
	KlUyGf3XkXZd8pkNiDWD6wRdO9bfoHHLzHDSMqEgePobfZsJpAJJsiBcj
X-Received: by 2002:a05:622a:835c:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4ed30f7f5bbmr116285341cf.9.1762259805680;
        Tue, 04 Nov 2025 04:36:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUAyPDC5PYSrO2dIUFKmMLfBGLJx0+GvE6FlrR1aAei3V/LH//k/NgfbMKws7RxoHkAawXJw==
X-Received: by 2002:a05:622a:835c:b0:4e8:9af1:366c with SMTP id d75a77b69052e-4ed30f7f5bbmr116285021cf.9.1762259805046;
        Tue, 04 Nov 2025 04:36:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f28d0sm210833366b.16.2025.11.04.04.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:36:44 -0800 (PST)
Message-ID: <70c2f5ba-df98-4ec0-a420-915bbc65eaef@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 13:36:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1
 and SS2 ref clocks
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251103-dts-qcom-x1e80100-fix-combo-ref-clks-v1-1-f395ec3cb7e8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251103-dts-qcom-x1e80100-fix-combo-ref-clks-v1-1-f395ec3cb7e8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwMyBTYWx0ZWRfX0i7f4N77cD1d
 xHDc0fUWtN6/0O0LOYMkHffl34oj5n9AB+UsJ0WtdsHDYFkZDwzeQXLb0EOBT+ETYk1I/Beccj4
 R0FxN7SH7V2P6t/hARzWZy2nJO4SKf6vLH6R9+kXZH+eWTjlp+x3XgzV+CxxEOdnet0RVTP5+bO
 q1NQNkcSfO+zUqV0VFi12ux8C3gABLj1DpbOP6NoEaZT+5tSDtiU726r0zVH0rG7qEdPXjo68Fn
 PFH5lD5YHfIW0UvjNn48F8ulQc40VfSLi3bN33co7i4q2wOyrmNtyVYyAsvXwZscrzSpeM14Iz1
 cQJLz1KJPCam950uXxmj/KOr992CetMvw7SghhFA8pAC+3NBDjMry7rcrKBVmwq9Wdr8WcE3S1P
 fV6fwjslmZGKFRjR6/Gw3mTUDQ2/cw==
X-Proofpoint-ORIG-GUID: P8VqyBkV3EAfRBwzhrrW5Pu7s_-hNwlD
X-Proofpoint-GUID: P8VqyBkV3EAfRBwzhrrW5Pu7s_-hNwlD
X-Authority-Analysis: v=2.4 cv=auy/yCZV c=1 sm=1 tr=0 ts=6909f35e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hWDvCZeVexTezMgbMN8A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040103

On 11/3/25 5:51 PM, Abel Vesa wrote:
> It seems the USB combo SS1 and SS2 ref clocks have another gate, unlike
> the SS0. These gates are part of the TCSR clock controller.

FWIW this is a conscious design choice

> 
> At least on Dell XPS 13 (9345), if the ref clock provided by the TCSR
> clock controller for SS1 PHY is disabled on the clk_disable_unused late
> initcall, the PHY fails to initialize. It doesn't happen on the SS0 PHY
> and the SS2 is not used on this device.
> 
> This doesn't seem to be a problem on CRD though. It might be that the
> RPMh has a vote for it from some other consumer and does not actually
> disable it when ther kernel drops its vote.
> 
> Either way, these TCSR provided clocks seem to be the correct ones for
> the SS1 and SS2, so use them instead.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

