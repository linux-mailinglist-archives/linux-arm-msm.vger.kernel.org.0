Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003B3569800
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbiGGCbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234872AbiGGCbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:31 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0722E697
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:28 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 2-20020a4a1a02000000b004285895836aso3122241oof.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ENturn6YNRNbIG8wUMf27MmfYY6FrwWjTo3NEzdKnE=;
        b=UaZ4M7I82Oby2UDKmP/4LYiNHyGwTE3K8hm/Cg9O8e1q+uih/qvqtH7oNKMVkHrrZN
         G/H27vYH2QbtalEIKssialh+6aUaJO7vI+ogyPgXONO6UNqgkNk4pBFxaxX+cMv07PdO
         DObSuj8wOEf1AAR2TBsW39Zpq96OXkO6HcP126KSjnZC+eB6HFeQ6+vsiR7wmzzWC4MC
         Z55tyMcwIh2Wf3+Db/pgzs9hy7Jro521PVEfkE4gNTRn11gAvYjMQsGguxySE+24CPu3
         jKHSnBTt/rmfskrJakXdyo2wLTdUcClVYiVw7uMo90QAUWsu9wJpmpKu77/Z+w3tASdT
         ANog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ENturn6YNRNbIG8wUMf27MmfYY6FrwWjTo3NEzdKnE=;
        b=trj7y4JdwwV3PqVuX5Dp3H/vAR1jWXStiKgeiePsMIdbDy4DZnDsWcyWzzIcm0bI2p
         JHvUdh5QO9CeAiV+CxvAM6tgRyDYNImCWY3d0iR8fyjBavuWCJzWuyeO1Y/BEYXSQb2s
         XA5tGJvYeuMkhza75FzsmG5obJmCr1syIcy2jiuJfEQzjwmcNALABKWqXTkth/0ERRgh
         Icmc5uoDeb5/ZU1ftGSchPa+8F6N/S0KcUshBid4A9MtV/7sZ6g0BUyCoWTqhitjryo5
         ASWMi8mloRk5Z5m7BcZrLJE+BTSqKgfABDxU8AlEghWxXnCbTrYN8BRiQOOhCrqZjJkg
         t2rQ==
X-Gm-Message-State: AJIora9/DwXm+QdT3RNa8upsEODrXMDPED1wcLcJPQ/je2RbnP525VHK
        QxiKDaNZTOI+EaRpvzYd6hxXIQ==
X-Google-Smtp-Source: AGRyM1uuOrun3guONN8D1ggC/71IoRtZ6iGZexTDZ4hrsUUgx1xwC5T3FbOUYulPgA18eq3eGOheaA==
X-Received: by 2002:a4a:3506:0:b0:425:9bbc:364b with SMTP id l6-20020a4a3506000000b004259bbc364bmr17924008ooa.74.1657161087660;
        Wed, 06 Jul 2022 19:31:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Heidelberg <david@ixit.cz>
Cc:     linux-arm-msm@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 2/3] arm64: dts: qcom: extend scm compatible strings
Date:   Wed,  6 Jul 2022 21:31:05 -0500
Message-Id: <165716107314.864223.8895399402990955666.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220626183247.142776-2-david@ixit.cz>
References: <20220626183247.142776-1-david@ixit.cz> <20220626183247.142776-2-david@ixit.cz>
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

On Sun, 26 Jun 2022 20:32:46 +0200, David Heidelberg wrote:
> First device specific compatible, then general one.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: extend scm compatible strings
      commit: b9c0c0e5da43ff3aa6dd93e2f994dc889dd5b261

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
