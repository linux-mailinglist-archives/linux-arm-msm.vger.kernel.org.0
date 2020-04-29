Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE2A1BE77D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 21:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgD2ThO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 15:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2ThO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 15:37:14 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDF7C03C1AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 12:37:13 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so1560661pfx.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 12:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ALQ9L4ip5teEGArOsIw3F/vjHI6JI+8X3RjJXcvMc04=;
        b=cbhpgvq8Wbr8kre9ifPGoKGhC4tbV/W87QbZoZDbvQ2aK1XpIpamqmE/dMQYSeEuYG
         eIb8Y7C0jmEXHWrIUnY7Ijad0pdoEBodXbQOItW9vxN4yrqKUGMituN7A/ffu/w6ESSm
         RFG/AEDmTalpuKqqc//VHeV3tKflkdNImrpJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ALQ9L4ip5teEGArOsIw3F/vjHI6JI+8X3RjJXcvMc04=;
        b=nvUxN88pVrlPZwb0yyKgm+8zPTCFBur0UEXndde9t71/ZqVhTjNywRo5sIQSblWugK
         pPqJmTkw+X0MQbhBxlzBikWcbinqj+dI2Jwt0nh5M2cyHUW8fKFYjJA1WRTCAWFH7nTC
         RrKuvnC9DkhXGUk/WX6W56p5n1zQPfyEBANarhM8LijgLbD5b2H91bfaTWTyERqDHfgA
         msWvYHbQAWORCDgr9TSfQJirM/9GWioglFI2FVqFW+XWB0pSmjj0eFC5mxNNNl53ZgxT
         IGbXxntLFXNRt+q9ioKG3VK9Tzf7nx1wN2HEeo15tWoWpurPvjbdU++ZxwncBOByvz01
         0xPg==
X-Gm-Message-State: AGi0PubDlm9U/JfV8VwWZidGn5ZFu1Lm5PoyHNnoFXttwf6HMJNEtiQR
        ycoJvTDaxRPZW2lELD1gXZBNLw==
X-Google-Smtp-Source: APiQypL7rYwKTOTIgKWUVTp0IZ1MV9gTpk2Rq5/Do+A5yp0rEM77W/kD/fBtuMZ6Sg+AkTV4IlCacQ==
X-Received: by 2002:a63:1d4c:: with SMTP id d12mr35525838pgm.247.1588189032757;
        Wed, 29 Apr 2020 12:37:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f64sm83511pjd.5.2020.04.29.12.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 12:37:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200429085753.3277336-1-arnd@arndb.de>
References: <20200429085753.3277336-1-arnd@arndb.de>
Subject: Re: [PATCH] firmware: qcom: avoid struct initialization warning on gcc-4.8
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>
Date:   Wed, 29 Apr 2020 12:37:11 -0700
Message-ID: <158818903103.117437.15808156977430139077@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Arnd Bergmann (2020-04-29 01:57:33)
> When building with old compilers like gcc-4.8, a struct initializer
> can warn about invalid syntax:
>=20
> drivers/firmware/qcom_scm-smc.c: In function 'scm_smc_call':
> drivers/firmware/qcom_scm-smc.c:94:9: error: missing braces around initia=
lizer [-Werror=3Dmissing-braces]
>   struct arm_smccc_args smc =3D {0};
>          ^
> drivers/firmware/qcom_scm-smc.c:94:9: error: (near initialization for 'sm=
c.args') [-Werror=3Dmissing-braces]
> cc1: some warnings being treated as errors
> drivers/firmware/qcom_scm-legacy.c: In function 'scm_legacy_call':
> drivers/firmware/qcom_scm-legacy.c:139:9: error: missing braces around in=
itializer [-Werror=3Dmissing-braces]
>   struct arm_smccc_args smc =3D {0};
>          ^
> drivers/firmware/qcom_scm-legacy.c:139:9: error: (near initialization for=
 'smc.args') [-Werror=3Dmissing-braces]
>=20
> Change this to use the empty initializer extension that
> works with all compilers.
>=20
> Fixes: 590e92809a58 ("firmware: qcom_scm-32: Move SMCCC register filling =
to qcom_scm_call")
> Fixes: 3f951ea627da ("firmware: qcom_scm-64: Move SMC register filling to=
 qcom_scm_call_smccc")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
