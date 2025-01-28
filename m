Return-Path: <linux-arm-msm+bounces-46379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C60A209F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AE4518821A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A2519F47E;
	Tue, 28 Jan 2025 11:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXNI+uH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6091519F13B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064958; cv=none; b=bTlmSzzK9MqMTPVL6XklYI9GR08HA+IwH2VLdIQ+BYSaeSOVCuJTXkErVCJIh5ROJdWht/6roAtkZS56fW27Tl+LHdypN0/pvx6QUtMBObWAD27tqGWKDDA9RRDzOvTnFXT9HJwLJHO/HMpm1JMMcHnSSDUOo3ZlLrBNXgBoOSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064958; c=relaxed/simple;
	bh=hLf3J4DjMIUSXWpFAlaJabK1uiLzBJKg0YsOiU74pXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRUdPd0J+LzvzK8sLuG7+A6a3ztW0CTEOP5drW2ro6CwckFiXd2AoVVTR1XNr0P0NTZN3ubVDDQO8A1tfc+D3Y2RH9i0frHL3LPsemLLJKTFKj0EtEZip7ezjzI6PIDD/bfzozd5Ly9kESj8H/3ScyxXFDnwROB4tZyXPOWTtHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXNI+uH3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S9lXKC018319
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMTiSyzPz9jN6LjslTgsVpii1bcW4uZ/GQwmU5IYtGc=; b=GXNI+uH3KnbxPjTH
	l2oYdcER7tGYJgBtANdRnoZ0uQ6pWgrEbspZHPoVa40WG2Oavlge8j8jnGwVizFT
	q33Agv3h2qa00wjQTSY+G3wkSXpJpEW4ECckhEsu3rR2NR1UWcTWZ/afkqUgDCjE
	z0Rfg5PMqk0rSynv7picopekQWwArCWzu82QQSs0tucyzTm29wOY14YUOJTq1XK3
	SjQ9SjBYPcQVMJYPl5f+xqVr9TzrdupIcFDOSmD+Pb6yVUPKRSjexJO9Y9Xueyt3
	dliR6pykwpxPuiDmmYAQwxzZsl6TgOv7xtW9wRVMSNFWQ6MTeJiegKC9TnNXMTGR
	KkXuEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44evwug9nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:49:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6f134dac1so141343285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738064954; x=1738669754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMTiSyzPz9jN6LjslTgsVpii1bcW4uZ/GQwmU5IYtGc=;
        b=df8McIlBc7ghSTmR3AD5N0Tasu4N1yOjlmuy5gGJR5HN1rYakrdNFpTuCduuBbz//m
         4BVRS+7EP6UtErE0ifew8KhnW8Vmlnp6s4mThYeekulskPsKoK6WsAmiPXFUPmCns8tq
         wh2gVAI9cYTKulxIt1cMwcxvWhTG2TMWyK5eG4rIC/172CVdlISb93ei0MwiQ99az7ha
         EKOg+GFNOLq+oV99TnIIUHIgxpCLSNMxutfzBFY7duT6R8SfsuE0SZ5GGe+0Y8hYJcKL
         Y7V0HcYn9I92RrblfJFSlkKbPVJGpCmKgDDVpG+oyAQSjkUPTpSzjteQd4mkLJkmttNt
         2i/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGy6xKLYtINv9jDUFEoh7D4waryoJV3a99q1E8aCNYAL3u9UFMvUb7U7hp0ZmHKUN9SmSuobzXWJfVVNUI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Sd8Q7EwJtwKoCM0QJmKr7j2UNa+8UDgR3nod9sgmt3mu7RbC
	6FfuPwnF3chLTnE0/SOM9QrQLcjUTpaZ6B+TQrtkIkcC/Qvp1MI3iK/wy9hVS4CYtzE9N9iw9ob
	Sy53EpWhw4/U1M8PlVsgmsigdJASHmABsbd3tLYXYprqP91j7mqWh1AN8Ea0e9vOk
