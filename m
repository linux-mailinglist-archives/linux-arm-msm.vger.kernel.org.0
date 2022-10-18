Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39633602271
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiJRDUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbiJRDUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:20:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665FA93799;
        Mon, 17 Oct 2022 20:17:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4EE22B81C68;
        Tue, 18 Oct 2022 03:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122DCC433D7;
        Tue, 18 Oct 2022 03:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062923;
        bh=eZiatdFic/XZbED5V2L6VII0XD/kJbNjazzM1W/gimI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dem1n+T3Bg0rBJzoKD8Uqfnq2J6/YXoLMI21CitdRU/m/wBLXPNR02Y2gIVBRVPGq
         89vZmam2y8bVEuaArAXeFk6e0PmPOJ8V6Osu/68Oods0oYzKmFvX8K8p6CMhpB2dge
         68+zAppBgPIRhsm8WospHALbafv3ycjorYk2aSOtSCOcLy0x+fLpYX1n8rveF0lys2
         LcG7YINNEF1MOJRMoGuYqrDHeyl9l4sTWjUlgd0rdOoUI17MNJlaCT9zdjJWzxX+f+
         3eSdg8JT05zBZxYXRvGjHjJSMOsSXpBRrDg581uUY6ZU+XOS35ewljNNdN2TKjfw1j
         7H88pHA6Ju00Q==
From:   Bjorn Andersson <andersson@kernel.org>
To:     stephan.gerhold@kernkonzept.com,
        Bjorn Andersson <andersson@kernel.org>
Cc:     luca@z3ntu.xyz, linux-remoteproc@vger.kernel.org,
        stephan@gerhold.net, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org,
        sireeshkodali1@gmail.com, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH v2 0/5] remoteproc: qcom_q6v5_mss: Add MSM8909
Date:   Mon, 17 Oct 2022 22:15:16 -0500
Message-Id: <166606235848.3553294.3037535719852328375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
References: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
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

On Mon, 18 Jul 2022 16:03:39 +0200, Stephan Gerhold wrote:
> Convert parts of the qcom,q6v5.txt binding documentation to a DT schema
> (together with some DT fixes) in preparation of adding a new
> "qcom,msm8909-mss-pil" compatible. The schema can be easily shared
> between MSM8916, MSM8974 and MSM8909 because they have almost the same
> requirements. The other SoCs are quite different and would be better
> described in a separate DT schema to avoid a lot of complicated if
> statements.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: msm8916: Drop MSS fallback compatible
      commit: ff02ac621634e82c0c34d02a79d402ae700cdfd0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
