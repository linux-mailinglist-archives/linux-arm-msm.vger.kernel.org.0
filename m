Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3EA464A5B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 10:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348148AbhLAJMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 04:12:30 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:32268 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242325AbhLAJM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 04:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638349744;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=ktYS9iuRKHdZDzICD4l2BwfqGtaFxG7/qEVsEt7N3Jg=;
    b=BJ7ga5T8603X7+gtXhrnhRDXGVPHG29IJ4lhXtDhebeYWxwhw7JvQ62EZaH0jQJlZW
    PlaQhg6pGz1lEpLJWHxloYKC20Kry0Lr4RvB++V/gEtrXSSE2hBKKZ2TQXxbSsS0qPSB
    ylsAZjTtCsuyHsLIgfHAntGCJItreV87YB1BuZ2XYLzqxVoZ9B3KVpCRoU/UJfbIzYUf
    uuykiATar6su76mAezl1VG7jyxXDY8vOwxOxiXmOOH4mYqy/iRAbHN51D6BEognwWMdy
    QonYQh/nDPSNLwgDhVTrsakf/WRjNgaYIrBkobCQbLq5CNsuLtQKKXzE9F4kMhPzCVzz
    b/9A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK85/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB1993eju
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 1 Dec 2021 10:09:03 +0100 (CET)
Date:   Wed, 1 Dec 2021 10:09:02 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Populate additional
 devices from DT
Message-ID: <Yac7rvxHhWld1/s3@gerhold.net>
References: <20211129132930.6901-1-stephan@gerhold.net>
 <20211129132930.6901-2-stephan@gerhold.net>
 <Yabw7kCsbhE1EFhW@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yabw7kCsbhE1EFhW@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 30, 2021 at 09:50:06PM -0600, Bjorn Andersson wrote:
> On Mon 29 Nov 07:29 CST 2021, Stephan Gerhold wrote:
> 
> > Some devices without own memory resources could be placed anywhere in the
> > device tree but they logically belong to the modem remote processor. Make
> > it possible to probe them when defined under the mpss device tree node
> > by calling of_platform_populate().
> > 
> 
> This seems reasonable, but other "child devices" of the remoteproc
> follows the state of the remoteproc instance. So I'm worried that this
> will create an inconsistency in that assumption.
> 

On Linux there are two devices managed by qcom_q6v5_mss, the platform
device used by the driver and the actual remoteproc instance that has
the state. The devices that follow the state are children of the
remoteproc instance. I'm creating BAM-DMUX below the platform device.

This is just not represented in the device tree very well since both
platform device and remoteproc instance share the same device tree node.
However, all the state managed nodes are manually managed and do not
have a compatible so it should not cause problems.

> > This can be used for BAM-DMUX for example, which provides the WWAN network
> > interfaces on some older Qualcomm SoCs such as MSM8916 or MSM8974.
> > 
> 
> Is there a technical reason for placing the BAM-DMUX within the modem
> remoteproc node? Can we simply move it to / ?
> 

I had it at / originally and at the moment it would still work there.
I moved it below the remoteproc when the whole "WWAN subsystem"
discussion came up. The goal is to have a common parent device for all
the ports of a WWAN modem.

The way it works is that you give the WWAN subsystem a (parent) device
that represents the modem itself, and then it groups all WWAN ports
below that. The control ports (rpmsg_wwan_ctrl driver) are currently
already created below the modem platform device.

The bam-dmux driver does not integrate with the WWAN subsystem yet
because of some unrelated open problems, but in the future I will likely
need a reference to the modem platform device there as well.

There are other approaches of course (e.g. a phandle to the modem
remoteproc node), but I still think it logically fits best somewhere
below the modem node. If the modem remoteproc is status = "disabled",
it does not make sense to load bam-dmux either etc.

Thanks,
Stephan

> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > index 43ea8455546c..69f3d1ebf1f1 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -1989,8 +1989,14 @@ static int q6v5_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto remove_sysmon_subdev;
> >  
> > +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> > +	if (ret)
> > +		goto remove_rproc;
> > +
> >  	return 0;
> >  
> > +remove_rproc:
> > +	rproc_del(rproc);
> >  remove_sysmon_subdev:
> >  	qcom_remove_sysmon_subdev(qproc->sysmon);
> >  remove_subdevs:
> > @@ -2010,6 +2016,7 @@ static int q6v5_remove(struct platform_device *pdev)
> >  	struct q6v5 *qproc = platform_get_drvdata(pdev);
> >  	struct rproc *rproc = qproc->rproc;
> >  
> > +	of_platform_depopulate(&pdev->dev);
> >  	rproc_del(rproc);
> >  
> >  	qcom_q6v5_deinit(&qproc->q6v5);
> > -- 
> > 2.34.1
> > 
