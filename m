Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0ED66D7223
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 03:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236610AbjDEBoD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 21:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236247AbjDEBoC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 21:44:02 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0973AAD
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 18:43:58 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id k13so6387551iov.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 18:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680659035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8kHzkX9SzRAkXXCj8yo/EKVJUuQ4P1xn/63qVUInQs=;
        b=i9T1CFuEPq6knTYwkWxspjaVaE3oVJ+xHE8V/HWUGqp4KihyT8cD6A4jXo195Hs1TB
         3Nlj3keIDe/Kc4XP1YSA+dsQ2AryZqABe6/cdtCGUVwcFnd38a2uBOc5h6ZKIQs6ymfg
         Ig39Rfj5g4tTuBH3zm/mD0w2GEXNkgrRaaCVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680659035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8kHzkX9SzRAkXXCj8yo/EKVJUuQ4P1xn/63qVUInQs=;
        b=s4ekl2Mn4zngz/kmRa/Djdte91ySDkdWw8YTpaWTHoXUBeeWXPN0HVRt+zrInMAeQY
         gOM4FcLIMywRFOUbNgE1Nvr8ESIbtwOmZW6cS5CH2rAYjnIeZPsp1K+mt+ZLwqGBN349
         wWcvaixh7l30HbUMyRmD+rPeUGC9euU5O1QBb5rYXfjXew7Y3n3ZVm44hL3K+G428uvm
         R7UnTQdcJN/Vc0IH4iMVz72xP23WsMwtY09sifBZ26OVaLm/pJ5YRQ20yQAgfC7oHIU4
         zb2jJ/S+/gnRkfQr4JbsW4J7G5SK4rRKYuiIJzE5bOVa2OlGHKod7D8w7Eyd4td9MzLI
         NZdQ==
X-Gm-Message-State: AAQBX9cIdfi3Kn0V4s8PTNCfBpS0i1CI5XGrvCsgwYVXdAaYqX4QkMGP
        jssN8m6seTAv4x+6Dy06S0Oei7ZHz0y03ktmW9g=
X-Google-Smtp-Source: AKy350aRUeas7HQI6Ejbtoq50bMCVe5kxdh1PH4SbRRbwpDATRcVjlDh0nj5U3mpD5YWR/5VNipVvQ==
X-Received: by 2002:a5d:9317:0:b0:753:1524:6e47 with SMTP id l23-20020a5d9317000000b0075315246e47mr3311491ion.7.1680659035662;
        Tue, 04 Apr 2023 18:43:55 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id b28-20020a056638389c00b0040af4b40201sm3700231jav.86.2023.04.04.18.43.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 18:43:54 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id h187so13509643iof.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 18:43:54 -0700 (PDT)
X-Received: by 2002:a6b:d010:0:b0:752:ed8d:d015 with SMTP id
 x16-20020a6bd010000000b00752ed8dd015mr675791ioa.1.1680659034009; Tue, 04 Apr
 2023 18:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com> <1680271114-1534-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-3-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Apr 2023 18:43:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSHmQPtsQfWjviEZeErms-VEOTmfozejASUC9zsMjAbA@mail.gmail.com>
Message-ID: <CAD=FV=VSHmQPtsQfWjviEZeErms-VEOTmfozejASUC9zsMjAbA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] msm/disp/dpu: allow atomic_check in PSR usecase
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
> Certain flags like dirty_fb will be updated into the plane state
> during crtc atomic_check. Allow those updates during PSR commit.
>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I can confirm that this patch plus patch #1 fixes the typing problems
seen on VT2 on a Chromebook using PSR.

Tested-by: Douglas Anderson <dianders@chromium.org>
