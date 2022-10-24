Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A99860AA05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 15:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbiJXN1g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 09:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236443AbiJXNZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 09:25:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0ACDA99EF;
        Mon, 24 Oct 2022 05:31:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A50A612DD;
        Mon, 24 Oct 2022 12:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99063C43149;
        Mon, 24 Oct 2022 12:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666614670;
        bh=9X6SVDf/1tQMe9AbO2xOUjgoU+K7KCwfULZRA7cjm0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HndUX2hkhmZvTvKujWQo24m3lxvzu5RmKUf5jyxP8L36a77WzCyeErG5N3shUZuuZ
         QbA++2DpAx7Yp6id8JcNHxNaJLFjJ0Ibw5xB026RAb6QIo1E+cdqwUAaKQl0jEwN2/
         6JHvrQvmS2kZHkHMKnNRXxbt4vQdSwEpsHMovrIHlHvxCYv82d7uN6GtuQDjkSGPdH
         kwQZPjnMDbHXsl9qhZ/FvzXCFbaCRW+AJeh7fZLDvWZRipIMiRHmFyeNJnPoP//u65
         zHZfY51l1o4QBGO1VKlWoYMH45V7ZyUabgW6ulr5fqpQG9wkt0io2RiFJftaJGlyTe
         I9UObK0N4ngcQ==
Date:   Mon, 24 Oct 2022 13:31:05 +0100
From:   Lee Jones <lee@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/1] dt-bindings: mfd: qcom,spmi-pmic: Drop PWM reg
 dependency
Message-ID: <Y1aFieLdjCu+QuSq@google.com>
References: <20220928000517.228382-1-bryan.odonoghue@linaro.org>
 <20220928000517.228382-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220928000517.228382-2-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 28 Sep 2022, Bryan O'Donoghue wrote:

> The PWM node is not a separate device and is expected to be part of parent
> SPMI PMIC node, thus it obtains the address space from the parent. One IO
> address in "reg" is also not correct description because LPG block maps to
> several regions.
> 
> Fixes: 3f5117be9584 ("dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC")
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

NB: This applied with conflicts.  I fixed them up, but they might be
incorrect.  Please ensure you review them, either in the MFD tree, or
when they appear in -next.

-- 
Lee Jones [李琼斯]
