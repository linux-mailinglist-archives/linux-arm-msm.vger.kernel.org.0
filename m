Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8826B4DCE6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 20:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbiCQTEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 15:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237840AbiCQTE3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 15:04:29 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2892DDEB98
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 12:03:10 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id d15-20020a05683018ef00b005b2304fdeecso4145244otf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=y9n1grNnQGZ9V3E7Nxt7rAxrPIpeE9mWBbzipD+kNUA=;
        b=C7OnQb7Ft6JJPMdNGPZU9f+Wh0vGuYeVv/0t90gB4v421kaEXNNNtfDZWN4n8OmVWa
         b+5oZBrvYR2b1xTYVchDi3Qp3Lwn4xSe7Q5peils3J/LpgCY7X/HD0EPR1zP0KCF5VAH
         mBJrSfBYHiSM8V5MiL5qFc2EdaNBx3kXf+/AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=y9n1grNnQGZ9V3E7Nxt7rAxrPIpeE9mWBbzipD+kNUA=;
        b=kO5fWcJzTQDR5/tJwYYQf7AaRcw1d/j2a1VkyyMg12Li52KOhdHTLVCviR27p37nr7
         VIpuQZQtQ1ee7Y3nOJxuQR25Gc9zOBq/RjKFMGCLhvOBR50yt1Z4kBWr4/HX22UA1gvY
         vDFXsnm5bHmTtsp50Q7I0N6M0+XDoi+o7WDD/10aC0WQjMeB+TIdCYmi9h3jW4sYieZd
         f0s7XXMjXj1ykDHpHrgluEyXZEq+cYq0PR+fwrdoMA5cAX93aYCk0HqVFBXy6mcmEVWJ
         t5fVgl4zHVj/YecX9E3T2XDJmkRTmaTzHAsfAAAe8k5lHSvNz7J2Tb6vHpcRaoZQBUIe
         /MFA==
X-Gm-Message-State: AOAM533nk5yNjI5bL3CWnRxNZPFts/cTNudhc5xaDGvh9UKpjYH5ZpRN
        zT4qX4l6PGHrcpM8O4KefdU6TyXJBySVB8vLZGjI7Q==
X-Google-Smtp-Source: ABdhPJytOdff/w0bAttaJWRW5uWOemWMvKHa31a3cxQsk0bZ+BPxIRWDn+fJdy6QN7bH+7iqufTKVKEUYt3bAiwkgok=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr871324oth.77.1647543790201; Thu, 17 Mar
 2022 12:03:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 15:03:09 -0400
MIME-Version: 1.0
In-Reply-To: <20220316172814.v1.3.Iad21bd53f3ac14956b8dbbf3825fc7ab29abdf97@changeid>
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
 <20220316172814.v1.3.Iad21bd53f3ac14956b8dbbf3825fc7ab29abdf97@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Mar 2022 15:03:09 -0400
Message-ID: <CAE-0n50pk=5WNZ7XTo5bCs-_--MxP+JaiNrSMH7oiDjUUVTppA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sc7280: herobrine: disable some
 regulators by default
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2022-03-16 17:28:19)
> Not all herobrine boards have a world facing camera or a fingerprint
> sensor, disable the regulators that feed these devices by default and
> only enable them for the boards that use them.
>
> Similarly the audio configuration can vary between boards, not all
> boards have the regulator pp3300_codec, disable it by default.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

This seems complicated. Maybe we should introduce some sort of mixin dts
file for fingerprint and world facing camera and audio type so that
boards can pick and choose what they want. Either way, that can come
later when we get there.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
