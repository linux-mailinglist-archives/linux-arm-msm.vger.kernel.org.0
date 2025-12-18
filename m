Return-Path: <linux-arm-msm+bounces-85613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158DCC9F01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 01:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA2523027DB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 00:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0D13A1E8A;
	Thu, 18 Dec 2025 00:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fxs+LEl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMDIdPV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E21FF5E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766019415; cv=none; b=hpzQ9ec//v3f/NUMmNxroTI3PJwqGjcIzD6dus57xvTrtIoWyI9Zo1rCuLBfuPAPpbv+fryogDscIAeBLJKGIVL2jCbdGOwbHIbiJly7Joj/G1mItNKH+MthHzw2NwSQQQM8QhtESGsb1Yufqj9t9WBzaTpnRASLoYqOTORiYts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766019415; c=relaxed/simple;
	bh=CJekoQWXCJNfgrXROmC9g9+hjLZLYWX3JsK/OoKFYAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8gupImioKh9XzszLLPQNxug/pk7QR67lsDhYyLVczt37wBdqBdJcQ1XGivHwO/7NCRF015ti52QRk99gzk0mUlGuP1gyEdkqQAo0UwqoEqJqDkYsHKylAxu6fhoSPQq5yTRfA4tCWHi6zfnfblcz7JaRvWbAPrWmtz0zZOJEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fxs+LEl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMDIdPV4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHKXUaF3743455
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiQBhPQ1TALsrrID+vtryhq0T/DQA1ylaIXlvBUxIFU=; b=Fxs+LEl06NAtB6I9
	SGMZGZvrFre2Qym9RCVUM4JeB+BiXFA533ydUqwAOaEF7agEcqPNiCEpmqHcLpIw
	TeIQuSNhXbOkY1zCtmaYYnlgFkMgQH643U1mfB3pP+gNQFoTc6dLPl9bCZKGC2Fl
	lSSYoRe7WzUCCDYNtAVMevCIm3sNfBy1DQvofarlmWq4pEFrYsYVZAdl46mGugkF
	ctViTBkrggzffEfvG1ybohRL9zmQBzPPJYsIK0L90d9y0ev16qPiXJqXtTeN6ZYy
	R71y8XUZjTMZtc+gXw45YRDqGSbGnqQxVO6teprDTHlzvKnK1dSK++Us3BLrWJqB
	xFHreQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmrknm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:56:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a3a4af701so3083846d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766019412; x=1766624212; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiQBhPQ1TALsrrID+vtryhq0T/DQA1ylaIXlvBUxIFU=;
        b=dMDIdPV4oN2jLgVL3FRsxOG7IXEkH1HePG4A+ro1mPPde/Fc2v89FZwNWvZ2v9tNSC
         n1390L2C8mCt8mwtPbVK0WikOYujQoUlpaa/ZWRBIxUELcfzEYDmm/Xlc2jYplXjWSrM
         JwLAWT999MnrP6XN3SPhRsf7bAos97hZe/rQO7KlUN5jVH9LHXVpKqykznJLSx8C5m/9
         T4479NRX0t3V9HhxcHg8vuy0MUfsOIJkSdFkKeXZigA8Njvx9gctTl52D3cEeBhSWMx6
         +7P4+qxXhutQsg1X99hzzlH0tQRdu7ur2r7ZTH5eh86Bx5SbAnpiz9/IkmFGLiTI6d6U
         vRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766019412; x=1766624212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiQBhPQ1TALsrrID+vtryhq0T/DQA1ylaIXlvBUxIFU=;
        b=S5K+dCPRZxQnfQMNXQGu9mB6Jd+1WS+u7CJezA7/lIpePAYb3U9GQ+UctRZikTTQop
         fn+yAW5iE4gLa7O5q9By1lX2E8iWKnAObc1MuZVF0Vb/PO8/iTVL3y+/JjMp5apoYFgO
         CEA3FW1faeHMtQ6K92vdTPGr8ivpWo2R2AChPIiA3XhrHIquAPXlBIcJlqeYAOOEMGMt
         Dq2yJt2JdhaTFtJ0Azr6jEKlIcbA/kpYwdj6t+DFbKsKZwyjXnnE2W0ScjbkXHgHI+26
         kwIpo9j4ttdlkLatEe2rtffOybUzHwZCG3+YQ/kOOQz0kNUteKWdhrEAA2q7JzHAkZek
         3BVg==
