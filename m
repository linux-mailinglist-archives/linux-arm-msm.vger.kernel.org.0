Return-Path: <linux-arm-msm+bounces-43174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1529FB91F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F5337A1DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176FF14A0B3;
	Tue, 24 Dec 2024 04:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQcM7Z0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B42F481CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 04:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735013823; cv=none; b=bJiDFpjnkjcba0/dTYFHN8VutGV1xXZpiED9xf5PkFdHVv1rBR4KE4k9ar7cE1reokH04lqt1eJ/embiVNAxNsAEm40RIAa69xVoJZzOcoHxOmWd6F4S02Of2HerWhWFUJ/Q/c4RTX9oZfd9dAdZab5T/bzDoUIanzy9fEyDgNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735013823; c=relaxed/simple;
	bh=oIie33HXjEdQse5G0/GhL59JqBHGqG/Osu83u0kXaIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W65ncDRiU4wXIKi3Ze2vBmSUhgQJaloFBMOqqV9k9BYswg7Xp8s6CLCmA9TkK/YSq6siN3x6UHZ5rzGnk68BOjqB50ax1KHLbB19luAJ1QlminzNPXxfU+KJ6SSfANdk5xobcQHTdAGFRkoloFwPLb8e37oUM4j98Nks32x8OlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQcM7Z0R; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540201cfedbso4883829e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 20:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735013818; x=1735618618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBqVAasc5aaOLoOz1GUhccnE1y4WdkWmYtGpXlXBdiM=;
        b=vQcM7Z0R+Ht5qSL8zOpmGaJMwzjHbWEzawfMsCOWA03IHeLdMv03MFb/KAoy7yotdf
         gEcIn6pxZTfwSNqrjuZm01kj8dBj/ThS+WYgCz75bhAD5MBUr3GKXmItaKHmi0W6ILAf
         5uJS0vqnl9z8WrGssVI9Bi5hQfHL4NfElE66/ImnnVkq4lZKcZeez0Pt1Bcljk9wZZf/
         tOw53EgtbCdDPvBRSJ2SFZ1IfFgw6MIX11dr2Ibd7uNSEFp27QexaldLVVeyCZja0sTc
         tz24ry/UtF2jzmsrpDn6A97c5jyh6CJKRy104baAAXL1heyu7NCosbDPlaN6yeXYW1Z2
         M8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735013818; x=1735618618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBqVAasc5aaOLoOz1GUhccnE1y4WdkWmYtGpXlXBdiM=;
        b=CqWhpswT7Cwk0/0Y6ZHT2DQZ8y4GiRFIw8x+ZAP3wRCnBjQagmxTP8+bfxKML0JcqI
         DEKSNyEQhCDNq4r6Y/xNjxqTU71QlRuWrNxSwWHOJw6esSg8/R+6KD55Ihlb6szAzbCI
         jvzrmiYXB5deJeJ8XQNTK16n4seWOMauR88473Uaq8GdJti5eVNg+onUkUWR7LpyciX8
         sz3x7Tdo7vBbXDsmzKMB8bN96WOx9ku7YRIZBAxAvjVRrBcMc4MTKcKkduOc/SAUIUTs
         SjtAolgOU53eXfQxoxfy/6Fc/sRM5uRaw1CKt6TdnuicwLf6WG1Ur+XrpRKWHe1nim4O
         V7cA==
X-Forwarded-Encrypted: i=1; AJvYcCWEjMrV8rtCpf/7pL6nTKBO+irfpzl0s57lmzZozhwYhQi2Q5I5Y0RYFCXMlY4hSNHR75tfX0SjLLi+jcpG@vger.kernel.org
X-Gm-Message-State: AOJu0YyxkzdmWbZ61wj9AfbA+q2MBzlu5/AWmNYNHakeuJhqWR+EnpqZ
	e7mXYRJ/PrtaBWd+DiVVvJyO2e2ApKmSA4rQHuc61VHLHhpDVgIIC7bpcvmiC0w=
X-Gm-Gg: ASbGnctwdQ8BeAZhGtEBttAtggeuWbJtGiNaZpsSRcG93GUUizhSw4c1ue95Uy3ViSO
	5X2lWTLskqZVzz3pn9xosdWOWAiBdfH1CQ6xUEyBjVEwavDDp4WQB40Ta36ZyrtFSf4AvC4WuU3
	OLbR2khj56AVQdQlHLcg0/jGqF/Dx8st9TqXBduNU9TVXjx2vtFKiM5chhjFRrkbRzdlbcSSASq
	OjZHaKIURabzNAo52CijHkd43pN5a0jPpfd6xHj/QTb8j8TadsTwFI39/m9di4SeNoQ8etfQdwL
	DOg4z6dSS5xeeTGNen21zbmIZdjb0GeSS1mC
X-Google-Smtp-Source: AGHT+IHMGmYGMF6q2MDHua7nxv0GhA7FnjWIVG2kKpKZJ4CxXoTwmdLNVjxPUwAUj8j/ub8sXpIJFg==
X-Received: by 2002:ac2:4c48:0:b0:540:3579:f38f with SMTP id 2adb3069b0e04-542295821afmr5451612e87.37.1735013818146;
        Mon, 23 Dec 2024 20:16:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238214b5sm1486186e87.187.2024.12.23.20.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:16:56 -0800 (PST)
Date: Tue, 24 Dec 2024 06:16:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add standalone ethernet MAC entries for qcs615
Message-ID: <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-schema-v2-0-000ea9044c49@quicinc.com>

On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
> compared to sm8150's 2.1.2.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
> Changes in v2:
> - Update the subject for the first patch.
> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
> 
> ---
> Yijie Yang (3):
>       dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
>       dt-bindings: net: snps,dwmac: add description for qcs615
>       net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
> 
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>  3 files changed, 20 insertions(+), 4 deletions(-)
> ---
> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b

Which commit is it? I can't find it in linux-next

> change-id: 20241111-schema-7915779020f5
> 
> Best regards,
> -- 
> Yijie Yang <quic_yijiyang@quicinc.com>
> 

-- 
With best wishes
Dmitry

