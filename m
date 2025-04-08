Return-Path: <linux-arm-msm+bounces-53463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D849A7F57F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DD507A7BC1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 07:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C7E261389;
	Tue,  8 Apr 2025 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cW4PvcP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A35261380
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095782; cv=none; b=kAr3o7eP/K7s6CrQC8rZWJEcV/UBVOZJKXkwkBNIH4dboNIIeZg4+PjFSHxfbvpIfANATFxRfWxSM9iMr36u1Rv+3Dtb6bpsoepoA8H7/lmGtMjKWkurXnHn9pyvyfmOxJvRi/wkrpo24aZjI/PcHOB5Rx7YYVqJZXczkoYMXVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095782; c=relaxed/simple;
	bh=GvadZfMXMpsJnMBm6ZbGyy8iFPHgJ5t996/Hht726+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTtoPSSu5q+N/QvtaEWqsYPA3gEmW/8xZTApfAUgc40qlWt5eQiMd8+CbBe6LZWtv6hsgA9GGwlqtSzNNAtzgRAhyGR/rzXV2H9ERdFr9VfzyjzUt0i9nuUQK4MkyIXZh18Cj3jOKdTGYNO7ObxdQa1kg327B1jn3rxKf2dIZvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cW4PvcP4; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-730517040a9so6035648b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 00:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744095780; x=1744700580; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7loFTiO6E+EyqiwigrWat5HcbdO0GHdIhW3O4BohHk=;
        b=cW4PvcP4FMgf0OgJASSiJB9/DW+Qj5Jt29PWBwXAAkXXR6YX/alqhxzkXFrHBHN0S7
         H3k3I4PHyQbrhhQMRtTsoMqGC+pI5CxHtoEvs9DXbyoeYJOE+oj6yitLqkireo8R6vpd
         kCB0t1t+k1QtTCA7RKR+nK/A9sEU0Xnrl4myOdcP7+s3UQ8Xv/8MUieowbxqpgIVdBT6
         NMAbUah1qBrwvG0lO+SA3MFVieAE/ia7ypI9g0zN6NxdRuj6aUcxT85JWyrox/RDNF1G
         /04OWOTd9BO6N5CzooZf+8x+LQlIpsyGqGM9g3tYHHrR+s+XC2ZSGWG9mjYGEgvfOR/9
         RfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095780; x=1744700580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7loFTiO6E+EyqiwigrWat5HcbdO0GHdIhW3O4BohHk=;
        b=IC/Z2RRnVT0lKtJL+l2UKp1pXQMLsYVr6DMOZYABOM1WVyLMIWTaw/5fteNts4H1Sl
         +fd38LeOXHccforPGrZSTtZss1VcEMcpU7PkxGhEKefx6st+f7PcsQu8j1NB/CKeOIOc
         kzOW6bJhdSWIa3p8nol8fX0EQW7m9m8yavBL0KDwZBxFVBjz5aGBjM835h3Xri0ei/5E
         TInwSKEAxLB6MmfGdBD8o56Zjbm4Pp/w7Kh1OVw/g8mr8LZZTYTP0wq7Sij9utWKq0ej
         5g3oOqNWWTYDeXKtm1fKLN5qEW1vR5xW92Yd1eoHW5XCSsr+tciYl4vq/XNxSIPKzsdO
         FLcg==
X-Forwarded-Encrypted: i=1; AJvYcCWLYYml9jTp57Oc2y29kV6iD3mQF9fFjNjKCXrH+y6jjTVoYxXPW0j0rrMuV7jqlDdxTgiBzBfD5whRI8MW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy4kUxks1VR2j+YYzy9vvw0BC7tJupWd3hnvLjANmSO7JogAua
	9Rib0g3CX1z6muTKAOBHRxVF83d1QR5H6PUoY4IuBgg+4TcLFxy2cqQFra9FXg==
X-Gm-Gg: ASbGncuSOulb2FrBrdFzCEmq1etA11wkATUqwq2Fj+0Nrl1utQOVRRwst0Dsqk1V8Br
	Dxi4UT6Ka7hiDx4g8AS3U2Vxxq7fpHfZmwJuBTZDquhhFxe+3SMqiejHyjsFG+M1CftP8T1jE/y
	wqLE95rp4HEYF4ZnEXl7aeyucwkBDHkcABsSpNc10HwYsOZd6RTSBFvsJoWmzP8GNJSwVlEHGm+
	3HOqowzIagUuYRZEPKyBkxB/Xh8nEGRuv6n1dl32MId6OntGRzcCMed8sBRQxnfdCPYyj1g7IBT
	Zq1gt7JvYvb29LKitDujrf3g+OoXCs8Mt5ZO86tH+RChOCViIcbHogQ2
X-Google-Smtp-Source: AGHT+IEeAQClEkhjfgQVtiJavpu0HRxfn9e91mnCoOu0Ml5tesLz/WVCrHI6MywYI5eXpL14taEBYA==
X-Received: by 2002:a05:6a21:9013:b0:1f5:6c94:2ccb with SMTP id adf61e73a8af0-20104601d33mr24057798637.22.1744095779699;
        Tue, 08 Apr 2025 00:02:59 -0700 (PDT)
Received: from thinkpad ([120.60.134.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea09c8sm10032926b3a.101.2025.04.08.00.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:02:59 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:32:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v3] bus: mhi: host: Address conflict between power_up and
 syserr
Message-ID: <wki7wqwrnccdnkcor2yk47ju72q6vxhlsy63oiutfeztv6zwxl@rpr3sgrkkg4c>
References: <20250328163526.3365497-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328163526.3365497-1-jeff.hugo@oss.qualcomm.com>

On Fri, Mar 28, 2025 at 10:35:26AM -0600, Jeff Hugo wrote:
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
> It is unknown when this issue was introduced. It was first observed with
> commit bce3f770684c ("bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state") but
> that commit does not appear to introduce the issue per code inspection.
> This issue is suspected to trace back to the introduction of MHI, but the
> relevant code paths have drastically changed since then. Therefore, do
> not identify a specific commit in a Fixes tag as confidence is low that
> such a commit would be correctly identified.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> ---
> 
> v3:
> -Fix the moved comment due to misunderstanding the initial feedback
> 
> v2:
> -Move comment to reset_device condition
> -Rename cur_statemachine_state to cur_state
> -Amend commit text to explain the lack of a Fixes:
> 
>  drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 11c0e751f223..e567a356f136 100644
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
>  	if (MHI_REG_ACCESS_VALID(prev_state)) {
> +		/*
> +		 * If the device is in PBL or SBL, it will only respond to
> +		 * RESET if the device is in SYSERR state.  SYSERR might
> +		 * already be cleared at this point.
> +		 */
> +		enum mhi_state cur_state = mhi_get_mhi_state(mhi_cntrl);
> +		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
> +
> +		if (cur_state == MHI_STATE_SYS_ERR)
> +			reset_device = true;
> +		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
> +			reset_device = true;
> +	}
> +
> +	/* Trigger MHI RESET so that the device will not access host memory */
> +	if (reset_device) {
>  		u32 in_reset = -1;
>  		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

