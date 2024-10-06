Return-Path: <linux-arm-msm+bounces-33247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC91991FF6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF221C20C3D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F25189911;
	Sun,  6 Oct 2024 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ifDeqqwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F160189BA4
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728235987; cv=none; b=PZTxAQkCf7/Bkf7f+bVT0RuiNUqJs9ZyDkX7hmdJbkwdw8V8chbcP/wC2jZ6gpzfSEOIVwLAuLBf3JESbq5u9f/VbPPvMBEPt1psKJblDqEUVq4My+VgI8g9coZ81jKQa9XMwpThXrCn+quSmy8+VLXd3GBjwsSPEHPTeVXidvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728235987; c=relaxed/simple;
	bh=QhCyGOkQgiBpgvjvqjxBH9vOLjNZpa8j8B//L6DyBoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZXvtOUMkj/YqwHR+8UCX7HykCrHDmgAUx+Ojas+MJb3AFMu+vb4cOzhto8/Yb+OdI3RiiRNfONF2w6SAdtnggvgtftV3TARR3wR1MaU0SRV0hJWwmnztk4tr2kF89Luy1T9A57mDHzpKDctnTe/kRJd38TKM4jhqlXWOiuK1U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ifDeqqwp; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2facaa16826so32087441fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728235984; x=1728840784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WIFhis9nbzOYzg4QwZr7uypPsNR98pceYiIiC4Gv7+c=;
        b=ifDeqqwpeKFCj0KXxkmJnX9bZNi5iT/ntmaGhATi/PUwJg1Qv450psSoO5SZ+hrpru
         oPw5iMfZcBTUUDg3kPTCI2hMKcVSlg56tBNJvuMvxODmrbcYaf8Ft/ot4QnxWcsbxpER
         jVXg39Wn0xpDk1qCeLD84p9901ibNlZRGmt52Hc4qz2kNNJ6hMAwHotPvv0TwEdZJsVd
         o87gbalHS8jmo9mlAt7wvPqP4Bek05hw2T8renKY5wTWq05OV759aDGn2tmw2IJrZgFD
         S3yp+JAnpNUiWzzqR0b3dU3BP/KSKmdGpyY7j9syEgE/L0FmYXPHX1NvKWFVYARGm8eP
         64IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728235984; x=1728840784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIFhis9nbzOYzg4QwZr7uypPsNR98pceYiIiC4Gv7+c=;
        b=vn9RTLptL2ZNAKVOLUTV2VNvXMTPUUiFgEl84+NMpfWAnGMnq7wtVSBx8sr/S1/2sR
         PYht9504TXGTewdVMjLQNbJczlJWMG50tJsOS1JSSHFW3IIfaOe0lKKzTRvIKVzsjP7Y
         klSy11oj25k1OVDOYBJ/vF6Kwq7NqvYJTxxGoJE+4KhRUbA2EQh8+rQrpUAHPQLLfOBR
         v2YSrfAVrakVKtDj3FNiwhku1gnOwvRmJJAV008tYtn9a5iz09EryYXiGHmKy+AdfePK
         zdWwgApxnDk+1iV02vtYKJyLQUBeEUbsGpyS6jS0MDdF+WkTx7Ln+5SSk5IbPsagdg3I
         dn/Q==
X-Gm-Message-State: AOJu0YyMGxDosbjPkLcrxe3u0ZpS0I8nwCs5dMnvqM7czphe/rmEHQ/M
	9f33z2gXEXnhg/eVJlLSYIFepC8ZzVHCnsJC3+RX4+od8KIR6ght4xx1RueBTy0=
X-Google-Smtp-Source: AGHT+IEsWkHJHdD9uuGdPDeF23ZAzVVLlr+LsqBI8Z+Fbqrl+fN88PTSQcf204i5YPdtXnCiwFww3g==
X-Received: by 2002:a2e:1309:0:b0:2f6:484d:cd61 with SMTP id 38308e7fff4ca-2faf3d91a05mr30834981fa.43.1728235983593;
        Sun, 06 Oct 2024 10:33:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b3374bsm5704401fa.117.2024.10.06.10.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:33:02 -0700 (PDT)
Date: Sun, 6 Oct 2024 20:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: videocc-sm8550: depend on either gcc-sm8550
 or gcc-sm8650
Message-ID: <vaovefjpxyzrcobv5vinepfdbgfsmng2cdhuzkph44ojrpvui5@7ckz43wyddsk>
References: <20241005144047.2226-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005144047.2226-1-jonathan@marek.ca>

On Sat, Oct 05, 2024 at 10:40:46AM GMT, Jonathan Marek wrote:
> This driver is compatible with both sm8550 and sm8650, fix the Kconfig
> entry to reflect that.
> 
> Fixes: da1f361c887c ("clk: qcom: videocc-sm8550: Add SM8650 video clock controller")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/clk/qcom/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

