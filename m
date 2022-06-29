Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4435600D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 15:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbiF2NDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 09:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbiF2NDJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 09:03:09 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB16C26
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 06:03:06 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id k129so7919913wme.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LohcD18nlQ+6W427GJ2K1kt6TSNfZnpRNiSGMheeips=;
        b=jCu1LYGCwdgppXnuWg0ZvIwnBm4lHUhp0t6I7wq3O0HF0zuwFpi7iPNd5F1ggyNGdD
         Uy5zF86WsFYoj3OHrbSVOmo/IY8yYcS9buEOsyGE0HlDjhm887KGe0FUEPftPG3E+28t
         9PgaKDtNjqGB7GdI4o4IrM7hruiABbGMp9PPM/SCxLjuBScB8dUr1wGIOolziG2vFefw
         Uvgw2nrtloEixaUkvE2QmWzbqvXRQ+G1XWs5AH8EvTWXS+/EYMLdFffOiDQjLT3aSyjE
         xZ2i3+Z38EIZd49JFx/7Mzzc5DybkhsXfFfUjXMfnuPqYKtr+1UVQibiFGOKb0YpJmHX
         eqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LohcD18nlQ+6W427GJ2K1kt6TSNfZnpRNiSGMheeips=;
        b=71DcDTlRVlT3nzB1wUk2XUm0AMxX6UZEEsB8sXBlhHodHJWFsS+MMTAOEekMyDEd+u
         CSssjSUs7iuKYPp9jQvsdEbQtPyYbcyRPDyyn9KHOP4TG0n2Bs8nompod0ZCZmJxdaXx
         Cdr2SismaxfHEFGKQYTSc3ZOOqop2pshluNdDv4rWPidME3I1NNmV9EcW8P2d/ED/8Zu
         OQnJ+PtQ0hD2Xd5+n1F+xuwNLdo3j3k8yfb9L8B1Lw3qGUlvkkvZlwXZDZjA0dC77tfg
         JWZlGLNxh5ol50EqJ+H7p2kgYdslQac7pwRL9Pk7lsXEhNPkGCZscFVYAq71wlNs4GYL
         io8Q==
X-Gm-Message-State: AJIora/pDeK2+po4FhlOgCQ6dB66+6wblP6VSk3OrJ5wBSUfp+lhhDb5
        z/WT9Uo5Rwhrdlwqk6uz7JEr5Q==
X-Google-Smtp-Source: AGRyM1suqyEaDNY90LxZuwNUL3qYV1iZwH1FclDeTxACXRgX6r1imALYCKwVS8QyOzcbvFxJItfPow==
X-Received: by 2002:a05:600c:2113:b0:3a0:432c:a8e8 with SMTP id u19-20020a05600c211300b003a0432ca8e8mr3678064wml.71.1656507785391;
        Wed, 29 Jun 2022 06:03:05 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g1-20020adffc81000000b00213ba3384aesm17056979wrr.35.2022.06.29.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 06:03:04 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RESEND PATCH 0/5] qcom-cpufreq-nvmem: Add msm8939 with some fixups
Date:   Wed, 29 Jun 2022 14:02:58 +0100
Message-Id: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
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

V1 RESEND:

Resending the series with a better description to give context.

This is a simple precursor series to add the msm8939 SoC dtsi.

- dt-bindings fixes. We are missing some documentation for existing compat
  strings in qcom-cpufreq-nvmem.yaml
- dt-bindings add in msm8939 to qcom-cpufreq-nvmem.yaml
- Add the msm8939 to the cpufreq-dt-platdev exclusion list
- Fixing the naming of the code in qcom-cpufreq-nvmem so that we can
  re-use the qcs404 code for msm8939
- Adding msm8939 to the qcom-cpufreq-nvmem driver compat list

Most of the msm8939 stuff is down to dt-bindings fixups and then adding the
SoC dtsi. The minor exception here of needing to add the msm8939 compat to
qcom-cpufreq-nvmem.c.

A relatively tidy/scrubbed integrated tree for msm8939 is here for
reference.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-27-06-22-msm8939-no-cpr-v4

V1
Fix up some missing compat strings for the qcom-cpufreq-nvmem yaml.
Add in msm8939 as a compatible qcom-cpufreq-nvmem.

Bryan O'Donoghue (5):
  dt-bindings: opp: Add missing compat devices
  dt-bindings: opp: Add msm8939 to the compatible list
  cpufreq: blocklist Qualcomm msm8939 in cpufreq-dt-platdev
  cpufreq: qcom-cpufreq-nvmem: Rename qcs404 data to cpr_genpd
  cpufreq: qcom-cpufreq-nvmem: Add msm8939 as cpr_genpd

 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 7 +++++++
 drivers/cpufreq/cpufreq-dt-platdev.c                     | 1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c                     | 9 +++++----
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.36.1

