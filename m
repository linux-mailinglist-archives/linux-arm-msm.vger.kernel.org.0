Return-Path: <linux-arm-msm+bounces-53273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B336A7C692
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 01:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E75174D31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 23:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6235B21C193;
	Fri,  4 Apr 2025 23:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TK90TAXY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE71219CC05
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 23:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743808132; cv=none; b=aX6uJKMHy4DiV+adp0cfdSMAqHpq8oDnvrcyFMzre1ct32DS5vvitXsclO/qpcTNarkZQbiLDpewk6oKZeuPwBPVwJWkhKcAVR6brYZZs4aLmAPd0KYVqEyTSRApOekmkuTpaBRcri+mo/jYtGjuUxKNh3/TB3XTJMpc8ANsAUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743808132; c=relaxed/simple;
	bh=uvFoLBVMxpV+FzsSrfCodISptx9yfazoOwRaKlvCWrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=es9VaiLrdj9UdpilQrn6/P3DRqKYNKQOEDxwUK4UrgDnaDdlCorNVgDRmMddFRFrkTFIzx2tFNpKIs+4S7FEXJOFhxbdHIJ49fQLrCz53D+1tnUsUly4YbJzb7uX+pxScYBl2cYTpfuogX5o2bJQnQG6CpnZAd8Bnu/kAoVZi5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TK90TAXY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEhnB023680
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 23:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sc1878aRVRSOs/3PlRPdPwNQE6/qR7MOw1f526n5mz0=; b=TK90TAXYTKIaQ0Cv
	4gyhWbaRBQvh625vymauMvaJHXPaGOwPx1otekvmADSMmioYKXw45VMmHqsG1e57
	uWv8kH5hYsMUzsJFLhOefeGBRMU5N+JrNOwziGrGn2HF/Ks27DCNTvEFyQuaGqOx
	12CDu5Q2c7/t1jxyFfBoLdSlB7brEV8ph7SXaerFEfQA/d72HnpQizppzcZNnhCp
	wFSou2hKlrjCxM3s/UM8/SNolE6oeHAcBmoR8WiNfMHqMw/PSNNqH4DFsdyqiw2h
	us+vOExtI+MsIU5Dacg+UZYkfkNh/QCNHt5GVuSWH9jFXB3gq8gDFhdqwW2dhFiP
	cAc9YQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d933yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 23:08:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5466ca3e9so31819785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 16:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743808129; x=1744412929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc1878aRVRSOs/3PlRPdPwNQE6/qR7MOw1f526n5mz0=;
        b=B8Whg9vCF6hNONAL/gndgRdrOQ/l27rF4KJhky10HPbpbIbhRZqSFGEl50sJXn7f9J
         S/8P/xGbt5P1puPgdcSi+SkTOqob/uopnFazR1eWy72O/bPFeU34ZZKE/yRz4TtpsUC8
         50M65ZYKn1nQd5rAc1pe1k73Eu353wMDK74AKWxrFOmMQ/QhnSlx9siW9+QrcY2jDK4c
         Te+vOcaLAH97eAVmG7HExIZYtmCGdSHfaW/WTJYwlmm4mJyWYzN1QeDPpyM87RJfCD43
         VFAPIYqblOfebNWu/fOJCHqP1P5cvEgH5aFOlhIyjkFkDM43KXGLxfaCcjUbm58El0dw
         PxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVh/PoN81d7ZE+AskU5fB/3gAFmMOMdX/cKCLLy2+Q7rOh4lSc2CO71gxT4ab6oqqmSeGXgCUg2extv5BQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7IGdI0AwtDaqL2aj/JUNB90/8REzLr7HPb9WRnjAIYiJB82PL
	QFnNQgoufdfapZGCDEsA5nH+4jL35EWR923P7I/JLFPa7bMG63ZlhTO4ZMDS4MdTDs0Gj53G5O/
	hj2cY79/zofKO3IyqDK/m9ko4JJaZ5wcXI02DemVsJwIehbhcAd7Vhnn2YUEp1cOD
X-Gm-Gg: ASbGncv9k2WcYMWu8FYmiiKEPVE57/eRgFFbvFdpM7MicdqYArn/gwPQh7PNfu5SUNi
	lr0bQLA6IiuY64pM9c8Zm1Hsypbizy+rqkL+tNzkBOvcVYFOZbVrZIeiyNYRcZlM2DL7DIDQyjS
	xt1DyHh4BXr080j7aJ4u5TcW/QAV4jUk+cyDs1xe89Xwvr7cj1wmYUTLJ8oecHtZiP+hSdy876B
	GLQUkrfnJOUKEFbBOBYVlWcG8KUVczYo9cpi15G50V28XYFCa9XmhsUJm074WUQ4x4oweFfxM+K
	vNl7Zi4+pS48fhOx/ZMxQ7W65ICN4J7bw787jf9/7kEbDArXYnjhuiDmMejdH7WQ4uBWhw==
X-Received: by 2002:a05:620a:45a0:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7c774dc4e30mr258440185a.12.1743808128707;
        Fri, 04 Apr 2025 16:08:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAvFH39umflU2C+nW1itZ2segfOhwfC/s1A0W0uKuzO6RfEywKESk5zVr1GdwH4BVH1DFC0g==
X-Received: by 2002:a05:620a:45a0:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7c774dc4e30mr258438685a.12.1743808128369;
        Fri, 04 Apr 2025 16:08:48 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f651sm321607366b.123.2025.04.04.16.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 16:08:47 -0700 (PDT)
Message-ID: <abcf5f26-930a-4ce8-89ff-fc5405fe7b19@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 01:08:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e001de-devkit: Fix pin config for
 USB0 retimer vregs
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
 <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-2-1c092f630b0c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-2-1c092f630b0c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 86ZXeE3LYZvtnihjzezqnvhiZpufvFEp
X-Proofpoint-GUID: 86ZXeE3LYZvtnihjzezqnvhiZpufvFEp
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=67f06681 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=t4t5uVw0II4b-t-jJtkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040160

On 3/18/25 4:50 PM, Abel Vesa wrote:
> Describe the missing power source, bias and direction for each of the USB0
> retimer gpio-controlled voltage regulators related pin configuration.
> 
> Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> index 902335396c586a991c4a2de19906b039d887780f..8e88e00c335a05d0d36b4b08b85df82f38ef4355 100644
> --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> @@ -1039,6 +1039,10 @@ rtmr0_default: rtmr0-reset-n-active-state {
>  	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
>  		pins = "gpio11";
>  		function = "normal";
> +		power-source = <1>; /* 1.8V */

Not sure if I'm a fan of these comments but sure

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


