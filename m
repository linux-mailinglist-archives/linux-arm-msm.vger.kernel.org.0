Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFD6A506015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 01:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbiDRXMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 19:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234333AbiDRXMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 19:12:42 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7519813DD5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 16:10:00 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id v64-20020a1cac43000000b0038cfd1b3a6dso393812wme.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2eS8dVsua4f7NZqwwIN43RTvkPV8UuibGewXew9r9c=;
        b=n/beXps5kGdnYp4k0CPcZPGOpRVwWmzgCseSSJvifvrk43ZGeiJEVxdZcC8wPniAgt
         TB26z4ahk8m8NHyhUX1YdTdhvzI81Ynn0XX/NzMatB31FKkWtWQOpyXoAzerM4/HKgj3
         BN1c+jQKh5pv3fk4/EiQeRbdH6mclmrn70oyLov0cFxwGSINBzvDz0dnRptIz1S4TqqZ
         Qlv7bc1c6FYtuaIMJdzsYNMVoJTojQvKhuxvOjMNPQODXCQwWNQWu2HZK+7MQMF0Ny2X
         pa7TiGA1DW4GJdFEcWH1bGOgs5hysLv9AG3yq/m6VMqWflN3HWGhj7qAxkSxgPJpknUK
         rpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2eS8dVsua4f7NZqwwIN43RTvkPV8UuibGewXew9r9c=;
        b=3n99zNEun+lNINJ5oG/ju1EmNH5wz+YqmBDnOc203q/K3SzpyIGoPyzNnMRxF8cz98
         zURgJXWynN0+zummZPdAAdZhKbCPuuWAOTrW9bBNmZ7SpcTtOVAVsu/cNWmV+FSZ/3jY
         E0my3lLd4gkqJ3GR3hw7MjrlkpdItxoi+m/5egm3QLICbgjKcHd6oV4ADRLRDYXkitBl
         JI5/48yACbHt8wazp7N/qpXD7Dvp994DW4hXY+ERrIiKR4z3qgnwTc+x8IHKTJrwAW0B
         bsiGwhTafFWFcPnJOiGDX75mXodknaZ2OTVqN+1+O2V3jNgLT8CQWi/1zYFtmiPoXW7K
         Ps9g==
X-Gm-Message-State: AOAM530yHLby/v2CtTEqM3/lq8Dgj2hmYkQ8fH+fNpxpj10SG1CNsrAg
        xqz15NxDx9QFwKntD2Vzc/5HnQ==
X-Google-Smtp-Source: ABdhPJzRGfJnMqMhSrtoacpg2O0W/2btZytxeb9m2V4HTN3SDQCCBRmi2vG/aBKD02PYXZkGu6n25Q==
X-Received: by 2002:a05:600c:4e87:b0:38e:ada5:5c6f with SMTP id f7-20020a05600c4e8700b0038eada55c6fmr12835776wmq.21.1650323398675;
        Mon, 18 Apr 2022 16:09:58 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d568e000000b00207ae498882sm11187567wrv.32.2022.04.18.16.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 16:09:57 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 0/2] Fix apq8016 compat string
Date:   Tue, 19 Apr 2022 00:09:54 +0100
Message-Id: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reusing the apq8016 on msm8939 I found running checkpatch that the compat
string for the LPASS was throwing a warning.

This is easily fixed by alinging the YAML, DTS and driver to the documented
compat string

-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";

Bryan O'Donoghue (2):
  ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
  arm64: dts: qcom: Fix apq8016 compat string to match yaml

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 sound/soc/qcom/lpass-apq8016.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.35.1

