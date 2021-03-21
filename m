Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC003433DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Mar 2021 18:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhCURq6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Mar 2021 13:46:58 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:42789 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhCURqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Mar 2021 13:46:25 -0400
Date:   Sun, 21 Mar 2021 17:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1616348781;
        bh=E2SHDelPQ6pNHG25n6OAPnNSHlch3xo/1v7feJPMLSE=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=JZKrCf4+1D1c3vrLzbtrmvm9BSNWRS1fpZtUaYHwMosbl+RGW01xml+xhqhfskYdq
         Fb0XJv/ovIVr64kpzZm+uEvXCm/W4ZmJoozKOFcGBXLzaa1bqM0fY5q0yNXo3AHfJp
         qS8w5ZHqzOsC9h6dNojFGSL2+KdRrpLrH43V7SXg=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: (No Subject)
Message-ID: <20210321174522.123036-1-caleb@connolly.tech>
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

Subject: v2: arm64: dts: sm8150: start populating qups

The QUPs are rather sparse, lets add the zero-th and second qup nodes,
the iommus properties for all of them and the i2c nodes.

With this it's now possible to bringup the touchscreen on my
device, and without crashing!

Derived from OnePlus 7 Pro downstream kernel sources.

=09Caleb
---
Of note, I'm only able to properly test i2c17, as that's what my
touchscreen is attached to. Enabling i2c18 causes my device to lockup
during probe, I suspect those pins are used for some other purpose on my
device.

Changes since v1:
 * Pick up Reviewed-By's from Vinod and Bhupesh
 * Squash second patch into first
 * Add iommus property to dt-binding docs for geni
 * Fix i2c19 being mistakenly enabled by default

Caleb Connolly (3):
      arm64: dts: qcom: sm8150: add other QUP nodes and iommus
      arm64: dts: qcom: sm8150: add i2c nodes
      dt-bindings: qcom: geni-se: document iommus

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 549 +++++++++++++++++++++++++++++++=
++++
 1 file changed, 549 insertions(+)


