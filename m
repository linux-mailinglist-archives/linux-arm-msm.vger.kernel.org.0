Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664CD4F0FE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Apr 2022 09:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345107AbiDDHTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Apr 2022 03:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbiDDHTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Apr 2022 03:19:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B0533EA8
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 00:17:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6C2596121B
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 07:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B71AC2BBE4;
        Mon,  4 Apr 2022 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649056628;
        bh=rSAJqJnEzLOmUA/q6lIY42NLKwgRv9JO6Lvbj00hQGU=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=LD+qLjSRC2bSBXSkPbDsg38XnxDSBf3zqiiKnNKSRx0Xcx1OEYNvhGDry6gwWCg6k
         sao4GqLFXPpYiMpyeU9oZy2g5C4C13ZVtW/NEbjhGmTSgboPGuSy+IMICxF+zmfbzV
         pzFSa5sXeSApwpVLBTIKI4aFCV4fyZe9q7W2oUWfkvLXd/4jPH3h/7v9h48xHN+tnl
         VlQ+TtmWeiPGaafdZNHDETiQIn2Ru0mmee4ylXjHuz/oo9tf0mGX8qhjJ4Vs+BKAQT
         07a1zVE3HXOU5ycsGFXvR2XICg2cCnRsxwyojwmV27h1FAsF3zCygjF3lw6hhkF3+H
         jI0fsxvRlyCuQ==
From:   Kalle Valo <kvalo@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: add wifi variant property
References: <20220403105711.1173161-1-dmitry.baryshkov@linaro.org>
Date:   Mon, 04 Apr 2022 10:17:05 +0300
In-Reply-To: <20220403105711.1173161-1-dmitry.baryshkov@linaro.org> (Dmitry
        Baryshkov's message of "Sun, 3 Apr 2022 13:57:11 +0300")
Message-ID: <87r16ds4ge.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Dragonboard845c doesn't have board-specific board-id programmed, it uses
> generic 0xff. Thus add the property with the 'variant' of the
> calibration data.
>
> Note: the driver will check for the calibration data for the following
> IDs, so older board-2.bin files that were distributed as a part of
> Linaro releases will continue to work.
>
> - 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Thundercomm_DB845C'
> - 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
> - 'bus=snoc,qmi-board-id=ff'
>
> For the reference, the board is identified by the driver in the
> following way:
>
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b fw_build_timestamp 2018-07-19 12:28 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
>
> Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 13f80a0b6faa..f49de3913dd5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1047,6 +1047,7 @@ &wifi {
>  	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>  
>  	qcom,snoc-host-cap-8bit-quirk;
> +	qcom,ath10k-calibration-variant = "Thundercomm_DB845C";

I don't think I have documented it anywhere, but to keep things simple I
would prefer to have the variant all lower case.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
