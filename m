Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4FE7322C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 00:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjFOW3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 18:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjFOW3c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 18:29:32 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D191FD4
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:29:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f6170b1486so238183e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686868169; x=1689460169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXs/FAzfDAPWyI4Y95NmlLp9vPjbZFgrVl2RswLT5Fo=;
        b=k7Mo8hyFI2+M5EC7hs/ijQxHNKv1I6Rj/4mSgMxJSLlPnJBV5gMTNjPFft9Lwtw70h
         w1WiRNRKdHNnDheEHqXh5oOujVCTQ6qz6CoYrI1cYm19K+Jb+MZQZQmKZ7BXaa5scoR3
         HR1Pl0Z4cOFnRGkXz6NXEWnDh7Tj0SewcItt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686868169; x=1689460169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXs/FAzfDAPWyI4Y95NmlLp9vPjbZFgrVl2RswLT5Fo=;
        b=jJIacbzs2+CVubDRXC+nKquL2+lWLTmNNqziEHiX5IHLQlq4M9zhOb7MEGU59xC1PU
         hcGw5xrT7R4NJBZm40Q7iUFdUB+aiPJ17mspegzqPCrgWjuNHZ1Tx4WMyU8Guq9H6yox
         Q+RJjoLszMUzI3g5o2i9D9VtWlNYH8s9a6iQ3xNHzMVQdnhqmXTsuoXJmCuEtTim3zXy
         zqqAEDX0aycIE0BixodrfazUFlF3ip1xeOtZSOnOVCnfwZvmzUfv3Xf8WpTdQRgxhj/D
         XG+cuEFqOjQt8+ax4285o8nsZUl68MhKk+wPHnI1vVjEzHaVnPsSpjJ8hy8/EZhHBk8z
         74Sw==
X-Gm-Message-State: AC+VfDzwynJJ+glC2nqeO0ktsZnnEp6n15sOs0//gKTqujsL8P1/ogEt
        Bp4yrEQHV1MtQ5v+hUSI4LLiMX7TQa0etpl3YsQoRJjp
X-Google-Smtp-Source: ACHHUZ4cHecfEE+1u+feM4nc9fgln7lVltPQU/g0xu2simwzSoxpY+38eRADyFEomF8UiVSSkriPnA==
X-Received: by 2002:a19:4f14:0:b0:4f7:6730:c456 with SMTP id d20-20020a194f14000000b004f76730c456mr29120lfb.12.1686868169266;
        Thu, 15 Jun 2023 15:29:29 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id v11-20020a056512096b00b004f38fef80e7sm2743270lft.208.2023.06.15.15.29.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 15:29:29 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f76386e0daso354e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:29:28 -0700 (PDT)
X-Received: by 2002:a50:999d:0:b0:516:6453:1b76 with SMTP id
 m29-20020a50999d000000b0051664531b76mr164183edb.5.1686867813115; Thu, 15 Jun
 2023 15:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230615145253.1.Ic62daa649b47b656b313551d646c4de9a7da4bd4@changeid>
In-Reply-To: <20230615145253.1.Ic62daa649b47b656b313551d646c4de9a7da4bd4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 15 Jun 2023 15:23:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcWqFyz9_76s5uXfQQpxLMsivWZtTDqAa+2wOpUzHsLg@mail.gmail.com>
Message-ID: <CAD=FV=WcWqFyz9_76s5uXfQQpxLMsivWZtTDqAa+2wOpUzHsLg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Mark SCM as dma-coherent for trogdor
To:     andersson@kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        konrad.dybcio@somainline.org, sumit.semwal@linaro.org,
        Will Deacon <will@kernel.org>, amit.pundir@linaro.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 15, 2023 at 2:59=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Trogdor devices use firmware backed by TF-A instead of Qualcomm's
> normal TZ. On TF-A we end up mapping memory as cachable. Specifically,
> you can see in Trogdor's TF-A code [1] in qti_sip_mem_assign() that we
> call qti_mmap_add_dynamic_region() with MT_RO_DATA. This translates
> down to MT_MEMORY instead of MT_NON_CACHEABLE or MT_DEVICE. Apparently
> Qualcomm's normal TZ implementation maps the memory as non-cachable.
>
> Let's add the "dma-coherent" attribute to the SCM for trogdor.
>
> Adding "dma-coherent" like this fixes WiFi on sc7180-trogdor
> devices. WiFi was broken as of commit 7bd6680b47fa ("Revert "Revert
> "arm64: dma: Drop cache invalidation from
> arch_dma_prep_coherent()"""). Specifically at bootup we'd get:
>
>  qcom_scm firmware:scm: Assign memory protection call failed -22
>  qcom_rmtfs_mem 94600000.memory: assign memory failed
>  qcom_rmtfs_mem: probe of 94600000.memory failed with error -22
>
> From discussion on the mailing lists [2] and over IRC [3], it was
> determined that we should always have been tagging the SCM as
> dma-coherent on trogdor but that the old "invalidate" happened to make
> things work most of the time. Tagging it properly like this is a much
> more robust solution.
>
> [1] https://chromium.googlesource.com/chromiumos/third_party/arm-trusted-=
firmware/+/refs/heads/firmware-trogdor-13577.B/plat/qti/common/src/qti_sysc=
all.c
> [2] https://lore.kernel.org/r/20230614165904.1.I279773c37e2c1ed8fbb622ca6=
d1397aea0023526@changeid
> [3] https://oftc.irclog.whitequark.org/linux-msm/2023-06-15
>
> Fixes: 7bd6680b47fa ("Revert "Revert "arm64: dma: Drop cache invalidation=
 from arch_dma_prep_coherent()""")
> Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogd=
or and lazor dt")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)

Shoot. I just realized I probably need a bindings update too. If this
looks good other than that, I'll post a v2 tomorrow.

-Doug
