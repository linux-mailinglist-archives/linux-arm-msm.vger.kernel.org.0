Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773541743C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 01:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgB2AWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 19:22:11 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45064 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgB2AWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 19:22:11 -0500
Received: by mail-lj1-f195.google.com with SMTP id e18so5261885ljn.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+u0gv0tl7AmgLhCL7vM7Tz8IImT4ldCCBT4qkE7ULKY=;
        b=fGaQ5JCVhGTePvUAx++hyza0BfqY9JdB2F2GhfTLy9rPR5cQk5nYiP4YxWG8OFvXIw
         eaxCQprO0+OU8yIrfsI3GJjzKRqnBwA0Up1pGquOWCbSGik5YvXxE4JhmtLjR2sNGlOd
         k3ZQA8sT66ACy9nosyGTOwS19r/nZ2etYGTq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+u0gv0tl7AmgLhCL7vM7Tz8IImT4ldCCBT4qkE7ULKY=;
        b=khMmoUmcf1u7yaS/GdzZ3tKhhD9pgXQEas4/pvuen1PQS0fx8hj4JFSPoaIaAWPbsB
         2DX7uUDiHbZzx/CpIggt3IxltQVqusN2yRZyE0/eZgc6EG8y+eIXw58em0JvUnTAfsa+
         bNo7uTCP7vPvRFc4J0aQCpvYtccauv43vBIHE6TuebuPnBmvDb+2JlfIn2a0bgjIuwFM
         9o50ug5ySdJ+Frf2VdVbPZV/XLqQ0OWkaUhnY08H3nCwaM+q2o9azv0NjZq2SeUKwzyZ
         xl7rVMnY3CSp67bABapS3VRNqOE4oXja+hWIF6fReBNQzAwhBGo6U9OQ6dcOcXjc9Nfw
         R72w==
X-Gm-Message-State: ANhLgQ02+iV8aLL/sicKJPnLXSNpwPPjGQ5ZHuYfPBVA+a4byPKPS3HD
        A7BowxNtzUWhOdHSE7Yejdf8Mnl0Jwg=
X-Google-Smtp-Source: ADFU+vuEpaYfCSsjDAWJnxFeVzAh8iXB0E94x0me7KXN/G4am1XKu0WLaE6oIdLuHwwLceKTOuwm3A==
X-Received: by 2002:a2e:6a09:: with SMTP id f9mr1215562ljc.107.1582935729059;
        Fri, 28 Feb 2020 16:22:09 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id u14sm3131384ljd.67.2020.02.28.16.22.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 16:22:07 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id v6so3360328lfo.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 16:22:07 -0800 (PST)
X-Received: by 2002:a19:c611:: with SMTP id w17mr4041445lff.59.1582935726653;
 Fri, 28 Feb 2020 16:22:06 -0800 (PST)
MIME-Version: 1.0
References: <20200227105632.15041-1-sibis@codeaurora.org> <20200227105632.15041-2-sibis@codeaurora.org>
In-Reply-To: <20200227105632.15041-2-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 16:21:30 -0800
X-Gmail-Original-Message-ID: <CAE=gft5=r3MaoAYTn1X416-QGjSBKj5526VDbFoXUbiEvUKO4Q@mail.gmail.com>
Message-ID: <CAE=gft5=r3MaoAYTn1X416-QGjSBKj5526VDbFoXUbiEvUKO4Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] interconnect: qcom: Allow icc node to be used
 across icc providers
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 2:57 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Move the icc node ids to a common header, this will allow for
> referencing/linking of icc nodes to multiple icc providers on
> SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
