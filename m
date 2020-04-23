Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AD31B6091
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 18:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgDWQTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 12:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729419AbgDWQTf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 12:19:35 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C89C09B042
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:19:35 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id j1so1600025vkc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iKUcBuJDdde4mOEyRTnllxM+tu62ZA2QD/StkqYkuis=;
        b=NEZkOU/0uCz//ZqaAJkcGOCvpnUulQ02B0Ex143Mw3WV5xFZywAgbpsn9AzJ7InUxY
         Zf5lR349Qjg1BLHrT8/Ml2Dy6f5cx8S3x8blRTf1jq+qfs8o5P1fVeSb4vV4AEp4XTt0
         YG/2ldfM9aDW2SfHMjInfGXWq3VeIf5D866rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iKUcBuJDdde4mOEyRTnllxM+tu62ZA2QD/StkqYkuis=;
        b=uVZi4Hb6JZY7O/kffPcrBtujOZVNzVG54LG1WJlFWJjVNt5gjvj+Xx6GlaUYeRymrN
         BzTkvMQUw7+58PMMK2sL18RKb1YJehDKO6CErh071tw//mct0NLmTpJfIzJnI8AFcNgy
         POY/LVdtL13H7MY3o2Hos3/2547Frs1L6HiLr3dJBc59KMjC76fh0ZOreSrPULvwtArX
         DxHr3p5Ol02SW/0h0hTsU/J3Q0rHdJcUyKguexfLUWPjxoO2RRz4tJr/Gyq7elDLkWGy
         N+VUy4wDkXXauIbliJi8aaOl1OI4EGzs10w700TT1jpSjFR/tIx+TZ1HGq3ktKuls+dc
         IUXg==
X-Gm-Message-State: AGi0Pub15WxmNHlpCpX7l1Jig5g456guXashHTLmBnfyjudxGNx8aBu8
        Q3mGO/yvg3hpWUMYvxjMiEtGfZZ1668=
X-Google-Smtp-Source: APiQypJjTztVJOH0dF36YZSaa6PI6Xn36GnEhmftA8lV/NYcDZELbLFcGwXvG7/mlLo3P/1EfNgwKg==
X-Received: by 2002:a1f:cd83:: with SMTP id d125mr4290667vkg.35.1587658773479;
        Thu, 23 Apr 2020 09:19:33 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id j22sm899267vke.27.2020.04.23.09.19.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 09:19:32 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id y10so6271487uao.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:19:31 -0700 (PDT)
X-Received: by 2002:a05:6102:4d:: with SMTP id k13mr3971569vsp.198.1587658771501;
 Thu, 23 Apr 2020 09:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
 <7e060977-611e-abf5-af76-1cc91660a8ba@codeaurora.org>
In-Reply-To: <7e060977-611e-abf5-af76-1cc91660a8ba@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 23 Apr 2020 09:19:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WC78xxDUCynbfX0rnAAUxJfUedNhoCrw=5UHhcrRFu8w@mail.gmail.com>
Message-ID: <CAD=FV=WC78xxDUCynbfX0rnAAUxJfUedNhoCrw=5UHhcrRFu8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] soc: qcom: rpmh-rsc: Corrently ignore
 CPU_CLUSTER_PM notifications
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 22, 2020 at 9:45 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> there is a typo in subject, Corrently to correctly.
> Other than this, fix seems good to me.
>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Sigh.  My brian has never worked very well.  One of these days I'll
see if I can get it tuned up.  Unless there is another reason to spin
this series or I'm requested to, I'll assume that Bjron or Andy can
fix my typo in the subject when applying.

Thanks!

-Doug
