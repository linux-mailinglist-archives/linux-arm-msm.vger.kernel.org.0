Return-Path: <linux-arm-msm+bounces-80486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6656C37A29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 21:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA7F3AA083
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 20:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E1633FE39;
	Wed,  5 Nov 2025 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPAOTvzg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPNaRd7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690073168EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373255; cv=none; b=g9Jj0k7bcwDO2gY7zDk74PRRunhGBIs9vfJcK7Acb6TLCTC0Qow7VKqjrHh7K5fXDSK7u+wWDY75XTAQb8hJafts3Ph+FYmTDWYy03l9L8fEzaAH89SCO2GgUQqz+qUL2/JzWbJPgTxcGey76ChEj2IgzVnRbPNWdAQV9DnOo80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373255; c=relaxed/simple;
	bh=NMfZdwLuKCWDLotomeU5T4Jw2Q4y5hJM9LHYzZIYy4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBe16xXgbjoHby0S+MJvQKJhsG5ZjXu7F3Bf7Zgfu8SzJFElDIlnZ5c0P3N10SgDPvMmxuum1Ti1o+OytMWzELon5HGXgOWFvengu9K5tGrMnlqdEGnhXxQ6VWOd9rQu/JNltaDAKPyEHwDNL6Dg72kUxbwRgeqjJ/pXKAic6WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPAOTvzg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPNaRd7U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5H6FX51542486
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 20:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXte70UJlya0FT2yR3CqJtnYujIzRPJsXjE3Ppjs8Lw=; b=cPAOTvzg5lAEd2EF
	lYisfM2Hwy1tX1JH+vr6ceJLB9ASRM2pxNOsGGwt6jlHEPXGNgzM6gELB8YmzOvp
	vVlmnjqT7njvR3/M0WjDMgKrOMMN6U0LsQY1qRFjMkzRMKn08WHbF2aHYQizH3ow
	wOAVNZLeOX0Ntef5K8KV54tPvVoZlEBVCJa5Hra13Bf2vlGhQ1Rbg5ggafuYaq1w
	5EBGAFBTPtGfVZxlOoodMKSzfdNj0gzLUC+QeKCjFGM3eUoTfKCVKChP/FS1Z2y+
	Iu/95+KqTUHXZCsoHH8RKxSErcpYvo/B/YuXw4LnwJmJxX3GJMatuYgCGZjNi9oD
	rKlZvA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8apgrh77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 20:07:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340c07119bfso930592a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 12:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762373251; x=1762978051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXte70UJlya0FT2yR3CqJtnYujIzRPJsXjE3Ppjs8Lw=;
        b=cPNaRd7U8mMZhEtVQs1vaxZR6/I9b6blIGEHDJ64lH2xQqxJr0YF3dCjACt4ruTTQg
         zhZS1OoP62fWuFZy3AnMhryYHUKwEAALLXWj7Pjo7djuZQq1pUhLTbkrFWk8tRKTqJ6t
         IjkY2JhDHVSa0ny/rQmW0eMc7MxQ+gner/6HR+1aQqnZutSUEJMJRm6WwjDTnPhXl2qX
         yyg/L5f8mjtWM03v7IPFN4rL/xWJLicp8hGHSeG8olO2juhKbTnQHo9sEEWk96hQddnG
         KFPQDe0nQyvq8DitAn/4I6o6dNQvmPT/Bfv7CPI21vZ921H51JtN1kBmxI3yO5VPeMtM
         TJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762373251; x=1762978051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXte70UJlya0FT2yR3CqJtnYujIzRPJsXjE3Ppjs8Lw=;
        b=crKegO7cAslrEzBINdHp90NymMAqLkyCLPVNfbKoIi+jwX24Vn/OQFRyFbzuoOtxWW
         r9elFxKQUgAKL6ov7fA0Z1rxl4zSWCSg3PF7/TFhyUB2XoeYynXsaZ35rYqhZp4TPR04
         PO2sTiB0a81KDoQPB7K/4+NokGO8wwPOPfkGr3wwyyJqidAXroaLNHt7I2gmuZt81DDv
         ST35s0T428neHICL2ciHD1NOHPHFlpnrMwPpnrFf/d9vq4A670x+YZUhcvyaNGMFoGAI
         D67N/s29TjHbP1oK1yPoy1WlalHVKopvgLMwNGKwTcwqt0XxfsCYYH+BdnSWDi1pyBl7
         e3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCW3lHdgjpILn1jCpRH4N+hfyQi773+yrZTaZt/I9LBCRSqT/6udAjdUj783KqQG0WgJ5VaipwT6LWSXYUAC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66pllBTki/cfTOkzzlpqjrQ63/RF1OJLHFZJ6qX7TII1RIx1r
	IjJ7TDc/8VsmkIP6S49H19SeTSw/FVs/Iv4qt+s1BavjkMrWMd2j+5HQJm3pp2HiJlhdHQVcc16
	cnmVSLDIUdsnOkcQOJWITr+48Hwq00HBPR80ynmycUoUIY/U+wHgs0Fu6bzStthZzEhV6
