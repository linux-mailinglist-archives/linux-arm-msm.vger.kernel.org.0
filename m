Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22ADD1D320A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgENOC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726037AbgENOC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:02:29 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B903EC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:02:28 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id h16so2473003eds.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0a3V5jmjGRHrvpegmiJsNOOrUHQvBZ4nobS3syH2lOg=;
        b=P+r2tTRptAL94be2yJTghePE0UJFO9u4RqWWaZMVBsVTzVVkYrNPXKen7lsvqC9Mzf
         Ue/6/LRS5fi7NdgkTRXVNZ+JbVsl3J88TNiGRvMkw7JLM56MjQEzg70P0UU1Er5VkbMD
         y1GUnu8+PHoCbpXVijZQ+V2ey9ktwjzIhuB8pe79eA9bd5szcqg8M3C0HePU/HXD8sFt
         QdV3CVt87uRc7xYf8Dzh3Th9sxDXKCcDjlgr1jj2aG/ezrrFWY8wI/pXhzGNN/jdDF/w
         XJWLcPKZ82dFYkmEPVD2zTewvyn1bpsQbXWEiYs5EB9/zSE/ZJql0lShnSfFdRPMNfqr
         N0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0a3V5jmjGRHrvpegmiJsNOOrUHQvBZ4nobS3syH2lOg=;
        b=A12yw/JE1j+dq1RvFo7Vr2cbS1iL3Hi1pAyaTrmrdJgn5mU+tV/lUc+adQNQqBIDQF
         zIwz1VzPcm/EVdCb3G03njGy2ccCNVJ8qjPeVebMozgn1ZmN6ypYweQC5Y5FMiI4/3u4
         A90APOCWd4lIK9fiCVQAAFSyzFIU/MtZWTdq7QeOLT4Mkm6jarFkXXmDutIP5vHZib8Z
         p/4RhgRUCUeMRTMngAiZ+JjYfnIHb5fz+rCGZL9Y6qUKs/FdgU00LcG73vWukGaZFcI2
         /eGmAgJUBVyWaRx9NvlzkjgAF4joZC2BDUt2AYEaxzWl2y8yjpIhp65HBVyN8+y3Wt54
         kNDA==
X-Gm-Message-State: AOAM533GQyr/neNb1cUeyZ260AYrqvfXHFCD7yIr2rmxTZgQ7zRWI3UU
        UmyTSVxP0SBdhJYzAliY3oYCSkr/Pkv1JoO6KWR3pg==
X-Google-Smtp-Source: ABdhPJzxROIVBbrJVN5njvqUZ2G2Yhy2TLpAVfDIwqO1jLUGiQyvUC1NixURN8sEFAx1heyOQhXZ6MaaOmTNaWgkTnw=
X-Received: by 2002:aa7:c6d5:: with SMTP id b21mr3900715eds.97.1589464947048;
 Thu, 14 May 2020 07:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200429052932.GA2627045@builder.lan>
In-Reply-To: <20200429052932.GA2627045@builder.lan>
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Thu, 14 May 2020 07:00:48 -0700
Message-ID: <CAOCOHw4GmTYiXrd3z9B-YHq3wcwLYXg4y=nkJWhLCDw9G08KqQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT fixes for v5.7
To:     arm-soc <arm@kernel.org>, soc@kernel.org
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LAKML <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Arnd, Olof?

On Tue, Apr 28, 2020 at 10:28 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
>
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.7
>
> for you to fetch changes up to 7710f80ecd9c74544a22557ab581cf603e713f51:
>
>   arm64: dts: qcom: db820c: fix audio configuration (2020-04-22 19:26:14 -0700)
>
> ----------------------------------------------------------------
> Qualcomm ARM64 DT fixes for v5.7
>
> This reduces the (hard coded) CPU voltage to a safe level on MSM8996 and
> updates the audio nodes on db820c, db845c and c630 to reflect audio
> changes that landed late in the cycle.
>
> ----------------------------------------------------------------
> Bjorn Andersson (1):
>       arm64: dts: qcom: msm8996: Reduce vdd_apc voltage
>
> Srinivas Kandagatla (3):
>       arm64: qcom: c630: fix asm dai setup
>       arm64: dts: qcom: db845c: fix asm dai setup
>       arm64: dts: qcom: db820c: fix audio configuration
>
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 23 +++++++++++++++++++---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              |  2 ++
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  3 ---
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  2 --
>  4 files changed, 22 insertions(+), 8 deletions(-)
