Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033BA3AD17F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbhFRRyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:54:14 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:48326 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbhFRRyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:54:13 -0400
Date:   Fri, 18 Jun 2021 17:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1624038721;
        bh=zHJfb44A7X0HFfXTVEm04fud03pGMpHQweD3iUEqQos=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=UA26RVxILTeGhbZLSV7Z1m2RLmf0VOYLQNBEpOr6sds9PNAQHSdFxgNyZZpZ0xfde
         B8igw4/dAvbkpTc6NHKqQzrbvXRh+4+fUvQkVrMibl/dQp8uszJUc85so0gOMKwqXX
         f8e5UoZNKVQeHaJg1MAhPZYK609iyhN5eU0Y/1c4=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jami.kettunen@somainline.org,
        jo@jsfamily.in, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [RESEND PATCH v2 6/6] arm64: dts: qcom: msm8998-oneplus-common: Enable PMI8998 haptics
Message-ID: <20210618175041.323495-7-caleb@connolly.tech>
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

From: Jami Kettunen <jami.kettunen@somainline.org>

The OnePlus 5 and 5T both have a haptics engine connected to PMI8998.

Signed-off-by: Jami Kettunen <jami.kettunen@somainline.org>
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/ar=
m64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index 0f5c7828a901..4494eb6794b4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -257,6 +257,12 @@ pinconf {
 =09};
 };

+&pmi8998_haptics {
+=09status =3D "okay";
+
+=09qcom,wave-play-rate-us =3D <4255>;
+};
+
 &qusb2phy {
 =09status =3D "okay";

--
2.31.1


