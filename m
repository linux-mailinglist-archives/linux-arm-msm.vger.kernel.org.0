Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDB860228B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbiJRDWO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbiJRDV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:21:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C739C7F7;
        Mon, 17 Oct 2022 20:17:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E3716142F;
        Tue, 18 Oct 2022 03:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C92C433D7;
        Tue, 18 Oct 2022 03:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062925;
        bh=0dZmrWo0zCd/P4QAHpVHLxXeNK1MQcxKqHETbuW8dic=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QxaBGy4ebQBzmA3vc4U4CsJQTz6GKTN8rKD9/TGN5YiNI3XbZIniN+wW8VoSKjWXx
         m2hyLJQ5d9VaT1NuhbF4yqiW/6n3asWImY6H29Vnz+No2WjhF6VQ55yTJOx7AMC1kB
         yYMko1Yff6IGL5u0znKOBgBb3S8TsAnrvGUtLi/B+rjR6KN0NM5Jd8X6FUOu8mdf5v
         bW87CoOhidq++HYU74/2ZHDuPzg9SyQ2Ju6QQrvLPk+o48dk/h3k+lpBYBjPEQaZOb
         vTqBFa2nzyg1/MOQtgWMWOxtgf2PdF8OqzgphGQwV1UBl+aLjaUXuaezXA2EvKGJGC
         cGr6litCvqOgA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        vladimir.zapolskiy@linaro.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add description of camera control interfaces
Date:   Mon, 17 Oct 2022 22:15:19 -0500
Message-Id: <166606235849.3553294.16450198748790933203.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901073504.3077363-1-vladimir.zapolskiy@linaro.org>
References: <20220901073504.3077363-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 1 Sep 2022 10:35:04 +0300, Vladimir Zapolskiy wrote:
> Add description of two CCI controllers found on QCOM SM8450.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450: Add description of camera control interfaces
      commit: b318c53e9c383b26d7972175e8ca60dc3552b4d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
