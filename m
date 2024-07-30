Return-Path: <linux-arm-msm+bounces-27405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4027194103A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 13:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6376C1C215B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 11:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A706199236;
	Tue, 30 Jul 2024 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dglSTqf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC571990C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722337622; cv=none; b=ViWMS9wcdLbvoXYrX0w363mxDbqDCw48IuCHqjtHRs0WgAsmfPrYZicd0b2Ijz36e5w72kZqgqxJu3f3lm7ss4uuM1zr1aInGpQ5H/Zae8K73ewKLwPE/VMaK5w5mO9+EnKH2yf+t4khjBHoP/VyKkY/R2h/lIQp1Fx/p5FVlAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722337622; c=relaxed/simple;
	bh=2Grj/S8/RG5JqrSh9njmsBVAx1651oPQ5Xj4ZSDRX+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6iLqmC3LkfVBMdE3sWeYFRGpQsY0BWaQf+VAYrRO7REaWQbqHfSqbSZPqCqi2dW8KSSTSCoDruAfO/TvLsnRNmwaGUXdL1plP4uSFsd4ytgWespXFvgkcDSYi1+0P35g3W8iA0sM0kCmGBxZ/V1UYiIgGwmH0ONft0EfNPSJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dglSTqf0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efd530a4eso6903277e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722337618; x=1722942418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D68RC+r466T2esKoHPuiJruZnsFlpmUERjB2bBB3TUQ=;
        b=dglSTqf0m9K7rGaeSrqXFrmZq+DjIfeNcpVtsNK0FdERTOk+4KyBa9RmQxnvFM2S5f
         26vLa/6y8BTdLBNQd6ThftUlHd19sCzQe0ru55BpNDYU+wsry7ICVJLlTYEzt5xyA939
         bv6A+HaT9E2VB6kmTUn5VNDIlY7RSGcCExx31+IrIkGlW/QmzxwdHtb0se7yxtZ4UzeB
         AcZX9yRxu0J71pYbRfZHRz8o1dnPuKGg4ZBEqGA306a3XxpY5ldFy70HpS4jXOCtsjcn
         FzaZffVurVnuxJoGwtSv/yDp45i//XDXQLGbGuLcQsc+yCEnDMJUuluJMq5kdJ5lbQ7Z
         Drvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722337618; x=1722942418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D68RC+r466T2esKoHPuiJruZnsFlpmUERjB2bBB3TUQ=;
        b=ZaJCTH/aX9A27ERqE/9uuaIBegXA4WPABhRO1VOV9bZMIvHc5I91ocqlVPRdFPQchi
         iXTBP84CNAPha62l9fDO32v2No+NDHko1ROosfd0OhgRdICbKnD7ZOmrm6WG4jMWsqRV
         s/VPf2izgLqKLZlifA/YSMQFYNuwsS/jd71GsNRfWAtq6Nxa43lROJT+YXhmEzfk8oOq
         cW5Y+tH3t+ITFHe3lT3o5NWO1nefQJGpTmSIcOq58TMLwbe4kOiS4ZgEVWM34J5DQ+0X
         4T20NIKlo2qOGiSgjA+L9tX+inTD2LD4znoQP4jP4Exm+XsTKONh+G5qfktEPCDiJcQl
         Or/A==
X-Forwarded-Encrypted: i=1; AJvYcCVDB/cg+iSQKzQwAiulkcKJj2KqDc2fkWdNfRUAouMsK4NMaloiUgHnlzkKrYwH100TgeM0Xkz+N0+ycdmmAUZSoe45qcyTN0J1bfFviw==
X-Gm-Message-State: AOJu0YwAboRgEviUce9bh0sIPafSQ39MswjpO3ZmwMjhqrgS6+aQMw5V
	MMltuGz83Bvdi8vn0SXzkCYjyW0SZn5MIC4GsDfH51Br5qMm5UwaPNjqP1Xqhkk=
X-Google-Smtp-Source: AGHT+IFJqKVo+cNClj8RH2mi9ni9USH94XPhAXUNmwMiIkt7i3Ll1O1OFwgMc88EfxjG6JP54wyNjg==
X-Received: by 2002:ac2:518e:0:b0:52f:2ea:499f with SMTP id 2adb3069b0e04-5309b2803efmr6959473e87.24.1722337618416;
        Tue, 30 Jul 2024 04:06:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c08cdfsm1862872e87.123.2024.07.30.04.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 04:06:57 -0700 (PDT)
Date: Tue, 30 Jul 2024 14:06:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
Message-ID: <oj4qv5wdxymsgpuy4col2w5gabn6k5blybf2fmrckydjo6sftd@eppcqaqwjn5b>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>
 <Zqet8iInnDhnxkT9@hovoldconsulting.com>
 <ZqiyLvP0gkBnuekL@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqiyLvP0gkBnuekL@hovoldconsulting.com>

