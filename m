Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FC13B6D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 05:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbhF2D4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 23:56:33 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52118 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhF2D4b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 23:56:31 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9CAFA80719;
        Tue, 29 Jun 2021 15:54:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1624938843;
        bh=1p+sM2m9rtBsvL/+/7s78xnH3t9wexzfzLjPGTs6tw8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=uJV4i3QsKSK5wAP6FQ1kJP3P93rUEODnXtZHRqeqG/Yq/LwForN4LraiSsuSS3q6g
         B0hsyFEkT0ZCQ1jk8FJbOQR15XNiImjyzaUAjh/DSBfTC1yB8bLsdPK4kO5tITFBjs
         wy9awltivU8PSc1SUDlCgUNcuRVmcDglBONsN87rdbVIEJI0KIZwfY7XeBnDkgM4nH
         I+67Nh4LO6lBcReQK41NHXha+v0wulL498BtWsl8UyzdElhjHQO+FWrRZTTqY3C0RI
         EjqBR5mwj2ROMDdVSr+chqOTHrTlUXcVvXZeGrghu/h9MAcBjSPoZw38lpPXSE9M+3
         JQDyVFGNdXdMQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60da995b0001>; Tue, 29 Jun 2021 15:54:03 +1200
Received: from pauld-dl.ws.atlnz.lc (pauld-dl.ws.atlnz.lc [10.33.23.37])
        by pat.atlnz.lc (Postfix) with ESMTP id 47A9813EE9C;
        Tue, 29 Jun 2021 15:54:03 +1200 (NZST)
Received: by pauld-dl.ws.atlnz.lc (Postfix, from userid 1684)
        id 4531D1E0169; Tue, 29 Jun 2021 15:54:03 +1200 (NZST)
From:   Paul Davey <paul.davey@alliedtelesis.co.nz>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Davey <paul.davey@alliedtelesis.co.nz>
Subject: [PATCH v3 1/2] bus: mhi: Fix pm_state conversion to string
Date:   Tue, 29 Jun 2021 15:53:56 +1200
Message-Id: <20210629035357.11091-2-paul.davey@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629035357.11091-1-paul.davey@alliedtelesis.co.nz>
References: <20210629035357.11091-1-paul.davey@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=xDYxNL215i3Ysd8OqoQA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On big endian architectures the mhi debugfs files which report pm state
give "Invalid State" for all states.  This is caused by using
find_last_bit which takes an unsigned long* while the state is passed in
as an enum mhi_pm_state which will be of int size.

Fix by using __fls to pass the value of state instead of find_last_bit.

Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
---
 drivers/bus/mhi/core/init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c81b377fca8f..0706eb046f2a 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -79,9 +79,12 @@ static const char * const mhi_pm_state_str[] =3D {
=20
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 {
-	int index =3D find_last_bit((unsigned long *)&state, 32);
+	int index;
=20
-	if (index >=3D ARRAY_SIZE(mhi_pm_state_str))
+	if (state)
+		index =3D __fls(state);
+
+	if (!state || index >=3D ARRAY_SIZE(mhi_pm_state_str))
 		return "Invalid State";
=20
 	return mhi_pm_state_str[index];
--=20
2.32.0

