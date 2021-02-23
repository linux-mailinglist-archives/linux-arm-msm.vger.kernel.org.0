Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E01B322691
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 08:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhBWHol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 02:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhBWHod (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 02:44:33 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF6BC06178C
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:43:27 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id l18so1312316pji.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2twvVjicMyNNCpSgmcLEudmSx8y+klw/u8V9ariMKdA=;
        b=UoksV0KOhpu+dR0oTgA1gV3D8jT9FPWUVgOxpH7Eckcj+IS4Nv4j9tDotUdTxerMYS
         loygdc0u+zV6jJ2mu59fZLlHcRX8mByQIWygprk73Z+FPPFEDXusQX73RILUHFbwXH59
         wgAjf/YHUTtth5zhoGioTlRd3rZ5H+qcEJObg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2twvVjicMyNNCpSgmcLEudmSx8y+klw/u8V9ariMKdA=;
        b=nYAyYRO/2B++6peZPqyhJeh9eV6NI4OyMqD2GUiPyGnC6v8B9PYJU7Kxg1e5GMXlsp
         PDQvz2tirgreKbrItSpJCvVn5XKYhhcbqxNbNk88sIaaqKhpUOxVOODicGlYSd6/nLBz
         whAy3QW1CNyrAoNh0CXaxrWboWjWe+w+/wSFLW8kMt3bMCKBfUI0AnkouaKsTSqClVJd
         TC5CgGjYtpWO3bir3z2vioPYrBI1GBmWBJdnV/EecTrD95+JgsATikHhEx4Q3TXxiuUs
         DyqzosiFVJHtGKRX1Led3P17DU9k/Z2z1Y2PDpxSVOe2eUHoIfENd7GaHMB3FFBJ710a
         Vn0w==
X-Gm-Message-State: AOAM531sDrA7V5NPU3JL9hMGeAZ6Ynbg2Vop7xmPyhQSWU2EQnbEmxUe
        ejbl8s2qmPseEP/HwL4J39E0uxvdz/NxFg==
X-Google-Smtp-Source: ABdhPJx8a4leQU3Scg3ZY1pwKuaZMRissgGbv/pQFsAh/V9Tpk0mRQ9YXJ6+5gM/Asp6JsYcvpEepg==
X-Received: by 2002:a17:90a:eb02:: with SMTP id j2mr28258219pjz.226.1614066206537;
        Mon, 22 Feb 2021 23:43:26 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id d10sm6216079pgl.72.2021.02.22.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 23:43:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613114930-1661-8-git-send-email-rnayak@codeaurora.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org> <1613114930-1661-8-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH 07/13] dt-bindings: arm-smmu: Add compatible for SC7280 SoC
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Mon, 22 Feb 2021 23:43:24 -0800
Message-ID: <161406620483.1254594.6953681573838729589@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-02-11 23:28:44)
> From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>=20
> Add the SoC specific compatible for SC7280 implementing
> arm,mmu-500.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
