Return-Path: <linux-arm-msm+bounces-13939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411898796CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 15:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63FA31C2084E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 14:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5EB1DFD8;
	Tue, 12 Mar 2024 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RtrFKblJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A41B7AE72
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710254939; cv=none; b=ps7Mxo0uT1KFtHRRY2Z7Fht6u4bG6NvYX0SHw+QaC8wTlEyPFCruxdr/yKk7Fj0WFy+bN6QEVdhkKN9VQ1+V5nJ9WtulLxNKWFsvldUyyA7JxvYAMen9WEIz5f+yLNlYeJjQOe+E67g2p7ybTiRrMj/17NGUAjdUZw8g136JTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710254939; c=relaxed/simple;
	bh=ehkMxhxSjg2XhZ+RvTxPDoX4lka61fp6faUzxorfi84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLQvUq7eoJIYdUZzPh0BlFT255okwfB9Ym7n/IfoNqFKmKV8xA8NCQIeixd5DZL4U45/TvQcaDqugnxtScebLi7FF7w06zZkp6ITYeV4VcuRpPV1wT+gH4ykc1j9kpRWViJwXL1pqjAk54wfRwV0ecSl7JiBSmcRAnkdJKZ3fqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RtrFKblJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513b16bb739so1700968e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710254936; x=1710859736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJBqb//ttMSi9W/J8xNh1OgzHq9LQEMmCQTMHoiXJQM=;
        b=RtrFKblJhTpI3m+rAIBHeKDsKFS4vpc/kMF4iNMEA4GYNZtK19+pv54+1wiqMA4USq
         bRq5zz7D9jMa3Yov47A7MQfWm3SbXUJ+kjSQ66dVHD2qP/8GTgRshH79D+q33UnlJvp3
         sZXWqffpzSuatewNEbqMVtPDMYmLaETiU35MmX06nHkOUQ7Jv/JBoKsHULXXU5KjBPsp
         RSP/gVdb8mDKFFUyWVAKEIAQRFKQPu9O88DkOFNV/nriuVfrs/YG6lTLlqpoeEpIzNtb
         /M6zrkaemMZjvfnWWDkMUWxZ0fIHbeBTAv/ai7tj/uDK0iuNdKBB5HTRlVUFz4Het1Nr
         1GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710254936; x=1710859736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJBqb//ttMSi9W/J8xNh1OgzHq9LQEMmCQTMHoiXJQM=;
        b=hduSRdS4+bSzb17dioP2pQmPEaLgAcrScjCty+EY+lKWL7JPG/zpKxA6K4kiaAAif1
         Kpkj3bbV/M9hc3wN0eDC7jBQK4Nf3TH99D0PwK1aUpfCxxHET1MeYU4lrzb5qOTtpYwz
         AwUdjW5PMzghwjEWxtcysK0i4KBMMeAJHeJ2NCQX9eWIGIjH+O5R5AQiTV2fofcgAnIm
         2VTA6uyEt9ZoOJqdNyMuWj7WuRRDtTjuB6439QdNleUy7hvhx8GwTHIRHoShPogZ3oIK
         2tiu8VTlr3hKz2eRwwCa0s7qxefVZ/4YPbFK25owRyZdE+eSxBTToVkkjMl0l9JtqlWI
         76yw==
X-Gm-Message-State: AOJu0Ywas+6g7ZyGaZQiDBaFumUZH3v7ddUnvCQCacUl9a+L6v9VkSry
	4JyTmo0N6WuGECcvaJxiPOo02UWwkyo+rcGIRqMjJPuw5EtQ8vSrP88fOB9arIg=
X-Google-Smtp-Source: AGHT+IHlExnmfR4kT+GhrIroVdprVrNybDbEQkw70027XzchLm1fcSlfQMkG5CBosKWyjRZqZe0c7g==
X-Received: by 2002:ac2:599b:0:b0:512:e57d:c9c9 with SMTP id w27-20020ac2599b000000b00512e57dc9c9mr6198989lfn.13.1710254935601;
        Tue, 12 Mar 2024 07:48:55 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i26-20020a198c5a000000b00513177e424csm1653978lfj.168.2024.03.12.07.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 07:48:55 -0700 (PDT)
Message-ID: <a8da3a73-11de-4b46-8dfc-f05335c22b08@linaro.org>
Date: Tue, 12 Mar 2024 15:48:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: add support for the
 SM8650-HDK board
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240223-topic-sm8650-upstream-hdk-v1-0-ccca645cd901@linaro.org>
 <20240223-topic-sm8650-upstream-hdk-v1-2-ccca645cd901@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240223-topic-sm8650-upstream-hdk-v1-2-ccca645cd901@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/23/24 09:52, Neil Armstrong wrote:
> The SM8650-HDK is an embedded development platforms for the
> Snapdragon 8 Gen 3 SoC aka SM8650, with the following features:
> - Qualcomm SM8650 SoC
> - 16GiB On-board LPDDR5
> - On-board WiFi 7 + Bluetooth 5.3/BLE
> - On-board UFS4.0
> - M.2 Key B+M Gen3x2 PCIe Slot

finally somebody made the right call..

> - HDMI Output
> - USB-C Connector with DP Almode & Audio Accessory mode
> - Micro-SDCard Slot
> - Audio Jack with Playback and Microphone
> - 2 On-board Analog microphones
> - 2 On-board Speakers
> - 96Boards Compatible Low-Speed and High-Speed connectors [1]
>    - For Camera, Sensors and external Display cards
>      - Compatible with the Linaro Debug board [2]
>      - SIM Slot for Modem
>      - Debug connectors
>      - 6x On-Board LEDs
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

With Vlad's comments addressed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