X-Forwarded-Encrypted: i=1; AJvYcCUgSGsAiNLvty+wm3/s428wGGhx2c6O/DYJ3B0MAHnAf/0YNxFhfWhyEAda2KTGEBxJjLJQYG9uwgOLJBFr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs5VBTWhSIalVe/oCY+vKUJATpxungEHIL026FKHlc0LixseKh
	a3xhN2KYazJ8c7u+LPo8dHVGK2aCTqbngQVqnQV/y04F1PGkZUNTMAQetCeXeXeQs1wteQrN4Qq
	nL0eqEBnqFEUNOis+i2sT6GNH24xM1pWbuXNFkhc42Pc9adgF+saDB1I/MwevVeEOyuBk
X-Gm-Gg: AY/fxX5L8u55rVNw6VYwPK5g9jTEjor0jP47gJC3wbyIK4Naq84TDt4ykT41K2OCzgX
	YM2FgSApHoEHojG+UIcEY3PnxitgmFrsRQbhsOzq0buvfokmcvM90tVdfeziH1Ic1y4W54G7diD
	vbnGQtrah1blyOlSXMDP/nATvq1iK3KV4VgdVwlp4Seg9D0AQK0jYYmg35YL0ifELoqRJ7a+RfI
	01kCCByLZd1rQrn64RKnE3czGGzNYq/z0RGsbSsFGYVe9HRbtL/Z9a+h97lDCzI4Ndp2gRH2O27
	mt6vwpJFVBWF2+xQjGNLy86Nfddfcca0+cXaLI755g+YbetZQmV7/0UR6ewdZEsdiBPDW9TuT/z
	Ji5KzhMYFau+AIXIp549CusH580KlDOqAmjRKwAR53fbAOoq5pxqhSSk5lh+uT8DP5jA+e0Hmp/
	KYDsnHvPUGwzHoxbwvoI9wl6s=
X-Received: by 2002:a05:6214:3f88:b0:888:b2b5:81d3 with SMTP id 6a1803df08f44-888b2b58387mr253470326d6.25.1766019411781;
        Wed, 17 Dec 2025 16:56:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqboVwFq4SsdhaXnQPhWtnWAC55+mjpl8i4P1O6TUMvk3T4onhuiOJWP08Iy22OuT15YM66g==
X-Received: by 2002:a05:6214:3f88:b0:888:b2b5:81d3 with SMTP id 6a1803df08f44-888b2b58387mr253470096d6.25.1766019411309;
        Wed, 17 Dec 2025 16:56:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a13506a35sm365547e87.89.2025.12.17.16.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:56:50 -0800 (PST)
Date: Thu, 18 Dec 2025 02:56:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, andersson@kernel.org
Subject: Re: [PATCH v3] phy: qcom-qusb2: Fix NULL pointer dereference on
 early suspend
Message-ID: <ejzsnwkz5mhgmfp6bh2hbq3c2einvw6xoesh3yem6d77t7rbtr@vfqrpmpd4lqz>
References: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com>
 <aktk3ofvgdusfo33kebaepfc2epyty36sltxxceaq5q2gy2kfz@6lki7itbthd5>
 <CAFEp6-1nQHUTQwaxX0TrjFuKsAGYjdMHG0018z8FqsXZQ0Nffg@mail.gmail.com>
 <53a56an76s3ehg6eufr66l5ch2ygmp5wmc7dfqbp3srbspcuo6@i5r4gkadykm2>
 <CAFEp6-3x2JiqermQw-9S=+73gTCVSFyNuDLr85b=Ry2TRJDhyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3x2JiqermQw-9S=+73gTCVSFyNuDLr85b=Ry2TRJDhyw@mail.gmail.com>
