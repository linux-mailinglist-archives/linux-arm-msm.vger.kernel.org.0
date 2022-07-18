Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3228578DE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 01:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbiGRW7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 18:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236252AbiGRW7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:25 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FED32EFD
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:24 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so10460976otb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 15:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4kHud9mlsoAsSPgQFpekRiycMvMxnpzh8md2ULHRH8M=;
        b=UoduGzpJcG+vgnNJXPprCMScMu3l2jZnTBwG0iq8IbcBEIea2YU6fpLPi/8MLwxf9P
         ESjapwV36k/9ZVu0E9DFYUIIrywdE4t4IE6SP9nZZ3xbCKApAIOe9hgitBR7OkJg3Wik
         BBUgZ6Q00ew6MdG4y+L3iERKx+YnNABaDvfXfDV2S1jtn2ZLaoF9ROsEp8wQ7IqDrQNn
         c/Y1jwrj9QSdkhCyL2c8m2eiemm7ptCDvDxg6GMwfXzeyMYhZkDZbaBmq5D1GgO41iY8
         OSeuAZVzSvZwFp6rcLHtYNfD1qtyCY75gyVKnXuA+pxrzaZ5HlXRrXqQB0yVTi3poTiO
         au+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4kHud9mlsoAsSPgQFpekRiycMvMxnpzh8md2ULHRH8M=;
        b=7MI4hWRNOE/Hr8grGqaeURKp46tkAgVum+ghrZhARcZNSwMggf6i3fON8DaAulGiYV
         Dn6KJb3eT0ZAvarnFvxB1A84kKmLWHTbk4gBCKZn1w596FrT3oqpksTxPrNYnCQxl7/k
         6qxrt/Du7KTbSzcuiXV/TaOrBgq6xE3Bi2lCcb+vyqO0BeQpiDDu+4xlrS4BMO9h+e4H
         /xYwzwHFW+L5vnuH1eDX/IpQGXc6lMauaKAcxAQidG31LhBeNuZMN01gdZ+zwJCZhMd0
         CY2wl3Pc7CxaOiC0/sg4P/BmON1hOvyAxbzm7qpQnVUBFTe9NOn0UbWq5pqzr8VtoJqq
         jvFg==
X-Gm-Message-State: AJIora+Jwz0zobD2cP1kmH3R0AeL0Bqm+dwM50v/A8Ay/TPCIsARqZPc
        QkuQwjfrWSv+US5ZmCd87ylJYg==
X-Google-Smtp-Source: AGRyM1uFakFvCDT6jvma3XJcksWxbV5RTSCBSXFya7UHglFCPT1qwouMYZ7iXGz927NSgeZhMkx70g==
X-Received: by 2002:a05:6830:33c3:b0:61c:6576:667a with SMTP id q3-20020a05683033c300b0061c6576667amr12131221ott.375.1658185163443;
        Mon, 18 Jul 2022 15:59:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        agross@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sboyd@kernel.org
Subject: Re: (subset) [PATCH v2] remoteproc: qcom: correct kerneldoc
Date:   Mon, 18 Jul 2022 17:59:08 -0500
Message-Id: <165817634386.1905814.13877230220169061028.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
References: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 19 May 2022 09:33:49 +0200, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings like:
> 
>   drivers/remoteproc/qcom_common.c:68:
>     warning: expecting prototype for struct minidump_subsystem_toc. Prototype was for struct minidump_subsystem instead
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: correct kerneldoc
      commit: d5f8c4c66a368e21a105c42042803526cd3ccc15

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
