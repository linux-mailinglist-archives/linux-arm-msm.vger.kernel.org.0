Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E3B41C805
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 17:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345233AbhI2PNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 11:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345146AbhI2PNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 11:13:12 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F83BC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 08:11:31 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id h129so3598442iof.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i8yIlNe1wteWFB7lp9PoXm9bRdu16IElht81lO++2aM=;
        b=Y49oozr3mkIPyTvRc+zx4f6Oq3JfSFzuGoKqU5eJszrBT58SW2xZBdmA0vn8dzZgaX
         soKRG8eLnTsuy2M944uVoxGtEJpgZTHU1Jez+9TKBDP8+ILHfoWnOdQVpPC/wsCbv0Am
         KPJu/6jRnbTO3MEw5fq/wp6gUFSEmTvKBrQkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i8yIlNe1wteWFB7lp9PoXm9bRdu16IElht81lO++2aM=;
        b=gTQEJG4usOK5sCGJo1KAQoSDL6qUqP5j0AvQ7u1kNKnOhArdNExFFq1qt8XX0AXEc8
         0A2nCxVlDcpLoo9bfFh8/DPgI5l1szNlUoFHGSECBi4sjrQLgcbgJCV4spfmEtMuSlSa
         zrfLrLYYBoSeQuwipJeDWeriTGwSWZj7MKDCOjBX+9n/6sM7H+WL8UzmQN5FaZ57BaE5
         NgHHQWnd2aCHmiS56Yd6FwXJcNyn86LQ79BvPogN5Nh8OGlq/oVZLQ4uvuy9zF73n++t
         SWeudv+iuj+87R+EjYbWhYpwclZu9lLq+GagQvd1MiorTmc96CiHJDQ3QLDOxmyXzFG8
         J63Q==
X-Gm-Message-State: AOAM531gxfpnJhipVQUSx6WPe0J7uupEZFaXnlI8hPpb7beqhdY0fhmk
        ZLdEFwZg4XbgNMBcLwmvorgL2AvVTGk+zA==
X-Google-Smtp-Source: ABdhPJy452J1PfwGjDuJ0iWTK70NB0aH4DOYrY17lK6rzZJFf6CPRvsNzTnfb+87UgrBY0dgstiPFQ==
X-Received: by 2002:a05:6602:240d:: with SMTP id s13mr262414ioa.94.1632928290136;
        Wed, 29 Sep 2021 08:11:30 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id b83sm49013iof.5.2021.09.29.08.11.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 08:11:29 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id a11so3187282ilk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 08:11:28 -0700 (PDT)
X-Received: by 2002:a05:6e02:19cb:: with SMTP id r11mr151712ill.120.1632928288363;
 Wed, 29 Sep 2021 08:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <1632892123-11006-1-git-send-email-rajpat@codeaurora.org>
In-Reply-To: <1632892123-11006-1-git-send-email-rajpat@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Sep 2021 08:11:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHaf-EQ9Uonr=B6QYp+wXcdasmdu=v-bdwWniveN-Asw@mail.gmail.com>
Message-ID: <CAD=FV=XHaf-EQ9Uonr=B6QYp+wXcdasmdu=v-bdwWniveN-Asw@mail.gmail.com>
Subject: Re: [PATCH V1] arm64: dts: qcom: sc7280: Add 200MHz in qspi_opp_table
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 28, 2021 at 10:10 PM Rajesh Patil <rajpat@codeaurora.org> wrote:
>
> Add 200MHz OPP in qspi_opp_table
>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Looks fine to me, thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
