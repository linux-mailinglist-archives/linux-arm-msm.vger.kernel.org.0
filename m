Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894D01E094E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 10:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389288AbgEYIs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 04:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388657AbgEYIs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 04:48:29 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8F7C05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 01:48:28 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id 14so5851938uaq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bQhRpovnI1HzxA3RnCUyYp1wNF/naeL/4Ai5nPC8gQ=;
        b=DbTArHGBvYzYTec6ziZjmrTFpe6aYhI+pcxRwpmCO6Or3WkyytcJTCORpEY6eEIrc1
         h70QUccD228mfZzZ9OnjeQ2HNHcEuVbiFNsKiUSlzfKjDlVmJyBp0ki4+rUaJwHalIhS
         SKxlEpmfGQqcpXvsA1+4RfbqWQvWfdVAnt5Wei23TyCZZpxCt2QODn5eXb8fp3KroBXD
         1Q4bJINZ2BQo/uJOdAnd59RoDWN8kH6XJomKUDJPUL/1tKy2RhkO05SrgwOYGbP6T7q5
         dvy2dL1+89m6+GRKLn7o+9G/Eb4MaRQ9gxmgu/WcbhcjBWohOIk+0HFZpyBih29UtqeR
         vP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bQhRpovnI1HzxA3RnCUyYp1wNF/naeL/4Ai5nPC8gQ=;
        b=NPhHt6hSYeszj2ziVR+5iCMlO+K4xBrdCogm/OerCbp8pCJJ9gYrt8+0/BVY7GHCxA
         LVzTz0y4ZO4/PqKznvYxHsz7HNv2nj5iBrs6TRdx/bVVTMgSJZ4d01xgN473AmfqjgWZ
         SKWadlOqohhGd4W/x7wwVWkG54TbxSvuLaapIJ8ULPAT7B0yKavgV27XC+bbDke85XFV
         Tp2RuM/IQEa8YSKbRmHsaY+mqIvjPXGlsmm/f4dOE+QjAUIGaKAfseRoNp7toN51eTM+
         i6xEO5o0Is76D5eKOSyfXaC7I8zpgP3GLo+fxWF9Wuzmj/mB8GAqoTXa6ZNKzlxMVQ1N
         UQMQ==
X-Gm-Message-State: AOAM530b2CBRulWXLEjpeGpcgvz4TnpwXw1EROql1mcvE3wX148iSTZD
        1zMVSW0Dh1ezjsTAG81cFsF5GHz76Q/ZV6nwAnFWoQ==
X-Google-Smtp-Source: ABdhPJzaBYQscuG49zQyyECCXDLU5ZXD2rJlN26+ZR+WzP067eVMWQEhmuDuBjc6B9HyjIvj4ta+JfMi5w0vDffFbGU=
X-Received: by 2002:a9f:3701:: with SMTP id z1mr8215995uad.100.1590396507967;
 Mon, 25 May 2020 01:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org> <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
In-Reply-To: <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 25 May 2020 10:47:51 +0200
Message-ID: <CAPDyKFqKZbmzpcFJxvD5R4qOc4cKghU7f2pffjFw86bnCN+vaA@mail.gmail.com>
Subject: Re: [PATCH V2 0/8] Board specific DLL configuration for qcom SDHC
To:     Sarthak Garg <sartgarg@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 May 2020 at 11:33, Sarthak Garg <sartgarg@codeaurora.org> wrote:
>
> Changes since V1:
>         -Splitting documentation change into two patches to
>                 avoid confusion
>         -For the rest of patches retaining Andrians Ack.
>
> Sarthak Garg (7):
>   dt-bindings: mmc: Add new compatible string for sm8250 target
>   dt-bindings: mmc: Add information for DLL register properties
>   mmc: sdhci-msm: Update dll_config_3 as per HSR
>   mmc: sdhci-msm: Update DDR_CONFIG as per device tree file
>   mmc: sdhci-msm: Read and use DLL Config property from device tree file
>   mmc: sdhci-msm: Introduce new ops to dump vendor specific registers
>   mmc: sdhci-msm: dump vendor specific registers during error
>
> Veerabhadrarao Badiganti (1):
>   mmc: host: sdhci-msm: Configure dll-user-control in dll init sequence
>
>  .../devicetree/bindings/mmc/sdhci-msm.txt          |  14 +++
>  drivers/mmc/host/sdhci-msm.c                       | 103 ++++++++++++++++++++-
>  drivers/mmc/host/sdhci.c                           |   3 +
>  drivers/mmc/host/sdhci.h                           |   1 +
>  4 files changed, 118 insertions(+), 3 deletions(-)
>
> --
> 2.7.4
>

Applied for next, thanks!

Kind regards
Uffe
