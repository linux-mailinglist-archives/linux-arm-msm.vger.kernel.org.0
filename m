Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3F4B58CABA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Aug 2022 16:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243305AbiHHOtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Aug 2022 10:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243491AbiHHOtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Aug 2022 10:49:19 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353FFBC08
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Aug 2022 07:49:18 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b16so11635291edd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Aug 2022 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=sGGMDrvq70fK3xNBUxx3zSxTGxbNUsun6AK0mtlXrck=;
        b=aNeNHYUnGAERLnnsoWYIWNZLsBb+XskAb+Zbzep5u56gCqHprwCZpAhjmoxi0eGCt3
         ENCGw+eikSwJrImaEpmJpnt4dXgTf5WdEsQDkixIVfLWK3xndLG9hJyfN5tlBSXsjS8b
         iSl4IzQlwipS4OiUW+qYCtv4IWP6ti/mpxM7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=sGGMDrvq70fK3xNBUxx3zSxTGxbNUsun6AK0mtlXrck=;
        b=K2jwjGW4PRdXMg6+VqHFh/jMC+AxBprdOcUtxzhMQV6QpM8jm/MPKZtqdMZRInOxMC
         Eg1gkO+lTUf8ZTdbRcvjAGamNygCp/P7OBAQCXHZZzgRGAGr3DaunJvLmKS6mdJ3WbwY
         FMuUSu7Q0ybXtvWd9yi4vbBssx539hPjDabIuRMfmCvdKcDrvHGz/rYVltNXQ82p5B9X
         eUJhQ4YCH4AprgLHtFlNjlrDlHmBFv3eb0vpgBF82CJ5ekqPAqWVynsLzYNES3ZK5P62
         X1L7nFbyEw/j7Zp28LZVAlW3whi8JI3XDxHol2lyCtqpNsFDWef72cr8WZannvJxiA+R
         wobA==
X-Gm-Message-State: ACgBeo0mNJ6G2XmemwUDpEwPgCFIRugrObO5tgnvgGB3D/pes8lnJOS7
        tULgIcOMVYQH9nudng0/wWrzPGiubsGQ0glo
X-Google-Smtp-Source: AA6agR6pyqtYqfeVBP2kw6R8i9GvZaAEUIlNIK+Sxc/pgOO9Sl4X9xuZQ+D8MTeD+Vx5WGoECMHdeg==
X-Received: by 2002:a05:6402:40cd:b0:43e:5a4c:b5a5 with SMTP id z13-20020a05640240cd00b0043e5a4cb5a5mr17985576edb.154.1659970156476;
        Mon, 08 Aug 2022 07:49:16 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id v17-20020a170906293100b0073065767404sm3399224ejd.34.2022.08.08.07.49.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 07:49:15 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id j7so11203878wrh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Aug 2022 07:49:13 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr11636287wrr.583.1659970153270; Mon, 08
 Aug 2022 07:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
 <CAA8EJpoAN4CVMKNouh3pPtX-5rnBeL3_T60M5cNhirNEmNeEkQ@mail.gmail.com> <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 8 Aug 2022 07:49:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4cddyPxg2D5KP9ew2i=AQOSn=Jz_OmuZ0BrZCu2+MLA@mail.gmail.com>
Message-ID: <CAD=FV=U4cddyPxg2D5KP9ew2i=AQOSn=Jz_OmuZ0BrZCu2+MLA@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for
 dspp in sc7280
To:     Kalyan Thota <kalyant@qti.qualcomm.com>
Cc:     "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>
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

On Mon, Aug 8, 2022 at 3:44 AM Kalyan Thota <kalyant@qti.qualcomm.com> wrote:
>
> >I'd like to land at least patches 6-8 from [1] next cycle. They clean up the CTL
> >interface. Could you please rebase your patch on top of them?
> >
>
> Sure I'll wait for the series to rebase. @Doug can you comment if this is okay and this patch is not needed immediately ?
>
> >[1] https://patchwork.freedesktop.org/series/99909/

I don't personally see a problem basing them atop a cleanup. If the
patches Dmitry points at are targeted for the next cycle then that
seems like a pretty reasonable timeframe to me.

-Doug
