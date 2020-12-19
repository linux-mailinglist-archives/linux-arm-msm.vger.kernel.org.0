Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB59E2DF24A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Dec 2020 00:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgLSXtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Dec 2020 18:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgLSXtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Dec 2020 18:49:24 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC402C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Dec 2020 15:48:43 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id f14so3675484pju.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Dec 2020 15:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=lz9YDp/n6+D9ZU/TQdjUVMm9OIrDGID6xjvbAP+dJHs=;
        b=fg2uDFP7XH5zgixpmeRZ5a2mXEnhVuFWuK7PVlkSFf/dkcj1k1T0AsjWNfWs7nHaRE
         am7Mom+wBACQ9hQvAbvg8GHLvjTgk0IJUi54VUMLVw/K5sVgFUKeaTBYZhJ4WWOYYLtl
         D3lXdMUd9KWy7WN7pMm4IIeo9L2//XJT/4Y+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=lz9YDp/n6+D9ZU/TQdjUVMm9OIrDGID6xjvbAP+dJHs=;
        b=b4oa1ThM3XsDU8hI/zxRHVxcZfZxx0D/6z61ZujhrZVobQqhdihm3UYPbY4BdOeKxN
         c9lujkvf1LL2xhebT8Qm6Cvzo5c1EtVhbFN/clJOtuhnQWw4N58Etof4A0EOfetWJWCI
         ZXoOQRMwT1RkWMhLvHMkXUbveYjcqEpAQaJHk9YqanndHA8g3wAIfgRGkbw5i2MTI75Z
         4Uo0DaqrR235eIgOG8cy/bSUcRNSfooWpjBttxjcNSM9a/YhUiLdk0xofpUans+GLtxD
         kjCipkj75LFK4Na/VUag8lZVUQO5Xhz9cQIpfv0Jotovf/lAsVx0pLibXyDNHTgvnGHb
         k9gA==
X-Gm-Message-State: AOAM530oYZop7iddADgv+Ect8H2DYIerLnC3MZgvtGacf2xwwOkvt3/k
        0+OQfvQ5OuoG+ZqNBYWUVmjPxg==
X-Google-Smtp-Source: ABdhPJzOu10VeutaRZsFvKzbci9hp2oYAh5l6d+8nid01FXFWSV6jEtxcB6XPIaFM9M4SBs+8ujGqA==
X-Received: by 2002:a17:902:302:b029:db:fa52:2dd2 with SMTP id 2-20020a1709020302b02900dbfa522dd2mr10604213pld.62.1608421723603;
        Sat, 19 Dec 2020 15:48:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id j3sm11172815pjs.50.2020.12.19.15.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 15:48:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1608279292-24760-3-git-send-email-kgunda@codeaurora.org>
References: <1608279292-24760-1-git-send-email-kgunda@codeaurora.org> <1608279292-24760-3-git-send-email-kgunda@codeaurora.org>
Subject: Re: [PATCH V4 2/2] mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Kiran Gunda <kgunda@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, swboyd@chromium.org
Date:   Sat, 19 Dec 2020 15:48:41 -0800
Message-ID: <160842172171.1580929.13444601880930084508@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kiran Gunda (2020-12-18 00:14:52)
> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
> found on SC7180 based platforms.
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
