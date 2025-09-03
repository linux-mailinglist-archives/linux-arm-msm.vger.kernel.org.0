Return-Path: <linux-arm-msm+bounces-71849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC0B41E86
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AB7654378C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18D32D97B8;
	Wed,  3 Sep 2025 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPpkCtGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E82C15B7
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901650; cv=none; b=LuRTJ0P0GZz6n2Fs5H9ILE1pfuTm+cEp4NiEBs8pYoW+eg3WEBC7vNmA6UuHhIkyAMMgEbfkXrr9fD8S2XBIfKU31xjlhvRL2uUEtVdcyUL66CjHfCjzYM+jHPOKsTQ5GwO9JiYPuJDXe63IimnCNjC0bDrEwaVT/3VwlWdQFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901650; c=relaxed/simple;
	bh=YtdeGZI55ezZBf39MWpOqIeT6GYRAKuljv26BqkGc7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpj6ab8CmLhfWtrYHOHLRE8pihAoMc21zXu7Jq/tSoemj+/OglRvXfFpQUCA39ysQxS7XiMbvu0XyzZkR83m5V5pJ6PWUrdjAHzWOXribWhJtqykY4opBsgd5uml0p4tng/ee/jGbHhiJq9y+oNBc58ngIYtFVYq2yAlQZvvBz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPpkCtGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BZxSe024831
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 12:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYhvAJ2yDxm3t5+1Vvt6nPPA+d/qBvKI0quyH0NlUv8=; b=GPpkCtGvFf4WhW26
	DOSF5KBPJ5mHMVBI/Pz//GRCVwmx61XgZaeJdw5eV37KinrrC9tLv0VYKMa/ipk3
	shmJKCXiY6ifnSGBHmqEqSLTsPlfSAp2kGWokxxdzsliCjpX+Hm0IHTwPDlRlAIT
	zXP8Mghrha7u4zOaR4AgutS+zvONlmrTvEQl//53juhGaojE5l9YEz2aKuHc3fYE
	dz9j+rTewSEHxAcFLWruPWYdzfFCb8jfp89f+3TYerQwkM+hhT2ymJMLGYybBYNY
	F13yHMYAbtnlWrd6C/CV0kJU26RedSAkaGjYVG4sXWQyp1+kf0paEe33kU2xV+Rp
	ALjhIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj03vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 12:14:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b48f648249so2761871cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 05:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901647; x=1757506447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYhvAJ2yDxm3t5+1Vvt6nPPA+d/qBvKI0quyH0NlUv8=;
        b=MjtyV+LlzfQIiUTnkmbWAJwJMm4pASJYCA41r4w3gO5j2ZkM37o869dGxR9BGSJdFw
         2LZnzTW73XyibwW8y0+mL6pn4jX0qo/yLJqnc+zZsnACl33ClGV3B2M1u2eGK/9TYzoh
         Vp8dUzXyDfDK0a3dLgJgunoOXuKynsEpu3m3u3oAs6A7m6ZIkZb90yzai3beZI+h+dOj
         PJWfGx4WF7tc6XqTa4DiX6ECuOOg3PP2k450YNO1jXhu9ocfW/9HF15byGTyAL5DsShS
         p4hNXO7ISfuuCwBno/vsSqjT5FdqftoU4/qhb1vioTJjkP83dyDh9Jep6RQJVip44VKn
         dGKQ==
X-Gm-Message-State: AOJu0YzEOdNOJTXQNqWb5fEx9yRZDWlfSsu8YaCuszkDoX2cvAIVcrcR
	VHjiU3r0sZwipIVPPjF5JlvoK5hQvpriD0YHVxV97n7g1Eel/w31TBxS87sieOGXEKwJQVn05j2
	4x0pYztmOmYrDQj0bsdI5G+QD5JfK2nKYyNTKjSi2cRQ3ShDo5ePV7fZoTWUhgzUZZxTb
X-Gm-Gg: ASbGncu5xnkbfWcqQ0qA63+Xtx17J6p8X0uyFmjLnsKUmxGtlzFjGTTV5waAPq6gUsa
	EOQ2N9iRPLkcvWHBEV9HIcvxsx8ppdu94IeXstQzOAULU5crRaO5dtkDhK5NGWdHWdyy7eYLOta
	GrSSqY+zDZ8FQFp83jI1WyWuKaIIvbs2KQ9GSCGnHyYpjAZjJ7CEjG9P5ZZff2pxevA9u3mQrSj
	hExjYGUdPfYy0m0d31+9CBBudERW5j7QdkMGvuzeU6y/MMd6BZQvmtW1uuzrzTXzXYlJXpHTxTj
	ntZbXJ/2c5IsaNlOqYY0DYgx+NjZYPSr8rmSLvsd1qog1M2Z7/Fy+31UUAeA2AZJfCgXJNRkW4G
	Rzbc1OV1+12mK71xwXUzDfA==
X-Received: by 2002:a05:622a:1992:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b313dd0295mr146879671cf.2.1756901647001;
        Wed, 03 Sep 2025 05:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfxXAgSIGzsPwmW+MlQE0V1gR8/fJuy34NZIUCYx2HrmLlKlVIYnJUO6aP913FkYg4ai5C6Q==
X-Received: by 2002:a05:622a:1992:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b313dd0295mr146879081cf.2.1756901646361;
        Wed, 03 Sep 2025 05:14:06 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0426516668sm777114966b.46.2025.09.03.05.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 05:14:05 -0700 (PDT)
Message-ID: <1df90473-551a-4c1b-9a51-af4a6fff1bb5@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: lemans-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250822131902.1848802-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822131902.1848802-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfXzeYX5AjiPFHq
 gqa7uAmzXoif2Fcp5gO35VuCyovf0XbJ9pzRxNZ9uJ6EA9ClM+GMRaoVB8LzVc0OOD7fAX+SwCv
 HNUTAXpeoacqwVCBXJpaQAcKYlFsGSEZ8kzSie/oEBlmFxynpB8Z9MxtkLHlGbQxgA64Kf9krOO
 hGkropXrbNIVa+23ENxKPyCi8iycmXllrBPQdq6qAGPZBacAg4cdiH+1GkFnACk9UIFCblU/O7n
 Whydgey5NIgYseKvVFoKD1kUfxLnJngBIfkwn7W9TuIwBgfm7+hk8tlHCsYX54DcUmBx0suRlcS
 1IcSc8iDwZU7i0qyzszba2r/0GnB7jbzYk3NeytBN835x1qFkDaPPdLwsjVbXzAxqBTVRwdOu0+
 0PvLcwip
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b83110 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=M_mJTPNyHkIBEOdhXoAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7ArF-6c-2V8uf6UD7hKZOHRHU6tbVDDd
X-Proofpoint-ORIG-GUID: 7ArF-6c-2V8uf6UD7hKZOHRHU6tbVDDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 8/22/25 3:19 PM, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> I2S speakers amplifier and I2S mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 +++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 669ac52f4cf6..d67a9307cc75 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "lemans.dtsi"
> @@ -22,6 +23,57 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	dmic: audio-codec-0 {
> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <1>;
> +	};
> +
> +	max98357a: audio-codec-1 {
> +		compatible = "maxim,max98357a";

In case anyone's interested, this the SD_MODE pin is connected to the
power supply (i.e. it's always on)

Konrad

