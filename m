Return-Path: <linux-arm-msm+bounces-12553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF05F8673B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 12:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E9F61F2D80C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 11:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729141DA21;
	Mon, 26 Feb 2024 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htCSDjcg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0A11DA37
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947907; cv=none; b=SO/cksIS9JY8j88PnSZCEv9f5zZ0cPauJRCJ/uZ68uh/0AXvg5w6+QErnPby0/VP9+Xz+Cg/1efjsSq4bRJ6SKAjknzH5tVXO7ElDjARQlBqLgfNWOGoQjErvGdW5LoiuQHgQtcvX8Hi1qY2jABcWOMpKvWcrA0j4KhjwEQVu88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947907; c=relaxed/simple;
	bh=prNgVbePwRcKo0ldZvLmcT9NEprnyubS2n4dPuEAQS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8MP6XrEWLxG3/d91D/LR7GUjTyM05C5v5C+b3/KLWJz9Hg9TBy5J9Kn1Ya4sk1aRDdKWymeOqcGdhjgl5w8+boKvl80IddUnRDiPDfTw3K9HiktAYWI+LBiOaCIa23i7UbsXQRB0YZb7tsTUKQJHFQEoo2MgOQLCWCLhGY3EXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htCSDjcg; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-68fb3a3f1c5so8708996d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 03:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947904; x=1709552704; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CSKU6X8Qwf8AFWfUlivJ0Qu0nT+8oAq4LKU9650PhEY=;
        b=htCSDjcgeWBxcIrFZFAJ7xcoOBhvWyUPFe8PIYRrjmJt1A8MQflEdaEB8PhWIGzuad
         8yXrRxSYPKZ6tPaDEhDOLigNAm+QZsrfDjqbH7CFrw1BTawmqHmB4NZuKGsQGvKTVinJ
         7fIAjW1SX3boe6A4YYTgXOnDMntBiJ2IoA+IzNrteHUZS/qoLGEcJI2SO9Ct/H1qV9Mh
         446lEj6RS5wKIylYSYSzxi2Lj9tUDUo5MELA4E1ahEAI6kQfs1NIbmZWPxp9rrWdiAIn
         ekmNn9hkvZDWbYsUGhespAYerJr8S9mk6rYteD7zrqk2s6f/MVsrvI0y/mxNoskxqxp6
         ulbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947904; x=1709552704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSKU6X8Qwf8AFWfUlivJ0Qu0nT+8oAq4LKU9650PhEY=;
        b=sdng9ErbgdyFXUuLhivcZmtLBi2sngjz9E62/D1AdFgYQmCTT301F93eFnRxLcIK5q
         ukSi9OKx3Z8eQM2qatPsQbacZ6M6eJ8DPjcUY4UX+j6Be4kitY0Xr6yQqaTgHEUdJ7/9
         hr+jrLqXwNbuFMj9yXMF2sjK4U5reDneGFMTRXtbQfyVWhOl+H5gTQGoqsQW1Brs8xp/
         K7GTh0s+MpR5JJav92ZfQID1DWfuVnWCXQ02MfdOCibtvqckVEtOfv2zPIL1giptnc8E
         B9qRNJkbWqzOrKQxDUrFeTLYu9AP84TijFbMCrxPnpZtdQSFN3+YkMQoCzofNq+eTKSh
         Y7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUv1DjFQKJ0CmHL2yym14vMJv+GTnPTWq9nXykMMebeLAkB8TokZUEeAo+dwTCevSZgAK2XcrU/9OjnoolSMwrOaPecBTIgOcEQ48WqUg==
X-Gm-Message-State: AOJu0YzfoGPcLgYsKRiBlChHV7tDKg39d7dhFJH9/Vzew6Dpw/p4TxFv
	CJ/RGudZ1N1GgMBAL2iqtfKHURTE7MomBnZMyIbGQKpK4bhxPgsBx7xGaVaulw==
X-Google-Smtp-Source: AGHT+IGpa5Q2fHBV5USsuqQLitp7DsDSNKdukrxekBdLBW00T7uhMM/LdUvMDcnQPH4wSebMQTN4JA==
X-Received: by 2002:a0c:f0d3:0:b0:68f:e821:ed43 with SMTP id d19-20020a0cf0d3000000b0068fe821ed43mr5600040qvl.42.1708947904574;
        Mon, 26 Feb 2024 03:45:04 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id bd3-20020ad45683000000b0068fa52f5f7esm2811461qvb.7.2024.02.26.03.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:45:04 -0800 (PST)
Date: Mon, 26 Feb 2024 17:14:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: constify
 modem_telit_fn980_hw_v1_config
Message-ID: <20240226114459.GB8422@thinkpad>
References: <20240222-mhi-const-bus-mhi-host-pci_generic-v1-1-d4c9b0b0a7a5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222-mhi-const-bus-mhi-host-pci_generic-v1-1-d4c9b0b0a7a5@quicinc.com>

On Thu, Feb 22, 2024 at 06:00:23PM -0800, Jeff Johnson wrote:
> MHI expects the controller configs to be const, and all of the other ones
> in this file already are, so constify modem_telit_fn980_hw_v1_config.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index cd6cd14b3d29..51639bfcfec7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -538,7 +538,7 @@ static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
>  	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
>  };
>  
> -static struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
> +static const struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
>  	.max_channels = 128,
>  	.timeout_ms = 20000,
>  	.num_channels = ARRAY_SIZE(mhi_telit_fn980_hw_v1_channels),
> 
> ---
> base-commit: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
> change-id: 20240222-mhi-const-bus-mhi-host-pci_generic-5ddf8f13d35c
> 

-- 
மணிவண்ணன் சதாசிவம்

