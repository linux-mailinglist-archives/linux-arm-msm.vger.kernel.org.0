Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF6A5773A1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 05:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbiGQDIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 23:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbiGQDIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 23:08:36 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687ED15721
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:08:35 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10cf9f5b500so14498965fac.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZY9ppo/NgfpshR/QVcrrN7xSjQ/ifkZSAsHqjerp1g=;
        b=yK4F1wdwXGsMObltazKE1YBGgXJ7B/3z//1oEVjrXiUIRUYezjGaZSVbaauKuTNxYt
         PeEUZmOiM5CFRQLxA513OwYUZZdxT5GGfHaw+sVfDmiEg9XTXzVFSBWPlm95gHuvD9vb
         hWCe+0GfYFpKQ2indy/vdeIsdnd3Wrdkw9g1hOGT7fZ9NH9W2fOpAJcOgoQf7bVfUPk8
         fCtkxWwEM0WKD8ODV1Wqtud08OsxlIemv9pAjfo+pxH3o2i08you7Lz+Ot9gv6pTF2km
         hshi/g7J3KyACHnjnoZ9xEQpKxdoZaRHzx8B+OaRoeb+65bKtETwClUr2FIKRm4NlPZo
         Hphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZY9ppo/NgfpshR/QVcrrN7xSjQ/ifkZSAsHqjerp1g=;
        b=7gA4ciaCJUic18GsyBGXaZnNXY6oP4O/niOhzcYP1FgUyY99GM/98LzZ6fJsC5fjo+
         kNWLVUNC1W1uKEJEmeWOvgTWLjVyJxezqCLNcYGZHnbvYfL7vRkun+LoQ5AHHRUVlJQA
         Omqr2xkOjmqxmMk39iYUzElsMDgd5zSuxgmgvsYcCgApJIvoF+Zw4LluoLKef9qGI/zt
         Sfyhta/R4QD/KhuCqh57dC+jQGXwnyzYZrqNEO8Z9qhGiAIRa6cTIDVUIubyT8RX/8GC
         F1bvrsE8scZ/R22JwqyNLlXceY+WU7lN2nJIaVsrcX3M88Ql8tywTiBrfDh32Dxr0LA1
         yTVg==
X-Gm-Message-State: AJIora8yRAuuFcm55qCPpOxwJ+IP24zGFplrY3UvJYchQ/bOkZAwazWK
        diGHfHjA7Lgja3tW6dH303zML+ZgTI4ryQ==
X-Google-Smtp-Source: AGRyM1v3nnHO6ZCxIoVgjBJgBGU1pFjvf8y7ef5TPkVxsxMBlcZmx1GEbm0kglBmRvi4ihlLzzD9lg==
X-Received: by 2002:a05:6808:e8a:b0:32e:493b:1d8 with SMTP id k10-20020a0568080e8a00b0032e493b01d8mr13621810oil.124.1658027314277;
        Sat, 16 Jul 2022 20:08:34 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z203-20020a4a49d4000000b0043577be222bsm3203928ooa.22.2022.07.16.20.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:08:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH] ARM: dts: qcom: msm8974-hammerhead: Add notification LED
Date:   Sat, 16 Jul 2022 22:08:24 -0500
Message-Id: <165802729676.1737676.16131388789289180300.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505164336.13210-1-luca@z3ntu.xyz>
References: <20220505164336.13210-1-luca@z3ntu.xyz>
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

On Thu, 5 May 2022 18:43:37 +0200, Luca Weiss wrote:
> From: André Almeida <andrealmeid@collabora.com>
> 
> Nexus 5 has a RGB LED connected to the TRILED and hence channels 7, 6 and
> 5 of the LPG. Add a node describing this.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974-hammerhead: Add notification LED
      commit: 1ea9098a81133d54b3d40d7ffd197f77881e5ecc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
