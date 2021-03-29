Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF8034C3DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 08:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhC2Gds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 02:33:48 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23236 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbhC2Gd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 02:33:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616999607; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Cspt7L9RGwyPgT6OPwo/iaMk9p8/3cLm8IE+KVY7mek=; b=Qd9du/uCfNQYCNIwH/LPOBRB3eBHEbB670H1K4MvVDOKO4XST5SJcFGXCIRTp75ADUKV4nbs
 8Z6FSMp4NDCn/Tg2nfp6Z+9zvS3GD6pm0VGxARrkQZpxGWWyhVB1dMWUQKV26hnFr455ZPog
 3Nm6kmUEFCiIcJsycrBwCm8AtUY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6061749d876af85fc43b8e70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 06:33:01
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75F0EC433ED; Mon, 29 Mar 2021 06:33:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 80826C433C6;
        Mon, 29 Mar 2021 06:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 80826C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V3 3/5] DCC: Added the sysfs entries for DCC(Data Capture and Compare) driver
Date:   Mon, 29 Mar 2021 12:02:24 +0530
Message-Id: <eeb3cfe92cba2c7981170f3c3ff96dd440b69f25.1616997837.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1616651305.git.schowdhu@codeaurora.org>
References: <cover.1616651305.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1616997837.git.schowdhu@codeaurora.org>
References: <cover.1616997837.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DCC is a DMA engine designed to store register values either in
case of a system crash or in case of software triggers manually done
by the user.Using DCC hardware and the sysfs interface of the driver
the user can exploit various functionalities of DCC.The user can specify
the register addresses,the values of which is stored by DCC in it's
dedicated SRAM.The register addresses can be used either to read from,
write to,first read and store value and then write or to loop.All these
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
 Documentation/ABI/testing/sysfs-driver-dcc | 114 +++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc

diff --git a/Documentation/ABI/testing/sysfs-driver-dcc b/Documentation/ABI/testing/sysfs-driver-dcc
new file mode 100644
index 0000000..05d24f0
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-dcc
@@ -0,0 +1,114 @@
+What:           /sys/bus/platform/devices/.../trigger
+Date:           March 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This is the sysfs interface for manual software
+		triggers.The user can simply enter a 1 against
+		the sysfs file and enable a manual trigger.
+		Example:
+		echo  1 > /sys/bus/platform/devices/.../trigger
+
+What:           /sys/bus/platform/devices/.../enable
+Date:           March 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This sysfs interface is used for enabling the
+		the dcc hardware.Without this being set to 1,
+		the dcc hardware ceases to function.
+		Example:
+		echo  0 > /sys/bus/platform/devices/.../enable
+		(disable interface)
+		echo  1 > /sys/bus/platform/devices/.../enable
+		(enable interface)
+
+What:           /sys/bus/platform/devices/.../config
+Date:           March 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This is the most commonly used sysfs interface
+		file and this basically stores the addresses of
+		the registers which needs to be read in case of
+		a hardware crash or manual software triggers.
+		Example:
+		echo  0x80000010 10 > /sys/bus/platform/devices/../config
+		This specifies that 10 words starting from address
+		0x80000010 is to be read.In case there are no words to be
+		specified we can simply enter the address.
+
+What:           /sys/bus/platform/devices/.../config_write
+Date:           March 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file allows user to write a value to the register
+		address given as argument.The values are entered in the
+		form of <register_address> <value>.The reason for this
+		feature of dcc is that for accessing certain registers
+		it is necessary to set some bits of soe other register.
+		That is achievable by giving DCC this privelege.
+		Example:
+		echo 0x80000000 0xFF > /sys/bus/platform/devices/.../config_write
+
+What:           /sys/bus/platform/devices/.../config_reset
+Date:           March 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to reset the configuration of
+		a dcc driver to the default configuration.
+		Example:
+		echo  1 > /sys/bus/platform/devices/.../config_reset
+
+What:           /sys/bus/platform/devices/.../loop
+Date:		March 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to enter the loop count as dcc
+		driver gives the option to loop multiple times on
+		the same register and store the values for each
+		loop.This is done to capture the changing values
+		of a register with time which comes handy for
+		debugging purposes.
+		Example:
+		echo 10 > /sys/bus/platform/devices/10a2000.dcc/loop
+		(Setting the loop count to 10)
+		echo  0x80000010 10 > /sys/bus/platform/devices/.../config
+                (Read 10 words starting from address 0x80000010O)
+		echo 1 > /sys/bus/platform/devices/.../loop
+		(Terminate the loop by writing a count of 1 to the loop sysfs node)
+
+What:           /sys/bus/platform/devices/.../rd_mod_wr
+Date:           March 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to read the value of the register
+		and then write the value given as an argument to the
+		register address in config.The address argument should
+		be given of the form <mask> <value>.For debugging
+		purposes sometimes we need to first read from a register
+		and then set some values to the register.
+		Example:
+		echo 0x80000000 > /sys/bus/platform/devices/.../config
+		(Set the address in config file)
+		echo 0xF 0xA > /sys/bus/platform/devices/.../rd_mod_wr
+		(Provide the mask and the value to write)
+
+What:           /sys/bus/platform/devices/.../ready
+Date:           March 2021
+Contact:        Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This file is used to check the status of the dcc
+		hardware if it's ready to take the inputs.
+		Example:
+		cat /sys/bus/platform/devices/.../ready
+
+What:		/sys/bus/platform/devices/.../curr_list
+Date:		February 2021
+Contact:	Souradeep Chowdhury <schowdhu@codeaurora.org>
+Description:
+		This attribute is used to enter the linklist to be
+		used while appending addresses.The range of values
+		for this can be from 0 to 3.This feature is given in
+		order to use certain linkedlist for certain debugging
+		purposes.
+		Example:
+		echo 0 > /sys/bus/platform/devices/10a2000.dcc/curr_list
+
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

