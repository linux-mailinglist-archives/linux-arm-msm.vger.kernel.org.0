Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2244A664B75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 19:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239480AbjAJSpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 13:45:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239499AbjAJSpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 13:45:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDFA8BF00;
        Tue, 10 Jan 2023 10:40:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B675B818FF;
        Tue, 10 Jan 2023 18:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23554C433F2;
        Tue, 10 Jan 2023 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673376008;
        bh=peUKivG1RFYc2AUIx1t3veHp32Gl6+m50j+8BpqHDMU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Shc2EQ6946YqnAZWwq9bgeO3taUA3ksNGbQXFeHy/O0qMANoD6mroMZrVaV2475bo
         RS6cJFhc+0j60u08fzYtd/1yQYOMaiJcLIBftoSbz7+CYc+k4q8RmOJfksP2aEOQPH
         OH70pelcJGUfB+8vREUERrQ4bIrmTlN1wmrrLFCLNSjfH6D8x3pCUExV+7Ey03Rx0+
         C8zSxdImmPPF2k3FG1z9qfbQC2JFtr+V9G/0WBorulAa0QYbqWg2lHr0jo2/7f2oyW
         RAdocxIpURHhoTPphGidCwgIRNNGgZRp32PH98Uzsn6+JPArWbOWYo0eJs0ROq+jkP
         ttYgGcoDnjuRA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robh+dt@kernel.org, sean@poorly.run,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, agross@kernel.org,
        konrad.dybcio@linaro.org
Cc:     freedreno@lists.freedesktop.org, airlied@gmail.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, daniel@ffwll.ch,
        bryan.odonoghue@linaro.org, swboyd@chromium.org
Subject: Re: (subset) [PATCH 1/3] ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl to dsi1
Date:   Tue, 10 Jan 2023 12:40:04 -0600
Message-Id: <167337600117.2164548.7307616788379672932.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
References: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
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

On Tue, 10 Jan 2023 07:54:31 +0200, Dmitry Baryshkov wrote:
> Extend the secon DSI interface with the SoC-specific compat entry,
> following the change for the first DSI interface.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: sm8150: Add compat qcom,sm8150-dsi-ctrl
      commit: b0b8b34a8d6b4c50dac086ca18964fae5e6954d4
[3/3] arm64: dts: qcom: sm8450: Add compat qcom,sm8450-dsi-ctrl
      commit: b7f4f6971d62f0019c27142ee6b703d8cab96e38

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
