Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A44823CFAD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 21:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgHER36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 13:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728338AbgHER2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 13:28:15 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D613C061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 10:28:11 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x6so9647925pgx.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 10:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+NwscihkyAu/FXhdjfSfqJQ0G8XORbep4M6yL43omkw=;
        b=AzpDX/pdttML8hpGnV7CYgVj7jzy9iJBwHCagRD5VIJLhBOLYpn/NezzEuxNPYyCx8
         73ZKBGCorW3UK7rCTphBUubMD6bglVj+kOrX7Q3cYB1YBrNrj05mgMUC/AF9qvcTXjk7
         xREJjWX1463a4osBUjJ8sX8BsGAEdx0lMxzFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+NwscihkyAu/FXhdjfSfqJQ0G8XORbep4M6yL43omkw=;
        b=WsmrSxGcxOxitQ7tBQ4k/Xq5DDqo3QpA/ac+vT/SGnLB7cbKaL0d44XhyIRBp4NQSU
         v9DrX92VgF1MkeB6hMP48nHGRv3WaDd1LP2nyLODETa6Vo9t+e9/S29Uzuq+gH/ZmTzE
         TtsOVDgqYArTsOHcQx3x9WTAUhZ107J9575w3W1dd9FQj19YE5smtfOMO0CKSn27CZ02
         F88YdKfVaLZUVXD6pyYY9VPtXCt8B7RwOtzR9pAcHzX7NVV1wfOvsUerqBxqQuAPUwAl
         OSMPG85YCFllRg57+Chw058kIFReTi25HyMupdMSjts/46ikeE4yXxJ7580NLqDxDY6a
         2XPA==
X-Gm-Message-State: AOAM533aYHlMmmtX0mJM3ll9gjLenvJk8eOuQxFh37cCbs9kiPxuePRy
        OS0g0aTJWUWBKn9JzqAlYMAFVA==
X-Google-Smtp-Source: ABdhPJx4G2QAgYi+0Fmqhi3sFod+CAkH5QH51SVLdpljhnVuosdpblgA0K7YEkZI9Nc/bAtLjfuHTQ==
X-Received: by 2002:aa7:8d95:: with SMTP id i21mr4118213pfr.240.1596648491136;
        Wed, 05 Aug 2020 10:28:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id y10sm4270672pfp.130.2020.08.05.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:28:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200805091141.2.If847565ed7568448c67804f3735d5f8a61eda560@changeid>
References: <20200805091141.1.I86b3faaecb0d82997b599b1300f879606c71e116@changeid> <20200805091141.2.If847565ed7568448c67804f3735d5f8a61eda560@changeid>
Subject: Re: [PATCH 2/2] soc: qcom: aoss: qmp_send() can't handle interruptions so stop pretending
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Alex Elder <elder@linaro.org>, mka@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 05 Aug 2020 10:28:09 -0700
Message-ID: <159664848938.1360974.193633020977562116@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-08-05 09:16:11)
> The function qmp_send() called wait_event_interruptible_timeout() to
> wait for its interrupt.  However, this function did not check for
> -ERESTARTSYS and assumed that any non-zero return value meant that the
> event happened.
>=20
> While we could try to figure out how to handle interruptions by
> figuring out how to cancel and/or undo our transfer in a race-free way
> and then communicating this status back to all of our callers, that
> seems like a whole lot of complexity.  As I understand it the transfer
> should happen rather quickly and if we're really hitting the 1 second
> timeout we're in deep doggy doodoo anyway.  Let's just use the
> non-interruptible version of the function and call it good enough.
>=20
> Found by code inspection.  No known test cases expose the problem
> described here.
>=20
> Fixes: 2209481409b7 ("soc: qcom: Add AOSS QMP driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

I would put this first in the series as it's an obvious bug fix.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
