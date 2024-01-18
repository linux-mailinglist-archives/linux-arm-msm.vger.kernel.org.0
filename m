Return-Path: <linux-arm-msm+bounces-7547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B1831863
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 12:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23BD21F23705
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 11:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D003241F2;
	Thu, 18 Jan 2024 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="USr7l/9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A0F2376E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576961; cv=none; b=iG44lHc+SdHNS4eEfkuSTmbt8cOP6YPGcx/9pIfo01oquESHtAkDImYaHKa6AyR868aq6sjCCOvqUqa7cX44C8HEu31zqXGPv8452X9dXFh6lSxxEA+hv0PD5fk5Od7vakqXXY8Qo2oGipvh8IOKDGUI8rIy4Y58C3tMvchyjko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576961; c=relaxed/simple;
	bh=DRJBtdB0lfIJikdcx1ooGp3JjZ5iJAEh2ryktwTB/Qk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=BpgCuDlZXnuuvk6H53auMgij0mHPgEpFYPl1FahXbDvch1FKQ/OnJHDMHOsjldCc7V3QTHppTnlqJASflXUcJGeV/AP0fBDipahkiVQGfKRSPpdSFls4mLt3+zr2g5RUyDps5TyQB8iFhj/FzXMM8ouAnfgI1CKtS4CiabrQi9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=USr7l/9P; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e766937ddso13905581e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 03:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705576958; x=1706181758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bOlUj+q179IMKEi8p11P9grsyIKsRD5OwjU4jqrzh8g=;
        b=USr7l/9PLYPIbuVjYlgRAvKXcmnffpUW/b8mNrOpcuzKhj5qnjrO8VNP0xsMpZp+H+
         7MhS3/pik++IPl5fnuMfs/Dz5qGj4KN9wyk1ixLvnrdNhxPAQWToDFD0GA9VVdy33Vq/
         7nwGb/NFqksurUogatfApegffzQMro5kkgC8BlvwwyU6JXdMTpuKSstqyu1fLAlF3nyh
         6AMurF0nx1JJuxdMldZUOtlDmxr9hmQgB2TY+Zjq4EWBzgrrIDTdMVEuE/UsRdlrKH7o
         phKjOUtg5uo7vQd8rd5j2uwGSHdi0r3lC3lk/xS2ItEnCQD3JXAercQa4TIF2QhT+auY
         3k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576958; x=1706181758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOlUj+q179IMKEi8p11P9grsyIKsRD5OwjU4jqrzh8g=;
        b=ON/U2nUhMMyNW37eRQCknbgghjazduL7xnXfE2Air+139yaVWhrcq9UTbMLsP2zKRo
         q0OqAuSuT9RTa1xH6jeHLAj3DWIsZH4QFJTUf8MHRIplrtG2bmvI4uea2/85qqfKtmR9
         KTEt3mFM2DAPQRFRIJ27AtgYDALhGZHWnoJdFbGXmtwMfEz4w6Bw0rIebqrTzroz4q/f
         WIHeqmQXz/skScoFi7qwdHvX7JPofMBYwCqnbmBySaROUAjGnt6eN0o0IuyZ9LS2iJog
         vfKJM8YOlbjIq6wpg7+cJoNC4G8XRji0RzvbIQEmSqlL3qMmPX1Izp5M8lJxggD91cDz
         jjSw==
X-Gm-Message-State: AOJu0YylJc34iUSdhad0BMA70wY9yrd4aPEs4S8b20nTQ01ZMFXLhsEC
	S6zqjagX8IKbnIvhsQRTv3QrW48qEFIQ6otWeS4Qve95CLvE7bnNbIzdUSj1xrY=
X-Google-Smtp-Source: AGHT+IFhssFtH2AYYOV9q/RxoLTnlO3ToX6rXcgDJjo1+DTPONKp75AQgZEQBD3S8xqeRmApFi/C/g==
X-Received: by 2002:a05:6512:3ba9:b0:50e:cc3e:2f31 with SMTP id g41-20020a0565123ba900b0050ecc3e2f31mr460276lfv.82.1705576958068;
        Thu, 18 Jan 2024 03:22:38 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k26-20020ac2457a000000b0050f147c0244sm125917lfm.292.2024.01.18.03.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:22:37 -0800 (PST)
Message-ID: <32205426-d93d-41a1-bc41-f4ff1538aece@linaro.org>
Date: Thu, 18 Jan 2024 12:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcm2290: declare VLS CLAMP
 register for USB3 PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
 <20240117-usbc-phy-vls-clamp-v2-5-a950c223f10f@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-5-a950c223f10f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 15:04, Dmitry Baryshkov wrote:
> The USB3 PHY on the QCM2290 platform doesn't have built-in
> PCS_MISC_CLAMP_ENABLE register. Instead clamping is handled separately
> via the register in the TCSR space. Declare corresponding register.
> 
> Fixes: 0c55f6229bc3 ("arm64: dts: qcom: qcm2290: Add USB3 PHY")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

