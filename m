Return-Path: <linux-arm-msm+bounces-46403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC0A20E0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 17:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FD061615CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 16:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE2518D622;
	Tue, 28 Jan 2025 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dx3jCmkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885A198E65
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080562; cv=none; b=RQPVdypKBQ+gNuqEXuWOTRRHh2PpDVVJSC7cljMqZMUHAdeZnC1lfJo2tT9dpYsg31MZPbaGg1Vi1KksjeG5I70TSLQjitdUachi2fjl38ckfVLrIJtYobuPlm3qVraVQiSzMBe0+uRxAp1S/IxTDkC7KkoX9jFuF4n+inH6Mr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080562; c=relaxed/simple;
	bh=BEceo0pyOWNwrQgM5P+ElC1rpnayGRzLlO9HRB1nWeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwabIHS/0Zt/39Y+btet7a36YJagiJq+gpf5a+O17WK1bg/b9aA9BqJ7wn8XPKhRyoW7dt+7sV02wfeM511xJN/w0umzaljB34I7ACPyvz/pA9mYXOqDinC8BqizbxzzRc1gxKWvnBumZEpthJZbQnPOQ81ZxahfYic5frnqHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dx3jCmkf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e3c47434eso6226438e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738080559; x=1738685359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hyWKduVNC9ouiWAJq4WnkCOtxjNZB1VnYrFoYk4udA=;
        b=dx3jCmkfR2fG5MyNInak4Wl8/kJyRHvcvDkd+kYwncRIWwuH4O1imGSdVmwdZvXMup
         o8SCsNc7isyz7PQodm1Mpo5ipYDbJ4+fxE9AZRm7mFskRF76ChN2jP7bEvttVRGisCbu
         s+yS9N+sggF3Bj7TbZi7qHvMju42dF736dgNptJvGnbtyDfnC58513UQJ9RLvaqpGdap
         f65GD40Wp86/kbSFQ2M/KTS3V7+d5WrI8/m3iNb7XwKHaBQLBpZCY/KrRGiTLWt5TCdo
         fUHb8eJsouwpYBrogDTh8LgSo+XUJ7FPMOZrkYoxA6bBO0SrfoTQYS4Hsotw7/DZrMxz
         kwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738080559; x=1738685359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hyWKduVNC9ouiWAJq4WnkCOtxjNZB1VnYrFoYk4udA=;
        b=PseyqPvjzDvp8iDIOgvtlU47R7jDPHRP4iWcdKdr75NPTG8wt7Sn1yGEdU77DW+N4+
         gPkUkMOMNUOVvGxFGUrDklB30BiqNI+jzRFXlbA1iLxKw52Fbzhj4YYcGgDXoMngNLmE
         /4TtVm+288xBjDuhTv4EpqrPlV1wQyF2jrjwZFVZAsb8t3uT3YMCRskcVSKlocqZcKZv
         7E8vfcJnsw0Iec5MfoUi3u48U1dfAcX/lgphiBspy7VsdXipm8IhNUOZy8Vz7p4JtRrr
         o/x9t8efVx/K6qwo599a5T+mcOWInVIRBwEioVi6fQ6235m90hqTphos2pPIaWbE+BQ3
         o/hg==
X-Forwarded-Encrypted: i=1; AJvYcCUEO2sLYcIhnrqLiFiQfXmtO7DfS49/vCoqBYi8n5kHbN2CP83ADIY1RLit8J+WE/2jKVq4/y9iYEDNAjCL@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ417TGTfK8IlzBLJLefmXAHCA24Nr0LKP5wyPixOhxlWcsSiy
	b+Unxt+bqNB6lblKXfjLCylYGKCuvNprjF2Fc2/GdV6aGEnrKFFadUBFCr3L4IU=
X-Gm-Gg: ASbGncvyM59zjciVvkxlcz/RhCI+kf5iGmEnGqUUr/Pe6uwWGXtG6sUT0+sgBwz7dOa
	3p2T9aJlcCy3/6YoWcdcZAyynHSNJqqHQp+UcHwkKVoCqM2HNgVxRj/+L5v3HvYLJlEP3Jq07rO
	mlOMRCaS+Uns7m84VQMqpZuF+ZJxsM4KDD3Zn+k85tg7aVtzwhNuevbHaQN8L3GIuAEoLje0KyV
	I/aiF0gH3ta/CGPHzosABNTwl3/2GRt9OuRiz5D8m6/la3D5fmvtJOa28tHYrtRXbDY5m9XOLYY
	oXU+BgPtehFBKxxB5rCRqHuftphRgTGgkMJipmMIgzVcx2yaGItRl5x8VT98g8VHeWlRcUvWtyC
	6BuGuJg==
X-Google-Smtp-Source: AGHT+IHC2sjROuFhZA0YjUt5mQF/zuLJNR2MX3vLn942u6zWQ2Beugmg5eWKUBTr/IVWHBJ5ABtFKg==
X-Received: by 2002:a19:7618:0:b0:542:1b6b:1e89 with SMTP id 2adb3069b0e04-5439c216beemr12823836e87.7.1738080558882;
        Tue, 28 Jan 2025 08:09:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836840fsm1670414e87.132.2025.01.28.08.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:09:17 -0800 (PST)
Date: Tue, 28 Jan 2025 18:09:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-branch: Fix invert halt status bit check
 for votable clocks
Message-ID: <sfrnlwwmoh5ic5c5r6b3mzh4dq2ud27qu3bclcm4p5vwfbckhw@utti7c4ejxr6>
References: <20250128-push_fix-v1-1-fafec6747881@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-push_fix-v1-1-fafec6747881@quicinc.com>

On Tue, Jan 28, 2025 at 05:08:35PM +0530, Ajit Pandey wrote:
> BRANCH_HALT_ENABLE and BRANCH_HALT_ENABLE_VOTED flags are used to check
> halt status of branch clocks, which have an inverted logic for the halt
> bit in CBCR register. However, the current logic in the _check_halt()
> method only compares the BRANCH_HALT_ENABLE flags, ignoring the votable
> branch clocks.
> 
> Update the logic to correctly handle the invert logic for votable clocks
> using the BRANCH_HALT_ENABLE_VOTED flags.
> 
> Fixes: 9092d1083a62 ("clk: qcom: branch: Extend the invert logic for branch2 clocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
> This patch update the logic to correctly handle the invert logic for votable
> clocks using the BRANCH_HALT_ENABLE_VOTED flags.
> ---
>  drivers/clk/qcom/clk-branch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

