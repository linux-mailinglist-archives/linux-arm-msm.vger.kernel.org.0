Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA3F15FD62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2020 08:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgBOHre (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Feb 2020 02:47:34 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55833 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgBOHre (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Feb 2020 02:47:34 -0500
Received: by mail-pj1-f68.google.com with SMTP id d5so4929690pjz.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2020 23:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RmS3UC8bPkkz9lo4DU6M/3vsoQD/Hkdal8YVW6UXA+w=;
        b=sqf5OSIUbrh8u46okrvtaKolRuKM9WwFjDadO2yGQ0VCwJUxotN7C88JavRujkr5jj
         ejhf3YctTUKN/6hqwpDHj6VGIuxdqs+/sCJDy50HAcEEwZql6TV4l9hj4nLckEZW9CCz
         H01rTThbAVpTMrjVYn5FJH7yoim2CmYgTLoGlL7tkxEVayOqsmJBMIxsZfzkz2m8irO5
         ig6M4iqapgeMPyyYdpj0P6hK4yvEKOyzWx0/ERLNDp75XU/s+aPkTzcaESfDyiRYRndM
         bmBGgVLPGmnAWkQYexGNmXkAKNmxQE0nPglPnvndB2XhdQz0drmpl+U29S2knYjOQvHP
         Wj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RmS3UC8bPkkz9lo4DU6M/3vsoQD/Hkdal8YVW6UXA+w=;
        b=Des0DUCWVHpvlsm5av923nv741L6TfJ0lEDbcvgPifEEqk4GD2aKi4XNk9YTOYjeaT
         ZcdlggabeUjKGMxe1/Ojw1P52xi1TQOzauUhPBCeXVoaTy/o27QGdSt7fdCZ39h6/+3z
         GQ7joIG2AEr31Tij4YXTdmg9X2xpms75duHZlHSET/eZ5X5YiE7b69Bgv0QMz/8CamNI
         UyEbpHRFW9JqMJFq3ZpSTp7dwvdJAulUhoYmMsyCKxtemut4PyOxPDcNz76J0TgGUU+H
         p4AiPac2FfRmv+JfQ5qwbH8FRUuz1s2CgsQXp3IPfwkQrBwmY2UzqUUy8ZLdUV9cwQmx
         Jvgw==
X-Gm-Message-State: APjAAAX9jeCPkNugjH9j0P8fs3eYp6I7nPOdYobNWkFuQoyTtwNcHBtA
        d8jH28jcsNl9w14q/3wLQQLDig==
X-Google-Smtp-Source: APXvYqzgNR+8K2EWvsSqSROlFx5roIe865yPKqhk0RhiqA1uLWOGXGN0b6T3MGO1EckT35nMT6g7pQ==
X-Received: by 2002:a17:902:a706:: with SMTP id w6mr7097981plq.79.1581752853163;
        Fri, 14 Feb 2020 23:47:33 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id ci5sm8900609pjb.5.2020.02.14.23.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 23:47:32 -0800 (PST)
Date:   Fri, 14 Feb 2020 23:46:41 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        anibal.limon@linaro.org
Subject: Re: [PATCH] remoteproc: qcom: wcnss: Add iris completion barrier
Message-ID: <20200215074641.GS955802@ripper>
References: <1581530043-12112-1-git-send-email-loic.poulain@linaro.org>
 <20200214204627.GA10464@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214204627.GA10464@xps15>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 14 Feb 12:46 PST 2020, Mathieu Poirier wrote:

> On Wed, Feb 12, 2020 at 06:54:03PM +0100, Loic Poulain wrote:
> > There is no guarantee that the iris pointer will be assigned before
> > remoteproc subsystem starts the wcnss rproc, actually it depends how
> > fast rproc subsystem is able to get the firmware to trigger the start.
> > 
> > This leads to sporadic wifi/bluetooth initialization issue on db410c
> > with the following output:
> >  remoteproc remoteproc1: powering up a204000.wcnss
> >  remoteproc remoteproc1: Booting fw image qcom/msm8916/wcnss.mdt...
> >  qcom-wcnss-pil a204000.wcnss: no iris registered
> >  remoteproc remoteproc1: can't start rproc a204000.wcnss: -22
> > 
> > This patch introduces a 'iris_assigned' completion barrier to fix
> > this issue. Maybe not the most elegant way, but it does the trick.
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/remoteproc/qcom_wcnss.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> > index a0468b3..c888282 100644
> > --- a/drivers/remoteproc/qcom_wcnss.c
> > +++ b/drivers/remoteproc/qcom_wcnss.c
> > @@ -84,6 +84,7 @@ struct qcom_wcnss {
> >  
> >  	struct completion start_done;
> >  	struct completion stop_done;
> > +	struct completion iris_assigned;
> >  
> >  	phys_addr_t mem_phys;
> >  	phys_addr_t mem_reloc;
> > @@ -138,6 +139,7 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
> >  
> >  	wcnss->iris = iris;
> >  	wcnss->use_48mhz_xo = use_48mhz_xo;
> > +	complete(&wcnss->iris_assigned);
> >  
> >  	mutex_unlock(&wcnss->iris_lock);
> >  }
> > @@ -213,6 +215,10 @@ static int wcnss_start(struct rproc *rproc)
> >  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
> >  	int ret;
> >  
> > +	/* Grant some time for iris registration */
> > +	wait_for_completion_timeout(&wcnss->iris_assigned,
> > +				    msecs_to_jiffies(5000));
> > +
> >  	mutex_lock(&wcnss->iris_lock);
> >  	if (!wcnss->iris) {
> >  		dev_err(wcnss->dev, "no iris registered\n");
> > @@ -494,6 +500,7 @@ static int wcnss_probe(struct platform_device *pdev)
> >  
> >  	init_completion(&wcnss->start_done);
> >  	init_completion(&wcnss->stop_done);
> > +	init_completion(&wcnss->iris_assigned);
> >  
> >  	mutex_init(&wcnss->iris_lock);
> 
> If I understand the problem correctly, if loading the fw image takes long enough,
> qcom_iris_probe() that is triggered by of_platform_populate() has time to
> complete and call qcom_wcnss_assign_iris().  Otherwise the remoteproc core calls
> wcnss_start() before qcom_wcnss_assign_iris() had the opportunity to run.
> 
> If I am correct, would it be possible to call of_platform_populate() before
> calling rproc_add()?  There might be some refactoring to do but that's probably
> better than introducing a delay...
> 

We'll still have the problem that if the iris device probe defer on the
regulators it still might not be in place when we're hitting
wcnss_start().

Unfortunately we need a struct device with the iris of_node associated,
in order get hold of the regulators, but we should be able to drop the
platform_driver and the probing in favor of just making up a struct
device, associating it with the of_node and requesting the iris
regulators using this.

That would remove the whole timing aspect and we can properly probe
defer the qcom_wcnss when the iris regulators are not yet in place.

Regards,
Bjorn
