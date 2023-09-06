Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6807945F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244980AbjIFWFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjIFWFw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:05:52 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B67C19BA
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:05:46 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ff09632194so426983e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694037945; x=1694642745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXhej4cvrOszHeClcSERUsV6+B3yIbtViW4bGC1f9ds=;
        b=FwWpb13Y5LR23mH38W1Iv3n/0HJHfQ8iKAb1q4/DFZebyijKN2YgYVjigUhH3/Tyqx
         m229Yt0TdhfFnCu9SR02c666NKmm/Q99K6veJNyFXNjkLgAleGxpgNxWCCniiw88XcyN
         Kd85gbCQMKB1JWtqa/KRWoJH2uiE+j9hWv3I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037945; x=1694642745;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXhej4cvrOszHeClcSERUsV6+B3yIbtViW4bGC1f9ds=;
        b=Tp3Dh0Qcf1u69YubimPkBtiEuYc25oPKcGZUKU1CP+2Yg/wLvWlsKhvdJj0SWBE1Fl
         JvzSctYLXheMRaPEzojXVoM9CBnjAq/zBE7eMFQLe3pJNjutURUv807wCl8b99k20NQq
         WH5q9esmgQiD88Nde4hHQITrcwPQru3OHBgMrj9c+P7anYk62EnwanFgEitRHsF/2B1S
         5s7vZUBCha/+FG35zTPsWN4pCAbUEjJqOY3ufJ/un42N6dkOHSLOg/4MEbuhdDFZxPUu
         SFiTeVjzppTL+m5DLBClPjNoPN+4NlBIBD9FLIX6P4YKwUClOHnYEqGEsYV1TOCHipfH
         tYOA==
X-Gm-Message-State: AOJu0YxhCrrGqp4mj2EBVXJDtu/dNLfnYBNrswdGtATGMZskqFZL0nW4
        nmmYwJ+eR9ECNp2k/PIeHKrjLEzRKgdVLnf2d9hMTw==
X-Google-Smtp-Source: AGHT+IEhMKwojT+m2voBXcESzDghYyCXzNWBGzfOl9tKYEOWjtKcMUgC2QaGAu0qmCAUiXjB5mhREyuiJwX/wmv3Nzg=
X-Received: by 2002:a19:4f52:0:b0:500:9d4a:89ff with SMTP id
 a18-20020a194f52000000b005009d4a89ffmr3220273lfk.62.1694037944892; Wed, 06
 Sep 2023 15:05:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:05:44 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org> <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 17:05:44 -0500
Message-ID: <CAE-0n50859GHEpOjtk+1ukYxgoumKiOyT3kwGJ6K8CDd9FbADw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] drm/msm/dpu: enable INTF TE operations only when
 supported by HW
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-03 19:04:51)
> The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
> only INTF_1 and INTF_2 actually support tearing control (both are
> INTF_DSI). Rather than trying to limit the DPU_INTF_TE feature bit to
> those two INTF instances, check for the major && INTF type.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
