Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B294CC889
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236734AbiCCWHO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:07:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiCCWHN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:07:13 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA8C16FDEE
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:06:25 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id k9-20020a056830242900b005ad25f8ebfdso5831706ots.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=a98NmfLmxPwElplSUG27m4JRPCjHA63Gw4sinoazLJY=;
        b=GobSvDa3VrHxA7j14C3x/nMk7a8rt3B6ncIMZ/6ZB248iDm/WJ8X5MFgEZQdYEgc/N
         xEMoAprLTjD4kd4E34oMF6mshpLM3QZk1bCU5aMsnZwUiBkujKZXg1ke4s8xeK505b/b
         L9cgDH8QI5yBfTrxVVK3LKj0pudr64Mqiia80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=a98NmfLmxPwElplSUG27m4JRPCjHA63Gw4sinoazLJY=;
        b=b33GyioEp6vLmHteu2ETAs/XihUF5ViV/FmbXu9h8+7R8fRkSrbe44r0eZW1MZ4dJs
         zouKGsdyUOqn4ZAAeW8cCwPDzjmGThuTVw2zKgsAnGRGA0G8+bL6K+FJWjrsXcu+LnGL
         82E09+aprrSy3umYoxEKgdXN17FEy/JjWjReJXnkhkurOrDuGZYGirFxB7H6WePGNi87
         wFaRdmD4CWvr3Lz2JL0DZX8O7L8SO57PIzR1LkrxHE0A5iE35LFt5p/NZad7FlF9IEoD
         sSbutm6tJzjuaQrvLijg17q63WtiBEHf8RKIzGbewmvhLfhvJV2sy4tGG671/xZyk94a
         d0KA==
X-Gm-Message-State: AOAM53006kvt7zQ1xe71CZ4gXsBXnnB0krHuwAnuIa4zrMtQlKTndEoL
        eqnapMhsWGH4rqLCjCY9VdWJ/mvBbpOF9w7j9HaFXQ==
X-Google-Smtp-Source: ABdhPJyJUmY4cuZ/bYuBxPB7/aTUkrncJRnI7ZEDL9i6xSU71lycPvci4ZQssT9MWj/uBiKHGegkItt395XnRD+8J2U=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20656220otl.77.1646345184764; Thu, 03
 Mar 2022 14:06:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:06:24 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-4-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com> <1646300401-9063-4-git-send-email-quic_vpolimer@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:06:24 -0800
Message-ID: <CAE-0n51mFD0JfxxEHOxj=mTFYV92Cc0JDzEY2fxKn6OKOwjq+g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64/dts/qcom/sdm845: remove assigned-clock-rate
 property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Polimera (2022-03-03 01:40:00)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 08c2a076d1("arm64: dts: qcom: sdm845: Add dpu to sdm845 dts file")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
