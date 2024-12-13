Return-Path: <linux-arm-msm+bounces-42011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D789F0C95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD2F18806E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA111DFD8F;
	Fri, 13 Dec 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmmiJN6+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB51DF256
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093678; cv=none; b=iR/C95tkcodPyfTm6czFvpknq6M9kyU5OouMxawhumExQH27XmypJoXDkdC7nLZlDU77yNJmYmXn9C6/i71l/fjW6BNlG2JYjVcFxrw0zdhWceHPwEm+nPWJMRqvABLY9obfo0kDPdWzQtcXAT0crLcpKTb9EIy8SjTESN9+UuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093678; c=relaxed/simple;
	bh=NWqQTnku2IFewnQ0l271ypTAiqVof9cxtyCXjtDznm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdO7PENiuXpE55ndntEJpFXXiZXvHKBJF/PKL4BDlI4Se530QYvbPcRwEurPGOmwxV4mFq0G9UQOgxK6MHs8eyzJVlk67gjhwYEGY1O7xHADCCaabfSpvFmjJb+JUX2L17JOg0e2srFdv3XwHY0Mk/uTn4qQWpqPO1nC5Oim0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmmiJN6+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9XXTm031415
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yenE09Qp1TRoV+p0D59Cwj/cworX8HYkWewV+iHsfWI=; b=jmmiJN6+lnb1z3FU
	cT1RN+NKkmiVknqaBZAFwv3BxjPZqELQSygeVaENs9RdhpjIexuNIAywVUfJVU0f
	o4BdQvQZqhSe2QtYVrNopdz9DnAvfparxh4g8dUWtybBWkv8PYYMn0ZjvD86oSYl
	L0MzhakU+TuovDpN3HPoD/hpME8G3KEKY0TKzkHHwx5Pxh5Ve6Fm1aK+XR42tirg
	5kVvDB6JMsd7o00yzY1NKRkNZWKaO4JU/A+hzJDbGyrXDShaOb0zvbEbpyV/mX/+
	PFwR/70J+O0b7nt4qYbMzQrGB/M0YmIBwKGUT5FmCVS4x0vbYEuHRlqxdJ+bL9H/
	xGEn/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgekuyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:41:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a437e5feso2085121cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 04:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734093674; x=1734698474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yenE09Qp1TRoV+p0D59Cwj/cworX8HYkWewV+iHsfWI=;
        b=maSdmwZ1/zy6bWrQOaekjcpB6oCO3BlpFnS3q6/y9eYUQQnW1jMNiMBEKdr6M1TsYW
         1OoKSNwaLWYwMw7+n12BEMVBC0fJTmccUxXIWaAGiYfZZgOtC936cMMHHICgsxqWt5p+
         K2QU9cdf7gVAvi1F3UMah0aFP0XJ6UE+MDBnKk7D5QFGcUai4UYE1yT1im1MlzYmOB6a
         dsj8hKlUtJZcW6qMkhutwbESo6CYb1vTjHTHF9dNxqsjgH+B2coJUmp19SEWPOclGemn
         WBrdOGqMsSwMPNSbR8Zbwbv5i1ImbTlKUjG6XOeVtUC+P7xUXtBcSexN2XlgBmTyeLwG
         12Og==
X-Forwarded-Encrypted: i=1; AJvYcCVoVz/FARu8rEimbnvdPfvca/3G5CnsYpYgL1NAhAZ3Yu+nO1eDozeGxfS1US4hso/Z35CQxOcGUoeytNPr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxkq7jgjgI3jnLkgBmPIsehq7oiQ5NYuJEiM1yO7tFVBCeAXCn
	SgPuevw1/ZhTVJZZcWpwc9H316lgHiNxZZLj02pprNDfrRPldEY7XW1MjbRh1zUmztcjr6Zn6DT
	U3uiU/HfVisOfPMxppqqUpgzJNFAP0blHraBKZIf8SPEobWET3f5TBXAv0OnBAM3n
