Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE616207683
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404076AbgFXPEE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403833AbgFXPED (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:04:03 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6915DC061573;
        Wed, 24 Jun 2020 08:04:03 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n24so2821894ejd.0;
        Wed, 24 Jun 2020 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dme5DwerOP4a/33k4zY8N9L2LwVlVtgR/+J6XV+j5XY=;
        b=ZLR51D3aVpq+oLmRtsnBhmVJHoW7H8XiCZj78ee1BKubpn68Z4ymn8GBWzKX3R5sRk
         I+VYjxVET4FE3uMVzbIxS1YiI5z8fI1l5Vbfrfrqie9f3NBiXIS57Mh/T5uoK3jxzfE1
         V0wLB3Spbjq8PJgoPV1dRoVqxe9cET8Bp8Hoy8hsm6C32gDDFicPQP8aS61JPy1gVN/t
         Pu1nN9GkCk+JOvNhapfE8Dmrm+5wgZeuXorA45Q9Gqp6MO+TA7m64PPrKlzCOzIiATPp
         cS6DRxFVd83sUre3opKDZAE58VkkotFlnLeuCoLOf37ICEpStREptMR8Dc3G3rze8BPo
         BmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dme5DwerOP4a/33k4zY8N9L2LwVlVtgR/+J6XV+j5XY=;
        b=ZcVk9NAy1HCMNAWofLd4oRhETup1z/otsO9jqx/KsONaRGQhqxxxLB1B3r8bREn/2J
         dWyiu8AYHH006ihKmYlX/3ucYDjI+PRUiCarqzsQAqzdSgnMGxZ/m5dEXuwYaxB8xqAE
         us1HZHdj8YODWHK4aQBFg5RKnwRlfh5zKmSvdw8OG5rzcUVpFvsEL57TTgjQ1icMIA2T
         xXsQl89z6St7jrAnbqXu5JYjYxzXP6qmGcI3gtayCO+NBhJ8ge39+RX3W4aPdOpqpNRP
         WyT31YRqhqcNpsq2hH2hSPQcYETf3uQfRNtKjqeZvk1kLkBeV9vwzB0AN3beU+w+0OMS
         ABcA==
X-Gm-Message-State: AOAM533/aHHhFuLyNpsJChELfzsLVcd7yslvaskbFKBwccmguZ1sSvvT
        8rG6JRGo3tZhHHP17NJruI2E/NBTt97/lJtzXF4=
X-Google-Smtp-Source: ABdhPJxmr1mazRfYjmNndeIkLvLIYQSPJ4fYFdHtf/8k917e0w6qkhHOfg3iji8aSD97TYI0qaJhvQZJzURXRq9+xxI=
X-Received: by 2002:a17:906:1386:: with SMTP id f6mr25481615ejc.66.1593011042218;
 Wed, 24 Jun 2020 08:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-5-konradybcio@gmail.com> <20200623231541.GH128451@builder.lan>
 <CAMS8qEV9hwL1MpEHzVC+w2rkQhdZ1aH3Dy8Mn1X_2Eu7W2naWA@mail.gmail.com> <20200624064011.GS128451@builder.lan>
In-Reply-To: <20200624064011.GS128451@builder.lan>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 24 Jun 2020 17:03:26 +0200
Message-ID: <CAMS8qEWO2xGzi7cuC7_eVBqFC21Rf+mOu-nzKDaOdyNn-EBmCg@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] arm64: dts: qcom: msm8994: Add support for SMD RPM
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Can you please extend qcom-apcs-ipc-mailbox and its binding to add
> MSM8994 and use mboxes = <&apcs 0>; here instead?

I have in fact converted it into a mailbox and sent in the v3, but
unfortunately it looks like the SMD RPM driver hasn't been updated
for "mboxes =", so I stuck with the "qcom,ipc =" binding.

Regards
Konrad
