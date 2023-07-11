Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D606874E854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 09:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbjGKHrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 03:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGKHrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 03:47:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33869122;
        Tue, 11 Jul 2023 00:47:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C22DE61366;
        Tue, 11 Jul 2023 07:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963F8C433C7;
        Tue, 11 Jul 2023 07:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689061638;
        bh=OP40hzcD9aIJl6PAxgLW22+e1ssFnxcYrWBCFmU8cdI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V7ouqfIuCuSheYK2UN0/IIK+hPzrUrDoCDTqWcy3tBl+Fp9Tiq82xyNjsDZxfL1ly
         +hqFwjdaMT7seZbX34HMcmtjQtALqXPdoR5uuLY4e+96I12F8h0NycpKvfu/qyJOTd
         ILubK8aWaTtg9G0AjZ/Su88xEDy/Sk7fVTgUijFbhknPtC1i5+XUOpUI4Qugmo6qMQ
         UKXBrpmO5R32XJMfyMp2AFKvPxz/OBHFYShxK47pLMfDJMWbekNT2Y5dLuARvNYA0u
         9NcJacfm5YCrmeplVu6UaOlKJzCW7HprIG5e+tGQcZ2U3fbe5ALLyrJ3Ir4ox13iFB
         I6Tp2i1FT9LUg==
Date:   Tue, 11 Jul 2023 13:17:13 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/5] phy: qcom-qmp-usb: split away legacy USB+DP code
Message-ID: <ZK0JAW8VIYreQWzw@matsya>
References: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
 <168906148935.189433.9157580042783820391.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168906148935.189433.9157580042783820391.b4-ty@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-07-23, 13:14, Vinod Koul wrote:
> 
> On Wed, 31 May 2023 05:34:10 +0300, Dmitry Baryshkov wrote:
> > While working on the QMP binding cleanup, I noticed that USB QMP driver
> > supports both simple USB PHYs (which should be updated) and USB-only
> > part of USB+DP PHYs (which are largely legacy and don't need to be
> > updated). To ease further cleanup perform a quick cleanup of the last
> > remaining USB+DP PHY (on sm8150 platform) and split the legacy codepath
> > from the USB QMP PHY driver.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: add sm8150 USB+DP PHY
>       commit: b484e246a21433daaabd8678347c96f8339bf818
> [2/5] phy: qcom-qmp-combo: add support for the USB+DP PHY on SM8150 platform
>       commit: 4daee20877df04b96bc36752acdc41dfc581b34c
> [3/5] arm64: dts: qcom: sm8150: turn first USB PHY into USB+DP PHY
>       (no commit info)

b4 messed up 3 is not picked up, rest are

> [4/5] dt-bindings: phy: qcom,msm8996-qmp-usb3-phy: drop legacy bindings
>       commit: c30d437e92d20741a6db7ece024e15a0f5af6bcc
> [5/5] phy: qcom-qmp-usb: split off the legacy USB+dp_com support
>       commit: 770025644d971229c86fb97796268b8363c2c70a
> 
> Best regards,
> -- 
> ~Vinod
> 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
~Vinod
