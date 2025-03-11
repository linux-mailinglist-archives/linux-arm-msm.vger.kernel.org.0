Return-Path: <linux-arm-msm+bounces-50940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F17A5BDA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 11:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4D93A6C82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BD4233727;
	Tue, 11 Mar 2025 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TunRKVYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AD231CB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688407; cv=none; b=Hc413NbcVvea5T9naoAuvZ0I0pzqgOtC65onKsKtUbPSpw5ce7TlAIWH3MaiIrJg54C7cHQhn3CvMTCEbtf1FJ92IPj0Uodz68BejzxwuO/b+iKat9UHkoNMlGa1g5epMYP17J8LtBZ7lV8oNCL8pToNZLU9Zxeo1Z+hKaSFiwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688407; c=relaxed/simple;
	bh=/LhwAatIrYhSKz3Hn3nUzj4oY/T6QI4BOBJtK2+GS6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsqiMsnEqbrl3wD9fFbuUHC+vUaR4yBYqAmluZPj7ux6gAhNb3dn9u2F/V06cHbsx/RekrrEVuD9YUxEYETF5LkHIotjq9KW/Rh/BGsGngrpusiRrIMydyQPTcvbSdWum+eRN9qX9bHkheJG4LERURzX2Bw1zbktnbC09wAkcww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TunRKVYG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7oifg027925
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 10:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvpU8cNRRyE3NYbYhBrTn7HxH5bd5zCkr2AnBxiZ2/E=; b=TunRKVYG8BYyiIAq
	J+t+DI4eSfSh3xb37pDaolOhuEA5qHtJQYdb+sDY4Dganr3yXUIxyPpFoVNureok
	kTV7mEwuRzqR6+xI55extt2pZ7m1L0lUEnP0RYnt+UR9eRr4yND4rucc4mbUkLGA
	Lnm6B2gr6Bv9h9Ia/0gtnYWpkXbeXssNcCEqQP3kbU6/YJm0BYGO+wT0/kgNck91
	jpyZAxKDa+AF0XGjll36u9c1Zm12xSwHRZVZ9TClwI7XlDk+C6FcgCniZib3BCFq
	Q4Bd1CzjTJcQgC8TFd2b5Pu19c6ODX2uZoqWwH2qjCQmXrIIG7eiiE/gyAyoD8Fa
	jFe99Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah528ef9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 10:20:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso13416436d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 03:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688403; x=1742293203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvpU8cNRRyE3NYbYhBrTn7HxH5bd5zCkr2AnBxiZ2/E=;
        b=hPOmicNKMgMlagEWnEKxhVivybfDEFDOpSDp8Bt+BsSjcAoJiOR1C0QFZYUyR0zLCT
         AIdQnwVRzw6qkQlN7UnX3V6nmGpOu0H3CWWFsZlmbJKMowR0cFj9dPI0bUfNV630o0vK
         ODgf+RahRx8le0kX80z441vA6V7x5bgynmy8v3elKNPH5rZfC5J2TlWGfWARjo3PVfMc
         g9HJ0qnC9prbBBUGT36akk3KXyMk9pZcXpDsW/zpzntdcJkQ8aCTeXDGxhcMgxjz5oLR
         TfGD8qcgiZpcw91hWyDf2wM8eZbWyl8gIOtO17hlcRL0eJ7h4jXYPJOhWCenMoSsdOYz
         ly5A==
X-Gm-Message-State: AOJu0Ywj2Rgqx2+ZikbYcV6XU30TExXL7uAGz1at/uZEFov6fHz2SX9E
	wLBOKEOKCPrE2+04FAPo7LFmD+2XQ4xJYMEZ02LFmp/61/bkBoqUQ1z8MyHl/8BgayZVDIACt77
	nXjj24Q1xlUYpq0zpPTplSRiAf7Rup1nJrqtNgbhDmWSDOF9kUVUpoJRiHYJxKTt9
X-Gm-Gg: ASbGncuaMz9v3gXYl5wqu2JVdNMGWu+x4MvkK7Qc5WjfqpPCqulTVvNGhvt5+ZkzdRY
	xZXESYLY7gmfm2gfubD3f6ekYwSaIM5/WqoHgnoWRRSvuH64Q+7r8XmBfm7S2Wb/gLqUfwLxXtv
	FrxshDmYFXY5yTIBuEt7FHWP+BqBco6BX2FeBTpyRGtt3T6k4ocVlGVv5ptDGRo/kMEI96PAtyy
	X7Dx6wUISKPwYAIi2DTAlbClOOAAifkapwsViifrds6I6HkzC2V3WbMo/sMFrhwaNqeYi4YTckk
	sMK1dsAdDdVchUzy02vgekNZeK6hMt1fNsqkgVc/CP9W/Aj+UuuIZP8A/cZkCq4XOTrtHg==
X-Received: by 2002:a05:620a:458e:b0:7c3:dd4c:df72 with SMTP id af79cd13be357-7c53e1d8a09mr587921385a.12.1741688403401;
        Tue, 11 Mar 2025 03:20:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW14GWzzafpI/ZRpdjigJAXfL/a9aWGOu+pEKCihxcSDZYjxrGZ1Np3hPVMmw+svw9Ztt3wQ==
X-Received: by 2002:a05:620a:458e:b0:7c3:dd4c:df72 with SMTP id af79cd13be357-7c53e1d8a09mr587919785a.12.1741688403073;
        Tue, 11 Mar 2025 03:20:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768f995sm8055087a12.73.2025.03.11.03.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:20:02 -0700 (PDT)
Message-ID: <69680418-5a34-4b6b-966f-bb22f0ca53aa@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 11:20:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8750: Add LLCC node
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
 <20250304-sm8750_llcc_master-v2-4-ae4e1949546e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_llcc_master-v2-4-ae4e1949546e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Os1n-ATdlQ0CR85Wwlo2qNzeyQmQlQ-o
X-Proofpoint-ORIG-GUID: Os1n-ATdlQ0CR85Wwlo2qNzeyQmQlQ-o
X-Authority-Analysis: v=2.4 cv=DfTtqutW c=1 sm=1 tr=0 ts=67d00e54 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=oA5OGs6Rxt_rxKO5FVQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=979 adultscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503110069

On 3/4/25 11:24 PM, Melody Olvera wrote:
> Add LLCC node for SM8750 SoC.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..a3f9595c496f6f6fcdf430d44fdd465dda4bd39e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2888,6 +2888,24 @@ gem_noc: interconnect@24100000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		system-cache-controller@24800000 {
> +			compatible = "qcom,sm8750-llcc";
> +			reg = <0x0 0x24800000 0x0 0x200000>,
> +				  <0x0 0x25800000 0x0 0x200000>,
> +				  <0x0 0x24c00000 0x0 0x200000>,
> +				  <0x0 0x25c00000 0x0 0x200000>,
> +				  <0x0 0x26800000 0x0 0x200000>,
> +				  <0x0 0x26c00000 0x0 0x200000>;

Please align the <-s and "s, the data looks good

Konrad

