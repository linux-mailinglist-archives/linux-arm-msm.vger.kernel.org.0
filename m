Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEF84BC52A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 04:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241252AbiBSDD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 22:03:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239536AbiBSDD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 22:03:57 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D147189A9A
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 19:03:39 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id x193so5171283oix.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 19:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=zIB+88SZu/CTl47f1fdTeX2AI5RUdEbWO+4zjIrvIzM=;
        b=J4SJ7j5uTIF6325BNiAXQXv0efYxC/HzwgbEKT3PY/NqwzZU5+zH/6+Cd5iItGU9l2
         /eor0oEEJhiuQ8Dgq1+viv0K8pWJS24WfjjGNPeQU0LXv/Xsompp6ztvXrDE48I60fVG
         jIWiASD20CAYMHlNMfNi5CrEOEwnyC9sKZPvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=zIB+88SZu/CTl47f1fdTeX2AI5RUdEbWO+4zjIrvIzM=;
        b=32VJFylyiAdmeUFKl+PoyKo9fT6I1llLDSKc0YAPEM6O5OeTQTFTRQFMOmxgYOKiah
         qmY62KnMlkrBquRD0yAjKnkw6RShpgK4Kek7wUk1g5b9cn7Bh4gdlpEm9ilrKIxFV3lE
         UCS6gvQwkIrPWyeR+LpOt938feqvlTsOo+EGAPYOk82AdyMpSo9UEpfVe+mjwEvpYbYr
         nbwu2g3+TEdpd16yMWO/8MFY6dpk23tn7bzBYnarTWw3qcbWK328LoozbgrMWJmDtpyd
         qK1Hn/hgWI35Ogxv49Z33B1SyW21CkOnNzFMM82+gr9q/LaTWZ30I6+arGNh8Fnxg+NH
         u1OQ==
X-Gm-Message-State: AOAM530MXbgE3S1fXYy/4FeXDW+5vcqdLdhQ23iHBfgK4PYmvqCeengw
        oI6tmi72Eb3KJlq6HvnKoF+J7M1gY/NN5Y5Du/1d3w==
X-Google-Smtp-Source: ABdhPJyTyySKaogGebiYw5qOlLQGTpdp3qqpV2Sh4WlZmZiT0rP6wCEw1BDRdNlhT/JVspPiNudlDVaQIpYcAmd99sw=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr626747oiw.112.1645239819056; Fri, 18 Feb
 2022 19:03:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 19:03:38 -0800
MIME-Version: 1.0
In-Reply-To: <1645078066-9365-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645078066-9365-1-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 19:03:38 -0800
Message-ID: <CAE-0n51j9x2-5ZBPOkhewih6ojvE=a-Ot3htQ7JPKYzBm32UJA@mail.gmail.com>
Subject: Re: [PATCH v14 00/10] Add support for audio on SC7280 based targets
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-16 22:07:36)
> This patch set is to add support for Audio over wcd codec,
> digital mics, through digital codecs and without ADSP.
>
> Changes Since V13:
>     -- Change bulk cdc clock voting to individual clock voting.
>     -- Remove redundant code, conditional check and prints.
>     -- Fix typo errors.

Seems we're still discussing on v13. Will you reply to the review
comments or post v15?
