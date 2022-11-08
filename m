Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 600F4620605
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 02:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbiKHB3J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 20:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbiKHB2o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 20:28:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58552CE35;
        Mon,  7 Nov 2022 17:28:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6A1B3B81717;
        Tue,  8 Nov 2022 01:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7330DC43146;
        Tue,  8 Nov 2022 01:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667870889;
        bh=PzsZjDNu51G0j+BiKT1Nf/hNjkDgWoJKuQ7PzMp9oAU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bJ975+vxT9OpB5mr+zje0Bjrx/sOdgl1Gh82Doo/ftHjl8WzWNC3wd1R181DR+Uf5
         2BmXU/UhPjvetCkHkv++O9IuzHaHBZPO0LmVzaus3ycM2ZuG33oDUKujDg/Q5HEY3a
         h3AVoYFtZeviQtfs/bmhN3iqTxOfRxKETH/XCoxTFD1/xfwyS9p+s0YnrvNNWzcDPE
         qmri917bM4E5mDZCZcnaa3ycY+fLMqwkGKSf68Z4ZLBDmRXKpe3CViG8aKrU3x+uZ7
         bQoWF2ip53gdiQgT7RR+t48w66AGs/bm1bE/dMs5WPasGQy2sgiBVtYra1XaQZOSlV
         p7ybDaX6OsiiA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robh+dt@kernel.org, konrad.dybcio@somainline.org,
        quic_mpubbise@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] arm64: dts: qcom: sc7280: Add nodes to support WoW on WCN6750
Date:   Mon,  7 Nov 2022 19:27:38 -0600
Message-Id: <166787084677.599230.49227321199076930.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
References: <20221017125346.3691-1-quic_mpubbise@quicinc.com>
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

On Mon, 17 Oct 2022 18:23:44 +0530, Manikanta Pubbisetty wrote:
> Add DT nodes to support WoW (Wake on Wireless) feature on WCN6750
> WiFi hardware on SC7280 SoC.
> 
> Manikanta Pubbisetty (2):
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sc7280: Add nodes to support WoW on WCN6750
      commit: 42582b27dcb1cb60f3601ecac07d3564ce7dc378

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
