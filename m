Return-Path: <linux-arm-msm+bounces-80540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE96C39A00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3C3C335056C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756913090D5;
	Thu,  6 Nov 2025 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLbTyywC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935381C4A13
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418769; cv=none; b=agxWBileFRGpm1d48eRT8QyuYghsDcssnxvqq4HPGyEFa2KjwTENLOkeDM846BWSzLuLm6ujbqqYmrNY4HYMrAiQnaZa819X1MXMDsZmdfvAIy3pU6GECvATojSZhg5uVTfllsEeoiT0hBw974IZZjZv7PtZf2cRyfl2KNBNYp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418769; c=relaxed/simple;
	bh=kAZXwDplWfYOyaaONvDtrPWU/0/gLJGZ/FYvRKERuQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY5eHW0ms/lhpnEWEwRdsVsQKzCa6o+hhGerNaqbjlHJ67/lDmfQipTbG+5AkEY5gjmDZTpC+RiqPIE40kcPXzJC8pUPh4U6nBJYNFmPvj8Ys75FV7sMvNnHTRFHXc2iOeKUe04+rqC6OrkzDHeMQwDgURYRSjqHYuUOuyOHQNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLbTyywC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4710665e7deso2684455e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 00:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762418765; x=1763023565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S4GLlYfHZwuNWxVa94Xp1O9jDlukJQh5B00DffiN/3k=;
        b=wLbTyywCyIQ3qgIdjo0K4heVXVSncAPE3Fusu2dWCB2oYxNV9M2pGP0aKuZHOusLVW
         DkgtFbt9ISQRPU9fskiDBi3UOVULMWx31AEyK6xCqhF7cZX70J+DiFDcaSpgtQaPzt0B
         8kb/hEcUqsqix0Zvdt7pHYVjW6zAxeAmiAVDSi2UkiCsY1ok45SRQZJYZnDL4mVttAjQ
         YFVySXzDR1s23fbvsWAJk9L2K0jL8dUNYEExOceT0IpmR5uUmObKAXukjgB0gj93K3cm
         HmBR4irqgf1HGuJjOuVI5Qg68yVjj37TNX6KnGGfKJhA0Oj3q0//NRjr5SzP+MQpF+MK
         3T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762418765; x=1763023565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4GLlYfHZwuNWxVa94Xp1O9jDlukJQh5B00DffiN/3k=;
        b=ZHxOwurtORWLu+xSa4F4dVik7VV0DWcgqtU8MoAgNxhq4Hyj4LPfv70W65VOVQVsgx
         mMcDp40TcKOz7H7vQASfEaABUSdRaVJCI/J2PneCHOhlev0odtFGIog+lnYAtI9E2qLj
         P3HPHwyBQCsKAeRYgRqfQkhpugYm27XC+tfspnEnViiOm1JjxKL7QiKyzRuj9jfzO0R2
         ajoaQZhR8Lr4xsCi/42nQKS+oO7V21gt4/uJ5rChoXiYpayMLHuSBUVF9/BiIwBs4axl
         SeJbBM9Euk4AExb8w/cOw0+HpD8odDR2f26CbTQ4EudxYWytQ/kCHfv5FhKuCL+zWWJt
         qcTg==
X-Forwarded-Encrypted: i=1; AJvYcCWAJNZsUm14JQa/mDVbE3cQRzc/e4KIOrJDdQHuE+tdlVn8Pd+EAd6FUxWJ5Tx8QOrUb9LFiTURpiPsW3pH@vger.kernel.org
X-Gm-Message-State: AOJu0YyZXB3WVn3fYNIQCbsUsgnQdLpGwNIps6ezCd8BQtmlqbHKToAv
	JbwjQYKbGl+sQCfsUvj73grsAR80hWsWIVJXYeSAKX2UCXHVz+4kv0PuZ0+s5eHi03s=
X-Gm-Gg: ASbGncsnd0vm9I/Sk4fi798VBF7I+Ijix4ErjZ+q8A5BdlTwdXveJX49FkdJvfjiLw4
	BbMKuU9wUZl6E9FVDFHZ/Xlb/+TtN0LokqbD+JttT9IZfRkyE6PfO0fT4o4qcWC8r9XEmkvvTgu
	gHs8+/MTozkrIjPClaoR/x+SPhlW7D/ePhUXJcX5N1C/vmRdXxMVzrjw6Uj7jEsLzRlqIoki8Qs
	rxoljMVkNhEFVaymcQUYJh7gYKGX8IE1KatCVFZpjdCo7vpFzWe9DiBQvmTU1klkTxQcxAvBBSG
	fKCkwCraLE5YgTUSyhTd/gDeOP+qc8k2khoaUaPRWtYchprQJxbTEV2f/gmRzrWWKBzawedGfAZ
	lU16qvXJHnivTuULfpJDWifdytXCGtjDQwUd0XIA3gNA9Iddf6mrvkAwXcoj8lxzLV1IaUWsga6
	Y8dCAX1hk=
X-Google-Smtp-Source: AGHT+IGg0bzpltSE5ccYQx/GMTS9rG2hOLendCmRdXe+0MP8d5pGmnwtwR+LGD1g/IMFzEfZg1oASQ==
X-Received: by 2002:a05:600c:c4a4:b0:46f:aac5:daf with SMTP id 5b1f17b1804b1-4775ce2309fmr63450655e9.35.1762418764756;
        Thu, 06 Nov 2025 00:46:04 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477640fb723sm10590405e9.10.2025.11.06.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 00:46:03 -0800 (PST)
Date: Thu, 6 Nov 2025 10:46:01 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: HAMOA-IOT-SOM: Unreserve GPIOs
 blocking SPI11 access
Message-ID: <7loumd2npp2tihe2jwvmgs7nh7iuunwahuww7kpwz7w5e54jwp@hrkhobo4fqhn>
References: <20251105054548.2347569-1-xueyao.an@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105054548.2347569-1-xueyao.an@oss.qualcomm.com>

On 25-11-05 13:45:47, Xueyao An wrote:
> GPIOs 44-47 were previously reserved, preventing Linux from accessing
> SPI11 (qupv1_se3). Since there is no TZ use case for these pins on Linux,
> they can be safely unreserved. Removing them from the reserved list
> resolves the SPI11 access issue for Linux.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>

Lowercase the hamoa-iot-som in subject line.

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> index 1aead50b8920..107ea8045f55 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -451,8 +451,7 @@ &remoteproc_cdsp {
>  };
>  
>  &tlmm {
> -	gpio-reserved-ranges = <34 2>, /* TPM LP & INT */
> -			       <44 4>; /* SPI (TPM) */
> +	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
>  
>  	pcie4_default: pcie4-default-state {
>  		clkreq-n-pins {
> -- 
> 2.43.0
> 

