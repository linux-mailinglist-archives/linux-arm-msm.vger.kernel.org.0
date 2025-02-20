Return-Path: <linux-arm-msm+bounces-48599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98ADA3D08E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3854516D0B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6291E2613;
	Thu, 20 Feb 2025 04:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeoH+eTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D7A1DF985
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740026714; cv=none; b=eRI++a0NinIl3YAI2Vt9uVvO1kFRgMHlQOEpYCNVZyhvztg1EgVRwtbBOVS4XimfL+NHUBlMidmF+PX3qw/gLwAl+g6o5jwQXTfWD8VfFtkzG++dGT7DRBdNLqtED4JWEEu/x/pF+XiNdBggUj8Lq5qgQ+v0iT+pump2yDOLgOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740026714; c=relaxed/simple;
	bh=KCZWGTmNI8QIdlHQfPCl4TcaF/VtA6DkYi9Xq78zeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuQzyX5VRddP25NduR2p3NGPjd6Gqd1QQxYFzBo3X7Cph+ObZfJj+f4dcDrkOqITssNt99bha0OLWBxorOGFfBI6/TNmchZUNJ5yFHQnu+vsE6ZYiwNbGHq9eUVzluB391eDP1yYtCDkUCqGbZhO0Eh4mKRcQVHVZvRLeV9b0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeoH+eTf; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a04so5125911fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 20:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740026710; x=1740631510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65LK1GfoPK6Ow7cclrATVzkjUCOxCmHzKKc+sYiStOk=;
        b=yeoH+eTfJc7gEd/B3Yio3eNAjxd+5GwwO7ZJzbOejBdGVCu7DUrEwYdShdKZkvUkOM
         w7j4tfMFiL01PwnfUfSvFex0AaRfyZei9M9Sw3DvFVp0Egz8IpRnY8MXThSD3ETOinYV
         s6WNdYZVwLjRM2wogGN/RTVP4DPLpjfWTGHz6EudNad6dubrEa2PU1x+ZaWi3X+pj3kh
         1Qidy3HgZIrO9DBNqxdvZkBwsEDvleg5n6GEbgm02wfkI3P3BuXkaGZdFzNL7y+KAWwP
         tmskH+9gb3TDdans1PFpdLuJWZSJyOPwm9Fqp21MY3SCw0uQBayGve3fcxSeFHVLXzSX
         VRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740026710; x=1740631510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65LK1GfoPK6Ow7cclrATVzkjUCOxCmHzKKc+sYiStOk=;
        b=gJBOdECvqGBqc7/JFD0QlpmsvkEXvIIG2y3k7NbEBQ1F/vifxBOnHm7aIWWUfl8+sm
         r3PE3BJxp/2eTjB00mDM2FHEm7STB+WkIt++nhWWcSiASHzFPmppDaXMTfcJ8jazk+dD
         rhGVxQoEvd8F5yzlteRFXOloSlJH8a2+hVJRwKn9DddjJoupR4VDii2nYnNmj1tjjHV9
         ikhRfTVDH8EsgWbX5UDPHC7vFBUIpkBpfQTnuvt1fPzu6FAR+l8tzvMq6JsWTkOA1jkg
         gGMthzxs21PODpr77oyCEh40t+ew/4LbCYufRXKACj5giTGPYekg5H0POQp/bAQQF1tC
         tuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF7dG8QUkuJbSGTIghq7ujmYoGCnQnV8zamwH99yCXrxIS2Mj4nDSjxht8iWsDTYhXhJ1pBaEeLSH/Rs2u@vger.kernel.org
X-Gm-Message-State: AOJu0YzNr+qX7y56MPwa0pvmXZlOTKFYnfqjhLCo/3b4zqUVvCtN8Ohq
	9IRzfUsf0s1iqG2kVX74GwRAnXpNqSfUhpc72DMArviBmmGPvogLAShsBxe3HRg=
X-Gm-Gg: ASbGncsaMo0MRckuC3WvGld7/WYaErynhTsnucurIWOO0+ZyTPNRy2GtDHeNr6PsNlP
	nqLwZBJ5KPex9Hokmkd4pASnoP1KmVzXE4pambQbckYtRXSHYag72dg2i3TabcQ7hdYzJIg5Ach
	i0opxjqL7Ywxs67vt1lQkT1V74MpmzxWvZQNYOB+lE5ye2ciedvblokFdPT7yhHakQxEcBtSXda
	q7nc3836Ea1MqML8BVdhJF/0YsSY+u0T7tcAT38DRucu3lTFmf4jeKtiWdp1Sj0oDS96J3+T5Zv
	2dQ6m23WOgTmPUODFdskdKb2E/PLoGWzd3SUtyTaBNM63DklbHxFfPfbeujy6j6s9RvuvBY=
X-Google-Smtp-Source: AGHT+IF67NcEhyD52/u3RW2Suj2R6HsnYhFEljP4J+B/BN8q4hAx8dayZAKsUhRTCIOJraE7WVC62A==
X-Received: by 2002:a05:6512:158f:b0:545:aa5:d455 with SMTP id 2adb3069b0e04-5452fe3aa72mr8207164e87.15.1740026709630;
        Wed, 19 Feb 2025 20:45:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461e731f02sm1305340e87.192.2025.02.19.20.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:45:08 -0800 (PST)
Date: Thu, 20 Feb 2025 06:45:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: qcs6490-rb3gen2: Update the
 LPASS audio node
Message-ID: <ykysfqf6vcg7tbma7cxhbdvmi6zkwpmub75yazylqng3767yqx@u7qklqyrfjsr>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
 <20250220-lpass_qcm6490_resets-v4-4-68dbed85c485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-4-68dbed85c485@quicinc.com>

On Thu, Feb 20, 2025 at 09:52:53AM +0530, Taniya Das wrote:
> Update the lpassaudio node to support the new compatible as the
> lpassaudio needs to support the reset functionality on the
> QCS6490 RB3Gen2 board and the rest of the Audio functionality would be
> provided from the LPASS firmware.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

