Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4B96D7335
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 06:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236970AbjDEEIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 00:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236976AbjDEEH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 00:07:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA4E40FB;
        Tue,  4 Apr 2023 21:06:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7525D63B17;
        Wed,  5 Apr 2023 04:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A58DC433A0;
        Wed,  5 Apr 2023 04:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680667600;
        bh=EnzM/f5CfIxT0BzuhnMLPLDGRjxebxjEt7h8u2828cA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XzafJMV5cNL6UtFBLUhAP7l2bv8cpZ+UcYrFRwyhV0IAsahDRulkN66/QuD1XPcAc
         L79o+QyEFgzme2Jefk5/zCXpsnfVrx3ooUuZL/eqsdNDg6ggKrymTQh6IJhNvcakSG
         +HxO1N0hWnXy8SPjWgqkp8jGQP+QYzAQ1scs7M75oWzR+4zU0ZndU+hQT+ixjW6f/q
         +GqTdxXSEgDJxpsSFwoEby1CV0Lg/1HXxzbwsFltQylJ9ahcmjXEOKaGAuFsu2yz2t
         7yUi7vqzG4Up2j7IdXHhHai+EWw/j8vhXdq1eAiJDIVasxMTX/JT1dlcuPfHJDKc3e
         09+gtbKtL1yIQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Move WCN compatible to boards
Date:   Tue,  4 Apr 2023 21:09:10 -0700
Message-Id: <168066774410.443656.14446523199881348664.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309091452.1011776-1-stephan.gerhold@kernkonzept.com>
References: <20230309091452.1011776-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Mar 2023 10:14:52 +0100, Stephan Gerhold wrote:
> On MSM8916 the wireless connectivity functionality (WiFi/Bluetooth) is
> split into the digital part inside the SoC and the analog RF part inside
> a supplementary WCN36xx chip. For MSM8916, three different options
> exist:
> 
>   - WCN3620  (WLAN 802.11 b/g/n 2.4 GHz + Bluetooth)
>   - WCN3660B (WLAN 802.11 a/b/g/n 2.4/5 GHz + Bluetooth)
>   - WCN3680B (WLAN 802.11ac 2.4/5 GHz + Bluetooth)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916: Move WCN compatible to boards
      commit: 3244442406ff49e8f75a1f2def211c497710570f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
