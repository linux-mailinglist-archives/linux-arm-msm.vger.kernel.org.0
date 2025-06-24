Return-Path: <linux-arm-msm+bounces-62224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C0BAE6682
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 356817B3005
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6DC291C16;
	Tue, 24 Jun 2025 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uA/M4pTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4A23A58B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771892; cv=none; b=WTkQlSJAavad5N3C5qa4x3kxPI6jyvR80UA/AVGTU+CvDY+PKbAgA+3GSHWwQ8nOwHVcTpbtJ/Etsfg2gnfq01uKOrSfV/L+JqJRSNqESN/c5xrARljvlMezDRSQT1sln0tVfW1lwOKqnHE3FIwVvg3yugDbOobRcjU2H8RdNjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771892; c=relaxed/simple;
	bh=SNPpj7vjjty2f4GcEPbvBgmWRu/gVwdJZznlDEc11KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CG7wdgDaTlAYo9TQdvg4zpqIfHrJdfabbHEIdgv8KpGaPNFYbAebnHGJHL4oy3dNzH8zwcxVx6aKFpDQS1BLFx2V9w2bkVFjK5lUyVelVOOPpTyWi2b563BnXeYjSS7TsU1lYfPz42DZGIboLOaXWZZPKoJ430zhCC2BBgIdpDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uA/M4pTs; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553e5df4511so305942e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750771889; x=1751376689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ixsChjPXVo6tgSzutDLAX1rFKh+YpL/is6uOUSR1ZI=;
        b=uA/M4pTsWXNxuf26ML3cTsvaYGniT0CiXnLKgZxOAcimj1IMmRoCKQ+t7mdCN7+G7s
         R1pxZKRaCQImOqnK5QZatW35asTsAVsxGrmyvoNx2nOD+XdESCpDVEYoN8eIB8yUVvwW
         ItXi3nkXiBiWprcC+5qzZ3qQeuOYk0+e4MI84xFHEcygVIo2XT+b44WBB/pXJjFLadQ6
         SM+JRHNrWmE1wzowI4NNRRrIYppGag2JiaYQ4bGKQF0YvclWMd7WSR15yKOpvupevg9C
         UeGvcXqTKcu9Uln5ywIafagCFY9wql3hoIGj978PwXsc3GoNe5mXhbJMPsFpbxDp60wO
         s5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771889; x=1751376689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ixsChjPXVo6tgSzutDLAX1rFKh+YpL/is6uOUSR1ZI=;
        b=XFDEqEKHhjrlQpzOQRJc3ZodiWJl7+PIV4mCrA8x56C2PqvPM3KP0WXTBFYHljgBdi
         zpjhFzO3d3L5LN8p4FSTKfIOdU5eeDL4t/Qh/N2NrGoyCwTUVlvf+u9rtkBCYZXTUXY8
         T2qrZZY+AkxKt1wPT8ZU8ZyNs8Z6Gk+cKlh+oRxBb2L1H9YKVGW1eF0B6S74USPn9Qwg
         FniEJLHjhkGdMDRuPC3u790v/G4ntfXIYE5EjvbJ8chg1TAfczpzx5Bb6y9kA5rVgciP
         kOmhPW7g9QnO+LrlReKeOJTVx2UpVevnme50rj15guO7DqDdeALHyKEuIOLCtts7eTXF
         5Gnw==
X-Forwarded-Encrypted: i=1; AJvYcCW2vl8ZWRXXHxq51OoZxuTV8jdQo8yO8sZJRJ5N00RHAeWcq/KVDDsvXEw4IbMcFHxvliugG/IGb6xHtQmo@vger.kernel.org
X-Gm-Message-State: AOJu0YxUhQ0nFpTI/fBfHdJFpqXSi1Rycti/+2TwTmYuLS0vYc1A/CYb
	l3zltcIhhi6aO717XTDpzZUaVVmA7PU0/HMIKR31scI/0kpVPWsc6lGvBwZCzog3he0=
X-Gm-Gg: ASbGncv437W+l0DccTSobMKTque4icK3zoY4o1H8ygewS40kAZHYdvg47ZT+IiXgOYF
	32HLKb2NIuUr9gUu7y42XJN9JzZuyY3G/reCHcWwBWUOaJeVtJ4MAekMy9LnCwFbAWGn8BI7760
	b2wPBtu47Gz9OF7vsOHjQphnY0BUoVB+jVUDAtJWt4jjmYBZqUE12hDHauVQwSQfdv8TAyrOSJZ
	3CPKhgfdOs52Iw0t6O4+JHFE+XAO9kVdeAoWkgCXadvKF2y/AyaR9vjAEzlEpvDq2qsXefcFEYb
	vCGKtF79gQ2z5zpjcDLyH9pB6ZHeupWo7rfrW0A2+SSU539ocDdfSb230NtX1TmDqikE2Do/liN
	lA81CzIn8WBXM7oFTn1ZF4na2j/jyqgTwQFZU5eNG
X-Google-Smtp-Source: AGHT+IGwGCymU8RONA+nhcXdhqLM3PrHi9ooRcM+SCxJHnCXXQhmrBOwn+PHm3whE+vhvRviZRDUzA==
X-Received: by 2002:a05:6512:3086:b0:553:2874:8efb with SMTP id 2adb3069b0e04-553e3c079b7mr1854622e87.11.1750771888708;
        Tue, 24 Jun 2025 06:31:28 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbba4sm1837510e87.109.2025.06.24.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:31:28 -0700 (PDT)
Message-ID: <9fc448d5-5c16-446f-ba89-ce4681b5c76d@linaro.org>
Date: Tue, 24 Jun 2025 16:31:27 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/25 15:14, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 185 +++++++++++++++++++++++++++++++++
>   1 file changed, 185 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 4ae0f67a634a982143df7aa933ec4de697f357a5..ee78c630e2a1c38643c9222a6d6fff4cc1216a47 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5195,6 +5195,191 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb6000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,

There is an inconsistency between the unit address and the first
value of the 'reg' property, it shall be fixed.

-- 
Best wishes,
Vladimir

