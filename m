Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F54A4B2B63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242360AbiBKRKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241138AbiBKRKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CD921F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0EA23B82B1B
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB2A0C340F0;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=vNHqzIX8cJsbxrfjLDpBkQfJlgi88Cg+NCjHi8CEKV8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DZ45GTpWCZgmh1jkfY4aTkJThRDum1dLizlg3Tl+CkHTO9HMM0G6Sejxf7yEsy7jf
         Uhx0ua/nxRSEayEiSxxEX+8aS69mlFBoePoRPncA4tC2cnulL3BmUu0TMhtKbdbWHc
         616NHZRr08T6TF79T9AwOsEVhyr+k12zvF+WlnjtGpGL0BpuLsDOv3zpd/FO7ONP6l
         gwjC3NggFViNDomVWkmChhGtsIFT6Q6AsDzbpypL8n397LykJj2exy55oAVIyXMLZa
         /Q5qx3KwiFiLB2qkdpKkD7BgoJsRjKiRaJlw6Q8g4zwctCT5Ri1K8Erx+JhA3RUtxa
         fsqKvkczssTQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95CBCE6BBD2;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v3 0/7] dt-bindings: Convert multiple Qualcomm OPP and
 CPUFreq bindings to DT schema
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941860.13057.13950593613175771169.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <20220203072226.51482-1-y.oudjana@protonmail.com>
In-Reply-To: <20220203072226.51482-1-y.oudjana@protonmail.com>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu, 03 Feb 2022 07:24:00 +0000 you wrote:
> This series is a compilation of DT schema conversions of multiple Qualcomm
> OPP and CPUFreq bindings:
> - qcom-cpufreq-nvmem (operating-points-v2-kryo-cpu)
> - qcom-opp (operating-points-v2-qcom-level)
> - qcom,cpr
> 
> Converting each one to DT schema introduces new dt_binding_check and
> dtbs_check errors to the others, so it was better to combine them into
> a series. Some errors were also caused by a couple of device trees having
> OPP tables with names that do not follow opp-v2-base, so these got fixed
> in this series as well. Finally, the lack of MSM8996 compatibles in
> arm/qcom.yaml caused an error in the opp-v2-kryo-cpu example, so they were
> added to the schema as well as to the msm8996-mtp device tree, which only
> had qcom,msm8996-mtp as its compatible.
> 
> [...]

Here is the summary with links:
  - [RESEND,v3,1/7] dt-bindings: arm: qcom: Add msm8996 and apq8096 compatibles
    https://git.kernel.org/qcom/c/134cfc5565d3
  - [RESEND,v3,2/7] arm64: dts: qcom: msm8996-mtp: Add msm8996 compatible
    https://git.kernel.org/qcom/c/3431a7f5bbf2
  - [RESEND,v3,3/7] dt-bindings: opp: qcom-opp: Convert to DT schema
    (no matching commit)
  - [RESEND,v3,4/7] dt-bindings: opp: Convert qcom-nvmem-cpufreq to DT schema
    (no matching commit)
  - [RESEND,v3,5/7] arm64: dts: qcom: msm8996: Rename cluster OPP tables
    https://git.kernel.org/qcom/c/f55dda215731
  - [RESEND,v3,6/7] arm64: dts: qcom: qcs404: Rename CPU and CPR OPP tables
    https://git.kernel.org/qcom/c/b7072cc5704d
  - [RESEND,v3,7/7] dt-bindings: power: avs: qcom,cpr: Convert to DT schema
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


