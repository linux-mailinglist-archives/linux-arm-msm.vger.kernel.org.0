Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0131A2CF3CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 19:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgLDSRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 13:17:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgLDSRC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 13:17:02 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20375C061A4F;
        Fri,  4 Dec 2020 10:16:22 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id v8so3775189vso.2;
        Fri, 04 Dec 2020 10:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MWLXASZeJdeOYt8fL09ZQPfBaLmTlB8Z4GJYyPClGmQ=;
        b=F10kPjFs82ueAXZxmYIVvOxf9FXPj3+r2qdCN/5ca2g3MmKnI2Z2A9E2Ioeoskx/C1
         eU4jb/YzfvljD+sjAVtjE/wAu3pR/Ao/DDa7k7ygenA+1/szzwi+xoeh/c58Jtg+wIZL
         uT5V5Gv8FZVKQYSxbevXTflbBQZtUiJFxkF7MRssg/MUaBiZmXFXQE7aJc4zoOqrxlZX
         JPwbEcETrsjkAjStGfRn9xlQgrUV7h4QDhQ0WHmyrr1VO7Bal6g4fKyiawc8E1xH0aay
         SylZka02VmmbtQ6BtxEUO7QE7LXbETHuPg3K2rpb/bgyVVq0TEyMnK9bXKGC7zDcdNfz
         vmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MWLXASZeJdeOYt8fL09ZQPfBaLmTlB8Z4GJYyPClGmQ=;
        b=YoUv8tQF3oZqOqoX30udCcZ3I6CHuUK7MZjE6acTVZI8bNYQip1LbIsrtwMWDhZP6D
         awEM6aq/P6xlOtgKXD5IfPfDu1B6QbyiX9lqjM6qKTZpEt6w7QJHY79f+irKUCul1qQ2
         nbNCSykxGwTqbj/Ea7kzxtkp6BChDD57cOiOds9e+7DAa4GMm5WLfa2Ei5TXiMlNDVbF
         1N9QdpG4rOTfEu9h5/T4Caq1VW8u8gUA4NN0jf7KeHu/clTN11DnF5EFN6JQ2j0bdT2M
         ZkpyjAzlC7T+t2MySSpbj3o+DCEMVpgUW+UieGhRfMn07kWWNIFEW+EAbfdSs9cmA3Ri
         zp+A==
X-Gm-Message-State: AOAM532kX0iMdCwmR70Nh8uO7jrHaJ4MSwYtPCrldi3BfMC8Hwqjhapj
        YLNZ23JVqyTm5EW3UYGpDqGgTUTIa3CD/bQZK6w=
X-Google-Smtp-Source: ABdhPJyyI719dKemAEBYCPWMicMfo1HL0TntavWPGmAgnlq2JCZqAnUumEcXhfEDlnCV9u1TKUNYvdvxwl0IavHd7xw=
X-Received: by 2002:a67:ea02:: with SMTP id g2mr5281276vso.3.1607105781297;
 Fri, 04 Dec 2020 10:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20200926130306.13843-1-kholk11@gmail.com>
In-Reply-To: <20200926130306.13843-1-kholk11@gmail.com>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Fri, 4 Dec 2020 19:16:10 +0100
Message-ID: <CAK7fi1akLi8uJTwCtT4pY50JwSYjr8TkwMqyK7pcWxAGCvuqDA@mail.gmail.com>
Subject: Re: [PATCH 0/5] SDM630/660 Multimedia and GPU clock controllers
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>, martin.botka1@gmail.com,
        MSM <linux-arm-msm@vger.kernel.org>, phone-devel@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno sab 26 set 2020 alle ore 15:03 <kholk11@gmail.com> ha scritto:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> This patch series brings up the MultiMedia Clock Controller (MMCC)
> and the GPU Clock Controller (GPUCC) on the SDM660 series of SoCs,
> including SDM630, SDM636, SDM660 and SDA variants, where applicable.
>
> This series depends on "Qualcomm clock fixes and preparation for SDM660",
> which is required for the drivers to work correctly and to even compile
> (due to the gfx3d rcg2 changes).
>
> This patch series has been tested against the following devices:
>  - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
>  - Sony Xperia 10        (SDM630 Ganges Kirin)
>  - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)
>
> AngeloGioacchino Del Regno (4):
>   dt-bindings: clock: Add support for the SDM630 and SDM660 mmcc
>   clk: qcom: mmcc-sdm660: Add MDP clock source CXC to MDSS GDSC
>   clk: qcom: Add SDM660 GPU Clock Controller (GPUCC) driver
>   dt-bindings: clock: Add QCOM SDM630 and SDM660 graphics clock bindings
>
> Martin Botka (1):
>   clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver
>
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  |    2 +
>  .../bindings/clock/qcom,sdm660-gpucc.yaml     |   75 +
>  drivers/clk/qcom/Kconfig                      |   18 +
>  drivers/clk/qcom/Makefile                     |    2 +
>  drivers/clk/qcom/gpucc-sdm660.c               |  349 ++
>  drivers/clk/qcom/mmcc-sdm660.c                | 2857 +++++++++++++++++
>  include/dt-bindings/clock/qcom,gpucc-sdm660.h |   28 +
>  include/dt-bindings/clock/qcom,mmcc-sdm660.h  |  162 +
>  8 files changed, 3493 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml
>  create mode 100644 drivers/clk/qcom/gpucc-sdm660.c
>  create mode 100644 drivers/clk/qcom/mmcc-sdm660.c
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm660.h
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-sdm660.h
>
> --
> 2.28.0
>
Hello!
Is this patch series getting lost and forgotten?
Can this please get some attention before it gets buried forever?

Thanks,
Angelo
