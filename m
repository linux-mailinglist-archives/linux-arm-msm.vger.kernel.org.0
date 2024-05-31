Return-Path: <linux-arm-msm+bounces-21248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAF98D5F68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34E2289AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6649B150980;
	Fri, 31 May 2024 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+x1qcij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65F217554
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150649; cv=none; b=HCQHEL3KmJ6FcPJP1dqZQHNZfGJhoxwaESlbZY451+Cl906xkqBwUgyX55hq5S8Zq60/C5f5HWOfe6aIDvDnPX4bp9QJDSXX827diXWKbTaaYkCLRtlwaMU2O+3cGGMg7OxpfU/57VAEfTXEEyy9gljrgJOnqHdPvrrETSmJiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150649; c=relaxed/simple;
	bh=Xm8eJEiJSbPv5KlOHAw0Bd4Up7PDqUcO0xG85MkhN18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnhsTaT2b9T9qBkdH4qIbePgjvmnTY1l3iCQ6q1vu32IgBqlOTQdapoPWI8MY41FTEQhS9Gy5d9CZ2AG6fFNKuOpcAvQh/ZLJKqhORIijUCMKoc2K0UqBOXAkFR0JKHBJZo2NnIsI1ACQbKcUrELFl2paaU9fBRudLhrw4U6O0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+x1qcij; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b7ebb2668so2158992e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717150645; x=1717755445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wU2x+rC+rY1TexIw+35IsmnICmTlxsrRgP1OhOExHRU=;
        b=t+x1qcijfZQK6+tK2lb222T+MRztESq68W/coOuGgF1415dvrUQ4SZ9tmBVGc7uiqf
         gJCwml1KObOxgRB1V2FN1j03z7C7DBk0ilntkNG/KPYMcWaEIy05zmjgDcUsHXzn2kVU
         fWk8Vbc2mJOcqWA/m6ozOalZcvLVq4QxSjvXpBtpfoINq/Ruv5O8z9tGEpIsdJcn4klj
         +24IymLVGwAIdJPsH9sXQfQSw4YJ89arF9AaXblSoYDLsXkYqTNZNpRAiY56q5SzlXX9
         RscwOrErrkck08/egnws4zjhCqGOS6/ZZw5tnYjPa5Xeo7Q3PN26SJohXUHUhia2TydA
         UAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717150645; x=1717755445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU2x+rC+rY1TexIw+35IsmnICmTlxsrRgP1OhOExHRU=;
        b=YmgeDxfWaVnezdb2JaU0T4IjACPRbO4SqGiAGDQAWXtlZ6r+Bx4h5xVgvZJPwQ+3IM
         nbLkyWJFxYbBdGhxokPAf8Msz2etYssGxmoFwXAhDIoPqthllEg5nO6c0RuBHCKjWANx
         BavAHkgivNUHdu8ylJCiHU0u3N2czLPJmgpEkooC+qa86mbUtRUNnbvJWHvY/RwYL7HO
         EgsCIDxgkB1uq5HkhJhhlhs4KVT3EupO77ce9z2+VtYhpWBuAaR5dtTuyiSEhPHUgbm2
         gAqiUbCxSPZ6I/brb+5KkV4cullrwPjqMLkkzIUd2hRHQFMKiz70Xi1gpdfEeW3u0X5r
         bTxg==
X-Forwarded-Encrypted: i=1; AJvYcCXUAHBzGGWPlvAacQkWHWQMDw+HE7oGmagfzzZ9MbLABt86PZzmJ4hQajF5oUfMqzwrfctabF9bHT+2QxFjVSfpFE3IVmJsiEfNIflX6Q==
X-Gm-Message-State: AOJu0YwMRKQFPngFRsPIe2T0vWV4ksL1V4v9CCPnKGAEymgeQcjFZooe
	BN1w/XAM2ygBtN5xj5295NINk9KA693nZIWc7BRpcF5FsbMQBU3SzjfYoFKFQ5Y=
X-Google-Smtp-Source: AGHT+IEENyeuMobIIP3O9emQj4DsBm+mT1b2exSWtrGGN3X/2E5CAATZZ9KTvisqbqNKE/5YhvzoPA==
X-Received: by 2002:ac2:59c9:0:b0:529:b718:8d00 with SMTP id 2adb3069b0e04-52b89521713mr1089746e87.8.1717150644844;
        Fri, 31 May 2024 03:17:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d898cbsm281293e87.265.2024.05.31.03.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:17:24 -0700 (PDT)
Date: Fri, 31 May 2024 13:17:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, quic_jkona@quicinc.com, 
	quic_imrashai@quicinc.com
Subject: Re: [PATCH v3 1/3] clk: qcom: sc7280: Update the transition delay
 for GDSC
Message-ID: <6wb3dyxebhgoimcxgcxovb7pyad4w3eipvvufef2jbvjbtqhwh@o27mbzvq6szs>
References: <20240531095142.9688-1-quic_tdas@quicinc.com>
 <20240531095142.9688-2-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531095142.9688-2-quic_tdas@quicinc.com>

On Fri, May 31, 2024 at 03:21:40PM +0530, Taniya Das wrote:
> Add support to update the GDSC transition delay values to avoid
> the GDSC FSM state stuck issues without which it could lead to GDSC
> power on/off failures.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sc7280.c   | 19 +++++++++++++++++++
>  drivers/clk/qcom/gcc-sc7280.c     | 10 ++++++++++
>  drivers/clk/qcom/gpucc-sc7280.c   |  7 +++++++
>  drivers/clk/qcom/videocc-sc7280.c |  7 +++++++
>  4 files changed, 43 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

