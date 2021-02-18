Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B565131EF7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 20:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234075AbhBRTPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 14:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhBRSsb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 13:48:31 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1123C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 10:47:51 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id fy5so1869383pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 10:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=SrWkpH+CO1wfSR96KNwtdIL5OuOODELK2JmN16U+XVg=;
        b=XQKKD7BBqVn2CsK6kUWPZUaA/WgnCpE/YBpwaKt9vcgWPetxH12wA8wHaXh0u+0XQY
         yuKyiURdcPZ20Uq1yRM/yTemDFqnPZwI5bd92wd3mrBTaRkVyWl4oWNo5/tI1pHCXQV5
         WBYNR/F9cF6lp9EY0O/H7ZjZekOY8TD/q9cuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=SrWkpH+CO1wfSR96KNwtdIL5OuOODELK2JmN16U+XVg=;
        b=jLIlJVD4mkcH11OnYe3AJAOUeH3glg5uMxPfR6Hz5Yg3/Mz9NA1lmOqpd0/OOBUe4E
         ZrqJhTPMotcpqDjFAx2M0xqsECr+goC9YcqkAMVtj9UDZlNL6TaVgXuYppjN60UKoRG4
         vE5G/Cf9Oo7Wy7VEzdz/M+fB6iAv1OaEu+CUk8FH8FMt3CefUEyvA/rVHC/CXQ2kPnHf
         z2tipwSsq/iBCwhiziudMKdgizyQ1YVK0YHXLY/ckrHFxOEpejoROCGWkhOQhWRIUGLv
         xT0PPz2ESGlgjQfrLbapz/yjg+vQS/8b2udtGzkOZ5aZjlBllT3RA60GbQQQBghTGjlC
         SU4g==
X-Gm-Message-State: AOAM531o/0lw9J+ZwnFi5UYV2AK2iRUkwbuB3cCM00ooad4E7oFPIi0x
        T6dpdt4F/9HKe+YLxG9857gNMw==
X-Google-Smtp-Source: ABdhPJwkdDRQgR1I1W5rAxTmDsryoOKkMtUQzbipYuuMcYoavBbqaTwH2DwHVVpaantON+g3zUGnCQ==
X-Received: by 2002:a17:90a:7286:: with SMTP id e6mr5348771pjg.117.1613674071333;
        Thu, 18 Feb 2021 10:47:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:ec84:ed2b:a796:b756])
        by smtp.gmail.com with ESMTPSA id z10sm7195814pff.179.2021.02.18.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 10:47:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613667070-27613-1-git-send-email-khsieh@codeaurora.org>
References: <1613667070-27613-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 1/2] phy/qualcomm: add hbr3_hbr2 voltage and premphasis swing table
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Date:   Thu, 18 Feb 2021 10:47:49 -0800
Message-ID: <161367406952.1254594.6274695772092571717@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-02-18 08:51:10)
> Add hbr3_hbr2 voltage and premphasis swing table to support
> HBR3 link rate.
>=20
> Changes in V2:
> -- replaced upper case with lower case at hbr3_hbr2 table
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
