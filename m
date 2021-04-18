Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB35D363319
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 04:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237189AbhDRCC7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 22:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236815AbhDRCC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 22:02:59 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2152DC06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:02:32 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id q10so21807062pgj.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=6EOi5sET7q+6tX+yWu9fy29pnrjG4MRp6umPPzPq8io=;
        b=kQdHmo7fIHeibHQS2AiHL5WIEamrqHqoa5ga9rM6sBSydleBeM1dLI9GzuIbNwwk7e
         N1a9fJzZeV7DcggjCVDDgQlGVDWhApORdsaooAYTLf1SKT4IJo3pwIMJDhFIcBSNck11
         TPhC1CTjYTPWF5/yyniLiCg9i1b0a5kBZ20oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=6EOi5sET7q+6tX+yWu9fy29pnrjG4MRp6umPPzPq8io=;
        b=XUtRK7I6+7oJ5KggRb9Fwns1wMAQVyig3AsWYclbqE6VW4BeKlb6l4N4rU/OPcsyZG
         EVVUZ73ik16Gv5oo59psCJ7rQOEStmZKoos1bAN5EaBijhfXfgWwtKFJEMRq6+hQJQnX
         Tdxcg6DhmipbbOmlkg9yUfVexbsczBM7r+WxeGZbhPEfh9EiNkmsl9pQxf4/cZAD17LH
         cE/hinJrjGzvMOil+JTktCA2XyfZjT05qmCbdSKx/xUv57eF7kmkimtPrsA2jeuHcZqY
         7aLZD73fpStKD7AhV9O0k3FSwIcjxsoB13lK42xZbGbnFdufeIEmQYwCNwBlvWYuHIie
         /T8A==
X-Gm-Message-State: AOAM5311OI0E7c1I9wZgFmTzPkWjOKWbCY9ieElgK+95dIADnyEchpGt
        o4OFlQ3dOJJtK8Mq1ed/StM+xg==
X-Google-Smtp-Source: ABdhPJyWyBxeFPd6VFmIMy39I/7tDy2USGMAbTQjQx4SczppNkalB7KraRsr2ZRfH7mjwvEDDynFsw==
X-Received: by 2002:a63:f451:: with SMTP id p17mr5559622pgk.150.1618711351734;
        Sat, 17 Apr 2021 19:02:31 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id fw24sm10077679pjb.21.2021.04.17.19.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:02:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-9-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-9-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 08/12] arm64: dts: qcom: sdm845: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:02:29 -0700
Message-ID: <161871134996.46595.11931692864291913969@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:54)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SDM845 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
