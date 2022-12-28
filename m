Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6FA65857B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbiL1SNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:13:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiL1SNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:13:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F3E17063;
        Wed, 28 Dec 2022 10:13:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE87615A1;
        Wed, 28 Dec 2022 18:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8ECC433EF;
        Wed, 28 Dec 2022 18:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672251227;
        bh=vAo070a0jAGDolutvmQrHXsrQbuhIo5yLBOr+7FrUrE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FfCU35iOXm/SFi6xQxJJLluqgrtQ/caDiJjrWGtMi4dLgwkcxnPVkLbJ5aR+kufPl
         PY2G/Gh56qofZlNZrxKouiqChtdnm8oZDCwlLwa+Z3qY3LHWuzUZUwo/y47fcUesEA
         xxXtbV1RC+NVl5ePrxEL2tNULPUaEu96ntnXQ2ARBMaLiGh3yZzcSPrhwSSMJATZ0B
         qOLUu7t+9HmrqJqJZZHqZsidyUyZoCmf2yHW7fTfrfR573QSP4g7msvA8Dxg4O5sRt
         tZKSe8js7QKupd9uyiZvl6w2rMZyBegkGD7YpWjJ3mcufRYJ7hIYTJeScNHr/smPnr
         3aoruT2u1Iaog==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com,
        robdclark@gmail.com, robh+dt@kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, sean@poorly.run,
        agross@kernel.org
Cc:     airlied@gmail.com, freedreno@lists.freedesktop.org,
        swboyd@chromium.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel@ffwll.ch
Subject: Re: [PATCH v4 0/5] arm64: dts: qcom: sm8450-hdk: enable HDMI output
Date:   Wed, 28 Dec 2022 12:13:41 -0600
Message-Id: <167225121528.949655.5387408578769393815.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
References: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 7 Dec 2022 03:27:58 +0200, Dmitry Baryshkov wrote:
> Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8450
> platform. Enable these devices and add the HDMI bridge configuration on
> SM8450 HDK.
> 
> Changes since v3:
> - Renamed mdss node to display-subsystem@ (Krzysztof)
> - Dropped empty line from the patch4 (Krzysztof)
> - Renamed HDMI connector endpoint to hdmi_connector_out
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
      commit: a5ac24ba17590866cf1ff8fe44cd2738c003d52f
[2/5] arm64: dts: qcom: sm8450: add display hardware devices
      commit: a6dd1206e45a43d7e6c46435437307b051471b69
[3/5] arm64: dts: qcom: sm8450-hdk: enable display hardware
      commit: 928a7b4269634369b152342a37b2809d18774726
[4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
      commit: 0cbe8e1953e083f8435bdb5548c3ba59acfcb97e
[5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
      commit: 0f48b65f716b4fa806fa864ea7f750113f4bd7c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
