Return-Path: <linux-arm-msm+bounces-7978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C0839273
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD8B41F24656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809A05FEE5;
	Tue, 23 Jan 2024 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kau2+w4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB855FDBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706023111; cv=none; b=BTv+5fkaQXq6xRKw9pgix5Dj23UXJvRv6+pya+6F+8BuEMo175rga6AyywZU0u2LY7co7g3ARcsrBUVxW5g+j67zYEBGd++x5O9PsyRMuj0er4+Z3BQc/nefl6fTztZD+XxTBfwl4qJI53sM0A1rLU1VmAU9+GDyk9hpyUjak50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706023111; c=relaxed/simple;
	bh=crUOVrMbeEO4wnicc5iui9hOeN4LYMI9Jn8rCfHnCRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJRiKM3CxtzEuNu5RByR+2eyvGRaPLmS5jk9/Y1t0xUzcXQdBe9bJAhK2qTFh/t8Z0JG+A0/yKv1Z9WKDLF0RKFbbLJ6EhTnX/FBETVsrpXVKFYqkazvhZaO6LvGpmY61RI6aFT8ABTsWx00zZho6EChtIz4AHhr8iL7SCsYtQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kau2+w4a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706023108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cg9rVYslPOYKyRxMw9IkZlsZENR/nLG/k/wm9SQRp04=;
	b=Kau2+w4at34mAMTGBm61nyOhUxyEURCrVIl5uu63PuxfvvOt30Pu9kplsI1/dToRcuXiIz
	I83Pjn6c/9kOJUSniV9GbmCqtjeObVQLcwz8pcA5C9SiJ6HLwYAS5B62kp4+6NgK3Eq8kg
	Rk1ImQINlUpkCm9g487Q/M0fjbg84xw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-xp2CL2V3PhuSWidZJScIwQ-1; Tue, 23 Jan 2024 10:18:24 -0500
X-MC-Unique: xp2CL2V3PhuSWidZJScIwQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68058b0112cso96872056d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 07:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706023104; x=1706627904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg9rVYslPOYKyRxMw9IkZlsZENR/nLG/k/wm9SQRp04=;
        b=qq3suxXE6Zkr7porCaspCNF4pcwwTLtz5i8GAog8avBXNMGTNfOJe/q7C5+vmCLx8u
         kyrr1WILEgcT4IvIC9+G35Z4zy4FcUc4S09pL3Wj8xZv37oFhbhbMzYuxBFndDw04G8Q
         3EhtfzYvSnDRtYsEHssKK81VmCSMKj7Pk9tUAS+sisklNRlkRo3xyHeD8yKoDtBdQ7hS
         auilL4mFtK+/9r2GAP2M6jeTrMWgmg3UbgSR5YaAxJ50mg3fQkNVgyxcEUxqZ9DF9o+A
         kthkbjOGxa2CfUbP+TwHXtBhC2jM1Oc6cNBRZpMgqehagGPVHADbbPcraDcUYDpzxphe
         Ov4w==
X-Gm-Message-State: AOJu0YwRSkhotVRRjPfvHeUO6beMWLwhUWoyQPMr1sThXqdRVBEFtX7T
	FQf7hWpGVMV+/QONaYomyvTiAwFa/EXUefLuewmRAjTc9NKVb7PTiHP7VhIyhd95pOGseneGMVu
	PVYiDwgyZRnGCKdqz7yDDsfpxFH1xrgw9y34ujFRffmHnd4kQiZNJ7K7QTW9b0qQ=
X-Received: by 2002:a05:622a:34b:b0:42a:35bf:40f2 with SMTP id r11-20020a05622a034b00b0042a35bf40f2mr999992qtw.58.1706023104373;
        Tue, 23 Jan 2024 07:18:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7iVj9B700sdyhUCZJUNpfTHatf50PZK1/4/aA5N7R1oR+82VHoBiI7HHMIcCXwDPVqd7kSg==
