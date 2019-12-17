Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D15121F40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 01:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbfLQAI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 19:08:57 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:38448 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbfLQAIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 19:08:54 -0500
Received: by mail-il1-f195.google.com with SMTP id f5so6919772ilq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 16:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bb2twKZDh29ThWZYRQTRqA2Jiy4KqbokvVGsd8dKMgg=;
        b=aCtNPlB9aPaMY4cJwRiZed5kiziibm2paiUxxBllsBG7zjS6p8M6aAmbMTh6fpnHhT
         EehB7lZS3uU6T0O9471kbfDFgCM9P35lzdv2mq3W7Lz7j4mzTmWHVC+9WXxAuppWfFfD
         RGHl9tuFssxZ7il/MtuEvgtjLOmQGhJN7CSfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bb2twKZDh29ThWZYRQTRqA2Jiy4KqbokvVGsd8dKMgg=;
        b=HJuv+qqC6n3EFU16dRBsaTj/L+x4ieWRPxyBjopMafwNsAWZK0tKvG3Zh1LBoh7Jh4
         6u0psg/1QgNQf8hxpGNrUcl/fhbK8ZtzGOO7hivxDYCFv0M+FRChGw3UOt5ckS4+11uM
         UGhnz6gQEAb5bc8WFRzKoMpCJzagfQ6khRoS08z1ni+wKs4/F7krMBuw7TVCSBiiAHEG
         0L1S9PADCuxZZU7FfhfgD6u8BC9a77CrWC/WpS4sVTs4rf1MVNpjgoQtx2tBfx2o7KPP
         4LGyfb7wb47woyJVq9xzQ6Ldx6rckARIuh3u8x7/QMTcfZCJLBi+ikGVGDpg2wixVkU5
         /w2Q==
X-Gm-Message-State: APjAAAU2fjEVsL7Zpz+KkP/r4Oc1+u3xfjO/hH4z6c7SXdXTNzMaAPQG
        OQBQzHn/o6rz+s5Z7GH0oBXGjzo1yu8=
X-Google-Smtp-Source: APXvYqxW+RqljzyIg/oy4J05w8RQCMYFKeoipsG9R9//0LqtydyPt3LcfPRl6RcutA3s+yrn2WkPGw==
X-Received: by 2002:a92:17d0:: with SMTP id 77mr6744701ilx.27.1576541333632;
        Mon, 16 Dec 2019 16:08:53 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id h3sm2276710ilh.6.2019.12.16.16.08.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 16:08:53 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id t17so6884261ilm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 16:08:53 -0800 (PST)
X-Received: by 2002:a92:da44:: with SMTP id p4mr3406926ilq.168.1576541332664;
 Mon, 16 Dec 2019 16:08:52 -0800 (PST)
MIME-Version: 1.0
References: <20191216234204.190769-1-swboyd@chromium.org>
In-Reply-To: <20191216234204.190769-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Dec 2019 16:08:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VrnMNS6EnGC5DQcPh2GBW+9_h_oqW3pOqqm5DXSkXp6w@mail.gmail.com>
Message-ID: <CAD=FV=VrnMNS6EnGC5DQcPh2GBW+9_h_oqW3pOqqm5DXSkXp6w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-cheza: Add cr50 spi node
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Dec 16, 2019 at 3:42 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add the cr50 device to the spi controller it is attached to. This
> enables /dev/tpm0 and some login things on Cheza.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes from v1:
>
>  - Fixed node name to be tpm
>
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
