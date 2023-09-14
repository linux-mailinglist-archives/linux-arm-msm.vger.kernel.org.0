Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 562357A09FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 18:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241422AbjINQAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 12:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241373AbjINQAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 12:00:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917401BF8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 09:00:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F7CC433C9;
        Thu, 14 Sep 2023 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694707233;
        bh=Pq+JZ7AOCNCHzsxRrec+4ynNFyDZYmXwiQzuhBHdAfM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MoeSqVf+7wLEvBQV4am2XJiWhxokbKUEsGzb0wdVF5bcBRp3qeZ3M1hJp0CgSfwWb
         VrnuPRv7CQ6o7ixw3M22UOFVgddQt3c9U3W56hmHdWdhU7yLeZ0GD0EVhSWCJ/BZRG
         gra3WVTi3+MGtEkXalHQ8+cFJZNgmq5E6gJXKvHlZyNOI8MEPsf6zce3G6XD3+bSeZ
         3Urr1QZPJtj2tToOICPflJnhi7dWThZCAUbyKHjCl8tS41PJkUSj6yRow+OdD4/tgP
         Sc/rsIz3LbRreU4yTJHjm+519mBWesiagPz5/Hhun7Y6X+G3nJtlI9JcUgsr7Bd8RH
         Sf5NOCNx+O4LQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/10] phy: qcom-qmp-combo: convert to newer style of bindings
Date:   Thu, 14 Sep 2023 09:04:21 -0700
Message-ID: <169470744892.681825.5621004293047784598.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
References: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 11 Jul 2023 15:09:06 +0300, Dmitry Baryshkov wrote:
> Reviewing several patchsets for newer platforms made me understand that
> having two styles of QMP PHY bindings causes confusion. Despite binding
> documents having notes telling that old bindings should be used for
> older platforms, it is too easy to attempt adding new platform with
> older QMP PHY binding. Thus let's have just a single documented style of
> bindings.
> 
> [...]

Applied, thanks!

[05/10] arm64: dts: qcom: sc7180: switch USB+DP QMP PHY to new style of bindings
        commit: ebb840b00b7f9fc15153b37a7d9ec5b47a5308c1
[06/10] arm64: dts: qcom: sc7280: link usb3_phy_wrapper_gcc_usb30_pipe_clk
        commit: 70c4a1ca13b333b00e01266d299605fa1041b0d5
[07/10] arm64: dts: qcom: sc7280: switch USB+DP QMP PHY to new style of bindings
        commit: 36888ed83f998c3335272f9e353eaf6d109e2429
[08/10] arm64: dts: qcom: sdm845: switch USB+DP QMP PHY to new style of bindings
        commit: a9ecdec45a3a59057a68cf61ba4569d34caea5fc
[09/10] arm64: dts: qcom: sm8150: switch USB+DP QMP PHY to new style of bindings
        commit: 0459c56e538bd4d8ed7f128d7a50a8990cbcb7b8
[10/10] arm64: dts: qcom: sm8250: switch USB+DP QMP PHY to new style of bindings
        commit: 1a47520b314a0f201fcec8c741ae60608380e78c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
