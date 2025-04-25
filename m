Return-Path: <linux-arm-msm+bounces-55780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AC8A9D3DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9A389E2EA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F49A226863;
	Fri, 25 Apr 2025 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuqGT/Y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6681C221F2A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615211; cv=none; b=pmTLOu5CeQ2mB3Izk7nGrymt5l6iS3mci+C61ju+ivmKxxUngFfVBt3tcHcxKK0J4Zyl2nPpTml8jMDDNOKVgQiIExIoP+aRyJ2Ik8TyxXIJOoT3it80QCSZoLYV/dyJjYfkupAoxM/bYqxt3V+oQk/z5xwKLan4njlVa3Kxb8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615211; c=relaxed/simple;
	bh=h00jeZq0iWeQNWIPqYKYS+5WOPWO32a5C7YtUmmJfdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wr2gaBKePWvyF0HhVa/LXpviwHs9ByteCSEwXOLgpqPsJiE6Y1O5+8Pd5FbCny6d67/DNgbMXOulFbkiOoMnIVpUuGGviUeLNVOVbkGN8rsPGjXV1msaZ1SyGjzal5iV3L/xqn6Qt+6rATSRs1FjLwJq0Q1TMwnh6Fopz1PZspw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuqGT/Y4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuvp024719
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 21:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wMN4f5Q/NYPt8cjlej5JofRiRc0TnEknbiNnEj2rrn4=; b=LuqGT/Y4ATlFoSeK
	6vQEqqPIeptD1kdRNXtNbIaV4vgVRGDaqx8n71p/mrblpVqHMPtNsPvR5tDW6jox
	k+QHszpx9gCcue/HefHO0m3o6OwANCIlhr0TsYhYCk7D0FMVXYNWWLuPLhzhAzlD
	mygQ9LVI7bhAb1bcxpOPrpuw3mfOHTfLw6yqQlGJ9Cc/BQDFrcDqRPg6e4wJGgre
	l47cIeQDlXKwqXBAoPela/+SpS8OfYmlAlYmjEHjl44Ynk8wihKbpEksXRrTuI6i
	v8Nhpx/lnz+GEmSU14fbVqEKqPGYWPPUHQVRQWujFtS+lN9ROIxbcMjOJIN4vd/7
	VwKXRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t5qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 21:06:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so56130085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615206; x=1746220006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMN4f5Q/NYPt8cjlej5JofRiRc0TnEknbiNnEj2rrn4=;
        b=Cmn/JRIWqyQf6SFFUSBmRnaHJ9hhrtKWxW3Zq8MhBSYQGKpkz9avvWg7/iR/zGtSfO
         qK/1Ji5DNhCCcjMdXg2xHbKuXHHpnLDPnIWXmTt4vOzKog9Nd3v4C2JHJxCt45aNO0px
         1BC3tvcRZ/mRS1ummVBYiRPcG5Rfuy5qNwRet2G9r81rhE5ZrSA8/OvFDM7c4KQGX0m9
         ExHvXnr5G2yUWc39mZS6A099ppakE0ETOc9dDx5aGAPliuhcHY6Z6pgFCPAwW+URlf84
         CpAhA93shW7IvpWCvkU1oq+Z2jMzv9c7iyFbTzLdNtIjATO1QsDjEA/dpLZxeqWbOVwQ
         1rlg==
X-Forwarded-Encrypted: i=1; AJvYcCVUDFku0P1rdXSPaPi6UAyHmcxn7WoXVWRQc5YRIEDh56a0NATdI/73FpWQZcHmo+5Acbx8PBa3bnt6ebt5@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVEMvb+NB5ejXi9LVKVTEJ9qYWK+C50NNo2Q/QR865yeWfbRp
	uWJqO9UD4AnwNFycUqWTFqtOk7FvTKH5euWaE0s0QFB709k5Hd56enY8on2uVRj9gIcu+w8pNOm
	1OBlhMAzT2AC59Zasw/V1PNM1FX57+rZrCQcY99IFrXJL/WQg2HkKhNNfC5fGRVJd
