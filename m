Return-Path: <linux-arm-msm+bounces-8349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C483CF2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3651F26763
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EBA13AA27;
	Thu, 25 Jan 2024 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/LggRvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516A13A27C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220704; cv=none; b=Pn9uogGQDCBPrb9aRkZZAjQv7GqqOc8BwhL3LAkbjOY8Hl0dkDEdcT3LfLnEDg3FKWHYGIBZQGkpDlMUj4J5sRfA0uivmUlVpByzJvHlRxnm4n6wAq4dQNTYm3sh8Has3ZXWi1aVQKfMKNmVn5JPYDEO9cQtqn1YFKCU5Mf7Wjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220704; c=relaxed/simple;
	bh=DbrULba5JMpUHoRfF0b2ZW/wUZBr+NdaB81g1Az+ZwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvmj3BhR/bCiDaN6/pQOqQUnKnze+JeEoZq2zdo5nK1YpgAX1RYNbCdyELZB1fVYTFuE3s9IQrOnySjIsR6QjXf9BSW4twHorTqg9tn/RC8Rx0KHm8vIwO9v9rG/zoWVNFVpR7qTWgeTeMZWu27/M7hnChSf032KcNMNOVq4Yew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/LggRvS; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc226dca91aso6901727276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 14:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706220701; x=1706825501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xLMcToKhdmiwb+Vgm0ASzJXUITbFWiE3/ITy5z4WO+Y=;
        b=W/LggRvSCWuXdK9eWrjp3B7WDHlvdrpo8hU+xMznLtEIyxmcbJ2x5eqB2uyncxAHt5
         kIO+xZfYPWClzevogWGF8FY2OObj9b+T7WOvQdhtSyrSj5BmwvtBTB0U0yDwc7o7488S
         RO9VAHWs9KreOkYP7nnAZSe5ySVe1gValr97KdrUqZF+lXOhcg6hR0J7UD1WV5ovReO7
         xvlsg1oA8kHDSdTZPAhF44qGbpGe7CFQRxxWRfGhlB6zAXzp/XmkH6jkSX4WIl1IAkLm
         2ju2HbMAYK+u7+dr8NfeWXUnv63rUxo6Rq2AW7QeoXSKBLRfVzUJz5cPxgMFvEbRrJNM
         fF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706220701; x=1706825501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLMcToKhdmiwb+Vgm0ASzJXUITbFWiE3/ITy5z4WO+Y=;
        b=vpvsdNpTKhPQvNglnl0nBXD/PWZFMPtfycjyivmkQkrrZcGHBWYLgNJzPoh3v72yp8
         pkcTB1GYyYxnne9UaH7bYgTrPm5zWQ4vLeWiNvtJsQJ/0U6E6Ts8lwy8rLNMupxuA9V6
         3KUmsehchxT8TJVobzPJ81QweGZ+ehHVHN2VwA2dSLc6skla4zUhsp5j9kouXAUxzlhF
         fIcl+HAUYf28Z+EOqJIasoAJ2pa3cmUWjyjxTfq4tTXpmDPPhXmcrPMMTTa2U+rvD74G
         +WaMlhtzx0aKlE4QUTd5G/U1S9FuC2QzwX8fz6sUMBAdgjeACi8zUW3yDoPB26BZRv/O
         F2VQ==
X-Gm-Message-State: AOJu0YwZjKS01O0FBizHAIU2geVtWrdst8FYIMmAb9bLojvWhffqqEuM
	iQ4kLZmO2ILy2sndp72QPZp7Cg9nXd3ZlTlXGna+jgh89ZWnA11BrOT9wacZipjwtdS2xkgDa7/
	6WMPNYFo70YljDlZ10Ve5v2+Je0zsY+3HL4cTVg==
X-Google-Smtp-Source: AGHT+IGyhYkUs57iPAfgqwjJQmmq3Qlba1EBKrI7ojK1xvRb2h7JC3m/aWADVmXJGmcqgLz60U06quUiTM0G9gFNWJw=
X-Received: by 2002:a25:2e07:0:b0:dbd:5be1:1768 with SMTP id
 u7-20020a252e07000000b00dbd5be11768mr471772ybu.73.1706220701308; Thu, 25 Jan
 2024 14:11:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-msm8953-mdss-reset-v2-0-fd7824559426@z3ntu.xyz> <20240125-msm8953-mdss-reset-v2-3-fd7824559426@z3ntu.xyz>
In-Reply-To: <20240125-msm8953-mdss-reset-v2-3-fd7824559426@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 00:11:30 +0200
Message-ID: <CAA8EJpoVxyX-cVggL2RJvM1eG+XzF_kkgAsKdS8ybv7u_MAyXA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8953: add reset for display subsystem
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Lypak <vladimir.lypak@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 23:36, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>
> With this reset we can avoid situations like IRQ storms from DSI host
> before it even started probing (because boot-loader left DSI IRQs on).
>
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

