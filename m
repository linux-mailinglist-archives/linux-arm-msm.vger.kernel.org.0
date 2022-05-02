Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5923F516A32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 07:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383293AbiEBFEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 01:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346303AbiEBFEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 01:04:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E97BE094;
        Sun,  1 May 2022 22:00:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0F2E2B80EF2;
        Mon,  2 May 2022 05:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61C6C385AC;
        Mon,  2 May 2022 05:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651467650;
        bh=f72U3ZLS6tSFvdK2RzShWEFR9VqMq/FaLEw3sp0nDps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nVwUnLj9LCzOBwsLkolGuD9u6XXmOz7aFw6TtIyg2bx9vnogH8J+YAcQ/i60HhwAN
         TkquhaactgStKVPGMPuMtofjzMznZb2Agqaf+5y8UUHU+ncF1Wz8sJpG+ZJET4qkzB
         T/8ajlOLQp+9iOiUsAIJJCqhhkkEUZhtHbDwKcUlxv1Y07BdmoOQWJCj9EdAkx5Cz0
         f6w7zxanr3DU03Z9PHEA9vaXnonpIgXxjJINDTZTYTPpzfU7J0QzbekN3tAqFwUR0v
         035E2//y/krmZe+Zo3jBbbZ3V3+QXO9vbLy5fQ5cf5lOt3yX/bR2WNS3NW6oN18H/7
         jbVbIHNjLOkfg==
Date:   Mon, 2 May 2022 10:30:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: add ITS device tree node
Message-ID: <Ym9lfYn4d5i2mWww@matsya>
References: <20220501195042.4132724-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501195042.4132724-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-05-22, 22:50, Dmitry Baryshkov wrote:
> Add device tree node corresponding to the ITS part of GICv3.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
