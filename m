Return-Path: <linux-arm-msm+bounces-51339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77CA60877
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AED93BE1FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 05:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3D115696E;
	Fri, 14 Mar 2025 05:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vr8cQSng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8DE15199B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 05:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741931218; cv=none; b=PZBcOzZxhMPJK0SHkMe82zyqbNIptRW9a1BmWxHcrFr5VCmT2hvgTikK6Kb8Gh0HKM4Gpb5nynEtgoPdi3yjNkxsi1n5PWmsAByw9nWi71Ix2I/S/FnZv2qOjMzXvaHwXcuAxi8SpCVkbSPOb7SNLt3XEkuEUL/vRECYCnuuKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741931218; c=relaxed/simple;
	bh=ul3R7jtmfTkNR91cB1ZQcsKkdbKIhRpe8N6UWTr2pBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViAy2wQROPyTvQ5WUX4vlTeXDDqyiFdRPACe4Cr4r8R6nXxBdOLGQsEfbPiJhLjCFeKOkgDKyuSeZfPcZf0vjUvlWGVUduXWcLcuL6U8m73WUHxJ/tw3bDtw0r9IWZe5o5Joiw+wziPx5GXEYCd/e/RMbE0Olt87+Iv+tbwyVr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vr8cQSng; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225e3002dffso2554775ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 22:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741931216; x=1742536016; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=elfAuMJHoolYmn57P5hXk5/lLKgLrVuStnKmq4AdqUY=;
        b=Vr8cQSngOGdBcDhzijv1sblvOREWN6TxYdQhjWWKcIkjGhWwP6bi2xEZ+ibAyU+31e
         G4TJ4oYIsg+c5uB/PmlSFSaE/hmWEQWt5ha5qnjrZIkTCI7w/pHr/9hvccxLANbmAkAd
         dxxUxXjMTSlh6xtS2LArS9Lod8I2Bec23/PWulfUT3mOosDtpEYE98llxRxoSZ7OwYB0
         tSNwnTtWe4t/JsSnSN0SkfPs+RrAt7n1QI7fRPQNXaZb1U3Ertv+/pgwL8zedFBcEVgv
         HUPkn4HzerpKOm770utb6PS71ZCKcGGJZxToeGl+tUDkxXEEIn1S2/tFKEc9MGcQ/Bln
         v5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741931216; x=1742536016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elfAuMJHoolYmn57P5hXk5/lLKgLrVuStnKmq4AdqUY=;
        b=uTLlL4xOfsHZYLuaJ+Ex/l2Qx5VoiWHivrsWqy9j6/2EfAmgLJyKl76YBj5I/2RfXC
         hPXcLldfNfqLvHUQyuAa5HIiUWNUoQai1Bxm9a29U/H8Q6/pGqbe7rbBK+G1ExuC9RMw
         FygAt/Ootgwy91ZEMGOQqOAIfpOgi1h3zrTT6lS+dNZmbtVLknIPKE5hCiFGNHjA6H3m
         moJqIUDa1X0eMIdBaSSSE5POboe+gfh+BEIteLQZs/DPix/LL+rblC5LBVoFuSPfmRMQ
         QPJ6BHc9mOKTqP3Il8pvxKBaDTaoN/8WpVIg6wCc40+Jqna3Nvdt1XHQveSe27i9kkKG
         f1qA==
X-Forwarded-Encrypted: i=1; AJvYcCVRxd8d3ndrqD1xD7s16IQcCrXpQ2wlG/rVzrO9eNZGzK7D+K8IIPH2nIVrJR7h9ncCLg72+DvKpKIbVZir@vger.kernel.org
X-Gm-Message-State: AOJu0Yyda3zcZjruC1lsSjum+yUczwhZZk3/U0epojCYY5p4rJtqy2it
	iPn9KsEyX2vui35L9yaDzemdJdlI1YsRz43qkQsLjJjVgIJC8btAU5By3i7Jxg==
