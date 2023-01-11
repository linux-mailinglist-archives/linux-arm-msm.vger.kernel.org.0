Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFAA66534D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjAKFTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjAKFSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:18:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA1D13D7F;
        Tue, 10 Jan 2023 21:09:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EB5161A32;
        Wed, 11 Jan 2023 05:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F151CC43396;
        Wed, 11 Jan 2023 05:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413789;
        bh=wV5Em+utyvyy2JqTv8eTMinP5zgOYmA1ZOqfGnBf6jY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r9YWK7I5JzBnXeNjJ4nLR5V/NlA5t9Az965Jm3PygXneKKlJKu/qTD0Pz+ScJQzna
         LP7Aqp9g7BK4LaXgQ8A+MroaIGtgcG3b+7oIoYAv+88HcyD8wzTA38QCrQjqEjSErD
         6Mlu8asUctnDt4iSASH97VGKGVk9AxSQHsLbJmOvYtie+aeXeQF++vNwFbid5VSu/o
         pjrWVQlU+MYzpfzMO9UXAUxaDfjmv3wC/6dFQU4as9KyLnuoKjTI7ybpnRao+um68E
         oZX8yIGYnqWR/T/b6zfEixWUWgdke2g5ukz38mU10R4xWqiI6Kq9QYX7nVCNoWCkOA
         kxt09fkQdGMaA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
        agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845: make DP node follow the schema
Date:   Tue, 10 Jan 2023 23:09:14 -0600
Message-Id: <167341377736.2246479.12728033689951062900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230110042126.702147-1-dmitry.baryshkov@linaro.org>
References: <20230110042126.702147-1-dmitry.baryshkov@linaro.org>
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

On Tue, 10 Jan 2023 06:21:26 +0200, Dmitry Baryshkov wrote:
> Drop the #clock-cells (probably a leftover from the times before the DP
> PHY split)
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: make DP node follow the schema
      commit: 19e509d5ea229244b9205f8671bb75b13738a1f9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
