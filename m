Return-Path: <linux-arm-msm+bounces-35720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E9D9AEC72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D1971F22D51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 16:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C6E1F81BB;
	Thu, 24 Oct 2024 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IG7HQTAf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD361DD0D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788222; cv=none; b=lpNSiMS0DzudUbHV7uawTA052/WlQ77qAnJHPEFX1ktliX5M+pO5H2cK9O0BcbMkXo7Hs4lt0dB6vB5HWWMrmei+K/8EwtwCXUPtRx+CqxRNNDp2sH0ddpPrOJbmjGoMm+mG9/8hZZ8cz2YuCt5bhkXOQFMrgnQd+Ca7VAL1l4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788222; c=relaxed/simple;
	bh=8F9QFJExKoZV3r+Rq2rjzvex3k1W8OlRSebBJR5UDfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl4DffCDXhcESg+GpYB6wshp/KMPuyhjK6Y4OIvJzry9uyu2vO0WdUp2AsGSuTstkfsRcXScZ5mE0kMS7kTeOkoAH8ClZp2wDDW6aQix8rKtzNsrKPcYmC0Zl13iXbUXN/sjOojVrAtpjLPj+n3ApsrVyJROYq0sMhCYivgdCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IG7HQTAf; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e13375d3so1374783e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729788217; x=1730393017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ1SKosq4ME4LnGhVk58FZ+AQNbmaKvUFJtbb88J6AI=;
        b=IG7HQTAfTmoTqfjD2vc1AzMv32y4BN4wbY8vkY/Fmo36qOp19T5IYYbWbhDuEQO4H+
         04nGQwD9l9JDApdkYuEoeNUNIoG0fYJXWtu59lU+Nr7EmVu7AryUg5jkNo7kw9oUkTuJ
         uB5ovI51cBhyjhqeDntb6PtZHZRFdvLe06CJoZmBFf91apwBnSTqxEU79HY+w6gJavyN
         mCFimj7uSfG3CAYfglkoAptUZmfDUvHNnJFvCy375Pej4TToAg/rBOYilEYte5JWUB+y
         dqPRrnvk8OLYs1zyImSImvhxH0HX6fR4szDtqwzr7VuyfhrITqYlquR4U9m3klIP+as0
         iUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788217; x=1730393017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ1SKosq4ME4LnGhVk58FZ+AQNbmaKvUFJtbb88J6AI=;
        b=BqFXtpV5C/SWuRzFuMAfvMQ3rhNQ70/GzKMdTTPSR0MWBk+zzqHyNRFcb4TL5PNJiX
         Y4AVmQ8/TLeSvNPLrJv5+lcT15gOSOr9dxdUemCpldRc1Ric6BcioSNiBXkHfoV5GqmC
         FWXlbHHr7Si0/uzUQS92uVK3JW2To/xgpI13ULjGBJBXJaKKBfurc0fibP1hq0Yvhj7x
         JB2Mar41BOEElsrswc0QbNBB9JIOVputqh3BowG0z0ESL2g+l5WUnIAn4OX+z7dzlWb9
         sFvhzpJx34GeCgXDR24PWbnnsv6EmgVGWo6NQuT+g2Kun1AFsG73AnrLODAzA8P5qxqe
         AGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz0PcIW2gN1aH5S3kCt8IzQcP9XCx4fqOa1JHo3JGL/P4Z70bXhiv8qTeiODG/VpGh17ArQKuCsO1Qkijz@vger.kernel.org
X-Gm-Message-State: AOJu0YylLOQWoktGxmFXoMgws9VT4NKOvtWqVxrCIpbSbPkbGMCYnJMz
	ZEkgutsMDX0ftLio32AwnKWuQWT30NbDYZwGqJFhb4Ola5usIdpCRwOBT/EaJvg=
X-Google-Smtp-Source: AGHT+IGqxDW1aVzfP3ZwgHH7zEX+7npkKOr1iS17LNwryQzLKB8dUp7DKzbSY+FS9fVaAgULTErNCw==
X-Received: by 2002:a05:6512:31c8:b0:53a:40e:d53d with SMTP id 2adb3069b0e04-53b1a31dceamr3760576e87.13.1729788216765;
        Thu, 24 Oct 2024 09:43:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2242fbaesm1391572e87.182.2024.10.24.09.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 09:43:35 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:43:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: sc8280xp-x13s: model the PMU of
 the on-board wcn6855
Message-ID: <v4qfooxof2zddlpgp5wegqkzqvbickk3ogrlz2ku7s53u3f62c@ylowkeentghm>
References: <20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>
 <20241018-sc8280xp-pwrseq-v6-5-8da8310d9564@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-sc8280xp-pwrseq-v6-5-8da8310d9564@linaro.org>

On Fri, Oct 18, 2024 at 02:49:15PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
> and bluetooth nodes to consume the PMU's outputs.
> 
> With this we can drop the regulator-always-on properties from vreg_s11b
> and vreg_s12b as they will now be enabled by the power sequencing
> driver.
> 
> Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 103 ++++++++++++++++++---
>  1 file changed, 89 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

