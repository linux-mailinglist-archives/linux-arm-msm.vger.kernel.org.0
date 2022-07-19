Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6447579220
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 06:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbiGSEsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 00:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234078AbiGSEsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 00:48:11 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B67028E09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:11 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10c8e8d973eso29317942fac.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RT5DuA3JHTfzpyQUA28dukOSYYuNNmWVXOMTz8mJ95M=;
        b=HgU9Uxodf8Sdh/N5/mc3m4Z8RusvlOxkzg1B7gKYukEUkwCiVbrtMX/cRZd221M8Qd
         20wKw6obtshtX5eXJO+2bag/m73QzJ+oN7ZEVkM0Lb6ea46opCZhDRy70Cb8FfY7DJi8
         /VQFUyyd9KzIdBTLjsHDF/wXrQcJhpvRpBMVjj3IFNQ5kRz8+tAEVC8cOV6G5kcR/oIr
         1+JnP3eIP4BCW5hTu7zds6CzKxV/WeCs96Z9A8BAfYLmHZQispMxoWjlvOUokna+ENFG
         zgfatWSu8JB6xL6ZL2m0hLTgLPpCqxFVyN/yNDZCH/FSV3vTH6iuZM+myXS5rgHYB+zO
         SUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RT5DuA3JHTfzpyQUA28dukOSYYuNNmWVXOMTz8mJ95M=;
        b=5dQ8Km+S6C/oQZ07AJ/ow8N++bThPqEyXYE2Bt9ysQry8ZRW6lD1mTBFNX+SPZd4AC
         ozNcjGYMkG0LU9zeKC9/1xDQgACJUQY/VrhklnkLdBJHkR5+gMD6gLsqnG7gpJW9NIPv
         rbkXhvjZOtHDewdkgzE3LtzipT83ue/HyLF4G4gFy9yj8uNeoctezK3blKokzmmyuNQg
         LLgkeRdD9QdM/M5OCFk8vJMYA4tnTnD+bEb2yfaUO/NFiFq7EX/isbJy7APMTU0qWiw0
         vZN+jajjtPMTxg7L+GquIELZAZbY4FuiKnG+BsCWyHWb2ZvfFKFTkoW/acWULViMlhEA
         ELeA==
X-Gm-Message-State: AJIora8zwiVBhZWgD1p13rCXxFti7nHOZN7mdIka4P9O8ie5YFrbIeaC
        sjy5jXkw7HYP6VgJBFuSOiPgbQ==
X-Google-Smtp-Source: AGRyM1tx2fnGHNAQAdFuh53vodvlMUf4bYhebqrDYA+jmTHuLFif1NFGsB5inEUHiyibSpKODBGdsw==
X-Received: by 2002:a05:6870:58a8:b0:10b:d7fb:ba97 with SMTP id be40-20020a05687058a800b0010bd7fbba97mr18691187oab.254.1658206090665;
        Mon, 18 Jul 2022 21:48:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:48:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     bjorn.andersson@linaro.org, vkoul@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, geert+renesas@glider.be,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        will@kernel.org, catalin.marinas@arm.com
Subject: Re: (subset) [PATCH] arm64: defconfig: Demote Qualcomm USB PHYs to modules
Date:   Mon, 18 Jul 2022 23:47:58 -0500
Message-Id: <165820608072.1955453.119531702512535847.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220712031821.4134712-1-bjorn.andersson@linaro.org>
References: <20220712031821.4134712-1-bjorn.andersson@linaro.org>
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

On Mon, 11 Jul 2022 20:18:21 -0700, Bjorn Andersson wrote:
> The Qualcomm USB PHYs are not critical for reaching the ramdisk to load
> modules, so they can be demoted to be built as such instead of builtin.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Demote Qualcomm USB PHYs to modules
      commit: 01579b88a03a90af73b584fed70d171c73c2c540

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
