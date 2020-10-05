Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58C1283BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgJEPuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgJEPuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:50:18 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E77C0613CE;
        Mon,  5 Oct 2020 08:50:16 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id b12so9880691edz.11;
        Mon, 05 Oct 2020 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rxLRdxz1SNdBolBKufjW/igKHzYiiGTYqjWSfG4kZwE=;
        b=ajncl+zXLrMl6JFVpt4+y/oZrvOkxGCFA4xqhUbubmnFZnSXZ0FrOp0KAzaPifvyNz
         lc9/EdxsRcOGe1ZeWoor9vTo22ltkW0IswzyMxrnz7FK9mvs3Tl5UHtoZTqxm5s5cYdJ
         K75O8up2EqEdq3NZcq7ibiIp2gNqFYZndc4fZqY6A6Lj2XzrQfkgNCyAne80OnqPXLs7
         7l5dGuB1u64VwHog3K/lwolQCJKCHeH2O22TdwcHWUV2/g2dwq++4SQp4Kzwey2vxfRs
         PfF2lUAcngqpOzNieE1xevrvDnB2bgD6P0hZu95VVZR9o9+g4EkcWRKXhlldArs4MNIm
         q05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rxLRdxz1SNdBolBKufjW/igKHzYiiGTYqjWSfG4kZwE=;
        b=afHGOTYotnYKPQB6OPfrUdOWdioCyFIluEHYwjqdB+6DQXGg38zQJ1Bluk7DkKM8Ux
         C3A/h61FA8enwMx1IsTFD+MOyetN32tyNoO6YKD0WMOqyQChio+XPCFRvbK+N9/rXeZM
         aYqIzs7U15tl29NldGZpAxxB8Mp/vhP2IgvzsHd0tKjDRZY1E3rtD6snO/VeWpidUCDF
         4gPF/zQMNK/KsaGayg34kq3mafzXHC9FP8woUwuBVo26Sha1nCFylLknKmfKE82MGSYp
         AzD5wBumTAt2N3kEmwebkLaQmiF5y6orJ0EGlTP+wqrjbqrIdQE05vmSbLNGIAAW258L
         iAqQ==
X-Gm-Message-State: AOAM533WbDOnzT34a40MFmbFgQSZa2WEB3iNkjASAO3PsuAVg97hulVj
        9e3WdX84xPZqgXugbvyv3LpYy+EASfU4t2Hi2NpFVcnt++4Ewg==
X-Google-Smtp-Source: ABdhPJxvt2AbjzpK6NK9btt1D5gL+PeDRiMZNhhr7XuRbgPGC57wVzeWIAt9TLjE9TKu5thw6ExQZUyxkLaDDPVp3a0=
X-Received: by 2002:a50:9e87:: with SMTP id a7mr234569edf.297.1601913014980;
 Mon, 05 Oct 2020 08:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201005150313.149754-1-konradybcio@gmail.com>
 <20201005150313.149754-4-konradybcio@gmail.com> <c03ace9d-d983-c1f8-ab74-ed585aeb2364@linaro.org>
 <CAMS8qEXBrF-j5ObahFVcJFMuC7=ucz+y7XBzTyuJAqejsE0F+g@mail.gmail.com> <0eb34c71-3e1c-9950-de30-6b163d7cca3a@linaro.org>
In-Reply-To: <0eb34c71-3e1c-9950-de30-6b163d7cca3a@linaro.org>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 5 Oct 2020 17:49:39 +0200
Message-ID: <CAMS8qEW2rxYCc-7dQKPMBKQzbw0w1CtxNPVJYbeBPb2-1WvfDg@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: qcom: pm8994: Add thermal-zones for
 temp alarm
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>What do you mean by they are not "online at once" ?

msm8992/4 are infamous for their thermal issues. Manufacturers have
been known for straight up disabling some cores or tuning the kernel
in such a way that some cores get disabled due to the thermal
constraints.

Konrad
