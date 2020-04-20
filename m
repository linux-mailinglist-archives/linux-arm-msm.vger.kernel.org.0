Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6320B1B152B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 20:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgDTSyR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 14:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDTSyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 14:54:16 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B4DC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 11:54:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w145so8923039lff.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 11:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFwuNr0TgSQRNNXpMtC3V2slHHf02xlAMZDjaN+7RAc=;
        b=Qf/ecC7Lp+kohe1FrviknG4/IQqC/abCMx7cMJ8Qh/SH7PU6FDeUEAPzC0J/Du8RJZ
         L080nkD48kiih0pnK6PLPLWsJGLm6S1RVXu/dcSHWNi9AViGgBDdLNWUx/C05aivFcZa
         FUUpFkc0Q4n7UHOZTdTU+Tuts0aAXCfIAirO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFwuNr0TgSQRNNXpMtC3V2slHHf02xlAMZDjaN+7RAc=;
        b=Lh1PMIgaCWw1wSewZG3i1/D1NE3VR2APMD3+c6XAyvbsSJn50m1G53UUH8oI143cQm
         G6OpRV6g83qixbPAMCe+SQWSWBrHOXjpfmD/84l7xZ10OzH8F0yUIhg0C80NB4k8tpSH
         69wFQsuaCstKyD3OKr3T0/RB43YY7+J/qZn8TNdXTdKPLJXM6JgJKc8P7OwmsFzPzsrR
         hsqVDcf3vCpxqxa3Yd8np1I/SiCDVYyWzz9cvm91VFdfQopaIS6LTvkFRl2vHEtiOwm1
         UdEbV9iTukYhzLymw/Mg/iXPCU+YvHqt5wJOXB0zXH02eNpHLTJ4qnsv21aNg/1AXPn5
         aM5Q==
X-Gm-Message-State: AGi0PuY9yqy0hz/KaHwZPi9cP53Qmkv6VKAbfWv61WZErs7ti9yaOcUf
        r5xpOKtdB45G+oMD+8ETX5knFmPQ4gg=
X-Google-Smtp-Source: APiQypIbK0Sq70i4Cpg4oz3LmmIVGr/roVrzP1bi4SvrZXdKvety6H2CtsOX17jtmtk0SeOxRUQTPw==
X-Received: by 2002:a19:c602:: with SMTP id w2mr7694232lff.74.1587408854739;
        Mon, 20 Apr 2020 11:54:14 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id z23sm207361ljm.46.2020.04.20.11.54.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 11:54:13 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id f18so5215082lja.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 11:54:13 -0700 (PDT)
X-Received: by 2002:a2e:b0f5:: with SMTP id h21mr6912419ljl.3.1587408852757;
 Mon, 20 Apr 2020 11:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200415071619.6052-1-sibis@codeaurora.org> <20200415071619.6052-2-sibis@codeaurora.org>
In-Reply-To: <20200415071619.6052-2-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 20 Apr 2020 11:53:36 -0700
X-Gmail-Original-Message-ID: <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
Message-ID: <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Remove unused
 q6v5_da_to_va function
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 15, 2020 at 12:16 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
> dump function.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index b781fc8de3597..6a19e0e77236e 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -196,7 +196,6 @@ struct q6v5 {
>
>         phys_addr_t mpss_phys;
>         phys_addr_t mpss_reloc;
> -       void *mpss_region;

Hm, this doesn't build for me on our Chrome tree:

  CC [M]  drivers/remoteproc/qcom_q6v5_mss.o
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1118:16:
error: no member named 'mpss_region' in 'struct q6v5'
                ptr = qproc->mpss_region + offset;
                      ~~~~~  ^
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1520:9:
error: no member named 'mpss_region' in 'struct q6v5'
        qproc->mpss_region = devm_ioremap_wc(qproc->dev,
qproc->mpss_phys, qproc->mpss_size);
        ~~~~~  ^
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1521:14:
error: no member named 'mpss_region' in 'struct q6v5'
        if (!qproc->mpss_region) {
             ~~~~~  ^
