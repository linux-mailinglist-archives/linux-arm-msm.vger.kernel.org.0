Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BCB56982D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbiGGCby (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbiGGCbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:47 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92AE2F3B4
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:45 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-10bec750eedso15966602fac.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AfzAWLualuWLWjjoYHnPwj+hdC6UYK/3WLoOKE3iwRg=;
        b=yAuBXABuUAaBXfUSMlCqS34i3qc+/et2tl/gfZGnFr0nOKYkQXfn8s1gCF3bAMzjIS
         lIRi9w5us+FLpLVlBPahYznTkxFkfqt7Ooqj5smEb2+bhkEb/6p3gO8LJ/JapAeN6Y4q
         dedbUSjPnlrUoJMVRmA41rVbfuc17jYTpB6CpSOBb/Nn70U0I8yQTwbqNRkCbE1pIyoG
         ZChMUuSJQJi1I7e8mVhCmjMQzPPRTfWWV3zfJjnfj5CBNTltVY28ORHEkTRUO0gnwDME
         bQTIUSm9Wkc7hdmD8zCoJjlZWe17f7AlZdchwKW6xkdMbRexpB+2nwk70TKemNpzfHbS
         ablQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AfzAWLualuWLWjjoYHnPwj+hdC6UYK/3WLoOKE3iwRg=;
        b=WMbDG/enWwH2o8ozYhwa6kw/IcyQK71yJe9Y5c5duj+T4kd1rPgmD21VhPdPmzRXR9
         nGSsENBG+JCuVHwHcC4vr+QnoHygcFQB1c8uyhomWhXxmL1qfhcaC2ZTdXJCsJynBGay
         u4tUrrZe95VV4wQ4wI8RkwxP7YnkBO5r5IjXsNmpJo6iqMa+akU7IuekEzDfr2U/E2CV
         11qjo/STV4qpRmrWjob6UBq3sH2WwWGh6ui70MzQvuy4svNVjH1qhJp1DyjmygqzP2aD
         bOmZ41l62BGja53jWWlUom08n/WUhtKgkrPY/riAI9EVFFyd5lqcMgbUTh/84A7lOOn5
         P6zQ==
X-Gm-Message-State: AJIora+ThlGOWIXy29TIB27wVcMB8v0AzSQmdlcDccJmxAca3qWiRvKr
        YoQAPU/D7lQBf0nZi8aW4OftqQ==
X-Google-Smtp-Source: AGRyM1tothHUpIGbPqM3CrhBtfr01dt542evOWiHD3GS73r/UF0xMkrQLh2cOCEmYiPTY2zkFsLFiQ==
X-Received: by 2002:a05:6870:f69e:b0:100:fc8b:b3bf with SMTP id el30-20020a056870f69e00b00100fc8bb3bfmr1201060oab.136.1657161105263;
        Wed, 06 Jul 2022 19:31:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH v10 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Wed,  6 Jul 2022 21:31:22 -0500
Message-Id: <165716107313.864223.3506218818724226396.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
References: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 1 Jul 2022 09:26:20 +0300, Vladimir Zapolskiy wrote:
> The patchset adds support of a camera clock controller found on
> Qualcomm SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
> type of pll, its generic support is added in the series.
> 
> Note that SM8450 ES variant has a slightly different configuration,
> the published version is intended to support SM8450 CS SoC only.
> 
> [...]

Applied, thanks!

[2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
      commit: e07e07dac9502bc42b602d2d1f06f28c16ab602c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
