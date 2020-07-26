Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1E922DE4E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgGZLON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZLOM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:14:12 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA3EC0619D2;
        Sun, 26 Jul 2020 04:14:11 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id q4so6842949edv.13;
        Sun, 26 Jul 2020 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LUfFfp9zNtMJeMOSyzmVf43tvY2MECImRif7MwVvOZU=;
        b=flI8fWplXeV4NqYt+NbEwfj6/P3nVa9YaeYrW7eNtfbviem/4HL5Inm0sQX/LU+wKu
         0EYMdvebZh9dh5VD0rEyMt13w/pU1oTvM8vCitMStOgAyl6YV6vbhbIGgtwyESO8mAYl
         BWGvAy0X92bxhfnFtBGMPzTJCVAydVjHWdk9mM7NepqofVqGRExYpoGWDz4Ijj9ukxss
         qeycSB33yVv2WWKCbv6TCh+AjydwDITQ3HRW7zbmC2cWNF3c1ligrz0H7F6m0682o7f8
         YRuhLNd+quOdIMZHNEF6720oEbEKchLgYltiAfv3C0O+aSQcoW6XHb/fumE7Gt8+NOfE
         6HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LUfFfp9zNtMJeMOSyzmVf43tvY2MECImRif7MwVvOZU=;
        b=WSxpMCb02GUQqvtNIabbFK/Z2C6BapwL0tmaWtQ4zfmlBHEJAopm2Zm9EYIj+h3bgJ
         hs/puu5m+AjHSe/9+wZno2+BxPGCXOd9vAnjitPxPNK27kJXF/2iy73x5KecRHyJxLAj
         d4Ph+c7HITaCk9dGujxdYt1X8dcAwZrJrZQvZwXiftRLJ91uu9FOVuRNzWLhOE+9yjd0
         OU7PMRozKFp+FPRDSbl9hW7d2rZpb8xTk5C27iFG9beUtIVZY1i3XygyucAFx93OlUTl
         E6/J6HMEWcypmzeNsm+NH7NFSjX41jFdww/YFggLQDNvqb2GjJe1ZsIfSTmLAtyAybVd
         grZw==
X-Gm-Message-State: AOAM531/azrtaK7qE5SaLEovWhkXUoghwYh7OKhZ1Tn+AdyfafvPm15I
        FLyztBI3g3zbyJhG66RS3Zc=
X-Google-Smtp-Source: ABdhPJw5Eyc80VzfIucZdXtXwLwr8WKxsrf9o44YaVyHILn/zuotPfHFiHAb5I1Q8FGys+Yp0R07GQ==
X-Received: by 2002:a50:ed89:: with SMTP id h9mr4636525edr.331.1595762050104;
        Sun, 26 Jul 2020 04:14:10 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:14:09 -0700 (PDT)
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
Subject: [PATCH 5/9] drm/msm/mdp5: Add MDP5 configuration for SDM630
Date:   Sun, 26 Jul 2020 13:12:02 +0200
Message-Id: <20200726111215.22361-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for the MDP5 IP on Snapdragon
630. The configuration is different from SDM660's, as
the latter one has two DSI outputs.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 25a13a2a57a9..2e02de8a7e41 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -910,6 +910,98 @@ static const struct mdp5_cfg_hw msm8998_config = {
 	.max_clk = 412500000,
 };
 
+static const struct mdp5_cfg_hw sdm630_config = {
+	.name = "sdm630",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_CDM |
+			MDP_CAP_SRC_SPLIT |
+			0,
+	},
+	.ctl = {
+		.count = 5,
+		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
+		.flush_hw_mask = 0xf4ffffff,
+	},
+	.pipe_vig = {
+		.count = 1,
+		.base = { 0x04000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SCALE	|
+			MDP_PIPE_CAP_CSC	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_rgb = {
+		.count = 4,
+		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SCALE	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_dma = {
+		.count = 2, /* driver supports max of 2 currently */
+		.base = { 0x24000, 0x26000, 0x28000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_cursor = {
+		.count = 1,
+		.base = { 0x34000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			MDP_PIPE_CAP_CURSOR	|
+			0,
+	},
+
+	.lm = {
+		.count = 2,
+		.base = { 0x44000, 0x46000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR, },
+				{ .id = 1, .pp = 1, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB, },
+				},
+		.nb_stages = 8,
+		.max_width = 2048,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 1,
+		.base = { 0x54000 },
+	},
+	.ad = {
+		.count = 2,
+		.base = { 0x78000, 0x78800 },
+	},
+	.pp = {
+		.count = 3,
+		.base = { 0x70000, 0x71000, 0x72000 },
+	},
+	.cdm = {
+		.count = 1,
+		.base = { 0x79200 },
+	},
+	.intf = {
+		.base = { 0x6a000, 0x6a800 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+		},
+	},
+	.max_clk = 412500000,
+};
+
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
@@ -924,6 +1016,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 
 static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
 	{ .revision = 0, .config = { .hw = &msm8998_config } },
+	{ .revision = 3, .config = { .hw = &sdm630_config } },
 };
 
 static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev);
-- 
2.27.0

