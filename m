Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B92655D1AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240873AbiF0UD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240923AbiF0UDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:41 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6151C928
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:40 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id b23-20020a9d7557000000b00616c7999865so3692777otl.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXLNR87hZXB2BaGwjAbGrIgnuTRGcLyTJcvz1mjW7C4=;
        b=jGglD01gBVLvGfKWTlpLsDiX+nxNpFpmDWnpA7YxT4uAY3M8t4lY1iQC5t/1178VuF
         i++aDx/rRL9kjOajguCZC58Pqv7lciobJEdYh2kisRl0jWe9oPlUJnNQoh2a9TE/PoOy
         dep7UPrWTCqGv9aqqCKP5isWT0yD2RgME72pEEz/tRTZahf5DueZ9Vd7yLvl0IoWI2CE
         5SG7K2Kn0+tZ/RzHsY66gNWzGQVsHpElDyuzdeMqdXfNKGyt9hE2bEB3ngHl+GwEH9qI
         ix6o+NcAVjPvUdVfARCRHqcIymOchWxLY2SvlWi7E2JImdjFQVaNAT29mlfJp/ChtKWz
         ABFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXLNR87hZXB2BaGwjAbGrIgnuTRGcLyTJcvz1mjW7C4=;
        b=mO5OHqwcAhSiLSm+i4U6XASydZLpXtstGP7EcIdrISNVY7Cmt8jwIq9l4mPUrtphGn
         AJYZrmE2uBWYxbiUnFqdmgKsaOrP1wVBvux4debPTIePv/jvvS6617YhJkaxUJ3NZSR3
         Eel0sl2g5oZfvBKHBjTkUCQ1Lzr/NjrqepB3OqrWTIhs/8IcGqopYQQxvEwdVPk8k4J6
         e9srYHuj8WG2MpQh+EjVND3N3h1lQBsYumKkAw0JMD+QBmrkavnKjbqFLD2puQNeWepu
         Qk7YFIHJ3HbRRD4dY/u3WGcLYvgE6+mntxJIDVhCFjNrvF1f5nNVonuBXAHo94/mjWSQ
         BftA==
X-Gm-Message-State: AJIora8K5TNJWwU/wUTGQVWnt3JMKzNJgYy447So1uC0hBm4nqcvb0Ts
        sgHZE71FrG3fdls7CIslTtezICV4BdvwUw==
X-Google-Smtp-Source: AGRyM1tkBVLGZfkWH05mFyNDkb3CspCdg8RWZEaWrLwoDOb3Fc8dMwlIJaIEwXYt2ycHSKt6eIPFOg==
X-Received: by 2002:a05:6830:6105:b0:616:a94b:502a with SMTP id ca5-20020a056830610500b00616a94b502amr6779760otb.150.1656360220275;
        Mon, 27 Jun 2022 13:03:40 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:39 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH v2] firmware: qcom_scm-legacy: correct kerneldoc
Date:   Mon, 27 Jun 2022 15:02:57 -0500
Message-Id: <165636016349.3080661.3547963870365610015.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220519073410.7358-1-krzysztof.kozlowski@linaro.org>
References: <20220519073410.7358-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Thu, 19 May 2022 09:34:10 +0200, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings like:
> 
>   drivers/firmware/qcom_scm-legacy.c:133:
>     warning: Function parameter or member 'dev' not described in 'scm_legacy_call'
> 
> 

Applied, thanks!

[1/1] firmware: qcom_scm-legacy: correct kerneldoc
      commit: ebf21bbc2ff56ad42994f04ada64280bc819bb0b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
