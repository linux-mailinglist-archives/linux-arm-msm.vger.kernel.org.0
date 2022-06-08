Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86F9C543E28
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 23:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbiFHVEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 17:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbiFHVEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 17:04:24 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F22226CD7
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 14:04:10 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id h15-20020a9d600f000000b0060c02d737ecso5616811otj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=h3WYdhT+bSyEFJQRK2T2Y7MQ9aMLpv/BsDHvjB1RCFo=;
        b=OV8nFHwFV8+oaUgIpeZSsMa+igLoLIgsbGnG1Ekd6Pju2FJ57wm40rgHI9uPr/tLzX
         WXq76Gqx58nsJjvNT0+UhRTm5PcUqWeeV+0phPaDqsk0aJpBXduSfsl1UpE6+Ksr1bYw
         NU9pj/krznBcya3uKkZSxUBbF6zSq2wr+EF/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=h3WYdhT+bSyEFJQRK2T2Y7MQ9aMLpv/BsDHvjB1RCFo=;
        b=cvmu0sUcj5+eJatQ/AmKlLqqv2oEuHLcj33Bo2sFT9Igd+1ntxem/vj1Xab13kFBC+
         Yy5QWSjILXtN2gMFonZTw9fWSgMLdo3GExj4Hw6/A2VH1K0o8VSt/M6axQsErHbDm/N1
         w29Tv5tPDxBLSsbIXqT1hlHZIfG2lw89nSlbqtWd8QtQMuTTihcOpvOMbZGdPKInE/lt
         nMIbkQiiNgUOfSzGX4K/k/clP6OFo/8Ygm5sr212Kc28l8Yq3hs0LPgviovoKVItoApZ
         mlLEbcQnuoTdUoar8MgHbGT6UOPTcPGN112X5y/Sppe+P/UTFoXlDhRLAv7/SceT82Ww
         /thg==
X-Gm-Message-State: AOAM532fWnnSZd3rCOfcTMiBbivfcBHQJCUDAQc+8ey5Y8/225eZ7Iyx
        cme7iyEm/2uz+0G6w6GTg+vBZ/eA0D1j+o3Rg4KONw==
X-Google-Smtp-Source: ABdhPJyEjeij56wVLmMzReZohtc8fJnmcF7nuZKiyj5xoJItE95hmxq6PmAGeiZCmyQ8BoRvSHdowjvMNXYqpBsHYXA=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr602063otj.77.1654722249602; Wed, 08 Jun
 2022 14:04:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:04:09 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-11-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-11-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 14:04:09 -0700
Message-ID: <CAE-0n51Yr4PCGRakrSapUEdCKe7oFa3axw=5BXdDXK3D6b8NMw@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-08 05:07:21)
> Since there is no more difference between the HDMI platform data
> between MSM8974/APQ8084/MSM8994/MSM8996, merge these configs into a
> single entry.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
