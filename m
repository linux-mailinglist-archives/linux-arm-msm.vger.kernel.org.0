Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D27574835
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237935AbiGNJOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiGNJO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:14:29 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E5F2655F
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:14:03 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y11so1770658lfs.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nwvO67pthvU0zeevtyCnNAZLdAsSKLX1m6E7/kckD6Q=;
        b=irMu+nRCb0Rz/A2vhiztdaS3OmLQs2bfGkWAjeW6sNsjgO4suKz4rVku+vivyJo8P+
         T2IfYYFCRP2pALyqJyXcloCeYsHys2hO7N/XXRERSvwDrnIQSvQmWNOgcJJ+CVQAWb6P
         x+3SypgDDjIH6k63vCI9zMkoyE5OmLPbhkLnfwkKKbXDDjD5xadgwk4X1tWs7+ckG41X
         mZJgPnjZ7Zgpvvvdh7hjkwm3sRGQuLbB6WFCbzVH0d7ehKXqsUp0+3LCWWUlV8VdMLU7
         zyRbmtBois5WXzrdGKM2Knjnh2qPW339D4WChQaFYg52L27LffRcrz713AuxVS6PE/v4
         qhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nwvO67pthvU0zeevtyCnNAZLdAsSKLX1m6E7/kckD6Q=;
        b=5jrCw5ED8xxAyWMSfH1lM/5b3SuwAx8GTNQ3D27iaBz2rzIP5yJUFyUgt/VkZJe7h+
         KnKA/97Pg0EZTuliFJ51LLFWOy8AHi/elFhVS94xZpfmc5nrur0AJ4z4nqYb0bLd5FvG
         uj8KlphRqhHkJ31Adj4gN1GX4p4hkQ9gs1wRbrUWoiYbz6xt8G7Im+WmqGG46DVNAqwd
         zJ1y52hpI/fAVD7TxqfpuwgPXloJkz91c/STe7NiKUYn77ngLQK2DQAfktGfoYAccgUY
         vuRuOHSM7OXu2BXSW/2g3KbSxqAbqy7JwJpeOaS4i1h3f84yayHzGElvX3ObM9hHM0Hl
         cpgw==
X-Gm-Message-State: AJIora95RUXu2KBxI8hnN1rpG2Nuax13GVTiq624rpxKZ4WVBAfUdt6s
        EuP5nUmtLpee3bQjofduhtlAPw==
X-Google-Smtp-Source: AGRyM1uN44hG70+tSGODvdTF3iQbM3VjrcEY73XGjgx+6lSHhPIzcLJyF97ltAfGRZzDy0lqVrT2QQ==
X-Received: by 2002:ac2:5213:0:b0:48a:1082:b8e3 with SMTP id a19-20020ac25213000000b0048a1082b8e3mr3222399lfl.141.1657790041468;
        Thu, 14 Jul 2022 02:14:01 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id r16-20020ac25c10000000b0047f7c897b61sm253776lfp.129.2022.07.14.02.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:14:00 -0700 (PDT)
Message-ID: <4790173f-86b0-a079-dac8-282fe1d46755@linaro.org>
Date:   Thu, 14 Jul 2022 11:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 11/30] dt-bindings: phy: qcom,msm8996-qmp-pcie:
 deprecate reset names
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
 <20220707134725.3512-12-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-12-johan+linaro@kernel.org>
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
> Deprecate the PHY node 'reset-names' property which specified that the
> reset name should have an unnecessary "lane" suffix.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