X-Gm-Gg: ASbGnct8+nULmCDeT2IcbDIkBbMeYtwbjpkR30tF9Rjbqx9PAb1MViPpns2g5dAlqt+
	XeY5jT8DZFFTYy9X01ChIWaKAHeGRKB/A7gD8tiATQQVBFC+TBIzE+NvQqSQbNONq4spDCqLfQd
	qRNRUIP9Qr/TEgSHIv+Rrp6MNVGwCB+NQL1yx8PFYnSyYXgmkts+lfYEnmlycNkwYUMrsJo9ETW
	hMPvW4haea9edM9JdRRM2KTMbANIJFLlLjyQTfJBmHS65wuiHQS4ls3Dgy94P3n5RblRH3dLrX8
	IcShpnPZAoaYE6/fAJV9h/u7CVGvRKvnlaL4Fn4m5d4cbndvzzYjDqF0RGE=
X-Received: by 2002:a05:620a:d95:b0:7b6:c405:b586 with SMTP id af79cd13be357-7be8b30bf0amr1587055685a.8.1738064954084;
        Tue, 28 Jan 2025 03:49:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI1dJiPQTIhshRK4KWxNT9fbuaLY+4vOaJg+z5KunJ7ft3YpJ0l4tsvlrwy0o1H/pwbMZbNw==
X-Received: by 2002:a05:620a:d95:b0:7b6:c405:b586 with SMTP id af79cd13be357-7be8b30bf0amr1587053485a.8.1738064953639;
        Tue, 28 Jan 2025 03:49:13 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbbbasm770357666b.146.2025.01.28.03.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:49:12 -0800 (PST)
Message-ID: <42345315-0c64-417b-9e48-bc95a8d9e388@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:49:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm channels
To: Rakesh Kota <quic_kotarake@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_kamalw@quicinc.com, quic_jprakash@quicinc.com
References: <20250124070200.3969230-1-quic_kotarake@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250124070200.3969230-1-quic_kotarake@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cXzy8r9eSY2FScgRUkpZYtZHX1rVfnWz
X-Proofpoint-ORIG-GUID: cXzy8r9eSY2FScgRUkpZYtZHX1rVfnWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=811
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280090

On 24.01.2025 8:02 AM, Rakesh Kota wrote:
> Add support for vadc and adc-tm channels which are used for
> monitoring thermistors present on the platform.
> 
> - Add the necessary includes for qcom,spmi-adc7-pm7325 and
>   qcom,spmi-adc7-pmk8350.
> - Add thermal zones for quiet-thermal, sdm-skin-thermal, and
>   xo-thermal, and define their polling delays and thermal sensors.
> - Configure the pm7325_temp_alarm node to use the pmk8350_vadc
>   channel for thermal monitoring.
> - Configure the pmk8350_adc_tm node to enable its thermal sensors
>   and define their registers and settings.
> - Configure the pmk8350_vadc node to define its channels and settings
> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---

[...]

> +&pmk8350_adc_tm {
> +	status = "okay";
> +
> +	sdm-skin-therm@3 {
> +		reg = <3>;
> +		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us = <200>;
> +	};
> +
> +	quiet-therm@1 {
> +		reg = <1>;
> +		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us = <200>;
> +	};
> +
> +	xo-therm@0 {
> +		reg = <0>;
> +		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us = <200>;
> +	};

For nodes with a unit address (numbers after '@'), please sort them by that
address (this will make it slightly out of sync with the alphabetically-sorted
thermal-zones, but it is what it is sometimes

> +};
> +
>  &pm8350c_pwm {
>  	nvmem = <&pmk8350_sdam_21>,
>  		<&pmk8350_sdam_22>;
> @@ -789,6 +865,44 @@ &pmk8350_rtc {
>  	status = "okay";
>  };
>  
> +&pmk8350_vadc {
> +	channel@44 {
> +		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		label = "xo_therm";
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@103 {
> +		reg = <PM7325_ADC7_DIE_TEMP>;
> +		label = "pm7325_die_temp";
> +		qcom,pre-scaling = <1 1>;
> +	};
> +
> +	channel@144 {
> +		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "pm7325_quiet_therm";
> +	};
> +
> +	channel@146 {
> +		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "pm7325_sdm_skin_therm";
> +	};
> +
> +	pmk8350-die-temp@3 {
> +		reg = <PMK8350_ADC7_DIE_TEMP>;
> +		label = "pmk8350_die_temp";
> +		qcom,pre-scaling = <1 1>;
> +	};

Similarly here

Konrad

