Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E3C782EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 02:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfG2AzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Jul 2019 20:55:19 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41301 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfG2AzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Jul 2019 20:55:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id m30so27093829pff.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2019 17:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hGjJJlgqf6fIZSYi0mQxt5rqQsfHh14p1KL8R7bqkag=;
        b=h/A1tD8sZhM/v7+RhsC11wSVFXSwvl1nieW+O+yBXi1T6IcOt/iyzsP0danqDHl3If
         EiMovzmXIpZ6a4yeWiLLWBocBfGVofuspHURaV752iQnXN95SEOtoI132oPpKIsPhe+L
         dOrVhiDAQWg0OokDiIIWhrFDs5y0lk3yMY/3dhZSMBOHAKBNw/bJeLdpv7bJ4VJXwy/D
         PWUQzxXW8kSvWm+azVhd44dOKo9Aw98CRIfOHQQhbdkCGwdub2hNUQvXMlHJEXOKBY50
         kQcgdE47s1P8T8yv0odSj87jXcrztl61FQMCMJIsay49iIqYbD69vr6zETn5X5eLCFcz
         Jhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hGjJJlgqf6fIZSYi0mQxt5rqQsfHh14p1KL8R7bqkag=;
        b=XPrGytMBYlegbSGzZWowIv0soxGhILzoNsC8wPsfbJYrRM5pk03H91l72oBqullG1A
         nwhTBcR9ZAdsQxKdvcxeHxL/JC2exokM2jJavH0yMMUL3t9c5zgPKn6Cki8UkPtEh6vY
         f0bpY4mozGajpB5Btsm0rJcZE88UfbWLoZKaoI0S1B9vl91RCxOIb1CT6clWsPphuU60
         DhVUv5+jFfTRqHrLvVAzg9G4Dk7puKWVLTes+e//s5XbNw3ibqmjignGoqOSrNg6rizA
         JKC9269N2Vt7nYyglDU5obbx8sGXaSEsglI82v+TV4f+mg/YRugX4hDnqV63m7dAsKng
         SPRQ==
X-Gm-Message-State: APjAAAXTJZMWJDULbj6hvaUm7NQEhCzLnaZgeqNCSRgkwjY9Mw/fm24o
        XnKZBXWrfCBrX47tzwKn7+rPEw==
X-Google-Smtp-Source: APXvYqz2PSVwN5dKDaP+S/qEaEHuy+/ZLKEjdJ0szwpHKcNw3tpo1lQ9Z3MmyOBXuI4l1b9E1lGNFA==
X-Received: by 2002:a63:1020:: with SMTP id f32mr72808691pgl.203.1564361718219;
        Sun, 28 Jul 2019 17:55:18 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k22sm62936954pfk.157.2019.07.28.17.55.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 28 Jul 2019 17:55:17 -0700 (PDT)
Date:   Sun, 28 Jul 2019 17:56:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        kernel-build-reports@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: next/master boot: 254 boots: 16 failed, 231 passed with 4
 offline, 1 untried/unknown, 2 conflicts (next-20190726)
Message-ID: <20190729005641.GR7234@tuxbook-pro>
References: <5d3aef79.1c69fb81.111b9.a701@mx.google.com>
 <20190726134843.GC55803@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726134843.GC55803@sirena.org.uk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 26 Jul 06:48 PDT 2019, Mark Brown wrote:

> On Fri, Jul 26, 2019 at 05:18:01AM -0700, kernelci.org bot wrote:
> 
> The past few versions of -next failed to boot on apq8096-db820c:
> 
> >     defconfig:
> >         gcc-8:
> >             apq8096-db820c: 1 failed lab
> 
> with an RCU stall towards the end of boot:
> 
> 00:03:40.521336  [   18.487538] qcom_q6v5_pas adsp-pil: adsp-pil supply px not found, using dummy regulator
> 00:04:01.523104  [   39.499613] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> 00:04:01.533371  [   39.499657] rcu: 	2-...!: (0 ticks this GP) idle=9ca/1/0x4000000000000000 softirq=1450/1450 fqs=50
> 00:04:01.537544  [   39.504689] 	(detected by 0, t=5252 jiffies, g=2425, q=619)
> 00:04:01.541727  [   39.513539] Task dump for CPU 2:
> 00:04:01.547929  [   39.519096] seq             R  running task        0   199    198 0x00000000
> 
> Full details and logs at:
> 
> 	https://kernelci.org/boot/id/5d3aa7ea59b5142ba868890f/
> 
> The last version that worked was from the 15th and there seem to be
> similar issues in mainline since -rc1.

Thanks for the report Mark, afaict the problem showed up in v5.3-rc1 as
well.

I think the problem is that the regulator supplying the GPU power
domain(s) isn't enabled - and I think there's a lack of agreement of how
this should be controlled.

But we have a partial fix for this floating around, I will give it a
spin.

Regards,
Bjorn
