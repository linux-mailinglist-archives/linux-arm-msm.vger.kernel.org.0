Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1800E31EF7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 20:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbhBRTOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 14:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbhBRSqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 13:46:34 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0513C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 10:46:19 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d15so1739631plh.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 10:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=drmiTJ2Rk9ucy2iYLORJ+griMgMAYYSsxQgICUqTnik=;
        b=eYcml0geDRNXaW610yxESdhDgqNum66QY8BF55CxpxFl117dd2xNH0RrujDY2e0r6i
         NnpiyX4SSmQDyJzHXIMsxQMgMnThVoz0pq1XsPVZw4a1F7l2jB8NHclRgXsXhhb1fxA4
         3p840Cnu4pcfmWr+yrIGQGHqDFBaJL+QTvWfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=drmiTJ2Rk9ucy2iYLORJ+griMgMAYYSsxQgICUqTnik=;
        b=SR965thFsi1rWSu2eRLogST8v89eVMnRzmmBvSjz/oATbl5ek/VYFNFUj6UykDF6OY
         IedThSWJPr59H20nOZxarO7n+tHpGabgvUOPPJrZ0wkfVueDh+tSZqjJpNFZTzXSbFWt
         INgLNJN2G4Ch4KK0UsvL08vOJ+xIFQYI9b5iLlSoUO2LRHxBo1r1UrnCz/zcpJ7+7LVE
         ziju9dWygpqtVh8BDvekmjAw5zpCA7zeiueisy3Iy3AvvBIzaAkxOGnH2+0wvU96y26F
         TfZoQKjkp0XthXILPYwZRW9aTgFjkEdlt1ku/a/AIppgNBt/OKNxCXKBTjRJqAKnM31/
         VIsw==
X-Gm-Message-State: AOAM5319FNDWawLN9xABz7swqS/5xEjVIsigXcnIppwpzWCj3T4dklYm
        BJVVWl8akufuo9C7kRXaIwhY0w==
X-Google-Smtp-Source: ABdhPJxJni7HMteZ57iewZ7//VvhwYQcbuDCtH1IKTW8sEoD3IMpcVitwBWi/yftGIPLZx0TCCVH1Q==
X-Received: by 2002:a17:90a:cf82:: with SMTP id i2mr5100794pju.209.1613673979305;
        Thu, 18 Feb 2021 10:46:19 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:ec84:ed2b:a796:b756])
        by smtp.gmail.com with ESMTPSA id b17sm6546618pfb.75.2021.02.18.10.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 10:46:18 -0800 (PST)
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
Date:   Thu, 18 Feb 2021 10:46:17 -0800
Message-ID: <161367397738.1254594.12158219605796616035@swboyd.mtv.corp.google.com>
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

BTW, the DP driver already set rates for HBR2, so does that mean this is
fixing the voltage and preemphasis settings for HBR2? If so we should
backport this to stable trees and mark it as fixing commit 52e013d0bffa
("phy: qcom-qmp: Add support for DP in USB3+DP combo phy").
