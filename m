Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB9D407ADA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Sep 2021 01:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbhIKX3Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 19:29:25 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:56482 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234558AbhIKX3X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 19:29:23 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id C9EC9CB1FD;
        Sat, 11 Sep 2021 23:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1631402889; bh=SBiA58xTiqjsvkQsR1y40mscyUIMFk4rOMRYeRucm3Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=l1CXgOS5WJOe57V4qUWWREgXuRCi6jen5Gx/jGp5gjWj9/fuUG8ugWCaFgSnBSIAq
         /zw+xtK/uzpvUNeRP+p44D7EhNZPy9Iu7fK5Kah+E74YZi8TeK36PRj6xfqnuf2OLy
         9lE9VdD8BCEucS7bP0zf6Typ/j/41lVUi5yzxI+I=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Hao Fang <fanghao11@huawei.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] dt-bindings: vendor-prefixes: add LG Electronics
Date:   Sun, 12 Sep 2021 01:27:00 +0200
Message-Id: <20210911232707.259615-7-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911232707.259615-1-luca@z3ntu.xyz>
References: <20210911232707.259615-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

LG Electronics is a part of the LG Corporation and produces, amongst
other things, consumer electronics such as phones and smartwatches.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..b99af98bf5de 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -635,6 +635,8 @@ patternProperties:
     description: Lenovo Group Ltd.
   "^lg,.*":
     description: LG Corporation
+  "^lge,.*":
+    description: LG Electronics Inc.
   "^lgphilips,.*":
     description: LG Display
   "^libretech,.*":
-- 
2.33.0

