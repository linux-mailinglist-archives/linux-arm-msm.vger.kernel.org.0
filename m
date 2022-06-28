Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B15E55E301
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241245AbiF1A3G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 20:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiF1A3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 20:29:05 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140F2FED
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l68so1344956wml.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=loKOPYEWFVKgOL34le0TQOd8p13z6rW/uil4PBQiVZo=;
        b=OhdpsxGnp2/q17T55ktpvb/b6MmmJXnaW2TaL51pjQydoKSVKvjp5C/WkAHat5kkc4
         ogilw7mi9Je2FLlZZO1M8tw6LDovGZ2VHZRghSYs8liGrOFGL8ZkfXbZ5a9d/RKSWeqZ
         8o3UOcjM6Jjv8JqEZIR971EdJQ4mFvqU+txeOQ7iCiw9Zo6/fuaCEmtjy4+SGunADfF5
         AwlYhVQsHDhzqF27WZf3leCUgteQ9R1lnqTNy40DMpLXkEORtsrftXxXYn1NhhKBtnw0
         GLLQ/87HJmD8ABw/8LQGvpvNpG2XCWsgk7s1ZzecS7k6AXtFy9mXvLDOwn8Fik4NNxKy
         J9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=loKOPYEWFVKgOL34le0TQOd8p13z6rW/uil4PBQiVZo=;
        b=2212Kug9Q3OZT9VfNmS73YbU8Wcru2FKUd1tM9DiujvddEMnoBM2QbmPWRUuxS0tGp
         i/ZnlRH802QwSjOPN584lPjT0YEe0Oce0Mf9Z4DlIvxIMd6ElikEHMAWpmfnGvf4/M+u
         1/pCP/DcJ3U3YQIcHJTaD3QwqMhU+HHxEdHxtfgBPuQHi4rCkFFdq1JB7uMe4yLIYn/l
         u+3XY1+VuLJg0Pb9mgbl+b8++15Q3rffLLHiNaiGZ/BCYACvjJGfi6fejXEBeXMgealg
         Hon+DdMuSnMKi2pmtb2zPvJPbvJwVXeGGfJ2XHo/1FoxpbnhELLTLtHNP7iEhbdUvD0q
         Pp0g==
X-Gm-Message-State: AJIora+yscX22GO7pe0UWFa35HZnfxLglfM3i0AnNVlruMoHDfrAipK5
        ry5wtJ0nPn82k3nDP929CV2H9w==
X-Google-Smtp-Source: AGRyM1trccyFgpOxm8KXrYfjR5QINHk1rCNh5iLz0EYzh8UxKqRWlYjP2MEwkDM3xR0Bez+UNxkvlA==
X-Received: by 2002:a1c:2902:0:b0:3a0:2a05:c639 with SMTP id p2-20020a1c2902000000b003a02a05c639mr18924451wmp.31.1656376142540;
        Mon, 27 Jun 2022 17:29:02 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o42-20020a05600c512a00b0039c5cecf206sm15863560wms.4.2022.06.27.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 17:29:02 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
Cc:     perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v4 0/2] Fix apq8016 compat string
Date:   Tue, 28 Jun 2022 01:28:56 +0100
Message-Id: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

V4:
- Adds Bjorn's RB to first patch
- Adds missing people to To/Cc list

V3:
- Marks qcom,lpass-cpu-apq8016 as deprecated instead of removing - Bjorn

V2:
- Adds Reviewed-by: - Srini
- Adds Fixes - Srini

V1:
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
 sound/soc/qcom/lpass-apq8016.c        | 1 +
 sound/soc/qcom/lpass-cpu.c            | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.36.1

