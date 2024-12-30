Return-Path: <linux-arm-msm+bounces-43680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4929FE9CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 19:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84331883EEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 18:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1931B0427;
	Mon, 30 Dec 2024 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l4KX36QF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473341B0423
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735582973; cv=none; b=qXRNcf+9qdDbf1fMrhuU55upXsRJs8X8EdC1ud+MK6oIPPOxBbfG+JYNfVPostG+4c41uRurEESIXYq2fH65F2QN38t/2/pcys0ekhOMPRAs0SiPivpOKBbwDE9oCB9rYcOqOE9YetMh7hS49/bn2obbvDtmirKE0JV430+9GEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735582973; c=relaxed/simple;
	bh=NgzV4p8XOISPFI4vEyUmhr8KbgiagGCo8dD1unKfgVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSh/h2j42hMYXsvmkZycanGwaua+V35uGmJoHASvawcCHUniWqZPR2nQ1wDc1gYNtOCf1vkwdKJj+Fbf9TAUbbW9c6sylYVSMwla/WCe/4l0Krl/V62GiHVtQmCMVn+IzvOUUylpo6L4xQlT3WaNqwtYilfJF5tc4esjPPM8aO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l4KX36QF; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3003e203acaso98698941fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 10:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735582970; x=1736187770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BhbqRopSzlDwH+iL1PGsgSOq/BjIOG9t0VRaB5toV3Q=;
        b=l4KX36QFtz5mBXp9ufYik69LBcfteUyIy+fhm9gX9Ad8dO6Kno89NK8Ii8Bic/xJOx
         oDthcR7Eag+HPzIi+eUjRTPPufPRzFQGazphHf/rwwDkcaKOMYcPajOm+oSdSGF19Qa2
         wM4tvVDj0yqJ9SA56H3JuF0HDH1KD+7WIUek/vJoQ1rYo/kQnwBLiLAcJrgiv5uSdTOp
         EmaR8pswSOoshqqAk2g+d0J6u+qqZFm+wUiwrfwEWN/yiiir5ThhUFerY2i5cusPCFQs
         5qCauWCU/T/zcZUPSTIeva1hVHyuxZyLUyvr7a/8VeF19GoLM7cpO0pz2B3gYg9I295s
         OxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735582970; x=1736187770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhbqRopSzlDwH+iL1PGsgSOq/BjIOG9t0VRaB5toV3Q=;
        b=xFOneNJXaJw7BUcv5L/pleQquTSo/PbMpY+M6ClO72PTbZEhWb1teAh52q5g/hWhsO
         a69aKxOp6kdqEaGuwtmnhaCknDELNcSLiGm4SvHgIFw0h3mC2+Nl4+/70RSZCGUn9kbI
         MCrdCYws+WePEdfGD6LCR+Gy5V9a44I6WQRBl8liKLbNO+rvPyiuflQR5dqHIFG5pM4c
         9SK8MLk4UQ6PcmiobbuS/HFbPnNxgnPZnSspYn+MlgSF6pKBubJcrjaqptIINcqi9Rr9
         T+knvxSwmHDcI+UA2iCcgEJaYQvRwH/SBzWgv2HDpmV0wGvu6uROqG7DAt94gCKUkAGK
         hXLA==
X-Gm-Message-State: AOJu0YzNYiEiklWiebfC2w1TUFGk+8E2AfjQP87pnyZDByb/3qeU6w3Y
	2XIfJOxEyRnVEhsDLSapkxgL/xncFk6feJ4Ouc0CcMl9QcT3/RHzMmzAvW4T6vs=
X-Gm-Gg: ASbGncu7Sgdmf4MqMuLBUL8ys2+e5X4DK4JQInKIq8DtStye/OImQZo4Qgh81iA5Lj+
	IM2JnVDvjJjPgBOxJ13Md70fAU6+wuXpMIKVddlg6voWLoaOzOe0dF7yPP0wdZ2J+Z3V/L9dWE1
	qSIofLGU5qilX2Io63CbnHHmZo51LaQ5ccBkMuZe08KKemI/2/MIopbtwm+wgegs52WDRSWTtpk
	h1R9dPzDTpxOLQzvyk5RP2Ns5DKq2ljxr6Fy0TA4lJ0G7mWnBNeeiztA1fbhxqIVm5qXqH7v7bU
	Ts1xbCtZjFtKk66p+l5E+H5B1e/ZU7CSofa4
X-Google-Smtp-Source: AGHT+IHyWvMQAs3uBoIHUhsEdikXQ5g6dGtenLTfp6pefm6tfJnRqs6c5XtyvdM1cYBHK16UCEygyg==
X-Received: by 2002:a2e:b8c5:0:b0:300:2731:4120 with SMTP id 38308e7fff4ca-30468535fefmr89410381fa.15.1735582970396;
        Mon, 30 Dec 2024 10:22:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b083aedsm35944581fa.102.2024.12.30.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 10:22:49 -0800 (PST)
Date: Mon, 30 Dec 2024 20:22:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
	Ekansh Gupta <quic_ekangupt@quicinc.com>, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, 
	arnd@arndb.de
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Message-ID: <qd32erndjbtspx4im5u2ge2vgdc4qwwvxhkoaefxwzkue5x7kc@ghk5fdkma6vm>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173557534277.273714.16861047953843054499.b4-ty@linaro.org>

On Mon, Dec 30, 2024 at 04:15:42PM +0000, Srinivas Kandagatla wrote:
> 
> On Wed, 18 Dec 2024 15:54:27 +0530, Ekansh Gupta wrote:
> > This patch series adds the listed bug fixes that have been missing
> > in upstream fastRPC driver:
> > - Page address for registered buffer(with fd) is not calculated
> >   properly.
> > - Page size calculation for non-registered buffer(copy buffer) is
> >   incorrect.
> > 
> > [...]
> 
> Applied, thanks!

May I ask, why they are being accepted with the obvious checkpatch
warnings?

What kind of process is being followed, as those patches had review
comments to be implemented in the next iteration.

> 
> [1/2] misc: fastrpc: Fix registered buffer page address
>       commit: fa22a9743aece593fe9f1e0a0d6189a777d67e38
> [2/2] misc: fastrpc: Fix copy buffer page size
>       commit: 58570026c7ac249bfbd90f9fcb7d2e0a74a106a1
> 
> Best regards,
> -- 
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 

-- 
With best wishes
Dmitry

