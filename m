Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF870349CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 00:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhCYXLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 19:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbhCYXLk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 19:11:40 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D332DC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 16:11:40 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id u19so3324127pgh.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 16:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7EhGfRcda9+R8F5eyr5st5BeQoQcEZfpRk295f4+oPY=;
        b=PdjVScbTOPxtkn5pnGM+YV+iInZ5mWtI8Fod+LRhPAO6GU1Nu9kAfHAbNNc6ekNKmX
         rKXPSQUF6nibC+uuZ/2cecLdHo2a/Wdbfxo/M0+BSO3SIcaD2T1niCQA8ShhVKZQFQxm
         b2cbAssCnDK1V56/iNMF7fYgpylgLUIt8lpGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7EhGfRcda9+R8F5eyr5st5BeQoQcEZfpRk295f4+oPY=;
        b=mVI854nKwHNfUFxirm3CYMDsNJ6D4fp60seUBG88pLSEVulEG10O/YSmP8mNF9LOd0
         DOeSSN8KZwd4+qX1T06oL41KXWvs7Zq9S+Hu0JEwfiEu//W4mAdpuHyENBB0UtHJ0as9
         cNk358x8FtypZdmwiHyiUXv6qyHE7KU9p+QvljaF4Z5SkkuxFRQG+CqNMha39e7kLsVU
         ssRhNydFN+za00eSwKhvPpBnZlFYNKpSRSH0MxWvAc4ul6NV4k//oXgeiq5EhQhFAJPM
         rA2Gtt02VfhkQmsaNC5r9724it182Y+/CWi9OdBKF8e0JW/ch1y3tsveOqJg+vAZE0tE
         RNnA==
X-Gm-Message-State: AOAM532ho1WVw0MhLnDt9ecniGwejcqrgeQE0LMa6em8plK+ysxgT5xU
        tIckl/WRkththpKBDge1re1hrg==
X-Google-Smtp-Source: ABdhPJwnAa4W2tM1hkxWZ27yI+AFX6HsKIGxTqos175oxD19hZnwRy2JpGjUUegTrTdE/2vBR6+T6A==
X-Received: by 2002:a17:902:a606:b029:e6:4c7e:1cba with SMTP id u6-20020a170902a606b02900e64c7e1cbamr11926509plq.46.1616713899396;
        Thu, 25 Mar 2021 16:11:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id u84sm7197451pfc.90.2021.03.25.16.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 16:11:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616673661-20038-4-git-send-email-mkrishn@codeaurora.org>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org> <1616673661-20038-4-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v14 4/4] dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Thu, 25 Mar 2021 16:10:34 -0700
Message-ID: <161671383428.3012082.66029461211202843@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-03-25 05:01:01)
> Add bindings for Snapdragon DisplayPort controller driver.
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
