Return-Path: <linux-arm-msm+bounces-26790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A83938DA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE92E280EEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2C016A38B;
	Mon, 22 Jul 2024 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQyLgCvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A483116A94F
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721645223; cv=none; b=tKoebICmXWxium0Ot5RmcM1C8WLcB+zbSL6xt878CpVbjpqqEI7hHNIdUz28Gk0y+7xDhgiJlrBJs4Z0MZD770YoQSFBp9AlFSQrOCoJPoSkoCB+eDuY3ju+pu83bgQwXw5vG4CuFAZXqbGT6Vl9okfumTOmPnXRrYQL54c4nVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721645223; c=relaxed/simple;
	bh=fVw/ZDmf6JuPXrt5WCdg/l5jKHSNmV5inH988XFjM9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9ZJ1cw3C37VvM6d3x+Ld54+xNHlGMjuHm/60pTghAWD1iNNK7InqKSi0kFpwWy4SGJJxp7EFsq1v+wljhB6SdJ6mZyO0rTwekrTjjTMU8O283Z6LoJjebfBnrod1IGlPrZrSsx73dEKZgUfwq9kD6uBKiAutNJxdy7FQuUhxPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQyLgCvJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77c349bb81so391465766b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721645220; x=1722250020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jUGuE+9wNhw9HjAclVJblWyQTPW0RDppgthjHGFJ0Zs=;
        b=BQyLgCvJRbay/s96DnNO8MG0JF0gpgMJ+x/HnQJYJkPuzxyVJaI0b8AG5cxUX4Vd4N
         Lof89xQ4Q0uvY7Ql7mO1qPmncz+zO7XUHJsW8n3unwy1N9kseKxI3ajgutAB7buVaPqP
         xAi6rdpc1cEFGzb47Rfgn0Sexivs4DyOZw6WcPK6xFoVKqSCiO7SFFVjTfPdqA+mJ6DD
         AQlfISx0quBixjaJUrtKhkL6FCPMnsnxPxGBOzgqzUv4t+9mWlXG5CyKyaO231jVNusM
         r8edPCPJxP2IMTH+WPSKMf5ILE8fZD5Irr6jd/bWXXC2A4sPvimDZL2yvY03aC8XsVzw
         qhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721645220; x=1722250020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUGuE+9wNhw9HjAclVJblWyQTPW0RDppgthjHGFJ0Zs=;
        b=TPwAJFeKfUhPmEi38TBfgUO/KzxOwrVUp4u9JR93uCsM/rZX8XjIwu70owRP1IvZyB
         wNiEtSvSjwqcnBRiYj2jRmr8UhYQ5h3eIbkNeJLxPW3g0OICDjA+FaPyDFfZlTvDXqa/
         cVKsFgG8TFIH+4kqXUsACI2V3A4OXVwzGEnNWIbLHIP6b2HcTzj0CT8HGDfr1eds3ABr
         zlCbRZViko14hrZQKsMkkwOIeMFXSpN52i5RzAI3HtjphN0vZQRD7WGbKsFCZZD1EEzj
         V0LKOnmDleWhiVLghkDeVzPlfbGyIFqcAzMPB0VTMAABdD+R5QOVFbsyYpIPsiUrrwip
         F2lA==
X-Forwarded-Encrypted: i=1; AJvYcCV9YibKwvAwC2KvnSj2UZO/UAMfpRYwIXl+I9r16adUPDoSH5rZiuwyHpdnW5Ruv8px8IuWdtYm7ztSV6JBIJqe50kHHwJk6UkwOKss4A==
X-Gm-Message-State: AOJu0YwI+oRV0lVhktl9rCz2/h+Tt/DN9cqUbhDhRk045F7K3346G9d+
	2+q06rE0MU/1GUjIZQDo7yRGHy8VS6MN0urAj5sHDnYTXmJQjXtsQkKxle+vELs=
X-Google-Smtp-Source: AGHT+IFDPkE9ht5Jf4eu8fX337F+j3qeF2SEnGJZgGhVMVJv0WJIBl3UfIdt9/zRKHev70mXk7BFhA==
X-Received: by 2002:a17:907:6d17:b0:a77:eb34:3b4d with SMTP id a640c23a62f3a-a7a4bf98915mr443097066b.13.1721645219715;
        Mon, 22 Jul 2024 03:46:59 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c950ff7sm408118466b.224.2024.07.22.03.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 03:46:59 -0700 (PDT)
Message-ID: <4c80afa7-5555-4b75-aa70-6c8ae8effaf6@linaro.org>
Date: Mon, 22 Jul 2024 12:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C
 property
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
 <20240722-qx1050-feature-expansion-v1-9-c4d486435b96@riseup.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722-qx1050-feature-expansion-v1-9-c4d486435b96@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 9:10 AM, Dang Huynh wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konradqmpphy_out {
> +	remote-endpoint = <&pmi632_ss_in>;
> +};
> +
>  &xo_board {
>  	clock-frequency = <19200000>;
>  };
> 

