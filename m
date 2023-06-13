Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA2872EC08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 21:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbjFMTeV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 15:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbjFMTeU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 15:34:20 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1462D1A5
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 12:34:19 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-977e0fbd742so856038966b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 12:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686684857; x=1689276857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLMJYRBorT4BFeTxoWUQlILrVOQXKFEtzQp+4QGPj4s=;
        b=lPKHY8D4tUkXouQb3DHzWVNFtfbN1I+p05lJYruJ+PikwdEyb7NWBO+2uMpMKXezOz
         EIgwcwTzNAgkhc3M+BXITuyIjO+gWbHruXkGtsepjJxlVQIntf5W89MNKS5DIHwVc+DS
         mX7CS/YZBqfdO1L9g4LKrzFdv7qOQUGQVoXHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686684857; x=1689276857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLMJYRBorT4BFeTxoWUQlILrVOQXKFEtzQp+4QGPj4s=;
        b=EfYm3JudKVP1NGrtPP2p0lHMpl2e5ToweMAo2pDSAL3v3IYBs0qJ05fpN75VJUJgH7
         8vhYtY8l5Qa6jOFsUz3bUfXWJdYwABTms13JQ6+yuoDkHlmPatUI/n9Xa5SvmRGN1y5z
         mWxTkv6vqq0E3jAH58sBeUGWPxXHPLoWAVCBnQA1OaRtOtFtFri+sGrZO98xgjk5wThY
         bASrfGjNFzihdgM5UPRdX3N5Eu7gMwbAVfuE/Xb3Cr9/Ow8/cwFraJN6j2ZgrPBMA0yE
         0rLokZD1YJVZSuHqV0VI3mKpQ6fFXD5+JvRfNBtsv9oe9dPpK5SaUAHvaxU2N3ik35Qd
         HwtQ==
X-Gm-Message-State: AC+VfDxTbIIwjG7WH9cnh5b/VMWgdS+YNZDUKaI6eax0fEvVQ5Smlyjt
        FH88dVi4H6XOnN2brBpCjY+IrlHkWPRHK8OFPiR2Tnr2
X-Google-Smtp-Source: ACHHUZ7SiXHtXqUIQOKI3TEj7pk1MLlQTZC1d8qxQojGJBPQjJc87uXAbvNvbg5gD0khQPwspw2c0A==
X-Received: by 2002:a17:907:7f07:b0:96f:6c70:c012 with SMTP id qf7-20020a1709077f0700b0096f6c70c012mr11545247ejc.45.1686684856978;
        Tue, 13 Jun 2023 12:34:16 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id hb20-20020a170906b89400b009788d99244csm7139767ejb.149.2023.06.13.12.34.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 12:34:13 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-514ad92d1e3so2829a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 12:34:12 -0700 (PDT)
X-Received: by 2002:a50:bac8:0:b0:507:6632:bbbf with SMTP id
 x66-20020a50bac8000000b005076632bbbfmr11406ede.6.1686684852516; Tue, 13 Jun
 2023 12:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230612220106.1884039-1-quic_bjorande@quicinc.com> <c31ee9e4-1878-c0ae-70e6-42af5fd838c7@linaro.org>
In-Reply-To: <c31ee9e4-1878-c0ae-70e6-42af5fd838c7@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Jun 2023 12:33:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whn3GDDMQiJGYbSK8LF-OO247m69Sqcf7dMw6HFthgqw@mail.gmail.com>
Message-ID: <CAD=FV=Whn3GDDMQiJGYbSK8LF-OO247m69Sqcf7dMw6HFthgqw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Drop aux devices together with DP controller
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 12, 2023 at 3:40=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 13/06/2023 01:01, Bjorn Andersson wrote:
> > Using devres to depopulate the aux bus made sure that upon a probe
> > deferral the EDP panel device would be destroyed and recreated upon nex=
t
> > attempt.
> >
> > But the struct device which the devres is tied to is the DPUs
> > (drm_dev->dev), which may be happen after the DP controller is torn
> > down.
> >
> > Indications of this can be seen in the commonly seen EDID-hexdump full
> > of zeros in the log, or the occasional/rare KASAN fault where the
> > panel's attempt to read the EDID information causes a use after free on
> > DP resources.
> >
> > It's tempting to move the devres to the DP controller's struct device,
> > but the resources used by the device(s) on the aux bus are explicitly
> > torn down in the error path.
>
> I hoped that proper usage of of_dp_aux_populate_bus(), with the callback
> function being non-NULL would have solved at least this part. But it
> seems I'll never see this patch.

Agreed. This has been pending for > 1 year now with no significant
progress. Abhinav: Is there anything that can be done about this? Not
following up on agreed-to cleanups in a timely manner doesn't set a
good precedent. Next time the Qualcomm display wants to land something
and promises to land a followup people will be less likely to believe
them...


> > The KASAN-reported use-after-free also
> > remains, as the DP aux "module" explicitly frees its devres-allocated
> > memory in this code path.
> >
> > As such, explicitly depopulate the aux bus in the error path, and in th=
e
> > component unbind path, to avoid these issues.
> >
> > Fixes: 2b57f726611e ("drm/msm/dp: fix aux-bus EP lifetime")
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
