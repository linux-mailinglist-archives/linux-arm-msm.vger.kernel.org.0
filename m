Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43E71C49C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 00:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgEDWnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 18:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726530AbgEDWnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 18:43:17 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A6DC061A10
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 15:43:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x25so79241wmc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 15:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lUmbEdvnWPeUk4t6giKyfyBVYwPjBnJKNQQQsbV/urQ=;
        b=GFikycEtJDisqtrSKLOaeTLwYYqS8iklzvNquIP5B5vdHasLq78Y4fBa8X8qpC5H7g
         gqqaMWqgrbsNgOTtvFu6oA/7VnR85SMwZ2fim/BfEHlT8rs69qrgGB7k6XcUJKwWOOzg
         xlmpHXkTXwyl8HepS+SN76+25+yos6OXavMhD+ICCX/5gMj+/USH8Yxgoes4aHVI81cU
         IPyvJuuT0K13qy7WHNjYagvNH1GdowW4IOevVQtCJvofInfMp96fDc76YD/4uBawPNvv
         JzYJh5KWrI9mFaLIyaFrkONd18yxbxFIaoXb//FHsT+lhEaEr3zmcgr/xWCbWWCcwyKz
         zRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lUmbEdvnWPeUk4t6giKyfyBVYwPjBnJKNQQQsbV/urQ=;
        b=rTTU67t0sC5kWGWMwyEk8oOWZOBcDNttFedDVxG6GgNG+vs1KT7cogGKhE43A5awnS
         1FpjD20JkixW0A/aF8MN7Cp5YaHCMhQlhj2OaxQoCngnU74cjlFtCCFuZSJwb6B63uhi
         MKzO0lli+JZN194dEdKZR2sMC2qpf1xpvFGWAwoRywFed3SxMkgCmb4z/VTohSKGRIx4
         AoMt0YiR2V6zUo3JjRc4jTzwjZ9F5xqGJYI9KKwJAbeznLtHqLok3R+lOT6Gt6PZyYir
         0bTn1JluxACfTdL/7XT4oxEWRk0z2OdcmYkQZlbQnsUGJtA8k0rL/5D41XRoJ3+3G7Jx
         UfPg==
X-Gm-Message-State: AGi0PuYl7h1GzuAF+dGQ5hAZrRerQjdbQ31OKSvoZ0WuTAefsQVZIISX
        mJlVIv7MCJKVO7A0Ow1K5H41rAxodWw=
X-Google-Smtp-Source: APiQypILeXJRTqVe0dXJOUkSfx8nfwQF9nbbhp5olaJiEfZQKtxHmC4CXqx0a2GkR9492iGwqFfm/Q==
X-Received: by 2002:a1c:7fc6:: with SMTP id a189mr16700521wmd.27.1588632195175;
        Mon, 04 May 2020 15:43:15 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a13sm13895888wrv.67.2020.05.04.15.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 15:43:14 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 1/2] usb: chipidea: msm: Ensure proper controller reset using role switch API
Date:   Mon,  4 May 2020 23:43:45 +0100
Message-Id: <20200504224346.613377-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504224346.613377-1-bryan.odonoghue@linaro.org>
References: <20200504224346.613377-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently we check to make sure there is no error state on the extcon
handle for VBUS when writing to the HS_PHY_GENCONFIG_2 register. When using
the USB role-switch API we still need to write to this register absent an
extcon handle.

This patch makes the appropriate update to ensure the write happens if
role-switching is true.

Fixes: 05559f10ed79 ("usb: chipidea: add role switch class support")

Cc: Peter Chen <Peter.Chen@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index af648ba6544d..46105457e1ca 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -114,7 +114,7 @@ static int ci_hdrc_msm_notify_event(struct ci_hdrc *ci, unsigned event)
 			hw_write_id_reg(ci, HS_PHY_GENCONFIG_2,
 					HS_PHY_ULPI_TX_PKT_EN_CLR_FIX, 0);
 
-		if (!IS_ERR(ci->platdata->vbus_extcon.edev)) {
+		if (!IS_ERR(ci->platdata->vbus_extcon.edev) || ci->role_switch) {
 			hw_write_id_reg(ci, HS_PHY_GENCONFIG_2,
 					HS_PHY_SESS_VLD_CTRL_EN,
 					HS_PHY_SESS_VLD_CTRL_EN);
-- 
2.25.1

