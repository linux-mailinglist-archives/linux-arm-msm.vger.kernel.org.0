Return-Path: <linux-arm-msm+bounces-43110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F5E9FAD14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82744188489B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A231191F85;
	Mon, 23 Dec 2024 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUmOSk62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8C418F2DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734949169; cv=none; b=CPF9dxnMNANkdPDViIry7bNibK/u93DtEEbnYCOEONWuG5X/jTQG73D8FPconLfl2/5+/s19sNoAf0vICDmaoHod5AnHrt2EHaMIeSd2NPHTg0jNeehELHoVsxNS/OMV/v876vLstQb56xg5bKCrW75rcMLFG4MifzJTSSH2krE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734949169; c=relaxed/simple;
	bh=g545nhkRdSjsDwjY1JXpKctEqp3tEmyxBwUF+yt+Nsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIZ7dFbpeebEEsObOB9Owy3ArYWWgqrwCD/u2iMXMm3ggWaDoNctTr/zg1NyIiPMJuxhA14Ulr19dxbSfT7tJpd9CoG4E/E8djWXpeS2dEvsz5uRjLurSynsM9VZL63bNAtpkwwe3n4STFxViFKZS9MYO+Lbxd//yLo7bf/gxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUmOSk62; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3778bffdso4490158e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 02:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734949165; x=1735553965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnesPOoBogmfTizrXAOI/b0CVINnqBVaDGqobTCh+jY=;
        b=qUmOSk623O4lguTBrpBsgUYFA9EqciXyhIHzLVeNy8QXX4m8ztvDcKeb8uULwRkStP
         GrMEAu1bt/nNg4bMNBJ1t3ALAuUIQgEwElB2p9tyIRT0a6LJSKaENpzBLl5d/ska/vNb
         ZzULHHADFcZksio58P+5l2cTuYB4ojghrgAIxbWzCjUVwvMkAUBm/QP03bdZo5rTtl4f
         vq4bAm3PmapEcBaXRs0Eef/JQbJ4/f6FwrEi7NGxtGNk3No6LqaMyDZyDJkiuX10Ur6J
         nqj02CwqlhaFLBQhnYOHtqrR0osbDutgFTF5AExmkE2XK7AYQn2peUss/wlJij+H7BOK
         2qKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734949165; x=1735553965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnesPOoBogmfTizrXAOI/b0CVINnqBVaDGqobTCh+jY=;
        b=TZRIBqh8gEthaEMuS0Hc73/wPKHWW1A07cyhqwAsYgMH9wk4+zfvnvsCJYb+mq28hP
         bacTvGPXLDFJ4xIUEH7xw2zGY5QdCr1roOZapx+wZd9cyCTDuRpQmqs1m49mmYG3VR96
         9dhZJwxrq9SYEdwvBAdTJyABObrdhozejT1T4sTM7p7R+pA+KdkrgYGKTd+iEjRGnCuZ
         BsU+5b2/SiPc47Bi3JJGoJmILXzQvFWKLFEscCzgqzYxpuzZWplo2vW8PfuYJM8Tg1CY
         OA71JP+enYrDZBbDm6b8XaGo1ypnz4LPa60oDE3p5B2dg9r/wI4l2nxHtFKTDDsloJFH
         yGBg==
X-Forwarded-Encrypted: i=1; AJvYcCWSG9e3dczcnEKN9PaDHIhDvlBjIJOjYZd4s0DrCXOaldRqP2Ao69KFmLumZCTnWMs2d+PZF3REScIG7PmO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp4lRy/5tiIhBLoFPBVURDgfmdm6GGBBpo03r5rqbDLoxsxWZs
	moN2B3abAPUtmXhXJkMHqtopNrIsl0Sq/xDRGYOMgtvu3YmtvAjhLC5gr9+lDW4=
X-Gm-Gg: ASbGnctqi5kp2nUaF0ix9xdz40jUtJ4TN/bvnSQ2RIPkhfM2re29dN9TpDOkyBDw1Pg
	E4PQL3Qpa8obTCFuBY9T+1ZXu2EOBbXE/oC9HniLbsh+YuyeQ+JVtfZLwioED7WjwzM5yZkSIem
	pi2u0IfwatSS/L5PF47411IyIpQDEW0a8uIlHDmwN4HH5wdfj8XV4fNP1WQF1ShZVzx4jfRAUwD
	N15OKHrddJyR77SMvwPa2pqe0m63S9GaHPf8UAFI+Qy4oTcFMnGJHSfpAkNbD6jY+aGwG+jchea
	/otHpQcS5pzdXPhmHVChoRO9IOr0RoJNyPKk
X-Google-Smtp-Source: AGHT+IEw23MfyGYTc8glJDZiTy976C6MVASgHyhkl2j0BvJGjObs/iKQ3qhQ3Z+Lq3SBAqIGzeX/6w==
X-Received: by 2002:a05:6512:2350:b0:542:1bdd:511a with SMTP id 2adb3069b0e04-542295322ebmr3296349e87.13.1734949164983;
        Mon, 23 Dec 2024 02:19:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm1252468e87.247.2024.12.23.02.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:19:23 -0800 (PST)
Date: Mon, 23 Dec 2024 12:19:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anandu Krishnan E <quic_anane@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly
 in error scenarios
Message-ID: <sfkf5wtra5e73a2wiclgrrlyp6urjdl635hxc2ucvv2q7hidzj@lkocd6ibymsg>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-2-quic_anane@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223100101.29844-2-quic_anane@quicinc.com>

On Mon, Dec 23, 2024 at 03:31:00PM +0530, Anandu Krishnan E wrote:
> During fastrpc_rpmsg_probe, if secure device node registration
> succeeds but non-secure device node registration fails, the secure
> device node deregister is not called during error cleanup. Add proper
> exit paths to ensure proper cleanup in case of error.
> 
> Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This triggers checkpatch warning. If it is due to c&p from some internal
documentation, please fix it too.

> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 48d08eeb2d20..ff144f0aa337 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2344,7 +2344,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>  		if (err)
> -			goto fdev_error;
> +			goto populate_error;
>  		break;
>  	default:
>  		err = -EINVAL;
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

