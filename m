Return-Path: <linux-arm-msm+bounces-72397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A61B470CF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 16:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F2F87B5AEB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 14:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719EB1F7580;
	Sat,  6 Sep 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wx5nFcnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB791196C7C
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Sep 2025 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757169667; cv=none; b=q4z1d38OUm9IinM56fCx2YE672t4xfurknCsa4F0I0HGMafxZVOuwqHBZ4VpItQ6NPDOmeFc3NrmFFNJqRU+rznhfP5iUB00BEt/BHklIkJE+uwvtAYQUKSjjpMRhAK1PNYSlQxdLmAo+UlE0hxay0A9DLueoxrYG7swjf6t9zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757169667; c=relaxed/simple;
	bh=XVgpzLUHjsqFPq3VSy5wZE6Wo0ZyA4QviALcYF7rVDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQkp6jcTw1IMxgGnyM5vjbTF0tysOBfeSSd18trc3mkaligzHb9Y1923673GRiERcXEc0/9w3XKrBG/l6LMcl8blkM9TdFwQUPE91X5rhX0AU7ZJWNxvHwdZ+prdpAkgK68FRLYDwfSfXJxYg5JVUXNU1cF1uArXJGE1fGZEdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wx5nFcnw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5864mMUs025335
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Sep 2025 14:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1AJNMYOACnHat6lQ30ApXkdKwpIkMu/q+NgZkD0nLg=; b=Wx5nFcnwYH34RHIm
	vz/y+KHFImYXx+DRQjBBUwpSgiBSTuHe/E6WnGkuMYYgQmulU4NVGzEBKXVuxlCg
	zpt4iwoH7+TrR7ZMGv/bYbpsvHAR0m/qi/LEirW5emxKPmPx0d/QJ8JcyxUdKnJh
	IossnynHevxByYUtSmxtrcwVZ7wXBWNroCX50smgnIoesq40mQPtBiuDenRGQkLn
	9gsO02Errg+++PhqPc3UiuZdvBRWNU2L6J7LUCeRpOJ4MevXOV7uuKoQjbFY/1NR
	SVff5T9l4pDACr1uHK3p+2rjlZ+eugVHiJulqv7XmweVmtXrPjp7FwBVGBYwygff
	vw3BRw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a0ns1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 14:41:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24b2b347073so41579435ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 07:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757169664; x=1757774464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1AJNMYOACnHat6lQ30ApXkdKwpIkMu/q+NgZkD0nLg=;
        b=Y2wM7iIVUkNTd7quhdUNZhwjkXrwDkbHe91LnYrN+mNxYV7KWna2bQGm0rfmmQYJPy
         XntJiEoS5tEuXB8cIiW5iFLFpnXWHuIO+YsKpKWPB+vz6HPeB3iNqXtjXk564Qrwc4+G
         tbGuBzpd+gFFqu0nVXFILXhghTAZJm2LXusFbRxBqEkLaGKIbLs59z5fJR4K18yWlZRp
         m+gu5S4dg2eeniJGCaADDhPbwJtBzJGKPwkIefwHQpCQFqzXAgH4RXu7sqz/2kqaaeBC
         xDm7VDjsV/kBReqJ+IqAb4OZnGXZfbpiqxxHCVt2voeZePqq44JiCYO2JEv82CADMw6u
         h7HA==
X-Forwarded-Encrypted: i=1; AJvYcCWyOLs4f9ilPe1+EGucyov3hgCY1VOalqD/191iQssshRPX8ZXgs8szWEAsBqQdKyN3CpNNkyNKrqvUh2Hn@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2+IXP81Gms6eJ0SGN079DMv2ARCMOHjMjqKtWlQWo8GJkDvv
	k1UO63NP28nfaQOYiKqaA8kIipB4rQeScA7gUx5y4q9kgk66xZML7Pq4hLB2PUUslU2nfsULcwd
	Zj7YTniRDRKpbtFmWKwPVJfYa/mhmTKFOVp+HiScXN3DWYjBFj2oFZjhyadsdXIW50svQ
