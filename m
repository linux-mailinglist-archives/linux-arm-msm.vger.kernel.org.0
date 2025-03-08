Return-Path: <linux-arm-msm+bounces-50720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B9A57CAE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 19:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BBCF16E372
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 18:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9DD1EB5DF;
	Sat,  8 Mar 2025 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTtYv9Qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A71189F57
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741457933; cv=none; b=AyPf7oTd3vAOQOFjYIB28QRar8X+al+kRlVgEoUVnfMS0cOcxbAZ0sPfqWfu80dKoqGbnKbby7B2qiMhus2Dsfpj+OnNgaDeUxGMme9md1cH3snnSYHPxpXc1zzH5TkS/a+X8s0d6gTtNF2dW4VQKuv0ySD0GNFqpKhiOnwfXF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741457933; c=relaxed/simple;
	bh=bD5AxlW2VuIQuhSBoqUIurhWpaf1zNk6Jv/tgufQBYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ah8BX3hliM5YlirhZnGVDKi1psC3Gp14sCSPvQnxQfuNEadz+M+LhyP0FOz8CSWBstKazU90x+NC8ukcmHH/GXb/RXnTRVA64Ry7K/8zlPmWeDzWtjC5qIu+LUe6Pcp5hB8RGAF3qj9na6Ok4/04mmuskBdk0T/EQn/emgyQ0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTtYv9Qp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5286plp0001914
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 18:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7VMOOHCnWWv5i1BgNSjDHokS7zDbQFxUlnbve9H9B4=; b=WTtYv9Qpmbt5XRJu
	dlottvEEGXZZ4SeHzc1MmmZuRSELxqcaTKhxpYyYZLP9zsZ0n7whCf81oTyVnJZo
	CgQsyLBhF/Kz4s5grlQ9jLYUVvrv3WnSBKJGHvWq2/TWUU6z7DY0+RjOJH4g6W17
	8tupzaUP/j2vO+DKxyuPSVj/eeJvQLUCEwTLMhPoA2U14oXKwMQ76SJcx3tMpPRu
	us1vqr/nwmiXW2jgJPLc0LXaP+Hr1NdiZ0RGqoMpC9RqIzfiLN6OtpTwx+WBQS1C
	6AotpaBAGzsvVDFBFfTeKgF4vBTK1Cc6nWdG05ZFllrpldcpe3OFmql5r/23bzjw
	GI1jHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0prxvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 18:18:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476718f9369so1883861cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 10:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741457928; x=1742062728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7VMOOHCnWWv5i1BgNSjDHokS7zDbQFxUlnbve9H9B4=;
        b=avivhOMcH/uBaUyD5HRdPezbIKkjyQkvANlJBn64keOQcMjIeMdA4sjf0nEQUinI4N
         v4dXlWXFvUzVFUN6MH6gqRqIRnE+UD9GJprA6BHtELeSKP2hQ+kfUZYHuZfSdLrhFHsr
         fKq5EQi6H1z7aSotLW8/7UX3lpTGN4bPvQnbEWPc9+0d5W3HOOwLN0lFpIGCHahma/SI
         OpXMpza4Rsfa7f1w66ToxKgr1MuUw6wRpaMAsr0BZESdStYDbULEjZk1mofQAfVXxrcZ
         He/gODX4xa3sVYfevb9ymTCnp1Y+AT0fKcMY1nUW7GFh+ZU9jmcB6chHJlaoUP+vZrmn
         oNOw==
X-Forwarded-Encrypted: i=1; AJvYcCXfp9hkRYA6oppK6qTt+vPqV/A4+VMJx/+hV1bB3JTLUopC+rBWwjvsqV8BnVApsfM1BmXMj/Z0wEHuqAos@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+ig9etcNj0Mgn5AMWoHVU/Lw0YoaWBByGycBeZl8wCzbmfU+
	R9C0V3xKUxlaVZTu2p8x5rxzfjPqKVxgfu1lgLgAvrJUvPoAfdNckR1Ob5x4sYlbBmiwVzILVDP
	zNjA3oMy3pWJZpeF6TPAZKmZc8ZiTyzQdZDMDK+WUQER2qhSWi+Srz8bnPr2pgIHY