X-Received: by 2002:a05:622a:34b:b0:42a:35bf:40f2 with SMTP id r11-20020a05622a034b00b0042a35bf40f2mr999977qtw.58.1706023104039;
        Tue, 23 Jan 2024 07:18:24 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id s13-20020ac8758d000000b00423e9316931sm3522132qtq.83.2024.01.23.07.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 07:18:23 -0800 (PST)
Date: Tue, 23 Jan 2024 10:18:22 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andrew Halaney <ahalaney@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: Re: [PATCH] scsi: ufs: qcom: avoid re-init quirk when
 gears match
Message-ID: <hnig5l4y3yc3h4khjgpkdbooop2ctah4pzplumjdzxzdxs3rqu@vsrubpdl26bp>
References: <20240119185537.3091366-11-echanude@redhat.com>
 <3xnedre2d32rkad6n2ln4rrah7sgg6epxnzsdm54uab3zrutnz@fww7wb5mvykj>
 <otgj6524k6wiy27depeo7ckopmrr2v3xdnaoph4c5djjohnpmg@f7hyetygcyyr>
 <graeyylgohsukni35djpbxibnz5ya7laqvsydharkzcktv2iwz@knbu5uq5fa4x>
 <20240123143615.GD19029@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123143615.GD19029@thinkpad>

On Tue, Jan 23, 2024 at 08:06:15PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jan 19, 2024 at 04:33:10PM -0500, Eric Chanudet wrote:
> > On Fri, Jan 19, 2024 at 02:33:32PM -0600, Andrew Halaney wrote:
> > > On Fri, Jan 19, 2024 at 02:07:15PM -0600, Andrew Halaney wrote:
> > > > On Fri, Jan 19, 2024 at 01:55:47PM -0500, Eric Chanudet wrote:
> > > > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > > > index 39eef470f8fa..f9f161340e78 100644
> > > > > --- a/drivers/ufs/host/ufs-qcom.c
> > > > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > > > @@ -738,8 +738,12 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
> > > > >  		 * the second init can program the optimal PHY settings. This allows one to start
> > > > >  		 * the first init with either the minimum or the maximum support gear.
> > > > >  		 */
> > > > > -		if (hba->ufshcd_state == UFSHCD_STATE_RESET)
> > > > > +		if (hba->ufshcd_state == UFSHCD_STATE_RESET) {
> > > > > +			if (host->hw_ver.major >= 0x4 &&
> > > > 
> > > > Is this check really necessary?
> > 
> > I *think* so.
> > 
> > For example, if hw_ver < 4, ufs_qcom_set_phy_gear() has a comment saying
> > "power up the PHY using minimum supported gear (UFS_HS_G2). Switching to
> > max gear will be performed during reinit if supported."
> > 
> > > > 
> > > > The initial phy_gear state is something like this (my phrasing of
> > > > ufs_qcom_set_phy_gear()):
> > > > 
> > > >     if hw_ver < 4:
> > > >         # Comments about powering up with minimum gear (with no
> > > >         # reasoning in the comment afaict), and mentions switching
> > > >         # to higher gear in reinit quirk. This is opposite of the later
> > > >         # versions which start at the max and scale down
> > > >         phy_gear = UFS_HS_G2
> > 
> > IIUC, the device would not be able to negotiate a gear higher than the
> > minimum set for the phy_gear on initialization.
> > 
> > ufshcd_init_host_params() and ufs_qcom_get_hs_gear() both set the
> > controller <v4 host_params to G3. So if the device is HS capable, the
> > re-init would set G3, instead of the G2 selected by
> > ufs_qcom_set_phy_gear().
> > 
> 
> REINIT quirk is applicable for controllers starting from v4 only, because legacy
> controllers don't need separate PHY init sequences. So you can get rid of that
> check.

My bad, I overlooked the check in ufs_qcom_advertise_quirks().
Thank you, I'll send a v2 soon.

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 

-- 
Eric Chanudet


