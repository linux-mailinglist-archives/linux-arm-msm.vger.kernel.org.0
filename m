Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00CA43E9CCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 05:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbhHLDR2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 23:17:28 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:54496 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbhHLDR2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 23:17:28 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8061A806AC;
        Thu, 12 Aug 2021 15:17:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1628738222;
        bh=5JjXH/H6ie/6WRTQsTrld8apaEdquwT+9LAWsqqnmCc=;
        h=From:To:Cc:Subject:Date;
        b=DBQV8AAI/0cV6BC2tuiB47Uya5zLFLLFLWaK28j4uWPWCJZEMqzDvyIaUXoSSCP6K
         Qa8RZlxPekajq1lvb+v7Gb1/F5rob4c/9NMn9q1rPt3xiwd+mcJcvF4dbcHnSKN8e0
         8n+/kppSXNKrxXc+GtbgwHZuzKbY2TrT+t5w53yBLogkVcCU37ckrG4wpYkKHcwyzn
         GAPT9+M9mLPEBD17ozNkTg1B/XKLMdoqndtTpo0WvTQkQJMFS2lq7OtvRXhSsEu4/+
         CJSNDsRP+EUMDlvMnYgjhiURUOdf/rPkZQpMOsEuwqePznW53MvcJywTJAS0IgkMVn
         faLZOUcpKTRvg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B611492ae0000>; Thu, 12 Aug 2021 15:17:02 +1200
Received: from pauld-dl.ws.atlnz.lc (pauld-dl.ws.atlnz.lc [10.33.23.37])
        by pat.atlnz.lc (Postfix) with ESMTP id 6307813EE8E;
        Thu, 12 Aug 2021 15:17:02 +1200 (NZST)
Received: by pauld-dl.ws.atlnz.lc (Postfix, from userid 1684)
        id 5360A1E02B4; Thu, 12 Aug 2021 15:17:02 +1200 (NZST)
From:   Paul Davey <paul.davey@alliedtelesis.co.nz>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Davey <paul.davey@alliedtelesis.co.nz>
Subject: [PATCH v4 0/2] bus: mhi: Fix MHI on big endian architectures
Date:   Thu, 12 Aug 2021 15:16:58 +1200
Message-Id: <20210812031700.23397-1-paul.davey@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=aqTM9hRV c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=MhDmnRu9jo8A:10 a=LpQP-O61AAAA:8 a=4bNo0gKVkgJuf2YILAYA:9 a=pioyyrs4ZptJ924tMmac:22
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

Changes in v4:
  - add Fixes and Reviewed-By tags as requested/offered.
Changes in v3:
  - removed change of doorbell helper functions db_val type from
    dma_addr_t to __le64 favouring doing conversion only when writing to
    context wp fields. =20
Changes in v2:
  - use __fls instead of find_last_bit in pm_state conversion patch as
    requested by Hemant Kumar <hemantk@codeaurora.org>

Paul Davey (2):
  bus: mhi: Fix pm_state conversion to string
  bus: mhi: Fix MHI DMA structure endianness

 drivers/bus/mhi/core/debugfs.c  |  26 +++----
 drivers/bus/mhi/core/init.c     |  43 ++++++------
 drivers/bus/mhi/core/internal.h | 119 ++++++++++++++++----------------
 drivers/bus/mhi/core/main.c     |  22 +++---
 drivers/bus/mhi/core/pm.c       |   4 +-
 5 files changed, 109 insertions(+), 105 deletions(-)

--=20
2.32.0

