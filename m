Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B61033A16C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 22:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbhCMVhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 16:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbhCMVgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 16:36:54 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0412DC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 13:36:53 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso12438233pjd.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 13:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=aMPU7eg7e28bJ2i0Qjxrkr9xGQBKH90SvGB4qDX91wg=;
        b=TUgKKVNA/XNTDmNpcJVNzctA21mlwIVtElF2PO9BBNfhXUwi/31TmspgkjDtV3Empx
         W2YV4GCx1ox+wbadu8Ic6CV36uweDdEzR29jdHx3LjEhnlaRsiwY0il3qUk7g9WY37h6
         cIg45A5owD2KMO0bzKlMjs2oxiAA2Fx3wFatk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=aMPU7eg7e28bJ2i0Qjxrkr9xGQBKH90SvGB4qDX91wg=;
        b=dQ2waiqMyoqHDhbdQbjMcvEgNsyERA1zEmLde9Mw4pKpxO734eH/Dl1Djr6q5wJmgy
         x0R+vmg/082gRbK7LUS+raHsnqDiHxjGdfQYnWdQ9AVBNR7aNVZvOD3YB+aB0r+72Zen
         ng3zmFai+3wlGGqDvLCsuOSaFLNqN5v0VidKbuW8E5GXEBMAe5C5cMwRfPi379Q1Vjvo
         Q22Yjli98beg5+Niikv+FQcW2CiFTR/VDsNRIr6YtKcU9qZmEgDeQTBJEwwscenYaSv7
         h2Z1XDb4/Hha+JuK3W5sc4N04xo2ncZ+pEO4rX0DsgeYegNNhzF9fIwY+OIdH5OEXk+w
         HDzA==
X-Gm-Message-State: AOAM530QCqXp7+B9jxYv19JGjuQm4jb7mfcHNfIua5wXFNJ3xQDmElLV
        OWTEjjCvpQFMWf6uE79xNfBRdw==
X-Google-Smtp-Source: ABdhPJwzK6lzLHjkj9lABLF3foT7chb7OnaZYk8ViG03amzm2xDGkeiRYX/vCyza1Jr8+P+Jo+hSJw==
X-Received: by 2002:a17:90a:bb91:: with SMTP id v17mr5160682pjr.24.1615671413426;
        Sat, 13 Mar 2021 13:36:53 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
        by smtp.gmail.com with ESMTPSA id c193sm9531324pfc.180.2021.03.13.13.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 13:36:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615269111-25559-2-git-send-email-sibis@codeaurora.org>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org> <1615269111-25559-2-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 1/6] soc: qcom: smem: Update max processor count
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org
Date:   Sat, 13 Mar 2021 13:36:51 -0800
Message-ID: <161567141134.1478170.1759471645511900157@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-03-08 21:51:46)
> Update max processor count to reflect the number of co-processors on
> SC7280 SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
