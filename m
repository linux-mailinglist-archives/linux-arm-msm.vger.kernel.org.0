Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37F356448A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbiGCD7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbiGCD6d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:58:33 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A685BBF5B
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:38 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id y77so8957488oia.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X6e/+oIpTa6MhV/sSY2xToNk0GlxPnX6x0IENI7ClW4=;
        b=MH/Akfmg1Ey1d2DIT0c4v1BdcKR4Gu1SABNtfqoBcrh3L96VUeZjGLohdwA9wXa0QF
         +X6EFmwMxI+8IOBHmAPt3jK8qh1L5Thu+h5LCD0rF/aFyTtTFyCUWPvGOKxrUPMY+L8i
         WckrSi+jfeq1ry5Gv+9gjaZQFbP5WIG6FBrkFCCj3qGxvvM3/0Za6Ndeoui2Fwil7TkK
         EkudC4ceCHSqzffGMGmwEeQcjcbZ7QNvOu1FpI+MHwFP6kfhASkafkrhfkgBwEsS1+ed
         cV0XFz/tp77hbpodzc5RnpJDLoi/R1briS3sXG5BcTC0TYdYbSJ9nbzqQtGqmlscTyIS
         s3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6e/+oIpTa6MhV/sSY2xToNk0GlxPnX6x0IENI7ClW4=;
        b=GkMU36ZhhYydg1o9Ie81U387jotTF0k605MxDyPhgUlFMqcZps3V7HtQ/JmpCXyjpI
         yCV6mKoexSLXtZUvs4TXe55KRX3VjEgYGPvuYtkmgaOqtyHC0kv/ZAf1K8C4qNd0UNXY
         TSwbjSMzSjJ9wqVUbpQ2yQcqS5VTY+aifxDY4BjyVFS0L97hucaFmawj8FCDqAASJ6P9
         wKH8fRMXAkO8P3c4UtWF1dxFKBJqaLyNvpuuUfiIeBOrMYizTAIXyHU0wCw/5Ap4G2Se
         iEn0wfdQIAFWKMDwzi0jDoL+dE3omARlAVyFSE7rD0yKVCqzKAdE8Y2nE62dBgYhm0F+
         n4jQ==
X-Gm-Message-State: AJIora9VqRPnrszA9MtC6bbsA0euKBHrxAe/wqI0sNP9MUXTFVv7BIqm
        5+dXkMGStR1IJUg+5mZaar5sdw==
X-Google-Smtp-Source: AGRyM1spiF19DnHwuIqe6YyCgegYznnQWo17gS6xdiGi+NT06YuQaFQ/4MauiSgQW2P79cAFa6BXeQ==
X-Received: by 2002:a05:6808:18a5:b0:335:a634:b9af with SMTP id bi37-20020a05680818a500b00335a634b9afmr12603998oib.209.1656820651779;
        Sat, 02 Jul 2022 20:57:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:31 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 01/12] dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
Date:   Sat,  2 Jul 2022 22:56:26 -0500
Message-Id: <165682055969.445910.7871016743700866853.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-2-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org> <20220517070113.18023-2-krzysztof.kozlowski@linaro.org>
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

On Tue, 17 May 2022 09:01:02 +0200, Krzysztof Kozlowski wrote:
> The core schema already sets a 'ref' for properties ending with 'names'.
> 
> 

Applied, thanks!

[01/12] dt-bindings: soc: qcom,wcnss: remove unneeded ref for names
        commit: 99e7e16445c41e44a6f678a376d55d277289b60d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
