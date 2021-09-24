Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE5B4171A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 14:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245471AbhIXMVB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 08:21:01 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54009 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhIXMVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 08:21:00 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Sep 2021 05:19:27 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Sep 2021 05:19:26 -0700
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2021 17:49:15 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 303484307; Fri, 24 Sep 2021 17:49:14 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 0/4] Add secure domains support
Date:   Fri, 24 Sep 2021 17:49:07 +0530
Message-Id: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds secure domains support. All DSP domains other
than CDSP are set as secure by default and CDSP is set as secure domain
if fastrpc DT node carries secure domains property. If any process is
getting initialized using non-secure device and the dsp channel is
secure, then the session gets rejected. 

Jeya R (4):
  dt-bindings: devicetree documentation for secure domain
  misc: fastrpc: Add secure device node support
  misc: fastrpc: Set channel as secure
  misc: fastrpc: reject non-secure node for secure domain

 .../devicetree/bindings/misc/qcom,fastrpc.txt      |  6 ++
 drivers/misc/fastrpc.c                             | 64 +++++++++++++++++++++-
 2 files changed, 68 insertions(+), 2 deletions(-)

-- 
2.7.4

