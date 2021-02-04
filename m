Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FA830FCA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 20:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238334AbhBDTZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 14:25:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:56712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238332AbhBDRKA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 12:10:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BD8564E8C;
        Thu,  4 Feb 2021 17:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612458557;
        bh=gcSBUytnH4dicfQPu+4vF3CbY4GuXWAfEmHOvl41RgA=;
        h=From:To:Cc:Subject:Date:From;
        b=GDL34zKdvsFYtqCzsft8BwO32zb+azVOQZ9TfxOSjv9oX08iy7hTnR3O3T7lOrZFV
         9kr5B2bpGU5+B5ZKmuoIuXYs+sQ2UmURmUD7vBKGGZN+DpNPtSjRrB3bOwXpfHCb0Q
         04383fRGsUF/wAf9nmtSwu3soDMpcLEfTPud2JC63TZJmDmiOQY0QqKw8ghl0Vujx8
         HXWetE+gEm/tV+iK5Nj0ASyDReRfDroRrPyX92PkuYUSzJG+CQWjQfqVORN//UUgWi
         2l0piK7nRQ0SrMyJefq+a8S6XIRt5wtRGJgzVAlTIHme/rWadnfrEpGCMnvETE487u
         S2P4YKbOoM0eg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6]: arm64: dts: qcom: sm8350: more device support
Date:   Thu,  4 Feb 2021 22:39:01 +0530
Message-Id: <20210204170907.63545-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds more support for smmu, usb and ufs to SM8350 and MTP. This
also adds regulator names which is very handy to have while looking at
regulators.

Jack Pham (2):
  arm64: dts: qcom: sm8350: add USB and PHY device nodes
  arm64: dts: qcom: sm8350-mtp: enable USB nodes

Vinod Koul (4):
  arm64: dts: qcom: Add SM8350 apss_smmu node
  arm64: dts: qcom: Add SM8350 UFS nodes
  arm64: dts: qcom: sm8350-mtp: enable UFS nodes
  arm64: dts: qcom: sm8350-mtp: add regulator names

 arch/arm64/boot/dts/qcom/sm8350-mtp.dts |  90 ++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 360 ++++++++++++++++++++++++
 2 files changed, 450 insertions(+)

-- 
2.26.2

