Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2DE516A34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 07:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383295AbiEBFEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 01:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346303AbiEBFEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 01:04:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAEE18B28;
        Sun,  1 May 2022 22:01:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9651BB81059;
        Mon,  2 May 2022 05:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9BEC385AC;
        Mon,  2 May 2022 05:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651467675;
        bh=6JVH7OGn+qNAiBMWV4KwxfjAjYgwtmN650YcGSOPxmo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=umTBf6Sp8rTcgwHNfsDVShUeo6nXKd8LDBsY4sYMsH4oE2/qwdpHAbDG2zaKMOiMd
         LwUfDomlsVoIyVfUhQ9mJAkki2QITfc/vdJB3WRywXr1YrT9N8DuC+v9GK/A1Eq51R
         HI08j6qWCcMvxeXHgHp4IYoe5H2M+ULomATMA0UtsK9DkbFrqhVhwx+XEmZoot9Nol
         powssuewAM7vZBNVKwqU/+LMtCNTcOqhBmPNoLwjMB//CPjPYhm5dRTcPrJ5xQHjBB
         ilWmRB67TfAmACQSd2Kpsyy/B7oaTk7v39UoxfQPM7jk9r5sy7RKtamlzk2QV+O7l/
         Fzx6A6S+nsaKA==
Date:   Mon, 2 May 2022 10:31:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add uart20 node
Message-ID: <Ym9ll+DdgcqPGNog@matsya>
References: <20220501195458.4134911-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501195458.4134911-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-05-22, 22:54, Dmitry Baryshkov wrote:
> Add device tree node for uart20, which is typically used for Bluetooth attachment.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
