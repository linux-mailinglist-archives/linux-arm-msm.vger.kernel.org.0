Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3501B5DE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 16:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgDWOfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 10:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726591AbgDWOfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 10:35:47 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0476DC09B040
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 07:35:47 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id t8so5877484uap.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txoUP4TZL/kX6wzTvIyyPM8Tw98hlNv8TkS19LKzzNo=;
        b=Wkr0bymDg39KvhwGQedoiURyuP/SArfM/9lbpXIi1kmydOSd5DW7q2QV6F+YHrIzDQ
         JTwKM1kQFW1Ecz6bwK0sChfkdhZMNRukeEymx9JDsupFdDqi7m2c9kbHgwU1rbDm7JyF
         RDOjDH5tbRA+5Rrd8iV3L/pXJmss/r1qVJCMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txoUP4TZL/kX6wzTvIyyPM8Tw98hlNv8TkS19LKzzNo=;
        b=B7SKeLhFik0OJYHjdaWGjtQ21FX5b2f2YqYGNP2MVZqlOSFN9AGaPUFB6MFzhT/Tc/
         3+CVzo00ZRFZ2oG7vcmLHU2Vwl3vf8X0aOneKpf0SYGE1I6htagFGWIEwogAifCymNHe
         mhhKXaQMyMLkQruHa+AmbYAYFLkFE3IZiySv+btinO6nSjFNU2ppO0EGt74GgZyWuG4T
         kaESrkffpSea18Vt6Ko1CnVtBdjHyRYOsTHuxJBoNv19GzYGLkVnPK9VgQT8JUu8TXrY
         VFz/PTTk+CJCpJ2CAzC6fNo12BknZFVYWcA8LOEuC2CO9aMRKV32Foj9vLlRDQWoKYjO
         pBVQ==
X-Gm-Message-State: AGi0PubpIfatuITAdd64LwSeqlWzWu6sxjekIEnbTzRb0hAK7AkuckNi
        nFMfrLonvpPTo4nyiWhYT9ImnZue64c=
X-Google-Smtp-Source: APiQypLcl6daKunu5PdwPrqDBXf+BBtqp4Icfjnl65yl70ErV7whMX1QmODjxsku8km5aYTqH9Zmsg==
X-Received: by 2002:ab0:28ce:: with SMTP id g14mr3326839uaq.65.1587652545957;
        Thu, 23 Apr 2020 07:35:45 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id h15sm672927vsq.26.2020.04.23.07.35.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 07:35:45 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a6so5900127uao.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 07:35:44 -0700 (PDT)
X-Received: by 2002:a67:f5d6:: with SMTP id t22mr1333288vso.73.1587652544353;
 Thu, 23 Apr 2020 07:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 23 Apr 2020 07:35:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
Message-ID: <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more informative
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 2:55 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Currently on reboot/shutdown, the following messages are
> displayed on the console as error messages before the
> system reboots/shutdown as part of remove callback.
>
> On SC7180:
>
>   arm-smmu 15000000.iommu: removing device with active domains!
>   arm-smmu 5040000.iommu: removing device with active domains!
>
> Make this error message more informative and less scary.
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
