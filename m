Return-Path: <linux-arm-msm+bounces-56360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D6AA5C0F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 10:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 950AA4C5168
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 08:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0A51F09BD;
	Thu,  1 May 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuEqgNET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54F7083A
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087828; cv=none; b=fyx9NmBPkr88pFz1uPRfpJJ3MaUWYP+kj6S3cEfRsLo0xS2ypUaMvl9GjTB9ZB3rI/8T/WC8evK3FdvZdhqIZQPKuu7vefcj1+02KvWulT5SDF3HpQIUnH6Y5UD2Zp8Gr8bFdQzACNWXELMW1gK0wlPfMoDLl79ap96inq3DtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087828; c=relaxed/simple;
	bh=i5qIUYMGnYjh3O5bD+pGUYppyjmm+gTXmK92O4h2v8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlHjxZnTM9be695DaxjmDTlucuXAwcZ7YD7Yjwnns4f14FUNHya9GfSSXXw9fbu0qwP4PPGc7eFHLWPSj9FuTFKQKvIhTOvDfJzDYkUY4b3jac1UKtiFVShzT4YlzG+qfgJl8rDYsaHlABGa2m8OwDP305WhI4iVctybcRbARP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuEqgNET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UH0VAM017448
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 May 2025 08:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=; b=cuEqgNETSLOwnF+d
	ZFgIEOtfAFYyS4pTUChbA4F39BV2Gm/ODAl0V1wTqhUO8BQTnfzQn+9v8rqdC7Oz
	m6ht/j0Zj3/k9B1CDDciVcxTl8lVl0444rYLdRuRmrDyEglgVqjwJqut/36mtZE7
	V5SvB6sPwD07anEYlLdcDXPlFovNxs1w7gJrTtfDxRHXvQF7xXXXBrOUSBJfaShJ
	Q3FIl6xbxyBcu7gIh9xIHQqn21FSZfdpMcV5nk61SVbJPiQtBHttNIKPphrBUkEC
	m751KYZjnn6uqc5U/7/AzCa7o9ZdEM1jNe5JM4PlmaYY83IHgY8vtel7q28vYtwa
	T2io0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uacnuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 08:23:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54be4b03aso13030885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 01:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087819; x=1746692619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=;
        b=NG763TuzfmLvMJq7cU+Vj+61OXX+wAHpsafE5Gg2RP4uJV14uUQPWm0YlXR/jR6Jin
         9WUNlYPbaZMVyT1vnYCqwvXALau06dwBj2Bt7BkiwiiGihADlJeUthySuN2O9qruJClw
         sloSN+v91vaI64UP6dl8uqrAM2p5MtlZrLmLidH9Y3U8bT5QSDoY3iiObUkuJKzCfUGJ
         7oRIzeAxD4WYgCrM1GQvHP2DP2kIdrRu0Y/4R3ZDE/ojZAVChdUB6Pix3OHyY3EnFzd+
         KIiXOB4azorOeGiyoyhU5k2g3vJ6gJiqcuhKZMehqbK+j7lB/NVi/7w3KWB1S7uOlZ4n
         66PA==
X-Forwarded-Encrypted: i=1; AJvYcCUyI9/G+tKr7TWXGC+ddYP0QaIqCTG3f60xM4IVPJbQmzfH6pyfl+vVtKwLN7j6ok8WlJ7zn2TqxValUPVs@vger.kernel.org
X-Gm-Message-State: AOJu0YwAH0QpKvkrfxDttyynEDDw03JPVzG/oWyvBxEhYx7Mnik7rb0T
	qF/chBiVsHFpLmlGZmisRd4Dke7EEuY0FF33aUKDxWHOP/ksykmy3EIwmTur12ZZqaF6Aivg6tT
	noMPOFR6OOK6fgYgGm8LLGcCZFH5avQ8e8XrU59QnpoZaNMI6kkFQlbvIaPl84QZt
X-Gm-Gg: ASbGncv1numD4bVz1JRa5hX84ehOjMoI/nIQkUyKuCeyRkFK9qfdoU7mV1NPvrygYuM
	u0iApSXDL4MaJbzgk2zYNUTTcoV9uCaA0pdq8pt0MEbvq70MySIzPp22rs1Ho6rSQNaEZ1ONwnX
	HPEjgN5KGEB8BZQ9vdheaWxV282wm44/SXttjh3OFS1WJTnGfBdvXkUHOTtaugUT8xtwEHU614n
	Z4ohLZZnO9q64K59DSZljc28FRP1OYJnmXg5zM+slsNn83xQbB1YRp9fM3IgOceNeCQq7abnK+Q
	wt21SJC16HpY5NtIMRrve8B9V/MJD1dWiiGW6/Y3OqlF1J8adeLpH0nrTg4hCWDpmnU=
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162401085a.4.1746087819235;
        Thu, 01 May 2025 01:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJbzEzGsqZkwSu1kNt92eSKw+iLzFuEHzTdaaxapBQpXXrMYs7ZN0NxD9KdvXg5kB1l+jX5A==
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162398085a.4.1746087818757;
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af93sm7624966b.146.2025.05.01.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Message-ID: <a9f893cf-bb92-4acc-8d9f-5a3180b67d75@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm6350: Add q6usbdai node
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
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=68132f8c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfX54hoG7Xlooif DYEgi+7C1S6J6sVikVPlYkWNXThxg27xOsjE/B6n6OmB1+2QKZB/ssN6gA92zdctazMVAznd5lD d2Iq6fJ1wSzBbuoHz7HhmuvfOt6v9hnziHbtuo2A5DqRt7z0bbdtaAZpP1Zm8lFAs9kA6YkDS7f
 rFVUfsMiwM5+hPzPXb2TqfJO5ZYBiEXIWfiP2BntoTM8Pwekvpjo9J8tLbMbaH+gAUxLgXuShOa 9x4hsmDNe845y7Tf97zcy5w/sSOQjeKN7BZ66WBEmbzIDIh97Fjn6tLh12l9cU4/Wd0QZ/tzkG7 2jfT7HOOcqHXMBTlVuFHIDrCOi77fGifM0LwBAqN/U1+B32ST4DlTh9qaxGcngHFDsvqjtrBhri
 Pv3DPsAc/0VFxZgtGPZTjvD3yqchxC6h13R4oYWcOTGSTik3IRb2kna26UOnGtsOLCWUmtc3
X-Proofpoint-GUID: T23gsG1qMXHg5ynOgn86-qM80TM2mPgv
X-Proofpoint-ORIG-GUID: T23gsG1qMXHg5ynOgn86-qM80TM2mPgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=933 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
> able to use its sideband interrupter.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

