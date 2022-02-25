Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1654C4D40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 19:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbiBYSGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 13:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbiBYSGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 13:06:48 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB431E6E82
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 10:06:16 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id u47-20020a4a9732000000b00316d0257de0so7310047ooi.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 10:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=I6MkJlQQ4hU61fN5YrqAtX/5cqN/fcZrZGOgyZvO0uI=;
        b=OX3tyht/4LSsOvRcTrgfeXkyb76HiSQ7W8pI7J/RTBbroR/+j4T5kvlW2WmKmUzG/H
         xu2NViAASbIERVgMW/VanajirDvxVwf0ERZWB7p3LhGVPmT1IPo1TuayrNHhrLPZUOdz
         XJcFu2aCb6m5c3GwxNFlRaO8UGW/64pJTguBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=I6MkJlQQ4hU61fN5YrqAtX/5cqN/fcZrZGOgyZvO0uI=;
        b=MYM2UoB7l/qd2tkRRt7sbUCIghR9e7XX6LrfCgROCPAbhsOWZFjiaoMcFOKB2tARYb
         6U3lCEisO2fDe7uzQTGMblLICGqSxJfHtDkWg51NgvQ+wwa5t83BbNO4tKviyfZc+Xg3
         KwzCSBtSoRkTlmjpQTUUJa8ENL0GOP1p4JqZb4vHSeRcTZJD62UOQmRhL/D5icfQ2sBp
         qnRyqaIr2JbBr6tNOARCtAsy+Q698zCMtGGHLZE4AEo3A9YZRhJpsolu3Zmq6lsEGlu8
         BkScvhQ4TLc3vkDqUZhfi1N246QbSc9aAkdDzAGN7BOsrKTbdQZFoaCKYyQevtIf3B/J
         4bWw==
X-Gm-Message-State: AOAM532GS+TF9qdgRYMxwPLgHKJHaG1iEQCgDkbXRmlvo+oH5LK2xCYx
        6O16RGK9ka5ykB/cqIZeW7zfePTwtvZfn0oNQ2d9dA==
X-Google-Smtp-Source: ABdhPJwRntMGqiM80NVcK8YfATn8ptbQGr+zoLTrJsgW0P2rhsjH5L4rwRJB1IJxViwSIqXbAU1GJUTof7bUMNm0RH8=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr2012649oap.54.1645812375839; Fri, 25
 Feb 2022 10:06:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 10:06:15 -0800
MIME-Version: 1.0
In-Reply-To: <1645804670-21898-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1645804670-21898-1-git-send-email-quic_vpolimer@quicinc.com> <1645804670-21898-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Feb 2022 10:06:15 -0800
Message-ID: <CAE-0n52OPUEMO4iXP_6LuRcN5r+v-9oZoRwij_y+bwnUBC3ohw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Polimera (2022-02-25 07:57:49)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> drop the assigned clock rate property and set it
> during resume sequence with max value in the opp table.
>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")
>

There shouldn't be a newline here. The fixes tag should be directly
attached to the SoB area.

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------

Can you also update sc7180.dtsi? Are there others SoCs that need an
update because they're using an OPP table?

Doesn't this need to come after the driver change?
