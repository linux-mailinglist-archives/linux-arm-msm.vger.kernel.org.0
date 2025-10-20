Return-Path: <linux-arm-msm+bounces-77969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F69BF0818
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDFD33A316E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C092FB094;
	Mon, 20 Oct 2025 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jrb4O64c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531852FA0DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955400; cv=none; b=Mexvd7YIubKI7ImzY9bMN5vGLKnxGpECCxrnN8zeT0ZA9J/eeGXnff8K7wUg15SDq0w9mh4w1A+3+e9vTHcxGrycFzQEhlVD/V2t/l61zg7b6NK39u1757AWh7CbztNO0JVMdOVYjRrBAYDLdLo9Moi4fX4EuLOkj64z030yC2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955400; c=relaxed/simple;
	bh=mdpf1Oy2ydcWXpHDNlNXheRGi6wp8wV18k/D4DoO4KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOAPEv41+ZJvgEGm1ymf922PYvQZrOFVaZ/3GlJBSDeT/ZSQRX/IM/tUthqUOs7pMjjiotxowcGKbMXuOXTKFhIYdO6V59zNKTI19nb169Zojm8vXvVqIFW+Rv0CkxzJ7FviqVobkVMJ6fMUq8c4bKu3OoNhyeLbi/DPukUevLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jrb4O64c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JLop4K013109
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7GiakkB7w+XPBZzGT+5+Y1LK2gVzD7OqWO9cWs4zks=; b=Jrb4O64cZk/y8r1s
	bWyhZfULLMdw5Z9HLly+yFfaQ87+YeOkBvk3+CCRzbqg8oE6EbnggIq5kcPp6f2t
	lL6b/DkvT8SS0bFfOcnIqtRm+RAJZqLZ2BwdulCVr4ZVJ/bINKJtwsfXbxePSyTH
	r0saGmA+H9JLKuybf/I+lCvAiOstOIzs0Jad8iosDZDcTxtRs7vmJt46DPp5oEUU
	bk3yzjOIwnXcN88ifd3bx9CorjR9X26ZZneBy0MyKVcVf5eoBczoZue3+kGC14J6
	cxssThapAVbxbHQTA01y2IJD0o7Oaxk21Xi4mcLzFBssdFmBUIGSj474kg2TQe3x
	r40VwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfccju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:16:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-826b30ed087so12966196d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 03:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760955396; x=1761560196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7GiakkB7w+XPBZzGT+5+Y1LK2gVzD7OqWO9cWs4zks=;
        b=Ni+LeuyL0euVYTwKhGY96wU1FMSlrStu/s+1dEhE2yZ0pXWcAl6O0rL/w6xQ6k3QNw
         GR7lBCpdCeR1LeRVVQBhAuyfmsJfCYHsQ21WwzZH9qmxzkn0d7WaJFU4jnHDwpWpFVSv
         uKs7OxqdNCFifQuUfTWZgiwvZ9KOcmQWPCQgYRIRhGXpRBTEqdHOSWHOVcseydRlm+IM
         3bwSC7xkwL0hDC9T+mfg7CozlgxsN3qeHYFLDdbAEbJBNV9SjXv8krAQMfKx1L0jaWaU
         VwwzcKr8SUU/szjRPaw770Cs1d2r/iOgotOombsfnhW+UCtwvKhsm0h2ke3pkwqjDr19
         i3GQ==
X-Gm-Message-State: AOJu0Yy6oSx0M1gZJpQq9ied6KjETIOXUUL2w/iMn+5PtTIpeQpLYffd
	WE8UFeYbswNTacS94+twf+pI+rMzlxwkJKgp6TLkYKnFIcmCKCoUU05iFaSkgRwPpj9/wOm89Az
	QfBo/Sd6Npvs7rjNEQGJLckHvNsImuGchCpL4e01EYqX+Na3JL9uDF4CD5Xiyst596/7f
