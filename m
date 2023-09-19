Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BA07A6F18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 01:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbjISXE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 19:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233698AbjISXEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 19:04:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3356196
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 16:03:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3FAC433C7;
        Tue, 19 Sep 2023 23:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695164635;
        bh=NbnRpsIQKytYeSIhPybmhd3FgUe89Nwers3tNVmmIMI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fhC5dXsyhH3Yai1+SSBOXcP1tFZ2GegrVdsXeLJf6uYBgnPRLTiDN9zAly0uZaexH
         sQ88XW3SW1oVUI8JQi/wJLD+puvy4cK8QjWUwmj2dmF3zT18QCjfWB7mmgJDTWm33C
         328k+3MgOdrf93evIjkxcAZ2KVhWwUt+0Yv9Wn78TItU7TpHZLtWf3GaSpkI9W2iVg
         Bsd2b+9/tt9PofD/nlJJj9eixytK2ZFvQ5Syf0v6Egcd/qDQeL47sthVmqbpsT9fG7
         lIF9w1HyhradtwZlCgIbounx0w4TRT5zWT9EyjKCtV4SMOuaSRSEqE0FtYBbnmvfyE
         sDpBgGOJt+/hw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8916: Fix iommu local address range
Date:   Tue, 19 Sep 2023 16:07:43 -0700
Message-ID: <169516485976.787935.17910324015960246982.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915143304.477-1-quic_gkohli@quicinc.com>
References: <20230915143304.477-1-quic_gkohli@quicinc.com>
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


On Fri, 15 Sep 2023 20:03:04 +0530, Gaurav Kohli wrote:
> Fix the apps iommu local address space range as per data sheet.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916: Fix iommu local address range
      commit: 2de8ee9f58fa51f707c71f8fbcd8470ab0078102

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
