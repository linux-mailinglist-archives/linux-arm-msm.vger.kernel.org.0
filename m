Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F28319DB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhBLL4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:56:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:47760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230477AbhBLL4U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:56:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CA1164E87;
        Fri, 12 Feb 2021 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130939;
        bh=DwpGxqUw152P91G9XdHfFmbaYiw6YYTFLDA4NFlr68s=;
        h=From:To:Cc:Subject:Date:From;
        b=ckbNie/bPJJTNhq/sTlNXtHHWJib9h942H72DONxh9SdoLQTGTF+c5Ieks5PGygtJ
         0CxptfPcmNtF2UeXSbyrlH3B33gu30RCvCEh4cvab+DeZL+ek7zfjeaZdumQJDL26b
         DCd+umNLAK0nRBbbbxs3hOWnxC8glfuWl0ME7E0xdb1ngbQaQGPv0MMnUO6lB1NYh2
         ZL/gzsky3iNKle8lHSLoT2srbst4Zb2lHXxpd4NDtn/BuHkj7e8CTa7fD0SG3ZLvTU
         kNRhcGjL4VykBu0vYvPsYEw7s3kgodIy5pTb+wNcb94cF2lA+3JrujqnAlqYYrkku+
         PbKMKeoYFuE+A==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] arm64: dts: qcom: sm8350: additional device support
Date:   Fri, 12 Feb 2021 17:25:25 +0530
Message-Id: <20210212115532.1339942-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series fixes a typo, adds remoteproc nodes and enables them for MTP and
uses enums for GCC

This is v5.13 material and dependent on 20210204170907.63545-1-vkoul@kernel.org

Vinod Koul (7):
  arm64: dts: qcom: sm8350: fix typo
  arm64: dts: qcom: sm8350: Add rpmhpd node
  arm64: dts: qcom: sm8350: Add rmtfs node
  arm64: dts: qcom: sm8350: Add SMP2P nodes
  arm64: dts: qcom: sm8350: Add remoteprocs
  arm64: dts: qcom: sm8350-mtp: Enable remoteprocs
  arm64: dts: qcom: sm8350: Use enums for GCC

 arch/arm64/boot/dts/qcom/sm8350-mtp.dts |  20 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 406 +++++++++++++++++++++---
 2 files changed, 380 insertions(+), 46 deletions(-)

-- 
2.26.2

