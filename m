Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EC0465759
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 21:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353332AbhLAUuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 15:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353267AbhLAUsH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 15:48:07 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFF5C061398
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 12:44:12 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so36984504otl.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 12:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=vSYbfez9sMrWNW9h3VuOAA21Ecw2U6/iY7XbNqz02Nk=;
        b=T6Bfw0WHodAjJ4sJoSiQCgAo/kLrJlrN6GWUKaGtYt4+5k5Olk0VzgU+NqTlym0Vez
         vrGteX71CDNCP5XPjBy762sPp8mZbTEfFnetngYB8ls0GEOZ9rd/CbyjnZ9kMTRWe+DX
         lmdyazfWm2HrXk3exsxNm3ByahD/2pRM4zAIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=vSYbfez9sMrWNW9h3VuOAA21Ecw2U6/iY7XbNqz02Nk=;
        b=gLoFSftZUn//oBiyNFbMjodwZijemOxkMCXpBueBQnabR/LHnJbIamNRO17dsualpP
         4iEoJW9xbElyAwfliXpdn82+URbyROnA/yYS845MCiNVMkjJsr5Idsw7DoIcFZLWC/8k
         h9faLkZh1nua2oI/Xc4c8EN3ByglCUuZ5cQEbkyyq/hxDE5gM/CUYyWGfD6OcfZhTUnt
         kHZpVTgPTgNrv135YlPMeZbDMyI10w6kU3XJjLJmH9R5NwKg1vUg/oLu8OPH4jRJPZs1
         piUjD2C55VrB2jSDpLhQWT2A/Vg6CKDS696HWPY+5HMvBD1892o1ASDL4L7XnGX/3D7n
         W6yA==
X-Gm-Message-State: AOAM531gQE5BXr2YvVE5NpsTAUg7ufbrNFwXfMpIdX51gRDtUlaoNQRr
        lB2k3iTUOHn0hZc7D5LfEoNknw27SpN/kRCkOl5Arg==
X-Google-Smtp-Source: ABdhPJzMCiDjOvJFb8RJNO+Eynw/sVkqBb3RfG5pqD9m2EhRa9pizpV5X3javyefoKq8JHFV/UgfqLpph5fucQpcOWA=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr7895696otj.77.1638391451845;
 Wed, 01 Dec 2021 12:44:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Dec 2021 12:44:11 -0800
MIME-Version: 1.0
In-Reply-To: <1637040382-22987-1-git-send-email-rnayak@codeaurora.org>
References: <1637040382-22987-1-git-send-email-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 1 Dec 2021 12:44:11 -0800
Message-ID: <CAE-0n50PT6j9zGQQyESp+VkokDo4805zU23rx1EA0eaqf4nMBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Rename rpmhpd struct names
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-11-15 21:26:21)
> The rpmhpd structs were named with a SoC-name prefix, but then
> they got reused across multiple SoC families making things confusing.
> Rename all the struct names to remove SoC-name prefixes.
> No other functional change as part of this patch.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
