Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FE2665341
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235783AbjAKFTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjAKFRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:17:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2170C13D58;
        Tue, 10 Jan 2023 21:09:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B054161A38;
        Wed, 11 Jan 2023 05:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B332C433EF;
        Wed, 11 Jan 2023 05:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413786;
        bh=duOA8MEL6AgWZExGNdiAbw+EGmRbgHWfQbfiipbIX88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rpa2IpNyrIEemZ6v/yMQa08g+WoNDx7Q/ahRD2GdeoN94NHBKzaB5/NgpFjyRjox7
         GU4ZOlOdi/IGaNmnYDkw9TKSTIk7qIWkx0hIFZsTB8zk0PW2oK31WocwvEC2+Lc+Xc
         kUzFsbSV3p+PaRc6zF5GjZ7VwN2bgfhI7qmDH6MKKNVOpDW+gQMLsZi6MqaxfMXsjg
         dyjPzyoq7Z6Aa2M0UzffkL3XLAuhXCRZPvoEB4he9Jfldb03v/w+Suv/GDtBQBlsZH
         mbVocHzYVZk7kXT/NOhIGRcjHC5oCvzPbK7SGxRMocbdorDCaQIQEvLBIdDhx/2Fl+
         zV4D/pMuZT13Q==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
        agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996-oneplus-common: drop vdda-supply from DSI PHY
Date:   Tue, 10 Jan 2023 23:09:10 -0600
Message-Id: <167341377741.2246479.16732390534923425103.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230109042406.312047-1-dmitry.baryshkov@linaro.org>
References: <20230109042406.312047-1-dmitry.baryshkov@linaro.org>
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

On Mon, 9 Jan 2023 06:24:06 +0200, Dmitry Baryshkov wrote:
> 14nm DSI PHY has the only supply, vcca. Drop the extra vdda-supply.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996-oneplus-common: drop vdda-supply from DSI PHY
      commit: 1de4e112b97c77efb5cbee39db8541e33dd2b0d5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
