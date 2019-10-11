Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E167D42B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 16:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbfJKOXD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 10:23:03 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32958 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbfJKOXC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 10:23:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id b9so12189886wrs.0;
        Fri, 11 Oct 2019 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oSsh302Pu+csZ7xgzPuhonQMY9+lrqOfCEFZW1KhfS8=;
        b=YkzDtjQyegcxDIXVHrLOrRGodGbYbIvrGtfLqnmauHdKO56uN7us77KHHdU8aytgqJ
         bNnoUbnDiVDjtal5GKhtjsUiE1p0DuWzZdCRAskMhBwUkKvV7K7L5mqKaAWGE9PlIncZ
         pM12m4DMw88Xtjw5x8kjeK4fZ0OeIKm/tHRe9ALTTJ9Wmb7jxzdInWdHRJeKZwaSr0X8
         EKFmb3HQXXo/IS9d6AWLmk4SA9XRKq1xfu8rn5KoPNmKIfZkhOluEPIRKvQOnWFifUU/
         YaD5qNy/bBiyM+UTdsRO07Frao7G4LRCq5u1UKU7OynmKYBJXPjOvtQS6G8qls/iOM6A
         PRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oSsh302Pu+csZ7xgzPuhonQMY9+lrqOfCEFZW1KhfS8=;
        b=CJQ8zd52nAGVHkrhK0kFc++YO4VVfgnYijr381PtcbSOXa+npKwoGWtcjaghBnMbnP
         Nd8qceeKrfK/gKfT0bWKFdqkQjzdog61pC4+kgXA6OLEt4n83si2aZsxUb0n82BMi8wk
         EH9gpJP7JSsk5GuLxH3et75Aiq03tCpURHHnJAJtO4KLLGl8c0chDUgNx5QlOlXad2YQ
         Qxc6T1qz+STrEGOiT0CZ57DgMzi0tLHX1ZUyOTxDpc/C/us002THDMCd2a4C7HvHsJ3y
         Nm8CHTTS6NuTEo/Kir9InobAa9PkYnFYcWCdlTO1hlF8qRlWfHNPVhQX+Hjhcrut/U4h
         ly6g==
X-Gm-Message-State: APjAAAV0c2upUspatvEunckH8+TwtWzSttBdvptRYw3QjZABi/PGfVMj
        cRS0LkZR83J1fX8wZ/9+IJM=
X-Google-Smtp-Source: APXvYqzREndxRjfCDIpm3bXCE+fwFCs9sYSCEmAAfn2l++e3nTkTRa/NBdV+JHK7Vrlaklqk2uYUfA==
X-Received: by 2002:adf:f744:: with SMTP id z4mr13921632wrp.22.1570803780129;
        Fri, 11 Oct 2019 07:23:00 -0700 (PDT)
Received: from gmail.com (net-93-144-2-18.cust.dsl.teletu.it. [93.144.2.18])
        by smtp.gmail.com with ESMTPSA id v5sm3661396wrb.64.2019.10.11.07.22.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 07:22:59 -0700 (PDT)
Date:   Fri, 11 Oct 2019 16:22:59 +0200
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Paolo Pisati <p.pisati@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: msm8996: sdhci-msm: apq8096-db820c sdhci fails to init -
 "Timeout waiting for hardware interrupt."
Message-ID: <20191011142259.GA1558@harukaze>
References: <20191010143232.GA13560@harukaze>
 <20191011060130.GA12357@onstation.org>
 <20191011112245.GA10461@harukaze>
 <CAMZdPi9hTQQcFHMRkj2R9t-P9AiPh01hKGPP5_F8T+MUuckVHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi9hTQQcFHMRkj2R9t-P9AiPh01hKGPP5_F8T+MUuckVHA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 11, 2019 at 02:47:05PM +0200, Loic Poulain wrote:
> > No dice, same exact problem.
> >
> > But the patch is present downstream[1]:
> >
> > commit c26727f853308dc4a6645dad09e9565429f8604f
> > Author: Loic Poulain <loic.poulain@linaro.org>
> > Date:   Wed Dec 12 17:51:48 2018 +0100
> >
> > arm64: dts: apq8096-db820c: Increase load on l21 for SDCARD
> >
> > In the same way as for msm8974-hammerhead, l21 load, used for SDCARD
> > VMMC, needs to be increased in order to prevent any voltage drop issues
> > (due to limited current) happening with some SDCARDS or during specific
> > operations (e.g. write).
> >
> > Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994 regulator node)
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> >
> >
> > so it's probably worth carrying it.
> 
> I've sent it to LKML, but it has never landed (and I've never followed-up).

I see - btw, do you have a recent kernel where the mmc works on the db820c?
-- 
bye,
p.
