Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4C534709E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 06:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235212AbhCXFDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 01:03:05 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:38406 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbhCXFDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 01:03:04 -0400
Received: by mail-lf1-f48.google.com with SMTP id f3so21707097lfu.5;
        Tue, 23 Mar 2021 22:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=Yu+c5hKm75xWmBphehGW0wkPgb4hhf6daZ13Tp8/oFw=;
        b=G4lMJVut5IVzR1UvZhn5dr/KqdQR5EnhK/SZ7+X00hxhpZxfYS04tOnjYCRzCOi24Z
         7v9+hecM/hKw3scWXN0uxj65ua8sE9l0E2rvDYoG5XiXdkR4rZ+DVB7rvLr0au1HKE5J
         d8AdrvmBVFShU4S3m3i+4/ekf8WJpLrQP2/BVyWOjD0m7ebZLbanCwf4WYPMY1FZd9ym
         QWnPryHDQgvZWNeAVnYytqoemoRiQ7qqHm8zvm6hHBxcUtAcUT+jxxCx3nPwioCJIvsg
         oBcN0Tc6gGipjV7PjgluLDwkWfq++RymKM22Hos6aDR5AijMc6tXpRBqb7ZrdQ91hP34
         saiA==
X-Gm-Message-State: AOAM5329dARjr+NkQCZo1BNKonrYzxfn7lG5POdHP/x35gSTRiiZiRND
        QHECbllop/VFtdRTg3nByE7Wxmmzc5E=
X-Google-Smtp-Source: ABdhPJz7kd4QmFbOUKs49q6MTXLWXUVwSAj3AuyDgvuKNTbfR5sq8lcR1SgUMe2L+HvUCRrhFS87cw==
X-Received: by 2002:a05:6512:34c3:: with SMTP id w3mr833800lfr.437.1616562182708;
        Tue, 23 Mar 2021 22:03:02 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id h206sm114917lfd.4.2021.03.23.22.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 22:03:01 -0700 (PDT)
Message-ID: <1f5247a81077f6cb3c96730b1202bbd61dd1900b.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v3 3/8] extconn: Clean-up few drivers by using managed
 work init
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <14800e19-da8c-81ba-48ee-cc51cc1925c9@samsung.com>
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
         <CGME20210323135719epcas1p326dfbf8acd6c95703a30d832fb111879@epcas1p3.samsung.com>
         <b1030eddbf0069f2d39e951be1d8e40d6413aeeb.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
         <14800e19-da8c-81ba-48ee-cc51cc1925c9@samsung.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 24 Mar 2021 07:02:52 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Chanwoo, Greg,

Thanks for the review.

On Wed, 2021-03-24 at 11:09 +0900, Chanwoo Choi wrote:
> Hi,
> 
> Need to fix the work as following:
> s/extconn/extcon
> 
> And I'd like you to use the more correct patch title like the
> following example:
> "extcon: Use resource-managed function for delayed work"

I think Greg merged this already. How should we handle this?

> @@ -112,7 +113,9 @@ static int gpio_extcon_probe(struct
> > platform_device *pdev)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	INIT_DELAYED_WORK(&data->work, gpio_extcon_work);
> > +	ret = devm_delayed_work_autocancel(dev, &data->work,
> > gpio_extcon_work);
> > +	if (ret)
> > +		return ret;
> 
> Need to add the error log as following:
> 	if (ret) {
> 		dev_err(dev, "Failed to initialize delayed_work");
> 		return ret;
> 	}	

I could send incremental patch to Greg for this but it does not change
the commit message.

Best Regards
	Matti Vaittinen


