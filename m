Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A871175030
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 15:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfGYNxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 09:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:51642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbfGYNxd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 09:53:33 -0400
Received: from localhost.localdomain (unknown [106.200.241.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08F8F218F0;
        Thu, 25 Jul 2019 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564062813;
        bh=I52zlCbcMlJnFR+WlLV3puiRqUum4X1J4XQWSKNejr8=;
        h=From:To:Cc:Subject:Date:From;
        b=t2+bp0VyDqQ/j8G0MsU+t/H4EX+slVT+dNZsF3CQIvQyDa6LUFMAfPjH0xK1UI/0B
         5a7+1BbyVPzQabIfXHlxIw1aHeeu+QTmm1MemlQgBd0clSb0/EczoLV0iQin7N6dci
         B0arJ+d1gxgj+3GhgtH9ripAS99XJ8nnxJE1FcTs=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: qcs404: Fix DTS warnings
Date:   Thu, 25 Jul 2019 19:21:47 +0530
Message-Id: <20190725135150.9972-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So this is second installment of my work to fix warns on qcom DTS, this time
the traget is qcs404 platform.

Vinod Koul (3):
  arm64: dts: qcom: pms405: add unit name adc nodes
  arm64: dts: qcom: pms405: remove reduandant properties
  arm64: dts: qcom: qcs404: remove unit name for thermal trip points

 arch/arm64/boot/dts/qcom/pms405.dtsi | 16 +++++++--------
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 30 ++++++++++++++--------------
 2 files changed, 22 insertions(+), 24 deletions(-)

-- 
2.20.1

