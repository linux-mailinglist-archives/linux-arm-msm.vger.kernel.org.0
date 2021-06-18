Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2553AC15B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 05:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhFRDeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 23:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbhFRDeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 23:34:12 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3140C061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 20:32:01 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D7B1A83640;
        Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1623987118;
        bh=+SDIAl1yRq88xHUi/034WTzhHZGtGTRjCc92oLsrTe8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ErU/mSfM/Do/OekKIY1oCEGtlelwYFSIp/RuF70STJgT6ONzlM+1oxQaaL3ylPElf
         v6txtRWXlRAddYW9wLgpUZNauKf6hEtdiZb0rGCiXP6+Lk+SQdWFUSh75AlGAnAxjF
         h4+pdBDjFQ3g4Vt1JxRTZxN2QmUX4pZDtiSv4Z6bUIBUZMedkAGH8/66gRm0IwD0It
         jBAt3uqqFkg/RQ68TYbepZEltyeb1/74NKJ2g0CbrPBGKtoMBkY0Q47OAhFi9AjHb0
         bYK1oTEydXbFvRS3ZkEKfLVfPj91KEjkE9qyuLrVCp6qgXC9a2y7QNQmXkczA8f+aG
         7OqJ0TeNG2lfA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60cc13ae0002>; Fri, 18 Jun 2021 15:31:58 +1200
Received: from pauld-dl.ws.atlnz.lc (pauld-dl.ws.atlnz.lc [10.33.23.37])
        by pat.atlnz.lc (Postfix) with ESMTP id 92BFC13EEAF;
        Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
Received: by pauld-dl.ws.atlnz.lc (Postfix, from userid 1684)
        id 8BD9E1E0550; Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
From:   Paul Davey <paul.davey@alliedtelesis.co.nz>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Davey <paul.davey@alliedtelesis.co.nz>
Subject: [PATCH 1/2] bus: mhi: Fix pm_state conversion to string
Date:   Fri, 18 Jun 2021 15:31:31 +1200
Message-Id: <20210618033132.24839-2-paul.davey@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
References: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=SQbU7SH2vTJutzk7rhIA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On big endian architectures the mhi debugfs files which report pm state
give "Invalid State" for all states.

Fix to_mhi_pm_state_str by using a local unsigned long as an intemediate
to pass the state to find_last_bit to avoid endianness issues with cast
from enum mhi_pm_state * to unsigned long *.

Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
---
 drivers/bus/mhi/core/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c81b377fca8f..87cc0c449078 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -79,7 +79,8 @@ static const char * const mhi_pm_state_str[] =3D {
=20
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 {
-	int index =3D find_last_bit((unsigned long *)&state, 32);
+	unsigned long tmp =3D state;
+	int index =3D find_last_bit((unsigned long *)&tmp, 32);
=20
 	if (index >=3D ARRAY_SIZE(mhi_pm_state_str))
 		return "Invalid State";
--=20
2.32.0

