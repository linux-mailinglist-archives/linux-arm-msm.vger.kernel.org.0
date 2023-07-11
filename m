Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F325674E62B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 06:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjGKE7j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 00:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjGKE7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 00:59:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35D1E57;
        Mon, 10 Jul 2023 21:59:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 921266130F;
        Tue, 11 Jul 2023 04:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F01C433C7;
        Tue, 11 Jul 2023 04:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689051568;
        bh=BHYRB7fUcdE8isC61HuBY+Z3fojLdw0VHXO4sAwpFSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=thTFNZ46dEEA7vRiS3KRN2uz6yvGmc/9bHjQlEzve1wt3AoFfSXd1+7OXevLsstVE
         w/ndNU6yOx+5Tu5AHEoWfLf7VyENjqZ8UmsPZ81BB0LmPJi5UVdfQwYPjOwlwu5xUv
         12joYY9b59xxn5GydiKGEJzrKa+tRIItTK9XC8xSBP8DYjA90cI/ooqde3vae0HRgP
         QneWL0F+Z8TWmQAckKf1OsKvDEnmz6ALlaFnk5sM3slNIyu5FuxR59aA+diWRkW6bc
         NeSNXytogeyoeT/REqp4VuMCUDIzf6hAG2y64DK6KCn8J5dSK8BcOspHYeA7M2rr1J
         PJkoKX2TmZafg==
Date:   Tue, 11 Jul 2023 10:29:23 +0530
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
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/11] dt-bindings: phy: migrate QMP UFS PHY bindings
 to qcom,sc8280xp-qmp-ufs-phy.yaml
Message-ID: <ZKzhqxBu5my2agdp@matsya>
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
 <20230523140622.265692-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523140622.265692-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-05-23, 17:06, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,msm8996-qmp-ufs-phy.yaml)
> to qcom,sc8280xp-qmp-ufs-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.

This needs rebase as well

-- 
~Vinod
