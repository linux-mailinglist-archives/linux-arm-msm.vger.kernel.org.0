Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA4061A2FD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 09:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgDIHRD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 03:17:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46941 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgDIHRD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 03:17:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id k191so4560661pgc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 00:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=iYpXbB+2GsvCwjKsECWDukpuW5ZXW1FAu5vdGFQwGEE=;
        b=ZgflRxtbTc+6b4ilENSCoDXtvy7jk7YTfNcDWTxb3W6KhOlG3O5zKZc4QCdlOV1ffe
         zV4tXWWZLwxyAC8u4LXoHdlq6/P3LIS+c8QljW6BF6Z3+UHxdk0pgcqTCAWdF0yCEmKL
         dIXtWWgdvPIixHnzp2xtqGnu/ipQf1SzDbPh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=iYpXbB+2GsvCwjKsECWDukpuW5ZXW1FAu5vdGFQwGEE=;
        b=rw0fjuIIJCcZ1jp/8ozHix/evlYHfjkuS7gNr38QKI7ylmaxjEVLIHO2KJUAiK04e7
         9ZyZ+jtPvhEM7e/C1bbCd6xChsNwV90ywpEx7WatTOe2GI60whDcQ3QaHpeUx6Z2HukF
         9lPSDWDCGEBPk56HIBPqUxk4TocILjbSCV7IQn1h2+oxSauAQUJAWd5qksP1XCqf2g39
         wHo00yDIrQudn2+/b48fPmaq/qFOHJMSTz19so/L53j5q/hcvNX0lu14SHx1xFheAPNy
         WXt49IRN4oPf7MZtafUMeU+2DYhDfbFPWuYARD4aI/LQUe6WTe5dr80jo03zO461Thxq
         FuVw==
X-Gm-Message-State: AGi0PuaDalmIShQmqFrIUNWMMRIzAQMYJo6dT4tHOLHPUxSRQS9chh6X
        LDfcDR4ow5zw5BAXyghp33VUhg==
X-Google-Smtp-Source: APiQypKXx+N7ncEb0/fmCRSM1ldHSjKZvK5jY3qy9bLSvb50reXJFujfIv9LNDl8lR+wmuN1MU4RDw==
X-Received: by 2002:a63:e443:: with SMTP id i3mr10565042pgk.436.1586416621418;
        Thu, 09 Apr 2020 00:17:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e187sm17883679pfe.143.2020.04.09.00.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 00:17:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200408224347.GA388414@ewhatever.cambridge.arm.com>
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org> <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com> <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org> <906d374d-a4d6-f2f2-6845-88b97a5ff7d9@arm.com> <39a2b3fff165a108fa59d72b630b5f14@codeaurora.org> <bb209f80-ac02-6321-dac4-ebf9ee6fa9a0@arm.com> <bd05b31c2391edfff5044f22f2f83edf@codeaurora.org> <e9c299c4-caeb-9eb8-f019-b311bfce756a@arm.com> <a7074f44ebbde720b5e0189801eab7c9@codeaurora.org> <20200408224347.GA388414@ewhatever.cambridge.arm.com>
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of multiple connections
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, suzuki.poulose@arm.com
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>
Date:   Thu, 09 Apr 2020 00:16:59 -0700
Message-ID: <158641661949.126188.2854214876274328570@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Suzuki K Poulose (2020-04-08 15:43:47)
> On Tue, Apr 07, 2020 at 08:48:54PM +0530, Sai Prakash Ranjan wrote:
> >=20
> > Thanks, I can test it out.
>=20
> Please find the untested patch below.
>=20
> ---8>---
>=20
> [untested] coresight: Fix support for sparse port numbers
>=20
> On some systems the firmware may not describe all the ports
> connected to a component (e.g, for security reasons). This
> could be especially problematic for "funnels" where we could
> end up in modifying memory beyond the allocated space for
> refcounts.
>=20
> e.g, for a funnel with input ports listed 0, 3, 5, nr_inport =3D 3.
> However the we could access refcnts[5] while checking for
> references.
>=20
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---

Things don't blow up for me anymore with KASAN, so feel free to add

Tested-by: Stephen Boyd <swboyd@chromium.org>
