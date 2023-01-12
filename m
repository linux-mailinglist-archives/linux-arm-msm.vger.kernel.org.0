Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D964667D0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 18:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbjALRym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 12:54:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbjALRyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 12:54:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCC275D0B;
        Thu, 12 Jan 2023 09:14:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 622FB620E1;
        Thu, 12 Jan 2023 17:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE33C433D2;
        Thu, 12 Jan 2023 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673543688;
        bh=wGqSSUxokKljpXDAZgu+rOwnQLNJ0q0o/BKGpJxolX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=enJk3CSrILDdZ7OkTGHvaHJRpi9Z1nBhInZhmMARqPCCWKQpaVNL4MfF/O9sAXS/N
         1ZkUk8LA6JFHfnEDV66ajL4lFj9Uo4sOUO5FEBGN6/+W/IgIjnFPj02wDQtn2zSfqB
         ynkqz7pXBS9bKJYETPvLHGTi67KVP0Vm+xenJLl950WlAUQ0zGlsadDG9ByDLXLBIz
         U7cia9DL+RTB8prtLYfDCDGR+5Xudac7PQuVEUrYFBAK6wakt22JRQRkA8u5f6LbFR
         tA7iXm946YLTBuua4MKwueWeDEeXR401EKmhwGRar/InkX80sfaeK+M6C45POiscJ3
         2PJwb/Qwb9aXw==
Date:   Thu, 12 Jan 2023 22:44:44 +0530
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
Subject: Re: [PATCH v3 0/2] phy: qualcomm: pcie2: register as clock provider
Message-ID: <Y8BABOGYm+y8BfsD@matsya>
References: <20221229115932.3312318-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229115932.3312318-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-12-22, 13:59, Dmitry Baryshkov wrote:
> On Qualcomm QCS404 platform the PCIe2 PHY provides PIPE clock to the gcc
> (Global Clock Controller). Register the PHY as clock provider.

Applied, thanks

-- 
~Vinod
