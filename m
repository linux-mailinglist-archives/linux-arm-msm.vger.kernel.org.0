Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384225E7F23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 17:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiIWP6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 11:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbiIWP6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 11:58:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A32C147CE8
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 08:57:49 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i26so928930lfp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hOgaSJV/qvshW50YoXul8vltWjgqBUI4d7EfeiEA4BM=;
        b=MKPUXAAvaHSrIM4Us8EwlpoRHPY3EvytcNQ8V3FJPDu62QIfKK6mI4892tWNP6yehZ
         erE4WyAyNalnxfDd0xlZnH3CMUresc4WdqtqUf9OTfZP+N68rTDd6KH4jCfX/YOvGtTJ
         nOreixgDnKWdczMNGBvh89puBhDNp6OubPGDI9I7PlcdEjvXcrC801omCmI7XnzwmZYy
         ll3q3W3p8htZqu9vWdSfGGHl2uHMBjU44UdMnMmWNLIZlCHzZqJtMxTigiymKohb03/t
         ykKlSKpek5vY+sibK/yXD1+exLoXM2nKkv4Gpv9UI8wtAjPoK5coIKiyCYSpfRcVhrFq
         1+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hOgaSJV/qvshW50YoXul8vltWjgqBUI4d7EfeiEA4BM=;
        b=tOk+mDtMEgyN5NbBhQkmyX2VmOY0wYgVk0eaOlTCyFUdhwe9KaT0ZKosqzHcHviJhg
         ujGpJnqZ/GWybTe+UNOa2MwfyOHjL80OMlHc1zGuDYOXtkyGkVFXD/Cpa53vsDm73fJP
         69dXkxLF8ycaf/x8lYKR/mkEWvoWgXgmAQFTqnTZXUU01XAPcmBW5QPGn9hiiH1CDMsu
         RAinepdTYq7g036VIFI4a+1RGhLoAlhIUyFzq14WrCEzS1L3txS+43o+3GLKXNJjX4XD
         jlEiL1F9DGD31vvk9fH6h+K+82Ic3yi983i324T89zCK3+kmM3ejZGM2nkIV4Y/t7dKm
         AxWA==
X-Gm-Message-State: ACrzQf2KIf+HUdHurRK/0SUxyVnrrberppzaQwYc3HLftAMZGIZn8B3A
        F3YRtkwfKUoEiE1MkBDAmWrWx7q0g/mQmA==
X-Google-Smtp-Source: AMsMyM6a0qhq/H+1+xSmcaZG6QjlDYqHTpFfeGibPe6fhDBAO3rpFsP92G7Vzpexp0uDV9zvPHflWw==
X-Received: by 2002:a05:6512:3f90:b0:48a:826d:f727 with SMTP id x16-20020a0565123f9000b0048a826df727mr3317397lfa.281.1663948667475;
        Fri, 23 Sep 2022 08:57:47 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be17-20020a056512251100b0049a4862966fsm1502286lfb.146.2022.09.23.08.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:57:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] slimbus: stream: add checks for invalid unprepare/disable usage
Date:   Fri, 23 Sep 2022 17:57:36 +0200
Message-Id: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

slim_disable_stream() and slim_stream_unprepare() are exported, so add
sanity checks preventing unmatched/invalid calls.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/stream.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 75f87b3d8b95..7bb073ca6006 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -407,6 +407,9 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
 	struct slim_controller *ctrl = stream->dev->ctrl;
 	int ret, i;
 
+	if (!stream->ports || !stream->num_ports)
+		return -EINVAL;
+
 	if (ctrl->disable_stream)
 		ctrl->disable_stream(stream);
 
@@ -438,6 +441,9 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
 {
 	int i;
 
+	if (!stream->ports || !stream->num_ports)
+		return -EINVAL;
+
 	for (i = 0; i < stream->num_ports; i++)
 		slim_disconnect_port(stream, &stream->ports[i]);
 
-- 
2.34.1

