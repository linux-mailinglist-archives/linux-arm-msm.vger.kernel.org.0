Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19E0570886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 18:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiGKQry (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 12:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiGKQrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 12:47:53 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513FF3CBFC
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 09:47:52 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id v12so6973876edc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CgkIi7fMPRr2AoUFqLpQX7xH/fNuy4VUkp8cy7sE2D4=;
        b=V3/+Rch1ns/j5gS9Z+XimMOBxyslbkPIkGNRpBpOz0bsiaJNcIunGHgZ3wYeuNJ5KB
         iiojbeFMZBZKTs54MZfAuQo8noiaVjkbPCw+VGJd7zq3ffX2k/PYiJbk2Lf2ec74x8vX
         oOjelTn9RDQbi834Br05L23PNacDs9h+toRZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgkIi7fMPRr2AoUFqLpQX7xH/fNuy4VUkp8cy7sE2D4=;
        b=AbCsG/Xo7Ns36BxGDhLDUj6bsuTtfX3+/zi9ytc3bCwbnE7ktcQeP/1EflEthx/CxZ
         ubfPKBEsYaBsUldqrQQKO9y6ZF4Fz/XInPr6NZSIXvEOHej6AknZBMdLBDLaX+1ulOH8
         rNxC1MdnXwWpa9WgwmTXZ1xWG9kxFkpWrd5+Q3OR5wRS1aUXE4726iHcnu5MIpvp3VLO
         5AnwgKidWjzehpBEXyjjhU+iTfg5jpe+rBOpNYXtXo/QuC75kuwBDryoL8mI+MQIj47B
         dtk6/bUT4yD9X9b22rWSgsdc09CKinbx2lXiSEPeoZ9ELXl0Ke89CwQu7zPSPEQLJ5DV
         J/Dw==
X-Gm-Message-State: AJIora+BnOJztZ05r6GUUhQCSg9q2D/mpno32j4W3UJXIJ4n7VzXQx4u
        +oz9CAA3v/QVCosKlZMPiJT/i0bTUYb0enp/TGw=
X-Google-Smtp-Source: AGRyM1tqQC1uPe2DZcoVmTY6UCEPZHH1x+wLUj9r4XgllCZQEpUQiMOCfpe78e1Q5dHcaQVK7Hw1Hw==
X-Received: by 2002:a50:fb81:0:b0:43a:7975:c721 with SMTP id e1-20020a50fb81000000b0043a7975c721mr26336815edq.381.1657558070745;
        Mon, 11 Jul 2022 09:47:50 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id i8-20020a170906a28800b0072b13fa5e4csm2871148ejz.58.2022.07.11.09.47.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 09:47:49 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id n185so3363402wmn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 09:47:49 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:3a2:e97b:f3ae with SMTP id
 bi21-20020a05600c3d9500b003a2e97bf3aemr3975351wmb.188.1657558069021; Mon, 11
 Jul 2022 09:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 09:47:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0Fh_p4TnA3c=SadVKCDVFaWnT9Cj1zydQWqZdYL8eSQ@mail.gmail.com>
Message-ID: <CAD=FV=X0Fh_p4TnA3c=SadVKCDVFaWnT9Cj1zydQWqZdYL8eSQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dta: qcom: sc7280: delete vdda-1p2 and vdda-0p9
 from both dp and edp
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        quic_mkrishn@quicinc.com, quic_kalyant@quicinc.coml,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 9:23 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 --
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi     | 3 ---
>  2 files changed, 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
