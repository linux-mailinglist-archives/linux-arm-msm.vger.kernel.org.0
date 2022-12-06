Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E50B2644B42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 19:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbiLFSU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 13:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiLFST6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 13:19:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592211EAD1
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 10:19:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E97BD6184A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 18:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59BAC433B5;
        Tue,  6 Dec 2022 18:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350796;
        bh=2zQohhxX4JOwnO/QkFWqaqSYVeDiiqQDgb3RcvMmyN8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F0sbnMopn/KxCLBfldfq2Hj343fX/q3jSktHsUyIKZfVdkvBdHupMI/a0mlRs6YP4
         MZlS3oCmmKJ5pXjjvFBa+4/DbRQrFSyBnl7jmbVRTkwOvXeoJBgS++kjlLHKPa2tCE
         8vRULq7g+PoxiOMdDH4zlfRSqgul7qiXIL/ZBqF4OqnsoJRnKmX3MsPhQ4zxZ3LhgE
         KJi/c0++uAhOEwAQNqyk2FWw+BLJjof5SmdKP9x/YFOqkONgQNPzFnGOSqi6gJLobR
         WflJAri2KANbZrPPLWT/j3f9ckyDnZ3+7bldDgQDmTftj7NTVMGonTlnkxdwvnlPtL
         6jZM3YUtzzjPw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org
Cc:     patches@linaro.org
Subject: Re: [PATCH 0/3] SM6375 / PDX225 [AC]DSP DTS
Date:   Tue,  6 Dec 2022 12:19:00 -0600
Message-Id: <167035076334.3155086.2455067637285342326.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221114105913.37044-1-konrad.dybcio@linaro.org>
References: <20221114105913.37044-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Nov 2022 11:59:10 +0100, Konrad Dybcio wrote:
> Add the required nodes for ADSP and CDSP on SM6375 (and by extension,
> PDX225).
> 
> Depends on:
> [1] https://lore.kernel.org/linux-arm-msm/20221114104222.36329-1-konrad.dybcio@linaro.org/T/#t
> [2] https://lore.kernel.org/linux-arm-msm/20221109170822.58281-2-konrad.dybcio@linaro.org/T/#u
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm6375: Add SMP2P for ADSP&CDSP
      commit: 6f86fe79da95bb5e2c48a8e384ec382ed3c9df42
[2/3] arm64: dts: qcom: sm6375: Add ADSP&CDSP
      commit: fe6fd26aeddf99885b43807a92a7e0d44398b7b5
[3/3] arm64: dts: qcom: sm6375-pdx225: Enable ADSP & CDSP
      commit: a2ad207c412ba2a5ae118d660789897d85d569e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
