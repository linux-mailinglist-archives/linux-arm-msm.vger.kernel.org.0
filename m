Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2858F620843
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 05:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbiKHEgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 23:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbiKHEgd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 23:36:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF2B2183B;
        Mon,  7 Nov 2022 20:36:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D89436142E;
        Tue,  8 Nov 2022 04:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D60BC433D6;
        Tue,  8 Nov 2022 04:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667882191;
        bh=9xpt49gT45y/+nP1FfaBQXR9URrzOWIJn66IA+DB+sk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HjCBJUeBgGz2ODaX1HRfOnfsBtvMUnH2fl3S2+1qoij+ELta2STas35VnJ0cZE8On
         /AmM2XQk8QBDzICPthsipx1OgPsvRb1+Zsnshrz+QPQQZzUHMDPIHG0cyMPpf4Zt8+
         pHH5uDOjqMiX6XnDCeYBW9OgN7f06gEwrCuoLUZ2CFJMv/xhJuQ8QR67eaIWUYMyWQ
         PUkq/n+3z4fDK7h0d4r9MD/CkgCMB5mwk9P4n6/0C0CkvChi3Xg3yrLHklhmZ0EueJ
         hvjAQEc/TNEwIVg4OAHp4gOA3ywFvJKY9ED4T7vYB2wU2VFnqCi0+JqqZWpFIVzLWs
         zRYGIPwHBb/Yw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        will@kernel.org, robh+dt@kernel.org, joro@8bytes.org,
        konrad.dybcio@somainline.org, dmitry.baryshkov@linaro.org,
        robin.murphy@arm.com
Cc:     iommu@lists.linux.dev, quic_saipraka@quicinc.com,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [RFC PATCH v2 01/11] arm64: dts: qcom: msm8996: change order of SMMU clocks on this platform
Date:   Mon,  7 Nov 2022 22:36:25 -0600
Message-Id: <166788218325.625965.13235761598838044244.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221102184420.534094-2-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org> <20221102184420.534094-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Nov 2022 21:44:10 +0300, Dmitry Baryshkov wrote:
> Change order of SMMU clocks to match the schema.
> 
> 

Applied, thanks!

[01/11] arm64: dts: qcom: msm8996: change order of SMMU clocks on this platform
        commit: d6e636787d462c047a424dd442b68a249edde2a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
