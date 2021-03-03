Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF82F32C196
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389477AbhCCVh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377925AbhCCIUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 03:20:48 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCFBC06121D
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 00:20:07 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id s23so3863782pji.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 00:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=AwiOUOhuW6EnFueyj5x786yWZvf8VJgxR6bk+bVje3E=;
        b=kx71mWOK5eWW6fp8ZhJtKANfnVGfTfg0iIEdrNdepDNYMPlJZjwB0CNV0nPVukJiCA
         DuX6R2KPw1f6N4VZo6IPa2Dym+ZA7tGSA0ufAGP5lKilaoQh+Pl/f+Q/2lXuusIvlCHh
         ribXlaW5wW9MfBiA+ZGvRPl4Fb2p3Ouegrdhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=AwiOUOhuW6EnFueyj5x786yWZvf8VJgxR6bk+bVje3E=;
        b=LbDUdbb4tcXJOjci9PIHVJIfCpWNajXXzmFOV3Aslb7wCY/x12hjzCGrEJE+keunNA
         OyMBvLGmmUWgWg4gsURVgWcBWf9rDjYdz8F5HX2LLBWVaTAFd6cQH6zlTihvQF84HFPo
         QgCtUbWyfoKtRrxEg21ovYksBjRL5PB4jf83uFtU7yKiHDUxVEOT1H++N3mj05EXznqV
         KsCR7CSmsxCtl1/2sDg6qqRlLdVBW+kg44ID5Dcfx377LrYydsmlRwCoz4B2RV1qNoD6
         ou5ODupHKTuZZ+1DQ0CzFCqR7ZCF9lSwVvguVGUGvKAkW2lYPH9tEi4ljltW4N305Pm9
         8PMw==
X-Gm-Message-State: AOAM533V64ZZw9mt/UWJ4cvqI0TOKe9O8bA5TnD8GiM8MVftM6fp0/iw
        Cu5th75rFpV2/TUixjKNT8oJiQ==
X-Google-Smtp-Source: ABdhPJyjAUMDV1wD5FKXN7q7V936rQC9rZcj2ZaH71aZcprTlyXEx2AOKVqi73/ddsFayGMzHLpeqQ==
X-Received: by 2002:a17:90a:ff05:: with SMTP id ce5mr8434898pjb.156.1614759606898;
        Wed, 03 Mar 2021 00:20:06 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id m12sm5751554pjk.47.2021.03.03.00.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 00:20:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210301133318.v2.13.I3d1f5f8a3bf31e8014229df0d4cfdff20e9cc90f@changeid>
References: <20210301213437.4165775-1-dianders@chromium.org> <20210301133318.v2.13.I3d1f5f8a3bf31e8014229df0d4cfdff20e9cc90f@changeid>
Subject: Re: [PATCH v2 13/13] arm64: dts: qcom: Add sc7180-trogdor-coachz skus
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 03 Mar 2021 00:20:05 -0800
Message-ID: <161475960503.1478170.3435043996618334113@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-03-01 13:34:37)
> This is a trogdor variant.  This is mostly a grab from the downstream
> tree with notable exceptions:
> - I skip -rev0.  This was a super early build and there's no advantage
>   of long term support.
> - I remove sound node since sound hasn't landed upstream yet.
>=20
> Cc: Gwendal Grignou <gwendal@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@chromium.org>
> Cc: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
