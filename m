Return-Path: <linux-arm-msm+bounces-14831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BED6886BE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC61228445C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3296446A2;
	Fri, 22 Mar 2024 12:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJ+8Wwia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF254438E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711109502; cv=none; b=kCQIkJ9hLirIPVwDqBv9pYG7DhdmFD5Hk5dHxmWDQB50R8gOLbsgud+5TaUZMyBsk7iiEkCm84VVQgaCNT8zypk0ifSZDoucsL5K/COZWbO5X7Mqgm7gTGxp6mMn+HhwQOnIILzULborfoYzsMOaF20kLzvugUBUfZz6w4pr8Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711109502; c=relaxed/simple;
	bh=7Hi/wqqjIIEsOtQpwnH6pqXUN/y4LiNuG3sgNcl1HpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqiaEHP3GIv/Vxjfp1nz8pqYl/mYxVyJmuI+DZlxMrdVKyQd+8byU23DOSHnSh/kYCEdm49t1ZzwWFm/Eor33Jt5RLo6CPPbPPC9x/pPPMDY5wDKhV1ZAbfc00kiA4bmas83pXS9jC2L9LiidRtvfnuTBYuYM6e3VY1Vg7Q4VJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJ+8Wwia; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33fd8a2a3e6so1190099f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 05:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711109500; x=1711714300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Le16WcSed8nC9jSC5l5hiFp9bIsB6xxNGHVWFVCiUd8=;
        b=BJ+8Wwiacn76gzFe14x1TGLz9ggI+UtGv2BcQDwMWJUaS2wR0xfJ/UD2y3UOIWABjO
         UuLgzhzsZexi3RiRC39xfZ1bWWQQ12eODH3PjS3c01O+4TF0IynVhAoqz8XbZwn3aFv5
         CRfDI5CT2/MVEvNspSZeX1nZvL4zYjPtqRs9ZTAXNNdhHXqK6jinGupwIKV8xaK8qFDy
         IC8ePHjkjv+Z1tXg4nvtltn4HD8P2GZBs6YeabHKNsHRfpPlvovIZj9K93ckx61z9hHZ
         Rfhb0NBPmyie3R3+vEpvy9xJEsUV7FABDtYCZbUztiBwDwKaXYg1YN/AZwTUWQ3QWyaX
         PSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711109500; x=1711714300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Le16WcSed8nC9jSC5l5hiFp9bIsB6xxNGHVWFVCiUd8=;
        b=eIZDYbJr7pUWqDYUlV9W3Gt+4Rgak8v3J+BUCR4Ddjs7A3KMRMFjdRDtNrFRFyCcxh
         pIZFX7BrAWmJwS2SXtkJsswLkciy3sUIrAhJGd5rc404fr1u/KE2Vj9VoUpap9g1EtOk
         7EptB+g06hTTZc6/qkxV3QM8cCo9UwO3hAu9VPtuHQYBFq4rWGOHPNpABM4FRP+jGBIl
         B/wwvlmoR/PtTCgjeUeumVm+tNIqOZ1InJT0tB6RsSDwjHt2xV6CjCo6RlmoCvcOpA0d
         g10lzOCZAWsP0J1SGB64v1JyqeU1I6lTStlnS7QnWmKI9iLByopG7+Ii7vtOLFvZkVrc
         f9oA==
X-Gm-Message-State: AOJu0YxZ7O4Bcq83S6p8HSVKoz0dXiEEqozqUXffGdQh34cA7aIDLjzv
	zJqXoYunq9x/p5ufkuC182eZJ+1fwdYFM2QdGJaKCUS3LdXhm2obFLIHmMnZ/0k=
X-Google-Smtp-Source: AGHT+IESitk5Tjv3Y5YyH2RjM4Y2RiRCyJcZ1naAnp1SZ/0nNfHcKxGUONrIuupIg7Hge3PdklpXpw==
X-Received: by 2002:a5d:494f:0:b0:33e:6db4:e89f with SMTP id r15-20020a5d494f000000b0033e6db4e89fmr1261987wrs.22.1711109499658;
        Fri, 22 Mar 2024 05:11:39 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bk19-20020a0560001d9300b0033e2291fbc0sm1947516wrb.68.2024.03.22.05.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 05:11:39 -0700 (PDT)
Message-ID: <635f7501-82cf-4df1-9194-27f24eb40a53@linaro.org>
Date: Fri, 22 Mar 2024 12:11:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8250: add a link between DWC3 and
 QMP PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20240322-typec-fix-sm8250-v1-0-1ac22b333ea9@linaro.org>
 <20240322-typec-fix-sm8250-v1-2-1ac22b333ea9@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-typec-fix-sm8250-v1-2-1ac22b333ea9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 11:58, Dmitry Baryshkov wrote:
> The SuperSpeed signals originate from the DWC3 host controller and then
> are routed through the Combo QMP PHY, where they are multiplexed with
> the DisplayPort signals. Add corresponding OF graph link.
> 
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index d57039a4c3aa..e551e733ab94 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3917,6 +3917,10 @@ port@0 {
>   
>   				port@1 {
>   					reg = <1>;
> +
> +					usb_1_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss_out>;
> +					};
>   				};
>   
>   				port@2 {
> @@ -4195,8 +4199,24 @@ usb_1_dwc3: usb@a600000 {
>   				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
>   
> -				port {
> -					usb_1_dwc3_hs_out: endpoint {};
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						usb_1_dwc3_hs_out: endpoint {
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						usb_1_dwc3_ss_out: endpoint {
> +							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
> +						};
> +					};
>   				};
>   			};
>   		};
> 

I think these should go into platform definitions, there's nothing at 
the SoC level that imposes the port constraint.

---
bod


