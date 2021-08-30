Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470BF3FBF3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 01:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239040AbhH3XD1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 19:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238936AbhH3XDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 19:03:21 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1015DC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 16:02:27 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 107-20020a9d0bf4000000b0051b8be1192fso10288693oth.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eWM4/3yTwD02gfJC9rFF7KdMYiNQBXaOsLgx6akWtD8=;
        b=PM1pNMQtWGrH46anjSbXZmaMSIzKWW6VD0gew5jdrK3kFfDUleakCbx5IVbIJtpEYa
         Oh2WMagW6w4u+oKA422fnZP3Su+eKmPeqyu/nEjhX0qewMS2UGVT87y/fgLyFFBp6t0D
         cTjAAYsEkR5GZ2oMR36LIt3oLM45RquoPiOqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eWM4/3yTwD02gfJC9rFF7KdMYiNQBXaOsLgx6akWtD8=;
        b=orQzNRw/qflTz4tXItD5RR8TWL+ZUVCfC52p2KfVObNExU5qwFJ5prqm9M370UOop4
         kafJBzkRbo4hLY34XgrwdMgvxj2v+btkTnMOnqe7m7A1BZNGjZGwx6KnnLr9472Y7O7U
         g2ofeM30k6g2FEmVOpqGXZ/CK4vWcwnF70ZbEngmewv5T9iQe/57ar/ZMouRrWg2kkaT
         ChXSBwadaHAg1WWoTu4KC2+Tt6U3WCe1ZdQyp+b4jTFCFdfltYYBufNOV9pIohXCOO6q
         eBw5RCQJduAGd+4LFX/Z8TTSZWcsYWIESXhQL6HI+/DwiLvnid1gD4HdcnCxj7te6v8q
         ah4A==
X-Gm-Message-State: AOAM5314qOWejBUwBIBtKmTy7YPXYSQ4FkT96W8TiFP5IYVQOfEUTBX6
        5kH2LUDBYNHwIf1AizBZacRvLcRWJjqlEj1fDklJLheFOQs=
X-Google-Smtp-Source: ABdhPJyyuZmtDRvRnkmfPxPxg0ZfrKKxpTrd0LDO62OHgk8HUhCwm2cmZKKyWMG7q9pTFPFaQCbn6/Fld+sjB6K1R4o=
X-Received: by 2002:a9d:123:: with SMTP id 32mr22341511otu.124.1630364546432;
 Mon, 30 Aug 2021 16:02:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Aug 2021 16:02:26 -0700
MIME-Version: 1.0
In-Reply-To: <1630323451-7160-3-git-send-email-deesin@codeaurora.org>
References: <1630323451-7160-1-git-send-email-deesin@codeaurora.org> <1630323451-7160-3-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 30 Aug 2021 16:02:26 -0700
Message-ID: <CAE-0n500=1tF2V8nTTfPH3P-wCm8xs-J+9pLK=xfeOc1p=PB5A@mail.gmail.com>
Subject: Re: [PATCH V7 2/2] soc: qcom: aoss: Add debugfs entry
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-30 04:37:31)
> Some user space clients may require to change power states of various
> parts of hardware. Add a debugfs node for qmp so messages can be sent
> to aoss from user space.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---

NAK. We don't want userspace to treat debugfs as an ABI. See
https://lore.kernel.org/r/CAE-0n52YXvTzvK4B3Aggg1fcRyjy=+HzNADP315-J0iJ8bMWUQ@mail.gmail.com
