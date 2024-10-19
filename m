Return-Path: <linux-arm-msm+bounces-35134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E3E9A5061
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 21:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88881F255CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 19:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1EE1917C0;
	Sat, 19 Oct 2024 19:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRF6iv78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AFD18E34A
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729364443; cv=none; b=bDHlvf23ZyXFPTM60tpYenz1jlEqbswJBJhZQ6e7uRY/96GE0LaOP5ZoxNYB1Jx84jy+gzheETKRJhpRQDTSeiS34BN138gPm8KatOtAx1LAGAcPmDJGSnyTGu/hF3jS4Om49NHPe7F+Rfu/V6tcIDEdyYYkVVhnNZwEJkSVKm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729364443; c=relaxed/simple;
	bh=MIAD7JgF0HBgHBvWVpugAQl5MAa1XFs6QGR0UZkQ64s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezZpsFORD7KjvO5Trck1qtneYlDawNuyg2JSBVl/B06GMWADoE3TKU+yeBjToVWdDaaAGgltQXclGsTTeexlqa7+wCEzRDRQjnmFZLlvDBjb7X8TUIpcCOx5c3agKG1Vvec0SuXC6FPu9TM/Wqq56u2uWsxz21/TVNg+TRb01Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRF6iv78; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so28491961fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 12:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729364439; x=1729969239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uNoRSBrlSLGYVcS4OyKSyfw5CDybfrq4Q0RhHan+USg=;
        b=mRF6iv78dN3SNxh6LLSXx0cMovlEXJCbtW+txy++mEakrUrUB3NurteigTY7QK2m2a
         PNN48azkorhALqMGOnq1dIX1yRvG1nej/RavnlQaFs9pk8wDRK0mj3BoIFaXYJgLinCi
         lLA5PsseuGX4WgSHtG6RW9XdqgCTO3VtfnzE0CESJT5LLmj/4KZRC9bvb4S9bHtpuvSp
         yproRVraeYBdWnlKelokR5m1fmdxC+eFqTVvfwb+Mf27QalY9GG8vIOxWyyNBdR+uibU
         94FV5DjP8NQ0Z+MTCQonfG1XIBkRkFwHeNgVkuLLbFdUOoiNNGHOXxw7VXxIqE5PsOYI
         otCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729364439; x=1729969239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNoRSBrlSLGYVcS4OyKSyfw5CDybfrq4Q0RhHan+USg=;
        b=mhrGFnbUTz17Hg+jVeJR+WDMKwEusHXFV24sSOfo+rjIhRFpicO7XJmi6v5SwDBKBb
         uZU1410f85k2qf6eAoI6NeuLga8H23w5gLtQZdTJPdK8nSPrxb8IX+cpWo8gKfIC2wRo
         cj3hncFAWNHjaKzvNBs3mwh2vwOF2nk2esoOUGSWM9Z9M/C9/UsbZKVNooe3xUdNqudW
         j1+zVaA/5hHcuBvwZ5v599epPbQ0dv2qLW4aTFHM0XU44vq+D4Qf/qf5U5g/vGsNmbHL
         MBbDOUAltqk+fXQe/kGKK/H8Blmr6KAL5Llzc72BWKAj4wpwJSfKtXxTa90CQYGmte0g
         93Aw==
X-Gm-Message-State: AOJu0YwU9M/q/TaZ0nvxpgiCqteruwnsxuyWiBpz+uPCj2Jg1DwiIgZ1
	Tfcvf+JEu+lt7tldREvfzy8or6vww9Ggd1IhVJaj6QifQUfNCDkdT9DYVQFA0wU=
X-Google-Smtp-Source: AGHT+IE6MUTyir8Z4eEyL1oUXCZhyfNxzX6K+hCI5xLa2iWZAUDv7GmUKOvy76vgYoRDYqDUNjPxOQ==
X-Received: by 2002:a05:651c:551:b0:2fa:c913:936 with SMTP id 38308e7fff4ca-2fb82e948c6mr33158901fa.1.1729364438888;
        Sat, 19 Oct 2024 12:00:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad6078asm199551fa.30.2024.10.19.12.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 12:00:37 -0700 (PDT)
Date: Sat, 19 Oct 2024 22:00:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qcom,qfprom: Add SAR2130P compatible
Message-ID: <ig2xnut3wdrxeyfbejbq5c4yvoz4cxigbkbrnnymr5hsa4nqxj@wbjaypzil7lq>
References: <20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org>

On Thu, Oct 17, 2024 at 09:18:10PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the QFPROM on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Actually, I'd like to retract this patch, QFPROM requires additional
changes on this platform.

-- 
With best wishes
Dmitry

