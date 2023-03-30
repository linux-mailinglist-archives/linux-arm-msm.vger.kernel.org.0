Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B706D082C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 16:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbjC3OZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 10:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbjC3OZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 10:25:20 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416CB173F
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 07:25:15 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id b6so13156944vsu.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680186311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgSAl4+YtdqN02WoMh9cxZGDhw1MNojQ8HH4aKN4HAQ=;
        b=HVwX3GyMBDMI81JH3eMSbxh8eUDP5GC5dqFdJCt7N810faVDMtzxlcbcYLO3JpDj+X
         YudlkEmrBH5EgIEDiLy+7UTjzzOzTE3nTZxQJSj8BIZ5u8GIVdJ3bVvAopcAuf1seqeB
         jcfGcA9MxgfXQA3hfOwh4Svnrj+Yq2SIFDqRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680186311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgSAl4+YtdqN02WoMh9cxZGDhw1MNojQ8HH4aKN4HAQ=;
        b=yUqi8BhXOBfH4EBGInRwC1WfPNkH47XuQWNU7u6avocEpQByo+qivRboC9Big8Lcv4
         gyL/ddpfL7rrPYzzxKdgqhbCXVH3wYljJm+3ek4moXEszCqo9r0s6Kv3wB16s20nBDan
         lfGA7S9VmGDMIadM5IoUn39fywbDW5LNxKzV/ka+s8A05LgFUyEMLZBfkaaxmxnOPfgQ
         44IYyJluP69SFhbHjzfFzVsBdgTVk/D2AkDxI6govwI1dF969hUBax5TsS2KvsGFTIzu
         AO7oo1gVdq4qWhM0X83/1lnU75tvlUSdmc/ShoyQiPNM0tdHz+5odpTlkbhZynKoF9eA
         da3w==
X-Gm-Message-State: AAQBX9es+NUHT51RBsvlGv1ldGLuZs/jXrKrDFyifGnPKRfh9I8ofnFJ
        c/Yx1KTw/6fsYRgbfuLSGUI3g5YemzOIGNXxpTo=
X-Google-Smtp-Source: AKy350YdQH9KsBNVRZvXqp37kYZ4TTEhF3b5p0KisqhMzHcp/oAYDRRig1+obg1kBAMoEBZLWVBTvw==
X-Received: by 2002:a67:ec4b:0:b0:426:b261:9e84 with SMTP id z11-20020a67ec4b000000b00426b2619e84mr5380011vso.21.1680186311692;
        Thu, 30 Mar 2023 07:25:11 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id i7-20020a05610220c700b0041ebb606a9dsm4422025vsr.20.2023.03.30.07.25.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:25:11 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id c1so16399133vsk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 07:25:10 -0700 (PDT)
X-Received: by 2002:a67:d493:0:b0:426:a319:a226 with SMTP id
 g19-20020a67d493000000b00426a319a226mr8587434vsj.7.1680186310355; Thu, 30 Mar
 2023 07:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230329233416.27152-1-quic_abhinavk@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Mar 2023 07:24:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7JRP_2C7Rhc+0pwgPPBMKgZ=wJXkPvac4j5dDEsdAkA@mail.gmail.com>
Message-ID: <CAD=FV=U7JRP_2C7Rhc+0pwgPPBMKgZ=wJXkPvac4j5dDEsdAkA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: remove hbr3 support on
 herobrine boards
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        dmitry.baryshkov@linaro.org, quic_bjorande@quicinc.com,
        quic_khsieh@quicinc.com, agross@kernel.org,
        konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 29, 2023 at 4:34=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> There are some interop issues seen across a few DP monitors with
> HBR3 and herobrine boards where the DP display stays blank with hbr3.
> This is still under investigation but in preparation for supporting
> higher resolutions, its better to disable HBR3 till the issues are
> root-caused as there is really no guarantee which monitors will show
> the issue and which would not.
>
> This can be enabled back after successful validation across more DP
> sinks.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/=
boot/dts/qcom/sc7280-herobrine.dtsi
> index b6137816f2f3..313083ec1f39 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -464,7 +464,7 @@ &mdss_dp {
>
>  &mdss_dp_out {
>         data-lanes =3D <0 1>;
> -       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 =
8100000000>;
> +       link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000>=
;

This seems OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
