Return-Path: <linux-arm-msm+bounces-43631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1049FE668
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B233A1E5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF091A83E9;
	Mon, 30 Dec 2024 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am9jdTXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062471A08B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565233; cv=none; b=E18YQ4EqCuIzYjuwpJXlgbXpGj6jpNmTkVY7qrNivI7OfsydWp5USo9aux6CZGie5D6+a0FmfV0FlsU7RWKLVlp3XFoOvehWQMchM9adtTJJgU7mGEtFDFh4JYyD4caBd4D9716wIMMCknJqGp+emKL7Nqp2/l/mxwW7szyidVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565233; c=relaxed/simple;
	bh=i5EVFJCmK7Rqovvgh/o9kGdw5+i6pUP84saj8z6RJkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxryjioGo37OCWlVzu407OQJPoESrGVutfgVOTg156vfNLXgNJt9FMiRW34L1t7PPRBmjQSOx/LmBI2s/65jJWGE3NHLGHJ+1STEY2tQWqXxs44qm67xy/V86TPFxLAp2IIGtqWRsEQMcw32NSqoG6/h9sF0+qpX1gueMEBCZWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am9jdTXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUCvVH8019737
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWfrHYIyslj1zoC4xN788TjzqzobSha5e1Ol0wCaWXg=; b=am9jdTXtzCfkXk2F
	F45Ek2HTYCcyUI7OFhgI23i8FSPUur1LAje35LOt3fFzdEs9PI5eUq2Uf2/TQOmR
	BqzYsjrA/rdbXxr38CnMTMP15hdrgw7fZsLCyXU639yuFShkxNw3/MTw2nby4qzD
	WCFMJF/OoSzm8OQYx5w74jicy7IgB7fpdrbQVyM1ni+tgwPDp2yrlEeo5pf99r7x
	JcHDxWIdnI0j8kqDSpNETvCHCJF1Q/oVwdQsS64eIrQzQmuYGQZVaj6Fd9Vg77Cx
	Ke2/mCqk8XHV31me5m3I4bMM2OZtnnG+3VcfI2R4WHPyEOkk6bdSNvgJTENOsuwx
	idadUQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uk12168u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:27:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8a3cb9dbfso11919846d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565230; x=1736170030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWfrHYIyslj1zoC4xN788TjzqzobSha5e1Ol0wCaWXg=;
        b=N071GN9glhrn1ob3/EKh9s8IuKq9qcXpNvuTnUxCI23BO/uG4I6/N/51UmJXJZw4bU
         oGAWk0Q7bIss2gfnjDT8D5ynvWSAbbETIczO5xJwHltyDCsYXv9FkExZcvuI9uK5kdrK
         vTmd7UvUA+D8B2/I+fkJeNmRP5UTw2pHuVXpbZJdv7hBpXVaNfcm0vX5dUSrQROAch5j
         NzKazvaEXlj6kOP8yVPbmmWBgHhjG8bwzp+88SHRCXzrgEatskbzKgMKNXNN9fHWrMR6
         Tev+qso5EvnZUvEwHMnV73ai8eL7sazx/nnfwK3IXUVKHWd2YQ8ydr87xqYS/4cn5ucr
         U29w==
X-Gm-Message-State: AOJu0Yx+/X6oRIKx0ihX67kFQGifu5sa+pCFaLV8Jh1Bse0lGcJpkM2z
	PE/f6VD6HFawtZCOonAwMGQ22wu2n1KQlkRpXBeAV9XAZedyWzq2WsSLDfGb9zzNF8bxS/WHz9B
	vsvaCSDFwg6pZrcxCyLpRTn9/FMaTedEK6iIzaQTUSkTb1DBNODXqrWTsdNnUdG8u
X-Gm-Gg: ASbGncvto4drdll/r4BRPeWZUtN8gLLS7pMKLB2pOQtuwfHqNjjDnS4KRqeKUPn75LQ
	hUorYd0T4aUONsZOkkUJCdQrT5c2xupCpy9Yvs3294nM/dwdk8PvXZ9Jdp2io0h4AyU5HCKBi9i
	UOI2yEFD+PFphtpR15bcPJn+P4pZG1ZFlopr2xU2YPix/9TgNTHQ7gIDRElbfSmrRJbWi7SOgsU
	xlK68GmRRq8uY07DoECL+Bzz64SLcCF6mYatJzjoPriICPdJsoKJXYyYvqYiE//f8XmamuawMSA
	fTHEMJo/SzXK0QeDliQnSXp7FX8DdDj8XZs=
X-Received: by 2002:a05:6214:715:b0:6dd:8285:8506 with SMTP id 6a1803df08f44-6dd82858523mr52359126d6.12.1735565229927;
        Mon, 30 Dec 2024 05:27:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPZlkiJTvMohOttcyupV5V5435QTp6eUhDj3yrU3QpJhd9p4nBkVLRSGOKNSiSG8o2gY6qPw==
X-Received: by 2002:a05:6214:715:b0:6dd:8285:8506 with SMTP id 6a1803df08f44-6dd82858523mr52358946d6.12.1735565229601;
        Mon, 30 Dec 2024 05:27:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedb05sm15161794a12.68.2024.12.30.05.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:27:09 -0800 (PST)
Message-ID: <71c6609e-e853-4680-939e-f3c9ec15233e@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:27:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs8300: add DisplayPort device
 nodes
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ritesh Kumar <quic_riteshk@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>
 <45643708-c138-4c77-85ce-fa7d49f2aa72@oss.qualcomm.com>
 <d536bbf0-4e8a-424b-b885-a22870bfbf31@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d536bbf0-4e8a-424b-b885-a22870bfbf31@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mng56u0ijBri-J4iyzSFHVoQX0i932bU
X-Proofpoint-GUID: mng56u0ijBri-J4iyzSFHVoQX0i932bU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300117

On 26.12.2024 8:03 AM, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 5:36, Konrad Dybcio wrote:
>> On 27.11.2024 11:45 AM, Yongxing Mou wrote:
>>> Add device tree nodes for the DPTX0 controller with their
>>> corresponding PHYs found on Qualcomm QCS8300 SoC.
>>>
>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>> ---

[...]

>>> +            mdss_dp0_phy: phy@aec2a00 {
>>> +                compatible = "qcom,qcs8300-edp-phy";
>>> +
>>> +                reg = <0x0 0x0aec2a00 0x0 0x200>,
>>
>> 0x19c
>>
> got it.thanks.
>>> +                      <0x0 0x0aec2200 0x0 0xd0>,
>>
>> 0xec
> got it.thanks.
>>> +                      <0x0 0x0aec2600 0x0 0xd0>,
>>
>> 0xec
>>
>> For lengths
> got it.thanks.
>>
>>> +                      <0x0 0x0aec2000 0x0 0x1c8>;
>>
>> This one's correct
>>
>>> +
>>> +                clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>> +                     <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
>>> +                clock-names = "aux",
>>> +                          "cfg_ahb";
>>
>> power-domains = <&rpmhpd RPMHPD_MX>;
>>
> emm,we use RPMHPD_MMCX in qcs8300 mdss and dpu..
>> (or maybe even MXC?)

Please verify what backs the PHY and update accordingly

Konrad

