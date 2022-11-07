Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB2961E8FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 04:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiKGDMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Nov 2022 22:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiKGDMs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Nov 2022 22:12:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88436DFAD;
        Sun,  6 Nov 2022 19:12:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3AF83B80D8F;
        Mon,  7 Nov 2022 03:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097E1C433D7;
        Mon,  7 Nov 2022 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667790765;
        bh=2w6ixyGZqJOHN24KmauV8kPP5Yp4bDooYdpaBL0DhQg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ppgA1A084oLiaFZLEhL9uI+EZN8RYe9vFF4trwoAUpyziuVgWBiR/0ZmUhhGqJaBW
         n91X+H6r+nO61M/+nx98mEBYUWkqRn/Rf3n7sckFCDuemsy5m84by/seiFMIfzFzMn
         n36ow8tpNAZKHJsGIYZp5Y1DOum3t8/7zbVxJGMZkJPhT4QKDlB2Wng1TDNqHz6cpC
         9pRa0gOur7p+aEDohNc9lzstfR2bpx3IU7Uz9rPN74yr/5ICEVhSJ4ER0+KoohncDV
         +L0T+NOP02O3CuLVSh7/4r8y6pmyJrxmJcC5hTzqFaRHp+MHoHbEpNqI6uNFeLqfTL
         /mXbyFNI8+iGA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     mturquette@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org, Rob Herring <robh+dt@kernel.org>,
        quic_tdas@quicinc.com, konrad.dybcio@somainline.org,
        sboyd@kernel.org, Andy Gross <agross@kernel.org>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
Date:   Sun,  6 Nov 2022 21:12:02 -0600
Message-Id: <166779074254.500303.10706099611036851023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
References: <20220927113826.246241-1-dmitry.baryshkov@linaro.org>
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

On Tue, 27 Sep 2022 14:38:23 +0300, Dmitry Baryshkov wrote:
> Add the reference to the pll4 clock to the DT.
> 
> Changes since v1:
>  - Add dt-bindings and DTS changes
> 
> Dmitry Baryshkov (3):
>   dt-bindings: clock: qcom,gcc-ipq8064: add pll4 to used clocks
>   clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
>   ARM: dts: qcom-ipq8064: use pll4 clock for the gcc device
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: qcom-ipq8064: use pll4 clock for the gcc device
      commit: da6b4c059283166c1939143574b3ade96817304e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
