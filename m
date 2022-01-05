Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE62485C62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245453AbiAEXme (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234791AbiAEXmb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:42:31 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E955C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:42:31 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id r131so1339384oig.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=BlMu1CysniMOf49rg6aElEJvFhN3Nt4imzu3+q/s+vQ=;
        b=fo8LvVX9fWJ8F1/Q3dncllwCe9UqzI/MeZmQgRdDpS1WQj3biFYa+gTn17ecboXHtd
         cGgag0bpPheib6NMF3GR0WaOe9yY/NmsKfdG57SHyViPdmA8L9E3VxelNtHyacVARr5b
         wUsQyTwnUHfzdhq8K4QcWhqN9OVUe400Yj3hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=BlMu1CysniMOf49rg6aElEJvFhN3Nt4imzu3+q/s+vQ=;
        b=LrFNGwG4rCq980xIOpQtnD6+h84mu/BNDlRmF7jZR6xhA98nj5gDFnrlqkJd2vX+nm
         VJd3jgvJ6n8D1fusgKFmdiLVRFzi3hNxcTD54OHr3UNN5ZwWjhZ2b8iCnpcpvqx7A3Mm
         ucVhvmAmSwQBGX+drGFVLmvpQd032x85pL0HHcIPjJG8KKsq79IKcp1PwKp1RfTO2ctV
         7Ryg2eV5oPF9u5vKVzkje+F0CLv3vb1ncgSBnp1VL0XEzZgwz3nD+dau5El7Tv/z4s5E
         nLtsxkkV851xXqTHtmuvoBZamB/n1j8lSi3GFHW3s3w3CkxF81Bp4c1a4NHOaJg6s166
         1BxQ==
X-Gm-Message-State: AOAM531HrfrjVUxNs5GGDatHRltK9VbGycRuSAybJiiKIbmKfbxr+bWS
        AH3jI/uxQE8PUMxopMdWNIMbewFBcmhu4QKLumBp8w==
X-Google-Smtp-Source: ABdhPJwkqm4yFPgwfgyjBKBAe2ueIE2xGw328/xMD5T2gGFk60m1dpDSonU5lDiPkZj0Fh8YTBMlICE7176XrlHTnyY=
X-Received: by 2002:a54:4710:: with SMTP id k16mr4333140oik.32.1641426150855;
 Wed, 05 Jan 2022 15:42:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:42:30 -0800
MIME-Version: 1.0
In-Reply-To: <20220105232700.444170-2-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org> <20220105232700.444170-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 5 Jan 2022 15:42:30 -0800
Message-ID: <CAE-0n51ibtmZWmxjfSVNprJQZjttFSqGJ7Wp8ifO_WnNiozn3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm: drop dbgname argument from msm_ioremap*()
To:     Abhinav Kumar <abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-05 15:26:59)
> msm_ioremap() functions take additional argument dbgname which is now
> unused.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
