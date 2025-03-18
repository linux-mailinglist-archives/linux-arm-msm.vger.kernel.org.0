Return-Path: <linux-arm-msm+bounces-51705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 580D3A67178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 11:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03D104220C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 10:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A58207E0E;
	Tue, 18 Mar 2025 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MpO6WvZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFE20764C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294263; cv=none; b=dU1zxnSzyOh/2WIqmcrHQlunLaFklEyohwn2E0H0WiXzWjbaHm2VwxtaqrrWzNlANG0X4V8gR+PSpZ1ZcM7Iurju+Yo3KHHQdk/gmv+JiYOHDrvBnNRHgxQ6SAx764N4NTpcS0eQ3WGQbODQpoNWLRi36//4VAyyDQLljZkd14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294263; c=relaxed/simple;
	bh=OIwqaSUyDLr1pGjfoJLDWzA4eujmiLowScIT7EzB5CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in2YPywHeuFFtyuPjVFb10vSgRrX9EUyKJxpVzDlxU+w474hUoOPuQQp/6oD07GkizYdJojJQNVWBKOXIalbbHeYSaBqxrtEYEHDOYu7SlVXdJ+U5IuAJR1Xeh4r8EhnLoigvqcygJucLNlGUYBaqbbhTdiS4isUYtfLXxhHe4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MpO6WvZ7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2239c066347so112400865ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742294257; x=1742899057; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QfGzvG173s2JG+1ZE7f0d1grE/Sw6nJFtm4+MKiVNSo=;
        b=MpO6WvZ7z2+CMcjKsr9vFIqdCPCMB3FGDB+gRr6p7L3IPEPC8iXRcSF8oWPNLk6POR
         DxYOVwv0OSoH/WMq8y2eiH7wZBs9ppWuWPpUda0sFPcfifcbM/dKynl7xNCmI/JYu7Sm
         QWI2eqcm0XrHP6Jq16cOven4AFyhn2PHF9WvQFMtyvEDP8HunrnJLR3n/0VJV+l8S9FA
         m+sGqpRfU1zRUXt8QOQumSZY+9Ow5FuB1I1DGADd8gxv3QMAtZLfJU05VcHp5PajrSAZ
         GEwnXiMwqVsm9Du+Uen+EGWHYsSak29owA4LTVs/45j9NvLFA7dk15bLy1Ep9X44YEgF
         uq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294257; x=1742899057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfGzvG173s2JG+1ZE7f0d1grE/Sw6nJFtm4+MKiVNSo=;
        b=hUuyUYQjSrFyielPE4zaMwp8zGVGE9MEuG5LWa/JKUT7FbRFT3oABsZeCIfIdTx8Lr
         0SuzKRxzr1zfJaU45JJelRnyzBGKCcgYcPmGvcFPz3oN92lDi16SdSzqVUlFvkkKCLDY
         jFeiGPFdPGgl8ubhcmSUkSgzO7fpQHDqt0U0HPwZ9usvN6odLOAC6wFUJN7mYRfz85Fe
         j6D54vwTDM1OqRj7joTbbLFgW+DtW8NwQxGeJ5UyOaNs/RpFcwIrziEHSAUWMHjCz3f/
         BC9/yeYl6S2ltEsu71l6yKXedIhvbUJe0a9P1u0QlaPYiu5cbibAwdrb3lClsnNvg9WN
         4ZKA==
X-Forwarded-Encrypted: i=1; AJvYcCWwCskxRy6sBWrNmOvAKcbiFUIJvqtfkXN6/N4b62pe69D898vlYfCotCz64lg/SIVASQHet89U6GPzN2Xp@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGJETXdzIo5g+Eg+ch8wAtWSnvqnd9q7uXyB/RsboudhBeJZf
	WfzMoxRD1Spfsf0SKGEuHpocbxgfnO0PGS+VaL2MtlRJ/FCtEs/nUcmYBFw0Fg==
X-Gm-Gg: ASbGnctUt1qX97Q95Drqbpwx0cV91jjXqqZY6zxq0M/pQi1iozwu9PL/qBOFDG2TOKI
	WVRyioKF5CwimcV65w2doLVX6QJhM7NxXUDTtPurtS1wi79dBtBF4/STFTxs98vzOm9JoaxbTbY
	WFTLSrUZX4QFd30yNn8Tt8nLatmilCboePGlNVAzTDWOoJ1zG2tP1fOpQ5lqFukhocNDNpw80Oh
	1nb3Z0hnmOiov/xf0/IuOlpnRWlUMC2W5FFgt8oldlbCE1FHKbIvOS8RrLfRxK7mgPQopKmoioe
	qFMB8+TSOi+KagypOJglGqOl4Y7aF6sPueObt93vpKSe3wuDexhST4nI
X-Google-Smtp-Source: AGHT+IHgOk9NfxTZL90KwqvSB+P0zUVkeYvXxUz9lNWO2UX0U80pQQ0rDKVAKDBxDkeAH+rn35QsTA==
X-Received: by 2002:a17:902:e745:b0:224:160d:3f5b with SMTP id d9443c01a7336-225e0b2a55dmr200860825ad.49.1742294257634;
        Tue, 18 Mar 2025 03:37:37 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a7f87sm91406475ad.81.2025.03.18.03.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:37:37 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:07:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Address conflict between power_up and
 syserr
