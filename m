Return-Path: <linux-arm-msm+bounces-55588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7034A9C386
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50678925FF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBAB1F542E;
	Fri, 25 Apr 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQ8XlJ6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863321D5B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573447; cv=none; b=I5F5y0MOoRpePNX6GDTc3aR0MEIAJlZZFRWA/MzKgK8/2quniN/FjxTIxo7vSTM2ID0DH/WvoE36uqOrA6th6Caii/Q5AgiZaRP74j+82M3eVp4DTBCijYWea5XFyY/sgIpwvTay1Q+bzaP9Bo0io8Jn67DpzLdREvizQjBfroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573447; c=relaxed/simple;
	bh=3FVyvo4rQEASBdeLs2jUpPzQ3T7QZ+fT6TGxQJmNZow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFm9AE7R+MjUxZmtFD3lcxgLenUmk4fhM8ZWzc62P0wggUprd/2+Irl55ZvHzzIcub13cJ7MJ90367v5my5jF0jGNIyG6lqz+ZzVi3SNlv/m4TySLAxMSGk32PEZKKerRQbJOWmpalFmBvBINwLQACi49WJ9ejZSGKbrkNsRS4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQ8XlJ6d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T9Wm023866
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmHsSpCNcapdB0caM5YixdmlQ/ZNsk9RfZS1cEFj9A4=; b=hQ8XlJ6dQpBZZLKY
	tFGFz5oJhH5WwjYnRzEgkAZtyeEdZ1LVCygSThs+GzGjt53ZB+n2HiOiVKlw9eYd
	qZHg9ASFeIWMzkB8LBqRdq8bXvT0kDEti3Zz3ja3zMvZWDVc8g8gM4Q0LerIbRLF
	OY5Q5kyCD7iKRhswS+zZrwn+ju5hT3wggrXbJNCioOmLyln/H26ExIy669r/zEGf
	IaPFXD0HM8ZDT/TziFjjyjA9gP/zmh68XTlryWxgSvzlhiZp9PfAk3DjWqssdbby
	5BDc55AtqtzvC0jR6KhItyG8bVXPddzUYOR4mX7DhpFJIHugbZ/Ay/i8XuAtiB61
	fUbBRw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1rgf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:30:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso5687506d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573442; x=1746178242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmHsSpCNcapdB0caM5YixdmlQ/ZNsk9RfZS1cEFj9A4=;
        b=njhjewoVmge9gJbEt0U7N7RnuH9ePvM2pNRM1a2MTZQsTbdv08y6XTSLOWXI4O4VYu
         jYvsSqoUI9vkM03ub5fB3ru3iQ6/IXUMBSb9vWoMN9qjQuqPIvcKyUfIWBQWMh9KU2bA
         6ZWx14cYa8+V5Rly4DrISSWRTfl8Jt8vidPQSaHcsHJguMIxrbnKkT9w2k6kBiIow5Y2
         gfucabPxqp7pt/VNwTXKxPslCSi63qup81hV8ddPxeoiFIX37zRy6MkzhMeq20LBua6j
         LLau6yDWPUW8M4n1TGDYl+X5rW6MzLFVYnoaqGnTMhdlia/OJNue6pxdJCGOWtQlEXxS
         0KxA==
X-Gm-Message-State: AOJu0YzSxDSoyICZSI4Go7UOTaHXvwXFEhrH3F9QbzYwLtHUAGIAoxMc
	iZRAY512oz3gmz6EFCnxf7B0lY+e+piwiL7utEFow1O7O1PxyXgpmGKZtJZ3/ltnoSR1VtnmWpC
	qPKr4UQVv9yEH4TrqLTrLvqAQo0u5VcA8XGDz+rZYa6OHBDf4zs960lLVjVs46hiR
