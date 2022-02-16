Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AA34B7D6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244690AbiBPB4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 20:56:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245726AbiBPB4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 20:56:49 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9612C1D317
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:56:37 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id i21so1003752oie.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KCyjpWkYyVwulnMSGHPzK15YA1gsgRLkW8T95C42RLs=;
        b=LNR7cMd/oTxmlVmnnr0/9oha/NJrcVP8Di5AvttdpQ+MIGv8ctlPHPVN341VV7bgAS
         nM03GM3lYzgcsmEsTln+dO0IyYD4Uo847Rf9OvcngvEaHIjJhdt+NbIyeSX/hOASHY+r
         zrodAlxjW66C1q0PGih0d7Ga52QMSfq2lcf+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KCyjpWkYyVwulnMSGHPzK15YA1gsgRLkW8T95C42RLs=;
        b=OXHzXhlG+M++Jv39eZJyZCsgXDYwlPfRxRVIBHcYZTN2ZXhSuANqpWQrP9M18Koq8D
         iYwO1gSUdW6x/BD81d35HM212lWhlC3TtnZcjPEDVgub/7RC4emSfPFhrsSJiRQDRCO2
         DHvl+9/3MHhACFUWop2P+mecnGyhY419q8+bqhQW86OBmsxqKKZyNnsEYYMsEmx/BJrG
         xEnKIXdFSbDIn5SHpIgk3slkl33gbrNUxMQMt9V6/tjPjfKNm0J1Bi7k1i4gnY490i6Z
         ZZX6Gf18QJA1yCa8ruEJrEEdFmGbowEA+SvDU+7f+kK1pym6LsDqz+jRjaWypH5Zbhyb
         vkGg==
X-Gm-Message-State: AOAM531aZqFRsU9+/1GhbD+NwtG8+Us/idrnhAF2DYYUiOnyr+GU+une
        PylrXGrvnMj44jpiaxSZBZ3yyah+hgNZQDxWC9TxSA==
X-Google-Smtp-Source: ABdhPJxYf/Ggt3IXaM5zUgr3PhbxATDPeznV3McX+HESVwjV1FmJjaH2gqnopr4zi66eMYtzYAWT/VgNG3JzRBLp2YQ=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2949049oig.40.1644976596157; Tue, 15
 Feb 2022 17:56:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:56:35 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-3-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org> <20220215141643.3444941-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 17:56:35 -0800
Message-ID: <CAE-0n51haHQTtZy08Quo66WnuDin_kx8MK_sytNQ1x_N9YU-Wg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/msm: move struct msm_display_info to dpu driver
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2022-02-15 06:16:37)
> The msm_display_info structure is not used by the rest of msm driver, so
> move it into the dpu1 (dpu_encoder.h to be precise).
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
