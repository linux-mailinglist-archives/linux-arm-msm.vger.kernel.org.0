Return-Path: <linux-arm-msm+bounces-23714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 220729135AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 20:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C40DB21743
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 18:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3DD38397;
	Sat, 22 Jun 2024 18:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zVCU7IF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758CF3BBE0
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719081532; cv=none; b=ZOxcNPuJcuH4JPJ0RfOle0pia3qDAiWdTui/6fjk11ue7z143fwRLpgWyj5kpr+KABAuI6xBVvDWbIZ7EDI1HHexG6UZ1+4+yfo+acu8nD8vLUgDt3j+Gj7ADOjyde0KrXmBQt1VXtBZ42CCRtKbiOZIBs/Y/ZSHZBxvlxauyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719081532; c=relaxed/simple;
	bh=eKSY7iA1dK6kJuYssYwbw6aV5AwOfW5tqa3WM0e9Pow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSEh8+aiBDc7bBMSJxKFrWTLPEZkIpgfHhglugE6Rni6y5wOexkTpBs2/gwQ/4QkNnSw2bVIldeJc7ZI4GN35g0LBf2MqAKz6Jvw3kcMn3YAjLyzNoGc0VezXfk/dWnq/oJWzdLPx7D1zCWFkm9VRh0cbbcT4Xcc4sTuJnDQiL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVCU7IF8; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec3c0dada3so38982801fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719081529; x=1719686329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XsJSKrhXwcm2yba7E5HX5qGoubHmUX2L5c9+i3qWphk=;
        b=zVCU7IF8a/bVMmcYezFcX7bIaxrOeb8sPETyqZFfBn41HHu77rK08WlgsKVEcOSOBZ
         g9ODixoXZFbkhA++N9KOsTzsoQaCytfq4sSyAD/CP/rUV3MzCRbN2880s/wGJD0CIomN
         +mbTPtn4liyREUlh8nzRjfz/6niwCxmzUP0xpr1dZS4zudjn1NrSC8fXFzzHIotyUKAi
         olgSY9Jsq810PvEnopXbitAirJhxYuImKkWXphkX7lW3ocDA9g2AK6ZligvXTqGWxvdL
         V4jUmk1X9B+hYlUIcPPEJs3zAWptq2KIaZfMN+YcQQFChZUUHei2Fgfwgwuj/70IwuXQ
         KRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719081529; x=1719686329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsJSKrhXwcm2yba7E5HX5qGoubHmUX2L5c9+i3qWphk=;
        b=s7TwohQ2VeWGhssqW/3SM6Qag3ra1r/CoImHsx3c7DFJxU0M/lthKLx+nXfIs1swsB
         A7jqgyQP4+alzgLU0KQ4rmp683WjrtA9JP5l/zMvgl0FjkveQ24VmLchUNuN10qMGH/8
         4KqZs87oMWcGWp0Lh165RddmIjQTtUjCoZH2c4UPZ8XnvO3+gFk4tfsA+pqAqoR2HdGG
         cusABIj8AkJSUbysYbZbuVIiAqdX+fD4ZwM8kbnxlud/T+aZ+AvZS2mhooLhCeeHzHr7
         hieG2sJrekfE65z6XzwdFVQIES3fBpOiQXe3m1J9Rh4wuPXK1jW4AcdkaP4+rxBnqgM7
         xBVg==
X-Forwarded-Encrypted: i=1; AJvYcCUW0/F1NLz9G4a5yU7uanpeVH1ruvBW+6yTyI3Zxv1JZ01Lvl9jvjvLUUNkEC5dvnXOhoa2MPi25yzNBC9lbLlhfzRdPVHXL/euNj8H9w==
X-Gm-Message-State: AOJu0YxewvF/9sIKVcZwJtvUUyuhP8qiZ8hWF8/LrLJRIypl3d1UXoh/
	BpDxd7rvqrkyUrQJKBDcuk0WhwzRcUNc9Y2NWttv/bVW8FqOBzVJPRw4WU6PyFRGy5VygVfuIhN
	M7no=
X-Google-Smtp-Source: AGHT+IGqcGI11MWIfY68szD5ztVc1o4rd7pFp2twsqj4FUSE4E3dSVNIKwV1+jMYc1r2GKjj/rspgg==
X-Received: by 2002:a2e:9ed7:0:b0:2ec:5922:920d with SMTP id 38308e7fff4ca-2ec5b36c1c9mr2988801fa.51.1719081528501;
        Sat, 22 Jun 2024 11:38:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d758224sm5073161fa.96.2024.06.22.11.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 11:38:48 -0700 (PDT)
Date: Sat, 22 Jun 2024 21:38:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alexey.klimov@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 v4 2/2] pinctrl: qcom: Introduce SM4250 LPI pinctrl
 driver
Message-ID: <mzltplcf2p6aadrxorazl7xyir23rdhxpbenvldbtlc45bqovq@sze2jt2o4x3n>
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
 <20240612-sm4250-lpi-v4-2-a0342e47e21b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-sm4250-lpi-v4-2-a0342e47e21b@linaro.org>

On Sat, Jun 22, 2024 at 05:49:31PM GMT, Srinivas Kandagatla wrote:
> Add support for the pin controller block on SM4250 Low Power Island.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/qcom/Kconfig                    |   9 +
>  drivers/pinctrl/qcom/Makefile                   |   1 +
>  drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c | 236 ++++++++++++++++++++++++
>  3 files changed, 246 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

