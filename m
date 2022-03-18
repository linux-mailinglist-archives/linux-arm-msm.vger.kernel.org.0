Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC644DD1C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 01:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbiCRAOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 20:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbiCRAOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 20:14:41 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D4519B0B5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:13:20 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id qa43so13920355ejc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6L19eqyYX4dJCc3XEpRDxDO0mhCk2mFkPhjOK7UiSQ=;
        b=GeSJ4KYz58tHKZxX3/boqgrHRuZmFHBI9sOAa070OEI0Wapz8rONQwHrT4jv/9jeXJ
         QQPJq/kVqzlEtaKjMqsYMeNN9AxQ4VoP8L0j5g5eKR3oZfiEpAfpH72syE/k+v1kiPeG
         Q8ldjmLxpem6iXFiOdEji6Mp7d/vGptTgtNpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6L19eqyYX4dJCc3XEpRDxDO0mhCk2mFkPhjOK7UiSQ=;
        b=ZiZsJbhdAHiTr9S8402GsHiPKpgOF/RHSJPsh8ee5Fl3yMT34mozds0env5rfeWjPl
         omg637aXykOdgWARalQdilKayZsJZHdA51xrqHWYok0fJ6tjqftzX8PTalnOIFaE6aEr
         2ATF25xp5baFjrGRPfI8eOLu22cdMRE6sI6XixOGt77ImvhvSwjWzrP1oXuI8HA4RQC6
         9iDHl7JjrvYrLq4phIMUdl+aXaNkRjqiod7IcMWpbUjnz3rCJ8w6Y/MaZnCJcr7wpgJx
         bfIN+S2jPVovTgu1317I/sDesVhgPJLIQ8wTH3juypxLLgT0m27lN0Cu9qSj8yoqTdko
         Bevw==
X-Gm-Message-State: AOAM531cBk18mF662gKn8LUHwvFCdLJR3PqUN1CV6EsRGGSJZmZuAn+3
        1heZvaizaletn+mJj3VmkyIftc38vXgxCIgPrME=
X-Google-Smtp-Source: ABdhPJxBVDZ4wZQ7PpApLzw1dB84sHeeoCdG2bh0L6YWIX+lt/fo80lSMNknbPn49fH+BuUZBA0Kmg==
X-Received: by 2002:a17:906:383:b0:6d6:d54b:438c with SMTP id b3-20020a170906038300b006d6d54b438cmr6728924eja.219.1647562398524;
        Thu, 17 Mar 2022 17:13:18 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b006ce04bb8668sm2978867ejh.184.2022.03.17.17.13.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 17:13:17 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id r6so9655546wrr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:13:17 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr6072332wrc.513.1647562397219; Thu, 17
 Mar 2022 17:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com> <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 17:13:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAxdo9yjGS5d=W5s5OFo6BG6DyQr6WQxBv9r-vfU7D3Q@mail.gmail.com>
Message-ID: <CAD=FV=VAxdo9yjGS5d=W5s5OFo6BG6DyQr6WQxBv9r-vfU7D3Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] arm64: dts: qcom: sc7280: rename edp_out label to mdss_edp_out
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 16, 2022 at 10:36 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Rename the edp_out label in the sc7280 platform to mdss_edp_out
> so that the nodes related to mdss are all grouped together in
> the board specific files.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v5:
>   - Change the order of patches
>   - Modify commit text
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
