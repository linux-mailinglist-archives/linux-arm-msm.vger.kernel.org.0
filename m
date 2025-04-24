Return-Path: <linux-arm-msm+bounces-55274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3458EA9A2C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FB05194421A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 07:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F438C11;
	Thu, 24 Apr 2025 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXyrZaND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8823FF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478070; cv=none; b=IkEtw3CJnOnoD1QLgo7fhhMeoncOAQ916xMSjN8vPeLnhDJ+fHpyn0oVGrAxoClHepZoItGpQkoHNbIulNLiyAcms8MqI+kXddr1uY4hbE8tVGP7mI10H0fw/nVxePpUMUHrbgBoShRFGMuvVz4/kwLMvtIVk2pYzj1CC/2Vsbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478070; c=relaxed/simple;
	bh=L3APaDNcpcKWy+ljj6wYw1aJYFyDyEbeFg9xBsk1Bwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFuIsIRzBt4EJyC7KX1JFHuOQ8M4aH+uPFUmAov2+mXS0nPnmCOfx4YUKPgYXIaHt+IwuXftlKNrtHyej1BZeL00v7VTHCTkucQA/KaGPhq+VdDSj5cYnmHvKmGKIz4agLGIJApCL8ef3wqIY9YcCu9EUW3SNS9C7/8pRJ16qjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXyrZaND; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so1305761a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478067; x=1746082867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bd6KF7qnJBjEfDBLcMQiy13vHf6l7mQMuJsOH543KwE=;
        b=LXyrZaNDE75SaVENfMyCd+POEynZSKdQ9kE9kUVLhwJESd1zgJi+BeJoNZit281zjn
         KVHBqcGjhxHelqdm7Tn+iJBcXjsW7X5cfYhrY4uTNeQXXiqKcc4QPStV511Nu5Fg59QM
         KKI1GJPBQbphXmEpEtyppGgX5InfadebEJuZQkuUlp4g34SqewQtAOgh8rjVKAr0ueln
         cqtYyz0KIs2xqS/cpXElC653DFBONmeaKCAKJ82P7JTQx4czmrYTcDMO6Pls7uMrYpOY
         Iz9IuPeD3MZnXaCtFBEpjg98RxdVGN8M4nlMdvMtP+0BlA7ij9DsLb1OzNjdSCPOMiPZ
         Vv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478067; x=1746082867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd6KF7qnJBjEfDBLcMQiy13vHf6l7mQMuJsOH543KwE=;
        b=d6IHEl8wDMnU8ntlSlAS2EpU6DK02eoCoOpF3p6dVEdsk+p2tD8k5ZdKnvCeh01i4t
         +G7L0TQ8BVZ+OKuot4xHnnP2jwwv/9srf4CA2bYuniUvDYHmgkn+VpgbAN+nmsV2/Nlt
         z+sXykTmJCu5svt72jBHaCNOSjx3gsEew5RUPwhNh17E2bAJ0lIQ0gxoKkmjYaGmUwD5
         oVFCdsv7LbffL/p5l2bopQc31y4xRJSPK5vSUK3DyQVfZAGSkhwkbj6hV6oxXPGz5D50
         CSJ7qEAoNYZDs87BXq4Z2iHoTIghhYZLpeRqJuzyXUJFyPfst7rAaG8wUTn7TN37EBpt
         ScGg==
X-Forwarded-Encrypted: i=1; AJvYcCVsOLBaxMziCk/qtTl2lbTLE82LdVC5GCZVwPl+VRQTz/hHU7FNrKsE+CAFdzTuebR2YGX7Vc9HHsyyob8w@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6HaLjsAfatRI8FauirxWugzPI1dgQL0ShhyIDj+NfAkBrT6A
	LiRkVQO3Ie7n9EF6t1XX2JEHn4gID/nuLLgsaLTM13O2n6w+Aig+3d9xcPOSUQmcYEmPQnOe7Od
	l
X-Gm-Gg: ASbGncuySqLurLGy1txiMlFZ1hCqR+CHkat4SF6ZceG6bNtBZS9cVIoJqEeDwyXkzwS
	s8BzKV5gqTkNCP8jhfhz71gySxrdrRZhTyxdbI1/LzMA7gVDtkWVVDX2tc7z9M4aFZbkj+hgvzw
	EZSeXF8w3rLX1wULyboOmZY9o0EyTH92QfrDEOVO5bHFeWMbCsIZiSEtRbaZQ8BJp92U08Y2lNe
	sVWkx0SicyUXMOX/HBGvtkbY+2Z/hLhV/850NhvgnXBqgBzDRuBPJEXYCj9L4vf7l5XMiTEfvp6
	LlxdCIbtElzs44abSEpoUbEbsCo4mGerJktRYg==
X-Google-Smtp-Source: AGHT+IGwr/WuZPUfvax9eIsb96aaCta/8FzIuwMP4WW4Ar2s0sxwfKKsr5uKtNR7HMl6jcdgRdFKDA==
X-Received: by 2002:a17:906:44e:b0:aca:a204:5df2 with SMTP id a640c23a62f3a-ace573a6ec3mr96658366b.49.1745478056074;
        Thu, 24 Apr 2025 00:00:56 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830fe7sm59240666b.13.2025.04.24.00.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:00:55 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:00:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>, linux-spi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic-snand: propagate errors from
 qcom_spi_block_erase()
Message-ID: <aAnhpVaVzn/G8TR3@linaro.org>
References: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>

On 25-04-23 21:31:57, Gabor Juhos wrote:
> The qcom_spi_block_erase() function returns with error in case of
> failure. Change the qcom_spi_send_cmdaddr() function to propagate
> these errors to the callers instead of returning with success.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