X-Gm-Gg: ASbGncsc9pHnn9omPnZTFTyxiygP8tEV8zB42C3g5Qa6Kmc+RcMIiLqlGaKKYoYOafZ
	Vi4+4WiZUpibSL8UHFJAYcmYxaLu7LyIYzm64T3QVx+4TYzmG9ijeZOWrJoyp64N26VUSVGg6Hz
	au7w74Imc8Wu6Xhsi6tuRwmwPBuDfOD+p8A40yMWPbnRWISpGPuTyUvHliBUxRp3llhyGZUa/b4
	+pNx06m+4KEnYe6j9XOmJIem3M84PYXwhQ8rh5rZj0UXpZCGhmkZTYFM+CZi6GIfOwETbtXHAmN
	PHbM2MsUDv0kleKm1JLC5soDEUPOTNBqMjQqBsELmHR1Nm4ctFY6/+EtrBwJLy3AIMffiJndr7W
	P/KW/6++JNfE0cYmX6ncYDg==
X-Received: by 2002:a17:90b:5288:b0:340:ec6f:5adb with SMTP id 98e67ed59e1d1-341a6c4188cmr5494447a91.3.1762373251272;
        Wed, 05 Nov 2025 12:07:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2oIiT5cT/KgSMsE2GwnvmyY4tzqt3RdX+bPD3MBkVZw1rSLCCavXhikt/7M6yGLPegG8zwQ==
X-Received: by 2002:a17:90b:5288:b0:340:ec6f:5adb with SMTP id 98e67ed59e1d1-341a6c4188cmr5494413a91.3.1762373250772;
        Wed, 05 Nov 2025 12:07:30 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d1fd921sm3792163a91.4.2025.11.05.12.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 12:07:30 -0800 (PST)
Message-ID: <2948af7b-799d-4754-9460-c50f3f49ba8f@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 01:37:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS8300
 compatible
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
 <20250822042316.1762153-2-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20250822042316.1762153-2-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDE1NyBTYWx0ZWRfXy5WYB+SQTUjd
 lxPWwYz/u1pKUWht9coN7YjIDlMNIdSX6oHK4el1tDDdg90gqu7yo+/WErB50BswC0A8vidMEDj
 VJDhqjkZ2y0z2AZM47ltUbAvVhi7Q+m9xpROFix3eo8jnoV5TSvIbffIR6dL3hJyzZhTVRMAEux
 8Hk5J/ApIq8jsDHb9cC3df1IR+/5KXalCB+U7lZn3R+XWPYjaSBbw6URm24jHiM6J4rqqxWci5p
 CZs8DpUxD09HM2Q7L3/EhG8tFAC6uKnpfgq0tQz5r1cPEBSdb3vQyXZmKtMT2ly6F9DhNvFuGQp
 WWm9QGj88+y1o9EQwutaDJNs5/zYwtQdDHnehd8QW+NG7JvIhLL1ato05478ojKOTTXJsGOjJJr
 bPhuA6SCHbXBz8rTyHk3wGJfmQYKbw==
X-Authority-Analysis: v=2.4 cv=LoCfC3dc c=1 sm=1 tr=0 ts=690bae84 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=8netTnWCcZyjVmEasa4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OBX3tFrbjs1e4UFri20yIrzTt2YL2aKI
X-Proofpoint-ORIG-GUID: OBX3tFrbjs1e4UFri20yIrzTt2YL2aKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_07,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050157

On 8/22/2025 9:53 AM, Gaurav Kohli wrote:
> Add compatibility string for the thermal sensors on QCS8300 platform.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 94311ebd7652..7c1f121fb417 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -54,6 +54,7 @@ properties:
>                - qcom,msm8996-tsens
>                - qcom,msm8998-tsens
>                - qcom,qcm2290-tsens
> +              - qcom,qcs8300-tsens
>                - qcom,sa8255p-tsens
>                - qcom,sa8775p-tsens
>                - qcom,sar2130p-tsens

Looks like this patch is still lying in the mailing list.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil


