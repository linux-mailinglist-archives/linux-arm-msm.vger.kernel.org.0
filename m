Return-Path: <linux-arm-msm+bounces-27454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB413942438
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5249AB20A90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 01:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0F2BE5E;
	Wed, 31 Jul 2024 01:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSayiJhL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32619747F
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722390118; cv=none; b=EfGXy0NAO9QwvlMLo8JHfZC59WyqyShTQoL5dw63gwKKMOXZ1ywyQAnOEkYddopUTPOkryXe4VCdHz1vaGccBdc0MnkZr6RqxrmfeMyghWlrqeINH0/puAEJa5rVewKlJ001p0H6FYbJIASu3KFUE+HuLX4ZqpvIbVKyNJlegao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722390118; c=relaxed/simple;
	bh=G7+0ateunFtPHfcpxVeQ58WaJvtGFPv/yXSH1YHGW6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXWHerYz7AUnbkC07ZaSsFC6fpYhn4briDJd1LnVikMrnCQz55YP6nviNUiBDYjqGYrPs7TTXqKN8msDKqu+R0ie5lA+LiPk/wKEG+ka7tKok25bdKeOBpEEpZ98VDWWqUL7m7lgQWllatYsnJAj0lFIgjE7sSN8ZbZs1GaVDoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pSayiJhL; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-66ca5e8cc51so42483597b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 18:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722390116; x=1722994916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=00FmJFigEX6BpvRoQue3/paG9/7bbsRDEOyg4Q2sftQ=;
        b=pSayiJhLbO8lnzpi4y5ysqz8zz/oW5H326CzE90eMJ26nLTLxnmZx5KNwMbPki5f2d
         MKNKhlM8rG/PZGYIu4KVbTq4NUAZTs8GMSDNzA3VtK4oMslBiYoLwNOCgAhs6uM0IxLR
         zAEXKjTI7zuKdrwwZ3CqtBId5d0uBN829Rz7OYWFppUVpuCUFWoioeHfSGEAfhrXIazn
         X/PA7Qyo91RY37v+90Y8g3yD4XtyWVtrpUT2g7h808N9V0oiV4OWTnprpx9VjoJvkqBI
         esJjfP82wchXq7w+1oDGiADEal3QxbZn83dZQcUMkUvJrNmkp/e9sm8/vRJ/bz8cERue
         xtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722390116; x=1722994916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00FmJFigEX6BpvRoQue3/paG9/7bbsRDEOyg4Q2sftQ=;
        b=ELPr7EpMS5DBrX6rfLKN4Y81K7VoAT/X4422rmSB35Zjd/9IqeFBiL6nKiSZ4KEUI5
         A2F7R8kH/w0arVN7VM6z/KXNLZ349XF4/fFiQqbSx47jKJ2O5Tt8U+s/am6y/PowtJCy
         gApyrcPaiLERUbkIgGRmDLgeOoSoAZk9JYLMySLfCF85X/Q3Y7p1c4K84C3jY/6rchu3
         MuMAuH0O1l+3A0gy6ncPKeX48b/9ZEIWyOg+0Zz/TM9RH/dniKURAnid0bJlZwtlYO7a
         q1J3m8TEX22AZqI1XkBVPFk/wAf7TrU6u9Kv+Pl7bBL8/mRTk/oR1uBtHM5BOB2c3gWV
         OUBg==
X-Forwarded-Encrypted: i=1; AJvYcCWPcK63B5RRi7IEYH7JSG2fLSlrxEUrS+CdGQw9Wh6hMm/Rqjgk4kJ173DtLkd9p2Ew9hLLexdcFb5muwuyOM2aM7pQZIfUPdb6x6hmBQ==
X-Gm-Message-State: AOJu0YyhXtynwQxon3R8B6ZLqcfjR/wL54sYWO7RZN1akkgiYpOTk4WU
	MkdCgizuzYft6me5PiDfjZ0nC5oYstM26PwNytklryWcAzxQcf+I1zY/1gpc6hmyIptDN6C5Omt
	X1rk0cUwVR+ZOPKkqQLT5/3JrB48o6hvkCe380g==
