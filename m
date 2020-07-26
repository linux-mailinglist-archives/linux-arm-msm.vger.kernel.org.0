Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF0122DE5E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgGZLOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgGZLOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:14:47 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC912C0619D2;
        Sun, 26 Jul 2020 04:14:46 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id g7so5953879ejw.12;
        Sun, 26 Jul 2020 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E9EGFqYKJoHtN1vttGMeBEPR4ruaGTsfRMrn5QGqgiw=;
        b=aDW8egOYbAVz8osrTWCLY3P8ADzpkz3hIg1mOiA/H7TNust0BnPHOssdUnI1Pt1h75
         GOBdDv3Iu6H7lqjhIW8FYLTWeFHo+475OvfJUVG1ulq+kYrRbU743jzJDTidJLS/mvAw
         m0OuK8JdT1iieR2kWtaen3xT8WoqTsC6yIw2I+ViNiEcdfNwTXUgJf7omtp6yASm71Zd
         gdeOzbA7RMczK+91LvdK6Z/lThOaJCTVh7iY1QDKL+NIMfJ+bOVnxvRG/iuD89xbZocz
         akYj1cVgbVefz8VHi/CspmFC/voH2IAOYY0+wzOO5fvALTQP9nU7lCMqKyS/vhFDUMjC
         I35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E9EGFqYKJoHtN1vttGMeBEPR4ruaGTsfRMrn5QGqgiw=;
        b=H6PLqnJeZhCwScMYbjBRRqqVXAwxaYCbdK/GTWtXYrEMviO3BBdSgg8m8ugC+uNVRI
         rnCKdfC6HNvC3904TqhmqxlmNH0U/3gAQB8ACY6QmA96/BqFZmLH/PiHji5fK2aunkkt
         f5Nee+x648p5hkwn8FQPV4yqQtgfB68Y/jw+VUwAc52V/KcH/1IjvecsIq47JvLN6wA4
         1Dru8uTPGhR5wBFOjTV8FrF8ZwDbuYyadfA/t1kQjIu48tCpjyY/0J8BlYmkfE9PUeaG
         kWw7rwCn/XQdZ/Sb+bhajEGxVQxMc8rsB8APzgAyW54potpfJ8ejDz5W0VmlIVkW4wb1
         5hzQ==
X-Gm-Message-State: AOAM532XUhZzdJllXkMO4eMfpOjLf8/V5NfzCJCdHfyiRUzwiJDZFQaY
        p1tmFgq0GY3YYPliv3KZaiI=
X-Google-Smtp-Source: ABdhPJxSxwiSj+5a2uWaGNSlVTdNUs66Zu5uEa23SsoImBiEOoez2f61gt80TRSbu75LHe82bcTkUA==
X-Received: by 2002:a17:906:6bd9:: with SMTP id t25mr5077049ejs.250.1595762085690;
        Sun, 26 Jul 2020 04:14:45 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:14:45 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     martin.botka1@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 8/9] clk: qcom: gcc-sdm660: Fix up gcc_mss_mnoc_bimc_axi_clk
Date:   Sun, 26 Jul 2020 13:12:05 +0200
Message-Id: <20200726111215.22361-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing halt_check, hwcg_reg and hwcg_bit properties.
These were likely omitted when porting the driver upstream.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/clk/qcom/gcc-sdm660.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index a85283786278..f0b47b7d50ca 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -1715,6 +1715,9 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 
 static struct clk_branch gcc_mss_mnoc_bimc_axi_clk = {
 	.halt_reg = 0x8a004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x8a004,
+	.hwcg_bit = 1,
 	.clkr = {
 		.enable_reg = 0x8a004,
 		.enable_mask = BIT(0),
-- 
2.27.0