X-Gm-Gg: ASbGncsdUobu9eWu5m4QDbbpkruIyhaV0NvppO49161wMCH6UdZEsNiqunSr4KTw6DZ
	nczlrLDyfAU+5iNNhM7zXcEN7ZboNpPa7UOadc4vFrChc9lVXzkX89n2++kpBFSmIDoBZEQXkA1
	WHc1Uz8FHXfioEwDJVv07Ro00lHZ72c9mqvoDY+nAHAskl4GdyyPzMT3YWBHB68s1RNbBQg3K8P
	+PwXD8oBT+LTxFHSQ7aTo9NxOA7YUXow+o8I5j8Jdo430nNUVi0QlS7uJCMwNEqAmYczoRwLVqS
	fLBisUML22fNtIwZlh0hHAYHdu7XOfQ7MinQfB4qvj9R7GpbEHo+iqc6RHN0QTqCCaQAjg==
X-Received: by 2002:a05:6214:d8e:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6e908cbf908mr19100256d6.4.1741457928269;
        Sat, 08 Mar 2025 10:18:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU4F95kcd7Qv2rTv7eBfeED28SPZ057PpxuS5TT0SI7vVwgcCC3vnEZVR8Vy+AG1PAq2SKZQ==
X-Received: by 2002:a05:6214:d8e:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6e908cbf908mr19100116d6.4.1741457927902;
        Sat, 08 Mar 2025 10:18:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988cec9sm472280966b.144.2025.03.08.10.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 10:18:46 -0800 (PST)
Message-ID: <39389406-a581-46a7-bfa4-384d3bbd09fa@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 19:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: ipq5424: Enable cpufreq support
To: Sricharan R <quic_srichara@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250127093128.2611247-1-quic_srichara@quicinc.com>
 <20250127093128.2611247-5-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127093128.2611247-5-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fpcB0DPqvaQSupwkD7LMmPbxcqtbWXk_
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67cc8a09 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=qTnuS0Aw-iaHhWJ6p_YA:9 a=QEXdDO2ut3YA:10
 a=X5f3S4XyYk52BB0gviDM:22 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fpcB0DPqvaQSupwkD7LMmPbxcqtbWXk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=920
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080141

On 27.01.2025 10:31 AM, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

subject: you're not enabling support, you're either enabling cpufreq (the
feature), or adding support for it

> Add the qfprom, cpu clocks, A53 PLL and cpu-opp-table required for
> CPU clock scaling.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---

[...]

> +	cpu_opp_table: opp-table-cpu {
> +		compatible = "operating-points-v2-kryo-cpu";
> +		opp-shared;
> +		nvmem-cells = <&cpu_speed_bin>;
> +
> +		/*
> +		 * CPU supports two frequencies and the fuse has LValue instead
> +		 * of limits. As only two frequencies are supported, considering
> +		 * zero Lvalue as no limit and Lvalue as 1.4GHz limit.
> +		 * ------------------------------------------------------------
> +		 * Frequency     BIT1    BIT0    opp-supported-hw
> +		 *	      1.4GHz  No Limit
> +		 * ------------------------------------------------------------
> +		 * 1416000000      1       1	    0x3
> +		 * 1800000000      0       1	    0x1
> +		 * ------------------------------------------------------------
> +		 */

This is trivially inferred from the nodes below

> +
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <1>;
> +			opp-supported-hw = <0x3>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <2>;
> +			opp-supported-hw = <0x1>;
> +			clock-latency-ns = <200000>;
> +		};
> +	};
> +
>  	memory@80000000 {
>  		device_type = "memory";
>  		/* We expect the bootloader to fill in the size */
> @@ -151,6 +202,18 @@ soc@0 {
>  		#size-cells = <2>;
>  		ranges = <0 0 0 0 0x10 0>;
>  
> +		qfprom@a6000 {
> +			compatible = "qcom,qfprom";
> +			reg = <0x0 0xa6000 0x0 0x1000>;

Please pad the address part to 8 hex digits with leading zeroes

Konrad

