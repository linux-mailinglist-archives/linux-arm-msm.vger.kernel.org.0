Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4686A6D21B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 15:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjCaNt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 09:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjCaNt1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 09:49:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDF819A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 06:49:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70EB4B82FCF
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 13:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC0CC433D2;
        Fri, 31 Mar 2023 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680270563;
        bh=OY7p1Cg5NMe0bHsGpPxy9czXfpy6BM+8Hv0XIz5hgas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HIuwNiaqXO0V4AWht9OaL8rs/7EIFObwU57rlvDtdaV67kVXp3SqrRomURWCUvyff
         H08Wfin0Ud5saTNmYSu2ExyFQR6hAWN55hXxTKJO4JwM18xl/RRZW+kEgoQycynqh3
         mh1/Xj5c4bhsjdWxTs3PfjlDJexWNs5bi0qqey6pP1bbZOFphnX08cKgi44IzAJ0Xc
         a6M8FcCbzxdrFSVcLiaZwSx/DOEmFY1Eg3Jwdo6Of91bDfLbMS/xfTJgUb4v4UtBJK
         0hWLx4gcwPiFBaNmDLTpUWrns/ddaPU6VcWyouY80JIuzvstA/pF8wXPvr1HERC2Nv
         R3xhhJO79n9PQ==
Date:   Fri, 31 Mar 2023 19:19:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] phy: qcom-qmp-combo: fix v3 offsets table
Message-ID: <ZCbk3u2qBdjCnaC6@matsya>
References: <20230323144726.1614344-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323144726.1614344-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-03-23, 17:47, Dmitry Baryshkov wrote:
> SM8350 and SM8450 use qmp_combo_offsets_v3 table, which doesn't have
> PCS_USB offset. Add the usb3_pcs_usb entry to program correct registers
> while setting up sm8350 and sm8450 USB+DP combo PHYs.

Applied, thanks

-- 
~Vinod