X-Proofpoint-GUID: dNaUOvo8ZSmcOEzaNRNjaszcYtWFpRyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNSBTYWx0ZWRfXx33QMBAVdWfr
 2maMzH+1Gew0vi/1F1Zo7XiI8zxZAp+dOAsBnkGE3W/og+Ro6np3mD0eDwgre0DhApuj1pqCiJ9
 Yglc5B4JIOXH+Lb64ADzVab4P5EH23LVjJDzA5JOebWl7HN/bwwfQOJhpsClYDYBNhX/ogA2DZT
 ztF31U3+AmXIdOSCjLlOfuUUMlpC6bZchuOoEUQTvhD9lPh6kk1iuXeJ4C2ydACGyc5Aw+0QoAy
 BF3K37bC+BOoMVkkmifTnOVpsTHu99oJIAGpU6X4AvlIr9iuR2WamuYI2kGCc0oHz/cwjpMdS4V
 L6b6RX3kB8z9lMlfI7II+/QYFRZVgM5FdpV7aK/38JolLfRf+l/WSBUdZrJs6EF2cBNIZ9mugOS
 jnYuOmLbIqP4Y8hgxAdz8ewR7aCK0w==
X-Proofpoint-ORIG-GUID: dNaUOvo8ZSmcOEzaNRNjaszcYtWFpRyS
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=69435154 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AReADLFyNFYBa5P5A8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180005

