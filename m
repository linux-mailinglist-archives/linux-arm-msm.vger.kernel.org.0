Return-Path: <linux-arm-msm+bounces-85279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39296CBFB88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0FCC300CB8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599261514F8;
	Mon, 15 Dec 2025 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcCIZIyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXju0uo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FBA21507F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765829809; cv=none; b=JbEp+W1r+NHlRkKgubAotlg7+7w75NkoHeICDYqBVyLbyDRYoKJwqoH6+7wxoS0b4aT9E5IHE6HqnSSOWTiz9mzUqkQYVIWgeSuqMQeuWY1L0zag2hbE24qqmSIUh2yXjgDrg9jHxiVBHCpa24t07QOXpIOp7NWjqHbbIANGUxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765829809; c=relaxed/simple;
	bh=uLPQ6bxrse9zOKJF2wp3NtqMeO1Jf01+TiNCt6AUwyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxAaZH5mP64H8jZoUy9Y22Weu7YU474YBrbHLYJ3ZjHaJmikR/B3e2Sr4B1YpsK6UGZcidmAl7os7Hf+05hqj0SmzwTQSCFi1Vgrq973D13b/BLDgkYxNSdmqlTuXHhDgEYCUTOwrimWbcmaxj+Xv3LugAmKpgBmllRBm/esYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcCIZIyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXju0uo0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFDsRiE175693
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqLquTKVPe+aI9e3A6C+brCbX+Ki9xjuWw7rV5rnxmI=; b=jcCIZIyTiojkUwgu
	hYXj7OO8Q95b1XM9ZOtSjlvMYlX2wpl+JrqbLGfKEyDOugwlkLSF68EGIP7Va7GT
	xQn25T4ItBbraXZjs+pN8xCT5zZYkhmCjANRw1m19iUoj4Sj5Szbl9CXqWvBhEOJ
	+Bbl91e0ER90WV3xXufkYpimQ84MY2xobzKi8AFF7DoJ/7v+6o3qe7dUTUNuAC4P
	uDatlknyxHusKHBYf3hrsyh7vmGjcaxoFQ0Cp5IupiySeDNNHs4JKO0Ias6kVbTP
	hlHPZBq55KUFT3X+amBlEj4zWrbgKGgL482InMQBYDNy73n8QFXCIneEMv5OfXXP
	mF1V3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2kmm14rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:16:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee41b07099so46387801cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765829806; x=1766434606; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pqLquTKVPe+aI9e3A6C+brCbX+Ki9xjuWw7rV5rnxmI=;
        b=HXju0uo0X+mph4c+rHD4Xiq13fWCuBNREK3I/pv++ZM78Zb+c02Jw718DFj2E9T/PR
         XdUtqPjOWbY0eznjfgczVNgSNx9G9yQaL9ZDTPJmFj1K9XgoZvZJogBbDleqtcTTiT3a
         XYcrmFJOmZPipeb4J+Ka6OP7t3/QmrQyFYQ/FL+cYW/qxQY0kWwL+8S05x3itoYjimr6
         nQGGVxC9hvFNwAK9yAy8bEuuf6guaK4s2ONlUDgsmkm/V1+z+cXPBBW9TCcbaD4AXU/r
         6CryElRgTF4SHsRYKWPP3RotzfExRC8IfLFPNLui5+eGX4PyuLKW44gydz/mjgwxqpRl
         dVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765829806; x=1766434606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqLquTKVPe+aI9e3A6C+brCbX+Ki9xjuWw7rV5rnxmI=;
        b=WgAH6d5ErgFebu1uGoPif0Vp0Ol8uMAY5NytV8+5wbddxU7UbrcaUAopZs7eIEXo/G
         tY1RC2Ou+xmguRPq5pRyWSaJBidK1qYENRU/NFAdKcg7iocc2d3jogpPoL+gd0k7cSr2
         er+AO+RYdjtGrur2VAx9AFyci9DpQ5ujMxzDDM1SfhsvohJ+DZu65O+ZfauHye8slqWX
         ge1XZsFk7pa3+bRWgwBU0F3dVxHisj8Gb7xyxQ+AoaDk7s4HJMkgYsA3chptW/JrVT23
         SIdhROGaPeHmK3bD3o3OzL1zpTAEXTN2E7mhcfJPP0U6C7zRBk7g4q7+TY8AG+L16gmJ
         nxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI3ah39cYSGx94+E4bEfAflYLj2cm8KK/T4PPh7CZeRpvgo+aUo9LwBlfAyr0O2JKl8J1zRz5A6jYKjzGY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/WXtgx7vtFTXlQW7JxggDLUGOytxoqlTe9DYB58IMh3YL1oz
	VjuLjKlOM+V+2ZY3psvyLmBfs8AzFH6Pq95PmvDBzj2vcLB1QTeuNjAkL4KtTFwMPm/uNZAFUtk
	pVoSuYTF17sZao8ggjXCvRR9c9wcahfQWZbK5kxQADRP82uYD5GLLHOvO/AD3XzbcgTpa
