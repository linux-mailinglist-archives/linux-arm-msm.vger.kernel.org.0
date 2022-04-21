Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8125750A265
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389343AbiDUOam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389247AbiDUOaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:10 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D313B3EAA9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:18 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-deb9295679so5543183fac.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/TuynhLBd4hkuV3ZFwLhZTb0gzTnv4eNA9CpTr3sD1w=;
        b=ywdvxnhECr6gwJ+HSdfyoLZEnM5WTuw6C2wk8Z2NwuyD6YGn3Bc5xwVOW8Eyj+/AXH
         Hv0Sdfleu0h9Af0055mg0cdasONNlZQF6evuQoQANkdSJ089twg1o/lc0vS90I9SN7aZ
         poASlwHzaxoFdNE+UwO7CwTUjAghPy9zj46gqatj1SfyKu2NWmg+tD7s/X4Zd5yIbbiP
         ywKMwr8uwoZ2RXG2mKMuXv0clDVTHEQM2mfbzL+pKj6giqANgfqmdwV2o3oPLK1VZY9G
         9+mNbOQ1xDTnhmtBZ2OSZZAOHihLyiSnmTEudGt0gIaWxcB/9JL/cWQWVACd2cWYvTAI
         ixWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/TuynhLBd4hkuV3ZFwLhZTb0gzTnv4eNA9CpTr3sD1w=;
        b=zH+wftvjbCgCH74ygs3ZW1Ftfh6Z17yGqdFHPi3TqNlRbFfWyr2vnr8RfjjE+kucLm
         olbFpzllUoOS+qrHUHhuQBBHsCEMILsS0mCn5IEcQx23+8cufY6J6OG8rdWHJ7n2/+hV
         Y9tQRpnhCJf67uNawVnxHylTK4qch6kCgxYab39kcaV0yZvOUm85lo6U81Sw6CAPQ3VL
         bUCITHS+W39EZRXHjlmSVCJcpvf4oSNA6P6f9ccX0FmMVwxZcgk2uwpoDm2yaeR/kcSm
         vjNM2gbVLtHUXvXGz+QrOCVgDRcYvbKFBGZyvP+JDNDYgML7L+u35/YPCYxAH60x8InY
         Dfsw==
X-Gm-Message-State: AOAM530ekEFy+hpjwdKL9zDWyY8bbxy2FF8zGSow46hfEBmAxdG8hLlV
        yFPsaTOqsvY8lRoqHDzjUkMbyA==
X-Google-Smtp-Source: ABdhPJyxQofJs0sH3GdGFZVO61QeU0jj5L9/SkhYyJnDBhQjek4QktPfPirPMtw/qatpn5DFgpNgFQ==
X-Received: by 2002:a05:6870:c393:b0:e2:ae03:70ff with SMTP id g19-20020a056870c39300b000e2ae0370ffmr3620690oao.231.1650551238272;
        Thu, 21 Apr 2022 07:27:18 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: msm8994: override nodes by label
Date:   Thu, 21 Apr 2022 09:26:55 -0500
Message-Id: <165055095990.2574292.11389273916823055515.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220402192859.154977-1-krzysztof.kozlowski@linaro.org>
References: <20220402192859.154977-1-krzysztof.kozlowski@linaro.org>
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

On Sat, 2 Apr 2022 21:28:58 +0200, Krzysztof Kozlowski wrote:
> Using node paths to extend or override a device tree node is error
> prone.  If there was a typo error, a new node will be created instead of
> extending the existing node.  This will lead to run-time errors that
> could be hard to detect.
> 
> A mistyped label on the other hand, will cause a dtc compile error
> (during build time).  This also reduces the indentation making the code
> easier to read.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: msm8994: override nodes by label
      commit: c46e3c4bdfaca1595b898bb58b112fd683fe0c11

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
