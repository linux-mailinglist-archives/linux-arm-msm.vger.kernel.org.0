Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F9F528D89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 20:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345216AbiEPS4k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 14:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345208AbiEPS4h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 14:56:37 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC95610FDF
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 11:56:35 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id z15-20020a9d65cf000000b00605f064482cso10679156oth.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=MJx3UmouNiWNfqqDYIOXDPwtYD13RhsMbDA6eXvF/Sw=;
        b=gC6y+jKfV/qj1AmBnZ0KeN/8oQPBeF/cIWz93DRzjsfOf05ZsxroN7urSre4hLmM+m
         E7iQvgJYIVhZ44wg+GSt5fEC6xzfb3wQNbpYqkC5FT4OjpardXbuqt0QagsXt2msNd9U
         gwoWARsqNYkWrUQqPZnJ5lHKag902yPhLHy1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=MJx3UmouNiWNfqqDYIOXDPwtYD13RhsMbDA6eXvF/Sw=;
        b=JnEb88N3sUGo6jP+sBkZNJLJfo/cIQ5+8Y+CMVOyWwTF1i+s8aHeA2vKYc6/g7knqO
         1CP8MjOKjCMUtUx93rp7qGntjHSwsHJZNEf5K5Ir+8iiexEja4a53YtyOi2jUlm1vEfH
         rnGgwDrWiWlWcjdHc+VcFsTKMXadwYl8ujnaoOvAqyeWBfG/aFgSjV8HSzegqztMtlHS
         8CGDBZfynwIxm4mV0P5VKZEU64rcocT3x8Px1drZrfEBrQmQxej1tSZnqPwKAop2cAvR
         ufkZcCByShvz1Lh7/3yAIIRr6U9Q1SxlR7149O4O+MNJPi+Yg7ZGzBE5q5gUHcGFzRS3
         X/pQ==
X-Gm-Message-State: AOAM531v3r2ZbI166kLHOIS1bKdJejXHbOyyyygjVtuFC65ZvFf4h/92
        7vVBtvMxxD7rl8L1+COpk219Mul2UJ6hF37u8EZJcw==
X-Google-Smtp-Source: ABdhPJxW2uQNcDHTxeJaPy9aURBWojLRwuduj2z6Yw/04X8J1t4LFTEC6Ac0cOZHWux42qZgWJxITqgvegNN26EH6JA=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr6668728otl.77.1652727395199; Mon, 16
 May 2022 11:56:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 May 2022 11:56:34 -0700
MIME-Version: 1.0
In-Reply-To: <1652275113-10277-7-git-send-email-quic_c_skakit@quicinc.com>
References: <1652275113-10277-1-git-send-email-quic_c_skakit@quicinc.com> <1652275113-10277-7-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 16 May 2022 11:56:34 -0700
Message-ID: <CAE-0n500ceOR0Fr6=DR9D=hXuDjtyNNVnP3J_B2RMLY5TGCUbg@mail.gmail.com>
Subject: Re: [PATCH V12 6/9] mfd: pm8008: Use i2c_new_dummy_device() API
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-05-11 06:18:30)
> Use i2c_new_dummy_device() to register pm8008-regulator
> client present at a different address space, instead of
> defining a separate DT node. This avoids calling the probe
> twice for the same chip, once for each client pm8008-infra
> and pm8008-regulator.
>
> As a part of this define pm8008_regmap_init() to do regmap
> init for both the clients and define pm8008_get_regmap() to
> pass the regmap to the regulator driver.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
