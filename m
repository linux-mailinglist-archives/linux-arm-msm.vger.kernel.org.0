Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96C26C7BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 10:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjCXJnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 05:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjCXJnI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 05:43:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8185413DFD
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 02:43:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27991629F3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 09:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD0BC433EF;
        Fri, 24 Mar 2023 09:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679650986;
        bh=BjDSQ2M9Nq3XeJAhEOG+zKOsX2DwXaeQIEve9NfoSaM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Pk//I3exmWhn455U+JWkNzRefcvdKW1/nJwUJFiNOJAr27L5M1ia7jyiNLP0Ob3sk
         7hIYRg6M/IbDTfJqXQ2LzEXscvm8lyu4X3J/rCWMyQwUNbtvNz+uM34nZfO4hF1rjy
         oWTQkZGjxbitH6xar/TpyNPA6HA24p6ct1rss+69e2HegY+5kbLFvIYojGUNWPlz8n
         HfuxA1vijjmyy1dtJknX+YFIqa8rvqqjB+qlmep0sMK34Rld4jqlEyccisCjvy8pLT
         NyoBo111C8eBwW/ZMj4i834LLDbkiyKLVN9YQiuj+qQLpwFEAwjNf9g2rxwtWZPqLM
         /uAVQ6GadjqbA==
Message-ID: <083a8dc6-71d0-bcf5-664a-66c4c729399e@kernel.org>
Date:   Fri, 24 Mar 2023 10:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/41] dt-bindings: phy: migrate QMP USB PHY bindings to
 qcom,sc8280xp-qmp-usb3-uni-phy.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
 <20230324022514.1800382-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230324022514.1800382-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2023 03:24, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,msm8996-qmp-usb3-phy.yaml)
> to qcom,sc8280xp-qmp-usb3-uni-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 394 ------------------
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 236 ++++++++++-
>  2 files changed, 226 insertions(+), 404 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Since you skipped DT list, there will be no tests run, thus this is
unfortunately a NAK.

Best regards,
Krzysztof