On Tue, Jul 30, 2024 at 11:28:14AM GMT, Johan Hovold wrote:
> On Mon, Jul 29, 2024 at 04:57:54PM +0200, Johan Hovold wrote:
> > On Mon, Jul 08, 2024 at 06:22:09PM +0200, Stephan Gerhold wrote:
> > > X1E80100 has the same protection domains as SM8550, except that MPSS is
> > > missing. Add it to the in-kernel pd-mapper to avoid having to run the
> > > daemon in userspace for charging and audio functionality.
> > 
> > I'm seeing a bunch of new errors when running with this patch applied on
> > top of 6.11-rc1. I'm assuming it is due to changes in timing that are
> > either exposing existing bugs or there is a general problem with the
> > in-kernel pd-mapper implementation.
> > 
> > In any case, this does does not seem to be specific to x1e80100 even if
> > I'm not seeing as many issues on sc8280xp (there is one new error there
> > too however).
> > 
> > It doesn't happen on every boot, but with the in-kernel pd-mapper I
> > often (every 3-4 boots) see the following errors on the x1e80100 CRD
> > during boot:
> > 
> > 	[    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> >         [    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> >         [    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> > 
> > 	[    9.269230] qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> > 
> > I've also seen the following, which may also be related:
> > 
> > 	[   14.565059] PDR: avs/audio get domain list txn wait failed: -110
> >         [   14.571943] PDR: service lookup for avs/audio failed: -110
> > 
> > I haven't seen the -ECANCELED (-125) errors in 30 reboots with the patch
> > reverted again.
> 
> Here's another bug, a NULL deref in the battery driver, that is
> apparently exposed by the in-kernel pd-mapper. This is also on the
> x1e80100 CRD with a couple of added printks to indicate when the
> pd-mapper probes and when the pmic glink services are up:

The backtrace looks like an issue in the battmgr / pmic_glink core. Yes,
maybe pd-mapper exposes that. But most likely nobody have seen those
because userspace pd-mapper usually starts much later (thanks udevadm
trigger for triggering all the drivers).

The pd-mapper server is fine to be started early. Even the userspace
one.  I think we went over these discussions during reviews of earlier
series. The net result was that it is fine, provided that the response
don't change later on (e.g.  some of the firmware might save the state
and won't re-query it later on if servreg restarts).

> [    8.933775] remoteproc remoteproc1: powering up 32300000.remoteproc
> [    8.934623] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fd5000.phy
> [    8.945244] remoteproc remoteproc1: Booting fw image qcom/x1e80100/cdsp.mbn, size 3027368
> [    8.965537] remoteproc remoteproc0: powering up 30000000.remoteproc
> [    8.971075] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fda000.phy
> [    8.974299] remoteproc remoteproc0: Booting fw image qcom/x1e80100/adsp.mbn, size 21424472
> [    8.999726] msm-mdss ae00000.display-subsystem: Adding to iommu group 4
> [    9.007697] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fdf000.phy
> [    9.101196] remoteproc remoteproc1: remote processor 32300000.remoteproc is now up
> [    9.103860] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.1: qcom_pdm_probe
> [    9.105989] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.0: qcom_pdm_probe
> 
>  - pd-mapper probing
> 
> [    9.112983] qcom-snps-eusb2-hsphy fd3000.phy: Registered Qcom-eUSB2 phy
> [    9.296879] remoteproc remoteproc0: remote processor 30000000.remoteproc is now up
> 
>  - adsp is up
> 
> [    9.300086] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 7fffffff
> 
>  - SERVREG_SERVICE_STATE_UNINIT
> 
> [    9.301878] qcom-snps-eusb2-hsphy fd9000.phy: Registered Qcom-eUSB2 phy
> [    9.306985] qcom,fastrpc 30000000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FAST
> RPC
> [    9.309924] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 5
> [    9.311367] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 6
> [    9.318330] PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
> 
>  - This looks suspicious
> 
> [    9.323924] qcom-snps-eusb2-hsphy fde000.phy: Registered Qcom-eUSB2 phy
> [    9.325275] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 7
> [    9.326008] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 8
> [    9.326733] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 9
> [    9.336582] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 1fffffff
> 
>  - SERVREG_SERVICE_STATE_UP
> 
> [    9.345544] dwc3 a000000.usb: Adding to iommu group 10
> [    9.361410] qcom,apr 30000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
> [    9.362803] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> [    9.362882] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> 
>  - -ECANCELED errors I reported earlier


The qcom_glink_request_intent() looks like the only place which can
return ECANCELED here. Not sure why GLINK_CMD_RX_INTENT_REQ_ACK() would
return failure here.

It might be that the ADSP has been running the preliminary firmware,
then it is shut down and then restarted with the proper firmware (and
Linux fails to track that). But in this case the same error can happen
if the pd-mapper has been running before starting the ADSP.

> 
> [    9.364298] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> ...
> [    9.364339] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    9.364395] CPU: 6 UID: 0 PID: 111 Comm: kworker/6:4 Not tainted 6.11.0-rc1 #70
> [    9.364397] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
> [    9.364398] Workqueue: events qcom_battmgr_enable_worker [qcom_battmgr]
> [    9.364401] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    9.364403] pc : pmic_glink_send+0xc/0x24 [pmic_glink]
> [    9.364405] lr : qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
> ...
> [    9.364427] Call trace:
> [    9.364428]  pmic_glink_send+0xc/0x24 [pmic_glink]

It looks like pmic_glink_send might need to hold pg->state_lock.

> [    9.364429]  qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
> [    9.364430]  process_one_work+0x210/0x614
> [    9.364435]  worker_thread+0x244/0x388
> [    9.364436]  kthread+0x124/0x128
> [    9.364437]  ret_from_fork+0x10/0x20
> [    9.364439] Code: 17fffff7 d503233f a9bf7bfd 910003fd (f9400800)
> [    9.364441] ---[ end trace 0000000000000000 ]---
> 
> [    9.365205] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> 
> Johan

-- 
With best wishes
Dmitry

