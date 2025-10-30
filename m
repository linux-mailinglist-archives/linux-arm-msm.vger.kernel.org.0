Return-Path: <linux-arm-msm+bounces-79655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2252C1FADD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E02B1A252A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5516B351FD5;
	Thu, 30 Oct 2025 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdCQm3Uj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJyJh50h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E4345CB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821925; cv=none; b=Ggc8CWGK9gM2OoUjYaO5BzWPtPf6cNwWdoug5dq+2Ramapf3rqNMLF24wDR3vHT8L57wP01h3LWL9pqNrwV88g1SmwwbPFuSTKvTGaYvHuLiFcnY4apQzjnUw0CM/1Y/McHKx3g/IU5zCN6hUhyJq7u2zS3LJQWfQZWDLOu1CmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821925; c=relaxed/simple;
	bh=tR3qQbM8e7YJICskQfi0Ipn09MpIviZyprnuDoe308M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQ3aTwH/OU5hDzs+wXHr2jxJomr79nlhyNg8CRZ7UT+6TwqjSCC32Nfc1RPSU6pvnKdFZnZ2+n1t2Nfbtwq59xAfIKnWyU7bTvpRd/FGhxZXQTiacu6BzQOIOr23Oxlc2uSOf6DMB32YR8BnFyWnShUiLzAzDaMLgL5g9DVQ5b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdCQm3Uj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJyJh50h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7QnX21501736
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPwgtHcgJ7J7nFNB+8+KqtcjajFGZXrHoBQyN9cdZmg=; b=cdCQm3UjOPs7uoYG
	eM3DsHxorUuLCdHkKoJOYgZYdCH3T9p1Wq3DkUWHu5nMBAIVPyLW/3tbIBAe4Hnf
	fyQLqE8zstRxLUpHq/hgcekP8JHRfGlJNqI0gXJWFPSzXQj/SUSp2ucCiVLKSQ8l
	gPlNpkbPgCoA5GZHVWj87b0OvD9EwV8OIy1olveVIFPnu0THEiNnZJXRRSvebLYk
	sBMxWKy3hjPfeXcezjfmByEt4ajZJshdPWQiJeY0HLkoA4eQtw6c33aRLL7U8PB3
	2sPKUkhtUb6ZEz3BQ1bmTA4uCpQs4EW/vSx8opaoqIhgO8HV/uKHTPPWUFPPUcDl
	Qv4jMA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3t1jt6w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:58:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88020a3e4f2so1558566d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761821922; x=1762426722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iPwgtHcgJ7J7nFNB+8+KqtcjajFGZXrHoBQyN9cdZmg=;
        b=XJyJh50hZd3f6kjwerYxH728tQKpGlXsrMGTvm34pebxcx/54VZK1LikhqnVK9TN1i
         Pw9cCJ9aUxIhR4zxXzY/6gLwwbHj7ip2FNIYiRv7zAiKsAh6+g8SylizlRnaYrqDG15P
         kCA7ITNWY6n9Jd8Y142NPKzSbABzhSjbw93uJtyyiA1RljbtjlGR3dc8ZZ+bsENtPeEn
         UkYeJFlwvOYAfCmOk8mIj2dt1wRCRbmlGPFAavFk2pnstTH/YIo6jGkUSBG3ySIW7If0
         z2K+Ntt6aS/ugEc8hIJV6Btm0uM62qXtile7k71ieiC7wGn5SnGPIIe6ohMhbptjmPIf
         PLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821922; x=1762426722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPwgtHcgJ7J7nFNB+8+KqtcjajFGZXrHoBQyN9cdZmg=;
        b=uwCGl6jtz7XnERdtV5I80LsCVm2b6vB6lQtxruMmA+3e87ykJymlMKg/z/pO08Fq5e
         57AFgOrtxGet9pHd4LJnbQCj6ZBk6syjxxxr9bviWiZcpr0Wi44Tb1QsaCWnwU6Pcjxr
         VArn0WLZ96PWSdT0wKUK5TxF4Z4WA/bPuS5YAcgwQjCZg8N1SvXnchOSYw9QCjeWqxG4
         OBeH9unSgaiMYHgyZFZFF+NnPVUySY2I0o6md5nEJPNfieKjon2iz6XwYo/W2xyKRpbP
         GgHTvLgBR3r2B4iu3ncLV5CarTg7DHYdjs6/xBDAhf02j7RE71a2cpR+hSqjzTZ0jCz/
         rQWA==
