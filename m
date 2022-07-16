Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730D4576FCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbiGPPTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbiGPPTb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:31 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBAE1EEC2
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:23 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id k25-20020a056830169900b0061c6f68f451so5646240otr.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gPncMlKnvritH6I5NxApVd3JtLbhLIFTG9kvE5x6jgA=;
        b=W6QeaqofLuSShShIzPCe9zmixex52LZteK/EIB9qM7c6tKfr4pRO/ZgzxJziAxa8Kc
         IbNYLzGkU9/+6GG6QNywF8qSE2CWpxHdn5shPrSaI8Hzf3rkti8Jhx/oFKFP1O2vFJwL
         MgBHYSG7bi+zZ1U7idd89QBxEHqLtqh7V4lkwBbHNuvOqB3j0frjVZyqAiK7KXz2LmcM
         aeoBPywsd2gINKViJloaUZqJrXe3FOTOowM7r1UciTizxrHYARrNmZli0bjjtU3jBcWh
         9tKU0ucUchKPZHM9Pg+X6a4e9tlhHY9jCzITyDtE6iT3fHz5lKUZViQQS9QXX4CG1zJL
         HRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gPncMlKnvritH6I5NxApVd3JtLbhLIFTG9kvE5x6jgA=;
        b=kQhrN/MZ5qXK3MYjBx5lR7Q17wjlvu0FozqjKcdrq/+Ue8r/zwbQNQyQTyq/1M/IGq
         NMVY2eKz6bnqaX+Zd4x9o2VoT755k0ug8Wxab2Ndon0/V3E/o1UCLfQBPvmdW5/ur7UQ
         amhuy4SmalN2x5kOweD9yx3qSjM/eZVBvRkYmOxQZRLrqI4Ho02qGLW0mnFk9LxIQBne
         ys2VxtxsHkvl20jawWnzasocTitmS/YWxqmYmgqmPk7QU0ffKzPA7b4czdRgIcUZgAFV
         kEShHCerAwTD1Ipt7mh+tu23yqIMiHporDkfxeAhfS9HrZYBdpZLoEAe0W9111sppLSE
         TVMA==
X-Gm-Message-State: AJIora911sV0+jKql+S/KhoUa34sov2QnYiUaHYTlvhiRVHokMqBSeEM
        UEzXevuuK31nzU8Ucnsi25qszg==
X-Google-Smtp-Source: AGRyM1s/P48Dsno24IGjRdsxor642xgqDDF36u5yJkb2tW+ixZ+1+SyB5FhkZuO4zwcG0tdbEX4WbQ==
X-Received: by 2002:a9d:2941:0:b0:61c:7216:e3ee with SMTP id d59-20020a9d2941000000b0061c7216e3eemr6893389otb.280.1657984762793;
        Sat, 16 Jul 2022 08:19:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robimarko@gmail.com>, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq8074: add #size/address-cells to DTSI
Date:   Sat, 16 Jul 2022 10:19:05 -0500
Message-Id: <165798474063.1679948.1326747085211639094.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220708133846.599735-1-robimarko@gmail.com>
References: <20220708133846.599735-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 8 Jul 2022 15:38:45 +0200, Robert Marko wrote:
> Add #size-cells and #address-cells to the SoC DTSI to avoid duplicating
> the same properties in board DTS files.
> 
> Remove the mentioned properties from current board DTS files.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: ipq8074: add #size/address-cells to DTSI
      commit: f32660459d12ad4ce54d0f0c226b3e1f34949a3a
[2/2] arm64: dts: qcom: ipq8074: add interrupt-parent to DTSI
      commit: b97e6ffa7c75ab30e1994997d44220fbe2799906

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
