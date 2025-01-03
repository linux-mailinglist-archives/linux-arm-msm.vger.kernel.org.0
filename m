Return-Path: <linux-arm-msm+bounces-43881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A478A00944
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2894D3A01D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD952563;
	Fri,  3 Jan 2025 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzC7AKHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9A1F8EEB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907519; cv=none; b=tXUVPqZCOFP89vJB+AW6ZfLYAjiS6OYNC/Gu2rXBxRLofbLSAbmgysf8TRk0NT/JUCK0MNOPXNkvT85n8gPNyZ4wYgovQertaRnm60OJWxk09P8OekLOy3GLtBKlx0t+YeNsS60rWy6Pao6D+NR86Rgztae0l/gTTHyecz0j+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907519; c=relaxed/simple;
	bh=2yj4zIXjqfOzUt/M5nAKi9Zr2TybsLG1KX7maAHaz/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GnmpAVOsuzvpw2RBELRPDVTZU2kY2l0cOJ3qG4OS9iy0k6e3TM5GTljM2iMNdhSxJzsVd7L062Sy/xLab7BwB3xTb8kqOWl02VsrpAJWAa8OD/JXOHt4aCgp+bnj76Ggwg8J1oLss6IDeffQn+C+gvvfl1tuSD0q5d/jiP+J9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzC7AKHX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037G0RQ011625
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 12:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbCFGeASBbp+aJ8DCigGIuaacIDBYuewRX647FPnEuc=; b=CzC7AKHXnEq0S5ib
	sNhkbEcYLLdtZAJqkYFA4JoS3k48Q6X5Vi0oQoeJvQwq9ohc7oFnmUPnO5L1lxQA
	JNyh8zc2Ppex6ngwisCh9dwGOymnv2HZliTNTdMhm4mmdf4Q/WTKXxONnA+sGTGZ
	8BlsHkuo/u13k1hxkLJMMRjFbKaxXeBd5ykLXDggdInbRXw5sGCmFH1KKdhVExgB
	aDRyXzGwKjLdfxBnFNyNSzktlVjY0ItwRer+lnoa4waO1lXshT/E92PglFLh6hdH
	7awRqUuIjgFuKg7k9fPTtVY8lAy3/abYMHhmUREQpramWycJiOtYkTYG9ThWANsf
	44tJFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xbbp0n63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 12:31:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b70df784cdso71996485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907516; x=1736512316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbCFGeASBbp+aJ8DCigGIuaacIDBYuewRX647FPnEuc=;
        b=H6ayJPmjJuDuNMcbxfc5JxthrJ69F1NHQLv2FfFvEPSblTYq9iZTkAUlIdp5NuU2yI
         PhbRvXmUa51/CBS0UFZGQqYpW1PKwg/J1np0ZaM2ZtXUo42uyN5bqN0Nrw8AzIdMfWjh
         BdDfL+p2bq6wx6CZuwNA1yf35zHYVI0wCCa8d9DZtFfOV5ozb0+f3UPXdhKW4K3u+WMj
         WZM8lvc6jqXxJZ1w+wmmYs2I10PmHYajLYYRQMe2Tsyc6CxOdGZzOvGc8vN0X36TBZjp
         tUGfTxCyFcndOyMMeTalU108WTqMeDA+Jsk4hNUWw4J7C/WDAFwHHApUvhohaErEbR6R
         PkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXqXPHqyJduoIZW1SR6PpL2psRzm3enS6xIXsQBeNP1roxXg43bwuWD7DiDykpDebQXijblkBNY00FFH/Vb@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWgRt1TzKIxuk4+U2t3Sy2i7HTvHF14Tkw0T9VVkGX48jBr1Y
	oedAeNe1AWt0Qt4Yi4oCtva8DuBeAx9yZZ+ohErgrXuMLHs8Zr4cjXmjYEOYVl3KZLJhr4Bc2pJ
	mwQojIlAilX86mjL5CvdrN8K5raUzQAHMsYwqQHLR9iBbQX2Qi7MXfR9nzvar78yT
X-Gm-Gg: ASbGnctEjFhduiylAdDnOOnZWcH3F/clZN1r5+E8OlJGNRd3AIjw6H74inv1qbJIUFE
	XgeOi4+gL69pfAiu0Kekf8fbLfXGsBNrbisLYgdw4vH9mvfuFh9izULIbB8z7YcrQs5RsHrNtvN
	bkfDOn3U4SOD604K/ylDyl0kDzJeMUKZsj09ADzWbPaQnx+aF2nF3km1Jl4SJPNwRMy8eOd8hsf
	02i5xHtl4l2iUxheUnbZJVo88fuekdjjTBxm16vFexLsEAdQ38yUbMBxgbu9BVoIu9oUWVehHeG
	Iu+BIoPiEpTCx3k/xZ7PDSm0rwqcKmcRxBQ=
X-Received: by 2002:a05:620a:8003:b0:7b6:e196:2219 with SMTP id af79cd13be357-7b9ba712ac7mr2883151985a.2.1735907516248;
        Fri, 03 Jan 2025 04:31:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJbkwMlFjrpul7f7rm7EIo2HKdAdjqxPQgCG5zocaULMWfd6CcUWsoarcjbH3mzF+GWbpG/w==
X-Received: by 2002:a05:620a:8003:b0:7b6:e196:2219 with SMTP id af79cd13be357-7b9ba712ac7mr2883149985a.2.1735907515836;
        Fri, 03 Jan 2025 04:31:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aae8b802f64sm1692170766b.108.2025.01.03.04.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:31:55 -0800 (PST)
Message-ID: <9470fb05-0fc2-4bdb-9192-ae18997aff70@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:31:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: ipq5424: configure spi0 node for
 rdp466
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
 <20250103063708.3256467-3-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103063708.3256467-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NP-q4aCkfM2MPCxcNf9ABFIN8hy0MmqB
X-Proofpoint-GUID: NP-q4aCkfM2MPCxcNf9ABFIN8hy0MmqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=993
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030111

On 3.01.2025 7:37 AM, Manikanta Mylavarapu wrote:
> Enable the SPI0 node and configure the associated gpio pins.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V4:
> 	- Revert the 'renaming of spi0 to spi4' and follow the existing
> 	  naming convention such as spi0 and spi1.
> 	- Update commit message.
> 
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 43 +++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index d4d31026a026..60cfa8708eb4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -23,6 +23,36 @@ &sleep_clk {
>  };
>  
>  &tlmm {
> +	spi0_default_state: spi0-default-state {
> +		clk-pins {
> +			pins = "gpio6";
> +			function = "spi0_clk";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +
> +		cs-pins {
> +			pins = "gpio7";
> +			function = "spi0_cs";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		miso-pins {
> +			pins = "gpio8";
> +			function = "spi0_miso";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +
> +		mosi-pins {
> +			pins = "gpio9";
> +			function = "spi0_mosi";
> +			drive-strength = <8>;
> +			bias-pull-down;
> +		};
> +	};
> +
>  	sdc_default_state: sdc-default-state {
>  		clk-pins {
>  			pins = "gpio5";
> @@ -57,3 +87,16 @@ &xo_board {
>  	clock-frequency = <24000000>;
>  };
>  
> +&spi0 {

's' < 't', please re-sort this alphabetically

Konrad

