Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D489E78A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 19:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfJ1SkX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 14:40:23 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38071 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727169AbfJ1SkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 14:40:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id w3so7470316pgt.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2019 11:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rtVyMwtPvOrpW23XkhVg5/X+0nacLLEGGj2Ipigw/xY=;
        b=eVb6iTWiC8nJCwMdGmmjgZpc0qm2enTOW+W3weS+LHhHCg26yp7avaY/ZJnJlCPJRs
         mpPHqb+SH08MIrrquSc6fzGz8Uhc2qO3mGC5FFBGacceXdJm2kP3Ot6SwmYRzTMynSwi
         SgLbPmddAbo9c0R/va9x+IHYOzgxj3W/GX7MfHLhgL/CPO202aTar3HvuPXDIjByTXNk
         RtQhRhH+/f+7ehxGcK3M5AWpGsjWag0EwtAu+KGONDJAeGdh5OVPeKZXBHJ9uIxsCH1p
         AqidqCDfD81kwxD2rpfBb5FwlYVwWahl8XgCRNxM2t8Z2IiserdVA7RCX1ppdiHgMD/5
         4ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rtVyMwtPvOrpW23XkhVg5/X+0nacLLEGGj2Ipigw/xY=;
        b=YhtRJAPdXMgoXJYYYsGr3YoKEhNjSJWAqJpGjgjH8eNDkjKxPOU15HX+wnIdQw2K+0
         EB6cczvr5fImHG+WGDOp39ONVplPH80rRMVKJmjOww5j+JsTX3EUg5nks8Bwoc7bLi/0
         gZ7jVQy2Q9Uhg3rUUxigUhVblomjyb98P1CKNtruMwBZVe1NwWe7+TG4zIpb8/FZb1Ij
         mM/R++YcuSTiXdakTt51dGaun6BT7P/30VM3gDwbDBxyqJvK0b+dVIAW7G4CflSeiNiU
         hZ6Wg4XL990CoPiThedqVc3XGRc1tWgnAutMCVo47k5TSXeEGE2nd9VnA78LB7ZOMMEz
         2xvA==
X-Gm-Message-State: APjAAAVR392a6bDIP3LqPLi6a6iY+Lfk+mLFIkLO3UEIHDgBcr83qb0I
        UQlzW/6SPTlt9aMDYEpfOKTCDQ==
X-Google-Smtp-Source: APXvYqx/hujgx/DOvNFBp7lXdhq5z6Vp2hA1RFEoiLoQcVOtmb7tUC0uYCb3Ya16LnFwbDxyBD/fWw==
X-Received: by 2002:a17:90a:c38b:: with SMTP id h11mr883349pjt.112.1572288022286;
        Mon, 28 Oct 2019 11:40:22 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j12sm219664pjz.12.2019.10.28.11.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 11:40:21 -0700 (PDT)
Date:   Mon, 28 Oct 2019 11:40:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: next/master boot: 257 boots: 8 failed, 237 passed with 8
 offline, 2 untried/unknown, 2 conflicts (next-20191028)
Message-ID: <20191028184019.GR571@minitux>
References: <5db7032c.1c69fb81.888b0.b521@mx.google.com>
 <20191028174857.GG5015@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028174857.GG5015@sirena.co.uk>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Oct 10:48 PDT 2019, Mark Brown wrote:

Hi Mark

> On Mon, Oct 28, 2019 at 08:03:08AM -0700, kernelci.org bot wrote:
> 
> Today's -next (anf Friday's) fails to boot on db820c:
> 
> >     defconfig:
> >         gcc-8:
> >             apq8096-db820c: 1 failed lab
> 
> It looks like it deadlocks somewhere, the last things in the log are a
> failure to start ufshcd-qcom and then an RCU stall some time later:
> 

db820c has been failing intermittently for a while now, it seems that
booting with kpti enabled causes something to go wrong. There are
nothing strange in the kernel logs and ftrace seems to indicate that all
the CPUs are idling nicely.

Regards,
Bjorn

> 03:03:27.191914  [   21.156672] ufshcd-qcom 624000.ufshc: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
> 03:03:27.198061  <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=qup-i2c-driver-present RESULT=pass>
> 03:03:27.208499  [   21.175985] ufshcd-qcom 624000.ufshc: ufs_qcom_init: required phy device. hasn't probed yet. err = -517
> 03:03:27.216720  [   21.176014] ufshcd-qcom 624000.ufshc: ufshcd_variant_hba_init: variant qcom init failed err -517
> 03:03:27.226220  <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=qup-i2c-blsp-i2c2-probed RESULT=pass>
> 03:03:27.239850  [   21.211424] ufshcd-qcom 624000.ufshc: Initialization failed
> 03:03:48.157338  [   42.128777] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> 03:03:48.167648  [   42.128802] rcu: 	3-...!: (0 ticks this GP) idle=dde/1/0x4000000000000000 softirq=1715/1715 fqs=60
> 03:03:48.171895  [   42.133839] 	(detected by 0, t=5252 jiffies, g=2301, q=787)
> 
> Full details, including the whole log, at:
> 
> 	https://kernelci.org/boot/id/5db6bf0d59b514a35660ee72/


