Return-Path: <linux-arm-msm+bounces-65553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6627B0963E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 23:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37523A5E06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 21:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8489224B0E;
	Thu, 17 Jul 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCQ6Zj5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5D252F88
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752786382; cv=none; b=ReEgYjOdD6vfssny3FbagQpFrb+BmQg/nwq03+cp2wr16HAz2ekKbseCcNAIVkMozMhg+JvFBsPL/tkHVqy2bVyg81NHFdlWLGNErEG7scFELv2KOvzoSz9oesf0rpQjqRumMd/hcQmLDtZ9lZSamI3QQFokBbZN0E7gcFfcZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752786382; c=relaxed/simple;
	bh=Fu5f1KYcPNBKXbwBLRZ4Cig1/7uNC4oBZT6MsGsCCXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsX2QgOnui6jKxlicpadtSOuRKddRArxXSfR+myIxhlcLHT3m51Ph0g+fPiy9wiF5WF6d5224gAj0pC6JMMhjd8qLbqD+Isg2IZa7IGe6fPR/GJu6+VO/FDay/L+Kn8UjGk6qm5xLQUiKv8KgQBu7fcWgntfUYQpfLqiprSRssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCQ6Zj5t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCmMqt008525
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pHw80GM2tQXK/P5MspgwmNzeXrdomfpLEtnn34M6J0=; b=CCQ6Zj5taIIZgg77
	BjsrbRhNCnxCoHw75tzik23Z5SkOjFbzC3ZWStbyKsGNyAA/8nYux/lu0Gdwf/EW
	F/FadNR3e4hcsj/VB53T+14onJAyrVEondsZBKolYuQGymdKLSABgFCT9rPZ3yez
	0BVC8k3zrT3sMnUxN+05vHZX8BGVDhUZ7MNuObkXxagKVeRUfFHuthRc+Pk2PvO2
	uFEKBcvvsFQevJDztr3weGvJqNWkUsRWnusS7W5tfSf69ECcOrSWR9LiOaRoIe+e
	lfdZ4WWm+mgi0hE9jTKA3ud+aIcxLDy4bgzq0McXapnCbw4I2pd6aVwOABwgVtzb
	hAFFdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb962q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 21:06:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd5e07066eso4294586d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752786379; x=1753391179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pHw80GM2tQXK/P5MspgwmNzeXrdomfpLEtnn34M6J0=;
        b=I6DjY4WVWtTCsVZbM7abMevCZWOAZGE6z0MiH2wySjp7FwKdpN87PC/xGhLP5Mqdc+
         gz7BdC4y8Mlx9dK3qqPcb5/RYm9B0gLj73AzxfDUhuIPhuZVNSzVu1grmmCzTlYGh3ZP
         RW5/LcHvMbI5ykoAFy92EPDrH0aPERBUBHHhVYJui1QNFE9JptiI9k8QO+vuVjr3rtJq
         qZsJ3vSb7UspNTDTsIbcRoXKzgkxv7Vrq4Ff2OnOe/SHD5PHNiLyyh93eDMf6DYMpD4E
         2vbhQ9/1C7kpLXfG0XLitq7c9QjqsoKaF9UWG67OtHue2ikICyJagoyKSfCza/ITfJmG
         JlOQ==
X-Gm-Message-State: AOJu0YytzGUWK42yRtA/Hy1lMtaoWVGE+kQ/vQeA141Bk7YlPsMTuznh
	kRCbncYUwJWmD5splfS6w1ejxIh1bg2rQ+tOPV0xJHUy8UX3/fn2lczQueG6olOuKqkBO838kR7
	EPwT2NJaPNpJIPBawB9RN9/tqygm02InKeaHhA6ZcQLw6XXO4mthCg8C+AWCPbS92z1Me
X-Gm-Gg: ASbGncudkivGbfP2y12qjol9PKZRg0ANdhhuLM1J/Bfwbcs0OZ9Od74U91KZiR0rONh
	Dx3Lg0k4FOiIr6OGsOaMG1FyCQ9NTvWDFRGSvGDM2HqWv+NVOLK5VphhdWGC1/BCATfwli26lBA
	hyry5rKgd+VfelB2U7181bFE8EgY15PJnbV/T+IFXDqxFLjTE5uGuEzfTIg/3s42qU+TC+Y0+94
	oAfEvD3LOIGqPeStba6PyfDzHT2LUZTz1jGiNeHA9/xVgC3ejunAXJxFhB6DqLZRv5BRYivDW/2
	kSVppS8fVWfai68Ai3i8PCxYY5W3qfZujNWdJ3c7LGm2fKSrAmBAB5RFipOPwgUAPGWLBppI3Kb
	v/5ID06cZbS2+JYYDU9S4
X-Received: by 2002:a05:620a:28c1:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e342b37074mr503117385a.10.1752786379380;
        Thu, 17 Jul 2025 14:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgsvETj4x558m5O4J1Q3oaDXiBHmdl68wKzu5lszhWnL8Pa+XlDwiszt+zOKmmwEGKjcAMgg==
X-Received: by 2002:a05:620a:28c1:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e342b37074mr503115285a.10.1752786379004;
        Thu, 17 Jul 2025 14:06:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bfdsm1408812966b.120.2025.07.17.14.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 14:06:18 -0700 (PDT)
Message-ID: <b5a1314e-6733-41e3-9258-c3a88b2c90e7@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 23:06:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] arm64: dts: qcom: qcs8300: Add EPSS l3
 interconnect provider node
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar
 <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mdtipton@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
 <20250711102540.143-3-raviteja.laggyshetty@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711102540.143-3-raviteja.laggyshetty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LnqdkWCw-w3zDEplRTWNRcH7B5qZbsCs
X-Proofpoint-ORIG-GUID: LnqdkWCw-w3zDEplRTWNRcH7B5qZbsCs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NiBTYWx0ZWRfX0iiqNvOlsK7N
 CeFH7IYQNXvD2MfwG6Km+f4kYJyBsJaC8jQipnFqJCDLbE2LWG4j1TNa9vBono35YyiIiQRZbQ/
 r5WHr+6u9vF1P3WJxWRdYB04WTNl6FMhjURSVWIliYasQWVzz43OUNObXqAbb/ZPQbc1ynk+88E
 gS8qY9CjcpO7t4AvqYtnmwXru4CeaI+vEkapnqni4y602Wf6EvsHUTRiIXodrpOSgN6sLJ4cl9v
 ucAB1RHepEC27EfSMi5Q5HFAf3A8Kxi1loLTPjAy3mNck9Dx6cW4IF+GEpb/5ncgzHNt48cdiSv
 PTZIqMl/yGKjiGInJcphdEkkMUMeGG5Y35wbofqGKDvkL3dVfsxEOlIMTIH1zLpEGEOQ4c6oaSA
 7tQLxv8f8Ru8Wfnott84GNA9tDDeycqy/uJNp/iSeTv+36TRYqf1pNJP/XHYQWXgZbCZBfTO
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687965cc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=yqcj6WI3IahE-w5yY7AA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170186

On 7/11/25 12:25 PM, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider node for QCS8300 SoC.
> As QCS8300 and SA8775P SoCs have same EPSS hardware, added SA8775P
> compatible as fallback for QCS8300 EPSS device node.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Squash patches 2 & 3 together (because otherwise you'll still be hitting
the issue I described the last time)

With that (modulo me trusting the numbers you put into the OPP table):

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

