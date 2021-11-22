Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8AE45954C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 20:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239534AbhKVTJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 14:09:21 -0500
Received: from linux.microsoft.com ([13.77.154.182]:54642 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhKVTJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 14:09:20 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id D94DD20CDF9E;
        Mon, 22 Nov 2021 11:06:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D94DD20CDF9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1637607970;
        bh=1kav/zBHA7FiqkPaBcUDQL/HgQa52sySa8iFFV8lzTA=;
        h=From:To:Cc:Subject:Date:From;
        b=E2CCsp0Emy4uZDh+CChw9mag0Lnoc9i8pGzMimXxVhSo0ZuFIyCCHhIQajqGbnixn
         a5ijE9kQKOyE+p6S0NPSJJ2vDJVaBgcRaVGchA6v8YxIH8IJTNqYAkNxQ3xbQ4WSWJ
         FA7YQBqzx61ri7NfD1kmHbPOSRedmbexqaqO2s6Q=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/2] arm64: dts: sm8350: add support for Microsoft Surface Duo 2
Date:   Mon, 22 Nov 2021 11:05:50 -0800
Message-Id: <20211122190552.74073-1-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial support for the Microsoft Surface Duo 2 based on the
sm8350-mtp DT.

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