X-Gm-Gg: ASbGncuoGRm4MUTCFpdF+PQlDmDQr5IXLWpcHXdmxSo2vCbO0zkR4tKsZJ9Z9VXvH9A
	0TVG3J33htdav7yZDLRuVHMtLiFawwQkRYXMXm+9/9kqMRBJbuKr9NEQJ31Nsbbi/hbqZ3Tkwqe
	47pITkOv/nzJHhlhseCBLOEVpkfzf0GD9plDZtno68H8s0JPY1NyJTDab+OxtrMLbjIHXkuq5qC
	S1/42mezhSj4gKjKn/fFrhB3yNLclkOcLyuLnTJABtEYDnnRGxCpCJkQ9USwXRqcSnOc/PqmBRl
	8w+07CxZj2cg3zJYQxoiDCJwJzkhrtJuoYdxjFxLZNu7wRimW5YMtsRV3kL+8Xa+
X-Received: by 2002:a05:620a:408c:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c9606a5a7emr105131285a.2.1745573442513;
        Fri, 25 Apr 2025 02:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDRyY4PM8jzTjzoC1dvp3QYYo4+2XjnvPPlpbIBlFWpeQUEACI8O0HFOiJIeU/wAirNuAVkw==
X-Received: by 2002:a05:620a:408c:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c9606a5a7emr105129085a.2.1745573442069;
        Fri, 25 Apr 2025 02:30:42 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e69b8sm105678766b.41.2025.04.25.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:30:41 -0700 (PDT)
Message-ID: <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:30:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yq_PBIPLahL78xujQgfmNdvLoYz9_pxM
X-Proofpoint-ORIG-GUID: Yq_PBIPLahL78xujQgfmNdvLoYz9_pxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OSBTYWx0ZWRfX54UcKtGjO40y BoqMr2wFecW+k6s6c9mxHjOYKstiNyEsO9f9zajamlCy+WPqGuFViqN0IB0DcOgCg46gdglEWeC +d0kQW8x8SY0e4oYjov+XhES+7WTxvgjl6R1T9fN5Jz2lbtC6S/T4oZHkzoS3qZ6sRPRFb2PYUa
 Odb4TiX0oAIAzhCzKIhTIwCadKftd0FO7uYC6+2OcWTcPHZZWwovygUqIn8GX+wA7R8rn6DVXbj GiC5fewa87wKSq3d4whyocr6iN2+viPwxeVCt2UWdePO8SwEwa63U2x42YIiD7vKTQhejfvNfx/ AWnwHvGOgNv3iVBfJKzaBDPBN1DYvy3UDBrVigStCS5ou4EXg+Cxjte/4XK36V/bIfCVw8qVnNH
 CXVICuOOFxlJtDvwvBghMQqqJ1i/mbeZBmHOc6osQE7MyQyd3pCXU5UtMp4+oyX3LOvMI7Zq
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b5644 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=BFmnnolzGEVUYXV1o_QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250069

On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
> Add device nodes for most of the sound support - WSA883x smart speakers,
> WCD9395 audio codec (headset) and sound card - which allows sound
> playback via speakers and recording via DMIC microphones.  Changes bring
> necessary foundation for headset playback/recording via USB, but that
> part is not yet ready.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +	sound {
> +		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8750-MTP";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS3", /* MIC4 on schematics */
> +				"VA DMIC1", "MIC BIAS3", /* MIC1 on schematics */

Is this a mistake in what the codec driver exposes, or just a fumble
in numbering $somewhere?

> +				"VA DMIC2", "MIC BIAS1",
> +				"VA DMIC3", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS3",
> +				"VA DMIC1", "VA MIC BIAS3",
> +				"VA DMIC2", "VA MIC BIAS1",
> +				"VA DMIC3", "VA MIC BIAS1",
> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u

[...]

> +		/*
> +		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
> +		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
> +		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
> +		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
> +		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
> +		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
> +		 */
> +		qcom,rx-port-mapping = <1 2 3 4 5 9>;

Does this deserve some dt-bindings constants?

Konrad

