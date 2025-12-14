Return-Path: <linux-arm-msm+bounces-85164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C62E7CBB526
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 01:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 658703008E9C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 00:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDEFF9E8;
	Sun, 14 Dec 2025 00:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5dDYa6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337643B8D4C
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 00:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765671182; cv=none; b=eYA/+S/fBBPsY0sYHxSKtygXSDAfBTMcUBq5WfEuW15TOTmveYmvOn1p9Z/vEeWl45SMdGxS6a4kWpsppM/5uKp/eDyajOfj5sAoYl+BS5nGabp2Ygm4fYxdtKqy5u41LbidG3JepFRQRmrX+jRoAE0kcCsNU2gBvTJ0sp4JvZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765671182; c=relaxed/simple;
	bh=vsvgbqhg3tSK6U4XQECKskE/ov7KmsHhac+n5VQ3Udw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9X0iv1LuPfNWZiK/04ktQPz2j6tXtl38N/unZURB+oaxAMrC8z3aSC9eQfYzWFnl7muI64S7fRDVFMU3rm8StUimPURoNaJtOA9MholdEstefAgEMzCTBVol4u2xY5jYVa84FYODhEsURBnvoolrdUtnDFKpj0U0DkbChF6RZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5dDYa6i; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59426dc96f2so196186e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 16:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765671179; x=1766275979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cs2594TMmAznKRH01WTgorColGdcHW47FTc8OPu5Ls=;
        b=V5dDYa6i22+s70n2bX4cGfZ697Gk4PcK1t58VlXHk/7F5/GYcN9QAh7ZBc4GdO9z5s
         wl7V9lYKCMNv5uPtfQ7Fe2Noi3xyx8PKCB2/EwJVhKuXPsYZSiFtm37rtNmISmLeEYTv
         UyOxkGnO/TcKYR7bjozjYJMTBu56FHHdK0KwziKS9u3X7YIhhftYiNrkVCp61LYB3rWK
         am/OPBs2jM98tyq1aNnPgSNj5f34UGBNB5yjvyT+l+9+a3+ZoI4uzJqyrCga93Pwnj7O
         ozTMnZqtOiSKjfT284/yKSt8sdg2PVj51UJ6yvvYPGzNiFsbHO3kkvnrw0kfWylMw1dw
         48ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765671179; x=1766275979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cs2594TMmAznKRH01WTgorColGdcHW47FTc8OPu5Ls=;
        b=kwugDd6TS5r9BOlRo4Pwvwg1lPyTqDbD44FS4cekgLEtGNzvHeR5yGT6KPhFwgU00P
         jbuGwllR/UxMjAf07tuDw0HveMXfj/7FnBVvN1ukfEp0PxQKRXk1LICK+cgue69Bzbtz
         YxOpORvFq36Z4gtsvGx2uWgJ35WJzOMv0MEZvo5Wr/lFL1VG77Hcbg+pM6Wwf0gD0gzR
         fDZaB9K7/cOKDegTeggT2L6b/x1RRn+FTAlV+HSD7AXo665ThS4WfxX4QSDStjNH2RkD
         BLfnGgZtC67XiVAopFi28vPf3YvhZweXg4z/sk/vSKEvOp9/gWk44HWpbKmQ/zfp96Y2
         YAiQ==
X-Gm-Message-State: AOJu0YxiLiHeI1CAkz7w5g3AKOdsC3izSruIDSOB9S1qqq1bvE61WvEs
	5ynHZAskCwQsThZyDbDEqVQoy07xqiM++8/DNxTlgjoSSObyQzrMuftLqkelGZWuQPQ=
X-Gm-Gg: AY/fxX4kkZhIqlHkT8lHZMPzEh03CnN64a0mqbr8X+2uGRIheVIL8WMMve5moqn6uB6
	z5gUY2CV4EPoie+DcZhpR5gqOZQwH6HBbAJ1/TibNdcMwREMhDXdIW6qdu5viV1XTCv6ylMMNGE
	6JbNiChmyfMgmK+v3edQUUxX1dBiB1nApI9FKHkIWm+DkbVIPDAJyeH2Dgz6+dSyd/5fDLa/SM/
	2PyCYqhpln7Vm9nQVJ86QIzbaYWQxMH3Gkr78iI/v9W/4hknoxEEimGJ6/t0yLz5GNVLJAob/8o
	dM+F8iI6sDE7Yjq2UVqNZ1AcJh5BgZI3P1uBRFCDcN3mWRVTgTUHOyVvuy7ekChhV6cDPeB+eXQ
	hhCCkvX1CyJd1EwC40LDZTXz72vr4YJ/pZfoCXjo2QcJX8d/JvemcMUkDgyfm1QiYj8aCNKnvog
	TUvzaNZjF8GgsEpzEpW83ctM9dJ/sytAynQWVcDyubdGccEqjR9yb5meA20UDJWNhPEioVD5L7K
	H3O9mMFEzynwVw=
X-Google-Smtp-Source: AGHT+IFm4BJTCDjreUh2T7xgcVbVJ0wHXDQMXAZTqYS6BUidZybUDCLVjfay5BiQaCQll7cj358FCw==
X-Received: by 2002:a05:6512:ea3:b0:595:83c6:2228 with SMTP id 2adb3069b0e04-598fa9dd15bmr1086116e87.0.1765671179251;
        Sat, 13 Dec 2025 16:12:59 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3194dbcsm3466519e87.78.2025.12.13.16.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 16:12:57 -0800 (PST)
Message-ID: <bac65324-6049-40d1-b196-6aeafd37366b@linaro.org>
Date: Sun, 14 Dec 2025 02:12:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-db845c: Use introduced
 platform wide cam_mclk0_default
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
 <20251213-sdm845-mclk-v1-2-197bc947d4c6@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251213-sdm845-mclk-v1-2-197bc947d4c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/25 14:00, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> All Snapdragon 845 platform has same controls GPIOs.

It's a bit clumsy and not very informative commit message, and MCLK is
not a "control GPIO", it's a pad function.

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 2 +-
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts                       | 8 --------
>   2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> index dbe1911d8e470..f6c2c98970d76 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> @@ -40,7 +40,7 @@ camera@10 {
>   		/* CAM0_RST_N */
>   		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&cam0_default>;
> +		pinctrl-0 = <&cam0_default &cam_mclk0_default>;
>   
>   		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>   		clock-names = "xvclk";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index ce23f87e0316b..981d19c20fa1f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -877,14 +877,6 @@ rst-pins {
>   			drive-strength = <16>;
>   			bias-disable;
>   		};
> -
> -		mclk0-pins {
> -			pins = "gpio13";
> -			function = "cam_mclk";
> -
> -			drive-strength = <16>;
> -			bias-disable;
> -		};
>   	};
>   
>   	cam3_default: cam3-default-state {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

