Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF7FEC280
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2019 13:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbfKAMP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 08:15:29 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:25192 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727329AbfKAMP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 08:15:29 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Fri, 01 Nov 2019 08:15:27 EDT
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Nov 2019 17:38:48 +0530
IronPort-SDR: /VdXvRb+/5cKj/kyt39JtSBtxZtazGgnOoGurMFTmCrzm9+/vj/Jpz7TDZ0CACxlJXgXMb5S0e
 4U+EcZ5hDIgzxTZ6a1pOb5Fr8pXjqId7ryVN8J5Ns0Dr6UZ+MWLh36tItJGj90tEhYnj8BYi6Q
 QZwMr6XkZxlkrMX/V53ZTLz3G28LcviF1EXZRGHZ3Lzx+GiC+PU8jkuPFsiiisG+W56c04fgF0
 LyBXdqeA4ACjASh2+MwXEtD5Dxz14p+U85Fov9cnR9jNp6bi8jNhmHPagfJUtCZdRGtEtYse58
 QnekzNXvvxuQdmXt8nsx8HeG
Received: from c-rkambl-linux1.qualcomm.com ([10.242.50.190])
  by ironmsg01-blr.qualcomm.com with ESMTP; 01 Nov 2019 17:38:33 +0530
Received: by c-rkambl-linux1.qualcomm.com (Postfix, from userid 2344811)
        id 3E2E818F1; Fri,  1 Nov 2019 17:38:32 +0530 (IST)
From:   Rajeshwari <rkambl@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org,
        sanm@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>
Subject: [PATCH 0/1] Add device node support for TSENS.
Date:   Fri,  1 Nov 2019 17:38:27 +0530
Message-Id: <1572610108-1363-1-git-send-email-rkambl@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add TSENS node and user thermal zone configurations for TSENS sensors 
in SC7180.

The change has dependency on adding device tree support for sc7180 [1] 
to merge first.

Dependencies:

[1] https://lkml.org/lkml/2019/10/23/223

Rajeshwari (1):
  arm64: dts: qcom: sc7180:  Add device node support for TSENS in SC7180

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 518 +++++++++++++++++++++++++++++++++++
 1 file changed, 518 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

