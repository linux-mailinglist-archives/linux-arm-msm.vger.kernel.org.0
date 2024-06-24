Return-Path: <linux-arm-msm+bounces-24001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F5B9151D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 439841C20A42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551C119DF69;
	Mon, 24 Jun 2024 15:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5HhcE4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483AD19B59A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242129; cv=none; b=JlxfAg2CwNWFB11qqe/WtNt+06WNwYmAFtCWOc9ot0t+TRt2yieHDItRlzOxYrL2IWhn54PovqmM+4DSD8RwPvTj7y/Eu+EOgts5S+nlwebaldAgiUb8ymCWhi4nJsjlvRBPpAfMog1fqzGzDVo49Qw6XbCnE7EWmcZ9pw07GFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242129; c=relaxed/simple;
	bh=GAsy1hrmvNMsy+al1UKDpEJrsqmugZd4+qdldQYyXSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qzt6e+5GIT0KMJjmb8Qk+qGX1Lm3S5WrMyazpJea/4uVCP1cfJSvFThizh98sZtT1rbWLxK7Ecka43vbB8vFdDNHMNl4ddxDwowmf0SYgAPooGAmt9Du/OOUPQMCchi+OR2aQXwaIw7OSBv0a7PF9a1dXsoI6om1pRiv6a+HkmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5HhcE4r; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cd628f21cso3488290e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 08:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719242124; x=1719846924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gDB4H9hEb1ddKk08sFFh7SUVmxRRs8hMx/zYwxqCrw=;
        b=D5HhcE4rUbkgNTrPuWdRxMLlER6URmvc3dLoO6U6qqBUQwnNhdG7kSwtyAt/NQhF1C
         QExawB1ot4Y2idWTFDFCKFGRdFZuJgiuIaE9ztLe4ypsdUIjltLvofV3oCz0uCoacJLF
         ml9Tp0ex1SJJtM7P+KA0N+Kqe7N1OJkwo0WzqDDrUz+0ewnxMvn40QnIAzK1Kqa3+aJL
         M2Ki/dSRqgfgf/0qlhga0fPGrnQCHs1f2ec/omb3UaH1VXN3/Z34uVVvznJAdT3XZ5MR
         wvUGILo5/ZhJhPT8P0eK2jYrwozzp9KjKg7U4GcY/8FFN2t8Hn04QRr2ONMH64VitNtj
         HwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242124; x=1719846924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gDB4H9hEb1ddKk08sFFh7SUVmxRRs8hMx/zYwxqCrw=;
        b=Q7rQJbuqxEL6ooeo79yCeUThikdTC/t29V3sli0LQgSDOYASmq+jVzOHhTWwdEvkoR
         2Q6bzyBV4nSGl2dkt7QVqqXWSJWZsSSJfNeVwgwtoekL4xuBqi4yA27LbdYRoaBHrtAv
         B9XMWVTc2nwEYfg+AgHKnSFCqHrsuw/MQygRVtEf8UaqJAnAnsZnafWDXbGhkXoyvRal
         apUtayZq23iUdoUijfyRsFEnCloY2gsZ06/9+Vc/tsqR8DcwSYFcRf2zXlfISDjSUJZ/
         S/mlfvHrOL0267QGebNrCTRL+CrggENaynCmIf6+koWdTiC8YW450Wh0ZHk+hNkm+hdK
         oRvw==
X-Forwarded-Encrypted: i=1; AJvYcCWc5096OtAXMAPSjToil4/t1STnNlikQbLSB2GoxsoAFuajeRIqe0woiK067I4S4A6+vjp6kb+0jSyEt9AtoWZV/jiyxUBpf69sPpLj/w==
X-Gm-Message-State: AOJu0YxJE/ziFpn/WANN2/iPqN2FUtD0paBHf0ZO4fVBBq4hQ+gqxE2J
	mW8FTzC0xE8JgpXYvMeN1IxK5fEngN/TIGnMksNI/5MMnuG7WRC3DPnV2/i7Y90=
X-Google-Smtp-Source: AGHT+IGewbbtNYBe9HGO4cnqDGWmxOyzFNvsNZLeojJsAjYmh08AcYDCbzTBurLxo6pTj/6Sf3tmPg==
X-Received: by 2002:a05:6512:55c:b0:52c:d9c6:f934 with SMTP id 2adb3069b0e04-52ce18356e5mr2814162e87.18.1719242124247;
        Mon, 24 Jun 2024 08:15:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b46ecsm1004471e87.10.2024.06.24.08.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:15:23 -0700 (PDT)
Date: Mon, 24 Jun 2024 18:15:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: x1e80100: Add soundwire
 controller resets
Message-ID: <2lnbogqx2mxgyn47vgnbp4ameydjq6ajuauklgzslmfinpmnk5@ez2sz3nyd3wj>
References: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>

On Mon, Jun 24, 2024 at 02:32:35PM GMT, Srinivas Kandagatla wrote:
> Soundwire resets are missing in the existing dts, add resets for all the 4
> instances of Soundwire controllers (WSA, WSA2, RX, TX).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes in v2:
> - fixed dt bindings.
> - Link to v1: https://lore.kernel.org/r/20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org

Thanks!

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

