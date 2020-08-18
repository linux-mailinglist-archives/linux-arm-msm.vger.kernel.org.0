Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D1F24904F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 23:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgHRVmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 17:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRVmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 17:42:25 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E8FC061389
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 14:42:24 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t11so9834875plr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=e5nsLglQi6iq0gXD4/ZLbxZPHmUiCWsoxGRyVuLjB/c=;
        b=oekTgrwzSs/TnRji4n7Ia1KRw2sKFuCY6qwuXQcuT84qxYNIQBTvSVH5zSdQoh3F1L
         uAmAKAJagFUtKA5NCI6262idBc6YE3mg3C8P5KXEG9A53xdLiIZsbpEfCEA3ovO+r+bw
         D1Dbnfw3JW6d3gniWTVyrMYPGrYKyffZ21TC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=e5nsLglQi6iq0gXD4/ZLbxZPHmUiCWsoxGRyVuLjB/c=;
        b=aaKilg7Lyj5j2XVLoLbOFSStzUm96PLsLKYx3M2B5UMk7IDLw+6PIo30XcIf23Rb5u
         mp36OhwkngBnAnAzj6iOZOdEWKZ/zXdtGwpmQFCnmOvT0QorMw0EQroZaNK4Wu4cdE17
         94SNJerDSgzITN2XNlMdA/m9UJVLLIEDox9vrmaPL0Oa2dm4Lwd6GPoxTAPHI3Mxi32M
         TMy0qsalcIINOXF4/UidU9Rm4Wyug5rNOJReJ09G0keGhuQ3dzx2lcopQCbb5MzJ3toy
         4GsFflkkGr3/Ct00N1jBNp7U7Hj3ZjMZYck8bC6/9Jc0o4C5jt/5ZZzpL8/4udBfso/e
         fxsg==
X-Gm-Message-State: AOAM530xkp5wbnnRDluDAEgXdqBH/xLpm6bxuoAp4N0M8Xgo0wtdPcwp
        HjKnTvNU4BdYXomfxfLllJZUhw==
X-Google-Smtp-Source: ABdhPJxNWxWkdy4uYKtZpGauvgOCAqO43bYBYkbW03fwXdZ7RgGCLEOkwT4RULfvoamziaSpULpFwQ==
X-Received: by 2002:a17:90a:d597:: with SMTP id v23mr1471836pju.24.1597786944417;
        Tue, 18 Aug 2020 14:42:24 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e7sm22363954pgn.64.2020.08.18.14.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 14:42:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200818033657.16074-1-tanmay@codeaurora.org>
References: <20200818033657.16074-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        seanpaul@chromium.org, robdclark@gmail.com, daniel@ffwll.ch,
        airlied@linux.ie, aravindh@codeaurora.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org
Date:   Tue, 18 Aug 2020 14:42:22 -0700
Message-ID: <159778694245.334488.3352871644651964381@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Tanmay Shah (2020-08-17 20:36:57)
> This node defines alternate DP HPD functionality of GPIO.
>=20
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
