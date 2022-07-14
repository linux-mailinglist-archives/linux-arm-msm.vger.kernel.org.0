Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FE5574821
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237814AbiGNJOG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237815AbiGNJNz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:13:55 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2A21275E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:13:50 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id r9so1410189ljp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YSaLOo3uvJc2rTh7KMA4aG1KJJmXpp9TQCunK6o1eqo=;
        b=HJzl40vM7NVVmag2wEVD3j2ELJbEz1mUFz/1ap7mFAMQwyfApIwYNtlbvTWCrbCn8N
         lzrtQdsRm2ayRKGoP5XtjVzY1mq4/LkkC5kXHIA39KRhfobj5JaZ1sskXswRLHmHBGqf
         W2/P0P74h3+SAUgsLq/7HhM2aBi4BxlQ9teduoRxgVmZiPqey4ad1AhtDcwCgz+L1U8s
         2PBuAIhjsB0wyzP2VZVxH9F6vtMBteHpZBt6uWHUeidw36EN0789FKGF2zx4MoYiOTjr
         ABCojRIwRNPutNy9wZr3BXmZiOQSB6lQ73gQZudS7cFdFzemVopZBhThpzOWd+Jjm6vw
         3VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YSaLOo3uvJc2rTh7KMA4aG1KJJmXpp9TQCunK6o1eqo=;
        b=PP43HCKN9tDgSE3YABUxjY3X8ORuwaiuCwDmWw0c7OFQT0cf11uZFHuR88UaDmopBm
         ktiPS2bAT1m6yPkW3CVqZLEsyGbF83LFJwndjVOzUUiwcAHvOfkddbBk1Tr4AdICO4eW
         eeefyuapLx4rH3Xxps5Y8GTp+PloCUimgtEyUa2+kBaMtTxULSAFFCXhHeALxsiwFHcv
         er/JKFk6X23jnbe2+jld6arNrWOlqpiXgLmOVvhx3+TbV+l2pmvLBeKcgfvwl4YhBX1l
         hCctk6fVnG5ztOVUdyl5MeGQ4e5A+SakhdKR14E5MlOnYTCgVaKtf1BX7QQysMgeRP6o
         o6RQ==
X-Gm-Message-State: AJIora+09s2lOV/YPfm9apKw90dXa6TTcgym/IrelqXNQKvX8zFHIkpY
        5ByQBerkIJ6X+jlq/R0g841jUw==
X-Google-Smtp-Source: AGRyM1vuqxlGG04+b96O84F7+W2zXY/cg945cr6JRYD7Cm7ZFVyOiQd+TX4lD9N+ST50d4dEeWDl0g==
X-Received: by 2002:a05:651c:243:b0:25d:9aa4:d7c9 with SMTP id x3-20020a05651c024300b0025d9aa4d7c9mr1363015ljn.35.1657790028879;
        Thu, 14 Jul 2022 02:13:48 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id t3-20020a2e8e63000000b0025d4866b2c7sm183253ljk.4.2022.07.14.02.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:13:48 -0700 (PDT)
Message-ID: <6e3f32b1-ab9f-13de-19ce-1433c6d74119@linaro.org>
Date:   Thu, 14 Jul 2022 11:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 10/30] dt-bindings: phy: qcom,msm8996-qmp-pcie:
 deprecate PIPE clock names
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-11-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-11-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 15:47, Johan Hovold wrote:
> Deprecate the PHY node 'clock-names' property which specified that the
> PIPE clock name should have an unnecessary "lane" suffix.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
