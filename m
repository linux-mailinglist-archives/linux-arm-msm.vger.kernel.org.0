Return-Path: <linux-arm-msm+bounces-24603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 573AB91BB70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD292B2279A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B361514E0;
	Fri, 28 Jun 2024 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zngfVCWW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB551509A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566815; cv=none; b=S5gXkJcPA6YZ/TxAfA0q/oX4/LvNTESNGQuctJWvMm8e/D3aipMY7SDydWYoiA9esk53wb4JECGVfkr26U1gvmrdu7v1ENLEoREFhlpCHF10/ZLgeisKUa+sXrLDgc0nH9H5yvg/Ih8IAWaspZEpuTO1GMGwi5SD+KI1Kc5rCEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566815; c=relaxed/simple;
	bh=awHqXFlxPP8lfjXkvIjxe0HDyxCZOJaYWC2aPxNS3/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHsUcWBldRTqEarKbgF5iLcCIW8+BCgs32r9EOVmJmx8tiXvv7N7XMuk8zLvcdeCHDtXph7+9vNaxwXllwNiqbyhHcKBQbhOrwJOS05ILXZOSXK0t1j3q1Gmi2HxzUM+HHhKxTTY9VwGYAQB5x+ewMW6KUQFYynoW9GiVEYWOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zngfVCWW; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec6635aa43so3602911fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 02:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719566810; x=1720171610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJY5fes8y/eceaUuSHKFgSKTtu1p3rY5k3qOE9DAYWM=;
        b=zngfVCWWgQLN5gcHqrF1n5pTobnmAJFPEq5EDm79wtcbPWOSsQ7FmFpZ6e2BOjonFi
         5R8mRjlLncGsOJmPO85oaFezHDZ2/kMqD6LVeiuvutx8imBi9zlAQiiy/mSoYOIm2MQ/
         Te30CbVI5n4D+hmPlrrGmnCuuFzGiR1ElzzPrEEqt4LhQjXSQL7j4ZK11nszA93havDj
         qKOtlCs9SjtCyzzQrOwYxPzjxyCG2Gh74PtiHen6fmKOCQTI6gEN+uZc0Cp1h10R5fzI
         EpKXiPwUdQLRM3Ad2QMnmcL11q4UTfmc1PZPKLnp6Sb3d+NHhn0+m+xnZyiV57Gr6wpa
         qF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719566810; x=1720171610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJY5fes8y/eceaUuSHKFgSKTtu1p3rY5k3qOE9DAYWM=;
        b=JqeGkRrcGHLCMtp92qH2rfsrRTnazDVDiCUriC4hKMMGlLtp04InoD0WSSIPuV1T9i
         MDC0A2FOYE9cTbgiCq4fY1rpTKawJXT9WB7jVfJ+xzuozG+8L87NDOsamw2vOp99/lbO
         42cV804vDzYYoUOSZoKSGFWAIbyDfjPDB9VmyKx5aQVRdFvskxAjDp4a/15U4uRz/gZe
         kFhGjdEaEgLd7RZ9gyBAAQh8NMNU5rq1LtLHsxXUl17F7XHE8UHDoyEWVQkA9vZeb1r8
         /3L/5TvKocThSSwQCcHk6tLWfAQiAxSTgdTQzwLF3aRQGW4FN1Ov7kXhgwhhrrTVVXTi
         GRTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0lpW53aegzZJiONAzw7pDLlrkTeCMM9BBdbPMyiF2LrjIK2ooqMLpTehxv9zfLWf/oB+q23J1B7xJeo5W3DndNaoJExE84WXkrydNuQ==
X-Gm-Message-State: AOJu0Yx5VikzXem7TcW+95KnUZCIjB0Ith6xYWZLq6vvfa4UBsCSHcfd
	MrFCZ+8F7ZfqJ7i/dvvLUcc0DXoz5SVkpfvfbvsouF0ahu3nHtgcgIAN98w5ijM=
X-Google-Smtp-Source: AGHT+IGLI7DnhKN2eEpzMawEemRB3nB1IrQwbGOlffIR7dko/3E83SMgD7+zmlsRDlsu7/SFPzQ+iQ==
X-Received: by 2002:a05:6512:1248:b0:52c:e3ae:2737 with SMTP id 2adb3069b0e04-52ce3ae27c9mr12366756e87.68.1719566810593;
        Fri, 28 Jun 2024 02:26:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab27ac2sm222157e87.129.2024.06.28.02.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:26:50 -0700 (PDT)
Date: Fri, 28 Jun 2024 12:26:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, quic_jhugo@quicinc.com, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <k3vupufeagaaqapzybop45sh7p3hitvcd5xf54nefiucb6fb3n@awtivqfpish2>
References: <20240628073605.1447218-1-slark_xiao@163.com>
 <2xbnsvtzh23al43njugtqpihocyo5gtyuzu4wbd5gmizhs2utf@d2x2gxust3w5>
 <455cd5ee.86ad.1905df8bbab.Coremail.slark_xiao@163.com>
 <31b6372e.8805.1905dfc1c6e.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31b6372e.8805.1905dfc1c6e.Coremail.slark_xiao@163.com>

On Fri, Jun 28, 2024 at 04:35:21PM GMT, Slark Xiao wrote:
> 
> At 2024-06-28 16:31:40, "Slark Xiao" <slark_xiao@163.com> wrote:
> >
> >At 2024-06-28 15:51:54, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> >>On Fri, Jun 28, 2024 at 03:36:05PM GMT, Slark Xiao wrote:
> >>> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> >>> And also, add firehose support since SDX72.
> >>> 
> >>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >>> ---
> >>> v2: (1). Update the edl file path and name (2). Set SDX72 support
> >>> trigger edl mode by default
> >>> v3: Divide into 2 parts for Foxconn sdx72 platform
> >>
> >>Generic comment: please send all the patches using a single
> >>git-send-email command. This way it will thread them properly, so that
> >>they form a single patchseries in developers's mail clients. Or you can
> >>just use 'b4' tool to manage and send the patchset.
> >>
> >
> >Send again with command "git send-email v3-*.patch ...". Please take a view on that.
> >Thanks.
> >
> 
> Seems no difference in my side. Any difference in your side?

Yes, the In-Reply-To headers have linked them together.

> 
> >>> ---
> >>>  drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++
> >>>  1 file changed, 43 insertions(+)
> >>> 
> >>
> >>
> >>-- 
> >>With best wishes
> >>Dmitry

-- 
With best wishes
Dmitry

