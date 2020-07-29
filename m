Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1222231A85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 09:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgG2HoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 03:44:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:57838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgG2HoY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 03:44:24 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 241AA2084D;
        Wed, 29 Jul 2020 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596008663;
        bh=uisBrp03mBj+7I52p1yLCddU9KzH618rf8vZLEo8Blo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dph5wHjHRyz2edLmnKeCf7nt2rq2NGIOMLn8qX4MjQeY6VrRzSOGRu7fDOqUXe579
         nCSgXVpkOu/vImotkkdF+Xw7c95oEAsXN6b2o82pGQ486jz5kQKA1Vdsto0jCu89zW
         8+YcpSc66SljkuWLQmi1sMuEFYpB6HmvLRqnFNi4=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] soc: qcom: smd-rpm: Fix kerneldoc
Date:   Wed, 29 Jul 2020 09:44:15 +0200
Message-Id: <20200729074415.28393-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729074415.28393-1-krzk@kernel.org>
References: <20200729074415.28393-1-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/soc/qcom/smd-rpm.c:35: warning: Function parameter or member 'dev' not described in 'qcom_smd_rpm'
    drivers/soc/qcom/smd-rpm.c:99: warning: Function parameter or member 'state' not described in 'qcom_rpm_smd_write'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/qcom/smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 877b13850730..1d4eb46b417a 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -20,6 +20,7 @@
  * struct qcom_smd_rpm - state of the rpm device driver
  * @rpm_channel:	reference to the smd channel
  * @icc:		interconnect proxy device
+ * @dev:		rpm device
  * @ack:		completion for acks
  * @lock:		mutual exclusion around the send/complete pair
  * @ack_status:		result of the rpm request
@@ -86,6 +87,7 @@ struct qcom_rpm_message {
 /**
  * qcom_rpm_smd_write - write @buf to @type:@id
  * @rpm:	rpm handle
+ * @state:	active/sleep state flags
  * @type:	resource type
  * @id:		resource identifier
  * @buf:	the data to be written
-- 
2.17.1

