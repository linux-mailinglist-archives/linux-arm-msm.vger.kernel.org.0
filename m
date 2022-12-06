Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E74644B52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 19:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiLFSVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 13:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbiLFSUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 13:20:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0333728E2F
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 10:20:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BD0061849
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 18:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F40AC43149;
        Tue,  6 Dec 2022 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350801;
        bh=YWdQ4twb1NnBBVdfM7GjqtkqNVWa5FsmalcLw99RvuA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y7SRCNiuX5O+SL9pz3lRhatIBROqBEPwEvkvOgueLxV3l/Z+3zx9Bdn0QVi3WKlov
         S9Kt69ZZNoOPer7CyshB866Lc4v7rhwW61QO0GytHXiy/+Kicgl44k5bdxBdErFpQm
         AWD0qBwksXHo4WnceGslUvFMpZ1TTctoHN/SJ0JLCJf6Qhlme0F8X0Utaai+75pXSp
         5FQNxrCqhaq1ioD2f+Fz4ASIR0vddFqix7iOyzRpvHd+LUPsInztpZO1oKfYQMwim2
         1TviEWQvc3SkAGEbRfgIUZAnQmacSNP/ABV+SdqBQlGxjGBlEBiGyhYkV/dyURd7Hv
         LHl24602POhPQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org
Cc:     patches@linaro.org
Subject: Re: (subset) [PATCH v2 0/3] SM6375 / PDX225 SD Card support
Date:   Tue,  6 Dec 2022 12:19:05 -0600
Message-Id: <167035076320.3155086.13818190480693577685.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221109144153.53630-1-konrad.dybcio@linaro.org>
References: <20221109144153.53630-1-konrad.dybcio@linaro.org>
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

On Wed, 9 Nov 2022 15:41:50 +0100, Konrad Dybcio wrote:
> Add SDHC2 for SM6375 which effectively means SD Card support for
> PDX225. Nothing unusual here, some regulator dancing was required,
> but that's expected.
> 
> Depends on [1] and [2].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20221109111236.46003-1-konrad.dybcio@linaro.org/T/#t
> [2] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-2-konrad.dybcio@linaro.org/T/#u
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: sm6375: Add SDHCI2
      commit: 6f196ab2ad1e2b56c67cc247293ac2c5b73dbe90
[3/3] arm64: dts: qcom: sm6375-pdx225: Enable SD card slot
      commit: ecbdcbcd6f78fcf1c50e804b9baf065a36b61d26

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
