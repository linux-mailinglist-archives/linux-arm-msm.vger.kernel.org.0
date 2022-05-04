Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA2551A556
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 18:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352995AbiEDQZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 12:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238152AbiEDQZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 12:25:50 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C0D369CE
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 09:22:13 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e9027efe6aso1657150fac.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QmilVLs7shRy11j7rzed/0OI3W8rRjrF4NUvuI5TW7Y=;
        b=I2Z1uyTSFgbIs7dDPMYfZtThOeL99v+lk2RWkbxe2YxCc2f6tbVq1mCMJB5vF7WHXu
         c5oEgN/Crke1yktphbSZN0pnieBc3TJrJJzsXWIluzQovY/Mco7o9sp+Vk43dYshZGHv
         UK4HD+TLdnGh13vumFVFiq7Za4UVyA2/kWcAiG2iStaHcuyX77sC4simIfSkFr7kXGgM
         i1UJEM7XrRCiO+H/ce+y8kLMtyp8VTPEp1tDphVFuU6wBS5viAmbAiYcVSexf1RE4KOh
         KOY4pCt6ilbh0ikZpBdsIcxiK5Wz93bcYiKaVvZ04Kl8/o6RRgxf1/q5lymQ0okZd/NU
         ZH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QmilVLs7shRy11j7rzed/0OI3W8rRjrF4NUvuI5TW7Y=;
        b=kd4pKrsd4NDGWGmozdRcPDCgfPdYGo9BAIdj2ze1wl6QPQEMxzGTLTSCMCCizxifQZ
         3DMBNjCdrzdzHsSJ/sJ7bcLGA+f2pAWS2bDzFuBg8QleNnmv+GsPEZIKk8xyibIzFvR9
         4UGO0mdp7SxKv+nU1CoaozhlQK+EJj/44m19zZK57VRBvMqeofkvoDNgmi0wv84TI4pw
         xUr6i3WmgGNNqBJ6FqP5Pd/9Bh4sEui+/wFDhaucpaSqZMCGaZ0AmYbLqmLuC9EzlV8g
         5aQ6GqmQpkGcGNU89YgC+thoVBXGE1N6uCnn4647ebEpMktv/8nmTICtiw6TZgD56jVA
         afTg==
X-Gm-Message-State: AOAM532EyX/Zzu/SgMgMduu9/WURnbAYKFxqPztJyTtVyAbng8KYxuW6
        Ph2n5CWT6xnkMQ6yQoaEMAoRIA==
X-Google-Smtp-Source: ABdhPJyw8fdPyxfPtPFrptz6bFFUOaUxzQnYjrbmvhmNyVIEVriAllRJELoo7ijvXDYYfA7OzXwaKw==
X-Received: by 2002:a05:6870:a7a0:b0:ed:e8f2:fe1c with SMTP id x32-20020a056870a7a000b000ede8f2fe1cmr128691oao.192.1651681333370;
        Wed, 04 May 2022 09:22:13 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v3-20020acade03000000b003263cf0f282sm1440619oig.26.2022.05.04.09.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:22:12 -0700 (PDT)
Date:   Wed, 4 May 2022 09:23:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V4 0/4] Add PM8350C PMIC PWM support for backlight
Message-ID: <YnKonEp3/+9QZmRa@ripper>
References: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com>
 <CAD=FV=U9XfOancqNOGCWKEkP2jD4CHw6NHY8mdALG7D-7OLMTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=U9XfOancqNOGCWKEkP2jD4CHw6NHY8mdALG7D-7OLMTw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 May 06:45 PDT 2022, Doug Anderson wrote:

> Pavel,
> 
> On Mon, Feb 21, 2022 at 9:55 PM Satya Priya <quic_c_skakit@quicinc.com> wrote:
> >
> > This series depends on [1], which adds driver for Qualcomm LPG.
> >
> > [1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=615848
> >
> > Satya Priya (4):
> >   dt-bindings: leds: Add pm8350c pmic support
> >   leds: Add pm8350c support to Qualcomm LPG driver
> >   arm64: dts: qcom: pm8350c: Add pwm support
> >   arm64: dts: qcom: Enable pm8350c pwm for sc7280-idp2
> 
> I see Bjorn's patch in your tree. Thanks!
> 
> ...could you add patch #1 and #2 from this series too? They are both
> small and ready to go.
> 

To add to that, now that the binding has been accepted I will pick the
two dts patches (patch 3 and 4) through the Qualcomm tree.

So Pavel, please pick up the first two through your tree.

Regards,
Bjorn