X-Gm-Gg: AY/fxX41ZgIIrKl68+mAnmVGHIzumrvQasocY1l5unUTPviYnDmIq7lAREW6mA/A2Yt
	DKww8gXSJGb56LU6xLB3sw9QupNazIwlLN3HW19kFKcOHZ2puNPG6r319myWCq00/5tUzyO4MNQ
	3zaKMmRsIwV3yKNdmnLpKKN9QFEP5Ha6BH3uOkj+5Gkdd9WsWweJaxlQpmnR9IGwranojezNGhW
	DmgyrgQjY26HL+t0TjpJiQUk6j3J9OTZh2WNyao5R0djvG/qv/lbv7yeth8Kbx4161tabRKEhn/
	EHayrghwuIQtOVuiMg+f4uQ5Zx2okYV1HsyuWvMfDO55KDJD5cJzYnu2Z3eskNDqSd5InBjmbk9
	aAAkGD9B9GJ8azy117EytPMGs7RzmfPkAdzCoFRz+OqyQbLUJgEjUoFtg00IKlxIKXRb8bBSmLA
	NY0DzzXcXNa/QVfanYRCwSPBM=
X-Received: by 2002:a05:622a:5143:b0:4f1:bbaf:c5d3 with SMTP id d75a77b69052e-4f1d0627701mr170026831cf.59.1765829805544;
        Mon, 15 Dec 2025 12:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUMgwGjiRa8BlTzdwK7Fqb1zinfr0genufgjWu/97YuFobCv1dASGcjlM3fL99zPCXnKmDEw==
X-Received: by 2002:a05:622a:5143:b0:4f1:bbaf:c5d3 with SMTP id d75a77b69052e-4f1d0627701mr170026211cf.59.1765829804757;
        Mon, 15 Dec 2025 12:16:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da607f9sm102917e87.87.2025.12.15.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:16:44 -0800 (PST)
Date: Mon, 15 Dec 2025 22:16:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Subject: Re: [PATCH v3] phy: qcom-qusb2: Fix NULL pointer dereference on
 early suspend
Message-ID: <53a56an76s3ehg6eufr66l5ch2ygmp5wmc7dfqbp3srbspcuo6@i5r4gkadykm2>
References: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com>
 <aktk3ofvgdusfo33kebaepfc2epyty36sltxxceaq5q2gy2kfz@6lki7itbthd5>
 <CAFEp6-1nQHUTQwaxX0TrjFuKsAGYjdMHG0018z8FqsXZQ0Nffg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-1nQHUTQwaxX0TrjFuKsAGYjdMHG0018z8FqsXZQ0Nffg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3NSBTYWx0ZWRfXz28U8DQkT5Wu
 PnDyA4tfgiK9R6RI9IitY5i999kXX+/zu4jI8yWNMd7YSm27dNyhy+2p+IHR73yLyXQP0S2SPPe
 Qg8YYgPBcZo4+Bjr60+KEeVo/I6B3NO2XiZhPVWkXWdDJ+IPpugQEETwMfjm1x8j/cupTZ6zOAq
 HsonAwaCJYDjfiqiUYEPGwAv5qcBjR1tFsmFqw/XOco5Gm0dYUelPT/f5gHBWnSS3tdniyJMy/j
 028bUF+uxrEjYeVWJ+GFjdpdiVUTJWufL8Tr9b9PCB3RuC91cOrbcUX0Wqxnk2ZnEP3hDq3Xs7p
 CTW4lAzyxMjXrjsiJn6dvLunPKcOET9JZR9e+G6JvSrWlrOMUYfCooxJ+mRG60fdNGgd0vcIJaW
 H/xJdGpEnYiSkdi8gMIuRuJ0hGsmNw==
