Return-Path: <linux-arm-msm+bounces-68810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2827B22AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF78684048
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F502EACF2;
	Tue, 12 Aug 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwBTCCJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF30D2E972E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755008484; cv=none; b=k0yLGytpnCbgYoO+M2/bzHqZ4Xd2cdLB4wyyo5jCG79DjcLkM7JOg4bb+pNNYdxsndakjAZx9WTbpeOoZvZ1+f6mxY4VncpUXbzoTJsY3cnqHoqX6NbLY5vzMi9fIzNCuE7zH1LjZRSBlh/aAe6VaImdQ/WicAaKKd0yAb0CD/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755008484; c=relaxed/simple;
	bh=gfuHTagF17Ec8Db9LA1xP5sCwdVtVM7nvbXpiYZi7SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgIwRyIzkfURIdXn6nmRXBA3fkHm6Vb9MJHg/jlvaAgERAxQ4CIKN0ui7luZM6AoBf59YhCD0SbIHDJgiiglqlF2bVdSm8LRGJ6IujDWdk0/qF35qmygCi1IA+/HNa1XXwJHD0YU80EK78NYkcbPX2s7PNb40tr59WijuCX+a70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwBTCCJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvfFj020363
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2CFaYge9d+yp8oBGPwz1QQ2VOoJSFwhIkoJHoNOR8I=; b=hwBTCCJ8Ubj/xMZ4
	iOxebIVMvJwPA1XqQP457mrT/r7lMWxIi1nFK+G1cbsW1WimYIEVq4eIZKPQzJ5U
	T3RQLKGYX6+22O/+1D72phqJvOScVB5zVo53VSEMxiwxFuJPqG0kk+yaqWkdNA8M
	fyUeamHICyhXnS+l+fg3giqYlJBCWPHHy8rT4AdZte5EDbVqxH9FnPRnSyRI0DJd
	Kvm3m4xILVNWJkkaIsPlRYGVAxT4JY5Xwsxz7woAIUzo/8/Hg1vCSgNrjj9YcLc1
	kKOSC10A2zPIz4CVODao9Qq09ArSlIABUtIJhk+u/U4sZPTzi8tElEEWmx4C4Lo6
	oioGKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx6jwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:21:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e806e4ef1fso61030385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 07:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008480; x=1755613280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2CFaYge9d+yp8oBGPwz1QQ2VOoJSFwhIkoJHoNOR8I=;
        b=kX5KcFIjck1gVHA3oSoEp0M/uMbL22N24ChrlCAdMUJALzsGuk/i+XwhVI26TTSwD2
         8SUfkjmY9PCJmgR73NNc43JNF3qvxKlbkKIMu2Zs9wtpB2xCttaK2faaMQLX8thS1HtF
         Wk4rRfI4rK8DQhO/5Fb1B7Dj8gGdhGflGtKJOeMqknFW0T7TO7qIMFH3hnZiRSYfePNI
         sd5c22ASFmAaDAUAazykiHe+2S63dniArHaKn/Imt0N1rD6hTC+1xib1W2Y51hxakHSX
         eMjE3N8qI+bJgYsJywnj4nEwQdypR2upaLBVgg50MN3DuwlUVN4EtuYvpdwnXHZeStxK
         WDyQ==
X-Gm-Message-State: AOJu0YzZrXpBjv7xAiii7+w7Hmyfx+udTJGrrkPT+NneHX/tjJoWX2o8
	Freoev0o/U1akxmDMpTil05CmfVvmfxAgtYOun/WzY6yQ1uSz5yuR5EvzR3qCjqrQBkMweBcP+1
	J85Pw88q4p/SyH2VIq9ha6bX0xi8xv8Nl+BiqA/CFNz04LMEhZj/NmnRKAdBorhm1RWSt
X-Gm-Gg: ASbGncu7ODdNGWoiRflWC0h6aL/zSbR9HPWOJYYq4vK4G+QSZ2PidAjkws/3zf+znTo
	KozKvywsf0/B/dQNtEfoLk1VIPP4qryxpoWJWbHK/Fx2oTe32Jk30CwdIhx2nKHHhNfEYjcvfUO
	+VrFSDSLJhetf4rnPfFOuqc+koXvAyEnKCXlWqZ8S0WVPOMQdmqt/I40YdofEaKq7KBFuLcitZ2
	2lRvzsGfip7Yfr1IXRIty6gMZqgfEeKFPtqNmk+whmwFvjTVhdcc8rvml/HJW1Tt9CNB5XoxPIZ
	Dz5b0kfnEL7NImaGZKXvq5echZVPmxfzOfYhqdilkbtF1yOFyxAtc8fN
X-Received: by 2002:ac8:7d46:0:b0:4a9:71b9:188a with SMTP id d75a77b69052e-4b0f6018279mr8546511cf.6.1755008480009;
        Tue, 12 Aug 2025 07:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvi0YztLn+CDmiojczoRdgEFlf1XLkiuwgJAb6OHV8JUzQolkq39ajVYiwmX7PvKoHQJys9w==
X-Received: by 2002:ac8:7d46:0:b0:4a9:71b9:188a with SMTP id d75a77b69052e-4b0f6018279mr8546111cf.6.1755008479436;
        Tue, 12 Aug 2025 07:21:19 -0700 (PDT)
Received: from [192.168.43.16] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23fb8bsm2186132066b.123.2025.08.12.07.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 07:21:18 -0700 (PDT)
Message-ID: <e414163e-e171-466f-965d-afb9203d32fa@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 16:21:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-1-2ce197525eed@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806-b4-sm8750-iris-dts-v2-1-2ce197525eed@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXwtPJoWea8w/8
 HdYuB7fkTHlfk2qSxBXQfC0JuW5DZJhW/Yry078PJpKhii1s0ti8V5rONf5aDllaRSGhPUAJDdG
 j1xK5fS1BwTy8kT2XZH8AoJnbFAlYmXPNnMHxtViS4spoOB+grc0hzWqpbVVcix/Bu58NIbuFX/
 62drOFbDRqEYZrYTz7QFLcQH15NzzOCptLvsfzIMZ5CDhJZzZGiD1H0dmska1gGeqQldzAkFn6+
 edYE4Kw9qlGH9AEhlTDf/YyRbzxbKuhCo+UuD75+9PmpolAVx3T65Oco3mThpHnaKsp6Cww2YNe
 evz5YAa+1XHp9ZYCHHuteeHp2RY67B+hmYjBcriueO6vzUfz4qylR1FdemL6dJGXjrVQP+Mvk+u
 eucIBdtK
X-Proofpoint-GUID: ULRrAMCV0GS6YePBoFDaqBKCXyUUuYn0
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b4de0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=OjNCceoZ-5M9CiTWRqAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ULRrAMCV0GS6YePBoFDaqBKCXyUUuYn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/6/25 2:38 PM, Krzysztof Kozlowski wrote:
> Add Iris video codec to SM8750 SoC, which comes with significantly
> different powering up sequence than previous SM8650, thus different
> clocks and resets.  For consistency keep existing clock and clock-names
> naming, so the list shares common part.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

[...]

> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> +							<&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-420000000 {
> +					opp-hz = /bits/ 64 <420000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};

There's an additional OPP: 570 MHz @ NOM_L1

+Dmitry, Vikash, please make sure you're OK with the iommu entries

the other properties look OK

Konrad

