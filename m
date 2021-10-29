Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0137F440417
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 22:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhJ2Ude (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 16:33:34 -0400
Received: from linux.microsoft.com ([13.77.154.182]:39762 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2Ude (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 16:33:34 -0400
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id 96BD920A65A8;
        Fri, 29 Oct 2021 13:31:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 96BD920A65A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1635539464;
        bh=GE3XUpxlHRrKfkcdglq6jQazzk3LRnWqjz2Vjqp476I=;
        h=From:To:Cc:Subject:Date:From;
        b=lPOUq+hvgT5+tzwa8/r4rLLtHHSf5DIPD/adXBFVwNIQL2ktzuLzV7RSVBdbh7jj8
         qtOm1CAjWU5oDMJDDIXpIN3HoOiOh265YzrHMXL11kOWN9QuMbdXzI3dMtgPgSEry4
         Y4CuWcN4Din5MojDrPvlhXvG4JN6GLPhIa9UXeUI=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, balbi@kernel.org
Subject: [PATCH 0/2] arm64: dts: sm8350: add support for Microsoft Surface Duo 2
Date:   Fri, 29 Oct 2021 13:30:14 -0700
Message-Id: <20211029203016.2093610-1-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial support for the Microsoft Surface Duo 2 based on the
sm8350-mtp DT with the following functionality:

 * UFS internal storage
 * USB peripheral mode
 * Remoteproc

Katherine Perez (2):
  arm64: dts: add minimal DTS for Microsoft Surface Duo2
  arm64: dts: sm8350: fix tlmm base address

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sm8350-microsoft-surface-duo2.dts    | 363 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   4 +-
 3 files changed, 366 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts

--
2.31.1