X-Gm-Gg: ASbGncslR71WrhgCBHBo6X+CddVXcED11Tms3UGxf85JAl3no7LM4WEG9jPb5YQsOBO
	hZnKuj9Qv/UUosKIe8Hbb3yR5m4rfODBAq0ZAjAekBYLDf+WVxV0W6U6NW6BvcQ04t28sOZwGcx
	VW1Ovd9bxYeHvcK0frYiwL9S2qwrBN17GGH3SyibFhCR5y3zEWmcq2D7QRKf7txFc1I5HE63C1T
	YlQGa9k1In9PeQSC0GPPewOa/WsqsFcG3JYNyIqNsv9Phd+5GqOPuGKntmqFGapHeuhVdP6zMig
	9RJUQ0B992DLN3iXQq6Bu8wVj8ri1qyCa/PDRXMiTHZgK+20ZNnkULM=
X-Received: by 2002:a17:903:1a67:b0:24c:786a:d7ac with SMTP id d9443c01a7336-25172b4992dmr32392865ad.47.1757169663564;
        Sat, 06 Sep 2025 07:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvC3hrjUHowMh4j/UTPBilKN7zhsjIJE+eKTb2MZvtaoTX2TSU5oKo1aO4zCwdo0bPJRSGXQ==
X-Received: by 2002:a17:903:1a67:b0:24c:786a:d7ac with SMTP id d9443c01a7336-25172b4992dmr32392495ad.47.1757169662968;
        Sat, 06 Sep 2025 07:41:02 -0700 (PDT)
