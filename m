Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FC129BE5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 17:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1812882AbgJ0Qqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 12:46:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:43420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1812029AbgJ0QpX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 12:45:23 -0400
Received: from localhost.localdomain (unknown [122.171.48.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D766F218AC;
        Tue, 27 Oct 2020 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603817123;
        bh=QZC1USfwCxJ9/ICw29u4XH4aoQXVpItqZuOlHVOGM1w=;
        h=From:To:Cc:Subject:Date:From;
        b=TjGH+XCDv2fVExjTYJwrOuDCRhMVHIpfskM+X0vKdZEvaDsC+sg6p/fsjM7GSfEWA
         5TFvUqSAsnusAnO1WxcLdnQRfA7AOzVP4LwzbzXU7VuRePLqqttcprNLwl28hPOXab
         bfQcVwcwqgwDzbfB2GZqWmQXU2jyNwXzMTQWT+fM=
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] arm64: dts: qcom: Fix dma node name
Date:   Tue, 27 Oct 2020 22:15:02 +0530
Message-Id: <20201027164511.476312-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DMA controller binding describes the node name should be dma-controller
and not dma, so fix the node name in the qcom dts files

Vinod Koul (9):
  arm64: dts: sdm845: Fix dma node name
  arm64: dts: sdm630: Fix dma node name
  arm64: dts: qcs404: Fix dma node name
  arm64: dts: msm8916: Fix dma node name
  arm64: dts: msm8994: Fix dma node name
  arm64: dts: msm8996: Fix dma node name
  arm64: dts: msm8998: Fix dma node name
  arm64: dts: ipq6018: Fix dma node name
  arm64: dts: ipq8074: Fix dma node name

 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi  | 4 ++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 +-
 9 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.26.2

