Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2D827FA29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 09:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731541AbgJAHXF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 03:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731485AbgJAHXF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 03:23:05 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CACFC0613E2
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2020 00:23:05 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id p21so1205707pju.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2020 00:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=HFfTzcwSmtGWxgIKee+Dj7d8RurFzb7N6ubYGXPavGQ=;
        b=FP+g3BbhvGlC71ZabrM9wCUIblp7ngkOosLX43RbEBu0VODY69oeFBfzX6vTifS5iN
         LW5SsMbUt40x48/v/03CvlB25K+2wvi1iQwdxCuBhwkG/ug9t1/Pne38ZgMkk6u7FJ9H
         f6NsR9mmgQn97qBWsTNXc9RXRPzGXCzgjYLDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=HFfTzcwSmtGWxgIKee+Dj7d8RurFzb7N6ubYGXPavGQ=;
        b=J2vm5r0u9f1xSf86Kg1qE4MJJvmKZ8QdmoPkhC9ZxTs8FkbX96QfgjBd6tllVK9tR7
         lqYV6WSZO9iOvIzcDEOJtPb6nKVPJs7VFoND8A15xKcJlUhFzTAw/gOx0RoCr8vdIacv
         3TBIq/liesQJkz4Z0LOSLxu8w2kBNYYMrooig21QHdTd/sSjX6huVTTplyQDSozpsv5/
         3z8mZwNiAyWCWUaNCyasvMGY/WKkKW+PZIMal9sxhmtCaXzx8Bsh+/rZBb58mjuc2DVM
         QEO/yToYZEgvVwcMO+u6ZG6vYH9YovHCqWiSPpsosoqJYnrjU1vv4cppL0Pyogbo6Ov9
         7MeA==
X-Gm-Message-State: AOAM531CmhrDAWhl5B7Awcte6byEqQ4RuB3e/QsRy9dstdPmtVop4E8K
        DSFHWpad8rKGMR2wb9+Dr3fVmg==
X-Google-Smtp-Source: ABdhPJz3hK3FgipeDo6OE/uXiww5qzNnD2Rh2LHM6pUTlzhcf7my6CGtZgvIdg+GdfxAAi6+8MdteA==
X-Received: by 2002:a17:90a:a512:: with SMTP id a18mr5885332pjq.30.1601536984724;
        Thu, 01 Oct 2020 00:23:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id k28sm5130625pfh.196.2020.10.01.00.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 00:23:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201001070911.140019-1-vkoul@kernel.org>
References: <20201001070911.140019-1-vkoul@kernel.org>
Subject: Re: [PATCH] phy: qcom-qmp: initialize the pointer to NULL
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Thu, 01 Oct 2020 00:23:02 -0700
Message-ID: <160153698271.310579.690982928498545843@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-10-01 00:09:11)
> Smatch complains:
> drivers/phy/qualcomm/phy-qcom-qmp.c:3899 qcom_qmp_phy_probe() error: unin=
itialized symbol 'dp_cfg'.
> drivers/phy/qualcomm/phy-qcom-qmp.c:3900 qcom_qmp_phy_probe() error: unin=
itialized symbol 'dp_serdes'.
> drivers/phy/qualcomm/phy-qcom-qmp.c:3902 qcom_qmp_phy_probe() error: unin=
itialized symbol 'usb_cfg'.
>=20
> This is a warning but not a practical one as dp_cfg, dp_serdes and
> usb_cfg will be set and used when valid. So we can set the pointers to
> NULL to quiesce the warnings.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo =
phy")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Thanks!

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
