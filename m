Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD8CD3E58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 13:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbfJKLWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 07:22:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53209 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727734AbfJKLWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 07:22:49 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so10030906wmh.2;
        Fri, 11 Oct 2019 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n2u8Nbr5qrb5sy0Wxw+jsNgsLrojAZgnmC+9Kn7SuWM=;
        b=KDJcmnhSB2UDwPft0eYEFu1fWwBG4WwlKVKfcfu0eq+k4/rbjDtno9/N0mOrWstkTC
         yri1O2qHfBHVQ1TXo3Tdpm7fwOKmJOMiZyc8EYsYzOVVCwPSfHI+i07MWa8i5gUTlmQy
         +bs8jQIUNMpKTxptj3AYeWaK1awgzxxAdpdVx9tAtBm2si/uTS0Wvs4tSbpQV70it8tE
         qKd53xZtwSewfHz+4cn15nI+CXnwKx52WFoKfvNv6mVGQ9XefQUxHSJYZwEyb2vH4M5E
         3FUItXPFwUNT3gPXxOf+oA9Unz/nf+SD2ImX5zNa2XSHnaAf3AemyGpYccYXobbsVogF
         4hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n2u8Nbr5qrb5sy0Wxw+jsNgsLrojAZgnmC+9Kn7SuWM=;
        b=FzvAeX/LPx5FOsPM2aF1VVI7jpkpF+yU1/jzxD8DT4SM7UtaNHg7tU5SqeEXRGkb5F
         Z5RmH2uljnGwZWGmMF+P8AE/Mc67FZdeht/sRnmn4GlFAkWrA3voLOXkEkEBao/QN1Dj
         yEjw7Aw7hQjCS0gmXWFwKhqNxEcJTotsPe6FgBHVub1Co+kIg0b9TBuDN8HUVZQtlxp3
         gaeNuM2NzNDVP0q6xxBDSNa6Xc8pTJRHjAFl1/7+81cpmNKp083dr4St70VDHFLBbQ4q
         /Q/KOkIZysazEXDAb4OhyhALfOk449VNK75iOnFp2A5OXsCP42M4Vn8El3RFSi7kltXT
         ph8A==
X-Gm-Message-State: APjAAAXqVv9rGpUzxs8kIFOlerVIzkxb3ktIz0HW7MNR3249zGvCFvux
        mnQhF5us4VhAyT1+bsHu+rUVzGOY
X-Google-Smtp-Source: APXvYqxxjCCFZkyWTPg2aevouOvHoMlTgziLXLyl4cPQyZ81eVlUqDl3E4SX+WdCvFO9igcH5QI+1Q==
X-Received: by 2002:a1c:bc07:: with SMTP id m7mr2848851wmf.103.1570792966561;
        Fri, 11 Oct 2019 04:22:46 -0700 (PDT)
Received: from gmail.com (net-93-144-2-18.cust.dsl.teletu.it. [93.144.2.18])
        by smtp.gmail.com with ESMTPSA id y13sm11778697wrg.8.2019.10.11.04.22.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 04:22:45 -0700 (PDT)
Date:   Fri, 11 Oct 2019 13:22:45 +0200
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Brian Masney <masneyb@onstation.org>
Cc:     Paolo Pisati <p.pisati@gmail.com>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: msm8996: sdhci-msm: apq8096-db820c sdhci fails to init -
 "Timeout waiting for hardware interrupt."
Message-ID: <20191011112245.GA10461@harukaze>
References: <20191010143232.GA13560@harukaze>
 <20191011060130.GA12357@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011060130.GA12357@onstation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 11, 2019 at 02:01:30AM -0400, Brian Masney wrote:
> I encountered that same error working on the Nexus 5 support upstream.
> Here's the fix:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=03864e57770a9541e7ff3990bacf2d9a2fffcd5d

No dice, same exact problem.

But the patch is present downstream[1]:

commit c26727f853308dc4a6645dad09e9565429f8604f
Author: Loic Poulain <loic.poulain@linaro.org>
Date:   Wed Dec 12 17:51:48 2018 +0100

arm64: dts: apq8096-db820c: Increase load on l21 for SDCARD

In the same way as for msm8974-hammerhead, l21 load, used for SDCARD
VMMC, needs to be increased in order to prevent any voltage drop issues
(due to limited current) happening with some SDCARDS or during specific
operations (e.g. write).

Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994 regulator node)
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>


so it's probably worth carrying it.

1:
https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/commit/arch/arm64/boot/dts/qcom?h=release/qcomlt-4.14&id=e6415afc1aef2ac9361437ff583ba1be5a932b78
-- 
bye,
p.