X-Proofpoint-GUID: Yu_xM72wSdTwrK9lgS73iYD6uzTMdcE0
X-Proofpoint-ORIG-GUID: Yu_xM72wSdTwrK9lgS73iYD6uzTMdcE0
X-Authority-Analysis: v=2.4 cv=EcTFgfmC c=1 sm=1 tr=0 ts=69406cae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=q-D-r8dKOzS9vRlWuOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150175

On Mon, Dec 15, 2025 at 09:49:21AM +0100, Loic Poulain wrote:
> Hi Dmitry,
> 
> On Fri, Dec 12, 2025 at 8:30 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Dec 11, 2025 at 04:35:36PM +0100, Loic Poulain wrote:
> > > Enabling runtime PM before attaching the QPHY instance as driver data
> > > can lead to a NULL pointer dereference in runtime PM callbacks that
> > > expect valid driver data. There is a small window where the suspend
> > > callback may run after PM runtime enabling and before runtime forbid.
> > > This causes a sporadic crash during boot:
> > >
> > > ```
> > > Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
> > > [...]
> > > CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
> > > Workqueue: pm pm_runtime_work
> > > pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> > > lr : pm_generic_runtime_suspend+0x2c/0x44
> > > [...]
> > > ```
> > >
> > > Attach the QPHY instance as driver data before enabling runtime PM to
> > > prevent NULL pointer dereference in runtime PM callbacks.
> > >
> > > Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> > > short window where an unnecessary runtime suspend can occur.
> > >
> > > Use the devres-managed version to ensure PM runtime is symmetrically
> > > disabled during driver removal for proper cleanup.
> > >
> > > Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  v3: The phy-core expects parent's runtime-pm to be setup before creating
> > >      the phy, so move back runtime-pm to its initial location and
> > >      relocate dev_set_drvdata() instead.
> > >
> > >  v2: Move runtime-pm enabling after dev_set_drvdata
> > >      use devm_pm_runtime_enable() to fix unbalanced enabling on removal
> > >      reword commit message
> > >
> > >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > index b5514a32ff8f..6386d834b0e4 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > @@ -1093,29 +1093,27 @@ static int qusb2_phy_probe(struct platform_device *pdev)
> > >               or->hsdisc_trim.override = true;
> > >       }
> > >
> > > -     pm_runtime_set_active(dev);
> > > -     pm_runtime_enable(dev);
> > > +     dev_set_drvdata(dev, qphy);
> > > +
> > >       /*
> > > -      * Prevent runtime pm from being ON by default. Users can enable
> > > -      * it using power/control in sysfs.
> > > +      * Enable runtime PM support, but forbid it by default.
> > > +      * Users can allow it again via the power/control attribute in sysfs.
> > >        */
> > > +     pm_runtime_set_active(dev);
> > >       pm_runtime_forbid(dev);
> >
> > I think, this should be called after enabling runtime PM. Please correct
> > me if I'm wrong.
> 
> enable/disable and forbid/allow appear to be orthogonal, the purpose
> of inverting them here is to prevent an unnecessary suspend/resume
> cycle from occurring between enable and forbid. Also, this sequence
> has been tested and works correctly.

I see that in most of the places pm_runtime_forbid() is being called
after pm_runtime_enable() rather than before. It makes sense since
forbid is defined as: "Resume @dev if already suspended and block
runtime suspend". It's not clear what _is_ the behaviour if runtime PM
is disabled and will be enabled later.

> 
> >
> > > +     devm_pm_runtime_enable(dev);
> >
> > Missing error handling
> 
> I wasn’t certain whether we should abort on this non-fatal error,
> since the driver can operate without PM-runtime enabled. However, if
> this error occurs, it likely indicates a more significant underlying
> memory issue.

Yes. Nevertheless, in general errors should be handled rather than being
ignored.

> 
> 
> >
> > >
> > >       generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
> > >       if (IS_ERR(generic_phy)) {
> > >               ret = PTR_ERR(generic_phy);
> > >               dev_err(dev, "failed to create phy, %d\n", ret);
> > > -             pm_runtime_disable(dev);
> > >               return ret;
> > >       }
> > >       qphy->phy = generic_phy;
> > >
> > > -     dev_set_drvdata(dev, qphy);
> > >       phy_set_drvdata(generic_phy, qphy);
> > >
> > >       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > > -     if (IS_ERR(phy_provider))
> > > -             pm_runtime_disable(dev);
> > >
> > >       return PTR_ERR_OR_ZERO(phy_provider);
> > >  }
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