X-Gm-Gg: ASbGncuQFmw0bOxghVZO4xuBwJaK++6HcEpf397DaX452h49ChdvGEIjF29BDj517Wa
	0wtWvc5/xJFGdOJ0y+BEB/nxigyVeNGVvKyDjmGAibB55XnyPG+gaqVamkx4MDKO/UoVvNHWTOT
	Sq0TLfuv+wzNuipri+Y29iw+qAQ7FwPhwOOjq4qMz8icrGN8zM3td7VZQ6rUmX9/rF64f5ewNcy
	vP/xQ78O2Ni7FqLDrJnHcUjbRz+T8sX1iXN+v2+tv5ALSX7EtqmLAvWujVkNcc/tamDNmlzFZZk
	NriLsp7IPupyOsqGXdh+WJpT/g2W1s6G1JV9RYW2fWO5U/YPjpQKrOHLgqNz1emrSKY=
X-Google-Smtp-Source: AGHT+IEDHDcE2nsWay4x5212Q9dwE5Pu/hfncAbR9VQ1eoCkuWaU2M1xG6urqjKX6m2kNZqO1jWOKQ==
X-Received: by 2002:a17:903:3c66:b0:223:325c:89f6 with SMTP id d9443c01a7336-225e0a22b7amr22117525ad.10.1741931216173;
        Thu, 13 Mar 2025 22:46:56 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a874csm22761075ad.98.2025.03.13.22.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 22:46:55 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:16:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Address conflict between power_up and
 syserr
Message-ID: <20250314054651.iu6t3q3o5za2zrjs@thinkpad>
References: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 10:32:26AM -0700, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> mhi_async_power_up() enables IRQs, at which point we can receive a syserr
> notification from the device.  The syserr notification queues a work item
> that cannot execute until the pm_mutex is released.
> 
> If we receive a syserr notification at the right time during
> mhi_async_power_up(), we will fail to initialize the device.
> 
> The syserr work item will be pending.  If mhi_async_power_up() detects the
> syserr, it will handle it.  If the device is in PBL, then the PBL state
> transition event will be queued, resulting in a work item after the
> pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
> the syserr work item can run.  It will blindly attempt to reset the MHI
> state machine, which is the recovery action for syserr.  PBL/SBL are not
> interrupt driven and will ignore the MHI Reset unless syserr is actively
> advertised.  This will cause the syserr work item to timeout waiting for
> Reset to be cleared, and will leave the host state in syserr processing.
> The PBL transition work item will then run, and immediately fail because
> syserr processing is not a valid state for PBL transition.
> 
> This leaves the device uninitialized.
> 
> This issue has a fairly unique signature in the kernel log:
> 
> [  909.803598] mhi mhi3: Requested to power ON
> [  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
> [  909.803945] mhi mhi3: Power on setup success
> [  911.808444] mhi mhi3: Device failed to exit MHI Reset state
> [  911.808448] mhi mhi3: Device MHI is not in valid state
> 
> We cannot remove the syserr handling from mhi_async_power_up() because the
> device may be in the syserr state, but we missed the notification as the
> irq was fired before irqs were enabled.  We also can't queue the syserr
> work item from mhi_async_power_up() if syserr is detected because that may
> result in a duplicate work item, and cause the same issue since the
> duplicate item will blindly issue MHI Reset even if syserr is no longer
> active.
> 
> Instead, add a check in the syserr work item to make sure that the device
> is in the syserr state if the device is in the PBL or SBL EEs.
> 

Don't we need a Fixes tag?

> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 11c0e751f223..3dff0f932726 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  	struct mhi_cmd *mhi_cmd;
>  	struct mhi_event_ctxt *er_ctxt;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	bool reset_device = false;
>  	int ret, i;
>  
>  	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
> @@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  	/* Wake up threads waiting for state transition */
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> -	/* Trigger MHI RESET so that the device will not access host memory */
> +	/*
> +	 * Trigger MHI RESET so that the device will not access host memory.

Move this comment before 'if (reset_device)'.

> +	 * If the device is in PBL or SBL, it will only respond to RESET if
> +	 * the device is in SYSERR state.  SYSERR might already be cleared
> +	 * at this point.
> +	 */
>  	if (MHI_REG_ACCESS_VALID(prev_state)) {
> +		enum mhi_state cur_statemachine_state = mhi_get_mhi_state(mhi_cntrl);

s/cur_statemachine_state/cur_state

- Mani

-- 
மணிவண்ணன் சதாசிவம்

