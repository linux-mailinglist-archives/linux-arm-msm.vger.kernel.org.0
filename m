Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76E8D4CC87B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236717AbiCCWG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235784AbiCCWG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:06:27 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061CF1680A2
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:05:41 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id j2so6139502oie.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PKohUg2qG/pCEPlXibG2AgUnEJqrXhfRLiwdaT8RtZw=;
        b=D7YSxbf9YXlA/4GXf6hdHT3HLvlA58JNPLh26N+ob5BKmSnH4xtDfs1DKlG+a90Rv4
         ZO6EG+FZRdzqxbfeZimjrs6Kb+2JcEXIB0O+cBLy7GH5s4NOT7pSYnmyW3G8ySdnTQDh
         zZfjkPYBJYi+jjdSHrHTw0Oz/FOmDKscxJib4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PKohUg2qG/pCEPlXibG2AgUnEJqrXhfRLiwdaT8RtZw=;
        b=JRkJ0X6A08/pzm3w7SOMw/o4ODSYnR2PThzLyq98wBlA8ahl7vpbUK7GajN7tDMuF6
         ocAbMmlZaolzGmne4ZonfBu4bw3qUbnBGUlRyXiLDjIWpRza/XPdgxa6OAVFJsx14S+c
         zh7MFrZwnNkD2MaYw3pK4dVRJXN+kIE6mlSlOsMrE2H7mUOZotOfEmjpKBAQ/6wBbmbE
         Vm1BpAOf6sSUDv7YckHnlryATto95XkzDc7s5O3F6qVPemTGt5j4f2QZF9lTnMt4OG/7
         l9rVUk+GYSxhj1ZeeIrZNfkUMGT4QFWU7zPPSWH8LsIwgJ7xVg4OAy5UkYb3DajDecCX
         pDkw==
X-Gm-Message-State: AOAM532JGjPRgzeViJ1VOVZ4ATRqMC/aiqrrF2QdlJ4dBfeRaHY8DR1V
        42Zikdd1H31VtVvg6j2IywK4QODkMoFwVjRnmKarog==
X-Google-Smtp-Source: ABdhPJy47x1D2qJGCMALwvxUqjRjAF8d7zyb8QVQXnlC6qzKxDZbC7qJi/ar2Vw+nacHvEUEoLG1Gb9z04TrKcGKOvM=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6563793oiw.64.1646345140349; Thu, 03
 Mar 2022 14:05:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:05:39 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com> <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:05:39 -0800
Message-ID: <CAE-0n53FVc_JNN-gkXeaQjt810e7_nV6kCireqgPfPsE7rq4Bw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Polimera (2022-03-03 01:39:58)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
>
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)
>

This changelog goes below triple dash when they aren't intended for drm.

> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
