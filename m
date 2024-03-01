Return-Path: <linux-arm-msm+bounces-13123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8F486ECF2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 00:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6054E285922
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 23:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D795EE91;
	Fri,  1 Mar 2024 23:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XeMzM+rv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249E50275
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709335856; cv=none; b=uVDS/CBhYd8LiT5soajdsGNqcEZF7ygugGGLzgx6X60fMNlIADUW4AIcATdES1nfdXHWNHhxAbgKu95/jH/yf3tKsBDOI4dkGNC8xV3LCuKVZ8StvrlrU0sjArHUFBJjHRjLikT8LjrWx22sXUc0s1nO+VAa8Tx8mfNcZYHO+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709335856; c=relaxed/simple;
	bh=oTsgYtX6Gj6AhaTLdGdnpkbEZbL/21pDgLzc4k6zfiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odUJ29Cw6kzFUtN7SeDbc6muCJ2UvpJc6VlGGL2wavHUwLHk3L+OG8DKOwimRTfBabMh1vXWduLCU+TBGpTudjbiPHhDvPtAmbt8cizGN1BY3ByF8fR4lmDw6eCXv0zGba4LGYFDd7UXs+3nZc9jBxXQ9MFoN+qkFKItfpRsMeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XeMzM+rv; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso3996081a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 15:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709335853; x=1709940653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0+xGO5lvcaJBILqVTCrQfSCz+TNmrxj1N9SZBn9ddo=;
        b=XeMzM+rvepU5E2D2JgTwo1kOurrSQ+z+Hi4Ce86cBgWiEGOi1mBZCCrMqQkxlGcW4E
         Qxs7bV9gFIPUSMuyGR19XuLGjC9u7hK9gRMVZSTHtbgvkve7NtnBAHlG8QF+DLm8IaYh
         CMZllTi4x+TgNfWkqC+6LLOnTodcuGckIXZkdHThDW6rFDJnBbIhUDa7nq1cm8VTzbl+
         8jp6OciMeeRlDfLZp0a4/cdmn9EOjd6YY6sj0AJG8W4JO1QDqJ6S+KTGFM1wDl32k4jS
         kMfysVH7UR3UgjrLhtkRvhbYtXmHlm5KWnajXXoHskBfRHneU9VuXohE2LWV6GFEtjGn
         McOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709335853; x=1709940653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0+xGO5lvcaJBILqVTCrQfSCz+TNmrxj1N9SZBn9ddo=;
        b=hDQ0g2RdGOeavMF/Ic732h4xmQHn8IitTSjd528rJMdvC3gmIC4ZIi3WguxTT46zXU
         vnJ57MfoPJxZpya6SVs4AKuAJ1CD7Zb+6FWtw9l6u8UJ5A97sGpaZxtnBPBpx9p1TZew
         3qgWgCOSJS354jGJ4fcjRL/qVrRJULO/n1McGOpYPeOfRUp3ca3QGeyVufuOpYfzqRkb
         xS0gp14ib0BRgHdeMylb9jDjZBEfX0Fp4v94OM8Vi4yoUTn6xdLnumryDsRvGi7TRL0+
         1qpF3h+pf1gUP6CNake6b8K3gwivzn/giTZoYWpvo7Vs7DifVjOKJYdCQDR3Perllaw8
         n+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE48u106pvUkeR/j9OTVPpSNiTgeZVgT9B60TzYzW/IGeRzHHhDVTjQPCm6+DtGM6BPOdLqQitV43NEI9fYLfsp55JqzMC7AjSjPwqsg==
X-Gm-Message-State: AOJu0Yx0w2P86i+8PZLQ6o/hVbl877q9/Po7ItUcoVKpjwQqDa/CJP5E
	BDzZB3NSgWVGzGRcpL4ymqfKOz6WEW0JxsGK+AIop22RaiImf0QLf8BJcjc4PEg=
X-Google-Smtp-Source: AGHT+IExL+5hOMeIbqveJaAAJ57Xl60U2dXp/DpxIsvmvzGELA0l6Eqydv4PvM0FA09j4SusZSjAiA==
X-Received: by 2002:a05:6402:1848:b0:566:a7c0:c8e8 with SMTP id v8-20020a056402184800b00566a7c0c8e8mr2537923edy.12.1709335853144;
        Fri, 01 Mar 2024 15:30:53 -0800 (PST)
Received: from [192.168.216.32] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id d18-20020a056402001200b00566d43ed4dasm916955edu.68.2024.03.01.15.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 15:30:52 -0800 (PST)
Message-ID: <7e573e8f-a311-4d72-a0f9-1e6f0ce94b4b@linaro.org>
Date: Sat, 2 Mar 2024 00:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] PCI: dwc: refactor common code
To: Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
 agross@kernel.org, andersson@kernel.org, mani@kernel.org
Cc: quic_msarkar@quicinc.com, quic_kraravin@quicinc.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Josh Triplett <josh@joshtriplett.org>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240301051220.20917-1-quic_schintav@quicinc.com>
 <20240301051220.20917-2-quic_schintav@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240301051220.20917-2-quic_schintav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1.03.2024 06:11, Shashank Babu Chinta Venkata wrote:
> Refactor common code from RC(Root Complex) and EP(End Point)
> drivers and move them to a common repository. This acts as placeholder
> for common source code for both drivers avoiding duplication.
> 
> Signed-off-by: Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
> ---

This "conveniently" conflicts with your colleague's patches..

https://lore.kernel.org/linux-arm-msm/20240223-opp_support-v7-3-10b4363d7e71@quicinc.com/

Konrad

