Return-Path: <linux-arm-msm+bounces-36041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 367339B1A68
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 20:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65E771C20EF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 18:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3125E1D63D3;
	Sat, 26 Oct 2024 18:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNYL7xub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B42538A
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729966965; cv=none; b=rEPe4GmwhfikcJCfA+CDA2d+wCLatMSbZhVvBfC5wWZ1ViviHZGgDLcpUOjV3MIvinLDZnKTu7kPHRj7sSc1s/JqfCGhvOCJ79h6BCS51sPBnzYAuAc/YFZm9i16SN6mUkpcxSPYN9/PYuNiqogbwvfmGF4crC2XQHDiWZ7e/+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729966965; c=relaxed/simple;
	bh=n7mgA67sCLDv7LoWKGSko2GKJr0IOHWllRJcXYWVWhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VE7fWJsmNaU+RIsqhQcflCTJJ0zzp8zW2/k9vPCA/lyzKLddON/tl/cuaV7PcBCF2GKDNwSLh69NF8mlOG7Acrf6aXJjLEImcxfUHjMdefYQadIP36PPRigtIUIdQCJZCiG8BEgul6BnzrJmTeTvEgwsL7bvRvNGwF7q+yAUvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNYL7xub; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e6c754bdso2775447e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729966960; x=1730571760; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WSP/VyPryBYvoapS7TREWTrIOwGrwP3c8PZiaT4KBao=;
        b=MNYL7xub9jaDCakAUni3MFhM/0p7ivVkkcK4kYl+ZftDFPi0p04iWPio/wTmM4FN+7
         Ts3x5p6oF57gWQ1Bh/IK6T3DTvZFDKAfBsCf8iMd9c0geMuLMJ/RXts2IM9idvZ45IFm
         fJxp66l+o+cBr9q2mDW/qf7eTFAhEweC0CFNN2B+02nQHk3kdTR/e5HaQdtITqfSgwnV
         dMaSjeb/4CvaFeqPMLEpuabf1Siac+n/n6xreMVVubVx450d78nFlApWnC/WfUG5Kz/V
         qZ1YGqQUAnNa2zXmTL3XNBaXGpvOadrOCkcZquKHmlPCN/1Mf8d4JXyP4UN2hoQ+4Lkp
         NYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729966960; x=1730571760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSP/VyPryBYvoapS7TREWTrIOwGrwP3c8PZiaT4KBao=;
        b=YhKk3Meas0A8SQk5v3LjV190VcP+Es6H8RinFlzEXZsw3YO2Fzustww8IdwAeS6fPu
         y/JX6E6LCKxA1Hshkqtn9Vk2SbCzHnlF2udLyRlXi75A4h6r01/6JSSNNDUe7sNwP+s0
         OLpTZUNzy99k+S44gWfbRyHYI7WnSLuPC2l4SK2YR9U591dGWikWwdCMc4F5zhPniGyW
         iKLTY4YS1aSowx5OONM3HHKrddf8Y3gq8Bvpasn78shL+e10S3h89l+4zDC4/ey/5eUk
         wuyzQYNPJ9VEMRf4Tz5Wd8EMl/hTPHQD1ZIPkc/zqwBGaPdy6BKABvm7iPPDpSjCkFYb
         ZVUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXsxa2KD8vcU9Q2MaiSVKfs545YnSCGSCn3zrTILftRfPHBYg/hdHvb9ktLBAEML++DwiZfk4bRF6Reivl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5VVUVtsWi4F7sVDbM+sQ+QV1b8nIRiLemfyucULcjAbc4Ees
	HrTHRiyatbrBvZVM6wKmJEfI3uBVsKz39hkiqN+PLKO5Gb9VQiVuAe/v95OLGLJE9DojsGkTdyc
	W
X-Google-Smtp-Source: AGHT+IHHDUrc6hNGi+o4QSGxJ2FyXrM6WJ8pfHJhQqbb+GQyMhLKPNZF3QHMsYfea5LJ2KDUVqLGJQ==
X-Received: by 2002:a05:6512:6cc:b0:536:56d8:24b4 with SMTP id 2adb3069b0e04-53b348c707fmr1031069e87.5.1729966960295;
        Sat, 26 Oct 2024 11:22:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1adb14sm566590e87.162.2024.10.26.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 11:22:39 -0700 (PDT)
Date: Sat, 26 Oct 2024 21:22:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miquel =?utf-8?B?U2FiYXTDqSBTb2zDoA==?= <mikisabate@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpuidle: Fix reference count on CPU node
Message-ID: <cxjadrf6uilgkoq3xaxekt3zpera65qbsdlhxosthpzgu43gqp@23zooyzmos62>
References: <20240917211325.639765-1-mikisabate@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240917211325.639765-1-mikisabate@gmail.com>

On Tue, Sep 17, 2024 at 11:13:25PM +0200, Miquel Sabaté Solà wrote:
> For the qcom-spm driver, an early return was not calling the proper
> of_node_put call for a previously acquired device node.
> 
> Signed-off-by: Miquel Sabaté Solà <mikisabate@gmail.com>
> ---
>  drivers/cpuidle/cpuidle-qcom-spm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

