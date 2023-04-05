Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB776D721C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 03:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbjDEBni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 21:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjDEBnh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 21:43:37 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A462D30EB
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 18:43:36 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id j2so11043472ila.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680659015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwpFUC847/YFt/XfpeQoDJ4SxIEry2tnTeuETvaZGB8=;
        b=ceGedfB4nBUKRviOIAXmDDYh1n9HsSC90QpHtsDAOfEUeyD70QD5sekdiD7GlnjeQO
         P2bfmbNOhTg8KcmfMeDHESn8moVnofIAJwwarzddMeHhpuyT0xerdLUNM7TprW+6MoWt
         Y4ISj1+FR5I7HLnU7blWBfYZG+PSwLjX8PemA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680659015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwpFUC847/YFt/XfpeQoDJ4SxIEry2tnTeuETvaZGB8=;
        b=OkkYUZkxtZXBlED2/v6P0VHrX2+9A8QoX1A8yT6ARYgg6nNbBkCy4ceCyWJPe2DseL
         FTjTX2GdLMFQRm+LXfdeWkg+722us9QBuz/j20ojZ3DhPAabOURPzd9pC4tuGdRY+eg6
         yvxGcQnIJybQ1elAN3iIYDTtYMWcN0LTveZuNKFIPSB5P05dgU2P2hhm8puKq4cLIels
         G2imUuE3pWNayIPeQ9iDmms70CrAK7+pBwXaArMflNm+bRiKket/b9dsZMI/Vk12orh5
         seH8PX9TH+/ZOiYzOKNPOj7GTyaN8CP9yB8O0xKmzwNVJo1PhdI0caW1isAugmLCs6cR
         TE5Q==
X-Gm-Message-State: AAQBX9cY8aSi3Tio2Iej6Rw4lXtscb3RaoINPnQD+uuffUBt+hFVn0ZW
        u5Avh1TKI89P5Ip0077Q40gsXWF3Zk94172+w2o=
X-Google-Smtp-Source: AKy350ZB6ZBd+ozrl4rZNeDJzb2BoLZHKERUbJ6m5vFlKofEZKCWEtnyXJWPgvXc9DhmUgBFWHJkHA==
X-Received: by 2002:a92:c8c9:0:b0:326:489c:8cd2 with SMTP id c9-20020a92c8c9000000b00326489c8cd2mr3338057ilq.7.1680659015326;
        Tue, 04 Apr 2023 18:43:35 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id r19-20020a924413000000b0032670541724sm1928729ila.74.2023.04.04.18.43.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 18:43:34 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id k7so5331339ils.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 18:43:33 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d9a:b0:325:dd36:7451 with SMTP id
 h26-20020a056e021d9a00b00325dd367451mr2720800ila.1.1680659013319; Tue, 04 Apr
 2023 18:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com> <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Apr 2023 18:43:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XV4yjUb2ufQZjOTYsgFXE0Ghnor3f8FCSdpV_pcZd1yg@mail.gmail.com>
Message-ID: <CAD=FV=XV4yjUb2ufQZjOTYsgFXE0Ghnor3f8FCSdpV_pcZd1yg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while in self
 refresh mode
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        swboyd@chromium.org, quic_kalyant@quicinc.com,
        dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
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

On Fri, Mar 31, 2023 at 6:59=E2=80=AFAM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> While in virtual terminal mode with PSR enabled, there will be
> no atomic commits triggered without dirty_fb being set. This
> will create a notion of no screen update. Allow atomic commit
> when dirty_fb ioctl is issued, so that it can trigger a PSR exit
> and shows update on the screen.
>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)

I can confirm that this patch plus patch #2 fixes the typing problems
seen on VT2 on a Chromebook using PSR.

Tested-by: Douglas Anderson <dianders@chromium.org>


-Doug
