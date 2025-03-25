Return-Path: <linux-arm-msm+bounces-52479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9870A7075F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 17:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6253B2A05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 16:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B4125D8E1;
	Tue, 25 Mar 2025 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKjnQa8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3050E18024
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921177; cv=none; b=gE25N3RB5ZPBdp+373+q/D/O3TRfxUSgheRKv1WkVK9Ted45AuMGh9FW5pQ3xlCbBYz4WZGXQ5sFvNg3uBcAizXomckc2CuGBuTatqh15weAi429eAvxRZk1BdYRGP0zW/VPN4l5S8OxKYsPIa/6sQKUAyMRoeUF6QDadrOAY3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921177; c=relaxed/simple;
	bh=PhqQStmK99zRFqxR0TfEaXzpR+Gv3G8u4vQUCtpkidk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1dwybmasGrSGpol6rQGzNxT8k2Vr7S+XR6YdHgVpcLv2p38ZEcTmsBIpcr/2ODaBVrCYda6fC22eK3vgm/6cgsiNnExKU2S17kyzzhVkzMdeM96J1AeILIsO73w/jyVWV9Avz8of6RkHwRH21UXSNjEJ+5Rgv2s2UrjIW5JN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKjnQa8r; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-225df540edcso538185ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 09:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742921175; x=1743525975; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2AwclbRWFB5ImJN7AMO8pqC0UbctCtqhTP13PdSj48k=;
        b=qKjnQa8r/L99Um6bb5xaAjFugrnuAIL2mmfCNt4iGCBC6IQfjtDWBo0l7FsYbexQeS
         nR9CIT9l5mg06mlU5/fNmAfaMiCjiVfcwDXh0W6nPiD6YaFuPW/nBIWEFMjbdmIgjKEB
         l5sUfapt25MqkqvGmopL6mXd6MrsXDB68w66+xOJnRpgU+9vIWjl1tiej8XR/jTL3jlS
         Zxn69M3TMTjylTgDof8dCSoZdvNvJXNSOsglbpd1Dw9CpjvOQLzKmku41bOixGGrQ1el
         MI08D4OMcL3pbdqrE7GJS1AUMscoJUs7WxGLMqxpWsdfkPXLFpiCc7e+eFleNII2ZJbF
         POfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742921175; x=1743525975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AwclbRWFB5ImJN7AMO8pqC0UbctCtqhTP13PdSj48k=;
        b=Kou659tVasbptl/n5W5GYwIjZLCC+x3WyMpethjuxldUI23HmHsSHDDZQvWWd8DbBA
         7GPa5gxxIOzSYaLuESsUUklOoV51RpI5cFeCiVtqxzk5NWyyn40fqJkNz9RqAARH/nSH
         W6hY5wl/+YNG2I/WpJOfLstxuIRbpDID1pNluRtf+J3hnIbV7+9XcLCc5yQHYMDPgqtA
         +5rYaijC9yPfRVp8Ot5TCxFIcFQR9vIyTpGrvLwGQ8RflsxfJ0zjCdDG3DCLN3h790yT
         ZcTetFXLgni1KiTn4yfqO1MItw61Exvefpvt8Gmi86S8K+1IDlyp8w5rp/5H2nrMkCUv
         KjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBggyvdLOK8Oz0olA8dXpCGKgLkFCJLJnGCBj05RY2+N38tvp4jD3pzvpRNpsPn24rpUk48CmByuH94Y1I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2R3II+UqCPX1Vg2hQdIp5hI/rgcNVSyEeVkoZmy2lGcHAXcmb
	YD3MVtc7Q1/qXiJ8sXUUVYP2/mL3k6evXeFLAceW3k8WJRk5TZr4uLw+8ySDLQ==
X-Gm-Gg: ASbGncvMLpdNUg2vBprc4rYlDWEPLW73N//ogqtni7PUWeVvK8cEG8TN4agCxjzP3sV
	lDRaxSebqbxW4UgI+jMj6L9Vtk/2YqiJblEuR3S+UTnfO1cxYU33CNUxuFC9oo+wWLh3Mru5RCn
	BAY0ITdu7jhqVPddhRBDwoOgr1Ci6saQIeSrol1o3qXTJjx5yyx8OnQT8SRcNY5gTS96lYD0Xmd
	AYlaVJ7usNMoOKe61mM2c+RFtSGEIuzDmG/+IkSf9LvUnTXtHrsyB64HEjCtoQV3majhIXzJMdf
	zkSAgDGEVNexZ4RNanQq+Km659EyPV7Km7aPde1L7mDWSLArwl5lGWlX
X-Google-Smtp-Source: AGHT+IGF2u4p8hAt8ijmeOgX9TZ9IQO6ey+7L6eIaIHfrVxD5Bj3R4Onn4T4FBqmWoKsa+LrolaswQ==
X-Received: by 2002:a05:6a00:170c:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-739514f5ddemr613780b3a.3.1742921175228;
        Tue, 25 Mar 2025 09:46:15 -0700 (PDT)
Received: from thinkpad ([120.60.136.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906159dd5sm10649396b3a.135.2025.03.25.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:46:14 -0700 (PDT)
Date: Tue, 25 Mar 2025 22:16:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2] bus: mhi: host: Address conflict between power_up and
 syserr
Message-ID: <tuztnikrnmgkh3ssrncpjnt6y745zccg4mowuxntbhseyudo6v@qny7w5u4ycie>
References: <20250321174005.4077683-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321174005.4077683-1-jeff.hugo@oss.qualcomm.com>

On Fri, Mar 21, 2025 at 11:40:05AM -0600, Jeff Hugo wrote:
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
> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> ---
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
> index 11c0e751f223..5e608436775f 100644
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
> +		enum mhi_state cur_state = mhi_get_mhi_state(mhi_cntrl);
> +		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
> +
> +		if (cur_state == MHI_STATE_SYS_ERR)
> +			reset_device = true;
> +		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
> +			reset_device = true;
> +	}
> +
> +	/*
> +	 * Trigger MHI RESET so that the device will not access host memory.
> +	 * If the device is in PBL or SBL, it will only respond to RESET if
> +	 * the device is in SYSERR state.  SYSERR might already be cleared
> +	 * at this point.

Oops... I asked you to move only the existing comment below and keep the rest as
is. Like,

	if (MHI_REG_ACCESS_VALID(prev_state)) {
		/*
		 * If the device is in PBL or SBL, it will only respond to RESET
		 * if the device is in SYSERR state.  SYSERR might already be
		 * cleared at this point.
		 */
		...

	/* Trigger MHI RESET so that the device will not access host memory */
	if (reset_device) {
		,,,

Sorry if I was not clear.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

