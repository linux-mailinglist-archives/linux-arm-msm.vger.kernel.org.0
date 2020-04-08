Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B003E1A2435
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 16:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728745AbgDHOmB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 10:42:01 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:41377 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgDHOmB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 10:42:01 -0400
Received: by mail-vk1-f175.google.com with SMTP id i5so1867531vkk.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2pDvcotqin9MFYotH20Ddvllc4oEen5KJQtcAktMMZs=;
        b=KTj0IrJ2HYAK/59HA7DR7goXWRl3VWt+FPwtTBivhZGMOp5zfVeZ5FfDBBCByd5HJF
         8y3lJWN/RC/xvlHZ4yDlKm3DAfqcRmuaryIa+n/7T4TZfvcTl/rjq3WRQ21OFXlh8HZ1
         ALUtiRUJPWuVq7rJHIiMWgZCPemzlXjOqYQhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2pDvcotqin9MFYotH20Ddvllc4oEen5KJQtcAktMMZs=;
        b=gMSItt/wMgeZxLo+PJgSGqBQ3fARUcVOA/XPr5yjl/K73xTmzQRd4gtQr/n7NT+0bA
         RMh/6YPeGpgGjgFkICKLIu6M27z2F2c7emEOB7d13UUEnAlHgMtkMllNWvRmjuEbrYER
         BokjwG6E/rNaj3IkCSItZovWMRBtF6rAlZFa9aXYAo0IDHJK05pD518vNbvYZLhwFQG0
         BUnqGjQT2RbVOXXShx0UGPQ6miY8UORdKVhXGO0yTDTFgY+0bACnfWMvnB/TnwRxsXaN
         BgRsPzxG6Sd7hHzAaMIasdDVuXKe0JZLr/cWAsIjqed6ZZcMWQE1xPwgdW0qiMwiIGsB
         8gng==
X-Gm-Message-State: AGi0Pua+lNPITU4OWz8DN1UTC5B8Jl7mp0VyhrIwmeq0HOHOhZCupoHq
        Es7TK6erJiW/bb25K63kg0kzzbVVb48=
X-Google-Smtp-Source: APiQypJExSZKYjUEwugsguRQE57ZtpTt8j01i+SJOclTWkHZYNnRRlGsAevzngpuVNeuj1M+47A+Gw==
X-Received: by 2002:a1f:1255:: with SMTP id 82mr17306vks.80.1586356918951;
        Wed, 08 Apr 2020 07:41:58 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id v204sm3367181vkd.33.2020.04.08.07.41.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 07:41:58 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id f195so1882808vka.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 07:41:58 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr6540930vsr.169.1586356481775;
 Wed, 08 Apr 2020 07:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
 <1573220319-4287-3-git-send-email-ppvk@codeaurora.org> <CAD=FV=WGUasS=UZxFeSS0Cg=9WxHPMWVFyYae7CFmOxV2_yhJw@mail.gmail.com>
 <001601d60da5$630168d0$29043a70$@codeaurora.org>
In-Reply-To: <001601d60da5$630168d0$29043a70$@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Apr 2020 07:34:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WR0YBp7ah82Kg7RzxHdO8Agf5uGNb=58iApShXqbum=A@mail.gmail.com>
Message-ID: <CAD=FV=WR0YBp7ah82Kg7RzxHdO8Agf5uGNb=58iApShXqbum=A@mail.gmail.com>
Subject: Re: [RFC-v2 2/2] mmc: sdhci-msm: Add support for bus bandwidth voting
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        linux-mmc-owner@vger.kernel.org, sbhanu@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 8, 2020 at 5:58 AM <ppvk@codeaurora.org> wrote:
>
> Hi Doug,
>
> You no longer seeing this warning stack with the latest patch set.
> https://lkml.org/lkml/2020/3/23/407
>
> The latest patch set is based on OPP framework and no workqueue's used to queue the work.
> Can you give a try with the latest patch and check if this helps ?

I was only analyzing an error log provided by someone else.  I will
let them know that they should make sure they're on the latest patch
series.

-Doug