Message-ID: <20250318103728.enrcf6mwuxznhgbq@thinkpad>
References: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
 <20250314054651.iu6t3q3o5za2zrjs@thinkpad>
 <6df3f39d-d736-4142-8123-b9afbe8a9848@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6df3f39d-d736-4142-8123-b9afbe8a9848@oss.qualcomm.com>

On Fri, Mar 14, 2025 at 11:47:43AM -0600, Jeff Hugo wrote:
> On 3/13/2025 11:46 PM, Manivannan Sadhasivam wrote:
> > On Thu, Mar 06, 2025 at 10:32:26AM -0700, Jeff Hugo wrote:
> > > From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > 
> > > mhi_async_power_up() enables IRQs, at which point we can receive a syserr
> > > notification from the device.  The syserr notification queues a work item
> > > that cannot execute until the pm_mutex is released.
> > > 
> > > If we receive a syserr notification at the right time during
> > > mhi_async_power_up(), we will fail to initialize the device.
> > > 
> > > The syserr work item will be pending.  If mhi_async_power_up() detects the
> > > syserr, it will handle it.  If the device is in PBL, then the PBL state
> > > transition event will be queued, resulting in a work item after the
> > > pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
> > > the syserr work item can run.  It will blindly attempt to reset the MHI
> > > state machine, which is the recovery action for syserr.  PBL/SBL are not
> > > interrupt driven and will ignore the MHI Reset unless syserr is actively
> > > advertised.  This will cause the syserr work item to timeout waiting for
> > > Reset to be cleared, and will leave the host state in syserr processing.
> > > The PBL transition work item will then run, and immediately fail because
> > > syserr processing is not a valid state for PBL transition.
> > > 
> > > This leaves the device uninitialized.
> > > 
> > > This issue has a fairly unique signature in the kernel log:
> > > 
> > > [  909.803598] mhi mhi3: Requested to power ON
> > > [  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
> > > [  909.803945] mhi mhi3: Power on setup success
> > > [  911.808444] mhi mhi3: Device failed to exit MHI Reset state
> > > [  911.808448] mhi mhi3: Device MHI is not in valid state
> > > 
> > > We cannot remove the syserr handling from mhi_async_power_up() because the
> > > device may be in the syserr state, but we missed the notification as the
> > > irq was fired before irqs were enabled.  We also can't queue the syserr
> > > work item from mhi_async_power_up() if syserr is detected because that may
> > > result in a duplicate work item, and cause the same issue since the
> > > duplicate item will blindly issue MHI Reset even if syserr is no longer
> > > active.
> > > 
> > > Instead, add a check in the syserr work item to make sure that the device
> > > is in the syserr state if the device is in the PBL or SBL EEs.
> > > 
> > 
> > Don't we need a Fixes tag?
> 
> I don't recall seeing documentation saying that Fixes tags are mandatory.

It is the standard practice to add the Fixes tag if the bug was introduced by a
specific commit. But...

> Yes, I agree, they are helpful and should exist.
> 
> I am finding it difficult to point to a single commit that I can say
> introduced this issue. I believe we started seeing it with "bus: mhi: host:
> Add MHI_PM_SYS_ERR_FAIL state", but I don't think that commit actually
> introduced this issue. It seems like a coincidence that the issue was first
> observed with that commit.  I suspect that this issue has been a problem
> since the introduction of MHI, but I am not confident since the relevant
> code paths have radically changed since then.
> 
> Given I don't feel confident in identifying a commit, I felt it was perhaps
> better to not list one at all.
> 
> Do you have any suggestions?
> 

Fine with me. In that case, it would have been helpful if mentioned in the
changelog area.

> > 
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> > > ---
> > >   drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
> > >   1 file changed, 17 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> > > index 11c0e751f223..3dff0f932726 100644
> > > --- a/drivers/bus/mhi/host/pm.c
> > > +++ b/drivers/bus/mhi/host/pm.c
> > > @@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
> > >   	struct mhi_cmd *mhi_cmd;
> > >   	struct mhi_event_ctxt *er_ctxt;
> > >   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > > +	bool reset_device = false;
> > >   	int ret, i;
> > >   	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
> > > @@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
> > >   	/* Wake up threads waiting for state transition */
> > >   	wake_up_all(&mhi_cntrl->state_event);
> > > -	/* Trigger MHI RESET so that the device will not access host memory */
> > > +	/*
> > > +	 * Trigger MHI RESET so that the device will not access host memory.
> > 
> > Move this comment before 'if (reset_device)'.
> 
> I'll move it, but seems a bit weird to have the explanation for the logic of
> the conditionals (particularly the ones added by this patch) after them in
> the code.
> 

I thought that the comment is better placed where we really reset the device.

> > > +	 * If the device is in PBL or SBL, it will only respond to RESET if
> > > +	 * the device is in SYSERR state.  SYSERR might already be cleared
> > > +	 * at this point.
> > > +	 */
> > >   	if (MHI_REG_ACCESS_VALID(prev_state)) {
> > > +		enum mhi_state cur_statemachine_state = mhi_get_mhi_state(mhi_cntrl);
> > 
> > s/cur_statemachine_state/cur_state
> 
> We already have a cur_state in the function, that is generally used for Host
> state and here we are reading the Device state. I felt that avoiding mixing
> the meanings was perhaps in the interest of the reader, but reusing
> cur_state appears possible.
> 

It should be fine IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

