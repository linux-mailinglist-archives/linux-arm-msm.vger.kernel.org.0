Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 144C37A712D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 05:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjITDzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 23:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbjITDzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 23:55:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFD9DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 20:54:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29CBC433CB;
        Wed, 20 Sep 2023 03:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695182095;
        bh=VATz1YuiOizNoYOp18zfXULPZiNNbfUSxGAA3RGZDGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AjHfha4uDGodr/Jv4pn78mbZVIS+ptUq2TGp1p2ZnlwnKmtIhfFTMyoVzaRq3LEuj
         Q3qVnHJyWbHDhn8twm8PVSXW/jgfCJ3btpkRHONh5MzpNwxGdzyg9rtpuLnAqhICIW
         Yac5vJwmgbyXq/RFoHYNhgjnjA2HP6aVuNWOYleDspQJqrOKVCgZvk7+UKbcMCaMEO
         0cAn/2nDgnR7OO+jqqamtPXFXVOfC/L3waaDAlsYLTnwo2/zIytJmVlgDjpnClyj3H
         GFW+5ucT9SauJhc6vfXTXokJIzHol5FXexlKiRS5JfHtGBCJtwzhNYhd5RQxtEzmj7
         IvRdVDANkphxA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] arm64: dts: qcom: sm8350: fix pinctrl for UART18
Date:   Tue, 19 Sep 2023 20:58:46 -0700
Message-ID: <169518233717.1055386.285753115535542575.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230825214550.1650938-1-dmitry.baryshkov@linaro.org>
References: <20230825214550.1650938-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 26 Aug 2023 00:45:48 +0300, Dmitry Baryshkov wrote:
> On sm8350 QUP18 uses GPIO 68/69, not 58/59. Fix correponding UART18
> pinconf configuraion.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8350: fix pinctrl for UART18
      commit: c1efa960114f743924b884da098298512a7e9983
[2/3] arm64: dts: qcom: sm8350-hdk: add missing PMICs
      commit: 2037fefcdea0252b45f9003659f8b0431054c417
[3/3] arm64: dts: qcom: sm8350-hdk: add pmr735a regulators
      commit: 4e4c45f90ee313a4b475591a3109ff5314127f40

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
