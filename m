Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E391B4765CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhLOW23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbhLOW2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:28:09 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38C9C06139C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:04 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id r26so33680693oiw.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zRBcOVxj/ibriMxS32pprZt9coX5c9a4gYM7k5r6K4g=;
        b=B71zW6qW1yaVX6Fyi8zvX98lut7ZrzbCNAWw4jInqK0RTYQq1qIbX05fp+GcipXHuZ
         ft692av9hqjMuDdlMpHdPHGO/jZxSzaRaJYQGjmvbzDeiD/NjtoElpJQE70ykkhoAEJP
         PxZdVrZUApx+kYXs3xepywK77aExasxJ/y5NJTZYbyrqF49OkiHmZrQwFYiYX/hx/w2q
         HmXnIhnIMpK8qi63ZuZ5zlyX6c1+1RwC0IUDtGbHamcD40Pmbg/UN+XPKjGuy4d1F8dT
         oTERXsuH7AqaOdff6V3ZIgFwt1S3hosVAb++Bculjfk8atnki4ruPYRx1C5mFnDaBLwS
         PreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zRBcOVxj/ibriMxS32pprZt9coX5c9a4gYM7k5r6K4g=;
        b=MQIgGe3ehQAQLPiGsbUk2xR/BjIv4cJCbqPsQPXE1IdCNprycUFhZAk9YEmZQkpoOw
         oAltOR0uieJoJiT5Dw3Cq+0HBInRYoTZqvvuZagVT7oEZJu87A8mpfPOHnbL2CgEGMlO
         AB/05pO6DDkeILczLIzF38JuDzsXkKC1Vvrisl5nA8x2eAmnopdwA+n9yuMv/tji5Qav
         JatIcid8E5fc8PWPyqtQd1xZpzCPtoFSU5/0XvWSeQ4yEfmDpQc/EUAxQqwRHFMmyVHJ
         rlpFJKqI+ZU+qswF+073NRxNkPM/wyETblMKulkuN10fdHFAinQ6LAXfg4JCwP7J8Cbr
         biVQ==
X-Gm-Message-State: AOAM531eX1SYG38lFBsHT1n2hGqH97GzyOR+2szJIREOlyHiOP9ykmix
        IGY36MY9buQSYWDSVDZLbdopjw==
X-Google-Smtp-Source: ABdhPJx/UHk51n1uIDeA2r1tB50fbZO+RB/5/12pOQ1p99+VgJd6/pWp50Ovvvg8ObErSnt7+cm4GA==
X-Received: by 2002:a54:4104:: with SMTP id l4mr1827178oic.17.1639607284116;
        Wed, 15 Dec 2021 14:28:04 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:03 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: c630: update sound card setup
Date:   Wed, 15 Dec 2021 16:27:36 -0600
Message-Id: <163960723734.3062250.11809514364330520840.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
References: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Dec 2021 17:53:40 +0000, Srinivas Kandagatla wrote:
> This patchset fixes issue a with existing sound card setup on c630 and
> also adds Headset button threshold values for button detection.
> 
> relevant UCM changes are at
> https://git.linaro.org/people/srinivas.kandagatla/alsa-ucm-conf.git/log/?h=v1.2.5/c630
> 
> Srinivas Kandagatla (2):
>   arm64: dts: qcom: c630: Fix soundcard setup
>   arm64: dts: qcom: c630: add headset jack and button detection support
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: c630: Fix soundcard setup
      commit: c02b360ca67ebeb9de07b47b2fe53f964c2561d1
[2/2] arm64: dts: qcom: c630: add headset jack and button detection support
      commit: ef10e1b89508d3315e47e23098fec60b33b1f6b3

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