X-Gm-Gg: ASbGncuBSDU+kr7SuuHIuBkA+aIedLYLWWl7PQ+CDZcvPmaW/l5FL/LiJGnmlmuM+Uc
	NkHcWuflUADEaFG8BswDOwsi5zYkGa8mbzfUaIqLn9+r72aWdxNue3N0cG7HvKGxVA01aVFuUtd
	xN13RrLCGs0ibpMiWnj4LwTW4pHgj2K6w0LuFyDDfcBygfhM+o366LUY7n1/dhs9LxN7Qyme1eC
	bbJWiT151NlAXFjQ0XgfXhMfuX8hysZjptwlDKCgv2kQ+DnT5Kt4ud+6VPsp/vPXEWmSn2v8FVP
	lL5wJGm4Odxdb/QeV9Dan5j3q9ORjug+K7ym
X-Received: by 2002:ac8:5d0e:0:b0:466:92d8:737f with SMTP id d75a77b69052e-467a578b90dmr14355831cf.8.1734093674066;
        Fri, 13 Dec 2024 04:41:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1IHSeIv2Brdx5RvV0G26ngkWwAvpQUxQLtvdE3yXcXS+13NNnafO8QCrJMN1uf6O8p0bICA==
X-Received: by 2002:ac8:5d0e:0:b0:466:92d8:737f with SMTP id d75a77b69052e-467a578b90dmr14355631cf.8.1734093673746;
        Fri, 13 Dec 2024 04:41:13 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa673474d96sm820844966b.96.2024.12.13.04.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:41:13 -0800 (PST)
Message-ID: <e2fba6e9-6548-44fe-a15c-cd29f5650b74@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 13:41:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] arm64: dts: qcom: qrb4210-rb2: add WSA audio
 playback support
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-13-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-13-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WhSNitkFNp2g8Ruqg1iGHIBtahZM5aBQ
X-Proofpoint-ORIG-GUID: WhSNitkFNp2g8Ruqg1iGHIBtahZM5aBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130089

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> Add support for audio playback via WCD937X/WSA881X. From DSP
> and rxmacro the sound stream goes into AUX port of wcd codec.
> wcd codec decodes digital audio into analog and outputs it to
> single wsa amplifier hence only the mono configuration.
> 
> The audio playback is verified using the following commands:
> 
> amixer -c0 cset iface=MIXER,name='AUX_RDAC Switch' 1
> amixer -c0 cset iface=MIXER,name='RX_RX2 Digital Volume' 80
> amixer -c0 cset iface=MIXER,name='RX INT2_1 MIX1 INP0' 'RX2'
> amixer -c0 cset iface=MIXER,name='RX_CODEC_DMA_RX_1 Audio Mixer MultiMedia1' 1
> amixer -c0 cset iface=MIXER,name='RX_MACRO RX2 MUX' 'AIF2_PB'
> amixer -c0 cset iface=MIXER,name='SpkrMono WSA_RDAC' 1
> amixer -c0 cset iface=MIXER,name='LO Switch' 1
> amixer -c0 cset iface=MIXER,name='RX HPH Mode' 4
> 
> aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 827ce5f7adfb..34ba563d0d07 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -111,7 +111,9 @@ sound {
>  		pinctrl-0 = <&lpi_i2s2_active>;
>  		pinctrl-names = "default";
>  		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
> -		audio-routing = "MM_DL1", "MultiMedia1 Playback",
> +		audio-routing = "IN3_AUX", "AUX_OUT",
> +				"SpkrMono WSA_IN", "AUX",
> +				"MM_DL1", "MultiMedia1 Playback",
>  				"MM_DL2", "MultiMedia2 Playback";
>  
>  		mm1-dai-link {
> @@ -145,6 +147,22 @@ codec {
>  				sound-dai = <&lt9611_codec 0>;
>  			};
>  		};
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6afedai RX_CODEC_DMA_RX_1>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6routing>;
> +			};
> +
> +			codec {
> +				sound-dai = <&wsa881x>, <&wcd937x 0>, <&swr1 3>, <&rxmacro 1>;
> +			};

Please sort these subnodes alphabetically - and yes I realize
we managed to overlook that for 10 years

lgtm otherwise

Konrad

