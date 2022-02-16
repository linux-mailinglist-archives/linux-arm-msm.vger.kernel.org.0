Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7544B7D5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbiBPCRz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:17:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbiBPCRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:17:54 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671FEC0848
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:17:43 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id u47-20020a4a9732000000b00316d0257de0so890781ooi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=LaRMq8ZhRCaHC8armaDs2spovSgD/IU1miVPMO3NaCs=;
        b=ZDc5CxFeekOyijQZ4h5KQniJAMH2o9I8ZvmGzmDO2zfxpGeolNEDVpyCqlaJ6Jw/EQ
         QuU7c7QyhcC4G7d6LTLkWesxBvXqAasTUO0w3txbmOToQ1In7mmICQr/j74fGbfcbcgn
         3d1VpCLWuT6leZVSTFVtv6qbZmN8YgfHr4/jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=LaRMq8ZhRCaHC8armaDs2spovSgD/IU1miVPMO3NaCs=;
        b=zKXHldTA8Y1JK0xAZEMVQ++vpL4WzfSMlp0fWbolj4w3YXYvcgY9GM1BY35e9ZmqVQ
         JTY8Wy9H62Nl7EYoFRnwXbfdyWJltVZKO5t5DyVnFf0js+MfhOV5rvJiiichHRrCJqhu
         06cOBQo+HLykilbfgwqNCJNArdqVGW7+GCw3PZOoGZPBpgHf1dMxvkzgaS+y4402K2I6
         hs91whodJeaQ15Nv/wrL6h4bKrnwwZCsBgNspq2WFREpH8+zAB+cKb/zK3hS4FYHxMWT
         yl3DpPkWuKk+6hFOx8YTUYlEHYk2aA3wb96VNLwBk+clS0RPqJuj+AmLZKNIof5KdM52
         qpjg==
X-Gm-Message-State: AOAM5325fSGl7lUU7UZDmJxfGz+vv0Ege/19SObdmHjOgm/xCdgrD+jv
        vVUD3rW+dTv/o015eDh9oJD1E0qLRo30kKNqjtOxGQ==
X-Google-Smtp-Source: ABdhPJyw8QdTeLdPkaSbn9MW+CqLKQfUvO/jujNN3XsSr4MZgwU3uIvJJqRAk/vug505l/EEco7tmML/hPNkhCH+j40=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr223719oos.1.1644977862132; Tue, 15 Feb
 2022 18:17:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:17:41 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-2-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org> <20220201151056.2480055-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:17:41 -0800
Message-ID: <CAE-0n52hXz0tptXxip4vJdPPfXa+Vk738+F49j66swAhTgSBXA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/msm/dpu: remove extra wrappers around dpu_core_irq
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

Quoting Dmitry Baryshkov (2022-02-01 07:10:51)
> Remove extra dpu_irq_* wrappers from dpu_kms.c, merge them directly into
> dpu_core_irq_* functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
