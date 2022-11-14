Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97EF62824D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 15:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiKNOVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 09:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236316AbiKNOVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 09:21:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2F6286D8;
        Mon, 14 Nov 2022 06:21:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A3826119C;
        Mon, 14 Nov 2022 14:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E4FC433C1;
        Mon, 14 Nov 2022 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668435661;
        bh=13/JHxTH9gKiHuuYZdFMKPZEuHbRRp3X/FpHo3JG1Rc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IUcEvmPBxbw6KVFrAso0Ew9Bn3MIaR/7Yx6y5vGNGSi9dn3yj1E31rpZRzumjgr0D
         gOidG7RIMbS4iUErMPH7KCT+/bvJE93KsIKWYgeTprS7pxhN8ch53gM0w6uTtQ5ffj
         mwvNa2iiHwcc/dJ5smKbzpjJenzFwi8uZFC0xSNn3aE90a9of6S1k7wfWPhyFwmF79
         Dg40I7tiEqC+nlWavGZ/DCLyJfWmhlPgQaPvcxSj7qeWOlWCv6G8p9ho+SQJUVo5wG
         gnuRPHjQMIl+y/n3zvC83SQXvEo6ptzifTWkbMhB+7WFWxfdxeR9onHO42/QLy84Yf
         98xMpup9YtXjQ==
From:   Will Deacon <will@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/8] Add support for sm6115,4250 and OnePlus Nord N100
Date:   Mon, 14 Nov 2022 14:20:53 +0000
Message-Id: <166843335275.2454481.8195401602727658140.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221030094258.486428-1-iskren.chernev@gmail.com>
References: <20221030094258.486428-1-iskren.chernev@gmail.com>
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

On Sun, 30 Oct 2022 11:42:50 +0200, Iskren Chernev wrote:
> Changes from v4
> v4: https://lore.kernel.org/linux-arm-msm/20220919180618.1840194-1-iskren.chernev@gmail.com/
> - rebase on next-20221028
> - drop merged patches
> - add unmerged patches from https://lore.kernel.org/linux-devicetree/20220815100952.23795-1-a39.skl@gmail.com/
> - all in all, treat this as a resend
> 
> [...]

Applied SMMU bindings to arm64 (for-joerg/arm-smmu/bindings), thanks!

[4/8] dt-bindings: arm-smmu: Add compatible for Qualcomm SM6115
      https://git.kernel.org/arm64/c/728b22a57232
[5/8] iommu/arm-smmu-qcom: Add SM6115 support
      https://git.kernel.org/arm64/c/2fd6e1ad7e19

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
