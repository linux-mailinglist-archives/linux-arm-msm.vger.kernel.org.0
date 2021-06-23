Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC1B3B11D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 04:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhFWCpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 22:45:50 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:44270 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFWCpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 22:45:49 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2E99C83640;
        Wed, 23 Jun 2021 14:43:31 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1624416211;
        bh=4ANcvU3lC5BGWHjxkVIkmbYgvoY+suJ5u/sfb2nuHQU=;
        h=From:To:Cc:Subject:Date;
        b=LktYzxaQ/t4yG4JKAya0iC8sks7zJd3wczWE7UKRkDwqlPGrUSWcsqBf5ZutVsU7R
         2ZcUkis3bZFGun5+v64zJa67E7P4FPOKuw1Xw5rXW7rX3YjhLzUDQt2/zo5d2QTJtq
         4OY1DBNDfPl/PkYnG2G+4g3azq96hPimS/u2U76otbQjgN85gV3aTV8IJJ5nv7+/qe
         eWdaOFqdBUItZ5bFcNYqxKFz2EZBzOXNqaqJH4ddT9S4ljudBGSjnpqaf+FqshaM0Q
         l5ZboxRB9uDvkD1gLZM2ILaJlWdRAOlIZUHst6datv5CG2B88MDL+TAavHVhWDrPrq
         KVyb3hGaLXgVQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60d29fd20000>; Wed, 23 Jun 2021 14:43:30 +1200
Received: from pauld-dl.ws.atlnz.lc (pauld-dl.ws.atlnz.lc [10.33.23.37])
        by pat.atlnz.lc (Postfix) with ESMTP id D71DA13EE59;
        Wed, 23 Jun 2021 14:43:30 +1200 (NZST)
Received: by pauld-dl.ws.atlnz.lc (Postfix, from userid 1684)
        id CD0CC1E056F; Wed, 23 Jun 2021 14:43:30 +1200 (NZST)
From:   Paul Davey <paul.davey@alliedtelesis.co.nz>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Paul Davey <paul.davey@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] bus: mhi: Fix MHI on big endian architectures
Date:   Wed, 23 Jun 2021 14:43:25 +1200
Message-Id: <20210623024327.15029-1-paul.davey@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=LpQP-O61AAAA:8 a=FyegsYdXSWPfw3ArC9gA:9 a=pioyyrs4ZptJ924tMmac:22
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

Changes in v2:
  - use __fls instead of find_last_bit in pm_state conversion patch as
    requested by Hemant Kumar <hemantk@codeaurora.org>

Paul Davey (2):
  bus: mhi: Fix pm_state conversion to string
  bus: mhi: Fix MHI DMA structure endianness

 drivers/bus/mhi/core/debugfs.c  |  26 +++----
 drivers/bus/mhi/core/init.c     |  43 ++++++-----
 drivers/bus/mhi/core/internal.h | 129 ++++++++++++++++----------------
 drivers/bus/mhi/core/main.c     |  36 ++++-----
 drivers/bus/mhi/core/pm.c       |   8 +-
 5 files changed, 124 insertions(+), 118 deletions(-)

--=20
2.32.0

