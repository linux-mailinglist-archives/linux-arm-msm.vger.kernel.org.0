Return-Path: <linux-arm-msm+bounces-36822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0B9B9E56
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 10:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFC221F22F84
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 09:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9884B16EBED;
	Sat,  2 Nov 2024 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xk0Geu1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644CF17277F
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730540206; cv=none; b=YJqA0mqmclnz39NTL2UjNdTjMlsqmjLnecM4jDylm0Fd08FXoaVTyptAzctx9bhGrc/DgKuG8+sAgQKgle5KHYXMhoqTmlcZypDt82SXXkW0mEnjR2m/tP5G8NlAdKyHiZH4lRGFH6F5zCx77fIW1fBZ9f2zQxZohfHV+B8OrzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730540206; c=relaxed/simple;
	bh=Cx0/s3T64MtFBPK/EzjOE4Oh0d8RoAs+/LlAbuNrlGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQgGiG0O0no/xf9vvnabUpUGCnA42c4yrZHPXzeH9mvocZviinmOUeH0vfQzFRJ6EXnJicyoG2yoLect4FxgZdxNYohCzxYLvJbnPQ5eTntG0d0APKuhqgN4vlr4QZf8KuO68xsi3hCrrZ7SQAmnI1PNr49f1VEXx2CirOGkoRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xk0Geu1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A24WWe2019079
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Nov 2024 09:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y29GH5vL6Son0tb25oXfDxF5f1oIYnsxUcrvGbyq8VQ=; b=Xk0Geu1CeiQW1ndf
	Pn9GI2w1MxAJ3FOx1FxiXJLrMo/GWN9TR7mN0OvvekYBAphxktXPhuUGAy1j4zQH
	j93RFiOFVrQkIpMxWXXK0DOcBGIEs7cAAn2o7UFmNo4XEVL4YfJUom1m9AT4O3oX
	ul0pOKwPFCoFyUtP5ba+NihPZI7StxQh/q+Am02O2yQUS3PJBgPtxv11j++JgeGV
	iRSm6pahuuMNEjmBKrzS3gmHVv0gbcEqlZXPuoOnsxLIRpCGJ8f8Fx7jY+v7x+sD
	gPVE7eKH4lRwkwVg6Bd087wmYQzwQWWkMjsQwWJPkSAOGRIQfeUDLMdAHAQbpKs2
	d7uSIg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ygdf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Nov 2024 09:36:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cb9afcecb9so8448486d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Nov 2024 02:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730540199; x=1731144999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y29GH5vL6Son0tb25oXfDxF5f1oIYnsxUcrvGbyq8VQ=;
        b=gHpJtwMMJE7Si1bwAI+kss2v/f6TxbI/oDGdIdwkrDH7qZF8Qf7r+741wiszdyVqYq
         nqNTtANhWWnlknFCrZf0oYBOltaQ1W6WSGHcwE2ZC004sf8vo9H7EmtJMAOLzh3pRlXl
         ufIgrBeo7KhsJFYGmg6vOwUED7/gycFo2yXnk4btJ7/FEPbelypE8PJy1W3ruGTWDXBG
         ddeI7nXBJTa/Q3XKUkavNSyBYUQCDi3qZ8gxN5dvU0Av/ltA4+2Q5TTFyKqQHGOITML3
         /QkFhtDmYikg0DlxzH3Fdnb0P+Ep52zeAtxfRuW9nxHtILwca/r+uSFbWAnXed6MCiqd
         Dbdw==
X-Forwarded-Encrypted: i=1; AJvYcCU6uo2SX746A6YV5/3DJpfy7AKIll424/iNtpE3gY8EwaS/3E8jV2nZ7AOBUTSIDAIY5oCdK94t5Ijbxbtt@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ+0cTcydPb6uRedNHdVZO9bgtM3uJa7uF/VtqIbnaueKOWBs8
	rhfnS96PIXdlCSlIOO9QmFs4Ccy+kyYlIkGwuoDm0Cbw7wM+lNGVSJ7Mg8tEMNtJjb1147kuUop
	ovRGXIptQj9/+LDA+epp9zFBLBwbw4ETG45pvfg35fxq59vWec8gi7Dj2VMf2Nzr4
X-Received: by 2002:a05:620a:45a7:b0:7a9:a632:3fde with SMTP id af79cd13be357-7b193f6ff70mr1685020085a.12.1730540199399;
        Sat, 02 Nov 2024 02:36:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwQP7gofFmY9sgxMvy+PKIDrsRwoGI7xSwcZsJP6aZF/ePuF6h/5RYlGz0LMgoXkLvUqmbEw==
X-Received: by 2002:a05:620a:45a7:b0:7a9:a632:3fde with SMTP id af79cd13be357-7b193f6ff70mr1685017785a.12.1730540199014;
        Sat, 02 Nov 2024 02:36:39 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566442easm290268466b.166.2024.11.02.02.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 02:36:38 -0700 (PDT)
Message-ID: <ffff8335-74b3-4f1d-adcc-a10de5aa3e3a@oss.qualcomm.com>
Date: Sat, 2 Nov 2024 10:36:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] dts: qcom: Introduce SM8750 device trees
To: Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Will Deacon <will@kernel.org>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <172978739477.623395.5604249801475913676.robh@kernel.org>
 <3ca1f7e8-1204-4898-9e7e-cb6423c122cc@oss.qualcomm.com>
 <d6452efa-5d97-4c29-a2ea-8c97569dbdb5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d6452efa-5d97-4c29-a2ea-8c97569dbdb5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LYWsq145Bw59IxroKHbVE8JUTN4TLsUU
X-Proofpoint-ORIG-GUID: LYWsq145Bw59IxroKHbVE8JUTN4TLsUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=956
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411020085

On 25.10.2024 12:46 AM, Melody Olvera wrote:
> 
> 
> On 10/24/2024 10:22 AM, Konrad Dybcio wrote:
>> On 24.10.2024 6:33 PM, Rob Herring (Arm) wrote:
>>> On Mon, 21 Oct 2024 16:21:09 -0700, Melody Olvera wrote:
>>>> This series adds the initial device tree support for the SM8750 SoCs
>>>> needed to boot to shell. This specifically adds support for clocks,
>>>> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
>>>> compatibles.

[...]

>>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'power-domains' is a required property
>>>     from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> This I'll address when reviewing the dt
> 
> So for this, let me know if the following seems about right.
> The rsc node needs a system-wide power domain defined. To accomplish this, I would define
> a system_pd node and point both cluster pd nodes to it via power-domains, similar to what you did here:
> https://lore.kernel.org/all/20240102-topic-x1e_fixes-v1-3-70723e08d5f6@linaro.org/
> 
> Then, extrapolating from that, I can define a system-wide idle-state under the domain-idle-state node as follows:
> domain_ss3: domain-sleep-0 {
>     compatible = "domain-idle-state";
>     [...] (omitting a bunch of details, but you get the point)
> };
> 
> And then point to that from the new system_pd node under the psci node:
> system_pd: power-domain-system {
>     #power-domain-cells = <0>;
>     domain-idle-states = <&domain_ss3>;
> };
> 
> And then of course in the rsc node, have power-domains = <&system_pd>;
> 
> Is that correct?

Yes, please go ahead with this

Konrad

