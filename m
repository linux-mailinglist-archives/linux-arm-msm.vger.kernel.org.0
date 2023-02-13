Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7BED69468A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 14:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjBMNIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 08:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjBMNIK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 08:08:10 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF05B76F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 05:08:09 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id p12so5613269edc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 05:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4AVcCCcYCu1fsMnLX3/oSK0Cfjy5k3u75GS4x79cKTs=;
        b=tz0310KlBh5GPVmktnvrXetOzJbccq8d0VOEa29VycTzE8TFMdVcbAZkrZqHvpQ6E5
         /mPBiEb61U5uICRbNb8ohFRT/hEed0y7fBhwHDJuH0oK4Vpub7OsMefusyxcrwbQEb51
         lfap9Mb/wS6+t4S5EnJrw1yV+OHGXooglTLYGKs/h21Fh7GTjAa4ThRKOUe8G8FFb4cV
         kmXhKdCYK/rsOsSnlDvqXUXk1orQ9DZTZie/o0LcKa2P0VEaY7jqO0T1r3EZZPSsgBE1
         dKxoASAUcwKvJd/PLFxhCSZIUyDI9r/BVeVmL0wSQc8JaqmCQ03TQ04KrDBjRzBi+YUU
         xhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AVcCCcYCu1fsMnLX3/oSK0Cfjy5k3u75GS4x79cKTs=;
        b=ImqusNTfXAsfREqZni9lnFZnAZ8PtelwgXMdp1ULH0iR4xX3ZaEMoMvqlnws3yNOAp
         wmoikX1YZJOBaLTgpOz/5LAaeNP1ybfSoxDtYVzpTn1TqQ+Yu2K7PL7Qj8y8ARdvKKCJ
         r3+fRsCJsom4bIVYdjXdWr+p/W6fyK/t2ZOLr0+oBt+oyexkFhmv0VXXmlwLjKLUSk6t
         bU2dym6m8PkZuZEjUVHm4MsrI+1NbuWtzWTeMfulzUw5XZke930rRUy3v4RnE1weM+Lo
         0BLg0P/B2ZvFFgy8/+leGbgSw3Ja95eBDU8b9ojyc9q8C8sWTJxPIxFq4EnMrkJuT4MJ
         Dz2Q==
X-Gm-Message-State: AO0yUKVMFGOFsjsYJt5agymgF2nqQdAEYBTEZnwf3E5iNghIKrgIoXoA
        NajZpzJ8siummzEGmlJRqw+8CA==
X-Google-Smtp-Source: AK7set+DrDzcNW1MQoBQpzKs+ALuGsDq7h4QQMtvYUdTF4DzLCFf2Yo9TYPuGxg4SP/o8FbEb/NDYg==
X-Received: by 2002:a50:cdc2:0:b0:4ab:d0de:f7ec with SMTP id h2-20020a50cdc2000000b004abd0def7ecmr9027613edj.5.1676293687757;
        Mon, 13 Feb 2023 05:08:07 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id f22-20020a50a6d6000000b004acc6cbc451sm1616515edc.36.2023.02.13.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:08:07 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
X-Google-Original-From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 0/2] Add pm_runtime support to SM6350 camcc
Date:   Mon, 13 Feb 2023 14:08:05 +0100
Message-Id: <20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADU26mMC/4WOSw6DIBiEr2JY9zc8FGtXvUdjGkCoLEQCan3Eu
 xe9QJffTL7M7CjqYHVEj2xHQc822sEloLcMqU64jwbbJkYUU4YpYRB7zkoMSvRKQZjcaHv99j1
 wVsuqVKwtJEHJliJqkEE41Z2+8QXwnMLX+rP1QRu7XLuvJnFn4ziE9boxkzP9vzgTwFBxYhSvT
 SXu+LkxN075sm6oOY7jB+dotlHcAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As pointed out during patch review, we should make sure that we turn on
the CX power domain when camcc is in use, and also disable it (or remove
our vote on it) when camcc is not in use.

For this add pm_runtime support to the driver and stick the power-domain
in the devicetree.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v2:
- no change resend since I messed up To/CC in the initial submission
- Link to v1: https://lore.kernel.org/r/20230213-sm6350-camcc-runtime_pm-v1-0-761fc69f7a80@z3ntu.xyz

---
Luca Weiss (2):
      clk: qcom: camcc-sm6350: add pm_runtime support
      arm64: dts: qcom: sm6350: add power domain to camcc

 arch/arm64/boot/dts/qcom/sm6350.dtsi |  2 ++
 drivers/clk/qcom/camcc-sm6350.c      | 29 ++++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
---
base-commit: 09e41676e35ab06e4bce8870ea3bf1f191c3cb90
change-id: 20230213-sm6350-camcc-runtime_pm-639b75c3d4b1

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

