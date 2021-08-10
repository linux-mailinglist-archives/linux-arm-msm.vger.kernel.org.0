Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274CD3E7DB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 18:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhHJQpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 12:45:49 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:53617 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhHJQpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 12:45:46 -0400
Date:   Tue, 10 Aug 2021 16:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628613890;
        bh=OLeQ1PDncRXppNSDenzX0HElC/Q+Ws/lF/gnav7BV7w=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=lI3FOfAKXMYfMDjpu08H09GDOTmVApgGszpRQVo5Uhv+w/b/ACABEjFnxprIEWifN
         S56KWELwc/WgzoNb7Tk2gv1hBoj1ZzFddlBlu7YJsyCajh+V46pkNfqK8E9HxDDZTP
         yGThqbIyB7oaGPL9xmCyW1uU1M30ncpKhRCFdpeM=
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        jassisinghbrar@gmail.com
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        sivaprak@codeaurora.org, Vladimir Lypak <junak.pub@gmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH 3/4] dt-bindings: firmware: qcom-scm: Document msm8953 bindings
Message-ID: <20210810164347.45578-4-sireeshkodali@protonmail.com>
In-Reply-To: <20210810164347.45578-1-sireeshkodali@protonmail.com>
References: <20210810164347.45578-1-sireeshkodali@protonmail.com>
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

SCM driver on MSM8953 requires 3 clocks.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Docu=
mentation/devicetree/bindings/firmware/qcom,scm.txt
index a7333ad938d2..284b4b7a3b60 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -15,6 +15,7 @@ Required properties:
  * "qcom,scm-mdm9607"
  * "qcom,scm-msm8660"
  * "qcom,scm-msm8916"
+ * "qcom,scm-msm8953"
  * "qcom,scm-msm8960"
  * "qcom,scm-msm8974"
  * "qcom,scm-msm8994"
@@ -33,7 +34,7 @@ Required properties:
  * core clock required for "qcom,scm-apq8064", "qcom,scm-msm8660" and
    "qcom,scm-msm8960"
  * core, iface and bus clocks required for "qcom,scm-apq8084",
-   "qcom,scm-msm8916" and "qcom,scm-msm8974"
+   "qcom,scm-msm8916", "qcom,scm-msm8953" and "qcom,scm-msm8974"
 - clock-names: Must contain "core" for the core clock, "iface" for the int=
erface
   clock and "bus" for the bus clock per the requirements of the compatible=
.
 - qcom,dload-mode: phandle to the TCSR hardware block and offset of the
--=20
2.32.0


