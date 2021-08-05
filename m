Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3413E1A40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 19:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239266AbhHERUS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 13:20:18 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:53823 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239104AbhHERUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 13:20:15 -0400
Date:   Thu, 05 Aug 2021 17:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628183968;
        bh=mZ5hDbxACcTMRejNrvm5o3SgDu2wNo9qD49zWbJpoo8=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Uq/Qkljrc8Lumb22Y80QlIUWCGPy6jzRDNX6eEJ51Snm/m29LetTfpHHNzfXq9oOK
         imSoPzxtT6ZLBUtrCXTfW0lNr1rsR/ktAECB6fuZ6rFi+BCiV8TPH4RL9ydRdqgStc
         JZfU/FasVb+8L95oa8iCGpGQA409BryJIv08IImQ=
To:     bjorn.andersson@linaro.org, sboyd@kernel.org
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH 0/2] Add rpmcc for MSM8953
Message-ID: <61Du39sy5yiN1xcir4yEOpkELdashqygFwNeY5wcHhk@cp3-web-020.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This patch adds support for the RPM clocks found on the QCom MSM8953
platform (SDM450, SDA450, SDM625, SDM632, APQ8053). Since all SoCs based
on the MSM8953 platform have the same RPM clocks, a single compatible
string is used.

Vladimir Lypak (2):
  dt-bindings: clock: qcom-rpmcc: Add compatible for MSM8953 SoC
  clk: qcom: rpmcc: Add support for MSM8953 RPM clocks.

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)

--=20
2.32.0


