Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCA877D8CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2019 11:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfHAJwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Aug 2019 05:52:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:45732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728654AbfHAJwV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Aug 2019 05:52:21 -0400
Received: from localhost.localdomain (unknown [122.178.237.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C9E82087E;
        Thu,  1 Aug 2019 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564653140;
        bh=pd9IjO86aCmNvpAMhZLGo0BfcJe+vjgFAkCCD5aQ2SU=;
        h=From:To:Cc:Subject:Date:From;
        b=UdWmdlbNow6KDT5wuVoZahYmHMW1hkZ+1d4Tn7W553gP4wGFPkVJyzjXRnZl09GWA
         CWlCyA2uNSXQ2y9UFtc/vR9I+l6Czcj/RsnZmum8lAu7tJxVGnRdmbBTuymEyrVI1O
         jYVK6zucQJZ/ovqZWtH1P5F9CQZulOQ+3xFpaVRg=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: qcs404: Fix DTS warnings
Date:   Thu,  1 Aug 2019 15:20:46 +0530
Message-Id: <20190801095049.13855-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So this is second installment of my work to fix warns on qcom DTS, this time
the traget is qcs404 platform.

Changes since v1:
	- Fix node addresses as pointed by Amit
	- Add review tags of Amit

Vinod Koul (3):
  arm64: dts: qcom: pms405: add unit name adc nodes
  arm64: dts: qcom: pms405: remove reduandant properties
  arm64: dts: qcom: qcs404: remove unit name for thermal trip points

 arch/arm64/boot/dts/qcom/pms405.dtsi | 16 +++++++--------
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 30 ++++++++++++++--------------
 2 files changed, 22 insertions(+), 24 deletions(-)

-- 
2.20.1

