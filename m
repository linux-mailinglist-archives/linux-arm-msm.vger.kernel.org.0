Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5F246953B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 12:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242704AbhLFLvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 06:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242701AbhLFLvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 06:51:17 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522F2C061354
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 03:47:49 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id np3so7515828pjb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 03:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eSkZ4nMizlCpYvq6kX4bxUOExmWLGfHM/8gziDsXAhI=;
        b=SDY3uMwEOpQq9mG6dMqA56ALZO8xsDGJfkMzx4JGUaQ7AxBExlyVpkp8u99q366Hj+
         rQwkdh28+s8eLoOmOIZ68pl5jMrx6eDbzSo6frRC3p1+4wqF6G8gTBlZSNuvnK99L6yh
         yTZfZdvW/TdyUiJdzbRcVsQUUahxNXx6uZJPvIRT7PUavgkLmEh+I2Ofb/yhxP/uNd4t
         jZaOB3TvxA9kP0dGo2tWJijm4CYrINAROgjq6m9Hz9zjLTDrKNSeXzgvsYm+DiFDRujI
         0UxkKRA5FFnznGXgmH1P2d5qzQIJr0zet4BDo2CrG7JJYrQxBffjU3gxSZ96D2j7z4Zz
         RFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eSkZ4nMizlCpYvq6kX4bxUOExmWLGfHM/8gziDsXAhI=;
        b=FGvIBlIQMXcZkpcQD3KQIS2iY4PGqCFgqflKI3rVf2SqhPSgtvi4ys+pjbQyJBDb+t
         4R9a/2weOlnt3eqUrBWuPnin3ikBIVs19mZ3yAORxZMSGPuWrWjq6NohBYwd3caerSeZ
         XvopGOwxks5UiK/+xRpVWCIc/iEG6era3Igslze1DhM4jSlwGwEpzk6uPGUuhm4aJ7uk
         uawhy7b8ZA4oxHtEEtrXFxWbGZW6lKk0n6hQfztQZTV7T9xKnNdZ3XeHx0jU/XoCOTC0
         tlIPnuu2lVf0sKTj9usV+pSXu6THCptrOhPofz3RsD4uaQrkPHtabgDW0b+YmVCnGB5N
         NREA==
X-Gm-Message-State: AOAM531NI8nc15KH6j/FbeHW/gFuBb1j++2RhqFZhosXiurSJ/5FFQD3
        beOWCWCzoihtEuutkG7lznHlVl2wiRoKvMIs
X-Google-Smtp-Source: ABdhPJxhavqWGKxjUCVfrQBoYUUj+MsBE3Mx3QeZDIj/krHAScb24Z3ioi2SNvg89LZWfgvqpMPLDg==
X-Received: by 2002:a17:902:d2c7:b0:142:f06:e5fa with SMTP id n7-20020a170902d2c700b001420f06e5famr42869844plc.87.1638791268764;
        Mon, 06 Dec 2021 03:47:48 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id oj11sm13622116pjb.46.2021.12.06.03.47.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Dec 2021 03:47:48 -0800 (PST)
Date:   Mon, 6 Dec 2021 19:47:42 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add Qualcomm MPM irqchip driver support
Message-ID: <20211206114742.GM10105@dragon>
References: <20211206092535.4476-1-shawn.guo@linaro.org>
 <87v902kqae.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v902kqae.wl-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 06, 2021 at 09:59:05AM +0000, Marc Zyngier wrote:
> On Mon, 06 Dec 2021 09:25:33 +0000,
> Shawn Guo <shawn.guo@linaro.org> wrote:
> > 
> > It adds DT binding and driver support for Qualcomm MPM (MSM Power Manager)
> > interrupt controller.
> 
> That's the 4th version in exactly two weeks, and that still has all
> the problems I commented on in v3.

I mistakenly thought you had looked at v3, and v4 was sent out before I
receive your reviewing on v3.  I will slow down the posting.

> 
> I won't review a new version this week.

Sure.  This is not anything urgent.

Shawn
