Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9F17860F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 21:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238369AbjHWTrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 15:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbjHWTrj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 15:47:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B723D10CB;
        Wed, 23 Aug 2023 12:47:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4717060EA2;
        Wed, 23 Aug 2023 19:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1141C433C8;
        Wed, 23 Aug 2023 19:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692820056;
        bh=QxGnaftr84VW4gjN9xAYyfbIdSjPTPUVKXDtGI2GqYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zb6jsXmyBdTQI02UpLS80QuzKg8z6iH45Cf6H5ulZ2fu56AnnIdZO0JqwhE/RJJbO
         pNc19sphLPtfhqUnAMruxTCN4jlK8LEYyNTplK081baEe9ADmM78RVUxgA1ujiYlnn
         kpvI3G55YzagBerK3W4BD8Uig4TLWrYr0QjMZDSueKKY3Ps1X5mpJgZZraE6B703tb
         zaA8T2vpHTZNZ6ynUU7IwShSrKmyE32fDswfNvP0dkP5L76rC3qFvvDTyw14GACHAo
         nP81vFn+0hHLmnGjIB1cWWpfKGV1MCpjw2teItjIDjro7/Wt4DdYzvkd1RSoct88Sh
         RcXe/3Kmh17/w==
Received: (nullmailer pid 2780479 invoked by uid 1000);
        Wed, 23 Aug 2023 19:47:33 -0000
Date:   Wed, 23 Aug 2023 14:47:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,ipq8074-qmp-pcie: fix warning
 regarding reg size
Message-ID: <169282005312.2780420.1335528818414643618.robh@kernel.org>
References: <20230823181728.3082946-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823181728.3082946-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 23 Aug 2023 21:17:28 +0300, Dmitry Baryshkov wrote:
> Fix the 'reg is too long' warning caused by me adding 64-bit address and
> size to the example, while default being 32-bit (cell size equal to 1).
> 
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Fixes: 505fb2541678 ("dt-bindings: phy: migrate QMP PCIe PHY bindings to qcom,sc8280xp-qmp-pcie-phy.yaml")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