Received: from work ([120.60.77.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cd5092951sm64065285ad.18.2025.09.06.07.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 07:41:02 -0700 (PDT)
Date: Sat, 6 Sep 2025 20:10:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Saravana Kannan <saravanak@google.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Brian Norris <briannorris@chromium.org>, stable+noautosel@kernel.org
Subject: Re: [PATCH v2 1/5] PCI: qcom: Wait for PCIE_RESET_CONFIG_WAIT_MS
 after PERST# deassert
Message-ID: <5vqicxeaqdljsahpsddrfcwrkqdoszq3k5ziw4kurqfwwwbjje@ynyzteelkiw4>
References: <20250903-pci-pwrctrl-perst-v2-1-2d461ed0e061@oss.qualcomm.com>
 <20250905224430.GA1325412@bhelgaas>
 <7kmf767g4jelftwbbvikk6h3tclkih3t5zrkffeyfjuy2qe3uw@tok2rpim6f7d>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7kmf767g4jelftwbbvikk6h3tclkih3t5zrkffeyfjuy2qe3uw@tok2rpim6f7d>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bc4800 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=z2tU9dNso2TEGt+FTYZWDQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gin1pDFbZLjaKAFN3YwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0sZPAQQ9lJ2ghubw_yre9jJHu12WIDZ5
X-Proofpoint-ORIG-GUID: 0sZPAQQ9lJ2ghubw_yre9jJHu12WIDZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX54Wa6QYMlVlm
 gyEZ8r9qtiSugLRI2YsUeFinmKSkHWIeb0DtTnThayU61kpwULwmJlUJIC0kuB/Mg8Fdsqhn6ZG
 eP7Tg3nwrLxIEzZADQvomL8o7xJSBvLZGaBrQSQA43mkvMo7gwRpErLWx8BizRIxA9ZNI3tSA6e
 ysqudVl48JXSuQwV6iXcAEQefhRckokEoihzKkhPYbCyBh0byXMM8ruLgQn3PfNPXxumu5qdgye
 V3Ud/O8tvfPuQzMwF/onSzdvxXCyuz6yn+f2un2tgb8Cf2PFdR4Y043Iwj8ASz5EDYdKZlQDjCS
 6ddmD8gqr+gMbv9HhOAF4QZKsFYx9kz/bJ1CFVAdf5IPNJXglHO58XuYp5BFitbVxZte3fVDGNH
 W5HgcSui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Sat, Sep 06, 2025 at 04:13:08PM GMT, Manivannan Sadhasivam wrote:
> On Fri, Sep 05, 2025 at 05:44:30PM GMT, Bjorn Helgaas wrote:
> > On Wed, Sep 03, 2025 at 12:43:23PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > PCIe spec r6.0, sec 6.6.1 mandates waiting for 100ms before deasserting
> > > PERST# if the downstream port does not support Link speeds greater than
> > > 5.0 GT/s.
> > 
> > I guess you mean we need to wait 100ms *after* deasserting PERST#?
> > 
> 
> Right, that's a typo.
> 
> > I.e., this wait before sending config requests to a downstream device:
> > 
> >   ◦ With a Downstream Port that does not support Link speeds greater
> >     than 5.0 GT/s, software must wait a minimum of 100 ms following
> >     exit from a Conventional Reset before sending a Configuration
> >     Request to the device immediately below that Port.
> > 
> > > But in practice, this delay seem to be required irrespective of
> > > the supported link speed as it gives the endpoints enough time to
> > > initialize.
> > 
> > Saying "but in practice ... seems to be required" suggests that the
> > spec requirement isn't actually enough.  But the spec does say the
> > 100ms delay before config requests is required for all link speeds.
> > The difference is when we start that timer: for 5 GT/s or slower it
> > starts at exit from Conventional Reset; for faster than 5 GT/s it
> > starts when link training completes.
> > 
> > > Hence, add the delay by reusing the PCIE_RESET_CONFIG_WAIT_MS definition if
> > > the linkup_irq is not supported. If the linkup_irq is supported, the driver
> > > already waits for 100ms in the IRQ handler post link up.
> > 
> > I didn't look into this, but I wondered whether it's possible to miss
> > the interrupt, especially the first time during probe.
> > 
> 
> No, it is not. Since, the controller reinitializes itself during probe() and it
> starts LTSSM. So once link up happens, this IRQ will be triggered.
> 
> > > Also, remove the redundant comment for PCIE_T_PVPERL_MS. Finally, the
> > > PERST_DELAY_US sleep can be moved to PERST# assert where it should be.
> > 
> > Unless this PERST_DELAY_US move is logically part of the
> > PCIE_RESET_CONFIG_WAIT_MS change, putting it in a separate patch would
> > make *this* patch easier to read.
> > 
> > > Cc: stable+noautosel@kernel.org # non-trivial dependency
> > > Fixes: 82a823833f4e ("PCI: qcom: Add Qualcomm PCIe controller driver")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-qcom.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..bcd080315d70e64eafdefd852740fe07df3dbe75 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -302,20 +302,22 @@ static void qcom_perst_assert(struct qcom_pcie *pcie, bool assert)
> > >  	else
> > >  		list_for_each_entry(port, &pcie->ports, list)
> > >  			gpiod_set_value_cansleep(port->reset, val);
> > > -
> > > -	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
> > >  }
> > >  
> > >  static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> > >  {
> > >  	qcom_perst_assert(pcie, true);
> > > +	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
> > >  }
> > >  
> > >  static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
> > >  {
> > > -	/* Ensure that PERST has been asserted for at least 100 ms */
> > > +	struct dw_pcie_rp *pp = &pcie->pci->pp;
> > > +
> > >  	msleep(PCIE_T_PVPERL_MS);
> > >  	qcom_perst_assert(pcie, false);
> > > +	if (!pp->use_linkup_irq)
> > > +		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > 
> > I'm a little confused about why you test pp->use_linkup_irq here
> > instead of testing the max supported link speed.  And I'm not positive
> > that this is the right place, at least at this point in the series.
> > 
> 
> Because, pci->max_link_speed used to only cache the value of the
> 'max-link-speed' DT property. But I totally forgot that I changed that behavior
> to cache the max supported link speed of the Root Port with commit:
> 19a69cbd9d43 ("PCI: dwc: Always cache the maximum link speed value in
> dw_pcie::max_link_speed")
> 
> So yes, I should've been using 'pci->max_link_speed' here.
> 
> > At this point, qcom_ep_reset_deassert() is only used by
> > qcom_pcie_host_init(), so the flow is like this:
> > 
> >   qcom_pcie_probe
> >     irq = platform_get_irq_byname_optional(pdev, "global")
> >     if (irq > 0)
> >       pp->use_linkup_irq = true
> >     dw_pcie_host_init
> >       pp->ops->init
> >         qcom_pcie_host_init                         # .init
> >           qcom_ep_reset_deassert                    # <--
> >  +          if (!pp->use_linkup_irq)
> >  +            msleep(PCIE_RESET_CONFIG_WAIT_MS)     # 100ms
> >       if (!dw_pcie_link_up(pci))
> >         dw_pcie_start_link
> >       if (!pp->use_linkup_irq)
> >         dw_pcie_wait_for_link
> >           for (retries = 0; retries < PCIE_LINK_WAIT_MAX_RETRIES; retries++)
> >             if (dw_pcie_link_up(pci))
> >               break
> >             msleep(PCIE_LINK_WAIT_SLEEP_MS)         # 90ms
> >           if (pci->max_link_speed > 2)              # > 5.0 GT/s
> >             msleep(PCIE_RESET_CONFIG_WAIT_MS)       # 100ms
> > 
> > For slow links (<= 5 GT/s), it's possible that the link comes up
> > before we even call dw_pcie_link_up() the first time, which would mean
> > we really don't wait at all.
> > 
> > My guess is that most links wouldn't come up that fast but *would*
> > come up within 90ms.  Even in that case, we wouldn't quite meet the
> > spec 100ms requirement.
> > 
> > I wonder if dw_pcie_wait_for_link() should look more like this:
> > 
> >   dw_pcie_wait_for_link
> >     if (pci->max_link_speed <= 2)                   # <= 5.0 GT/s
> >       msleep(PCIE_RESET_CONFIG_WAIT_MS)         dw_pcie_wait_for_link    # 100ms
> > 
> >     for (retries = 0; retries < PCIE_LINK_WAIT_MAX_RETRIES; retries++)
> >       if (dw_pcie_link_up(pci))
> >         break;
> >       msleep(...)
> > 
> >     if (pci->max_link_speed > 2)                    # > 5.0 GT/s
> >       msleep(PCIE_RESET_CONFIG_WAIT_MS)             # 100ms
> > 
> > Then we'd definitely wait the required 100ms even for the slow links.
> > The retry loop could start with a much shorter interval and back off.
> > 
> 
> Your concerns are valid. I'll submit a separate series along with *this* patch
> to fix these. I don't think clubbing these with this series is a good idea.
> 

I think we missed one bigger issue:

As per r6.0, sec 6.6.1:

"Unless Readiness Notifications mechanisms are used, the Root Complex and/or
system software must allow at least 1.0 s following exit from a Conventional
Reset of a device, before determining that the device is broken if it fails to
return a Successful Completion status for a valid Configuration Request. This
period is independent of how quickly Link training completes."

So this clearly says that the software has to expect a successful completion
status for a valid configuration request sent to the device. But in
dw_pcie_link_up(), we are just waiting for the link training to be completed
by polling the controller specific 'Link Up' bit. And the spec also mentions
clearly that this delay is independent of how quickly the link training
completes.

So the 1.0 s delay doesn't seem to be applicable for link up. But in practice,
we do need to wait *some* time for the link to come up, but doesn't necessarily
1.0 s as mentioned in 6.6.1.

Also, if we go by the spec, we have to make sure that the controller drivers
poll for a successfull completion of a config request (like reading the VID)
of the device for 1.0 s. But how can we know where the device actually lives
in the downstream bus of the Root Port? I believe we cannot assume that the
device will always be in 0.0, or can we?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

