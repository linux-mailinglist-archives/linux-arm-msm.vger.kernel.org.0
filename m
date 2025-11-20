Return-Path: <linux-arm-msm+bounces-82697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B07CFC750E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE4D34EA539
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1353596F5;
	Thu, 20 Nov 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIl0Bhmq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0BQrL6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB693587C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652346; cv=none; b=pTQPDhkTL0IhBrdNc2m+JgvsWMa0D3p2HUpZil7dV6AOCzcHNlI/rSYOlJFXriLvZ5OHPvwQlCO2m+wCAUQi4owUR95XSi6id7Qvm35PEIho4nH6Mo6maoT5vM1sRDvKnEtlqC4+rhygAUL/G2/hlLp4xc68XuG75VI13AQ1r6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652346; c=relaxed/simple;
	bh=jv0jIZ88reucc3G49b6YnDETJtm/Xb0K8wGMYj8IzUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eYk2TWo8o/qF78Fkhr8GOsS+lAxrKDxfPDrXQAkZyPSozSbPwcHKy2Np4Y2xIy2FUNN3RyXMkVCIWxNryrRAQTDP03twmIuYwVz1HUzLCDrJXaw9b+Zql6B1YpV/TF+50bg1l/UHoIG/QDFYECb01KkAYfOaTJaYKk/xz8VLnpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIl0Bhmq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0BQrL6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCI1rJ3407794
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7HmHfquNI1OT5a7UNhrBHIae5NWUPdQJDgGPC4ecSA=; b=CIl0BhmqEn8m0WIW
	ff7A50kP7P+SIuhk5ZUuR3ELwOVsAcunefHb0HW2fkG35KpZB59N9jmEpagPGOod
	REiQ0Gcjm7nXAvTQP1Uzo+EDRNRLGDFpqz7m3thozGURtySedK44+rH4PfzByTgL
	6NhI8ynjeYg7AIqdI6yf6OHbFO673y19zDmO0f3lMoKhsA/y95iIY1W+hCB3ZsLl
	FmNTrzdfcy0p4NV6/nLDj8JFIE73LIHPmJjjJrv4PPAwRgUQO3eXWoh9MvMN1U+t
	hwbz50XMvbrHqqyl9xuyCmvKMSgjjUOaSjkJVrR8/yVl3a5dwZQgDWGYqhQJytDr
	sa4s1w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahm8138ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:25:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9374cc6dd97so31505241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763652343; x=1764257143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l7HmHfquNI1OT5a7UNhrBHIae5NWUPdQJDgGPC4ecSA=;
        b=e0BQrL6F/PteAXBugou8hfBzAp1Csvcn63RvW6H4afhr5sEDXM9MAYvQgCurT8CzmZ
         IAa4fY3o0XOWwlLlyE5WU3TWZNklcOPadDfxboOts5XvVuQ0Q6FdHbtUAmqOmO4manNC
         KXoL07JbroPfpLPTKaeLlWGvAtQDCvbjW4LIA61jPrJAA5ZPpbk0k5AntGn36uZ0Bhmk
         3tA30/+8iaunCOFHRVGM1LWDlgcE1+McYiSzdtyi9VjDlhpNwhgs2walj5NiDIW5DjG7
         Jd9oRcBdOFGIHficxswJKwSwviO2Ob2LhX5WCwQmPfdkOpRfv2Y22kvebVeyKEuoMDEm
         A/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763652343; x=1764257143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7HmHfquNI1OT5a7UNhrBHIae5NWUPdQJDgGPC4ecSA=;
        b=RAhpyDzVrZAaqZZGzgPzcEjJgMxZisRj6f6RcYycaNfkAT0pRcpVyzwceVO53Gn0Dy
         PeLjwZ4OVoOTakNJeYg4795K6s1YZvdXonJo7mGlLzvFg5T0onieMJBX/+bvSChT5/Qq
         7jWOlV0Z4WsU/veiRbrh7aHy6uRfEcBUsX5phWO1qbbddpbd6howtmuorQNawZCPC4uf
         8D5rLgmkOO6myjgyIaM8JW+aAch3N7sQXLgQFWYIySwEpL3PzHQzUnMZtIpNutaYXrVK
         WIA5qgnkR0mY0mRfsPoGh5hGhT2LefQYbpRgeOq8w0L8NdryiTXGgEoWL/e2QsYeBpaP
         Ibjw==
X-Forwarded-Encrypted: i=1; AJvYcCUtBOIE6k4NLc8RIL3j+uEJvvQs2nVRQQGcADYiiXfArRruurUDRrGeJ+f9m5MbA2EpEP2EwcnPLLGkeUV0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9zYcclzpRXH3I1roLKbWeMOjIe4RCBG1zBxYDRTgMRBLnKuw
	kVtzmaY2SnAUTJ/NZpw6MA3ZCysLptbLToB9y7N+G8kpdFK+L8l2Hy65f9nddaaD2oWs1kmsNGb
	DwEv6vkjLtCE2yb1qRjW53SYu86hgRvBaz4CDeD+EP8FasvcHtLUOB9FVWbQQwVq4Igp1
