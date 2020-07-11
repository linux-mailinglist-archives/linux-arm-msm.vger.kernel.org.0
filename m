Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244C021C601
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 21:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgGKTt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jul 2020 15:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726544AbgGKTt6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jul 2020 15:49:58 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5394C08C5DE
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2020 12:49:58 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mn17so4039703pjb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2020 12:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VoSY9o0RP9wz1n1HlqTdIGycNdQ3hE09iYAJAJNhPFo=;
        b=kuzkh7Dyi7gvfKHgz0jDxv9ItbDA51VPP8+B5RL67FMOAvkA7sCXY4mkhOD+fGVr1r
         mv8MlJQnOxtcff2aUtBQEqxn4dYEW2qXEyT4uq7I40BtRfTGXnkfS6hCzl+7Hy8b1nS5
         B4aP39WQ6DgfKtxK8Hs02ijiAFb6wGHnwJlyMEfxhfKcYWssU3ZkvshdRuk/2no0gAWW
         rVUvCjAAEOE/RxT5XeZFwnd43ey7L3prJc6BmWh8F3ZXqohoPl6dO+gMg4REiJHoT5ld
         7iXIFj86iz5L67nqqOwmbrczbF1jGkG+fsiiQHkDFdBHtlNd1a7loILLtxTwGUVlSGyu
         97FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VoSY9o0RP9wz1n1HlqTdIGycNdQ3hE09iYAJAJNhPFo=;
        b=g2o3GHtcoxr6I0wnORvRuIyyp6SL3meDYQLvBGEywtCS9tl3ce41RpMXfq90vWRmbr
         kGQwkLQGku0MI/tQKRtDlnKhNt13XPsV8cy6aJ6oeHR4kmI7AbJobFOk1IP+GkMD3n6A
         cO+L3x7Klvzn7ZVoLFVa8tSUR5IWzMC3w6Eg5Wh1rN3MiUFvR5zBAXAJkCHZwWNtZMct
         IFVX1KmBubZrRn4Nh1BDhMB7tK/81oam9n9Vl4bNvK+Yflz+C5W3alnwa2bQKY5MCeZF
         phMKjRSWFBaDOcXMcVn+b4hywYfwdd+z3dR69J/8wRfoacZBYdVtXClekWrDInXgd1mh
         LylQ==
X-Gm-Message-State: AOAM531RolBpRAoynu7O+Tf9CgvwpAhXAm6aVmr/ePEHdXkckj2zIfN6
        CqNL3GFrru+vl3ZMcdQn6SWqQA==
X-Google-Smtp-Source: ABdhPJwyVIyKI7ahlCr2xE9CjEH3oiM3zspFL3y25paZ20lnVu1lQeX2s576mVzYp98W3z0Gb3TFxg==
X-Received: by 2002:a17:902:d352:: with SMTP id l18mr21833035plk.56.1594496998213;
        Sat, 11 Jul 2020 12:49:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b4sm9665353pfo.137.2020.07.11.12.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2020 12:49:57 -0700 (PDT)
Date:   Sat, 11 Jul 2020 12:47:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] clk: qcom: smd: Add support for MSM8992/4 rpm clocks
Message-ID: <20200711194746.GA388985@builder.lan>
References: <20200623230018.303776-1-konradybcio@gmail.com>
 <CAMS8qEVHxnAwC9fK69Pb4MEMWVEa9N7ZdkQCkXwvqC-JfQEfRA@mail.gmail.com>
 <159303797640.62212.15039388585433005717@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159303797640.62212.15039388585433005717@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 24 Jun 15:32 PDT 2020, Stephen Boyd wrote:

> Quoting Konrad Dybcio (2020-06-24 08:09:18)
> > I should also note that for quite some time a hack [1]
> > has been needed on some platforms for the RPMCC to register.
> > 
> > This includes 8992/94, 8956/76 and possibly many more.
> > 
> > With that commit, RPMCC registers fine.
> > 
> 
> What happens if that patch isn't applied? Does the system crash? Because
> I'd rather not merge a patch in clk tree that causes the system to fail
> to boot.

The state machine code in the SMD implementation finds the RPM channel,
but it's in a state that indicates that the remote side is still
closing/cleaning up from when the bootloader had it open.

The result is that we never probe the RPM driver.

I merged a patch that would cause the logic here to be a little bit more
aggressive/optimistic, but that had to be reverted because it prevented
the modem from coming up cleanly after a crash. And I unfortunately
still don't have any hardware that manifest this problem that I can
debug this on myself.


But I think it's fine to merge the rpmcc patch (which I see you did).

Thanks,
Bjorn
