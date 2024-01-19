Return-Path: <linux-arm-msm+bounces-7646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B83833055
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 22:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 818ADB23A4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 21:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEF058235;
	Fri, 19 Jan 2024 21:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CzK0OPwa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE058208
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 21:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705699998; cv=none; b=JGzax5579lGvSo6St7ij1zfo868eUr8RA7Kkwtaw+M3bSyVl8JiP5RaFQLY6M/cwe9r4X7enS5GcjDGG3QM1v399wGs6rVtGQ7fLIpU3jgZwcf9Hv6EVcKy9y2PnZcwvTtDWyHXwwZxpFw0mSnnO8ynJOdjaMIse7Mih1wZtXkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705699998; c=relaxed/simple;
	bh=EkTj7yDGwdkzAs8tBNlRMDUvXzIDCIPdlE7L2nKM844=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deQX283KoUB/OhS2SgXY6l44JDbKMjI4KD91Y2ylbNY+x0WqwY7wnmPF4GYW5oTVgKTu3YvQKLc37KNAqDJSxoEKJIKK74P/2wNy1RhFzaYbq1ffju2BXW3edsSDLnwN7l9DHFuVteb+XDDhySDrn5QgsRQqmwOiGp/10X6n1Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CzK0OPwa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705699996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lzrWPZR5+3QYuqMx3/O+fwKFrZi0Xwysmh/7OAXDcYM=;
	b=CzK0OPwaD1zwyArYxJYoWafAiGMK6QiehCO+K3KtW33ggaQEStvwyD05i5rbY8UXMn9GEo
	bmcylyCNrqQ61jwbKRUn7AoaBYhWJR4Mvx0nelrlWlDRgKnAcdnH6IRtFmCazsqhQYS8/q
	y3sS1YYu7sxRnEFBh5yZGu2nfgcbHQ0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-GnAh5q0rNeuFouUDh3Pgcw-1; Fri, 19 Jan 2024 16:33:12 -0500
X-MC-Unique: GnAh5q0rNeuFouUDh3Pgcw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67ef8bbfe89so22390006d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 13:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705699992; x=1706304792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzrWPZR5+3QYuqMx3/O+fwKFrZi0Xwysmh/7OAXDcYM=;
        b=sX1Fj5lnabr4LJiY3dOcfUuRpNrupCN6zUKcXthnbPFHg+EY/fp/HGDqf++7CHVwAV
         X6AYTolvCGKi05XKnm4OYAJWOVOa4d0Looot80eKNeaWIIrqQNtOfC74rm0fz/tqe+qU
         NOkzhabpxesqWfZUAKvu5jW4SOis2T2bz6qP+BOQ1dZEPSOs/RO24S/G2wRXXGRdcV95
         2okZdQSd4VlZWii/5NSXyTfWcrsy7X84xzD2qh991aeU3hV43Ao9eogNmAZ9CJRg/8z5
         D70wy1RKSq2Z7Bln3sYR5WwEypgD33XfOTh1MCwRJ5DJWJzxgaGhOtbPne6nUGv5pGww
         fzEA==
X-Gm-Message-State: AOJu0YzHDNrWizpNPBG2fnUEyh1xM9sPZUQyuOCNnALddSdd4QdTd7pc
	9G0+mpofnSOi9edv9eWat+gSEFuRMOgLy1Iz0B9j5MS4BrTlJCVAITlaVVJQ3WWKjXZX/r8ezUd
	7+v1cDx9qmeXcjQovCmoypHYPbbI2cpk2HTmq2pnnn8yX3L1OfpO5WBvtuUZbN/Y=
X-Received: by 2002:a05:6214:2686:b0:680:c880:6646 with SMTP id gm6-20020a056214268600b00680c8806646mr668650qvb.22.1705699992321;
        Fri, 19 Jan 2024 13:33:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzzipQRf/AqpwwysE2kv7ZI6fkFW9M4nW61XT5BD6zZ/s+tUut70peKPfzGaEivdj8NjgXpQ==
X-Received: by 2002:a05:6214:2686:b0:680:c880:6646 with SMTP id gm6-20020a056214268600b00680c8806646mr668638qvb.22.1705699992064;
        Fri, 19 Jan 2024 13:33:12 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id di8-20020ad458e8000000b006818a1e269csm39021qvb.102.2024.01.19.13.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:33:11 -0800 (PST)
Date: Fri, 19 Jan 2024 16:33:10 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] scsi: ufs: qcom: avoid re-init quirk when gears
 match
