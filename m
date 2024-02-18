Return-Path: <linux-arm-msm+bounces-11612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB08599B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 23:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B34031F21B59
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 22:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A52B745D4;
	Sun, 18 Feb 2024 22:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ArnORYKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B996F07C
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708294267; cv=none; b=nuX/nGy38DK4L09rbzuF8qQ4rNAJg5JqlKH7edGQXNhCiNRAvDOd76z4MKBsohQ/Ix7DjlaVEvr9QyQxNiqgc89B98wEMnzHG4w1WhqWu6YPUyht8y0zYVOJrAt3wSxLxoD9/Tj9EVUiMkgMnos9yB9MBtTviZJ9AzTvZF0QoYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708294267; c=relaxed/simple;
	bh=tvvDncg1WI0//tRyUMP3lqwcPgPfZh9W8WMZ0iFU1aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUQAcVL8fGkA2Evxga4fTKFUDe8lEhMi5tppwWA4SRRIkCzwQzkPQAb7TprM2ohtBVWv5lEjcWzuq5H6xnYstyij5HU3637PJtmtJJr6Vv4FYOU74VomwRE27SYV8hq31wOOXFwI9lvNHd2kVKu7jt/l8CWeGVQPzfRXbexquzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ArnORYKH; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6082d35b690so3578367b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 14:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708294264; x=1708899064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+AD8w89s+gvj0mKYSTbVikH3rVbe83iTAnvtx9TnsS0=;
        b=ArnORYKHXrzaDsxMqqx5jIlOb8lvmgFQ8BKGJdwK30BLj/bJ+ic3X7Lf5mj7SjN2oa
         bAr8nRDPLTdCCL/GJLHMLSZ0XbYm57Tl8hzGkrXmlJjLWdy1uTpQ97DQ5kzVLBDu4K4Y
         /coNYyFv2/d4cRtP4XtcCOSOsNY5HIbzsnGcnlnV/hSnw2YEMKTyV7AjyeLi0zr7WApa
         EwYd8jbAT9pdP8/axTwlJJu/c2oD5ePgG62AmELCmsVsF0ZaltSfDltXbhQS2bqqyqa6
         TLqrrvsHoDAadG7Bsopw245mOtQ4tuDEoYPDIggAscpRNjZVgHI4SIqj0u2qncC9lFdX
         gtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708294264; x=1708899064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AD8w89s+gvj0mKYSTbVikH3rVbe83iTAnvtx9TnsS0=;
        b=Ok9UYtvIC6vWyMvblHNmEJ5w/3ObkWE5IXcH9b1S3cwsrvwqMVXmFhe1JQYADG0Vgo
         IeybiPt3ZhmAx1VKX4k+r60WmhMK2TDOffNtL4dqhMmEuWX+6iAiB5yi3RLZj7nXdtau
         zq/KnLlBb87s1913B4f/Eee+/pYOBPq4z8ZaMopJBQa64SLu9nJuaOfXaWOXfpolvwVm
         RUf2sAoddWb+HXEWOxqyEreY24WCWGSz6Bl2Gt9mX/D+1clkNghKA6hVG3wppmk37W10
         bePMzp00yi13QWkICKroyrkfzux5NoIdIdgkVjmZqpiFhJFYZSt6bq4NwW9l19YKRr4k
         UnhA==
X-Forwarded-Encrypted: i=1; AJvYcCWXuiPogWb68IVzlKThtNwjdMqVen7Od8VivC853w5aWpnWeHqLdZQ6apg+3ktHs/sFKXFfCGB1vXMkzbSKmME/BtQ1gTU7IzhKpVoR6Q==
X-Gm-Message-State: AOJu0Yw88HtNAQQiPNldZ7k3plcjYp0jNTroyeLmyvTFYgfUD00W2BYQ
	pgSDNtHl8ATSuI9/pO7xMuRPs3RJCrICIv/ZE7rEjkBalqMahFVGj0bmVMsm9awNcXWkWd0nFeD
	VQ7GI4IJkDpgwVVj8pYkIPW95y1kmdYHTJxxKCA==
X-Google-Smtp-Source: AGHT+IEgg0E5u1X5ebuYXnJ++SELErkiGN+TuPyNky9IKq31ECZO7bB1+ZtCKqmUvcixZwfyK121qgFIcMfvjQlbF9Y=
X-Received: by 2002:a05:690c:fd0:b0:608:d1d:d8ce with SMTP id
 dg16-20020a05690c0fd000b006080d1dd8cemr4935951ywb.12.1708294264190; Sun, 18
 Feb 2024 14:11:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240218-hfpll-yaml-v2-0-31543e0d6261@z3ntu.xyz> <20240218-hfpll-yaml-v2-3-31543e0d6261@z3ntu.xyz>
In-Reply-To: <20240218-hfpll-yaml-v2-3-31543e0d6261@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 00:10:53 +0200
Message-ID: <CAA8EJppEyibLz3z4UQbTdR08332w0OoegbOWTz0QnD9rcRb2DA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs404: Use qcs404-hfpll
 compatible for hfpll
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Feb 2024 at 22:58, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Follow the updated bindings and use a QCS404-specific compatible for the
> HFPLL on this SoC.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Please note that this patch should only land after the patch for the
> clock driver.
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