X-Gm-Gg: ASbGncssnssERebDzAlUd/9xMaoOTqxw65d+ps+liJHzLmr+qucNQuGC2f1fxeUnC2v
	ubxWXRhZVMXywzIOTbLkuIFELT0x6bRrQHzvvK+dflD8hM5ZlKNpqp3H31NJUJp5cvGP//o5xmn
	XNBvq7SfudLESmbhjLeKqkeohrQEk4jie0rk8byifxu6NHRKnrwppGnn2Npkhu+OtsmRAi8I6Ef
	4aoMMJqEda9Y+ypaR+tSstirG37MGTvuGePr9YfzhoHfX8Ah+wzvYT5+zbPQ81IuhG4y3mN2g6w
	GFZnSSJFVPlw7VWUDgvVnyLvsSXG8ald1nB03N1SkHlSJHMTbxcaZB8o7Tul5LzJuNw=
X-Received: by 2002:a05:620a:288e:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c9606a8ad3mr242921685a.2.1745615206028;
        Fri, 25 Apr 2025 14:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhpInaWqBrWslLMEBHulOhEbn7os56AY7sdqmyXhYs3h7/KUwLESO/GdOIrc/pcmlw3H5y0w==
X-Received: by 2002:a05:620a:288e:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c9606a8ad3mr242919085a.2.1745615205574;
        Fri, 25 Apr 2025 14:06:45 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafbf0sm187232566b.168.2025.04.25.14.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:06:45 -0700 (PDT)
Message-ID: <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 23:06:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2qi03JDvNJWNGkGGOu1hF0mSAl2xgOcQ
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bf966 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=fvTAydqcfIHFLh8AVZMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 2qi03JDvNJWNGkGGOu1hF0mSAl2xgOcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MiBTYWx0ZWRfX/IpLoWDXYLwT 4jJsgl0g1GqmKaXuZHHD49ch1U+JAlo0BQzd3d6Ri/mmPJ8nxWvHRqL4igNBZJoxIPQZDGRTf1t uXkhnHoExIZbNJjZs5nXuPBbRjRHD0iPeG/FO1Za6VBJ4fM7j03cWBpQRwmVR6smlNyK6kF7fvZ
 PTEB50gc9HTf1rifhUVYIinFdKegdlAlzG8hPKpW7rOoYuxgn9Y3Q2MVu/Tv51MmaRW0hJFNCIT GRciD4kxYhUwI2EzT2ylTybc7imbH5WPiPCy3U4rT7KaGUFc7X60sQEwWeGfSfciIlQUt3FzsW3 2SnN4s9WoVzmUH7X0XkcNN0z52414LtlezHFFtsoo2rapLjhYobjg1Ba8wTIG6OSIttgvB/1bOR
 dmZypYKrXilvXCwxvH/fEgK0U3IUUCB9a9KypmRtWnIY59bLA37LPVcOf5Cx85ksNOQ5heh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250152

On 4/25/25 12:44 PM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no interrupts should
> appear on the xhci-hcd interrupts during playback, instead the ADSP will
> be handling the playback.

"should" isn't very optimistic - I assume this works for you? > 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
[...]

> +&sound {
> +	compatible = "fairphone,fp4-sndcard";
> +	model = "Fairphone 4";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	usb-dai-link {
> +		link-name = "USB Playback";
> +
> +		cpu {
> +			sound-dai = <&q6afedai USB_RX>;
> +		};
> +
> +		codec {
> +			sound-dai = <&q6usbdai USB_RX>;
> +		};

'co'dec < 'cp'u> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <13 4>, <56 2>;
>  
> @@ -1178,6 +1214,7 @@ &usb_1 {
>  &usb_1_dwc3 {
>  	maximum-speed = "super-speed";
>  	dr_mode = "otg";
> +	num-hc-interrupters = /bits/ 16 <3>;
Where does this number come from?

Konrad

