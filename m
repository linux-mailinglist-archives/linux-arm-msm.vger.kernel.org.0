Return-Path: <linux-arm-msm+bounces-13073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8886E105
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 13:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B67771C2204F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 12:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AA12AEFF;
	Fri,  1 Mar 2024 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bVhRMiO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDAD6E2AA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 12:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709295967; cv=none; b=Cjtv3FYaeQJRMEL4Brk+UcZ17ftcb2NQVQE1CliGqSK+SLY6CYK8YqmL5W4+gkz6kpNBSABFZhrBBRVfO78LnQFFVEcmqfZIEFvhaw7L/wFmgq6eH+4UBCWAZK0Em+BPhKTTj4MqVjM/X9XpswbA6LqlA7riJal8PVrT8nha0z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709295967; c=relaxed/simple;
	bh=DCxEN7tYRiXh61QyHjoT94wXv3D+5boFGgkhPYQVN4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdPKTKLw15BueYSwvuvReLtsuk2Sm1Ha5COt3zRZL8XcgM7w5fgJaDuLvDco+COF38oboVjqp8UuuXeKN1/CEIUqR/7DHZOX0l+t1iTKDFZaCp7+shZnEA2/eY0Fye/5ZU5bR18Cc5UU7Fki8i+XnFhcPrFXyWgjvUKjNML3BW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bVhRMiO3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e59bbdd8c7so1436028b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 04:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709295965; x=1709900765; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4vy0ssj1y9OKJx6whcKaZP2Wd8dgYFve24tfX8P7n0=;
        b=bVhRMiO3ZLYW3MYlRoFjRWBCmUKW6VYrOJo4wExARQEm+Zv3eP24h2l/vMVv2ih2jE
         zr75DkEhQpgQeNKL1WYFBWNkLd9kTiOIMFSP3ngyneKymvMWi/Vgphp4pvjfAe9LoJnc
         VA9EBDpe+nsbcF/S6biTKvkv+22KKCSAT7GCWqXCCt3XM2H/eEUpcbdKIUx8sjK7ik1h
         bwT8zt/0q+lnuc5wwK7Vfz5ceY3V+wqSokQ/4T1zcB4Q4eDnonUVOHXR490MF58LYbAT
         ynmflIMJG8F0oywV5Y+K2bQ44HzuC2ixS1N7rKAOxLCcKihwxGLZyjCp/cW7Qpmn8g7X
         HoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709295965; x=1709900765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4vy0ssj1y9OKJx6whcKaZP2Wd8dgYFve24tfX8P7n0=;
        b=LGQSh6IOinUWJwRr4zY/9V3wt3/omlneNjLKcUGbry7zCVBjQLW7UL5gwwmHlGmnUJ
         VQruJTnCI5bw/kQZVqUytBR5U6QK9yGjteKvyBxFdvDDwW6U3Gt1nFsGvI6moudTKxy3
         v6c4Y5pH5538w3vZzDzyJFqauxbY/hwVpvkbFK+Pp6DAhfHchry8rJKRTZgxEdG/qwyi
         Ye6HdFt2Aa+mDqBPLjIFH2Q5nE/8apjme6ZpJYURVxHbhsntDSLAF3oluk5ij0zL535k
         gtMyo1HwNnxTPmHnB4gdCTVAjTx9+yRIBkRgr5VHoCoOnMQwuIDb8ZsxHaLPRnyXs0fr
         tyNw==
X-Forwarded-Encrypted: i=1; AJvYcCXBayylJ+VHGvuZIxgUmlHA717HKuuCLhypOEZ/zNv6PKvo0B6b4T3FG69wLdgiVwDrFE9lOL54Nqsssm4zlolOQVzjaR34BDeRsRwUAg==
X-Gm-Message-State: AOJu0YxWkkTIy70MoJlmUqeHMWXBs27ARvMvBFJEQw26vhC53kpFAKU3
	Q3IRZtYxFqP/CHSfDt/3oxFsEt3Sf4F2uKeDpWp5Q387SBanPRaEKkwE9YUooA==
