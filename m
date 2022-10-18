Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3EB6021BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbiJRDGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiJRDGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:06:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CE172B58;
        Mon, 17 Oct 2022 20:06:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE7156120C;
        Tue, 18 Oct 2022 03:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60363C433C1;
        Tue, 18 Oct 2022 03:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062393;
        bh=MCPaHD1XR47XKulO53hDn82WBkySl3mI+YMPiYBC6ls=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wpv+FqKcuNOsAV2szJCGsxb2IZ1Yl4P95o9ZoCokt4+o7svJ37vGJoZ62K/D2mWd1
         NoDw4Tl0xNtRtXz3y7FkrgG25zRWao2NwgTO/aIaufEfYHiM36FKCWc3uODsc43O70
         hsIIuMgqm8qY/EXy+rXnZu8yKQvrDcWwyrrXnmW3umfz8vh5iSQUn6wR+UOuzuftDs
         fZLQSF/TJTNoEvi1D0EqZhNfC5UijC5NjyguKIWHiWwbtYn9vGM4XikYEc5IZyXAfd
         0yDs+lP761q1ktgJ+UwUMUaQzXlirQoGslnjZakcZUJc+OMg2xhv7IvxrJX6OXDq/X
         gjjzi1D9Y0IXw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>, quic_tdas@quicinc.com,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/4] clk: qcom: add SM8450 Display clock controller support
Date:   Mon, 17 Oct 2022 22:05:14 -0500
Message-Id: <166606235853.3553294.15924373732172884011.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
References: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Sep 2022 01:28:46 +0300, Dmitry Baryshkov wrote:
> Add support for the Display clock controller found on SM8450 platform.
> 
> Changes since v2:
>  - bindings: added missing gcc-sm8450.h include
> 
> Changes since v1:
>  - Rebased on top of 6.0-rc
>  - Dropped clk-names in favour of using parent indices (Bjorn)
>  - Added GCC_DISP_AHB_CLK to dispcc node (Bjorn)
>  - Changed bindings licence to dual GPL+BSD (Bjorn)
>  - Removed zero clocks in dt bindings
>  - Fixed syntax issues
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sm8450: add display clock controller
      commit: 65b35e04d2656305320c453df2824c8413fe7150

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
