Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D974C5524B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 21:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243031AbiFTTl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 15:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244802AbiFTTl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 15:41:57 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764E31C932
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:41:53 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id fd6so13754413edb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gOWWD+MkHTNlcYvKrVAOm7JvUVFBFo9uR5vqftGaLjk=;
        b=W8WmVZih7quVxfKEfljPR5j340B6P5N8FAd6PThBNHnDdEz20tbqna8RfEO4buTT+o
         PB6Mr9kZXPLoFT3zeROiP6JPq5kjGr1kp+n86NJXBdqJzLnxGIoZXUzouCDrL4xzQ1eZ
         VHrgI/e25ZEHf9nsRhA5uwRPhhxZvjNrrcIQ7KTB3XxSlzS8GFV/Bcuh4cc3aUlnY++u
         CruztMHrGCIKSxJcpm6y8MjAjeITOLAKNCTRD7o4HNLUcU+nG1/WqTbRdslBpZjQtXqn
         9O86yUBRjRuZOlZIKEDaCdO64eRYiuqQJytg5XUjqYGU9/g22VsdYw6HJ/PaU9wPLNV+
         fBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gOWWD+MkHTNlcYvKrVAOm7JvUVFBFo9uR5vqftGaLjk=;
        b=my7tLyy6V0axE1lzwvszVAGKI0UCYuK6k9ialLecIGJ7/RRMscZeDZX67h+7atJtCr
         ZNDQHtM+qoI8xeda9+osidax65vNh8HG+CIxW6fukHSec7E73nKgGYMmGTG9T4BvqHzz
         LfgsGd3xo5Z1+zNjlxTwkbuRUdOyZA/peWNlFBUNCKZ97mxT4MwER331PdNrG/tE3ihD
         RshJOvO26ZrMw+WlvzHpX1y6o7lo8Zr9qDwQaP5bKWp+D9VUI01ExPrw6kzNT2e36vQt
         Kmb6D918gp8VYFp50mCXU6D78udKty9Wj45TeEGogsMi4Fg/MF0z6URcNZE+5GxpMNYf
         +CUA==
X-Gm-Message-State: AJIora/ilph9R5GmXPNyluZxpKZcFITd2oX/nd/Ac6bcWQJaLoaHkquZ
        mvLDfjudiRDdrFpHxhTXoSworw==
X-Google-Smtp-Source: AGRyM1seu3VdAGMNSioKh2kKiJeSLRPGQAbOvhltJz+6Vxq9Z5CFbQUdUf+IFg1adIHARFl/Z3j+vg==
X-Received: by 2002:aa7:cd66:0:b0:435:74d5:2d58 with SMTP id ca6-20020aa7cd66000000b0043574d52d58mr13788414edb.34.1655754111793;
        Mon, 20 Jun 2022 12:41:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o18-20020a056402439200b0042fbc23bfcesm11448549edc.46.2022.06.20.12.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 12:41:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
        lee.jones@linaro.org, jingoohan1@gmail.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, kgunda@codeaurora.org, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dri-devel@lists.freedesktop.org, krzysztof.kozlowski@linaro.org
Subject: Re: (subset) [PATCH 1/2] dt-bindings: leds: qcom-wled: fix number of addresses
Date:   Mon, 20 Jun 2022 21:41:44 +0200
Message-Id: <165575403866.144830.12885632479282358471.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 5 May 2022 17:47:01 +0200, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
> also fixes dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: qcom-wled: fix number of addresses
      https://git.kernel.org/krzk/linux-dt/c/ba52039325826b3f2bddd00972f3f61fbe7d9f0e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