X-Gm-Gg: ASbGncswqtEHhlLt+i7q/hyoWrjh7nEmiD372+He5dL59wCjETS+lQZdgQkITvQ8xuo
	X4PoXgNcWf/kXfwBtX6WfNggp5IWhY8d1bxcEQbOgzOlG6eWJIgIlMDXdb1vtwa6BFUvHlDuiLr
	B6h5RduVXQK6X76nEgAdvHbYmeT+ODBOP5uJmGT53WvtEL9HZ9UwZtjQxAdyvHmyuGdwLcRSCSI
	vDIu3U/SsnaTslLTPVlKGDY6uNZ22zCfbAqjYvuj16rmekWthq82hquxcQlf8nqPggqaZJmYImC
	Gr/nHLLlENGYzT2yNLROJDVA0FUN2e8G36PMflIJtAqzRBEXg1Xuyhe2DRBb4seIoPpI9LwYTgl
	QpEbj7c/p0uF6c0nk3oGjhqRxV32oZjudRpUyHMA50WCakp61EYR0gWm9
X-Received: by 2002:a05:622a:164b:b0:4e8:9126:31d2 with SMTP id d75a77b69052e-4e8c1ab2c0dmr24082491cf.5.1760955395819;
        Mon, 20 Oct 2025 03:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS3mAY5bftHTOOPGyd0UuN914pq2mMKSAA/PCsiHWYAXoa3iQZKyBuxtJgaJglQpUr7gc+jw==
X-Received: by 2002:a05:622a:164b:b0:4e8:9126:31d2 with SMTP id d75a77b69052e-4e8c1ab2c0dmr24082251cf.5.1760955395353;
        Mon, 20 Oct 2025 03:16:35 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da3412sm750511666b.3.2025.10.20.03.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:16:34 -0700 (PDT)
Message-ID: <c754eaa1-555b-4ec7-8539-b98a037bc2c0@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 12:16:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: Move address and
 size cells upwards
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ecVGqy54phuWkINuGdZihOqQoQT9308h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXxpa/tKFRMV2i
 Um8OHNa0LZJwBVAECzd4pMaSvcclCPm+VQqptXqHChqkV+BRBMc1shKWgizpeDKOyQQZ+JBUYgv
 1+lUyDNlChN7MQPxiLDYlI/iLlSa2pjWbY1lzGpxSxRd4ArpFP3/SjC4Sbt8Ib866i4Tr/xHyPQ
 0B1m9Sw/yF3uG736NioRHsOR4aCHUmWJBD/TvXm+JuyT+t4iQ+wcSRwk302uqe8r9JXcKfOH5OQ
 qpQnRt3wl+3PGi+FC0KXlR6q+19+xdMLy+1QgwJ1ji/a8n3QUn0ih+ZtHnlUiC+hg/kxpuxTxxR
 CaL9dW1XxrDZTw6/5KJPjyO2p77FIDtrCqJ4zewYRyQgvX2qaaEGdfbQe5mQXTzmq8WPZANj56+
 WQJCSGE8c+tpVef4YHavaZWSaboPmQ==
X-Proofpoint-GUID: ecVGqy54phuWkINuGdZihOqQoQT9308h
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f60c05 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ze386MxoAAAA:8 a=_PUjjehnJBWPTTrYcrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/20/25 9:55 AM, Guido Günther wrote:
> They're used in the parent to describe the panel's reg property.
> 
> Fixes the
> 
> linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> warning.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 89260fce6513..44e7b5015d26 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -472,6 +472,9 @@ &mdss_dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vdda_mipi_dsi0_1p2>;
>  
> +	#address-cells = <1>;
> +	#size-cells = <0>;

These are already defined in sdm845. you can simply delete the lines
below

Konrad

> +
>  	panel@0 {
>  		compatible = "visionox,rm69299-shift";
>  		status = "okay";
> @@ -479,9 +482,6 @@ panel@0 {
>  		vdda-supply = <&vreg_l14a_1p88>;
>  		vdd3p3-supply = <&vreg_l28a_3p0>;
>  
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
>  
>  		pinctrl-names = "default", "sleep";
> 
> ---
> base-commit: f406055cb18c6e299c4a783fc1effeb16be41803
> change-id: 20251019-shift6mq-dt-e4b9e7dc7169
> 
> Best regards,

