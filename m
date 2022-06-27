Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720CF55DE03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240902AbiF0UDp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240903AbiF0UDk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:40 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECEE1CB02
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:36 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-101b4f9e825so14319019fac.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QqgvmXW4OhdHKHjvfLONVHPptIjqd56a//RRvkZFkBg=;
        b=aok9J7/wAo4W3XivGEM8XOmTjW1eqYqjPuhynOjVKxc6z4d2nYEHQYp3FDclcXvr7y
         QNQGFP1H4d9rIgLKjT/jBB5v6o6/ELH8EPGj9J9onUDeMKPqQwH+Xbf9SMd4CUE7lw3C
         AHAmIrwF8Uw4XseobPObqT17lvGf0EwjC5ImiUPh1KfpGnVtJ2DSwkwql1/gv7SnexVP
         5Y1t7ET5OL+w9a6pUOzzdIYMGTB3NeKcohltNnAfa5MIryF76tqIhqFSATZR0e5N1Bn9
         BmWAouw73kl6H1MBa43f4qg2varCUR6EYmQFTKoMdHBK4WTkzjUGsFb8Ehsg28WuVFf8
         1MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QqgvmXW4OhdHKHjvfLONVHPptIjqd56a//RRvkZFkBg=;
        b=AUd1Gm16WTHyAPvy/7c1gcaAt/no4RAA+cH0R0zozNHAxu3ruf0avzMB6DUH6f0DNf
         IsXVCW4Ccpscbb2OJn9Dhl6Mw0nW+eDLAI0HlAwH23wwtgomDzbhIbMY4FDoz8MiEmkt
         KMVjXZZgDVVY9DCLLQ1lpB3xu9BcOD5ed1jHfi2a0vr0itlnft2vIg9GQJuPv5A5Ez2O
         77m2BaYyFYKZULWFDNk5y/b1alPibU6Y0nhwY0CC87PhWbiJAt4+ngUBU+10VHWcTGjC
         4cQ3fZlq4lviWYONmqskB/dTWVQONbUyJtQMtLClTX9ocO46NIhJYConuDwnS89Gg+U2
         Fy5Q==
X-Gm-Message-State: AJIora8cy65TMZ71wnZ55HSPVX8VU6bqmRyiYWO1M91gsGlkbtISyTBY
        OiGea0HnKmlr4jDsoUjCprsGFw==
X-Google-Smtp-Source: AGRyM1vcRN9FjITbwIU95KkELkuctp+R1ZBLP7Hnh0Uweqr3W1Glzh8eNc0heKZLhPTCNx77DL/bBQ==
X-Received: by 2002:a05:6870:d354:b0:101:c5a1:19ef with SMTP id h20-20020a056870d35400b00101c5a119efmr11913938oag.4.1656360216556;
        Mon, 27 Jun 2022 13:03:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: arm: qcom: switch maintainer to Bjorn
Date:   Mon, 27 Jun 2022 15:02:54 -0500
Message-Id: <165636016350.3080661.2714944224407180676.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520124018.367004-1-krzysztof.kozlowski@linaro.org>
References: <20220520124018.367004-1-krzysztof.kozlowski@linaro.org>
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

On Fri, 20 May 2022 14:40:18 +0200, Krzysztof Kozlowski wrote:
> Emails to Stephen bounce since long time ("Recipient address rejected:
> undeliverable address: No such user here."), so change maintainer to
> Qualcomm platform maintainer.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: qcom: switch maintainer to Bjorn
      commit: 418ef34c006119a1cb7967b490c6d268bda845c2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
