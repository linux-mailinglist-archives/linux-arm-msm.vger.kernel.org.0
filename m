Return-Path: <linux-arm-msm+bounces-73552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919DB5775A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08BC93A35BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F802FC011;
	Mon, 15 Sep 2025 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kF8smMcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB3E21D3D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757933991; cv=none; b=F5duz8L4LU2klvH96/3kF94OmC+kDaVBtNjxPVTrQtu0s7eqDtE4vOVXoouf//tOXu+0skPR97T+PQHmBnncc8EkRAQfPmoWj5BcK+qkD4kJ/lwNMtQtxrR/r2BpEcUmKw4gb1C6EH2zwdZ1fqRRJZOIU8knROiCf9aSCBRxb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757933991; c=relaxed/simple;
	bh=z4vIa1+jE/4b0HDhWypNczdB6rHMWQ9tTqETYOZ0tXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o149dhLV7C3J77Fr5RiB3pqDVmbBMEOyqM2V+jbtMf92AWbETXQ4raIb/+kppTdLp83Yjn65AXCX3nwNt8uwtSULjEnqi4yrLFu4M+/mbYz6lBZgFvx6dM7wNzkdgLSDGbrr3z//+urirS/ZYIQfZOGrC05sVFKnpxRDmCPljZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kF8smMcC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45f2c5ef00fso9238535e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757933988; x=1758538788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZJB/Bsvr4A7muWR/f1MBNyM3K9e22kPh9FuXwE8xe8=;
        b=kF8smMcC0+oM7wTAe27jeUKbCTQKfQdDTRJ1f8BDnnIa8wcCbEUx1HcMPRvub1H6rS
         ddXK14vbIMjUQzyK8+vpY4YnO4sX+SeCC2ffpUUVWFhMuYvqEwizzkm0jFLeiDnf2WTR
         S1i0E/BP3kVP3gmKDWoHVZ+/j4BZ9g+iHzHVPrMOJ+xWOUTSkJ9MNqOnx3U2gZW/XKiW
         UWfNPg2lHeXnWP2sRc1QPmf9LV84DTY6+v3iJrXqsVWHc8aWDcjCpxKegVxWD/UqPPO1
         jrSJ+XGb3PYdmrX2Lk5dQkjgRiO1Ah/4LL3pjrdMiY0jw/ZBXYLur8R8NgIo2tVo8vpH
         bvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933988; x=1758538788;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZJB/Bsvr4A7muWR/f1MBNyM3K9e22kPh9FuXwE8xe8=;
        b=L80iAMEB8L6QSR0fesZphMqXa5907D3bv0xbZMZFdHLk5WBJwXlb6P3xafzQKWqeDC
         0YXKG9TIV/hbqZOXSdJQ/LsfX1tTs5k/mCrxIiPz22C/ruvviGuefxejG5Rsed4jSafy
         jjeYDEGhOIJGEuhvkoIorHK0YbKjGix5uImWcre5q2UTq9jhKY6t9wzJHh7OqT9v72vR
         9GNjG2GDK2kbQ9L72Xwo28C8dQ2S+CYgNEn/eiOOansWgUar+Dar4AeMvVx5pMrlkeVH
         ixIblrbioOfGjFdpLmitRPYzCj1iOGBHMVGsmZG8PbAGr8TRv7G2Wp2WyCBqGliddRqJ
         +kGA==
X-Forwarded-Encrypted: i=1; AJvYcCXfBG+AUU6w9y2J5wRtyaVlkdfDiuLauwj7OGx4XAzrmPbX+g/khpcZeak4w3FBae108XqUDGi00vEKrI1V@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/XfsGtbXqE3odsAnD4ihaKKLk4t91ZqzhdZ/pRGRHb6QzrCh3
	JyH1r7UtPmsSHOOLwKqkXhLlNBQ9g8ul6nb81Nvd5yj2oF+W0Uj7WeYKO1n4Ztqg/CQ=
X-Gm-Gg: ASbGncsE/jsnAKD1GqHAanJN6cgfCDszazuFeUxDdwyXe3+u7/Uj6CoIOHeSbEcYmz1
	OvqSxHiwBR7kLcuBzjMxSKo6x0AJCy2ug5UPpDcFbvGHRGIP1W/BJfZqw6kSr6uRwVe5D6SKRRX
	OrPf+hwor87NFuYEbLyurwzM3FMCJIKf7Ia0U/6k+PUi4uLciFCv0Qi1v3BHfccG+vcHJUd+gS5
	0aZU55A302J3Xw3OAD2H9nkQR9s2AypypiTlF5kT/xgnd46gMmCy5VuveTbfnEYJ/rm+zL19AHd
	g4Mo79rmPAHcfXdOkbzwsT8UMP1Ihu34FeYyeEpnDXVqD+SbCE6Rd16x60OkzmUM8i3DLkj6Oqz
	kfm/6ahNMTJM/YLpU5iS2ZWIgmxs05/8ePI4hGo5scmXI4TOQGaD/G8I0Gj6eyxK/l2YNzYwGM9
	4Mnoy1rmsRvC6JTPEqWxo=
X-Google-Smtp-Source: AGHT+IEv6c5FUwwLFSVhJG3Y1Sz4/h6bMTRmTq6A63QYOpaJO9qwKgFhy/icrtsmblyY/8eaAxy/eQ==
X-Received: by 2002:a05:600c:6812:b0:45d:98be:ee91 with SMTP id 5b1f17b1804b1-45f211d4f1emr107824775e9.9.1757933988224;
        Mon, 15 Sep 2025 03:59:48 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5a16sm175947125e9.12.2025.09.15.03.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 03:59:47 -0700 (PDT)
Message-ID: <1b322807-ce6c-413b-8f84-3a0df4eaabb4@linaro.org>
Date: Mon, 15 Sep 2025 11:59:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom:
 x1e80100-dell-inspiron-14-plus-7441: Enable IRIS
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Anthony Ruhier <aruhier@mailbox.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
 <20250915-x1e-iris-dt-v2-7-1f928de08fd4@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250915-x1e-iris-dt-v2-7-1f928de08fd4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2025 11:06, Stephan Gerhold wrote:
> Enable IRIS to allow using the hardware-accelerated video codecs. The
> firmware is not upstream in linux-firmware yet, so users need to copy it
> from Windows to qcom/x1e80100/dell/inspiron-14-plus-7441/qcvss8380.mbn
> (just like GPU/ADSP/CDSP firmware).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> index f728d298c72f4bf2ee151698e36108fdd7a8e5a5..cf2a7c2628881e44f093d73e6496462c22326d9a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> @@ -37,6 +37,11 @@ touchscreen@10 {
>   	};
>   };
>   
> +&iris {
> +	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-7441/qcvss8380.mbn";
> +	status = "okay";
> +};
> +
>   &remoteproc_adsp {
>   	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-7441/qcadsp8380.mbn",
>   			"qcom/x1e80100/dell/inspiron-14-plus-7441/adsp_dtbs.elf";
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

