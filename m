Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDC32714E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgITORK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgITORK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:17:10 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C876C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2020 07:17:10 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e23so14247849eja.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2020 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FMcTfB8bTNiA4IO/9hnI5vPpMpLqnjxtoFBZxrk7cE=;
        b=HmmNZIZZZaq+HVtTbpnhCSx2GGWeZBSkgDQD/ojGBX936B0rBnQrBVe6a2jwUBD/id
         AEfc0Advl1q8swChQgrrhZ8gJZWT+faIQ0qGqMEv6Tf8RzPn+sefcdbWUDA5UgDdo4qe
         kAV1v3RLqfMmCzB/wFc/Sokc1OsRVn6Fnaqfq9SsLsHtseK02ygfBrtAcyvdCHTzTa6b
         OgSJptZy0z58441qrpTmGXgw5NmIRIp+YepIvq6c/7eYU6XmJs3eIEHl+nY9bMw8r6Ck
         DXu+2EaFpk6W5HPx2qHkh10ALrfelFmWKJm+ASfUDGMTUkjxHcw5mpje/906twR4ANim
         7a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FMcTfB8bTNiA4IO/9hnI5vPpMpLqnjxtoFBZxrk7cE=;
        b=tsm8GpxqdII/EM33nYtAqq6Ck1u6E1mWOUSwAG8zt+DwAMC0SzTvr6J6iEIUZiEp08
         aBxwie7tj1qoet+rsQDZTjrX4Fjm/iYVWABi9UhyeZNRo1pGcIfXu6jIVXuodQXr2yhS
         lP3GRNQR0Cy15aFzUslQQWUNAG82EzzkH1Pc/22yXyQcDmet2Q5fmUlonN8hlX1ZQ42Q
         6AWQPCcmHAESTWARz+7+onaAC9a0DBvBb2OWHtZey94sTm6qrLSoI2yDVYG9O0IHk4eg
         KPgEqpDcrYPm/M1UhWQc6MYTgwv+quPlOugj0/ww/Fr0etOOzIXjahqb6EQn7v33CGok
         Xy0A==
X-Gm-Message-State: AOAM531+ODFkG+roOibWsanNeg1HEbbda7TI+hN1lyL9tpU39uysY1cs
        1SCQcxUYE35bI1dR9fRhny8daw==
X-Google-Smtp-Source: ABdhPJx0dxb5cXtiOZJrCkM5emj4ROEkQ/MFc/4rDyfqAef1IS06joaSvNmlbdT/jHmvQ4+Do4m39Q==
X-Received: by 2002:a17:906:358c:: with SMTP id o12mr44535867ejb.406.1600611428669;
        Sun, 20 Sep 2020 07:17:08 -0700 (PDT)
Received: from localhost.localdomain ([88.207.4.31])
        by smtp.googlemail.com with ESMTPSA id g11sm6631594edt.88.2020.09.20.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:17:08 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 0/2] net: mdio-ipq4019: add Clause 45 support
Date:   Sun, 20 Sep 2020 16:16:51 +0200
Message-Id: <20200920141653.357493-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for Clause 45 to the driver.

While at it also change some defines to upper case to match rest of the driver.

Changes since v1:
* Drop clock patches, these need further investigation and
no user for non default configuration has been found

Robert Marko (2):
  net: mdio-ipq4019: change defines to upper case
  net: mdio-ipq4019: add Clause 45 support

 drivers/net/phy/mdio-ipq4019.c | 109 ++++++++++++++++++++++++++++-----
 1 file changed, 92 insertions(+), 17 deletions(-)

-- 
2.26.2

