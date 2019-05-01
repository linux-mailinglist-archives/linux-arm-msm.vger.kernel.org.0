Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF0A0105E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 09:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfEAHjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 03:39:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43326 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfEAHjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 03:39:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id t22so4987834pgi.10;
        Wed, 01 May 2019 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=TY9nANZTsmFVcCEMn85U2AmDbTx1OVF1fP/JuxE6pck=;
        b=L/RKIVSWyF8E4KtcOIV387q6/Tb86laQX7r3pD8SEuiLby2nB+ssYbl2j3oWjXg516
         evecBrJyE4S8sG0P2qInrFLGWFURALtdaL3J1DRk2l3BJc4LNjtc5i9y+rAnQk3XTa5b
         D7ZjAya502/1Y89T/nZqe9m3yinY+GtZg6fY/VQh1+ubllLlFFC0LTe9wg5+q8tvLIeU
         IsRgfcvWsZyrpflV6O2BI7MqTjgRVCQKSt5Wfg45WEk4HQ8n12s9K3u/uVSLsE6FyP/v
         DEPJxkvrLYXvEVftwxV84HWy7W15Uih+qDnYDzuP5muEopHSgllaxvtTl2M4DjDBHwd9
         JbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=TY9nANZTsmFVcCEMn85U2AmDbTx1OVF1fP/JuxE6pck=;
        b=V0w4++SdTsivfTBq1H2U6tolkkaHfekdLNva+awZtWOmNDt5iMTqXotqIpya2Pn+Ri
         Ob3yCbDfMKXJhYSMFTGce9OM/2czpiI9HaVSJd0PaPrYL1bYFQibbsOExm98RXCGzfTe
         svphFNQ5dVAVTSbL3vE2o/f8GwVhrSLaz9xzCT3BHa0FVKV8+fVO39qRfj5S/U5qBCx6
         D02xIQ5FbRlLR03EmjhrTb4sikDsFNy9p660dIXGzpuXRgEcq6IsvF475x0qnQ0ErDqW
         VV+EF165NCb6/oKDALvQ6RTi+/sTcr519HDlN3ZjPklKetk4gNqFo4WHescOf6t/ZbOD
         Xelw==
X-Gm-Message-State: APjAAAX7xuucLVJGtEDpn+Ul3D/Tc/3gjt7spwAQSxfoHLsnAgNz4vu1
        s/rIW/T6Awbh+afpwiK7/Tg=
X-Google-Smtp-Source: APXvYqwOkqeKyBWwXnCc2ePCnLepyeUhDiRTUrFqALdmmw1N9z2v+VQh9bPszUu6ke+HkIJjXYGs4g==
X-Received: by 2002:a63:28c8:: with SMTP id o191mr30982923pgo.164.1556696384089;
        Wed, 01 May 2019 00:39:44 -0700 (PDT)
Received: from nishad ([106.51.235.3])
        by smtp.gmail.com with ESMTPSA id f87sm65341453pff.56.2019.05.01.00.39.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 00:39:43 -0700 (PDT)
Date:   Wed, 1 May 2019 13:09:36 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: Use the correct style for SPDX License Identifier
Message-ID: <20190501073932.GA6925@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch corrects the SPDX License Identifier style
in clk-regmap-mux-div.h. For C header files
Documentation/process/license-rules.rst mandates C-like
comments (opposed to C source files where C++ style
should be used)

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/clk/qcom/clk-regmap-mux-div.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-regmap-mux-div.h b/drivers/clk/qcom/clk-regmap-mux-div.h
index 6cd6261be7ac..4df6c8d24c24 100644
--- a/drivers/clk/qcom/clk-regmap-mux-div.h
+++ b/drivers/clk/qcom/clk-regmap-mux-div.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2017, Linaro Limited
  * Author: Georgi Djakov <georgi.djakov@linaro.org>
-- 
2.17.1

