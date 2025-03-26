Return-Path: <linux-arm-msm+bounces-52546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A1A71D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7583816EB2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787FD2192F5;
	Wed, 26 Mar 2025 17:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deIMP7iv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDE91F4611
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010090; cv=none; b=RTpS8ok6xNQX1ffLTpMk7WXzxAurhwPQgsSN+xlxUNxCgsd08EJhLqBTmE0OYJn8Fn0eg995h6yYzWup6LgFVRZmmm8Tlb+JpCvNjCzHbOvCv+EFaa7p1gvE55fPWASAFPW4/qfTb08UzdIGfuibr083c/F6X31Gac+OOKuBORg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010090; c=relaxed/simple;
	bh=VHUxls8VIPB+bwgE0jcP6Wo7v6VkMcBSBygTBg1uTyw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtQ2x9jALSYB3fhUHLuU1ShfFja3JYFmuE3iy5egWxuYRkwnPDFvETEEf1SdnOHHuY+RYPzvalVeatWJmIH9zz/UE6EoBh053CnKUHZV09JqLSO2Rw1rpvHOb/W1Gi1MjZxy0Bf6UtEh0mm+pkKnrOwGk32ZIiBEvVWtH35G0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deIMP7iv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFK2VQ028963
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0S3hgXPJr+8ikf9pw45un5xz
	S+GPSbI/uN9U7waQCZs=; b=deIMP7ivGz6i3cG/Bje38eWjgxEtT9oTt0J7Ggv4
	GQyVBqps3VDxYlfitR6NEw1ZctTEtALdS9N0tf7OHmxRhErEkFaGhwcg41JAffj4
	ZfdsZ7nq5YLDa/LxDDvSkdWMva6nOB1NJ07ox3Y2Iba8iKrgep0cAAeFp5WNUSwt
	8160x2RHu9iOK96MuboheVkWGB1dtleXILCIXvEJ+kW/joj8QquImgGrlH4lUqEV
	lf+oN7XLPB88JMHVMYewaTgxvjYkrqmKjwqaxbNgJG5bgogxmv7q+4jYIGp1e9l3
	nlLv3aSU9EkU2aAhQafeBa1s8K15/5souLKqbSFya0v5Sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktencmmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:28:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c59ac9781fso22090285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010087; x=1743614887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0S3hgXPJr+8ikf9pw45un5xzS+GPSbI/uN9U7waQCZs=;
        b=SZqToDUtZHqsRGNj6i5kCn4KvgMOgVB1DjK7gYKvnEPPuvQGyTkhJRCou8MTM6g4cn
         X0Np8fRZl9WWgAdrSMLQwTxw6zIzupmJ6Cpb7lifqxWtOmM6oetbkwBm550sbolGnPWL
         QyYNhFv8zmwxHWFWREXJcMnyRdKPylkdLMDkWX0VsdG2vh3NbGStHO7e96gTKGoErPvu
         aWtrtrwvj/Flra74WRZBQ5rG33GVhSr3CPsTidBudC6vfG5MrYPUGXPMBVckTxFkGpk0
         /EADf/cY9PMslXsLl9SOM9okhrGGAvoVVd4BcenDqiZmxR/MQKQSEkxyyzrZGSsnSGSi
         ZU1w==
X-Forwarded-Encrypted: i=1; AJvYcCXILkU4AGvXhMmwnE+WKhYkO0PMug6bz9wuD63W6/RVXz9k3PrmzXG1VKH82PgPattg2NLrLLULxLuehKOS@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwK+vtDak3Fz0jrfsQ4C/VnIbe9iP4bM8NsST1nwtRtxuMmH2
	+iMrUeDKNed47EOyC1D203FGLdwM6hx2SifPV0mBxFxOmD4xkMN8Vex4nLTS4TBVvGd+iBsg2Yw
	W+5ArcpEyEnr9TPBQTzBUYABooWQ+XViusZwAGOoBzdBfqTc1LUH30AyVFkw6FXIP
X-Gm-Gg: ASbGncvgEfdx99jM6AKr8xT986uALR50pdbXWnBs7YNIqTlpnvJ8hGtOzkzqmMvegth
	lEpvBxQtOLWvMfZ4AA/akRxVvFEMXNGaf43Hl+iYzcB+fr5c1xoP5lp8mdCwi/KudWmnzrySKDn
	jHxU+DBclDmnvoB4RCXb4NpZth7BZoRFi19U2kGqjahuczEhUrgCv5Hr4etLtt7NZQ28OnALFlE
	RI4Xfr7ITX+KXE26fMhUveR5sivUmBb4KiDwHdV4/rXezpygOMoM65qQc1lYmLoX9EcU7ECSZEs
	2rFdWChwmAjR3kGSoWwUd/P16QQGascadR8IdAYHB+VjdulnQ64=
X-Received: by 2002:a05:620a:6193:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c5e49344bbmr753061985a.18.1743010086630;
        Wed, 26 Mar 2025 10:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiNZ2bjssGBqVdwGizyv1ZkwRj4Svqzyb5jA/H7jjsZneLjonq8dH3M8N6XH64FI8vKcNGzQ==
X-Received: by 2002:a05:620a:6193:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c5e49344bbmr753055385a.18.1743010086060;
        Wed, 26 Mar 2025 10:28:06 -0700 (PDT)
Received: from trex (144.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedea3sm10144635e9.3.2025.03.26.10.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:28:05 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 26 Mar 2025 18:28:00 +0100
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: qcs6490-rb3gen2: add WSA8830
 speakers amplifier
Message-ID: <Z+Q5IM0Qj8J5xZUm@trex>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-5-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317054151.6095-5-quic_pkumpatl@quicinc.com>
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e43927 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=LfYPmjDHqwmh8J85qtw9fw==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=hICUP55FaW_hIgXUPesA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2lN9RFo0lud8vzxPG0YJ9KdnrZ-l_eP9
X-Proofpoint-ORIG-GUID: 2lN9RFo0lud8vzxPG0YJ9KdnrZ-l_eP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=804
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260107

On 17/03/25 11:11:47, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 27 ++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 23dea375c213..a1a3df77ad57 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -870,6 +870,33 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&swr2 {
> +	qcom,din-ports = <0>;
> +	qcom,dout-ports = <8>;

are these number of ports correct? from my unit tests, 8 seems to be out
of bounds (soundwire probe error)

> +
> +	left_spkr: speaker@0,1 {
> +		compatible = "sdw10217020200";
> +		reg = <0 1>;
> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrLeft";
> +		#thermal-sensor-cells = <0>;
> +		vdd-supply = <&vreg_l18b_1p8>;
> +		qcom,port-mapping = <1 2 3 7>;
> +	};
> +
> +	right_spkr: speaker@0,2 {
> +		compatible = "sdw10217020200";
> +		reg = <0 2>;
> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "SpkrRight";
> +		#thermal-sensor-cells = <0>;
> +		vdd-supply = <&vreg_l18b_1p8>;
> +		qcom,port-mapping = <4 5 6 8>;
> +	};
> +};
> +

also, should we enable the soundwire controller?

>  &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
> -- 
> 2.34.1
> 

