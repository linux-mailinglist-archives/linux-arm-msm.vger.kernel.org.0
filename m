Return-Path: <linux-arm-msm+bounces-34308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C5199C746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0289B218BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE42170A15;
	Mon, 14 Oct 2024 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vdoI4DGr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90841684A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902285; cv=none; b=mWNb2wGOBivhN0rl9269Loc14vRDDFyXzdn62LmUDGFGcoPKXY7cY5pHSSt8sqpYaJF1BUgSDIL021smCW/eRnbf0CuZpDov7q0nU/GrUYUaqumOblJLZ+hOf/WLcnw1FZDpFQgYXNUTuCJU9or10m9hxe6xqCckkEhpbhQK6l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902285; c=relaxed/simple;
	bh=GfYOBNd/xhaNWZiF5tw5jM7nyQDZjEl4t4iYGSzpShk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kz2ZoO0nT2xIICKZ4oGknGXBI7jE3JsYo0OBLr4pE4QNCo8I1T/hIAbbmZSE/fdGfBbPsy4pBDmj7DZX1xhB62nswKza9CZFRFNMOg+KxJybEILHWnIRkyf84Li1LjlHPfhu7dNnjw8C04pTi4SUFt35J8O8CxNVAnKPvPRjQ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vdoI4DGr; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539983beb19so4371291e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728902282; x=1729507082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNxu52R66dAexVWmuBJlDuj7XrZseCFjOxVEE9oWMa8=;
        b=vdoI4DGrlYdoEJoUlKJcAfZ682UiGfUZ73AYosCAmuOKTSfIQIANeaT2TJQcZVdDZh
         m66KQNKqBDcpeodidaGuAcr7PaJctaZSzyrE9o5tDhrceUJxZ3MwewbDElXGdV7Fd80t
         FH5uxsQj4799sc5QljMAAVnto0HBQ90AcNg1kqn7rlJHCjyS/l/VfYycpnmEawFl8yQv
         sHwpRQ5E4gRQgxe/twjd34gTCcNqIKBuVaiASNJxci+kRAExDgvVXorkBlG44gQbHd3B
         d1anQj9GmW7hySrO634U+z5WaZ4W2pYEWsfOktf05uuxQzRG+ajNL/uDAYqJuiDpVXGa
         DRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902282; x=1729507082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNxu52R66dAexVWmuBJlDuj7XrZseCFjOxVEE9oWMa8=;
        b=E7GHXNgXnA8CUUKQq1PAMmXZNt1XqjvWudRbEZ19PgwarzDi7iGN3fd8FYt8Ko+LL2
         VfnJ1TO+iizPUfq7h0Y/gg6wzvZ6MlQ3wehH6nAOh0MN5g3bSO9v5YV/9mAm7SH6hPCo
         xTJkLvuOVnfJ4HSCnp4TKlYLhjnulQt3aS4qavuXp8CVhefpAplLKsnjue0Rn3jANHpG
         /EJ2QWzidQPlDosK9CDwCBEaWd20KFZdZLe8bihbf8IzebETMVK/QSb0ltLVxJBKYobT
         w3csEDHQTTmzksD3urNMcdwq8NBQsmD5vQOqD3DBfgcyWjyNZt2pezhmHhjNb80xKNCb
         040w==
X-Forwarded-Encrypted: i=1; AJvYcCVgmmpOQ+t7I1XG2l5WpcaHIPro0G3GYzyO4hss8IfwILHdB2QSkDnf4U0PdBDObAt6+SRXGHXBxP5DxzY8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/dVTOaxP7TErUecX5QPVyL5+g+SRQ3tenHrJImQ2ggcP8JAf+
	AJNXNLHCIBLtj7nbH6BfuSYMlj+2g7Z6VIWRzxAUP9EX8XXmOH38z8rhFDhHVGk=
X-Google-Smtp-Source: AGHT+IGh/HgShU0M87jg5qDKmztFz9FVFIbsPn+Hl1VzRTCmjOaXrGadyrTz/ohe6iZAJYZ6UBTuSw==
X-Received: by 2002:a05:6512:110f:b0:539:e85f:ba98 with SMTP id 2adb3069b0e04-539e85fbd79mr2598312e87.56.1728902281835;
        Mon, 14 Oct 2024 03:38:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539f005be06sm566160e87.255.2024.10.14.03.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:38:00 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:37:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: defconfig: Enable SX150X
Message-ID: <pd2pnnnlw2mxaxtdw4aelnngr6kznungvzg452jco6c2anmb7n@xj3zci34aabs>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-1-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-1-4efa191dbdd4@quicinc.com>

On Mon, Oct 14, 2024 at 05:47:27PM +0800, fangez via B4 Relay wrote:
> From: lliu6 <quic_lliu6@quicinc.com>
> 
> Enable SX150X pinctrl driver.
> 
> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>

Ok, even worse. fangez, you are not the author of the patches, so there
is a missing S-o-B.

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 76f3a6ee93e979e9e39cb0283699a2753b0dddf4..13ff005ebe0e9cfcf171b08add24465d0ab94f05 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -630,6 +630,7 @@ CONFIG_PINCTRL_SM8350=y
>  CONFIG_PINCTRL_SM8450=y
>  CONFIG_PINCTRL_SM8550=y
>  CONFIG_PINCTRL_SM8650=y
> +CONFIG_PINCTRL_SX150X=y
>  CONFIG_PINCTRL_X1E80100=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_PINCTRL_LPASS_LPI=m
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

