Return-Path: <linux-arm-msm+bounces-10006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0624B84BDDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 20:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 262781F27C1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D8F14AB0;
	Tue,  6 Feb 2024 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U40jFE5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC5F14294
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246393; cv=none; b=UPzRN/6ya7wl8pOShtdc1CITmalmAouqDtn/cKcsx5sEvWautcET0TcKijkZIHWyyrlpMT3aAc55vF7eDXoapf2dzUvYo4jINqhqiTLPLanPw0h/oS3Kyl5j0u/MmfDEywYAvyeeRgIPS+bs6sI1ZaiLxc0aGxjNel49YDKGOOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246393; c=relaxed/simple;
	bh=l3ivtluzGMS+UFOlURuwHmNGsbLlLoybUWlfRVn8wf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyigEPgTpXFsDn83YQqb6yiVaGgIkAbaNn4givlFLE5giB9LzUHMLqEmVLHKz+u51e6ybZ921BGK39RYqJ6RYzHwC2GMFtaO4gCmKokKLeX/3x1rD0scXegCjTEEJtvP0NoKHE7dIjmX/IyyQjrhUzes8rvuRC2h1/f2kynogBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U40jFE5w; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a30e445602cso202107666b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707246390; x=1707851190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi6y8i9DoSg4wDjsc1n31h89s4NUnmc/xGQo5BVmiac=;
        b=U40jFE5weNZapjqbtoA0OiOUF0+qo/fRxpvHhoIs844u/zgIsKh5cERSYCtQCXDClh
         Dao+IF64kOpCEOPID+D7L4I3hfpBOmDhVezjs1r0UdJwWGXkgEJuLWgtMJBAkud6Gyit
         8cpo2d0LmS1b8O3cA4sfOISINVEBpz93cIjNSokXuH0quhTgopJ0YGmZEmuHa8pk6tTy
         uNj9mWWHiKmd+QKEwXLYAfPXSYNNnajtiU7ZpcYiqPwHEP0fb2JSIGylbwUiDKQLJ5yd
         fv3v1DPyX9Z0Xx/YuMFAA9QNVgCQy8eVmbC8UYZm4+SVvJi3r41Ks+XZoINElfruJauJ
         6/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707246390; x=1707851190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hi6y8i9DoSg4wDjsc1n31h89s4NUnmc/xGQo5BVmiac=;
        b=lblU16liXrkPoAQp28BWFgQ+V3sSVae/ws1DkKQDc5UJ0KaufJ/eS6vCRDX+zXsCxO
         RzE+FtgIlX4Cg+EVlKOsmppt6nXwajUenhYOw0WRzKfqgoC9NU69aEUJQ9eF7Svk87R9
         BMoyW10fq5LnEIhNg8wc/Wca2172B6hna7fpvE8BIYQjyDkwBG5uCGeIlpU7xxbDO2pG
         mihQ2H1EoP+86jBx3hs3lXES9/QU+jpl0jkzCNLTzHclULDYNKty16GFyqwdELk5LeJh
         Nxt7ou1sKyQtAf8YzCbE7jnrGg862Zvz/YpdejGbJDLtTvpYlDhVaAnrMelyarGYs3Kl
         ut7g==
X-Gm-Message-State: AOJu0YzsUOYKfjwruUBf9t1M3biErqwrLVUv0ONhl/xH7X9XnBqY4Qf7
	JpkKtYHY0kq2Txg7kwfToHwrjmuChEwwCcpqXWCiA4Ev8zccTj5icwsPCCCKKsJ0Clt2/Hq+06w
	I
X-Google-Smtp-Source: AGHT+IHT4+/eAwSKoDadylPUBsFyAu60qD2pCoBHHzueqaAaRzRLGW/TECKr0o+s5WxLb0EZW17+fA==
X-Received: by 2002:a17:906:c1d4:b0:a36:dfa5:69c with SMTP id bw20-20020a170906c1d400b00a36dfa5069cmr3709786ejb.14.1707246389882;
        Tue, 06 Feb 2024 11:06:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW0zKcutm2hosz8VAiP4Zn9wjWU+bUQ1stTv9FpXE16vcojCwrAHbTboRlCQ4UNfaHkOGLE97qkQzWwE8N9JzzJVIq8wNgYugOxUc4kEJOES7okF8rSgcNDxCHbMi74jq1WsrvIJofoMFP1vrdxPxP7x5vq6aJtJJm9w7L2gG5I20/cSuZ7/pHTYC1FxyuudHRYJmY/3iMRGMlP2FHG96cifw==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090619d000b00a385535a02asm224018ejd.171.2024.02.06.11.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 11:06:29 -0800 (PST)
Message-ID: <f98d925d-920c-457d-b909-32763a42f5d6@linaro.org>
Date: Tue, 6 Feb 2024 20:06:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: videocc-*: switch to
 module_platform_driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
 <20240206-clk-module-platform-driver-v1-4-db799bd2feeb@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240206-clk-module-platform-driver-v1-4-db799bd2feeb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.02.2024 16:25, Dmitry Baryshkov wrote:
> There is no need to register video clock controllers during subsys init
> calls. Use module_platform_driver() instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

