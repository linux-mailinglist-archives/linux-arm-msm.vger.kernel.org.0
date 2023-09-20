Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15DED7A8C14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 20:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjITSyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 14:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjITSyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 14:54:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3908C2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 11:54:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FFEC433C7;
        Wed, 20 Sep 2023 18:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695236055;
        bh=TW1uzU7gapnNXOh5chP4DOPiNuO8LtG4yLM2fxUiLOI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nBN/O890zH+vdIugfyDJO+/6Ccj/1FdkIm92YjGl3Bgb5gK47SS9jzJMlhoO62EWe
         FtQq9cRVvbmD6+Q6KW7n6+sbdLvMEgX1X8tm1Rb0VFc+ccci7M4MWr9sIry0retp5r
         5fyLz4pc6rwm5NuIKctAGuUkIlueJx3ZhOouP+k8W6YavJCzg8+ADgehLaJAsSnhdv
         6lF0r5yoL4KXJgYOKOYtZwEKTnyUGchngBrwrEyf6ULtLEGqGtiHhqEBBccDE9KrcY
         IoJoUbLmkNCJUcHnaY8EmI7dIW0CJ1Fc6JBagJCczo3hi6KB05X532KkHkMsOiwvT7
         M0Ecpz92hLTJA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: msm8939: Fix iommu local address range
Date:   Wed, 20 Sep 2023 11:58:21 -0700
Message-ID: <169523629857.3360741.6857369102757303278.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230917140039.25283-1-quic_gkohli@quicinc.com>
References: <20230917140039.25283-1-quic_gkohli@quicinc.com>
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


On Sun, 17 Sep 2023 19:30:39 +0530, Gaurav Kohli wrote:
> Fix the apps iommu local address space range as per data sheet.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939: Fix iommu local address range
      commit: d40291e52d5ac4d0ff18ca433e84e6ddccc13427

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
