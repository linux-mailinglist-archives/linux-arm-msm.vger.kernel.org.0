Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B87FC3FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 11:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfKNKXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 05:23:07 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:14419 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbfKNKXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 05:23:07 -0500
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Thu, 14 Nov 2019 05:23:05 EST
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Nov 2019 15:46:57 +0530
IronPort-SDR: foD5M+vtRxPlfU+/YH0bO4B+mMISka1lGXlS7dInx1WC6+prid2eZha7lKE5upKQSqzpOXRUfV
 ORDiuPj9TJJwXomNQ8EHX08WDGmqNMrbj3f4K3ruhjqTwzUvXGySbH0PDqP+15E7G9H/uhsZG0
 z2kd6gUKKwzNrY77Hz1G2FrPqK9QzpWIiwl1+qXZ5viFlkkUtfTjVfQepUrl5CCvaYCydideTe
 rozsWpSuY7Z+GLyAVu1+XgzQ2xrSl4EE51ljOfIeImub2jNo/ea2LtT+507mtsT+fLFCbMSwFt
 hHYjVHTuEw4r5kUqY30oPIXq
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Nov 2019 15:46:32 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id B690D26FF; Thu, 14 Nov 2019 15:46:31 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH v1 0/2] Add suppport for rm69299 Visionox panel driver and add DSI config to support DSI version
Date:   Thu, 14 Nov 2019 15:46:26 +0530
Message-Id: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current patchset adds support for rm69299 visionox panel driver used in MSM reference platforms 
and also adds DSI config that supports the respective DSI version.

The visionox panel driver supports a resolution of 1080x2248 with 4 lanes and supports only single DSI mode.

Current patchset is tested on actual panel.

Harigovindan P (2):
  drm/panel: add support for rm69299 visionox panel driver
  drm/msm: add DSI config changes to support DSI version

 drivers/gpu/drm/msm/dsi/dsi_cfg.c              |  21 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h              |   1 +
 drivers/gpu/drm/panel/Kconfig                  |   9 +
 drivers/gpu/drm/panel/Makefile                 |   1 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 478 +++++++++++++++++++++++++
 5 files changed, 510 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

-- 
2.7.4

