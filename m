Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC7B1C17F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 16:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgEAOj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 10:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728929AbgEAOjZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 10:39:25 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EDDC061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2020 07:39:24 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id u203so2720564vkb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=URjoa0IPAuVJrJzf1GzsjjCJgtImSI4fVU++g+IJyuo=;
        b=SMxlHq5r/xlgb1aFLRF6VaIP1+SWFfbYQhAXjYZD4COiPW8KJ+YqJlOeUxHxCY5DlG
         Idx1WYR1HxdMRSDeEA2FIMDrtrlxs+zIzz57nuJsVPdb23kkRR6vDORPdekV6cr8T2ey
         XFPCDrZn+jfp9p8SrvmZa/jauPbMy65QXIIZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=URjoa0IPAuVJrJzf1GzsjjCJgtImSI4fVU++g+IJyuo=;
        b=pFFSIMdf8+TvExi2L42QMk3eWYnAM1oXu4u1FlvfJgsp1fxEwyUl68RCqYYOjHVQ9o
         pVQVirblm13Qn7TqCb9arrfzrygqIKrww134zzgGdYVaYU6ma5XdAn1KI/ShAF36FJJw
         0capCbfU0oRLPatsOkQxVh6CYFuchL/8jLhKiZsf1KQW1YF8rDQO/lDgepHVLF2JvUnS
         TLk4Bm/0V5joPi/Q8HPdK5hNNkOl6Ep5T7VcdlQ/AmPPgq4VHvwluStHJXxuvszDNf53
         L9r2mqhzqPrG++YycX1pfPrziHo6hzuJhHad26VNtiDFcWtWexvS5jjXB8HJ9yOunVCJ
         dd9g==
X-Gm-Message-State: AGi0Pubz1lqrjRgIZZZKRfvo///4CT0jLw3KeQQvNOWn4Lim5rv/NGYY
        rrAyTS1xTogbrGBJIo960nV74lDpQms=
X-Google-Smtp-Source: APiQypK4SQj+BSN7c2KHzulebYSPFYnjzZN9joAXLpDHfrCaeIVclA5cBTezjr84/VEDPHdF5oDUGw==
X-Received: by 2002:a1f:a94e:: with SMTP id s75mr2880280vke.70.1588343963963;
        Fri, 01 May 2020 07:39:23 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id v23sm802273vsa.6.2020.05.01.07.39.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 07:39:23 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id a5so6386649vsm.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2020 07:39:23 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr3484487vsq.109.1588343962687;
 Fri, 01 May 2020 07:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 1 May 2020 07:39:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+uaPTZHKXq6WYgx-ZDL1QTedEpNw9T747UBD_g1O8CQ@mail.gmail.com>
Message-ID: <CAD=FV=W+uaPTZHKXq6WYgx-ZDL1QTedEpNw9T747UBD_g1O8CQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
> * Remove GCC_DDRSS_GPU_AXI_CLK clock reference from gpu smmu node.
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)

This is the newer version of the patch:

https://lore.kernel.org/r/1581320465-15854-2-git-send-email-smasetty@codeaurora.org

The change to remove the extra IOMMU clock matches our discussions and
there's no longer anything blocking this from landing.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