Message-ID: <graeyylgohsukni35djpbxibnz5ya7laqvsydharkzcktv2iwz@knbu5uq5fa4x>
References: <20240119185537.3091366-11-echanude@redhat.com>
 <3xnedre2d32rkad6n2ln4rrah7sgg6epxnzsdm54uab3zrutnz@fww7wb5mvykj>
 <otgj6524k6wiy27depeo7ckopmrr2v3xdnaoph4c5djjohnpmg@f7hyetygcyyr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <otgj6524k6wiy27depeo7ckopmrr2v3xdnaoph4c5djjohnpmg@f7hyetygcyyr>

On Fri, Jan 19, 2024 at 02:33:32PM -0600, Andrew Halaney wrote:
> On Fri, Jan 19, 2024 at 02:07:15PM -0600, Andrew Halaney wrote:
> > On Fri, Jan 19, 2024 at 01:55:47PM -0500, Eric Chanudet wrote:
> > > On sa8775p-ride, probing the hba will go through the
> > > UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH path although the power info
> > > are same during the second init.
> > > 
> > > If the host is at least v4, ufs_qcom_get_hs_gear() picked the highest
> > > supported gear when setting the host_params. After the negotiation, if
> > > the host and device are on the same gear, it is the highest gear
> > > supported between the two. Skip the re-init to save some time.
> > > 
> > > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > > ---
> > > 
> > > "trace_event=ufs:ufshcd_init" reports the time spent where the re-init
> > > quirk is performed. On sa8775p-ride:
> > > Baseline:
> > >   0.355879: ufshcd_init: 1d84000.ufs: took 103377 usecs, dev_state: UFS_ACTIVE_PWR_MODE, link_state: UIC_LINK_ACTIVE_STATE, err 0
> > > With this patch:
> > >   0.297676: ufshcd_init: 1d84000.ufs: took 43553 usecs, dev_state: UFS_ACTIVE_PWR_MODE, link_state: UIC_LINK_ACTIVE_STATE, err 0
> > > 
> > >  drivers/ufs/host/ufs-qcom.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > index 39eef470f8fa..f9f161340e78 100644
> > > --- a/drivers/ufs/host/ufs-qcom.c
> > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > @@ -738,8 +738,12 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
> > >  		 * the second init can program the optimal PHY settings. This allows one to start
> > >  		 * the first init with either the minimum or the maximum support gear.
> > >  		 */
> > > -		if (hba->ufshcd_state == UFSHCD_STATE_RESET)
> > > +		if (hba->ufshcd_state == UFSHCD_STATE_RESET) {
> > > +			if (host->hw_ver.major >= 0x4 &&
> > 
> > Is this check really necessary?

I *think* so.

For example, if hw_ver < 4, ufs_qcom_set_phy_gear() has a comment saying
"power up the PHY using minimum supported gear (UFS_HS_G2). Switching to
max gear will be performed during reinit if supported."

> > 
> > The initial phy_gear state is something like this (my phrasing of
> > ufs_qcom_set_phy_gear()):
> > 
> >     if hw_ver < 4:
> >         # Comments about powering up with minimum gear (with no
> >         # reasoning in the comment afaict), and mentions switching
> >         # to higher gear in reinit quirk. This is opposite of the later
> >         # versions which start at the max and scale down
> >         phy_gear = UFS_HS_G2

IIUC, the device would not be able to negotiate a gear higher than the
minimum set for the phy_gear on initialization.

ufshcd_init_host_params() and ufs_qcom_get_hs_gear() both set the
controller <v4 host_params to G3. So if the device is HS capable, the
re-init would set G3, instead of the G2 selected by
ufs_qcom_set_phy_gear().

Assuming I'm not loosing track somewhere, the sequence of calls would go
something like this:

ufshcd_init
 ufshcd_hba_init
  ufshcd_variant_hba_init
   ufshcd_vops_init
    ufs_qcom_init
     ufs_qcom_set_host_params /* if hw_ver < 4: phy_gear = G2 */
 ufshcd_hba_enable
  ufshcd_hba_execute_hce
   ufshcd_vops_hce_enable_notify(PRE_CHANGE)
    ufs_qcom_hce_enable_notify /* vops.hce_enable_notify */
     ufs_qcom_power_up_sequence
      phy_set_mode_ext(phy, mode, host->phy_gear);
 async_schedule(ufshcd_async_scan, hba)
 ...
 ufshcd_async_scan
  ufshcd_device_init
  ufshcd_probe_hba /* where the re-init quirk happens */
   ufshcd_device_init
    ufshcd_vops_pwr_change_notify(PRE_CHANGE)
  
So that would limit the device to G2? In this circumstances, the re-init
would instead re-initialize to G3.

> I guess what I'm saying is shouldn't the check be something like:
> 
>     if (dev_req_params->gear_tx == host->phy_gear) {
>         // Skip reinit since we started up in the agreed upon gear
>         hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>     }

-- 
Eric Chanudet


