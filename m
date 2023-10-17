Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A5B7CC1F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 13:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343613AbjJQLkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 07:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbjJQLkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 07:40:16 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5655DEA
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 04:40:14 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d9ad90e1038so5906382276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697542813; x=1698147613; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KXDyMdltPzLTsZkp8ftWuE4NIQhI/BZYDqBTjUXxHpg=;
        b=pRNhleR3aqv2gUp2ILsT0DWoTVxJ7f80X+IfEmYUuS1rHqYY2YBvG3gconO8idqzqe
         5UO0tUJMti7Xag10emIfznJTMfHXZ0OTmEegq3X9EHHgDqegBf+mpDG3lH3ZOvdS5TqB
         I6umH968YdhDjK3fSZVipZSauCSMGcRfVPaDhIKRNOou8nH7nZnKcsoiF7k5bQgjAWYP
         x3hBt0geZ+TZS0Vn3WtZxlhTNMtN50BoabwwgfkG/Oxe3VgxpSLi8fwafmewCOQ8a1AU
         GsHE6BMk28P7q3NUJDIqgg+/7d7p/ufVxlcn9SugBcB41al4M4o2impCCSF61KLuXmNn
         LHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697542813; x=1698147613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXDyMdltPzLTsZkp8ftWuE4NIQhI/BZYDqBTjUXxHpg=;
        b=mXWGzDk2lpONKR3QiHjXROSOv+pz+4VHsfoAC/3Crh3l/uLszKaNaCj8AQLFCYksrM
         T3EhnLjhGm8R5AV3mEVIcscHjxAo1gNZ4Vlnjfh/vNpJkqppnEQVLMke9spweo5CjIe1
         mITSByQ5nH+P7oVT3Yv1ibpW/whYqzRTHcuyHiJDsqLpTxqsEEjqWLSl4vnHrgnY+ea0
         wSBSr9mKP1HLxuk2UcM4vBLG9Qya+AK8a8YTG2B32SnsFNe2OaqdlxX193RaqnCmVv/F
         l+qob4sKFqfOWxOTEILIeVidikU+BBkZlDzgBLvOS602W/gabuhHT9B2lDG4cLUPbx0v
         w0nw==
X-Gm-Message-State: AOJu0YxGJL53On87ecwrKLIZRElij11JIEjO4QVw9fJtnxui1jfQuckC
        8LuSMRoozsQjE5FH28jE1ZiiPFjQarEvc6XpKSD1zQ==
X-Google-Smtp-Source: AGHT+IFED1xyGlNdLMZQbNUNCAPdsokCDKZpZ2zi02FKoDWhkno3Kz5zKfe5mf26mU7SR7ZYm6ok6EHAjVDTg6uMokg=
X-Received: by 2002:a25:7352:0:b0:d71:6b6e:1071 with SMTP id
 o79-20020a257352000000b00d716b6e1071mr1697738ybc.32.1697542813581; Tue, 17
 Oct 2023 04:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231017061336.9355-1-quic_sartgarg@quicinc.com>
In-Reply-To: <20231017061336.9355-1-quic_sartgarg@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 17 Oct 2023 13:39:37 +0200
Message-ID: <CAPDyKFrxf4wAyJ94g5LYymSZgDJRWvSCy6C73xyYBfxiV+L83g@mail.gmail.com>
Subject: Re: [PATCH V3 0/3] mmc: Add partial initialization support
To:     Sarthak Garg <quic_sartgarg@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com,
        kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 17 Oct 2023 at 08:13, Sarthak Garg <quic_sartgarg@quicinc.com> wrote:
>
> Add the ability to partially initialize the MMC device by
> using device sleep/awake sequence (CMD5).
> Device will be sent to sleep state during mmc runtime/system suspend
> and will be woken up during mmc runtime/system resume.
> By using this sequence the device doesn't need full initialization
> which gives 25% time reduction in system/runtime resume path.
> Also enable this feature along with mmc runtime PM for qualcomm
> controllers.
>
> Sarthak Garg (3):
>   mmc: core: Add partial initialization support
>   mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for Qualcomm controllers
>   mmc: sdhci-msm: Enable MMC_CAP2_SLEEP_AWAKE for Qualcomm controllers
>
>  drivers/mmc/core/mmc.c       | 163 +++++++++++++++++++++++++++++++++--
>  drivers/mmc/host/sdhci-msm.c |   2 +
>  include/linux/mmc/card.h     |   4 +
>  include/linux/mmc/host.h     |   2 +
>  4 files changed, 162 insertions(+), 9 deletions(-)

Would mind resending this version and while doing that, please add
some version information to each patch in the series. This helps while
reviewing.

Kind regards
Uffe
