Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD75A334393
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 17:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhCJQs0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 11:48:26 -0500
Received: from z11.mailgun.us ([104.130.96.11]:40899 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233322AbhCJQsI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 11:48:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615394888; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=GM5IKeiVb22WHfRgKTtxJvhkrq7Fb9DdNLO5GfSRpk4=; b=IrNmxZZGAD2ZPllLGMFpUKeoNIhjBwGcDO1cJbwFiwgKZmpK+ogmxvtxnZQibziFeZXER5uW
 n5YmlypnNQoVkN5hn509PVCqjjWQXamv0wHktA8i9V+/jAcHiqs9W8MftwgEWhJPX6iAP0p8
 SxwH6PAOIQ2AmCi30AAlviR3R2I=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6048f846b86af9bf235a1788 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 16:48:06
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3D89EC43463; Wed, 10 Mar 2021 16:48:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B0BBC43463;
        Wed, 10 Mar 2021 16:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B0BBC43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V1 4/6] DCC: Added the sysfs entries for DCC(Data Capture and Compare) driver
Date:   Wed, 10 Mar 2021 22:16:35 +0530
Message-Id: <332477ea39088fca5879af1a5278c289e1602f6d.1615393454.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1615393454.git.schowdhu@codeaurora.org>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1615393454.git.schowdhu@codeaurora.org>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DCC is a DMA engine designed to store register values either in
case of a system crash or in case of software triggers manually done
by the user. Using DCC hardware and the sysfs interface of the driver
the user can exploit various functionalities of DCC. The user can specify
the register addresses, the values of which is stored by DCC in it's
dedicated SRAM. The register addresses can be used either to read from,
write to, first read and store value and then write or to loop. All these
options can be exploited using the sysfs interface given to the user.
Following are the sysfs interfaces exposed in DCC driver which are
documented
1)trigger
2)config
3)config_write
4)config_reset
5)enable
6)rd_mod_wr
7)loop

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 Documentation/ABI/testing/sysfs-driver-dcc | 74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc

diff --git a/Documentation/ABI/testing/sysfs-driver-dcc b/Documentation/ABI/testing/sysfs-driver-dcc
new file mode 100644
index 0000000..7a855ca
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-dcc
@@ -0,0 +1,74 @@
+What:           /sys/bus/platform/devices/.../trigger
+Date:           February 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file allows the software trigger to be enabled
+		by the user through the sysfs interface.Through this
+		interface the user can manually start a software trigger
+		in dcc where by the dcc driver stores the current status
+		of the specified registers in dcc sram.
+
+What:           /sys/bus/platform/devices/.../enable
+Date:           February 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file allows the user to manually enable or
+		disable dcc driver.The dcc hardware needs to be
+		enabled before use.
+
+What:           /sys/bus/platform/devices/.../config
+Date:           February 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file allows user to configure the register values
+		along with addresses to the dcc driver.This register
+		addresses are used to read from,write or loop through.
+		To enable all these options separate sysfs files have
+		are created.
+
+What:           /sys/bus/platform/devices/.../config_write
+Date:           February 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file allows user to write a value to the register
+		address given as argument.The values are entered in the
+		form of <register_address> <value>.
+
+What:           /sys/bus/platform/devices/.../config_reset
+Date:           February 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to reset the configuration of
+		a dcc driver to the default configuration.
+
+What:           /sys/bus/platform/devices/.../loop
+Date:           February 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to enter the loop count as dcc
+		driver gives the option to loop multiple times on
+		the same register and store the values for each
+		loop.
+
+What:           /sys/bus/platform/devices/.../rd_mod_wr
+Date:           February 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to read the value of the register
+		and then write the value given as an argument to the
+		register address in config.The address argument should
+		be given of the form <mask> <value>.
+
+What:           /sys/bus/platform/devices/.../ready
+Date:           February 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to check the status of the dcc
+		hardware if it's ready to take the inputs.
+
+What:		/sys/bus/platform/devices/.../curr_list
+Date:		February 2021
+Contact:	Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to configure the linkedlist data
+		to be used while configuring addresses.
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

