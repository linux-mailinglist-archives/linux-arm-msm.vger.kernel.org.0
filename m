Return-Path: <linux-arm-msm+bounces-46527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2D4A221B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D563A2E2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 16:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1B6BA50;
	Wed, 29 Jan 2025 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k0gWxZq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3805B33981
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167920; cv=none; b=LV4oeXrpzn8irSCxuTbLK8eLW8piK2fSjOzqiJqUjEp7jL2fiDuApriEvVJZLJHpeCfG+aOMn6aPNobyYTsBDenMxZ3LyEY0kT0IDi8sX9RICYSlCMfnZX7JN/I75qGNqeREQ7xNShBbf5rvQI6OBTMZJmmSoQac+PVvfGhu5sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167920; c=relaxed/simple;
	bh=eTe7u4R9tM7SfXPBUlFg06jXBlzWIenc8aOm26K9+hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCumteF5OHWR/OcLsrqeF7acKaxNc3pUQUdtIH5JRHnQ00jvsr2K7h/m+4Snh/gkY6jAGAp2jYYZRtZPEbQDGRRrcu9bs9ux9M0rh1fpgw2xXxitgQCzCObYHMBnAi4+OWLKcvWT1yZmtHSis1w0+sG9F7o8QgtOBoaPqFymU3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k0gWxZq1; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so7586278e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738167916; x=1738772716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QO/x1oTf7a0srTFjfunlm88nqvMdqFvIe3oraA8GH6U=;
        b=k0gWxZq1KnD9iBxzzd0wh5Y/Fmy9nTalgJZxGJ1ddHsiAULIVVPvUiPm8haRfHyXgJ
         I3wWFnUiLIxQfBiNTyI2ldTqoaCDEWKGtb9jws5wdsah0fFgRod7Nvf7zNH+G0jOlcIZ
         7p1pDn7wwloaMKn3WIRqAcrrhgqmPh2+bIt67fG1/c0xUua0I1DJWuO0/IoPCKxvgKVz
         mCN3/oHPD3XRVedzxmg7i9qORjMK2Vw/POC+UTAz/Lzk47/TYkswkn8xRIX5fIpTnt3G
         cgIE4pl0uaSqbm8YtQVpY2BWZAkKHq73xwMwLlU+hvIPeQMLChLwSB1aY9VpQ4lYp52w
         RyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167916; x=1738772716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QO/x1oTf7a0srTFjfunlm88nqvMdqFvIe3oraA8GH6U=;
        b=j0Ept+LFHPoLGiRTOF34WUrL/vrwXMBleVNI6IebHVgTOrSLtIMDNg1jEQlNh7vO2k
         FwGq6LjkeXxq0NKi3tWZywMTK/yT3EhuhrORGOrwf859NuEmq5X8upeQ/+uAw9pakKRn
         5rSKcuQzg20crhqsZHxbAPoDw/pud97ZawO2TK2NoRiupOQYeSreJ5v0ojDJgP7gNs8C
         21CgQ5PcbDlDD0nwHFf2EDPEpeQysG2NRtmGWboTLC1WQUO7R0plA/QtO38xZUrpWvnl
         sKa4lMQ6rvxpB4yg+yrgR5IgPT1pPvRyURUI1mPo+73sT8l/stADrKm79PVszTcAn9eh
         Gbew==
X-Forwarded-Encrypted: i=1; AJvYcCU4L7RpHE/m+qYp2aMqi17HVROXPaqciYEwFPDhVEBvOC7xpIyc1Jinm5f1yCgcVAXpVRxUb9sUQyMxTysj@vger.kernel.org
X-Gm-Message-State: AOJu0YyUs+U/NfUoJUgMmZJaPI3Tyh/zAv2CMSMI69D06CWEA8QQ+/kA
	AIA+YOQxjRHs9d1lojbp4Z0SsyhfVBGsH9i7WK47D61V4wX16Hw5+54wKR4tkWo=
X-Gm-Gg: ASbGnct+zQKBldQsc15C1WABK0c8Vp9SHAOAcEZpP38hUFE1Nz8p9M6Jf4THZ7u2efo
	oqLYhYbAmGskYfeFOSDJpwlQJh/YHjk+5bP3tW4LP2D51KfJ/nxPo2xK5a3soDFDfJUpaWAJ9Rc
	TEOHep3cklMfTRaK2qZmXOhCEJuTmNpn2WQTV808YuNcPxuw2V2Br9oUu1iW4y3NuykJGLHtKwa
	iQktpY3UyDNvg70lfdVUoJfSnqJXuo5AnhthXbLhL94R3ssSefIlJAJn0bEDgMYOmJL+kO9TDTJ
	m9wxY2PcwO8a6QWIB5knf2jyrdhvIb7R2AiVKhskm7LoKPHLzxY8PbaACQvDigd9YnSChbA=
X-Google-Smtp-Source: AGHT+IET0XFFm4nQy05VSjs4EMucd01BjcVOGhckKXNaEyF8FTW0tgtOo7C/7RncS5097j7cJOotMg==
X-Received: by 2002:ac2:4c86:0:b0:540:2188:763c with SMTP id 2adb3069b0e04-543e4c31246mr1146851e87.37.1738167916238;
        Wed, 29 Jan 2025 08:25:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83682f4sm2001573e87.113.2025.01.29.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:25:15 -0800 (PST)
Date: Wed, 29 Jan 2025 18:25:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect
 CLK_SET_RATE_PARENT on byte intf parent
Message-ID: <ktwnhspd2krxwzcswrqj7ffoyhdzplplosy3f6bu6gqrzi5uxj@i5xqxthpha4n>
References: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>

On Wed, Jan 29, 2025 at 04:45:19PM +0100, Krzysztof Kozlowski wrote:
> The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
> the rates, because this messes up entire clock hierarchy when setting
> clock rates in MSM DSI driver.
> 
> The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
> via dev_pm_opp_set_rate() on byte clock and then sets individual clock
> rates, like pixel and byte_intf clocks, to proper frequencies.  Having
> CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
> clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
> and align with SM8550 and SM8650.
> 
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Fix for v6.14-rcX.
> ---
>  drivers/clk/qcom/dispcc-sm8750.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

