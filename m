Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DE23D45AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 09:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbhGXGlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 02:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbhGXGlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 02:41:19 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69099C06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 00:21:51 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id t14so4546258oiw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YCIh3fMX63lUF8i5fYD8BvOZCJrvnxU7VR8u7cCIPkM=;
        b=F8KsU4oCjmUbDiG/44a1/9d/K1RSICyr8qRoUBatEcm2yuOnbH7x5u34aeTyoaGedf
         XspnhRRwzNL7+g4/Nx6pvKw6xYviqluCbfQMDZ6FKgnJwS48kDaZFoVynRZdK9Wuy2Kz
         TNqPsk76y8BVKooKPaYtVeGe7DdKKQnkt3Q0duAmpsRisp/WAw9balXiT9DlpU3OV43I
         aHFh0qKcNZuG1qHOCvcevEhEnjkx1YviTBbBqxeFr7PeZminYEs2vEQqG4fenEMeByTW
         m0LX5Krh3ZG5XzrPwf0n85LySwF2henr06R0Fr3gGC8nvwjzVmc7MFh35mb8k+e4PXmk
         WBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YCIh3fMX63lUF8i5fYD8BvOZCJrvnxU7VR8u7cCIPkM=;
        b=XcPjAilFJGhQyXewjcEC9FOuAvvogMvAdP7Ts/txfhj2XOwzO+4vAUiwTY3jgShHoz
         w+Hd6dtFdGkw/QlvhAQunhDMHTReTdWtIEGKXyv+TroHQVTQfkhdEizlSdidFzzK6Jso
         zqdVmICTnAWcFQ3Gc5Xs9kpFDM/HeGvJu5COkJV3kvJbW8XYXNd5h6WLFLPWuNKFCN8J
         E2YhvmfnDMeLehV/jCQMEPGO8Q8DkOpAku4PJjDoddXtDdBSl8obDrX5xjyJEWoo0PfR
         zhTHJFFFv84KiQp6HP3yY3ze0nBxuE6nJnYUsj1jBWecbr8AakmRXuZCk/6i46rFIlyd
         2fvA==
X-Gm-Message-State: AOAM530ljy5apntpjSbVnXNhpHeoX8OGQpRm5tA1H2nzmoPq8AztWpOa
        Sy3SsSDneIs5O0CYXTeQJnfJfI5yXCBGLyMS5AFxwQ==
X-Google-Smtp-Source: ABdhPJx2xQLq56xZ6EcRh66jo509CDGGbajlVjK2lo9Espbwz0WE2eEyyxbA+1wnATCEeMJ9qDOhrzNjdfKPytQAOmY=
X-Received: by 2002:aca:af10:: with SMTP id y16mr10638074oie.12.1627111310129;
 Sat, 24 Jul 2021 00:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210629123407.82561-1-bhupesh.sharma@linaro.org> <CACRpkdacTi-9YzhOqpfFkNhzSATmbWHs=wMoJcsXwG8pBeW7Mg@mail.gmail.com>
In-Reply-To: <CACRpkdacTi-9YzhOqpfFkNhzSATmbWHs=wMoJcsXwG8pBeW7Mg@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sat, 24 Jul 2021 12:51:38 +0530
Message-ID: <CAH=2Ntxk5NdcPCsOD=SRyFFKrgtUqOxV2UpuJP21W-dpaPHrrQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] pinctrl: qcom/pinctrl-spmi-gpio: Add support for
 pmic-gpio on SA8155p-adp
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Linus,

On Fri, 23 Jul 2021 at 21:51, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jun 29, 2021 at 2:34 PM Bhupesh Sharma
> <bhupesh.sharma@linaro.org> wrote:
>
> > Changes since v3:
> > -----------------
> > - v3 series can be found here: https://lore.kernel.org/linux-arm-msm/20210617053432.350486-1-bhupesh.sharma@linaro.org/T/#m2b1bf2d32dfdde3196dc5342722e356ee1f87456
> > - Rebased patchset on pinctrl/devel branch.
> > - Added Reviewed-by from Bjorn for patches 1 to 4 and Ack from Rob for
> >   patches 1 and 2.
>
> This v4 patch set applied!
>
> Sorry for taking so long, I had a bit too much to do.
>
> Excellent work on the patches Bhupesh!

Thanks for picking the patchset.

Regards,
Bhupesh