X-Gm-Gg: ASbGncsl5mOzey1kPIn+iZoSVekgeZHwxdSVXGVTMYECKhBrjr/7ErzXXaZRj3+8v4L
	qwLxianwjNVm5ThtKyAagPf8wqyW1oLw/CU57L+1R6o7vBmyFn4QQpWGKZDHf4xwkcRsqiaqVzQ
	xCkSr+iVXePL/Bi4mQHDu8rwO1iUXz5x9CBApnrbVo3tg9H6uWNWScFxCYG6E7vN2M4XNxhf1Dd
	962Ky3yWOhhriWgPjhcQAPEveN5a1pskWfhHswN6fSga+co99zFIQ+Ta1iP+sjAH7KoImpn9/TQ
	E4/tT4IZcjFMSAoV4/BByKvq4Lmzpjb+nwKrvfW5pFOVAw5vZLMLqyLryqRzYzlV1XLt9yJQS2S
	h5fnB3OoA826D06TT+c8VFQnvYsCEwypndU6/nGHu45DGwBT+NbbJWupPJlXvVMSeL80=
X-Received: by 2002:a05:6102:3752:b0:5db:f0fb:2704 with SMTP id ada2fe7eead31-5e1bbc6a27amr710418137.1.1763652342741;
        Thu, 20 Nov 2025 07:25:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCdThJ2wfApBZ9lNnnRtTHGSMDkxZXoL2xm+fMQulei2yZSAQ76gE6yut8Jv+PUspgeQNliQ==
X-Received: by 2002:a05:6102:3752:b0:5db:f0fb:2704 with SMTP id ada2fe7eead31-5e1bbc6a27amr710410137.1.1763652342319;
        Thu, 20 Nov 2025 07:25:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655038011sm226728166b.62.2025.11.20.07.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 07:25:39 -0800 (PST)
Message-ID: <8e75be2b-643e-4380-a018-3cb718745101@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 16:25:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom: add ipq8064 board variants
To: Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251120135435.12824-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251120135435.12824-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NjSPf7PWyU_-zF0mEDC6nL0p5pFy_qCi
X-Proofpoint-GUID: NjSPf7PWyU_-zF0mEDC6nL0p5pFy_qCi
X-Authority-Analysis: v=2.4 cv=SJ5PlevH c=1 sm=1 tr=0 ts=691f32f7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=x_Ew91FWdxdaNmS5o6UA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX4OsU0EYs8JIe
 d4CbR2NU9SzUf7NI3GgYtbVyQco8d5cs6YCwLOGDSYux4op2kk89b3F5OGaS3XmD4j6BW5rTT4l
 8W6ouDRKOjPzJXyG3wAzxKW8LtXeTwnsYuhFxsla9Ohb1nmsuHRrfRUFHy8z9nJx2/6TPbEhIS3
 kUHNq42Eo/pGeYZ0H83o6yBAOjeakwXGmooIDQyqY1HN5l9DI0SXkJlGTUG9XDUhuaGY/Ckdcik
 DS0DOz+wAGCYf73D8ID8VY6Wrufy57Qz85fQMdVWhiA+JW+W1WlhQTC7s3WSx51tvNKS54eURzH
 U/+i5VSJLXKiks4Hn58ljx8gaeMe6YEdlELmA2JG24mqlcozcSnqMMFBdAZNNhMhyVdOD9amxae
 fi2MXJ8c66EkiOxP0Fc7EyI3er5/QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200101

On 11/20/25 2:54 PM, Christian Marangi wrote:
> Document QCOM ipq8064 board variants ipq8062, ipq8065, ipq8066,
> ipq8068, ipq8069 now matched by the QCOM cpufreq nvmem driver if
> socinfo can't derive the variant from SMEM.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 18b5ed044f9f..0eb1619fede8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -299,12 +299,32 @@ properties:
>                - qcom,ipq5424-rdp466
>            - const: qcom,ipq5424
>  
> +      - items:
> +          - const: qcom,ipq8062
> +          - const: qcom,ipq8064

Since 'items' requires that all items are present (and in this order),
we would normally have a board name go first.. but I suppose this is
some sort of a fix to the issue that sparked this (posting the link
for others to have more context)

But since these SoCs do exist, I wouldn't say this is necessarily
wrong..

https://lore.kernel.org/linux-arm-msm/20251105112136.371376-2-ansuelsmth@gmail.com/

Konrad

