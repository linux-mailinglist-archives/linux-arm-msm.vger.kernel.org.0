Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EF860188A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiJQUIX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiJQUIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:08:22 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BB77858B
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:21 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id mg6so8079295qvb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd//7INOchzF6hK9pPI/LJYoeYVe0d6hpeKVUa4UPnk=;
        b=WNdtIwr6fN7ajltCaE/9oytsCcRF7h81rRrIW2D+JkaaegKNoPop+tU4uxK7grHf8r
         5CiyiWskPdlcnZoucP0b1A1eAU4Q3P5oEjSzq779cCJ3OercNORDykUYUZhP8X8ozYO0
         dP5QyCoyrdwiByrpnp/KT6h5Ym0zCd69fzsCLezcjPcH3qqtxyypqf9eiG5lVT7sN+ls
         Tb2PsRLrXzAP35w3PFVtogim3yn2F5YYnrpdSmp/lv2KVY2wkfXhxOXM+H+svnZmB/ZU
         aXPk6JH6DVPBkA0XM9NYs+Gvlz1dNrN3GR5sp+zQ2yh/8qADdxXggyxm2YB6aHmngmmR
         SwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dd//7INOchzF6hK9pPI/LJYoeYVe0d6hpeKVUa4UPnk=;
        b=KbTjVdYeYoDw9/GPiRt9ahK7J54egq28FFwRzxJVIL617j1Qdyk1w3GJKmJz2dGKts
         bOC1cc3ZQng7mrMrjDDV8f5nffjj7cXhZXf1v2/ZfTiECPVnDptfr7E4cBy8NDz+8gXu
         2kPzM+0T+xD428TnfXGcsszmRMRbJyn53xoryld/Z6q/DuRsR6N84b3Ajk4TaUjbYTnW
         1HNdHq1/CbAI9EA4o1TXU7pUNH02MofjAFgs1IKWTh77nGeIjycVMlAcQfpUJNp7QCNe
         4uoPDmRHtJEzxCuzXn3Bpg1UoCaj9jrQDW3p2y5nF6fqVA8//d1iuQODt++vY4bFJ1+h
         ktxA==
X-Gm-Message-State: ACrzQf2EfYSC2VKV3XpqZfYcxTT93bWWwofVsX9JRxoDf43bJDO6ZSkV
        5xHlP/LDXR0uMVeBOV8WKHNYvVe9R8VSNw==
X-Google-Smtp-Source: AMsMyM54d+Qf6Ss2v7cna2oaXkwf1mPpscRTGwfQscVRxFK8xSf1PqTCAe8uwE48SGBOD82CUNXpIQ==
X-Received: by 2002:a05:6214:234a:b0:474:2318:3f3b with SMTP id hu10-20020a056214234a00b0047423183f3bmr9411583qvb.10.1666037300488;
        Mon, 17 Oct 2022 13:08:20 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 05/12] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix gpio pattern
Date:   Mon, 17 Oct 2022 16:07:40 -0400
Message-Id: <166603728600.4991.13769978430561789417.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-6-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org> <20220927153429.55365-6-krzysztof.kozlowski@linaro.org>
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

On Tue, 27 Sep 2022 17:34:22 +0200, Krzysztof Kozlowski wrote:
> Fix double ']' in GPIO pattern to properly match "pins" property.
> Otherwise schema for pins state fails.
> 
> 

Applied, thanks!

[05/12] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix gpio pattern
        https://git.kernel.org/krzk/linux-dt/c/793b96bf484d9c8c05266254721ce96534d79800

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
