Return-Path: <linux-arm-msm+bounces-54452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A893CA8A97D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 22:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EF7B1902371
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 20:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0785C25525E;
	Tue, 15 Apr 2025 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZMjSpdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6285725523C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749812; cv=none; b=mDY3gxW75R6KUVf8mR4JEtNCiA1iIVUPYtorG8t0TLMi/SYdTLrYYV40GNegiyw7ml4h/ulAKnNIDi4WorTFF37uu6tBGQKzTHeVYQUHbe6zNi82UU4hlWRXmSAwZo1s2AqzHsxE4YWndSmTdb1XszH5g+BXknaeyWSr7QQgHQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749812; c=relaxed/simple;
	bh=DIs1XkOCqzlJlUyWOPVpcWbyCPMNGrSnyyYnEYKKMxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzTM9qtYPdPU6TdCBeHwBEBolZ9SyFOM1/usvcppR3y2jCMHjwSqwCpVTQg81vHkE/2BuM8RhlpbTOkbccUREcKag7V4AMyVJeCbPBiSFIYJg8RiUKwwribJEw2SMgXTTeFmgoBjcNq5pwoiPlydIexOoTUtcJ8j7IozmC05h/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZMjSpdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FI8Qi2025060
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aODywDDcIKzpvI+UU5+uNZ7iuR1ZYrqpVT6fl+5YQcA=; b=LZMjSpdwhUvtS/m/
	8MbTsRsk3wXOAkX3myQHh7dW7geAVv0gm11+dt4t9a3nazS95P7QfamBkg2vryPR
	fnb2/WPeW7d4hhL1iD9hnyX82+ihExrfcXUgtaRe7bxCgNRt9cCBN/EdpJvJc2yR
	Gd5pHFALyGR0PmSqo93f8SOdNSIkAx4Q9fPq4SOzXxF9Z6OdZbFR5x2AYeWRsh5+
	/Cf81HUJbmFqBXE0D5JDXGFGc/I64bmwjEA2NxZ6E3pMyoRtn4jH8opWPAJ28ZpO
	R28mHBUxYc+MpJIVUMa4ewOZW1egb08iPZFb7C/HZ/Qv+3A+B7vG45sabyuuuvj0
	FmD78g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8whcnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:43:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c545ac340aso47122685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749809; x=1745354609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aODywDDcIKzpvI+UU5+uNZ7iuR1ZYrqpVT6fl+5YQcA=;
        b=AeuPlU4dQmr3+XRxfM3zvt0wWNibvIKVbzePAUPF1VpMt3QT+LKefCyH2iSC8hqeIV
         8nFn+2KR6sBHFj4GUh0t4NwVsQA4rs8ko2BBGt2cIq6A5UmCzmZ+rimio/Xr3c+XTm9g
         ZaqtLTJW+zuQwJrIMdz74LeOnPH5TxgwMx8EDDl9VPvDXcs3PNXQDHBOVBPI59lLbrhm
         sQfXhPHT6Dx1qatjoY9FBdXZFx5IL+Dqgas1IfC5u0monOzMs0l+nmtLQ3SetLrNt4FB
         +Ro4/mU3kbcJfuiRpzoE7l9ZsIfnIapmQoc2ZUc/8m6HOYY6CimZKKH1FPPxEFRBrEwi
         ZYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDAD+a06OS5N2fZ5G52VoOmNukt8eJ55qF38BddmV9xACUU4bIDFB+e4QIjEL0itRsCefLEaKEH7mXnus8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoz5KDGqO7cNp8QhH2y5Rf9bxjWADiMnrmlF7ca7Z6+SnEjDug
	cHbcPsxy95+uKzD2oM18DjmCfiU5IdWhCUztU94nMMZJBHi9xRY9BhvbwGHGGV7VuLmDZMuKY0A
	YRe83PWuvMdLp63QRI2QLF0V8WBTrBEPQj00d1ZcJelLLTzhqCUl+RN1TzhtkDj0f
X-Gm-Gg: ASbGncuXk9pMnXveVEN7Uw/RuNQ3XoyQ65Cy0FzrX/VzrlDPm1l79YtjEfJkQQaNliM
	z14sdPSrJ3oYF86nwGhhRy07eCPnveik72QhSBrPM0qnVzevrD5jnVqxb1pspDn0R/oTmx4tyR5
	KOlrqF68DcgFL+Mg2LgcadhZ2CKCWwAaauE/fcNG7RPqJ5gw9x/SBt+OiNupNk9t0tXTon0KyIg
	syti4RbIV/mG32pSO2qegamKF9AI6OQ9e8iOvrgXA22MwNmhBWbU4X2fmanpJ5dfT07UWleQ1v6
	IkO0eItoGK4D4Jhn485vwPT3UVQKDOH+SP2CXZmht7gaEvUPNP0RbhOnkrbPX0EIgQA=
X-Received: by 2002:a05:620a:178e:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c914496cffmr41174685a.15.1744749809368;
        Tue, 15 Apr 2025 13:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEcVKkKGEyqZcoH06G4xwr4vh/uAdYKYZAqF5jvGP0a9Hm8vphz6vSlZ0OwEuZu3i5XW/zMA==
X-Received: by 2002:a05:620a:178e:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c914496cffmr41173085a.15.1744749808998;
        Tue, 15 Apr 2025 13:43:28 -0700 (PDT)
Received: from [192.168.65.126] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d502618sm1561570e87.107.2025.04.15.13.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 13:43:28 -0700 (PDT)
Message-ID: <186c7c60-338f-45e4-98eb-ff1a87d0c83b@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 22:43:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: msm8919/39: Use UART2 console
 pinctrl where appropriate
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
 <20250415-msm8916-console-pinctrl-v1-3-a1d33ea994b9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-3-a1d33ea994b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fec4f2 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bzQ5Osq_D6y9_I280vwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KzkLukf884RC2zXSYrfJDY6omXJGBltd
X-Proofpoint-GUID: KzkLukf884RC2zXSYrfJDY6omXJGBltd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=681 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150146

On 4/15/25 3:52 PM, Stephan Gerhold wrote:
> Convert the majority of MSM8916/39-based boards, which use UART2 with 2
> pins (TX, RX) for the debug UART console. This adds the needed bias-pull-up
> and bootph-all properties to avoid garbage input when UART is disconnected.
> 
> apq8016-schneider-hmibsc.dts does not use UART2 as a debug console, so it's
> left as-is in this commit.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

