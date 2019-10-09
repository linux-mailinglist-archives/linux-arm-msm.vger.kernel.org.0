Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82BFCD0E46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 14:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbfJIMFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 08:05:30 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:55700 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731099AbfJIMFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 08:05:30 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iIAiZ-00052H-Kq; Wed, 09 Oct 2019 13:05:23 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iIAiZ-0004RG-4w; Wed, 09 Oct 2019 13:05:23 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdp5: make config variables static
Date:   Wed,  9 Oct 2019 13:05:22 +0100
Message-Id: <20191009120522.17019-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A number of the config structs are not exported so make
them static to avoid the following sparse warnings:

drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:17:26: warning: symbol 'msm8x74v1_config' was not declared. Should it be static?
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:101:26: warning: symbol 'msm8x74v2_config' was not declared. Should it be static?
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:183:26: warning: symbol 'apq8084_config' was not declared. Should it be static?
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:278:26: warning: symbol 'msm8x16_config' was not declared. Should it be static?
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:345:26: warning: symbol 'msm8x94_config' was not declared. Should it be static?
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:440:26: warning: symbol 'msm8x96_config' was not declared. Should it be static?
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:548:26: warning: symbol 'msm8917_config' was not declared. Should it be static?
drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:633:26: warning: symbol 'msm8998_config' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index f6e71ff539ca..7c9c1ddae821 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -14,7 +14,7 @@ struct mdp5_cfg_handler {
 /* mdp5_cfg must be exposed (used in mdp5.xml.h) */
 const struct mdp5_cfg_hw *mdp5_cfg = NULL;
 
-const struct mdp5_cfg_hw msm8x74v1_config = {
+static const struct mdp5_cfg_hw msm8x74v1_config = {
 	.name = "msm8x74v1",
 	.mdp = {
 		.count = 1,
@@ -98,7 +98,7 @@ const struct mdp5_cfg_hw msm8x74v1_config = {
 	.max_clk = 200000000,
 };
 
-const struct mdp5_cfg_hw msm8x74v2_config = {
+static const struct mdp5_cfg_hw msm8x74v2_config = {
 	.name = "msm8x74",
 	.mdp = {
 		.count = 1,
@@ -180,7 +180,7 @@ const struct mdp5_cfg_hw msm8x74v2_config = {
 	.max_clk = 200000000,
 };
 
-const struct mdp5_cfg_hw apq8084_config = {
+static const struct mdp5_cfg_hw apq8084_config = {
 	.name = "apq8084",
 	.mdp = {
 		.count = 1,
@@ -275,7 +275,7 @@ const struct mdp5_cfg_hw apq8084_config = {
 	.max_clk = 320000000,
 };
 
-const struct mdp5_cfg_hw msm8x16_config = {
+static const struct mdp5_cfg_hw msm8x16_config = {
 	.name = "msm8x16",
 	.mdp = {
 		.count = 1,
@@ -342,7 +342,7 @@ const struct mdp5_cfg_hw msm8x16_config = {
 	.max_clk = 320000000,
 };
 
-const struct mdp5_cfg_hw msm8x94_config = {
+static const struct mdp5_cfg_hw msm8x94_config = {
 	.name = "msm8x94",
 	.mdp = {
 		.count = 1,
@@ -437,7 +437,7 @@ const struct mdp5_cfg_hw msm8x94_config = {
 	.max_clk = 400000000,
 };
 
-const struct mdp5_cfg_hw msm8x96_config = {
+static const struct mdp5_cfg_hw msm8x96_config = {
 	.name = "msm8x96",
 	.mdp = {
 		.count = 1,
@@ -545,7 +545,7 @@ const struct mdp5_cfg_hw msm8x96_config = {
 	.max_clk = 412500000,
 };
 
-const struct mdp5_cfg_hw msm8917_config = {
+static const struct mdp5_cfg_hw msm8917_config = {
 	.name = "msm8917",
 	.mdp = {
 		.count = 1,
@@ -630,7 +630,7 @@ const struct mdp5_cfg_hw msm8917_config = {
 	.max_clk = 320000000,
 };
 
-const struct mdp5_cfg_hw msm8998_config = {
+static const struct mdp5_cfg_hw msm8998_config = {
 	.name = "msm8998",
 	.mdp = {
 		.count = 1,
-- 
2.23.0

