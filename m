Return-Path: <linux-arm-msm+bounces-39832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 933829DFE7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58C50281EAC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AB41FC7F9;
	Mon,  2 Dec 2024 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PB1v4Ami"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0261FC7DF
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134333; cv=none; b=g9pXZKJfTci0Trvf/r3XPTOQ2Q0ORRPqNpONi4R3wnEdJP7ft7xck2ZQPJ77Y+A58CLquCHTqzsHOFC3eqQFUCplrL4B1TL2cdA25BGgXj2ekgr8RHVokV4tHntPt46GsSjDer83zXthvjVCDSLPyfZEVXSTr34fMkksVv0acpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134333; c=relaxed/simple;
	bh=JV6r1YwxAjtqGAzb3bWNDzEo8Gj5eLy1ZNZN9iMp/+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0vyszp4B0qwQN+domD3HBm+4wscBacvVJJE9/D05Gpv0nCoEqWu+obg+Jv3OqC9JfpH+O1A/eO8ESNb5TB+6bIBcJB/onkeRVSBiGDIeWfNGzqgo88wWr6HOTVD8yzhJ3Ngs/o32QoMg6pNgtfV3/G8gMBNw7qxf9+ltj9ttOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PB1v4Ami; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffc016f301so42545271fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 02:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733134330; x=1733739130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hhFz9USPtFDLkPSTXuS2Qr+A4K7S0jdA7MPS9vlwmg=;
        b=PB1v4AmiZT37cYdD9dOYJcA0zzlCnWT4XhOM7QIcUeMlGvPzB5gEmvNYXNzmAdzy3s
         0T9opjvI3DyoGvZQodWQ1lY4Xxmn1gnmOGWqA5MXMjyJ2t4CEW6CX6enEn1PFcYpLcH5
         fvaEZ1RMDJuLuYR0Uzf7mZEqD8whkz9qkhMaFVySJ0l8ebP2tmqW1zKGwpL+nSEbeN0S
         bzvhnGjLl2n89mc8Ji+2xOZY3d7N56PJbCg+M2DJS0zlFubZBZzI/E6AXb6OOsHvHeew
         N3UmaMP6dKukNQNigUwVvsBAuMJrwx3s+hLNSZa+VUkbbE5JfslzxfwJCIbrDs3QyOJ1
         a1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134330; x=1733739130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hhFz9USPtFDLkPSTXuS2Qr+A4K7S0jdA7MPS9vlwmg=;
        b=axGIfkK/Fjx456An+OSR+os8j/0sIR1coglp0Z21s71vmXrqKPQJn4f96zKv2Qwdyw
         QWijw9WjWKTKVCSkc7xheUdlQD4Uo5PwvDdfE0uibZHXHj/Y2e6e+LM2RLBTXY77K4cR
         creJMjS8Tfnodfm0QPTiIJr8MbwqnWg4tfuTLWipT3tV8VyfLSnTumKtIszUYCneBIFA
         Wcxf9XC0TpNI9RKPrt98pNw35S38q0vizrdfGCjsfsyBWQReSq0gg0ti0Z292s6HWa3S
         Cf/Prc7H0GoSTabV4r6+PBjzpnc6eTcIfe8sW3qGvhHPYf4yf2fmEkdQGdWd0sRWSZcX
         8SMw==
X-Forwarded-Encrypted: i=1; AJvYcCWfkL6PqORnAFBRuqMmUACwWx7Gg0g7zcbl2zstH3VDJJN5wQcutq7Q9HYjqZAK7AK7pAMrRD/PsPMG9MvM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6IoXg7gIrBxgI9Q/OVOCs25wFjflVWG9i9QQIfdpXIetbVkpQ
	N4RsV7mFXNHlMYUN/yzZ3kuXDrEN2zJcqyNMKElbNhf+bq+wjaQ7r5Kqjw9rCpc=
X-Gm-Gg: ASbGncsJ5MhptstwF24KhGqAaSLJxERoceL7at0vDwXKqgDY0unhxqDVzZJ7HBX17qV
	/KqSmXdjxWD14DAFMS44Z4et2kfTyTy5n/eTaqVQLu2PWKL5wHVrNbbXRpAusvmrl28UZP8VgNk
	6+zhtUVvk/3Qn3QDe4P6g1iruAisVOnWRfONsoaoi1r7QuUrtrAvDNPXiYBYBrSfObtn3Vad77U
	xfN+LTqRwuQKHhHVlM00qi7vIUl/yqZIYxTcfnrGyeJGFfF0eL0aB8uWC7VO20X3w2iFDeXjAQE
	MynGGsHrvUAkKu8Wj4fNNi3XUYAkPA==
X-Google-Smtp-Source: AGHT+IHQJoqkp3kafu47IEobFsqS9YB4e0vmmGCxay8qEE70pGTakt94CHzDi0O7W4INjWfVkxddPg==
X-Received: by 2002:a2e:a547:0:b0:2fb:2980:6e3d with SMTP id 38308e7fff4ca-2ffd606d2aemr98837391fa.15.1733134329616;
        Mon, 02 Dec 2024 02:12:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc74a1csm12489561fa.69.2024.12.02.02.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:12:08 -0800 (PST)
Date: Mon, 2 Dec 2024 12:12:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, 
	kernel@quicinc.com, quic_eberman@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: move pon reboot-modes from
 pm8150.dtsi to board files
Message-ID: <gk4c75u22i6kmqlpv6p6xgv4xcmf6z2jyhti7ccj36gnref2l2@xpumii6ldxcv>
References: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
 <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-2-bdd306b4940d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-2-bdd306b4940d@quicinc.com>

On Mon, Dec 02, 2024 at 05:37:23PM +0800, Tingguo Cheng wrote:
> Reboot modes were originally managed by PMIC pon driver on mobile/IoT
> platforms, such as sm8150,sm8250,qdu1000... But recently, QCS615 is
> going to adopt PSCI to manage linux reboot modes, which involves firm
> wares to co-work with. In this case, reboot-modes should be removed
> from pon dts node to avoid conflicting. This implies that reboot modes
> go with devices rather than PMICs as well.
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi                      | 2 --
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts                  | 5 +++++
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                  | 5 +++++
>  arch/arm64/boot/dts/qcom/qru1000-idp.dts                  | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts                   | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts                   | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts                   | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts                   | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 5 +++++
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts           | 5 +++++
>  13 files changed, 60 insertions(+), 2 deletions(-)
> 

Should the qcom-pon.c driver also be modified to skip registration in
such a case? (Can be handled as a separate patch, no need to include it
here / repost the series.)

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

