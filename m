Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2320152E0E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 01:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343776AbiESXvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 19:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242895AbiESXva (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 19:51:30 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B9631353
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 16:51:27 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id v10so6334168pgl.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O68zOwYSR6b5bIhMSQfgIGQAc/cdqbvjZPUOTjfh09U=;
        b=gfq/frvCvea+Jl6JVCs1ZnXx5YZ0mp2A2abNlzF2s1fF+s7AzqcGazJmmNCb0KNec1
         SEy2fOrPkGUDjf4hzrsvvImF+GP4koXcKJDVLDEZW3cy9mDDq8vBNdh3K8GxLU+l48SL
         uY3ACHgkzO5q9VYZ5ncO9sHAMFGRBHXLhaB60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O68zOwYSR6b5bIhMSQfgIGQAc/cdqbvjZPUOTjfh09U=;
        b=wMOyc0McvjeDZk18HIynMN3iqwwE1QVhq2mCTzy7GXQfRaB9VRGkbCtPkEWrfaNYhv
         493HdDHXcEznk59Ru925ZwKneGknvFLY9S4S/1CCkGrR5hCBANKM9e1Ulf0S7d1TObg2
         zV9chhaB+FcZN6RSIJ2kF5axsOYj3C+X5j3dLeUhYfTsOVKvqz1Uab41dRg3XfwXCten
         KfU8E8YO1VVGFSc2MldzgwRMzfiBzlR87DGm68VOMfBVWpYoKnlW45iedY9UfjNKDLnN
         B1f9N7Zeq4dxr1w95j2f4s2nTxK2T2wzqLOar/H8Ny4Xbtj1239ly5LJICSlJHXY61ra
         Qz4w==
X-Gm-Message-State: AOAM532hHW1nEJGTB9M7IdGntKMC+/NwwK11dE98gsKHcWDH/dUaIYqz
        KhpSoh67xepkGthcbcxtdWePdA==
X-Google-Smtp-Source: ABdhPJyamfEkeHtpOdtcg6ZxrEdQGZCexKa9myBcRzDRrg9mGVcijU6CctbM2iy+F++LJtTegbPK0A==
X-Received: by 2002:aa7:83d0:0:b0:50c:eb2b:8e8a with SMTP id j16-20020aa783d0000000b0050ceb2b8e8amr6950116pfn.31.1653004287251;
        Thu, 19 May 2022 16:51:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:e45f:1f3c:299b:4d86])
        by smtp.gmail.com with ESMTPSA id m2-20020a6545c2000000b003c18ab7389asm4128992pgr.36.2022.05.19.16.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 16:51:26 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        patches@lists.linux.dev, devicetree@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: Document how Chromebooks with depthcharge boot
Date:   Thu, 19 May 2022 16:51:05 -0700
Message-Id: <20220519164914.v3.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This documents how many Chromebooks pick the device tree that will be
passed to the OS and can help understand the revisions / skus listed
as the top-level "compatible" in many Chromebooks.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
In my opinion this could land through the Qualcomm dts64 tree, mostly
because I want to land bindings patches in that tree that refer to
it. Since it's a new file it seems like there ought to be few
objections?

Changes in v3:
- Fix up typos as per Matthias.
- Move under Documentation/arm/google/ as per Krzysztof.
- Add missing newline at end of file.

Changes in v2:
- ("Document how Chromebooks with depthcharge boot") new for v2.

 .../arm/google/chromebook-boot-flow.rst       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/arm/google/chromebook-boot-flow.rst

diff --git a/Documentation/arm/google/chromebook-boot-flow.rst b/Documentation/arm/google/chromebook-boot-flow.rst
new file mode 100644
index 000000000000..92d8a658ceaa
--- /dev/null
+++ b/Documentation/arm/google/chromebook-boot-flow.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Chromebook Boot Flow
+======================================
+
+Most recent Chromebooks that use device tree are using the opensource
+depthcharge bootloader. Depthcharge expects the OS to be packaged as a "FIT
+Image" which contains an OS image as well as a collection of device trees. It
+is up to depthcharge to pick the right device tree from the FIT Image and
+provide it to the OS.
+
+The scheme that depthcharge uses to pick the device tree takes into account
+three variables:
+- Board name, specified at compile time.
+- Board revision number, read from GPIO strappings at boot time.
+- SKU number, read from GPIO strappings at boot time.
+
+For recent Chromebooks, depthcharge creates a match list that looks like this:
+- google,$(BOARD)-rev$(REV)-sku$(SKU)
+- google,$(BOARD)-rev$(REV)
+- google,$(BOARD)-sku$(SKU)
+- google,$(BOARD)
+
+Note that some older Chromebooks use a slightly different list that may
+not include sku matching or may prioritize sku/rev differently.
+
+Note that for some boards there may be extra board-specific logic to inject
+extra compatibles into the list, but this is uncommon.
+
+Depthcharge will look through all device trees in the FIT image trying to
+find one that matches the most specific compatible. It will then look
+through all device trees in the FIT image trying to find the one that
+matches the _second most_ specific compatible, etc.
+
+When searching for a device tree, depthcharge doesn't care where the
+compatible falls within a given device tree. As an example, if we're on
+board "lazor", rev 4, sku 0 and we have two device trees:
+- "google,lazor-rev5-sku0", "google,lazor-rev4-sku0", "qcom,sc7180"
+- "google,lazor", "qcom,sc7180"
+
+Then depthcharge will pick the first device tree even though
+"google,lazor-rev4-sku0" was the second compatible listed in that device tree.
+This is because it is a more specific compatible than "google,lazor".
+
+It should be noted that depthcharge does not have any smarts to try to
+match board or SKU revisions that are "close by". That is to say that
+if depthcharge knows it's on "rev4" of a board but there is no "rev4"
+device tree then depthcharge _won't_ look for a "rev3" device tree.
+
+In general when any significant changes are made to a board the board
+revision number is increased even if none of those changes need to
+be reflected in the device tree. Thus it's fairly common to see device
+trees with multiple revisions.
+
+It should be noted that, taking into account the above system that
+depthcharge has, the most flexibility is achieved if the device tree
+supporting the newest revision(s) of a board omits the "-rev{REV}"
+compatible strings. When this is done then if you get a new board
+revision and try to run old software on it then we'll at pick the most
+reasonable device tree. If it turns out that the new revision actually
+has no device-tree visible changes then we'll not only pick the most
+reasonable device tree, we'll pick the exact right one.
-- 
2.36.1.124.g0e6072fb45-goog