X-Google-Smtp-Source: AGHT+IE6WdDRrp6XzpGnNuqVp4MFHRWVcGoigBh0z5Dq1XoUIQ2RKx0gyFCE4wAFVQo5XjeFNUG91C6c93B8oAe5IOk=
X-Received: by 2002:a0d:d007:0:b0:673:1ac6:4be0 with SMTP id
 00721157ae682-67a0a3231d1mr139674917b3.44.1722390116092; Tue, 30 Jul 2024
 18:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>
 <Zqet8iInnDhnxkT9@hovoldconsulting.com> <ZqiyLvP0gkBnuekL@hovoldconsulting.com>
 <oj4qv5wdxymsgpuy4col2w5gabn6k5blybf2fmrckydjo6sftd@eppcqaqwjn5b> <60aa6833-7e08-4986-93e7-4790a8eb8568@quicinc.com>
In-Reply-To: <60aa6833-7e08-4986-93e7-4790a8eb8568@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jul 2024 04:41:45 +0300
Message-ID: <CAA8EJpopAYp3Y6cW8B+2cVM=_oAnWeOqS6zygc4o7b+r9Lj1ZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
To: Chris Lew <quic_clew@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jul 2024 at 02:50, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
>
> On 7/30/2024 4:06 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 30, 2024 at 11:28:14AM GMT, Johan Hovold wrote:
> >> On Mon, Jul 29, 2024 at 04:57:54PM +0200, Johan Hovold wrote:
> >>> On Mon, Jul 08, 2024 at 06:22:09PM +0200, Stephan Gerhold wrote:
> >>>> X1E80100 has the same protection domains as SM8550, except that MPSS is
> >>>> missing. Add it to the in-kernel pd-mapper to avoid having to run the
> >>>> daemon in userspace for charging and audio functionality.
> >>>
> >>> I'm seeing a bunch of new errors when running with this patch applied on
> >>> top of 6.11-rc1. I'm assuming it is due to changes in timing that are
> >>> either exposing existing bugs or there is a general problem with the
> >>> in-kernel pd-mapper implementation.
> >>>
> >>> In any case, this does does not seem to be specific to x1e80100 even if
> >>> I'm not seeing as many issues on sc8280xp (there is one new error there
> >>> too however).
> >>>
> >>> It doesn't happen on every boot, but with the in-kernel pd-mapper I
> >>> often (every 3-4 boots) see the following errors on the x1e80100 CRD
> >>> during boot:
> >>>
> >>>     [    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> >>>          [    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> >>>          [    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> >>>
> >>>     [    9.269230] qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> >>>
> >>> I've also seen the following, which may also be related:
> >>>
> >>>     [   14.565059] PDR: avs/audio get domain list txn wait failed: -110
> >>>          [   14.571943] PDR: service lookup for avs/audio failed: -110
> >>>
> >>> I haven't seen the -ECANCELED (-125) errors in 30 reboots with the patch
> >>> reverted again.
> >>
> >> Here's another bug, a NULL deref in the battery driver, that is
> >> apparently exposed by the in-kernel pd-mapper. This is also on the
> >> x1e80100 CRD with a couple of added printks to indicate when the
> >> pd-mapper probes and when the pmic glink services are up:
> >
> > The backtrace looks like an issue in the battmgr / pmic_glink core. Yes,
> > maybe pd-mapper exposes that. But most likely nobody have seen those
> > because userspace pd-mapper usually starts much later (thanks udevadm
> > trigger for triggering all the drivers).
> >
> > The pd-mapper server is fine to be started early. Even the userspace
> > one.  I think we went over these discussions during reviews of earlier
> > series. The net result was that it is fine, provided that the response
> > don't change later on (e.g.  some of the firmware might save the state
> > and won't re-query it later on if servreg restarts).
> >
> >> [    8.933775] remoteproc remoteproc1: powering up 32300000.remoteproc
> >> [    8.934623] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fd5000.phy
> >> [    8.945244] remoteproc remoteproc1: Booting fw image qcom/x1e80100/cdsp.mbn, size 3027368
> >> [    8.965537] remoteproc remoteproc0: powering up 30000000.remoteproc
> >> [    8.971075] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fda000.phy
> >> [    8.974299] remoteproc remoteproc0: Booting fw image qcom/x1e80100/adsp.mbn, size 21424472
> >> [    8.999726] msm-mdss ae00000.display-subsystem: Adding to iommu group 4
> >> [    9.007697] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fdf000.phy
> >> [    9.101196] remoteproc remoteproc1: remote processor 32300000.remoteproc is now up
> >> [    9.103860] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.1: qcom_pdm_probe
> >> [    9.105989] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.0: qcom_pdm_probe
> >>
> >>   - pd-mapper probing
> >>
> >> [    9.112983] qcom-snps-eusb2-hsphy fd3000.phy: Registered Qcom-eUSB2 phy
> >> [    9.296879] remoteproc remoteproc0: remote processor 30000000.remoteproc is now up
> >>
> >>   - adsp is up
> >>
> >> [    9.300086] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 7fffffff
> >>
> >>   - SERVREG_SERVICE_STATE_UNINIT
> >>
> >> [    9.301878] qcom-snps-eusb2-hsphy fd9000.phy: Registered Qcom-eUSB2 phy
> >> [    9.306985] qcom,fastrpc 30000000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FAST
> >> RPC
> >> [    9.309924] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 5
> >> [    9.311367] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 6
> >> [    9.318330] PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
> >>
> >>   - This looks suspicious
> >>
> >> [    9.323924] qcom-snps-eusb2-hsphy fde000.phy: Registered Qcom-eUSB2 phy
> >> [    9.325275] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 7
> >> [    9.326008] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 8
> >> [    9.326733] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 9
> >> [    9.336582] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 1fffffff
> >>
> >>   - SERVREG_SERVICE_STATE_UP
> >>
> >> [    9.345544] dwc3 a000000.usb: Adding to iommu group 10
> >> [    9.361410] qcom,apr 30000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
> >> [    9.362803] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> >> [    9.362882] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> >>
> >>   - -ECANCELED errors I reported earlier
> >
> >
> > The qcom_glink_request_intent() looks like the only place which can
> > return ECANCELED here. Not sure why GLINK_CMD_RX_INTENT_REQ_ACK() would
> > return failure here.
> >
> > It might be that the ADSP has been running the preliminary firmware,
> > then it is shut down and then restarted with the proper firmware (and
> > Linux fails to track that). But in this case the same error can happen
> > if the pd-mapper has been running before starting the ADSP.
> >
>
> The default behavior for a GLINK channel on the firmware is to reject
> intent requests. The PMIC glink channel on the firmware may not have
> implemented an intent request handler so any intent requests would be
> rejected and result in an ECANCELED. When the firmware implements the
> glink channel this way, the linux driver has to wait until the firmware
> queues the intents for linux to use.

Could you please describe the actual code path that would result in
-ECANCELED? Is that qcom_glink_handle_intent_req_ack(granted = 0) ?
My theory about unregistration is based upon a call path that leads to
qcom_glink_intent_req_abort(). But if I'm not mistaken, it only
happens on the subdev stop event.

Johan, Stephan, could you please trace, what leads to the ECANCELED?

Also could you please be more specific whether the described behaviour
is tied to X1E80100 platform or it is common to some / all other
platforms?

> I guess with userspace pd-mapper, by the time the pd state is
> broadcasted to the pmic glink driver, the firmware glink channel has
> already queued intents for pmic_glink driver to use.
>
> >>
> >> [    9.364298] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> >> ...
> >> [    9.364339] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> >> [    9.364395] CPU: 6 UID: 0 PID: 111 Comm: kworker/6:4 Not tainted 6.11.0-rc1 #70
> >> [    9.364397] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
> >> [    9.364398] Workqueue: events qcom_battmgr_enable_worker [qcom_battmgr]
> >> [    9.364401] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> >> [    9.364403] pc : pmic_glink_send+0xc/0x24 [pmic_glink]
> >> [    9.364405] lr : qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
> >> ...
> >> [    9.364427] Call trace:
> >> [    9.364428]  pmic_glink_send+0xc/0x24 [pmic_glink]
> >
> > It looks like pmic_glink_send might need to hold pg->state_lock.
> >
> >> [    9.364429]  qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
> >> [    9.364430]  process_one_work+0x210/0x614
> >> [    9.364435]  worker_thread+0x244/0x388
> >> [    9.364436]  kthread+0x124/0x128
> >> [    9.364437]  ret_from_fork+0x10/0x20
> >> [    9.364439] Code: 17fffff7 d503233f a9bf7bfd 910003fd (f9400800)
> >> [    9.364441] ---[ end trace 0000000000000000 ]---
> >>
> >> [    9.365205] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125

-- 
With best wishes
Dmitry

