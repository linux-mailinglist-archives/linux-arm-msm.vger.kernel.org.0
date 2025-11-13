Return-Path: <linux-arm-msm+bounces-81566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 876FBC56A64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6854421966
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4F3257859;
	Thu, 13 Nov 2025 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5QEFRD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hB7oU+fS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B827B359
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763026425; cv=none; b=IcJdxlj4nbaYwadyqwfOJ+HgICZivjdQ4BJemSUj/ZUY759OX6rE4JmPqel0ZB7eFAWGfW5+pK+OvSuu2cklySU5kYfBGVXIef22tWIrn8PZyFiMxOpYDC6W3sFJgtYj0h/oQCpBa0gSQcJt3y1xjSAjnVaHfYPY19kw4DtUcz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763026425; c=relaxed/simple;
	bh=W2BfkHtgH+1v9VUb0JpsQJoWkwy7PUVQrLyLNngOu60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4t41vQRiGUsHks+g1BxFSxMc0UDQctdsChiIHZMG61D+IUgrPZB1aF/vdVVdaS247JW4Raw8mPNRYWwTgLCqpAgnAds9JzMaR07oNJNqxFw8q2F+Pyp7+JypCzJb3BjQ4e7ejVK0Pal0Ldr56vgd4aJEtKo/qDkbx35fT9emCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5QEFRD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hB7oU+fS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8u5ZQ2962128
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDrtrR8Qqt+4GRaR7Lz/ou1frFaZigGu4hEdUoSZ4U8=; b=i5QEFRD1mKAd4wFk
	zbFAk+IzuBboErGBOlwl9YBTXPt8VN0f5YBG8NGbz+/f37VHOANJZWd8zAaKal3F
	17onAaS4O7MlRVRaZppTv2jo+p86JatKEt6GfoVcL4HoSCsrKa4c1x0k8dja4aAz
	LxXkO/OcAYHxDJYq34K6L8ppyN00LOrFjw+SKSJMhXXQSSLGZoRKaQH6pvN6nNzq
	HmJZZlkSTBBWVjkc343Nj/Ba9an8QS9sA/3VBkqvD87RTNdUyDHSUtkBb3hrWg5h
	BkttYorOBbbMUvGNHJpqNIW1djzWzMErSVy91AH0TYJrdYeL+tle6oW894RuKdeQ
	aDHyhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwbpu0ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:33:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297d46768a0so1869505ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763026422; x=1763631222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDrtrR8Qqt+4GRaR7Lz/ou1frFaZigGu4hEdUoSZ4U8=;
        b=hB7oU+fS6DtDO7dA0EvR2vEvj8EXDjNNqRgEsojXj81c6ZHQ2tujCk1lM2JjgQ5jSL
         p2t3EKpQr53vjxpKmfXdhMYGn2wCgdTU59waGwaISCXr75424eN1iuP9NV1DaazVheZe
         LMJ5LpNbQ0Vf9IAUIx5YEUNHcyHS/rkAR4vsPxOqAXTngIlMAxtrZRbB18aAbin9s6/7
         MhUpqvXKv0gXX6IMtec2lC0WqEQ58ydSWFNDzE8xp6Ti+NeNP9Ld5McDaV05oEiWggvN
         NgqV5BaEEyqFmxbekSwakUqu1fe540YQkpcbvz5OzMabYIm7g24TFNVTrD6k4iZdyn+r
         adrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026422; x=1763631222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDrtrR8Qqt+4GRaR7Lz/ou1frFaZigGu4hEdUoSZ4U8=;
        b=JMKrMl+U8HfMmUzx/A+TL0GxSRZ+899jy1L+8RI77qokgYcJ8hJhxH/w8u4N7FdBKI
         cs0yDtbJ8/rX9rNwIW9VHgkOCsQDzaOtZbeQyVrJsk2soRRrnWu7kOMpdPz4QWgSkSST
         magwDQhn7d91NPHY3EnDWky5QhylgtietTUltH8o5wfX/nG/Ut/ghk3MPk0Ly/5vL1Dt
         /veWXt6qoPUV6BWrGepT+nDN9fr8t29qiPy4/KwwE5UwY/CzT7fWATken8g+oxrmVVS4
         OJC3nsmEx3d43gP7CY0AlGKM5IyzQqshtww6v9RkVAzHKpYGx9CRN4ETHbnMU6e+vC9t
         JtZg==