On Tue, Dec 16, 2025 at 10:36:54AM +0100, Loic Poulain wrote:
> Hi Dmitry,
> 
> On Mon, Dec 15, 2025 at 9:16 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Dec 15, 2025 at 09:49:21AM +0100, Loic Poulain wrote:
> > > Hi Dmitry,
> > >
> > > On Fri, Dec 12, 2025 at 8:30 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Thu, Dec 11, 2025 at 04:35:36PM +0100, Loic Poulain wrote:
> > > > > Enabling runtime PM before attaching the QPHY instance as driver data
> > > > > can lead to a NULL pointer dereference in runtime PM callbacks that
> > > > > expect valid driver data. There is a small window where the suspend
> > > > > callback may run after PM runtime enabling and before runtime forbid.
> > > > > This causes a sporadic crash during boot:
> > > > >
> > > > > ```
> > > > > Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
> > > > > [...]
> > > > > CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
> > > > > Workqueue: pm pm_runtime_work
> > > > > pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > > > pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> > > > > lr : pm_generic_runtime_suspend+0x2c/0x44
> > > > > [...]
> > > > > ```
> > > > >
> > > > > Attach the QPHY instance as driver data before enabling runtime PM to
> > > > > prevent NULL pointer dereference in runtime PM callbacks.
> > > > >
> > > > > Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> > > > > short window where an unnecessary runtime suspend can occur.
> > > > >
> > > > > Use the devres-managed version to ensure PM runtime is symmetrically
> > > > > disabled during driver removal for proper cleanup.
> > > > >
> > > > > Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > > >  v3: The phy-core expects parent's runtime-pm to be setup before creating
> > > > >      the phy, so move back runtime-pm to its initial location and
> > > > >      relocate dev_set_drvdata() instead.
> > > > >
> > > > >  v2: Move runtime-pm enabling after dev_set_drvdata
> > > > >      use devm_pm_runtime_enable() to fix unbalanced enabling on removal
> > > > >      reword commit message
> > > > >
> > > > >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++--------
> > > > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > > > index b5514a32ff8f..6386d834b0e4 100644
> > > > > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > > > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > > > @@ -1093,29 +1093,27 @@ static int qusb2_phy_probe(struct platform_device *pdev)
> > > > >               or->hsdisc_trim.override = true;
> > > > >       }
> > > > >
> > > > > -     pm_runtime_set_active(dev);
> > > > > -     pm_runtime_enable(dev);
> > > > > +     dev_set_drvdata(dev, qphy);
> > > > > +
> > > > >       /*
> > > > > -      * Prevent runtime pm from being ON by default. Users can enable
> > > > > -      * it using power/control in sysfs.
> > > > > +      * Enable runtime PM support, but forbid it by default.
> > > > > +      * Users can allow it again via the power/control attribute in sysfs.
> > > > >        */
> > > > > +     pm_runtime_set_active(dev);
> > > > >       pm_runtime_forbid(dev);
> > > >
> > > > I think, this should be called after enabling runtime PM. Please correct
> > > > me if I'm wrong.
> > >
> > > enable/disable and forbid/allow appear to be orthogonal, the purpose
> > > of inverting them here is to prevent an unnecessary suspend/resume
> > > cycle from occurring between enable and forbid. Also, this sequence
> > > has been tested and works correctly.
> >
> > I see that in most of the places pm_runtime_forbid() is being called
> > after pm_runtime_enable() rather than before.
> 
> Yes, this pattern has been used/replicated in several places, and
> while it is logically valid, it doesn’t necessarily make it a good
> practice. In fact, it leaves room for opportunistic runtime suspend to
> occur, whereas the usual expectation is to completely block runtime
> suspend (as initially expected in this phy driver).
> 
> An example of the 'right' pattern can be found in the PCI core: the
> pci_pm_init() function calls pm_runtime_set_active() and
> pm_runtime_forbid() before invoking pm_runtime_enable().
> 
> > It makes sense since
> > forbid is defined as: "Resume @dev if already suspended and block
> > runtime suspend". It's not clear what _is_ the behaviour if runtime PM
> > is disabled and will be enabled later.
> 
> I’m not entirely convinced that it implies a specific order.
> Another common pattern seen in drivers is the following:
> ```
> pm_runtime_get_noresume(dev);
> pm_runtime_set_active(dev);
> pm_runtime_enable(dev);
> ```
> 
> The above is typically used to prevent the device from entering
> suspend during initialization. pm_runtime_get_noresume() behaves
> somewhat like pm_runtime_forbid(), but get_noresume() is usually
> balanced by a corresponding pm_runtime_put_*() at the end of
> initialization, whereas pm_runtime_forbid() blocks runtime suspend
> until it is explicitly reverted with pm_runtime_allow() (usually from
> userside via sysfs).
> 
> Also  pm_runtime_enable() operates on a depth counter, so calling it
> at a specific point does not necessarily guarantee its activation, I
> think this reduces any strictness of ordering expectations compared to
> pm_runtime_forbid().

Ack.

> 
> >
> > >
> > > >
> > > > > +     devm_pm_runtime_enable(dev);
> > > >
> > > > Missing error handling
> > >
> > > I wasn’t certain whether we should abort on this non-fatal error,
> > > since the driver can operate without PM-runtime enabled. However, if
> > > this error occurs, it likely indicates a more significant underlying
> > > memory issue.
> >
> > Yes. Nevertheless, in general errors should be handled rather than being
> > ignored.
> 
> Ack.
> 
> >
> > >
> > >
> > > >
> > > > >
> > > > >       generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
> > > > >       if (IS_ERR(generic_phy)) {
> > > > >               ret = PTR_ERR(generic_phy);
> > > > >               dev_err(dev, "failed to create phy, %d\n", ret);
> > > > > -             pm_runtime_disable(dev);
> > > > >               return ret;
> > > > >       }
> > > > >       qphy->phy = generic_phy;
> > > > >
> > > > > -     dev_set_drvdata(dev, qphy);
> > > > >       phy_set_drvdata(generic_phy, qphy);
> > > > >
> > > > >       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > > > > -     if (IS_ERR(phy_provider))
> > > > > -             pm_runtime_disable(dev);
> > > > >
> > > > >       return PTR_ERR_OR_ZERO(phy_provider);
> > > > >  }
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry
> 
> Regards,
> Loic

-- 
With best wishes
Dmitry

