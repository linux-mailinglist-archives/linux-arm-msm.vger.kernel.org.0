Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5062564E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 07:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgH2F66 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Aug 2020 01:58:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55929 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725929AbgH2F6y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Aug 2020 01:58:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598680733; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Qmtfr3sD+DWm7YPaRZ/fa36iliSnR3bJukNjjx9hZQg=; b=lh2POWXh4dCr8nEXAj1dvH46TpRU660qR6Px1xFZ5f2WFNm2Y0M6Vrq2dhUauYR39F0Utt7X
 26icwPMoeL/h+I7N9tr/8b5UWqW/4T+DfDcXN3IRItYmdIlc9BUaF2FBuoJIejt8gxXt1DVX
 GFv7RMXTLzDFBDWZ9qPKoHxhazs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f49ee9b10b019d039ed75ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 29 Aug 2020 05:58:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 71ABDC43395; Sat, 29 Aug 2020 05:58:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37267C433C6;
        Sat, 29 Aug 2020 05:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37267C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [RFC v5 0/6] Re-introduce TX FIFO resize for larger EP bursting
Date:   Fri, 28 Aug 2020 22:58:40 -0700
Message-Id: <20200829055846.19034-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in V5:
 - Added check_config() logic, which is used to communicate the number of EPs
   used in a particular configuration.  Based on this, the DWC3 gadget driver
   has the ability to know the maximum number of eps utilized in all configs.
   This helps reduce unnecessary allocation to unused eps, and will catch fifo
   allocation issues at bind() time.
 - Fixed variable declaration to single line per variable, and reverse xmas.
 - Created a helper for fifo clearing, which is used by ep0.c

Changes in V4:
 - Removed struct dwc3* as an argument for dwc3_gadget_resize_tx_fifos()
 - Removed WARN_ON(1) in case we run out of fifo space
 
Changes in V3:
 - Removed "Reviewed-by" tags
 - Renamed series back to RFC
 - Modified logic to ensure that fifo_size is reset if we pass the minimum
   threshold.  Tested with binding multiple FDs requesting 6 FIFOs.

Changes in V2:
 - Modified TXFIFO resizing logic to ensure that each EP is reserved a
   FIFO.
 - Removed dev_dbg() prints and fixed typos from patches
 - Added some more description on the dt-bindings commit message

Currently, there is no functionality to allow for resizing the TXFIFOs, and
relying on the HW default setting for the TXFIFO depth.  In most cases, the
HW default is probably sufficient, but for USB compositions that contain
multiple functions that require EP bursting, the default settings
might not be enough.  Also to note, the current SW will assign an EP to a
function driver w/o checking to see if the TXFIFO size for that particular
EP is large enough. (this is a problem if there are multiple HW defined
values for the TXFIFO size)

It is mentioned in the SNPS databook that a minimum of TX FIFO depth = 3
is required for an EP that supports bursting.  Otherwise, there may be
frequent occurences of bursts ending.  For high bandwidth functions,
such as data tethering (protocols that support data aggregation), mass
storage, and media transfer protocol (over FFS), the bMaxBurst value can be
large, and a bigger TXFIFO depth may prove to be beneficial in terms of USB
throughput. (which can be associated to system access latency, etc...)  It
allows for a more consistent burst of traffic, w/o any interruptions, as
data is readily available in the FIFO.

With testing done using the mass storage function driver, the results show
that with a larger TXFIFO depth, the bandwidth increased significantly.

Test Parameters:
 - Platform: Qualcomm SM8150
 - bMaxBurst = 6
 - USB req size = 256kB
 - Num of USB reqs = 16
 - USB Speed = Super-Speed
 - Function Driver: Mass Storage (w/ ramdisk)
 - Test Application: CrystalDiskMark

Results:

TXFIFO Depth = 3 max packets

Test Case | Data Size | AVG tput (in MB/s)
-------------------------------------------
Sequential|1 GB x     | 
Read      |9 loops    | 193.60
	  |           | 195.86
          |           | 184.77
          |           | 193.60
-------------------------------------------

TXFIFO Depth = 6 max packets

Test Case | Data Size | AVG tput (in MB/s)
-------------------------------------------
Sequential|1 GB x     | 
Read      |9 loops    | 287.35
	  |           | 304.94
          |           | 289.64
          |           | 293.61
-------------------------------------------

Wesley Cheng (6):
  usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
  arm64: boot: dts: qcom: sm8150: Enable dynamic TX FIFO resize logic
  dt-bindings: usb: dwc3: Add entry for tx-fifo-resize
  usb: gadget: configfs: Check USB configuration before adding
  usb: gadget: udc: core: Introduce check_config to verify USB
    configuration
  usb: dwc3: gadget: Ensure enough TXFIFO space for USB configuration

 .../devicetree/bindings/usb/dwc3.txt          |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   1 +
 drivers/usb/dwc3/core.c                       |   2 +
 drivers/usb/dwc3/core.h                       |   7 +
 drivers/usb/dwc3/ep0.c                        |   2 +
 drivers/usb/dwc3/gadget.c                     | 194 ++++++++++++++++++
 drivers/usb/gadget/configfs.c                 |  22 ++
 drivers/usb/gadget/udc/core.c                 |   9 +
 include/linux/usb/gadget.h                    |   2 +
 9 files changed, 240 insertions(+), 1 deletion(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

