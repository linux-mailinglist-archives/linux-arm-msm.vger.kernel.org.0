Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5091327978F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 09:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIZHkE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 03:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIZHkE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 03:40:04 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD0AC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:40:03 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q12so484166plr.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qRaxhiyZE90m+amIVHIeCMA0LL3BWUXSOy1qHRMz/HE=;
        b=REsQD2UwdR9mJ2mZr8Lka7ng3h1M5e4t5YBSNhbSVEe4dBJq1XzPkdnga8WsA4blA7
         enldgWNaqTvjHUwuEuZ8zTdyodiiex2GstukHEm8QqFfnaUL5b2Qp+86p01XKfBONkbv
         94+OWFKFNefSgIloF+EIod5O3TihXi4rkG8pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qRaxhiyZE90m+amIVHIeCMA0LL3BWUXSOy1qHRMz/HE=;
        b=jt/B1aYpnRrxeTrb8nJrrV1/UDu6E5Wn3sikt1lrkx+YjQPXFCKQty1EGTJU63Jb8P
         41JvFFHsvXa+PMfOyHa6t5WLEJlSzpTZyZ/sTc/vAuC6Uro+YHynAdReNXdaHm2vZh+s
         UJ7VLEk6BLdT7kfu5h37xrVBLmYgumbstTvaJVnoPAfFd7FDjDyyY6VIzOksgqzBgZm+
         y2i0cEbbB2ecoUXHv7wk2twSoZCPGcn6ssUXIC9IgZzyKoeb2BO3gifnOduayc/ivOvm
         huM+tRHWljWUE69zmjoRSEilBkWz2Nn163qTaeuBRzeSHO1dT2Q7hMFpMNEINict8Bkw
         q2QA==
X-Gm-Message-State: AOAM532kmOoT6Uu3kHrsB5eDu8OkWGEMm8JyloZMke653qdgkYZPV86G
        NM25IN2eCMd7TgBan4FXZYOexQ==
X-Google-Smtp-Source: ABdhPJx66j3Z3S4vye5sgwXdj+nfn5Pw1dqJE3BCIxshfgN+WI4IsNFGybEL3NUhX6uz2b9yZrS6uw==
X-Received: by 2002:a17:90a:69e3:: with SMTP id s90mr1129884pjj.130.1601106003310;
        Sat, 26 Sep 2020 00:40:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c12sm4540274pfj.164.2020.09.26.00.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 00:40:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200926045048.16175-1-tanmay@codeaurora.org>
References: <20200926045048.16175-1-tanmay@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: DisplayPort PHY compliance tests fixup
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        daniel@ffwll.ch, airlied@linux.ie, aravindh@codeaurora.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Date:   Sat, 26 Sep 2020 00:40:01 -0700
Message-ID: <160110600102.310579.8458722739510072790@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Tanmay Shah (2020-09-25 21:50:48)
> Bandwidth code was being used as test link rate. Fix this by converting
> bandwidth code to test link rate
>=20
> Do not reset voltage and pre-emphasis level during IRQ HPD attention
> interrupt. Also fix pre-emphasis parsing during test link status process
>=20
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chi=
psets")
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
