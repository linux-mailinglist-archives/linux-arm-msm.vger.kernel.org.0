Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 493045356F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 02:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241790AbiE0AIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 20:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235950AbiE0AIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 20:08:01 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC5EB7F6
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 17:08:00 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id i66so3960367oia.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 17:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OoIcULgqhKFgrbLMCehQr+O/jzYIvQo+4QSp3/O1yig=;
        b=eUljGF15wH4zUzJsDGB0MW6zAq6R2Ofwr487mrZl5OOoRIgUnQb2VZ2G7idbuj3vGn
         pKtGX6UHhPNbkOGpy3VdpTpqt6F1TMLmBBjNVH2ShFJIdsx7h+ZKMYB7nGcd7pb1j6+a
         8j4BMQavyurOSN7BZHQzXdOVR4CyV9pOubfUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OoIcULgqhKFgrbLMCehQr+O/jzYIvQo+4QSp3/O1yig=;
        b=PB0sjEMr0egXLToJv+0OV6mqmtsQC2u2I5wU8SZ55+Jf+nsmAcaAdzsJSt8L5itdIr
         y1PfMBiXCZ+2bRZ3/uWMkvcxuugJlFuTnNneAezRtgz/xjTL0mogEtEA7PUHIBrUHbXt
         kEj7Pvyahy23s0QaE+LHTf8NgL0qRICT3q0u/iNcAwwL0RQKrmWwx5/7tERkVGVI0ey6
         Rv3Hw0sM/vbNUNUQUHF26KtJ348WbXBMUgL131dzy5nDg2NjVo/6HDx9UKlCF23Cqv5H
         Uj5gyhqx5sbTZB9KvAZ84Y3E9nFgvC8aLekQr4wq4VcRz/dWRrEPiCjZD+2iu8t5IN9W
         +8OQ==
X-Gm-Message-State: AOAM533NlxxyVZ0SARLRxlORoBGXEXlU9KWpVyBKuZzDmOH3eUucBwHI
        6eiBP9GJv8EegokhBnlzmuCxGoP3WQOWUAe4IngImw==
X-Google-Smtp-Source: ABdhPJzv3vGdw/AH+nHltTzgClLhxDm2CpsTSnW478bFZKdrWLFbUDMYwQtiwv9E6GjUmUYUnPDZsCVZNLb0qhFpfaQ=
X-Received: by 2002:aca:ad50:0:b0:32b:a7e4:ecaf with SMTP id
 w77-20020acaad50000000b0032ba7e4ecafmr2453691oie.193.1653610079686; Thu, 26
 May 2022 17:07:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 May 2022 20:07:59 -0400
MIME-Version: 1.0
In-Reply-To: <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com> <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 26 May 2022 20:07:59 -0400
Message-ID: <CAE-0n51-7WfZNF6cixXrSwMgNUEw3P6WA3D=OqWUCpUcmus2=A@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] phy: qcom-edp: add regulator_set_load to edp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-25 14:02:18)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
