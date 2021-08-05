Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC7C3E1A42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 19:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239314AbhHERU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 13:20:26 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:49223 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239104AbhHERUZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 13:20:25 -0400
Date:   Thu, 05 Aug 2021 17:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628183977;
        bh=7izCnF0Uw2Se+iLMSn8VthNxs9nTJoWyUg8PyGlT0e0=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=xP0BWamIFPU6YrzDYhwyXhz8KlwZ887I/QuY0nAGLrpZaGDIh5KjpNq3GoDQHRvJA
         L2ehMUBNRrHNdw2sJ8CwwntfENTDnRDRQ+eh171s5/ZY5IBevFTsOzyncEG/1oYngD
         jf9n4XJmAn0YedyKWCAv08z46m7DzzVDV7HCn0GA=
To:     bjorn.andersson@linaro.org, sboyd@kernel.org
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <junak.pub@gmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH 1/2] dt-bindings: clock: qcom-rpmcc: Add compatible for MSM8953 SoC
Message-ID: <c662hoLme5MIdelk5BVPsVgN77IqTLS0KwYwpauJiDs@cp3-web-047.plabs.ch>
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

From: Vladimir Lypak <junak.pub@gmail.com>

Add compatible for MSM8953 SoC.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Docum=
entation/devicetree/bindings/clock/qcom,rpmcc.txt
index 6cf5a7ec2b4c..b35ffaf7e053 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -15,6 +15,7 @@ Required properties :
 =09=09=09"qcom,rpmcc-msm8226", "qcom,rpmcc"
 =09=09=09"qcom,rpmcc-msm8916", "qcom,rpmcc"
 =09=09=09"qcom,rpmcc-msm8936", "qcom,rpmcc"
+=09=09=09"qcom,rpmcc-msm8953", "qcom,rpmcc"
 =09=09=09"qcom,rpmcc-msm8974", "qcom,rpmcc"
 =09=09=09"qcom,rpmcc-msm8976", "qcom,rpmcc"
 =09=09=09"qcom,rpmcc-apq8064", "qcom,rpmcc"
--=20
2.32.0


