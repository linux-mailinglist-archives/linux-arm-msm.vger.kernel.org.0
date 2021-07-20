Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80B73CFE0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 17:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbhGTPEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 11:04:42 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:32149 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241721AbhGTOxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 10:53:05 -0400
Date:   Tue, 20 Jul 2021 15:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1626795219;
        bh=szBIPFUr6CqEljCYQ32/qAOWp1c+Iy40CcFm212YhCQ=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=H6UaAWJa1yDEuy4fEFsuMMrwULeQsJvzjkHM39TS1VGBNg1IGfwxZLwPGKt3kM57X
         RUZW9JFHMX0BJvSqVMJ8eH8hCo9I4nFmwT3pjZHa9qTStCk0WnmC4S94N2WdYLPo6u
         jHfrJ9CUCPGx5GDanRO8561RS1UACOKRKjzt/2wQ=
To:     Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 0/5] OnePlus 6 fixes
Message-ID: <20210720153125.43389-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is another collection of small fixes for the OnePlus 6 and 6T.
Notably we finally have finally tracked down and fixed the reserved memory
related crashes!
We also enable UART as well as take Bjorns approach to working around the p=
anel
reset GPIO issue making the reset GPIO optional in the panel driver. Lastly=
 we
fix up the ipa firmware path now that firmware-names is supported for it in
5.14.

The patch ("drm/panel/samsung-sofef00: make gpio optional") is a reworked
version of a patch from a previous series which was not accepted: ("drm: pa=
nel:
sofef00: remove reset GPIO handling")
https://lore.kernel.org/linux-arm-msm/20210502014146.85642-3-caleb@connolly=
.tech/

Caleb Connolly (5):
  arm64: dts: qcom: sdm845-oneplus: fix reserved-mem
  dts: arm64: sdm845-oneplus-common: enable debug UART
  drm/panel/samsung-sofef00: make gpio optional
  arm64: dts: qcom: sdm845-oneplus-fajita: remove panel reset gpio
  arm64: dts: qcom: sdm845-oneplus: add ipa firmware names

 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 19 ++++++++++++++-----
 .../dts/qcom/sdm845-oneplus-enchilada.dts     |  2 ++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  7 +++++--
 3 files changed, 21 insertions(+), 7 deletions(-)

--
2.32.0


