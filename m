Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB243645E24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 16:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiLGPyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 10:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiLGPyI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 10:54:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D51391D9;
        Wed,  7 Dec 2022 07:54:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49392B81EE6;
        Wed,  7 Dec 2022 15:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434BCC4314B;
        Wed,  7 Dec 2022 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670428444;
        bh=xIPmWCibkdavxCRVOURX8EUvxlNv0n6NgzyQqLhKu40=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NglCdmYGmRf+JoRXVGcExDaePqTYOl2L2MQhkpXMwItrZ6FBkgMwdR8kYK6e4uSXU
         hGqB2CVg5Jst/hsmMFfxgBfFqP3W2NJVetktXSJyoiYQ/dYYaVidqNqSEMs7BOyrJy
         dj3w5NjkFycyfCHxauS5cC/Oeu2iRUFB7xEnKbsOZB2hUdThloDqLBjHxBC0ws5PmL
         sVTFmvUglU2CIBk2mMpP72HCmRyUreD14daLiqGksW8dNaCB+GIosgTi+axWigSZDC
         czFxepv3QhmEfqj2Qg73MQcoovmOi3MYloTwZdAhzTFhJHg1IBx0mRjs0Bip3p22A3
         tDEL9NsaMT6zQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robh+dt@kernel.org, mturquette@baylibre.com,
        konrad.dybcio@linaro.org, dmitry.baryshkov@linaro.org,
        quic_tdas@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/11] clk: qcom: update MSM8974 clock controller drivers
Date:   Wed,  7 Dec 2022 09:54:00 -0600
Message-Id: <167042843840.3235558.2401904749733882313.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
References: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
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

On Sun, 4 Dec 2022 14:44:57 +0200, Dmitry Baryshkov wrote:
> Modernize drivers for global and multimedia clock controllers on the
> MSM8974 platform. Switch them to using parent_hws/parent_data, use
> clocks through the DT links rather than fetching them from the system
> clocks list, update schema and platform DT files.
> 
> Changes since v3:
> - Rebased on top of for-next
> - Changed gcc-msm8974 description and title to follow Krzysztof's
>   changes
> - Fixed commit messages to describe the reasons for xo -> xo_board
>   change
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: clock: split qcom,gcc-msm8974,-msm8226 to the separate file
        commit: 7c9c38fc6bda7214c1af3d3e741bc99df979897d
[02/11] dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
        commit: e80313c70a23c1c92f1ea1749799a90a1b490be4
[03/11] clk: qcom: gcc-msm8974: use ARRAY_SIZE instead of specifying num_parents
        commit: fce760071df1f32163655c37555eec8c1577581d
[04/11] clk: qcom: gcc-msm8974: move clock parent tables down
        commit: f2b4f1490e82dec9881565b2f92467c5b6f4636d
[05/11] clk: qcom: gcc-msm8974: use parent_hws/_data instead of parent_names
        commit: ff81be97120b6bb79f1239a184bb0c851d7ed9a7
[06/11] clk: qcom: mmcc-msm8974: use ARRAY_SIZE instead of specifying num_parents
        commit: 4e74e921ea0c576682ffd7981af1d4a73ceaca11
[07/11] clk: qcom: mmcc-msm8974: move clock parent tables down
        commit: 28c6c02527757a4b3c63b30d77f7e7d5c112c085
[08/11] clk: qcom: mmcc-msm8974: use parent_hws/_data instead of parent_names
        commit: a174d29a59ec9462d3e72fd00a9fd05054c4ab20

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
