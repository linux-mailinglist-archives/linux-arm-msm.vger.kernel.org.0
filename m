Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 648C8529C86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243207AbiEQIbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 04:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbiEQIbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 04:31:37 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EA941312
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 01:31:36 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id q10so21475278oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=86ceeyNCi3z2FwBWcA32g1IsuLILJjbHc1Dja5XPTPg=;
        b=DeF8B3N1r7sbp73Uqvz9RVfBGJg3Yp9qsMawQ9YscwVZ7L3DN8xVOnwYNlWQnRHvvw
         Zv+BQI27nKd++MeBOqgZD6Gd41CcI6n3UhpX568sVY3Vo7S+9V1/pWkEnDYHHdqLGmAa
         BWSXsrl273+VFNHtNz69HrRavobjUDuxw78bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=86ceeyNCi3z2FwBWcA32g1IsuLILJjbHc1Dja5XPTPg=;
        b=0WrW76Hi1S5CsCZCI2QOMW8HLwkBGL/RKd/0EwoY/gVwMTuj9SHySG0eafpcJsil/A
         bEeIdS4Y4MTwi+bFXxdQ3K9BTXpyWBunBkgZQRo7svDYAyN7kPJSt4p8DyoXl6BaW4hl
         pumTa0NWBzbG2eLP8gjbUElDiUe+A6hictu9bAPJTC/lOZcl/vg5F4H2WRluJVLGFL8H
         W5YOhBn63p7EyZPqojbo7r6W1U/W2XUpGddEYKOjfVKyFiBPyvlqD6i0gUc3RCkjwDOq
         0T35+5X0wj1d6FnkSDHcIHLRIwjkqTx9vrbcJRl1FM1DrhqDiLaqhWiLqQPtFtfoLTtL
         /SKg==
X-Gm-Message-State: AOAM531MTbsxHFmmishkG3mO+A38S4eIpRGxWSySaWSAaLVS2K5eUOd9
        aln2aCq6x/tUDbUT5klzK6aWKAFhSjqIOGBR9obqhw==
X-Google-Smtp-Source: ABdhPJyKjOJ1T6NtgPT1vvc1ORb9DXABYVvQ52Fb901/W4PDoTyrZMHh5Olt67M2hQleCSfA8WDFQSEcDFb0dU/afwA=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr9705690oiw.193.1652776295739; Tue, 17
 May 2022 01:31:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 May 2022 01:31:35 -0700
MIME-Version: 1.0
In-Reply-To: <e74aacdf-3ff7-261d-997f-5b6566b66207@quicinc.com>
References: <20220503113246.13857-1-quic_tdas@quicinc.com> <CAE-0n53QZn8VYB-dxzwccYDURU-0qW3ZwsuOEECwrKGAhYzwgw@mail.gmail.com>
 <e74aacdf-3ff7-261d-997f-5b6566b66207@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 17 May 2022 01:31:35 -0700
Message-ID: <CAE-0n50auThk=yzzVMvc2bu7g47gBzv4pw1K+dqshRRpA5969w@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio
 clock controllers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2022-05-03 22:35:29)
> Hello Stephen,
>
> On 5/4/2022 12:40 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2022-05-03 04:32:46)
> >> Add the low pass audio clock controller device nodes. Keep the lpasscc
> >> clock node disabled and enabled for lpass pil based devices.
> >
> > Does it mean that we're going to have overlapping reg ranges between
> > nodes in DT for clk controllers? That is not proper DT style, indicating
> > that we should combine the overlapping nodes and then have some
> > compatible or DT property telling us how to treat the clks in the audio
> > subsystem.
> >
>
> In the case where PIL based LPASS node would be used, we would disable
> the other lpass clock controller nodes. Does that seem fine or I would
> need to map the complete range in the current PIL driver if that works.
>

Is the idea that we would have a set of nodes that have overlapping reg
ranges but only one or the other would be enabled? That seems confusing.
Why don't we simply have one node that has a different compatible string
or some DT property that reflects the programming model of choice? Or
use the protected-clocks property to list out the clks that we don't
want to have registered on the system.

We shouldn't need to have two entirely different nodes for the same
physical device in the SoC, so talking about PIL based LPASS is
confusing. Can you explain further?
