Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F25D1DD2F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 18:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729885AbgEUQTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 12:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgEUQTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 12:19:41 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82978C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:19:41 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x27so4773586lfg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIZDqXyVoJ9gXghdJYiCEKQMjkIgQruodsIsQe4U9dY=;
        b=BrekDs2JD+FzZFLruCXCuGD0Mu8sx1xv/IFDqsRUwkYc08YCvYiQjgly85qxl4NA0G
         WHHro40yVkTqswRWpJkzs5MEqP4KFXZx2rEVgsu0xe3SmhztFADeO7Z94hysY6t4LD8A
         AoUpMnF2V3N3NLAFUDiIthmFJc+18kTPTwZ48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIZDqXyVoJ9gXghdJYiCEKQMjkIgQruodsIsQe4U9dY=;
        b=AwwGVIanqmpj9vGulZC+6VpmNwZQC/Xq1Jc128hPxag8ZowdjL67dxChZhLgbpO0/o
         0V8tQd5ng6NgmgiPkT5DZk7+SD6cbNDkHpx2x/OKQzU2k2c+D+CKyNdHyjRPtYnt2hpk
         nMxbeWvUAmrIExhSUY1BgpOroL82p4lNlOdbhSBYHGEAt47trJTMyfB47u4gMzlHfKHh
         4RmtDowqG5OEDeeGWcuEZcZM6+vrDJLGkdB0tth23P2I9HpBpmYy1af30Lt2C46dwyLa
         f7Fc8nyenYmdYCIhMRbXsVYgzUGfjIs2qczoSLy7hEZFeKLHR2HMEW48bP0CoKtk6Tp5
         u+Bg==
X-Gm-Message-State: AOAM530w0ZYAwF3CXFllhGv9u0z9MHK2QJxFFoqDkuD0X+OGdTU4b6aT
        KwvTw1FztIwLirz3xZfjGUPsEstEuEc=
X-Google-Smtp-Source: ABdhPJzFMi+utf8Rrd5rTrtQUXPpx56gXG+R0hv15Y0VTEZroL5S87CRCcxLR1uoe+xpAJ6S+g9k5Q==
X-Received: by 2002:ac2:4887:: with SMTP id x7mr5301485lfc.23.1590077979344;
        Thu, 21 May 2020 09:19:39 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id w15sm767411ljj.57.2020.05.21.09.19.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 09:19:38 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id c21so4794809lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:19:38 -0700 (PDT)
X-Received: by 2002:ac2:4114:: with SMTP id b20mr510711lfi.34.1590077977634;
 Thu, 21 May 2020 09:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200521010337.229177-1-swboyd@chromium.org>
In-Reply-To: <20200521010337.229177-1-swboyd@chromium.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 21 May 2020 09:19:00 -0700
X-Gmail-Original-Message-ID: <CAE=gft7p8E+6JB4Ukrt2wDXeWeuoUik4ovmikYvHDhTP+s=HGg@mail.gmail.com>
Message-ID: <CAE=gft7p8E+6JB4Ukrt2wDXeWeuoUik4ovmikYvHDhTP+s=HGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Move mss node to the right place
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 20, 2020 at 6:03 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The modem node has an address of 4080000 and thus should come after tlmm
> and before gpu. Move the node to the right place to maintainer proper
> address sort order.
>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Fixes: e14a15eba89a ("arm64: dts: qcom: sc7180: Add Q6V5 MSS node")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Thanks for the cleanup.

Reviewed-by: Evan Green <evgreen@chromium.org>
