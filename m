Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E9529702E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 15:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464438AbgJWNTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 09:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464435AbgJWNTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 09:19:34 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46235C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 06:19:32 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 184so2057687lfd.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkX+2gUi+v8i47aSHUAizP4Ds7j6F45LzqwxJroTws0=;
        b=Z/wgNcMVhdp16LL6ZQWvlDZnxOeAJfCVSNOty5uKbdAEduIs6JIxbsHZjQGYzEj6l3
         jkeG3UWtq+oKNGjCG9KbQ3Urh1wRg0MhHk7Fh2zYs04JRPYhJYyrXSLPHYs20OVMxavl
         3YPCChAk4MYNJlbg3JjhmsQwJdWz7/ZmuLfiLuaIGsd5cWraWsbvT5CJMt8ghcffBWtb
         EZXtNnvx5aSGkmQgzBt2Dk0VVnL7v81RhtonwfPXAyhOYNnNy0crJv0jAa78+5xNrYjK
         SH1jU5oVP5lmL7lqvkuGR0tjyMBk0gAk1xJ2wN05kYTqppe9nnIugZsqpKVB7uyQPlir
         tlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkX+2gUi+v8i47aSHUAizP4Ds7j6F45LzqwxJroTws0=;
        b=HBVhPbSogJAIV82FSGEAs5zLUbAMed+P08zO48eKZxfJ3hIDWfWTrR0NM3CXoc8H/M
         BpPrswy0xk9bbHkHYNkg4tjvRnBaRwU1GL6JCcJSxOVIb5NdC/ASr7yeHDrMc1D+hf55
         hLtlnWPwCr5g8JiKAqcI2cnea042PFww4eaVy3nxQRJl8SeDmgYOA1RObwIKh2nMtcRV
         IN8mjbA2yy3FS99lQ+wOUl9DBXnZIyDyw6jb8jttHrdhjxUiXrs7Rz7zpuNAy8ym00iG
         3iASI0BA/gc+vGEZZfTessukktF7Eig5R1izAiBp1iwMz0ECHXBSsDV2uCFlpdcErkEt
         j7cQ==
X-Gm-Message-State: AOAM531COzE9SOYNLmd67iQf41/SMMNE74p0i3SYFAMKkqMjCBMxNlh4
        O3u2KOLErZGD1nkPVsCDCiJS7A==
X-Google-Smtp-Source: ABdhPJwKRS1l0bWn+x3x3WMk7PvtBibC5R1oMkR5S6y7F7XYMl6I2GvcgR+rbri7PKkeVqIUDRgk0A==
X-Received: by 2002:a19:c8d6:: with SMTP id y205mr715023lff.293.1603459170604;
        Fri, 23 Oct 2020 06:19:30 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id o22sm161564ljg.122.2020.10.23.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 06:19:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] 
Date:   Fri, 23 Oct 2020 16:19:20 +0300
Message-Id: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 MDSS_GDSC (and the rest of display clock controller) is
supplied power by MMCX power domain. Handle this link in GDSC code by
binding the power domain in dts file.

This patchset depends on [1]

Changes since v1:
 - Define fixed-regulator-domain regulator using power domain
   performance state for enabling/disabling.
 - Rework to use new fixed regulator type (fixed-regulator-domain)
   instead of controlling power domain directly from gdsc code.

Changes since RFC:
 - Fix naming of gdsc_supply_on/gdsc_supply_off functions
 - Fix detaching of solo gdsc's power domain in error handling code
 - Drop the dts patch, as respective display nodes are still not
   submitted to the mailing list.

[1]
https://lore.kernel.org/linux-arm-msm/20200927190653.13876-1-jonathan@marek.ca/