X-Google-Smtp-Source: AGHT+IHDbZOb0MqU0lNgT6Ylu5XAVO9Rkznovko5WeZRWLmmdsVhJISyuzq0BMbPgmlDmT83+wLDug==
X-Received: by 2002:a05:6a20:4327:b0:1a0:6856:d12c with SMTP id h39-20020a056a20432700b001a06856d12cmr1584913pzk.18.1709295965331;
        Fri, 01 Mar 2024 04:26:05 -0800 (PST)
Received: from thinkpad ([2409:40f4:13:3cbc:2484:3780:dcff:ebcf])
        by smtp.gmail.com with ESMTPSA id p12-20020aa7860c000000b006e50e79f155sm2834437pfn.60.2024.03.01.04.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 04:26:04 -0800 (PST)
Date: Fri, 1 Mar 2024 17:55:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Kalle Valo (QUIC)" <quic_kvalo@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/3] bus: mhi: host: add mhi_power_down_keep_dev()
Message-ID: <20240301122559.GB2401@thinkpad>
References: <20240228022243.17762-1-quic_bqiang@quicinc.com>
 <20240228022243.17762-2-quic_bqiang@quicinc.com>
 <20240229101202.GB2999@thinkpad>
 <531daaa9-cf14-4812-8908-c617bd25bc08@quicinc.com>
 <87le7383nd.fsf@kernel.org>
 <b5b3f46d-ad98-44e5-84e0-7b00fe29ec5a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5b3f46d-ad98-44e5-84e0-7b00fe29ec5a@quicinc.com>

On Fri, Mar 01, 2024 at 10:04:06AM +0800, Baochen Qiang wrote:
> 
> 
> On 3/1/2024 3:35 AM, Kalle Valo wrote:
> > Baochen Qiang <quic_bqiang@quicinc.com> writes:
> > 
> > > On 2/29/2024 6:12 PM, Manivannan Sadhasivam wrote:
> > > > On Wed, Feb 28, 2024 at 10:22:41AM +0800, Baochen Qiang wrote:
> > > > > ath11k fails to resume:
> > > > > 
> > > > > ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
> > > > > 
> > > > > This happens because when calling mhi_sync_power_up() the MHI subsystem
> > > > > eventually calls device_add() from mhi_create_devices() but the device
> > > > > creation is deferred:
> > > > > 
> > > > > mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
> > > > > 
> > > > > The reason for deferring device creation is explained in dpm_prepare():
> > > > > 
> > > > >           /*
> > > > >            * It is unsafe if probing of devices will happen during suspend or
> > > > >            * hibernation and system behavior will be unpredictable in this case.
> > > > >            * So, let's prohibit device's probing here and defer their probes
> > > > >            * instead. The normal behavior will be restored in dpm_complete().
> > > > >            */
> > > > > 
> > > > > Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not
> > > > > called and thus MHI channels are not prepared:
> > > > > 
> > > > > So what this means that QRTR is not delivering messages and the QMI connection
> > > > > is not working between ath11k and the firmware, resulting a failure in firmware
> > > > > initialization.
> > > > > 
> > > > > To fix this add new function mhi_power_down_keep_dev() which doesn't destroy
> > > > > the devices for channels during power down. This way we avoid probe defer issue
> > > > > and finally can get ath11k hibernation working with the following patches.
> > > > > 
> > > > > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> > > > > 
> > > > > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> > > > 
> > > > Did Kalle co-author this patch? If so, his Co-developed-by tag should
> > > > be added.
> > > 
> > > Hmm, I'm not sure...  I would like Kalle's thoughts on this.
> > 
> > IIRC I did only some simple cleanup before submitting the patch so I
> > don't think Co-developed-by is justified. I'm also fine with removing my
> > Signed-off-by.
> Thanks Kalle.
> 
> Hi Mani, so according to Kalle's comments, I'd like to keep the patch as is.
> 

No. Either remove his signed off by (as indicated by Kalle) or add a
co-developed-by tag. Keeping just a signed-off-by tag is wrong.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

