Return-Path: <linux-arm-msm+bounces-26784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8D938D36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D31941C22A18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0DC16D4D2;
	Mon, 22 Jul 2024 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQNH0PPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD21916D4C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642673; cv=none; b=dtZEP76PFGHViD17PIBS3Qfk+9QExh77+lIzFyI0+08Nq22MpT5Vvcfo4LPhS+n1esWYSQURdpHcKE2P+WFE6Z9YLkaKet9HTxcqeaOiLGE8PJtRtM9bMMZ59CKXRl3O0y46SNlqPsOfivmXDnIUyCTF2pbF+WWo0vds/7BuleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642673; c=relaxed/simple;
	bh=m+hBv3YDOsBdnN+l1C7IdzIqVI63phAI09hFwsxrzHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m50qfXMHcsOfuSvyLp9n85ICNb7FI9EolWQkzRAjGWxbDbHnuXW7/8Uj2AhOZCl/mc9CbPKu5EQxIh/ja/kfqBZElKREEKsYP36yCPzX18+TC+GSLbrqDNST6F6N7z3FP2QJgjT9wwtEbiFA5zRKgjRNtnvGgb6C8H/N9wOal+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQNH0PPF; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77bf336171so663685066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721642670; x=1722247470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KkO0qAzED2Vp4UXiyXJ+8Xb7bIrXJwQmMIp6pUHLxGY=;
        b=BQNH0PPFu8uqi3SOSXl0rLxK+gvFvO5TWGcf+xsTaGxi6u93ekKC5qW7jniDvLMx5z
         vKOyRcL5taG8JFGM4PceElCjcm5gU3VC7uY2AWsiTe6GdyQzC3H0tFlsqUWcp24c+Duh
         uSMM+Czci6bnj26UVIlONABca3m0d5G/n2h8hEWKalAA86EOzjxmE+0o1CeqJuY91Snb
         yTTMS4vHW1Su3eIAnyfbiQ8RRxCXkGHLHMSYqxrd90CYB9aasJxoVnclAnYrtr/7EW/n
         yRlv4yeR7kuUA4Go6OQUbDIY9XwP5n3TKqkxcvlk/2J2nmbhkfwN/3KqDAj2znWbUw7w
         cJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721642670; x=1722247470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkO0qAzED2Vp4UXiyXJ+8Xb7bIrXJwQmMIp6pUHLxGY=;
        b=cJFdV8dv8K0DeWo0ora/OfdPIdGE1ff0OXqa3SAAFBw6Z3yX6WuaewJVQqc7Cr9Jup
         3bNdqQxBd3c8nkldxaIo+8yZlE4CkdAJDYe5N/hGeFxKY9nwavXFPpyoqlWGYaCAEi6u
         RSuMYebUHlAObwPbO8Ppr8MrFHq1p901FBvM5CNr8SNqEDkhVtY3x9hZFt1J3VIzaCSh
         iAAxN48+t7EpzgG8Z7dRziMtdbzXDYhfeFXtLHvPRudFQbp3OIid9OCieEESZFWraxbY
         p/dKcXWY/rqXquHxBj3IlT86G9c4gz3iH8MrbMjRK5rJdJJc5BCjrc1Z35l71FB33pa/
         LcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVl/CextQvIaMqIQ0mnm0VAH+5VKHyjisrhQMF2tS619klszJj2N7Mlx3NM8FE2uAKuXa6I8EdLu70h/GkfXuJuJ9LjGzo+UB6dchI5g==
X-Gm-Message-State: AOJu0YxZvD2sov41vXCDWqQ/xzvHsB1fvB6g0j/yOaJ3zb8mdBfY2DGS
	IG6TRlr/R11r8PzomrTlgKkKF4y4U41tWAlGECfnLZeksZWLXZM9fruwAwjhkFE=
X-Google-Smtp-Source: AGHT+IGzDbPWknvSjJXM9N6an129Sn8Sjn2htqiq85IkDdRp6aJREUAL9diVfhetRdmEwh6dILJFmw==
X-Received: by 2002:a17:907:208d:b0:a7a:130e:fb6e with SMTP id a640c23a62f3a-a7a130efe15mr1408717966b.15.1721642670059;
        Mon, 22 Jul 2024 03:04:30 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c7be08csm401776066b.70.2024.07.22.03.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 03:04:29 -0700 (PDT)
Message-ID: <2f6e4cf2-8047-497b-94f2-25e29bb05c22@linaro.org>
Date: Mon, 22 Jul 2024 12:04:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: x1e80100: add missing PCIe
 minimum OPP
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240722094249.26471-1-johan+linaro@kernel.org>
 <20240722094249.26471-4-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722094249.26471-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 11:42 AM, Johan Hovold wrote:
> Add the missing PCIe CX performance level votes to avoid relying on
> other drivers (e.g. USB) to maintain the nominal performance level
> required for Gen3 speeds.
> 
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Cc: stable@vger.kernel.org	# 6.9
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

