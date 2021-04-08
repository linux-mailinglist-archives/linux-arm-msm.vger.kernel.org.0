Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF01E358989
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 18:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbhDHQVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 12:21:06 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:61654 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbhDHQVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 12:21:05 -0400
Date:   Thu, 08 Apr 2021 16:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1617898852;
        bh=b+OdMUUk9Eq2QLLRDRz5C3FbA7WlnSCxQu4FqtE4xo8=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=pKJurOYqmoOFG3kbgqZ7pJk+tH7bmi/Bxb644wv52Wk71jqIcuZ4pXkqQmcUA9FVa
         QVhm1UQYF5Gn0NWJusMrjKCkxKkm6T7lQYBNF68MbRXojjuSsqD6FAAz/lo0m+0pju
         MRMf/4UVMKEvxYD0Kco5F45wH/oisYXYMiDLZers=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: v3: arm64: dts: sm8150: start populating qups
Message-ID: <20210408161953.26298-1-caleb@connolly.tech>
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

The QUPs are rather sparse, lets add the zero-th and second qup nodes,
the iommus properties for all of them and the i2c nodes.

With this it's now possible to bringup the touchscreen on my
device, and without crashing!

Derived from OnePlus 7 Pro downstream kernel sources.

=09*Caleb

Changes since v1:
 * Pick up Reviewed-By's from Vinod and Bhupesh
 * Squash second patch into first
 * Add iommus property to dt-binding docs for geni
 * Fix i2c19 being mistakenly enabled by default

Changes since v2:
 * Fix iommus definition to just declare the property and maxItems (Thanks =
Bjorn).

Caleb Connolly (3):
      arm64: dts: qcom: sm8150: add other QUP nodes and iommus
      arm64: dts: qcom: sm8150: add i2c nodes
      dt-bindings: qcom: geni-se: document iommus

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 549 +++++++++++++++++++++++++++++++=
++++
 1 file changed, 549 insertions(+)x


