Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A58C751DAAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 16:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241668AbiEFOmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 10:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442283AbiEFOmi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 10:42:38 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2C36A431
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 07:38:49 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id n24so7655272oie.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 07:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=cB9ZCuVuahLmpF6pofX3h+no54YYEypOmQHJlUOz5K8=;
        b=GL8hyS2FGDXBjm+SHhoR461YRKq7ho9wpxyLIDmYxlg/kzeg9Fv3zv46XR1ANz3sqk
         9aVF+pDJV8sESH1nCmmbvOnl5DnpGQBmDxuXbHR4Ck6iFkkSfmG8HlhF9pDgX1W46oCC
         UkHNYX6AYriqe85qlmGIovPgsPOKrg4+rkAbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=cB9ZCuVuahLmpF6pofX3h+no54YYEypOmQHJlUOz5K8=;
        b=dwqPrg7CLLXE40ImtoOkGjPQq9PfQfRfDbidkWdeCSheReJdZ8JJsPxhDKHAXHoLTH
         k3bgacnOobHutjAA6wIvpFSaJVTzrowZizpIDP21KsqXgYwihdD5H1EFphIT1oXSMW4b
         4ls/l6kw9LvooaWn5RJ8jJVQ3WQvF1dFNxDbfc9GjTA0cZWGOPvkTqqPpnbBpCfi54wq
         dxg1+tO1wbBNeFBzOVXnHK/iDs/3cvOeQBCZLwJuhNezAL9GI7bTTbiiu8iI1OxHz48J
         lN2gAEv4sO/NQyJ1auGfqkIrZ7BHY7XO/hLJW6cgCxQig8kqwPIZCOfkepVi3yRC4eSk
         mDiA==
X-Gm-Message-State: AOAM5313mZpz2oz6K3JEi0w6yOzjE+yrJAE8bG0wzDb1S3zAGNgvHEtz
        CBYVkWNm4378WEMLAqbVOHnLNVpx8bIKMJA4j0pXUQ==
X-Google-Smtp-Source: ABdhPJz76yFzp2gDcKwnVNH1wIr3RsCoOICVyiedCXHmMDJuQW2+wl9pA4RkmCSmIZxUvWt6tqB+SfcHp56U/IJY7No=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr1613561oif.63.1651847929242; Fri, 06
 May 2022 07:38:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 10:38:48 -0400
MIME-Version: 1.0
In-Reply-To: <1651742739-12338-5-git-send-email-quic_c_skakit@quicinc.com>
References: <1651742739-12338-1-git-send-email-quic_c_skakit@quicinc.com> <1651742739-12338-5-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 May 2022 10:38:48 -0400
Message-ID: <CAE-0n51i9+JPMR91EzXtCXQdL__TWanWwJ3Y4H=ip-POb=a=vw@mail.gmail.com>
Subject: Re: [PATCH V11 4/9] mfd: pm8008: Add reset-gpios
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-05-05 02:25:34)
> Add the reset-gpio toggling in the pm8008_probe() to bring
> pm8008 chip out of reset instead of doing it in DT node using
> "output-high" property.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
