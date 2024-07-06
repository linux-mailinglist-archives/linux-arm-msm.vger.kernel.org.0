Return-Path: <linux-arm-msm+bounces-25422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE13929521
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 21:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD1A8281581
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 19:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B821CAB9;
	Sat,  6 Jul 2024 19:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHRX5ROp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89DE57D
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jul 2024 19:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720294741; cv=none; b=NFN/EP4MJruQ7BvgPGm6SY+d/tytltH7tmVJkyPE17wEhrZaJw61SF02/3wGEQgtBXkjoyzEKMfTuGGWOZvWyesle87aQij28vaby7F3aII9mPu4WocF9JwWIUMizafcm4snyJD01FFbw3bA9/t9yff1DEvtXmJaQDVELcgGMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720294741; c=relaxed/simple;
	bh=OPOWJ/PnTpzgX3IqYod6tuxMqbj4Er6k4H6BmWmpzjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocokoT4PvvsvsmHdYPASmJrBa52IHML2qegP3Uj/wnolLGd7mgkADyY+O6McAdGx6pyD5VYEL9lCVbP/TqxnwoRljqS4S+CdemPbnkbBFRUdPgMdZx/wcxFaOHjlKIP84iYU+fTviYzGZNkXqm7YD2NjfQi+oGuxsbzXkmRxPkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHRX5ROp; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52e9a550e9fso3242873e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jul 2024 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720294737; x=1720899537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WatubwyZ/r4ukIgXZJDaq3woxYHO5AHxba4LxGQrhKM=;
        b=xHRX5ROp9GHxugUzeMmr9LoViKBs5YbVMeA3prfFFxML94dONZWrlxv9gcJksjuwdY
         eyPttGcMr7rCZX0fX7NZHs/Zsfn3YF6krGFd9b9U4CUEeTmi3/RC7HxWnBuWNQbGpqpT
         e/ugSYag+c9TWsRQ3lM6ZoDVPrYXpcN0iCXHMVEvqOiXN9FwsUXrISF1pDyft21STiTP
         ompH4vweYfsChCCS7orDeQxCiGABRX5QkuqCi7ST0FSKctHUpwTp/cN1W153CBgpfLWY
         0Os2uIBwyHQ4i4LecVvq1FoGHrWOlbb9KFHNWfMYzrcx7Z9+5d2egNJZPLglubJvtfy6
         4R7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720294737; x=1720899537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WatubwyZ/r4ukIgXZJDaq3woxYHO5AHxba4LxGQrhKM=;
        b=owkaJDuu9jrrsHRpiFIBiSwoxZ4BNZ63rcq7LNFWsVjLI8wrGqCoGWhUATiHcXUMpV
         rJwHuWcha3sJP5+6GLRwJM2hiPvnTCTFbeG6qJy9EqPlGRaJms2k2ttyQwsIfXtHl2Kq
         TDaOW0i0mbAhcRfMtQ2zmTgTH4sfDGL5VKmN5KYx+etgsexssjic4QXeoRFNL8hYjFwa
         AhlcbbRup+YbTwCvuoOr9wDpUV6lAB9ZxNbTYmW8F6yKe6im7eBv8rpuNMgIzWmGoO9d
         X+OF7AG4xHvvBFoPv/AQ24tzw/QnjV5RiRaVBYxd+HqLDtZw9MGmAI13zc7C4qPQrYWD
         sQbg==
X-Forwarded-Encrypted: i=1; AJvYcCUpeK/mPVVpSHvx4J4Q7hnXPUcL2JOPfZu9VjEVJu7mIGKxbt59KMj5qm3qTnUO/ustdP1Bbl6YBRooFtWl7a3/xk0YbPosOK4xIK+xVw==
X-Gm-Message-State: AOJu0YzMIB/YaNtXAUOY3MRqeYSqxxSfSv7+ZyGDpSnu1w/I58keTWEB
	X1m1jxjXL8TuSdrSXGZVkn/49QX/mm+p+GdDimJKT/rOvzcz6aO458ItPL7YpdSqZhlK8zlhApo
	oohQ=
X-Google-Smtp-Source: AGHT+IEI75PJF0Zh9sV24P1N6y9M64LfJqDS6iL0646IwVtjJwYBfK5K3X//XTp3KQetTOwRwLOdGg==
X-Received: by 2002:a05:6512:2082:b0:52c:72b4:1b24 with SMTP id 2adb3069b0e04-52ea0de3c2emr2074775e87.12.1720294737361;
        Sat, 06 Jul 2024 12:38:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ea0aaeb16sm803258e87.309.2024.07.06.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 12:38:56 -0700 (PDT)
Date: Sat, 6 Jul 2024 22:38:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: apq8960: correct memory base
Message-ID: <mbiqysel6o4sedqdugo3rqjcys2bjwgspsixf2g237fkw55kge@lcebbrtnrwc5>
References: <20240706193415.218940-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706193415.218940-1-david@ixit.cz>

On Sat, Jul 06, 2024 at 12:34:07PM GMT, David Heidelberg wrote:
> Bootloader will provide the information anyway to the kernel.
> 
> Ref: https://github.com/msm8916-mainline/lk2nd/blob/main/target/msm8960/rules.mk
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