X-Forwarded-Encrypted: i=1; AJvYcCWz5Ghp9aUBcZYwwtlREWaT7rhAU9ApsLKoorZGd76WIh68aa66sgbVwCUusd3kBpEModn0z8J3J1D7ddFG@vger.kernel.org
X-Gm-Message-State: AOJu0YymYLdG5k4xV/HGqIZmu4uvcbHW/XeZznWsPV8TdLv6W8juPDp3
	8htiAojh4YYtY6GsVKwAH0aVHJMfipv7udBmhjBChQuz/Hg4XvXbNFoaBUkaxS23KQYdBM8AEH2
	OaEleoB+4V1sKzvQvffUVkHM3AVyz3RyvtM6eamFrN77/4CuknNoNqUpumModVOHoE2Fx
X-Gm-Gg: ASbGncu9bun21fmIwW41csz5ALEdSGP4AljEuNwlGjHn1USkcMQ3rY4ycsIX1/azmu/
	hV2qPeRT9+wHl7hWeR7PMQRKBiu54/3PDHTSeOKV5LhNWtbSUyA8thIqGVG0HBjRbt1iUtfc2aQ
	l3yug1MPL44HhWVBwF9RLjoL/JlLvJVpzXyK6FBNd2jQkhSzR2zwtDcyzXLnoY+Uu6f+hWMjRN6
	J16vVJAn1UdjG5qS3G7PeqhPhnGf+G884F+ImmPJR66Ez8zWk3QVX48tv7hkxtP/pqigZkjCkgt
	td2bMoGFw9r4aqHBL7KU4TfKYOXLZK3Y7lzwGe52CQ5Xwkg05AIfKg8jZYb7Ovr+tLZAOR2Ioti
	tR1mN/ohMAFKnW2zfj4dnt8VhHfrr89vUAldrEwmu8i8UlEbzPcg8eXeL
X-Received: by 2002:ac8:5dc7:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4eddbc9b895mr52452761cf.4.1763025767911;
        Thu, 13 Nov 2025 01:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHPU49ojKQmipJqKygsJf/LlELHlgbacm9oTO7EejCNBiPlgkZGK9XGeiz9+g2IXa5o95g6A==
X-Received: by 2002:ac8:5dc7:0:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4eddbc9b895mr52452561cf.4.1763025767491;
        Thu, 13 Nov 2025 01:22:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809d2sm122683366b.42.2025.11.13.01.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:22:46 -0800 (PST)
Message-ID: <896b9ba6-c8eb-4bf9-b6f6-da5a05efc816@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm8750: Add display (MDSS) with
 Display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar
 <abhinavk@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org>
 <20251112-sm8750-display-dts-v2-1-d1567c583821@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251112-sm8750-display-dts-v2-1-d1567c583821@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvjcssdJ c=1 sm=1 tr=0 ts=6915a5f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IPDGKf_5clKAjOb-YU4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FnxOq58J9fQHvIsKywB24icq-frOCLxY
X-Proofpoint-ORIG-GUID: FnxOq58J9fQHvIsKywB24icq-frOCLxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OSBTYWx0ZWRfXyyVJuD5nBXAJ
 wKTpCBBDn+cjfaiEdq3fl0FA8Tmmpo0AlgiRckyVIRFnIRVp+dFGbgtyUeN9E0fL21VD5mwuDHt
 WH6z3Y5PXMMwoHWeWLT8MtkBeukT8ammed3Imu5K5BO0KOHvB6qn4sRpOxgEmhsg+8Yry2/uT3e
 IhX8T3Di+sbXIEnnLjOEGIqQ2JORZleN/wMELzVb6FgJ8WEM93/e6FO2P1qKkPLFap73Zm1Jrg0
 wSr5Ttfl3etFap28PeL49Dr2n1d13+u77F+LSS3WDA96x2qiHckhoAwnCZuYM22ehuQkJvb6bH2
 RJ2QFLI73u0J7k7ydR9IiUbWBupA61tnSUOKyD9kI10hVmIzHnljdXq9gkTc43LhfVn7Gh73rY0
 VvvjT5V03N7XPSyUrHQlemWSMoWnMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130069

On 11/12/25 4:02 PM, Krzysztof Kozlowski wrote:
> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

