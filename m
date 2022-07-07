Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E785699A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 07:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234985AbiGGFDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 01:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234872AbiGGFDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 01:03:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BE43120A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 22:03:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96C7D621D1
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 05:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2725EC3411E;
        Thu,  7 Jul 2022 05:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657170181;
        bh=n4MgXi7RI8T+h+4dgz+WC4HjXbHnsjGu633E2wxoxnw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DvJHlCsX0ZEC8DBzcvYEq3WnkGfxh2+81No+TgNiOGfQwxvhoVodUcCrJIHFKsX86
         Ogq2baQtFs2T8u/+S1AP07PCpjyZvNi97TNwFrWaRu84iJCirBYYlrHgUr2nxrNppQ
         CSrR9o2xX4ZYJgX8/v6B/1BklMX5pLujcVAjOxG554IhxgfwvZSSI9upVnOnGavyx6
         VtejIjNtixJG2AJAm3upIXeRJ0+GxKr/3/48YI6VnKJfNSdx5CpAxz5sUdcLmpsDaT
         suyeXD7JFM1LQL/ZqhfwvOM2n8UAvv8hur9pwZluMfwYu1cGny2I9kBRBy+QTOYB25
         RGTU8WenuXeAQ==
Date:   Thu, 7 Jul 2022 10:32:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 00/28] phy: qcom-qmp: split register tables
Message-ID: <YsZo/14+2NftV4Ki@matsya>
References: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-07-22, 12:42, Dmitry Baryshkov wrote:
> As discussed during sc8280xp PHY review, rework and split QMP register
> tables. Create separate files for most of QMP register kinds. The only
> things left are various DP registers, which will be handled separately.

Applied, thanks

-- 
~Vinod
