Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC00667D34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 19:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238723AbjALSAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 13:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239157AbjALSAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 13:00:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28295C1E1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 09:20:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7047B620B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 17:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B593C433F0;
        Thu, 12 Jan 2023 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673544018;
        bh=ioz1RqoqcnSRvilJYQimZjnLUOcmOmHK0LDKxDQhJPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Obra7E1jtoGFumhx7UDbukxYwKj1XTmsLXLK4YtVD0cv4+YAFAaHIYMN2Tt0+Yrgc
         oGiitobkTO4gjrw/HBuSJS3zvsRJgMhNedrYdqd0+zkPD6A/Bp826iuawowPG/xpOh
         l+A3OSOfmsC0zWZgc+TwCSu1dsTig+pl3SGcCuFp0g3Y+OEXiCKZ09z/m9reGvKqs9
         pk4Wh5KCWzX1xfg9P504ZA8KGeGRU2bmwtzqXjNQ1Q4nakVkmvnecS62C7uPfk+wKu
         w3nmgxm+Q6l2I0prpoWZnY5mLlc/9xbLHs+nudoAvyxatCGvxkBgeDZMiuLflKYXfX
         uP39b1GDS0vhQ==
Date:   Thu, 12 Jan 2023 22:50:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 00/13] phy: qcom-qmp: rework register layout tables
Message-ID: <Y8BBTx4tgvOChl66@matsya>
References: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-11-22, 22:22, Dmitry Baryshkov wrote:
> Rework register layout tables in QMP PHY drivers to use defined symbolic
> names rather than bare numbers. Also rename each register layout array
> to name the exact QMP version. While doing this, drop few unused
> registers and apply other misc cleanups.

Applied, thanks

This gave me a bit of conflict (patch4, 13), which I was able to
resolve, but please check things are okay

-- 
~Vinod
