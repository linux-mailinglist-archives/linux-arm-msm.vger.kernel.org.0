Return-Path: <linux-arm-msm+bounces-26833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9709396F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 01:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BACDCB21AF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 23:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AA77346E;
	Mon, 22 Jul 2024 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i47jZ8+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D34D9F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721690691; cv=none; b=qMZn5hYfP9P77pu927qIruESn0gu+Jm4sMv4T6u/1ic5FLSEF+9v0AHMASj++vm9zN/4BLknp+qMF1m/NTGQ85UbDJ8TxcCrynHEgaPCIn/76CmtHSr/wIsLJF4PmcdsclTz+AHVCcY+QTqL3WQKVTqQA9eUY4sJZaQf14dwRNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721690691; c=relaxed/simple;
	bh=6AGjh6IqOic1kh+c56KN6dzsU0thGDOAqHtADTWMHRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wu8URYsdfb0J6L8oqGz2MvKKiBB1Uy7ebaZTf9Xipz2gYgLFyMEMAjBj+y4uvPmw1FKMShRf+QmPPEjPFfJY12FW9Ia7I5e6Ik2cmkxTQFbPiV86MGiaLy9olAwRj5qr6RkNQhsv9WPAJgIZn/Pe3QwmkUJ1ZgLDFIdWnxymcso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i47jZ8+l; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso4480246a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 16:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721690687; x=1722295487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oC2RL14r19Xt8DAfEK47GawQ7i/umdedeXiIPYHsSig=;
        b=i47jZ8+lE8npfI6IinEQ6rEtSCJspXCZzlTBCD2C1rq3jKlpdgyPQ64w5/lQduf4un
         MI9dxeDmCpRgFUyGJDt+dkikK/KC0Yrt2+bXlCZSPPl+r030FTFv+b2HE9jBWVev2CCj
         ucaqpZYC3micGmxx07hZm/RW0C7dGQT0rfLMtYOUbuPAxtNgGgT4YJb7TFpLFeDK3bfz
         FVRHi62nxkzDCA3wbPg8v3+czN5JtPvSqmSiMnf/LOzII4dDLOhexa+/LQgclPu06MAL
         JW0D3ZQRbC9zboBC1+03qpefbFJJDNVEtmuQHWoyoBXF8lZjzi53IhwuW1IPKYeQLAq7
         oiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721690687; x=1722295487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oC2RL14r19Xt8DAfEK47GawQ7i/umdedeXiIPYHsSig=;
        b=neMFiWMyHrm6SqtMEYQzMADQ0MBxvPSn0+5b0yHzNy5qRx9bKzAY6YXPxZJxGXZa9e
         R0MLec6CRHjVKHbi57b5xQ/uZup8NWbIcpymFQqDJ5MWH2TYTRxcsjxqUJDFFv52Gqmm
         iLAvFxCXSsMdXNyWdGVs+m3S7W9tezt08sZG0I3C7gBgNk1YGa6F52fMa71qNu6KIgqR
         WW5tqAlypH7mhGXV7BXGq7jdjT9tH/k3i9G8Zhreq4miJFdvD0eqlwrbOkvzqy9IiKdz
         jkjEpnv+KNln3yRJbQEq6mbv5L9bBtBk68pm6FNrYtQE3438r+MpniZ9NNaPVV54CVBh
         +1MA==
X-Forwarded-Encrypted: i=1; AJvYcCUSgDjt0C9gi8Ri2QkPjBwb39sXCO+TJyWOzNNinP4WqnSrrlnJZZOndTbAdzlVFjF0/YS0yTzBMOiXJHNDQBTDoQetJBV4NJo2MX5c9Q==
X-Gm-Message-State: AOJu0YynZS04khNcD1J3bqLYipKXe4NguUW0FFeXL4mk7iOG/CIVbZd3
	xomzAuJaWaryfbHFoOgQ4Lro6sHbVU+9yGytSZ+It/cin3/I5GOKgpaZRU0Tyu0=
X-Google-Smtp-Source: AGHT+IFRf27aw3c3+9anEvnfyMrCyg6ri7H6p7qCHgZFlBRbwPP6Fv6NdIr2rUfOCMZGkLf9M6r59g==
X-Received: by 2002:a17:907:9802:b0:a6f:501d:c224 with SMTP id a640c23a62f3a-a7a885c0000mr95934766b.57.1721690686392;
        Mon, 22 Jul 2024 16:24:46 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c9273a5sm472498866b.165.2024.07.22.16.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 16:24:46 -0700 (PDT)
Message-ID: <ca6ebe75-08d1-42ca-99bb-327e9dc99323@linaro.org>
Date: Tue, 23 Jul 2024 01:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8998-clamshell: enable
 resin/VolDown
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240722-miix630-support-v1-0-a6483cfe8674@linaro.org>
 <20240722-miix630-support-v1-4-a6483cfe8674@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722-miix630-support-v1-4-a6483cfe8674@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 1:57 PM, Dmitry Baryshkov wrote:
> Let resin device generate the VolumeDown key.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> index 3b7172aa4037..75958c4013b4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> @@ -128,6 +128,11 @@ pm8005_s1: s1 { /* VDD_GFX supply */
>  	};
>  };
>  
> +&pm8998_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

A newline before status, please

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

