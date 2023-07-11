Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B2F74E60D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 06:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjGKEs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 00:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjGKEsz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 00:48:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C54E90;
        Mon, 10 Jul 2023 21:48:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3E0E611A5;
        Tue, 11 Jul 2023 04:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC02C433C7;
        Tue, 11 Jul 2023 04:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689050934;
        bh=syBSesJz4bQEud1x/w0OsK59AsM6Aw1rlTZhs2Zc3nY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Onprru4RGs8BGok5EVZZeLYazS2vYrBHePqsHz3Qf6DpoPCN3eYX7ABqqAjaaUNJc
         Ib5UuQIvmEmQkXITD1IWrGEjs6CxMBP9j1I+CpAifl4D15aIUYu46+tY8QTDWAqdbj
         8fXWWsMZy7+z1sPEhMsLzDpQI3ZVL69E4/1IY1uMHB44kq5vxt/JNSkOtc00NZbsoO
         LQJgQCDVJqjJ3+qqUqrqOHG5ujCNg1Tx28tycTGyi/t7JDdF0hUC9cPiG8htT57l4s
         xWEXsY9s4UdS5NKFXJIp/ENFkprVB+wHlVkAD+YwGkkiebskTdEnvcgi61lFJzRoKn
         LIY4PTuxcV5ZA==
Date:   Tue, 11 Jul 2023 10:18:49 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 01/10] dt-bindings: phy: migrate combo QMP PHY
 bindings to qcom,sc8280xp-qmp-usb43dp-phy.yaml
Message-ID: <ZKzfMZtaaaCb/U/u@matsya>
References: <20230521202321.19778-1-dmitry.baryshkov@linaro.org>
 <20230521202321.19778-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521202321.19778-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-05-23, 23:23, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,sc7180-qmp-usb3-dp-phy.yaml)
> to qcom,sc8280xp-qmp-usb43dp-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.

Dmitry, this fails to apply for me. Can you rebase please

-- 
~Vinod