X-Gm-Message-State: AOJu0YyEvkII/r2HlLN6yziXvKPJrZtdj3aj6/mnAs1l7dCD2OQ2BT4r
	0TRKxVxR6Q6CqVgScKLSajLITgfbO23u5Y0STQxs8uR8ioV4WDufB89u2PkXl/3AAPFZi7URXHy
	S7/RwStb6uUYdv083NnonJU8bzAKPKMPLwrqsMYzLrfON7sTjn4OCh0g6nWynZpYejE0d
X-Gm-Gg: ASbGncugMx0L5xOEBisN227gY3f/BsNlGZCW3sg7HODOvrBsfOLxEEL9WBKvMpIMYDk
	fEihGM/djzgUip/fEilMX/3cdF2Xlo9kF8tDIL46ba427SltX5hiQFSDDqmdZhPnAiehsBBEapA
	wFvej9Qfrx3HLJjsxtErFM0SuLz5PYuLyF1m7Hi5VvFp/TIXhjqrixHgFvrv80mULGDHknA2u0F
	SBg1R7CjeOGeKIwpL10+gJE5pY8PAJjsrUEMjfpRtvM3EXHOTKwxF85I32rQpRBDNMUf5fd4Blt
	HZERB7iG20awH6DImSu8rQRtk0Cj9vVT6MMxD06QgzROUXHGk5PlmYaebVVnXd0ubaQk9D/PPw9
	TGhpGYiZLXf++EqZe0r1GZ/AyLnafJ982Ffj4+Xb8YElDaMHG7IkVtugu
X-Received: by 2002:a05:6214:20a8:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-88009bc1287mr53179506d6.3.1761821921520;
        Thu, 30 Oct 2025 03:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx5k1wZsBuuiVnl4Eqgxl3d+N7Q6Xo/AuQPcR9rB0PHtOmAMEcobsr2Sp3u/2nCVQlyhDFDQ==
X-Received: by 2002:a05:6214:20a8:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-88009bc1287mr53179326d6.3.1761821921098;
        Thu, 30 Oct 2025 03:58:41 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853f3851sm1719266366b.48.2025.10.30.03.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:58:40 -0700 (PDT)
Message-ID: <c90b917e-b3bc-42fb-a127-ab47d5154d0d@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:58:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: create common zap-shader
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l_7kB1FVodGDZtN2hfmX77EOJ8fh3UpB
X-Proofpoint-ORIG-GUID: l_7kB1FVodGDZtN2hfmX77EOJ8fh3UpB
X-Authority-Analysis: v=2.4 cv=M/lA6iws c=1 sm=1 tr=0 ts=690344e2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3S55o6r4CRsqHmcx2iYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4OSBTYWx0ZWRfX+CwsoA0fTd2p
 X8DutW05hqw/Sv4P8Blq7lwJKL0KQe125mnnTsHtC2DcvfyM2925nGqKFRbLiah2RX/Fhh9cfte
 X6d/KhfjReIKYN2SXE88gL/eaXJ18AtHye/7J7QTJ7XV1mj1qJwT1K2y/1BcIDWg/Uxn7D7Heox
 FRnB93IlBOUm2VZbTSZUV+wGk0xnJcSDTqNwxPgvx966y6fo23XeubzRA4Ij9cAlDjyxDGVVUWU
 FMyf2YU2pVy80bowj6kvWNl60dQrKuqgEPceSvtexPkMOH3rwvqQSMjk6NoQm0vL0fFBk4EPLNn
 EGyOt3VRZafaZuiDS9f7UyWJ83kogyaCDsRS+Q0Tramu56Mx3Vtx+Mkwt4i/EwFtIJfAGqA9Vyj
 oe2AC/mtX04Q+qNnYJmiZx0hFc6PaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300089

On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> In order to reduce duplication, move common GPU memory configuration
> from individual board files to sc8180x.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> index 93de9fe918ebdadf239832db647b84ac9d5a33f6..069953dcad378448800d45e14931efe1fe1a69fc 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> @@ -14,6 +14,8 @@
>  #include "sc8180x.dtsi"
>  #include "sc8180x-pmics.dtsi"
>  
> +/delete-node/ &gpu_mem;
> +
>  / {
>  	model = "Qualcomm SC8180x Primus";
>  	compatible = "qcom,sc8180x-primus", "qcom,sc8180x";
> @@ -444,7 +446,6 @@ &gpu {
>  	status = "okay";
>  
>  	zap-shader {
> -		memory-region = <&gpu_mem>;

Hm?

Konrad

