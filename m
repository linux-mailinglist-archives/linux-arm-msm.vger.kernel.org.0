Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0010652F52E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 23:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbiETVi5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 17:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353698AbiETVi4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 17:38:56 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EBA17B851
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 14:38:54 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id a38so5898496pgl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 14:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JY2yFL0uwa0h1jwIIpYY9zlYj6tua2HV5MA+NWkzrlM=;
        b=VKf459qgtfIN2nwURKwdzW9/x2MsK2XhWFkIQpwhoxQ8B5sQdZZgm7CeI51WyA1W8i
         bjiZRrIlXQ35qjT+7Fa/pZWRw9ZTLZ6PtWfv9obMY1QnNlnruEZ141wZD3m34+6puxNG
         uvZJ/F6VbPYrW+4mXStLdi94M3px/tar/ZhFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JY2yFL0uwa0h1jwIIpYY9zlYj6tua2HV5MA+NWkzrlM=;
        b=zVm+iQz7SWvdGyQoTkbKBOGRQ+UOL4bFVVMPfTyTrTRKS9eNgXkiSO3/kuAO3Ybtxb
         2+PHvgnH/OoPo1I/Efeb6yHHcQedOgRCuolOdjnsnLRyXH2ddUhAXHKOXMsDqL8afiPF
         yuEW/v2S3BglhiDl9w/XJGihmLrQJItyeapCbCyLIV+YJg1amz/FJfwt4P+JLPECbRwZ
         dDinXRQOGGjgaXFNnuQF/uPqJSgkEEATGQec/dRVu5oeD8jpOucjWbDree1Ico3/Omic
         6961OlttARYOC4tEinS3EKCllEB3t0iz8kx0xYssI+zeGc4l0t+8j28r2hO7WVvZZArk
         qyMQ==
X-Gm-Message-State: AOAM531MbT1CZVbWEZtttwg8QXkOeRFonBOI0/vaEXJMAXHlmRoXlS7U
        7qiZyoRQaH+BILXhkJo0H+ATRQ==
X-Google-Smtp-Source: ABdhPJyQ7sTZ4EOkBnkyPfFAtpjkbiEhqkikYoQc6iCiuVDywMgjCXw9CxDj9gsimAlD7Cxsu5AJnA==
X-Received: by 2002:a63:2b11:0:b0:3f6:5f7f:9e67 with SMTP id r17-20020a632b11000000b003f65f7f9e67mr6384417pgr.492.1653082733609;
        Fri, 20 May 2022 14:38:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:b090:3896:c312:c4df])
        by smtp.gmail.com with ESMTPSA id u13-20020a17090a450d00b001df955c28f6sm2070864pjg.37.2022.05.20.14.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 14:38:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        patches@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Julius Werner <jwerner@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] dt-bindings: Document how Chromebooks with depthcharge boot
Date:   Fri, 20 May 2022 14:38:41 -0700
Message-Id: <20220520143502.v4.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This documents how many Chromebooks pick the device tree that will be
passed to the OS and can help understand the revisions / SKUs listed
as the top-level "compatible" in many Chromebooks.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
In my opinion this could land through the Qualcomm dts64 tree, mostly
because I want to land bindings patches in that tree that refer to
it. Since it's a new file it seems like there ought to be few
objections?

Changes in v4:
- Add reference to depthcharge and FIT Image.
- A few rst syntax fixups found by using a different rst preview.
- Updated wording as per Stephen.

Changes in v3:
- Fix up typos as per Matthias.
- Move under Documentation/arm/google/ as per Krzysztof.
- Add missing newline at end of file.

Changes in v2:
- ("Document how Chromebooks with depthcharge boot") new for v2.

 .../arm/google/chromebook-boot-flow.rst       | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/arm/google/chromebook-boot-flow.rst

diff --git a/Documentation/arm/google/chromebook-boot-flow.rst b/Documentation/arm/google/chromebook-boot-flow.rst
new file mode 100644
index 000000000000..36da77684bba
--- /dev/null
+++ b/Documentation/arm/google/chromebook-boot-flow.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Chromebook Boot Flow
+======================================
+
+Most recent Chromebooks that use device tree are using the opensource
+depthcharge_ bootloader. Depthcharge_ expects the OS to be packaged as a `FIT
+Image`_ which contains an OS image as well as a collection of device trees. It
+is up to depthcharge_ to pick the right device tree from the `FIT Image`_ and
+provide it to the OS.
+
+The scheme that depthcharge_ uses to pick the device tree takes into account
+three variables:
+
+- Board name, specified at depthcharge_ compile time. This is $(BOARD) below.
+- Board revision number, determined at runtime (perhaps by reading GPIO
+  strappings, perhaps via some other method). This is $(REV) below.
+- SKU number, read from GPIO strappings at boot time. This is $(SKU) below.
+
+For recent Chromebooks, depthcharge_ creates a match list that looks like this:
+
+- google,$(BOARD)-rev$(REV)-sku$(SKU)
+- google,$(BOARD)-rev$(REV)
+- google,$(BOARD)-sku$(SKU)
+- google,$(BOARD)
+
+Note that some older Chromebooks use a slightly different list that may
+not include SKU matching or may prioritize SKU/rev differently.
+
+Note that for some boards there may be extra board-specific logic to inject
+extra compatibles into the list, but this is uncommon.
+
+Depthcharge_ will look through all device trees in the `FIT Image`_ trying to
+find one that matches the most specific compatible. It will then look
+through all device trees in the `FIT Image`_ trying to find the one that
+matches the *second most* specific compatible, etc.
+
+When searching for a device tree, depthcharge_ doesn't care where the
+compatible string falls within a device tree's root compatible string array.
+As an example, if we're on board "lazor", rev 4, SKU 0 and we have two device
+trees:
+
+- "google,lazor-rev5-sku0", "google,lazor-rev4-sku0", "qcom,sc7180"
+- "google,lazor", "qcom,sc7180"
+
+Then depthcharge_ will pick the first device tree even though
+"google,lazor-rev4-sku0" was the second compatible listed in that device tree.
+This is because it is a more specific compatible than "google,lazor".
+
+It should be noted that depthcharge_ does not have any smarts to try to
+match board or SKU revisions that are "close by". That is to say that
+if depthcharge_ knows it's on "rev4" of a board but there is no "rev4"
+device tree then depthcharge_ *won't* look for a "rev3" device tree.
+
+In general when any significant changes are made to a board the board
+revision number is increased even if none of those changes need to
+be reflected in the device tree. Thus it's fairly common to see device
+trees with multiple revisions.
+
+It should be noted that, taking into account the above system that
+depthcharge_ has, the most flexibility is achieved if the device tree
+supporting the newest revision(s) of a board omits the "-rev{REV}"
+compatible strings. When this is done then if you get a new board
+revision and try to run old software on it then we'll at pick the
+newest device tree we know about.
+
+.. _depthcharge: https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/depthcharge/
+.. _`FIT Image`: https://doc.coreboot.org/lib/payloads/fit.html
-- 
2.36.1.124.g0e6072fb45-goog

