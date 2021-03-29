Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7C834D81B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 21:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbhC2T14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 15:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhC2T1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 15:27:41 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BEDC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id v8so4892477plz.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=KLlTAo4el/DFnNk+LNHJMO2kyu5BygdFuXHahiqxgP8=;
        b=VG9vKllJLEVGDoxMzgj9Ca/pHGciCQYIlbDtMvtq/UxPIoZJ7ECu6spWARntl5zsf/
         A8CFT16NL16g6h6qu6ZLx46tgg/KuMMZjqPKuBS6XcMnfxNXsZM1MfytkYVabIG6ZKDm
         PR3r01+kpuLeiEDca5bMktPktb/vRqeV0WdlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=KLlTAo4el/DFnNk+LNHJMO2kyu5BygdFuXHahiqxgP8=;
        b=axdmKdafGUU8S6eML/S1Sl+vHkU0JA7OvTO3RDGWwNRHID79pBUUoaRtRHglcZcyYz
         Q4+AGwySqkP1i05aQ/1AGrq6+X+p5Y40JxGvoTrtB9aem2EIRVeGlp6DT1fTGEqyFt82
         qJq50kNcWafu/ddsW7bNa54nsYV6D8hchkeRf4ybJFymZ2uKWeOiUtbNygnqBah33QDY
         vnsKdFITXavhUTO60ZYbndnBDExYdUY1dPRk0j9qHUcowa1+OgrM3smUvYgSVdMO02DM
         qkAKXrV8Ql7wGYoX8jqK6paJP5UaTrLNoObBdUPqAD5+cy5OKPoZ7eNJnYYcMnowM70x
         N7nA==
X-Gm-Message-State: AOAM531eoSe1ZvnBb+kAL3WzZALgXtvC7pd43lajpwStdmXq6SYPdIhq
        hMVETNnarmAjVUBkNjJHmLV8uQ==
X-Google-Smtp-Source: ABdhPJw1DhTcHAq11BdM7UZT1sQLUgR3VEzIOVIqTPbRMpjGdU3juswhlMA73YA6oU55nTpMohAISA==
X-Received: by 2002:a17:90b:4b08:: with SMTP id lx8mr616674pjb.135.1617046060512;
        Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
        by smtp.gmail.com with ESMTPSA id j3sm305291pjf.36.2021.03.29.12.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org> <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 3/4] drm/msm: add compatibles for sm8150/sm8250 display
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Date:   Mon, 29 Mar 2021 12:27:38 -0700
Message-ID: <161704605849.3012082.9945764472677336582@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-29 05:00:50)
> From: Jonathan Marek <jonathan@marek.ca>
>=20
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
>=20
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
