Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DECAB7A7026
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 04:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjITCKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 22:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbjITCKA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 22:10:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA6B9F
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 19:09:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D848CC433C8;
        Wed, 20 Sep 2023 02:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695175794;
        bh=nbbgwXaHoczicRrk4+vrcusEnopPa9m6BU9tisUbF2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UE4BlfHe9oZCEhSmWEuO6+kgR7qzCEK4fIbEdHXHLsCZlwHAxarnntiT1cJ5Hqlf/
         Gl1ksmIjKUKpSNpt8YHxO6lzVEfVf7Bj/9eDh3ivmSe8KJGTa7bvwLcHnqV252Ov+U
         qt4/4YcUYj/mNP/ARPiIpf1ZGn7t2DmglslJeXOH7JcXTZ2Rcfbi7W4XwXlh9sNzFi
         St7Mbx0Ix/W/VjaRJhbeP9r60sFlexqGitSy+dWfwyyTfdOTJySpGBSv9dAbLFLrzg
         9oYhLiZPj8GmZx3kPhyJ9yupUcBLOJRjVSxWKnAIddgTGIXat9OSD7rCjdXdDyxFId
         TYlYuMWLp03GA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        heikki.krogerus@linux.intel.com, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     konrad.dybcio@linaro.org, subbaram@quicinc.com,
        caleb.connolly@linaro.org, robertom@qti.qualcomm.com,
        jackp@quicinc.com
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
Date:   Tue, 19 Sep 2023 19:13:55 -0700
Message-ID: <169517603981.822793.14975620404420683862.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 13 Apr 2023 12:34:24 +0100, Bryan O'Donoghue wrote:
> V5:
> - Amagamates into once device, Heikki, Rob
> 
> - Takes feedback on usage form Luka and Jianhua on VSafeV state transition detection
>   dev_err() -> dev_warn()
> 
> - Orientation graph example and general expected bindings
>   I discussed offline with Bjorn the conclusions of the glink/sbu model.
>   The expected orientation-switch path is
>     connector/port@0 <-> phy/port@X <-> dp/port@0
>   This can then be expanded to
>     connector/port@0 <-> redriver/port@0 <-> phy/port@X <->  dp/port@0
> 
> [...]

Applied, thanks!

[01/14] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
        (no commit info)
[02/14] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark regulator-*-microamp required
        (no commit info)
[03/14] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch as optional
        (no commit info)
[04/14] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add ports as an optional
        (no commit info)
[05/14] dt-bindings: usb: Add Qualcomm PMIC Type-C YAML schema
        (no commit info)
[06/14] dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
        (no commit info)
[07/14] arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching
        commit: ea96b90a58cf5d2e91ac177f081118ff26b85c1d
[08/14] arm64: dts: qcom: pm8150b: Add a TCPM description
        commit: 5a0539515cbfad30b3e08a00004ed0c86136add5
[09/14] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
        commit: c627d7337aae4d83b4db621fdb9e8f638056dcee
[10/14] arm64: dts: qcom: qrb5165-rb5: Switch on basic TCPM
        commit: 5b1b6da9d39d515395d85dc678ddac7ff1689438
[11/14] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1
        commit: 25defdca4d902b338c05bc01a1de1064a6d3b7f3
[12/14] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy
        commit: 45219a6b9497cb7713dd2bc221248ee1a7e9bb3d
[13/14] usb: typec: qcom: Add Qualcomm PMIC TCPM support
        (no commit info)
[14/14] phy: qcom-qmp: Register as a typec switch for orientation detection
        (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
