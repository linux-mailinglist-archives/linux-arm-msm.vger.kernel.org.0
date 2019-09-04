Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11DA9A94C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 23:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbfIDVP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 17:15:56 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51260 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfIDVP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 17:15:56 -0400
Received: by mail-wm1-f68.google.com with SMTP id k1so316214wmi.1;
        Wed, 04 Sep 2019 14:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dxs4Xmn14Ti3jSgpkVxzxzwg3rZgGyhdBRyDXWQ1X6k=;
        b=LjvjwT5oZwcFzZGrEpF0CjtQsd3HtOKG/33/xQR71ZQPwHOoTe774LhAF84EkQS4m0
         tpC8rlsKBJKRELBRH//hru/A6+MI1oS4uxB+0Hzl2NvpWLL5ff8rfnw60mjY+8NRbUVW
         wyMUQS3Yfy6EQn4YQFaa6iV3NK2cxGYd2V61dkWUdMcKy/gb2HdmcLrzoZxqYhb8DZ15
         fKnEm2OcVI6vpGIqE6aEcB/WVQ5Jr+uEM7jiDaDzVdZGzEXLevuBBsqFV1Dq6jMElZ5u
         JRrQsjHB0ps1F874d62Mf14JCYIvL5LMH1TGRmgouegKZdEW5AU6YlmVyC/lgVpsjCuK
         JyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Dxs4Xmn14Ti3jSgpkVxzxzwg3rZgGyhdBRyDXWQ1X6k=;
        b=DTKSdofL4mm7d/fZhY85NjWPULtSJytQO3azdN5kWQVasJMjQhAADBq12ptrZE7vmA
         qk99RW/o0yAPWhoQ31MKAQ1m05hRIkcYphfB8B7zuhUhR9JeXNvM/rEYZ9srrrRGnoPM
         djd7vAuMdKQ4DF/ig0jPH8yea7bSC//qk2uAsBWzL2Np33e/QaBrTB+2XWSsiPPBsoFx
         XdxlhyglCFdceQ/l5sz+WKGny7R4qMiiPDS0/EelkgGwyB2a7L6LHDdKVdpx4jwgDwYX
         cZfuJNMs4C6wf+P2ERgIOC0c6mA6wSHOGdrlJR1x1LMjJSJAGKGb6oEPCmkhSWalCOLN
         4B/A==
X-Gm-Message-State: APjAAAVg0htJzi2Qdia8xreBDTQiH94IiQ2v1ThpMJ2TyRrYIlUj3K0N
        zQZLggSH/Tc6CQMB9Cfkrec=
X-Google-Smtp-Source: APXvYqzrb9vggbAwpQr2Dks5C0st9n10mD88uNXH+VICsMg+OfF85dbySpily4o4x8blq3AEb63FBA==
X-Received: by 2002:a05:600c:214:: with SMTP id 20mr234250wmi.112.1567631754197;
        Wed, 04 Sep 2019 14:15:54 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de. [91.64.150.195])
        by smtp.gmail.com with ESMTPSA id u83sm5822743wme.0.2019.09.04.14.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 14:15:53 -0700 (PDT)
From:   Krzysztof Wilczynski <kw@linux.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: Move static keyword to the front of declarations
Date:   Wed,  4 Sep 2019 23:15:51 +0200
Message-Id: <20190904211551.10381-1-kw@linux.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the static keyword to the front of declarations
of msm_dsi_v2_host_ops, msm_dsi_6g_host_ops and
msm_dsi_6g_v2_host_ops, and resolve the following
compiler warnings that can be seen when building
with warnings enabled (W=1):

drivers/gpu/drm/msm/dsi/dsi_cfg.c:150:1: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

drivers/gpu/drm/msm/dsi/dsi_cfg.c:161:1: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

drivers/gpu/drm/msm/dsi/dsi_cfg.c:172:1: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
---
Related: https://lore.kernel.org/r/20190827233017.GK9987@google.com

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index b7b7c1a9164a..e74dc8cc904b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -147,7 +147,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.num_dsi = 2,
 };
 
-const static struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
+static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_enable = dsi_link_clk_enable_v2,
 	.link_clk_disable = dsi_link_clk_disable_v2,
 	.clk_init_ver = dsi_clk_init_v2,
@@ -158,7 +158,7 @@ const static struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.calc_clk_rate = dsi_calc_clk_rate_v2,
 };
 
-const static struct msm_dsi_host_cfg_ops msm_dsi_6g_host_ops = {
+static const struct msm_dsi_host_cfg_ops msm_dsi_6g_host_ops = {
 	.link_clk_enable = dsi_link_clk_enable_6g,
 	.link_clk_disable = dsi_link_clk_disable_6g,
 	.clk_init_ver = NULL,
@@ -169,7 +169,7 @@ const static struct msm_dsi_host_cfg_ops msm_dsi_6g_host_ops = {
 	.calc_clk_rate = dsi_calc_clk_rate_6g,
 };
 
-const static struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
+static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
 	.link_clk_enable = dsi_link_clk_enable_6g,
 	.link_clk_disable = dsi_link_clk_disable_6g,
 	.clk_init_ver = dsi_clk_init_6g_v2,
-- 
2.22.1

