Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C0E486F0E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 01:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344469AbiAGAtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 19:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343865AbiAGAtq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 19:49:46 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D885C061201
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 16:49:46 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id r16so1712920ile.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 16:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rJcSInqpfPU6bE6yiy9usTY1S88S5qox1awnErqC6mA=;
        b=J+sn/Rt5tV/i7W+5GNQyDfgnvURa3oaDBPDYDx6r16CTCV2ZnbDiyWKKFTVm8sM3uS
         iILM1H1DJUvw9MuRVWtDnRthXmEyF505xWjHMjbHwcoek2o1YXmCA9mzF0Z+GXKSWOYL
         t6rffkhd6DVbti1WN0s6crULf1f0kCww2JZDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rJcSInqpfPU6bE6yiy9usTY1S88S5qox1awnErqC6mA=;
        b=cy1NErQGk3LVAMNb8H4iG9IztZz7pu4M6/xkCOi85lO3i/LFjHrW4etybfHC2IT2j4
         zWzxElXMBuCWXYl0CNvuflFPsv/NbovTvhIQL6ce/aIJVViWYUmWtsiTdMonszT/Yl/G
         TBHiO4koNf+8x/miqr/PmwY1OkNCoP57MeqdS8AweciJIFWp5GgSnhaG4iLhSOoV1glz
         Zjg8w5QgAJZ6CNYMWRvuBJsi2r0IlSujhegKov2CCF9GXapFq4bc9OY8tDWGhguinBP6
         FP/FF8DYrlSSb/uoov+70TpTISmoCPG93400gUYyKAcvwjxgyKIjeLaTk8btH6J3Lz0M
         Md6w==
X-Gm-Message-State: AOAM531FtzW30Vo1ag8ayWRFYsuRjMWsC5uCmShXT3LSYOTD3lbSuVcq
        7WB0bKcCKfLrlYKP4vsiWR3c56EAJjPuIg==
X-Google-Smtp-Source: ABdhPJyAqih3rsdAILXbrQxyYdyCqqF2kEFJSAFc2/GqfcQmVDw8LMBo9Buevuu4Fg71ym6sGxx+kQ==
X-Received: by 2002:a92:db52:: with SMTP id w18mr30276175ilq.216.1641516585212;
        Thu, 06 Jan 2022 16:49:45 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id s20sm2040876iog.25.2022.01.06.16.49.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 16:49:44 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id d14so3445782ila.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 16:49:44 -0800 (PST)
X-Received: by 2002:a05:6e02:20e6:: with SMTP id q6mr29686099ilv.180.1641516584417;
 Thu, 06 Jan 2022 16:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20211216044529.733652-1-swboyd@chromium.org>
In-Reply-To: <20211216044529.733652-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 6 Jan 2022 16:49:32 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X4a5oRQSpg2fp-++EEpK_d0UfybJTdEq9DbpeWkd+3zQ@mail.gmail.com>
Message-ID: <CAD=FV=X4a5oRQSpg2fp-++EEpK_d0UfybJTdEq9DbpeWkd+3zQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: sc7180: Add board regulators for MIPI
 camera trogdor boards
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Dec 15, 2021 at 8:45 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some trogdor boards have on-board regulators for the MIPI camera
> components. Add nodes describing these regulators so boards with these
> supplies can consume them.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes from v1 (https://lore.kernel.org/r/20211215003639.386460-1-swboyd@chromium.org):
>  * Swapped order of regulators
>
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  16 +++
>  .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  16 +++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 122 ++++++++++++++++++
>  3 files changed, 154 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
