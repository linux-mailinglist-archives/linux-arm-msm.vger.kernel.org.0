Return-Path: <linux-arm-msm+bounces-49911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78568A4ACF3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 17:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE8823AB12A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 16:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD541E3DE0;
	Sat,  1 Mar 2025 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xoo37irw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AB1E3761
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 16:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740848358; cv=none; b=hKNrnOPPk7tbcsbAQJFYAAzrs+NfKTYiJQYcLIiQLGS+QYDOLl829yVfb9MvPrm9hScY4OlTYUT/yQo1+SIYjcKlEazEsteIi96ffu54whJkM9tedGkpIFeOF7TnPeKtpZfoDSTdgeFI2ayy8sRx6ttWsnpEybzJI0suVAkE09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740848358; c=relaxed/simple;
	bh=iA5cPbq/9vj429yRUOv7R3QM0Odgw+vixO4V5xlgpBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXDGeaz60Cq933xHtgMpiU9AuCJg11VWzj9Nw56UiPZjVPIH4L4OJZwjXrJTCDNbLa333ypvq9cSgaXB9+Jqe2amWH0gVs9quSy7QNwhsI6usZ3JGMmKxeScmqEDg0VFmhYYye/Mmm4OYmoOYc+ORr6NqrdcXHIH4JlL1zqoYTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xoo37irw; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30797730cbdso30152561fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740848355; x=1741453155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8yH9gwYALLNPfPaQHLNB6Pw53oWquI/ljPL4PqtQc4A=;
        b=Xoo37irwySjqTyepe78VUVBUucrV9s1MjFfKbCIJoDhk52TjLM0TNnDcz6mY4mveU/
         u6gmi6rb0Wk4s2Hm7aI8M6OvasGTJM68GKEDV6/X1DhEGddz3YPDmKluSOPzyc1uE4qG
         XsjX3Po5uxqGiku/PqXT6qEFvaf4SfEUJZqOM2oFsOWwGxlv2mkXSxc/jUbwHWphSoB3
         nWpub7pyftHMYUklJk5MgaY8qE3vXWCeRzABRy8sITAoUhzC7zH7Y7p/LfcgUGf1woXe
         xbONEDWHpUuUROoLwhG3M8UbptcVjlti9cP5UHsmIELC2IcYWEQMIh1muRQGab1eUblg
         ziyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740848355; x=1741453155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yH9gwYALLNPfPaQHLNB6Pw53oWquI/ljPL4PqtQc4A=;
        b=uCJ2KGWWjixkCQg9sDRjJRFAgf0W2pJkbSdIZHz7I/e+PYreSQ+6OhqCF01HKTraor
         QEZp4WYMljUNaFwb2PFJTVKeTwJEfgcjlapksWnwBm/fFHxL6Aqgcq34L9qKoqTH0RFt
         Cs0B0pTgtX/jHbfJLRzCkcADXMwffj2tdABtusF6CpE9rUI/X83raGFYVxS+SsowN8ml
         K3O6uPvs/oI+MrjlzePVHLvsB6TQGXxtGjK3ruocrF6Rh1GghJb+Yh1AvbmK0eFniwNw
         AR8WHMA0wXwbV/OBmXEn+cAzYpFd4PCztfj/U9DDLQRtrRuQ5IY9ffJKu1+xNPjN/uNi
         xvYg==
X-Forwarded-Encrypted: i=1; AJvYcCXwF+NUEswbwwOQFPikp9gZ/qQZVPLgqBBV8pFnizOeyt9mNB7qBYJI7Ki3Ub03LRYY6WpVwt9W3EGnEEEN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4A/rIawSTarDoQv93ATwlZfFvlT2NAnzFWyZMBsUnQFpBxzU
	OmCpm0ylnnmTuVaKLyM78bvM/Ss6y5Rn34KDHZCWRH63R9J0GCtGblitq9zRBW0=
X-Gm-Gg: ASbGncsf0+wcQQIXDk/ecovXXlRjak+CGeKb+8NzcMhEWTMnqAnphgBjeNvE2BXg5Fe
	SK6yZl86C7pulum3lKWFaJhlDOg81WbKrjVlAIyK+SKxA4X6CrMGjCqVxPK5gf+/YWjPN8wAT+U
	Cn6QtCICSxb8CTRLakN9Qvmr+mNMH8QxN9M1HzIXrlo9ZgdYCG8g6h3CghjScL9aSRnt1lE3Bhg
	7H4TWTlwDjd+Jjd+3fIDMBqyDm8Ix7mF4q8XfqgG5uxup4CcaUVLijYTR65DVw5m3uS8jE4dOUj
	DTZwNa6oCP9qvKGpiHptUbxZHgD7CutoeJhk9GLvWx5oLimW0T6/OSh/u8xRwMkm4NlPDQZwISG
	kHQ4W77I7M+IdMFxe2QvsF8j9
X-Google-Smtp-Source: AGHT+IEVHoucPnHehRJx7iK3J6AShz+KMdwofBAN581qWxfDGPZrVO0T7MEE9K9AUrnUMGyOVN+cYw==
X-Received: by 2002:a2e:864d:0:b0:308:eb58:6580 with SMTP id 38308e7fff4ca-30b9345c812mr22403201fa.33.1740848354988;
        Sat, 01 Mar 2025 08:59:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30ba9f3ccecsm1399641fa.7.2025.03.01.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 08:59:13 -0800 (PST)
Date: Sat, 1 Mar 2025 18:59:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300: add QCrypto node
Message-ID: <vrokhkstd3zbvdxcagjvbxnzdwznakwg2xitd7wpbdxogqvfkd@grleg3nqtoxm>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <20250227180817.3386795-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227180817.3386795-2-quic_yrangana@quicinc.com>

On Thu, Feb 27, 2025 at 11:38:17PM +0530, Yuvaraj Ranganathan wrote:
> The initial QCE node change is reverted by the following patch
> https://lore.kernel.org/all/20250128115333.95021-2-krzysztof.kozlowski@linaro.org/
> because of the build warning,
> 
>   qcs8300-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ...
>     'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> 
> 1. ICE crypto node is not sorted and fix to sort it.
> 2. Add the QCE node back that fix the above warning.

Two issues. Two commits. Pretty simple.

> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
-- 
With best wishes
Dmitry

