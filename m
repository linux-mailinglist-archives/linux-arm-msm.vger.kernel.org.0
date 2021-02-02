Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE2F30C9AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 19:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238561AbhBBSY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 13:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbhBBSWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 13:22:43 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3D0C06178A
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Feb 2021 10:22:02 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id n10so15411550pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Feb 2021 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=H3Ktduf2QxtISjs8SRv/RgHUJLdczDldyTBeCd9r9t0=;
        b=JZKF6L+xZ0ixNqQkugWKwkTH8BX4f7XZ4EnCXuycwHUkO/STif4yShPRGkSWv3WnE+
         TwlGVsIE8o5elNHxDk0dHruDHycMm1uiXsGRWUc0OFaLyRiAts55Zaz1i15DK9kVzLlu
         lHiC7/zQ3USfSRYNLs3uhIfeK5ibwcw69YygY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=H3Ktduf2QxtISjs8SRv/RgHUJLdczDldyTBeCd9r9t0=;
        b=mAfMDvvhNQYtGL+8IWcrnh02EyxIcQ5gfs9+Cr0CJUfKYZ+kfo4TGuBfL9ivoAzA5e
         JVIZDekRKpw7IVs6gp6kcy6ALms9KPHYOqG3M3IRxraymc6L5u66K8Guh/afrgE7rWhU
         G0ADqSOyS9o8/UVjMHHbH9D1rrFD8cPqPjRTqMs9muDDLUTE+ANl8FQ10cjMct/G/MPq
         VH9TSbrDY8V7BEZNR4teQD0B4TVvEp5i83hQ5qj1W333M4TSP0jZWMSTfiD4Y1Y9jiX0
         uYfP31K051ydeKrveNPHNdCo94Q3J+jXk/vTRVbPeJL6PK/2SC2bZpGonwzcOYHNrctb
         blyQ==
X-Gm-Message-State: AOAM5312Et9pDb1qV9mOsB3xfd5n2i+HpFJW0NVxyBeuJ8fKb3lkW8Pk
        CUfMRRsD7QTKlb0EWnjk34Lf0Q==
X-Google-Smtp-Source: ABdhPJzmldyf2y2Wk1vWOl94CphO+LqXsIC7rCCdsLOlh0sJJeqoonhUJhmjgpgtFexAJ0nzN/uNuw==
X-Received: by 2002:a65:4101:: with SMTP id w1mr11472979pgp.323.1612290121838;
        Tue, 02 Feb 2021 10:22:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3571:bd6e:ee19:b59f])
        by smtp.gmail.com with ESMTPSA id q2sm20238115pfj.32.2021.02.02.10.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 10:22:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210202123214.15787-1-bernard@vivo.com>
References: <20210202123214.15787-1-bernard@vivo.com>
Subject: Re: [PATCH] drm/msm: remove unneeded variable: "rc"
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     opensource.kernel@vivo.com
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bernard Zhao <bernard@vivo.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 02 Feb 2021 10:21:59 -0800
Message-ID: <161229011920.76967.17860389589804358045@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bernard Zhao (2021-02-02 04:32:03)
> remove unneeded variable: "rc".
>=20
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
