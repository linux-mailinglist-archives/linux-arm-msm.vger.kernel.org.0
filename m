Return-Path: <linux-arm-msm+bounces-33854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF0799865A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A63F01F224DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19B21C460A;
	Thu, 10 Oct 2024 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CrHXBqDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156D81C57AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564116; cv=none; b=Yd87Qt7vBsX8iZmXIhVjfoiXkDYLWmtKdh0V1hIa7k9n0VfeqkoLMg00PXPGKc9/0unJ2t2zidkzFct0iZ7CNftDAcsZSanDYxnjmHvh74G5lZoSPDaPoNOHN5DfxsyGPa5nDe+pCZ1CHIcMkxgrGR2R6fdASiwAyewDH/sOCi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564116; c=relaxed/simple;
	bh=WLqZDrSYW+WetA6c31VliZ+hc6ox/PCcc9Js0qtVKn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObYatyLjwHE47cnjjn7GjKbuMpcGZQuAchyqoZqQqziCNWT3C+c2zz1uYP41sT/V2Tb+RPx4AYI9ox2ru5RdDfLICbzYO3YJqkDlssPZkLw6G9vshjpJ7zwgaymAYeG6zWZ4sjnIXZ6bLwKvCzGKGzjCYJ3INS/w51HeLOHdjao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CrHXBqDr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398b2f43b9so1782585e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728564113; x=1729168913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hH54g7776gCYVY8urOB6qAJvXyK9fVwOb//sgz1sSQ=;
        b=CrHXBqDrgbS5mhfQNs2kaGkzAJ3elzC8F1mBZT4qdI+WiFZbOeQZlsq9bYDQW97HRa
         +K+/aCzF/UKjSojEbWmJ5oYOBOgG7kaNiYb0XFWKpKdPVLNXVo5qNG1uFZL7isplY5ZQ
         s4N5cazmDlj2z03piiSqojdJz6HhdMIa1+ZV+kP61EMkOA2l1npw7Ppvl8j1Omkcpt2I
         mHWYkWf447YyMuuomjhQmVtOqK5GSvQMrCS4e2i4Ldk6YBoqNylkQI22LVTIKtL1yUzJ
         KRapQOF4gTAQ0P7gQZHbp5OK1gR/8jQdkOJs+lKHU1afMZTkf5cfjblYNWi0tENxIdt8
         xnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564113; x=1729168913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hH54g7776gCYVY8urOB6qAJvXyK9fVwOb//sgz1sSQ=;
        b=HD7rcDTWp0yBWQlCubuE8RAHT2FgH4UqWznHslRJ/nF2+GMvKLr0Sm73ScfWoazJy5
         wQLOz5tDa+qMWx7Fr/ec67ViwGFmMbMTnek7wGN8NLJcPtjFMLAjQ9yNzQ2VgEU7j3jn
         JsUiRi4zeHEuQEw494xTxAC5YomK3w3zUeWgC1WIshvFBG1dEIQB9nUQemq2kSBibdQs
         35CyWL/kGX6+GIY+yQyJxX7kmlj9Lwcu0fw2d3r2Q/cVfH/dKP0dDmE/uoMGgIcaTtgD
         X557iH0BoABj0i7o26QNrO21lcVdk3sDtsj43aeNQandzfi1Vy4BIMzyksFpdlS9gNg1
         JWtg==
X-Forwarded-Encrypted: i=1; AJvYcCX6NNvtiNa7s82bicgXJh2BZwrKECpyCNQuJ0wG+9lUJme23V1HGyVA5XHoAXqe8A03KURqOxaTCQ29G6gf@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrdO/DuWTU8oVVAF6mAhWe+vQrzMwcqrn37L9FrWF38z1JnCx
	MC2zSHbf2uspwI1kw+vAwbKOIVoXWRHJEl/Rj1YQUzjWQncilGc17dsvizn0CT8=
X-Google-Smtp-Source: AGHT+IEFKgLpasP0gVcJUzeb9+3RF13OHVEn722a/Yk0fUFVhkS2KwI3JLtqwkDQXkOHM1LhnYI+YA==
X-Received: by 2002:a05:6512:130f:b0:539:918c:5132 with SMTP id 2adb3069b0e04-539c981da6amr1141321e87.0.1728564113214;
        Thu, 10 Oct 2024 05:41:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8d7f0fsm235415e87.146.2024.10.10.05.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:41:52 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:41:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-idp: enable Bluetooth
Message-ID: <uefit6yg4wl3tockznodkph6g34zocw3hgdrafgnhsmpol5t5x@jybqavdbhtaj>
References: <20241010110456.829-1-quic_janathot@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010110456.829-1-quic_janathot@quicinc.com>

On Thu, Oct 10, 2024 at 04:34:56PM GMT, Janaki Ramaiah Thota wrote:
> Add Bluetooth and UART7 support for qcm6490-idp.
> 
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 123 ++++++++++++++++++++++-
>  1 file changed, 122 insertions(+), 1 deletion(-)

All the comments as for the RB3gen2 patch also apply here.

-- 
With best wishes
Dmitry

