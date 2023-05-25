Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEB571044A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 06:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238749AbjEYEv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 00:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238359AbjEYEvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 00:51:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D204198;
        Wed, 24 May 2023 21:51:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DE6B641A5;
        Thu, 25 May 2023 04:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3087C433A0;
        Thu, 25 May 2023 04:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990266;
        bh=NC5k/dortCaTYYIlrCvaSs13p3N1PuUUuNBljB2ZWuU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s3jr1i2YaPyOPc2Qk20qUMPVA9udUiXDduKblAQYXeFn+eRNVqM5fy7apWUpUYMZW
         UpKSghHkTVFt65vudox8c7fj3KYsecDYpSqkOni5JK6ifYIWH3GkS9XTu8iicdy3Dj
         c1GKr+Ee3XyiXja146geg34iDl4eVsyvTt2wWs+koIu77qWxnxlm0XJ6XTBQc0OtcK
         bSfLbLbwMa+s8xLuhVlGEeu5A+MCil2GnZ9N0BdmaeksnB0G2FNaO7UJesf4OHV7++
         ZMlU7tEP0KY/II650aWrAMRXQkBij5jpjY4Adl6LzYXWWIoSzjc3STXdclGNfCyRMK
         3/swa8B26rAvw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] arm64: dts: qcom: enable dual ("bonded") DSI mode for DB845c
Date:   Wed, 24 May 2023 21:53:46 -0700
Message-Id: <168499048179.3998961.8259109964158005747.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
References: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 May 2023 19:04:30 +0300, Dmitry Baryshkov wrote:
> Now as both lt9611 and drm/msm drivers were updated to handle the 4k
> modes over DSI, enable "bonded" DSI mode on DB845c. This way the board
> utilizes both DSI links and thus can support 4k on the HDMI output.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: enable dual ("bonded") DSI mode for DB845c
      commit: 8721e18ca6960f3c5a6a7f58245d9ab084ad09dd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
