Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8E16021B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiJRDGp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiJRDGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:06:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2300B915F6;
        Mon, 17 Oct 2022 20:06:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A4F76136C;
        Tue, 18 Oct 2022 03:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC32C43146;
        Tue, 18 Oct 2022 03:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062391;
        bh=Qrbobw4FoO1SskfO2lGSpP8wqfkEA2UGv6GdRRtd6Ro=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fqccnVZJjTDPjqyhkKmuczYznhYrRvoJM6W8/spZdSnWmCJtrAlu+XbUyRwOIHJMK
         XKZjwv/P4l+p9qfsVIAR7og4zq7g0ZwKGZ0MVvhyBeFf5PClqaeR3z00e93phzbWER
         7Iv1s8JCY0MlJnUt+Bk38ZXX9a9ZF1kAJ8enD3Go29Ob+CW/e7WDqMQgZRuQD405B6
         bSMjNZurG2LJJQ7rrg9UFR7fBGzQRBMVxICLa4t9quCcXANoBFKBN0jGXGa+sl7JG9
         iXM2NL16wS7KVDuy+sn2BhmUsBBNnoQC/pjC8L4UoSznVDs9nr7IqU8M8sMKDtO15y
         5Pp9DdrnnxQCQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robh+dt@kernel.org,
        agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/6] arm64: qcom: dts: correct firmware paths
Date:   Mon, 17 Oct 2022 22:05:12 -0500
Message-Id: <166606235855.3553294.11534953755926582478.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
References: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
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

On Mon, 19 Sep 2022 22:00:31 +0300, Dmitry Baryshkov wrote:
> This patchset corrects firmware paths for several Qualcomm-based devices
> to include the SoC name.
> 
> Changes since RFC:
>  - Fixed firmware paths for Sony devices according to the discussion
>    with Konrad (added Sony, renamed pdx223 to nagara).
>  - Changed ifc6560 to use SoC-generic firmware since the board doesn't
>    seem to be fused to particular PKI.
> 
> [...]

Applied, thanks!

[1/6] arm64: qcom: dts: w737: correct firmware paths
      commit: 7d1473d7ba78ed15cfe7e08c1d8b5f2b21d60bbd
[2/6] arm64: qcom: dts: miix-630: correct firmware paths
      commit: 6fa1fb7814f556a630b219033cd5de72e978537c
[3/6] arm64: qcom: dts: ifc6560: correct firmware paths
      commit: 6dae44d91e42da017d12b3dfeb546cbe2b9c9306
[4/6] arm64: qcom: dts: sagami: correct firmware paths
      commit: f0a577c3a80790f4249be76a6b9712003deb93a5
[5/6] arm64: qcom: dts: pdx223: correct firmware paths
      commit: c53532f7825c98ede6f80f9549e33443465aaf6a
[6/6] arm64: qcom: dts: nile: correct firmware paths
      commit: 151d6e9cc22a8a5e9bd47a99723aa4ab60821faf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
