Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A20F31EF7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 20:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbhBRTO4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 14:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbhBRSr2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 13:47:28 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD1DC06178A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 10:46:46 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id z9so2062774pjl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 10:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=TYSvMCIPacqOphOa16rzA+X+0GuBxuIS4Qj5ygoV2IM=;
        b=aWV5hnEy8rnECOEGtDuAcE+s4yLDrZzLFVj+vn97GLn50xSeuxHfgdHF7Yz6jpcksB
         CYfZpw1Zh4nmKvytWq2vjdYlJZlmbDpatiO45blzVexSo6J8CdGpJ/r3/Jfht+NfQhSW
         LOtBc1iiEAii0nADT1I0ZZyiE9uk7n6kjhupE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=TYSvMCIPacqOphOa16rzA+X+0GuBxuIS4Qj5ygoV2IM=;
        b=R42+8XJR78K6lYBhWvjNSA6pdB+rSgDn+G3zJFOa4qBZkorkxcdlRHjjGlzS7Dy/YZ
         a4Xr7iEV6Xl9hocTx18J4QX4JD38y2Epit4slJwGEvjGiMs0fR9Bfc4vnbroSSvu9hp4
         h6ToYJ7w2jmN6UBYO9LL0Ay/mQyxo6EFQq4eB97QpjqCaQry8pbAoJspC5MEzyv8R7t4
         SAikJHPOvr5sljw5+7dhGHlEdTsSvOoiLcE09Tl1jwY+wuO8gqUUMy5w6ufG+SgZmpcn
         AD/Hidv7hKQtEDDIiL7YeUcfIKBm0lXB2f84G3VjYV+I8JjKYMqIvia9C4+yVA5ugMn+
         GYxg==
X-Gm-Message-State: AOAM531eQ/zvEoc/o6c2z8s6V86fE0RRMUMaLv84Oc4x4hCvmcS6DCha
        6wYPPTL0PITDgoMYvtZtkI3HhA==
X-Google-Smtp-Source: ABdhPJxCmb8Y1Km73TqeTEgYOkLH188D40vElREuf0w7ub9wbnNw7oCNpoGFosfaLftBUBdQlyWCeg==
X-Received: by 2002:a17:902:aa03:b029:e3:721:c093 with SMTP id be3-20020a170902aa03b02900e30721c093mr5267903plb.50.1613674006193;
        Thu, 18 Feb 2021 10:46:46 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:ec84:ed2b:a796:b756])
        by smtp.gmail.com with ESMTPSA id 25sm7127704pfh.199.2021.02.18.10.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 10:46:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
References: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: Drop limit link rate at HBR2
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Thu, 18 Feb 2021 10:46:44 -0800
Message-ID: <161367400432.1254594.2213007173465217655@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-02-17 15:09:57)
> Drop limit link rate at HBR2 to support link rate
> upto HBR3.
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
