Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE403307C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbhCHGIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:08:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:44468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232593AbhCHGIg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:08:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA488651EE;
        Mon,  8 Mar 2021 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183716;
        bh=253vvzrI/CFtqT3pQTqhw6PNFfRdA0rFZqsFmR1Oh6k=;
        h=From:To:Cc:Subject:Date:From;
        b=AByfu5gRWUuB1JxuVht8NltmHA4jrRH6FiMtAHKNxUSymqhFeO0v4jARAprTDyWwR
         70grj/4IFeDuZjqybubGwuVX+Ka1HZbVrucSoMvLtYkaqBLSoROqjDujyXL84NJ2p7
         klb3e6axJj0T2bLfDy4E4F/PhDu14iwuNkcV6lCKMcIPbX8Ub9kYVdNMiNxLGj0dFN
         zATXAtSySloHqAfsqfXFgyl80v/Xqscbm53UNTcg82Lp1IHSxpJrKa29ADRpucZtMb
         hiKu4IjHrlVtolPxItMVdPW38XkkdAcGKg1hB0EQ+SOg59v3OXRnK79xwSqFSGpumW
         sI7JV/HHs1dKg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/18] arm64: qcom: fix dtbs_check warning
Date:   Mon,  8 Mar 2021 11:38:08 +0530
Message-Id: <20210308060826.3074234-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom dts folder shows a bunch of dtbs_check warning, this is an attempt to
fix some of them.

Many are due to txt binding which should be fixed when we have the yaml
binding documents. Few of them are fixed as below with missing nodes names,
not properly using nodes.

Vinod Koul (18):
  arm64: qcom: apq8016-sbc: drop qcom,sbc
  arm64: qcom: msm8916: don't use empty memory node
  dt-bindings: arm: qcom: Document ipq6018-cp01 board
  arm64: qcom: msm8994: don't use empty memory node
  dt-bindings: arm: qcom: Document sony boards for apq8094
  dt-bindings: arm: qcom: Document alcatel,idol347 board
  dt-bindings: arm: qcom: Drop qcom,mtp
  arm64: qcom: msm8994: don't use underscore in node name
  arm64: qcom: msm8996: don't use underscore in node name
  arm64: qcom: sdm630: don't use underscore in node name
  arm64: qcom: sdm660: don't use underscore in node name
  arm64: qcom: msm8996: don't use empty memory node
  arm64: qcom: msm8998: don't use empty memory node
  arm64: qcom: sdm630: don't use empty memory node
  arm64: qcom: sdm660: don't use empty memory node
  arm64: qcom: ipq8074: fix pci node reg property
  arm64: qcom: sdm660: use reg value for memory node
  arm64: qcom: ipq6018: drop '0x' from unit address

 Documentation/devicetree/bindings/arm/qcom.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts        |  2 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi           |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts       |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi           | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts        |  3 +--
 arch/arm64/boot/dts/qcom/msm8916.dtsi           |  4 ++--
 arch/arm64/boot/dts/qcom/msm8994.dtsi           |  8 ++++----
 arch/arm64/boot/dts/qcom/msm8996.dtsi           |  8 ++++----
 arch/arm64/boot/dts/qcom/msm8998.dtsi           |  4 ++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi            |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm660.dtsi            |  8 ++++----
 12 files changed, 45 insertions(+), 33 deletions(-)

-- 
2.26.2

