Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8A1198DAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 09:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbgCaH4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 03:56:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23447 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729925AbgCaH4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 03:56:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585641398; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nthYnpwagHT230rYskRhSng5IhNPXUQv68G+VcY197o=; b=sYMqquEKC++JHnv/02CqUEKhInYRCOBaV6NfNxZNHjRzijq5RYXRCq/b2QZdQzkxsXZVu75z
 k+6Qy6fEkd8g+KDH80VQ+y4MHxpXI9dDMNdcDeC4sLbwKt3jGTNquiN1Gv4WdFVvGk0EJSwI
 Jj+zlLxeJ6mqxAnehNORnjDSGkI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7b4.7fb70ed98458-smtp-out-n01;
 Tue, 31 Mar 2020 07:56:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A5D8C433D2; Tue, 31 Mar 2020 07:56:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CB05C433BA;
        Tue, 31 Mar 2020 07:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CB05C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, sibis@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 1/5] arm64: dts: qcom: sc7180: Add interconnect bindings for GPU
Date:   Tue, 31 Mar 2020 13:25:49 +0530
Message-Id: <1585641353-23229-2-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the interconnect bindings to the GPU node. This enables
the GPU->DDR path bandwidth voting.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 1097e8b..51630dd 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1718,6 +1718,8 @@
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;

+			interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";

--
2.7.4
