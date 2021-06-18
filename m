Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E323AC15A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 05:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhFRDeN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 23:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhFRDeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 23:34:12 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF143C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 20:32:01 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C4A3E806B6;
        Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1623987118;
        bh=BdIjaeFTZpVsBKHMm9R9wteXnVU412WssR8D0FVx4Jg=;
        h=From:To:Cc:Subject:Date;
        b=HtNa2hwGWi9cGPddUgyzCSYVcioY/Q2DzQGUaQVPQ4PHZ68uNRDbNL80sJhkATOV8
         q0XDG6v7tPeu1o6Yyw1U4xKGfI22i48c/jSBi6rdtxlwkk9LM5dyt7XdIXXfhSRIOJ
         kTMc2nWSJfz8TgUZyTN5DY/4cyZftcX+Km5ju1nNKGamOtCUsd17J3eCliE0OIyFhD
         HduNlaeoeXZ2qjqSR6o1WGPhRUUINpwl7zKTSL89Qo6HAPR6pHd0NcQRJQ+XquzmFj
         1DOU7tz1D66BHJq+3KPBsuWMWCJVrm4JP9hXNvTf9Nk0vzu+iBIDV9GA4D3v8nXIEK
         YWnWCHwbL1B/w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60cc13ae0000>; Fri, 18 Jun 2021 15:31:58 +1200
Received: from pauld-dl.ws.atlnz.lc (pauld-dl.ws.atlnz.lc [10.33.23.37])
        by pat.atlnz.lc (Postfix) with ESMTP id 90AD413EDEE;
        Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
Received: by pauld-dl.ws.atlnz.lc (Postfix, from userid 1684)
        id 82D341E053B; Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
From:   Paul Davey <paul.davey@alliedtelesis.co.nz>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Davey <paul.davey@alliedtelesis.co.nz>
Subject: [PATCH 0/2] bus: mhi: Fix MHI on big endian architectures
Date:   Fri, 18 Jun 2021 15:31:30 +1200
Message-Id: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=FyegsYdXSWPfw3ArC9gA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I encountered some problems getting the MHI driver to work on an Octeon
3 platform these seem to all be related to endianness issues.  The modem
interface appears to require the DMA structures to be in little endian,
however the MHI core driver was assembling them in native endianness.

Using little endian explicitly allows the interface to function as
expected.

Paul Davey (2):
  bus: mhi: Fix pm_state conversion to string
  bus: mhi: Fix MHI DMA structure endianness

 drivers/bus/mhi/core/debugfs.c  |  26 +++----
 drivers/bus/mhi/core/init.c     |  39 +++++-----
 drivers/bus/mhi/core/internal.h | 129 ++++++++++++++++----------------
 drivers/bus/mhi/core/main.c     |  36 ++++-----
 drivers/bus/mhi/core/pm.c       |   8 +-
 5 files changed, 121 insertions(+), 117 deletions(-)

--=20
2.32.0

