Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA0CF4CC965
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbiCCWra (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbiCCWra (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:47:30 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B7C16DAE7
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:46:44 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id p12-20020a05683019cc00b005af1442c9e9so5875802otp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lAmfMh3siUWAbgiKtdrl2arKgopAvWxLPSUY8pwP5vo=;
        b=HJhZCrhxO1Pyzl6t9wzDXnMPLJxc3cVtgvpSg8wZBkv23iDjLvHwLafhXztd8HFsmH
         MwzIOrj2PTcTDGurmzZolflvediekuyuBXl79QFwBlJmkEwv/P7RcX1HKtj3/1CNso9X
         YzK6BZNXHtfmv8lFtHrCzOGQ+MZsx4+erym4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lAmfMh3siUWAbgiKtdrl2arKgopAvWxLPSUY8pwP5vo=;
        b=4kZ7rf/938sL2lE9FwpQTCCYbgM6P2p4ZPC5nIF4Ht/siStBnZ6YbInAeuEIt4+R19
         NrxOCpEvUc5a1K5IaNWcZodhwHKkOMsUKxI65MHwKnGDKatKGAWbno3S7doCilJPKPeh
         bY+AU2WII43vgTF9YxHGmF6pp5lHt77iScgTuluo07bg6RnB8HnUKKKrD86KW+t6CCeQ
         zGSmEj5VglcAOdKhpirGyCRRtIxu16lu3YFNRYxFl8xZoSQ+ZolXVyEJ03v88GJ//5Ef
         9c3typ+PD/oBMgyw4MpgknvxKmhCo35MVocvNnhZbXepU5mmFgmAD9dKDlUB6ANJYZa5
         3UOg==
X-Gm-Message-State: AOAM530Zn/tMs0gwUrgNF6MitOPhb2I3B/HAuNsY71+gkTpzAHYAcNlS
        CZDowk33H0GOKchDOzk8FnP1ZMdq52GO9JnKkbVz2xqGMf8=
X-Google-Smtp-Source: ABdhPJyNXFY30iI47VZgSxdtBNCRROM2D9HdHXLCfN3psV7sKNSNt6F40TbtroAvxxc4HUpyiSwvWzkxOd2O9Ee80u8=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr20092863ota.159.1646347603888; Thu, 03
 Mar 2022 14:46:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:46:43 -0800
MIME-Version: 1.0
In-Reply-To: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:46:43 -0800
Message-ID: <CAE-0n53-9+t4ruY9hykzZmP4LXZzvQLjRWRtmY=Ksm-BVaT78w@mail.gmail.com>
Subject: Re: [PATCH 00/12] Add writeback block support for DPU
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, markyacoub@chromium.org,
        quic_jesszhan@quicinc.com
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

Quoting Abhinav Kumar (2022-02-04 13:17:13)
> This series adds support for writeback block on DPU. Writeback
> block is extremely useful to validate boards having no physical displays
> in addition to many other use-cases where we want to get the output
> of the display pipeline to examine whether issue is with the display
> pipeline or with the panel.

Is this series going to be resent?
