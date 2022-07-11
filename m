Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F290570E44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 01:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiGKX2C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 19:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiGKX2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 19:28:01 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F658876C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 16:28:00 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id va17so11458864ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 16:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tT3i3PdSWIbZI2/jQXTr2ht9FWXt0v5w3WnrwY7zOxE=;
        b=Ldn5e/XdivqNGq4Wo2DSw9vOq5ICFZFMjEsGK5qXKUBqT+RZBBTBUQUrgowVxl9abf
         IZvV6AFjiDL62G8G5+bfNOR9kg81XWRLWcfzrZg1n3q+TAcpqNtW0Qm6u4XsGNXO02KB
         w0cKuHUwdeLDMcYS59ah5rxS1gcxsji/tG4DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tT3i3PdSWIbZI2/jQXTr2ht9FWXt0v5w3WnrwY7zOxE=;
        b=TUmBVHiAWJgbHr7fzZD7LHpD5HShRO0YMByOV+HQq+pwSCEIWPPGLdTmsP6fR4F4J9
         QkTledvnQS5k+0nCBaiHb4ulB4V3YLFx/i8jRHF73cUQwNBjjWLh9U/qqVYR1L0GQjmw
         8NnkdyFWrC9y8TdPj21MsZP8RTDVYMEojE13Rq4HIBPlQ9JrsY4u6n7QoAoIjCW8mrdb
         Y1luBxwo9zMVT0xEsiBdz7W68jr0NUuBvkT9jmeilPqPSbB3ead5dV5P5iAsxBQg1adH
         npyhFM9CW2bE0LSJOmVPQyT4XX4yevWbTK6kA+NVD+uZ8fCwbnYfG3nZXmE2CLqj0a+h
         494A==
X-Gm-Message-State: AJIora+m/qKGaBBrMCBweI7d1WyIDk4RJYj40T2v+c4+8Snsr9+hVEmq
        g6q6YjiQq9Kqwb1Ru8iRkmGcS6bQoy9e4qosvPI=
X-Google-Smtp-Source: AGRyM1v3LPPtnQfUCdB/GLhNk8c1qhHWQMDg0BqQdv/KaurnkcxdVxuDVxxHvhz0v+sugLlj5T6PPw==
X-Received: by 2002:a17:907:a072:b0:72b:57dc:e84c with SMTP id ia18-20020a170907a07200b0072b57dce84cmr6709181ejc.579.1657582078967;
        Mon, 11 Jul 2022 16:27:58 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id f19-20020a170906139300b00722e52d043dsm3163259ejc.114.2022.07.11.16.27.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 16:27:58 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id o8so3811271wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 16:27:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:3a2:e97b:f3ae with SMTP id
 bi21-20020a05600c3d9500b003a2e97bf3aemr728744wmb.188.1657582077548; Mon, 11
 Jul 2022 16:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com> <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
In-Reply-To: <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 16:27:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
Message-ID: <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sc7280: Update gpu register list
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Update gpu register array with gpucc memory region.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index e66fc67..defdb25 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2228,10 +2228,12 @@
>                         compatible = "qcom,adreno-635.0", "qcom,adreno";
>                         reg = <0 0x03d00000 0 0x40000>,
>                               <0 0x03d9e000 0 0x1000>,
> -                             <0 0x03d61000 0 0x800>;
> +                             <0 0x03d61000 0 0x800>,
> +                             <0 0x03d90000 0 0x2000>;
>                         reg-names = "kgsl_3d0_reg_memory",
>                                     "cx_mem",
> -                                   "cx_dbgc";
> +                                   "cx_dbgc",
> +                                   "gpucc";

This doesn't seem right. Shouldn't you be coordinating with the
existing gpucc instead of reaching into its registers?

-Doug
