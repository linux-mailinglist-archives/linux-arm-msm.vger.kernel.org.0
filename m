Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B484B2F6E51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 23:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730577AbhANWiM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 17:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730575AbhANWiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 17:38:11 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678B0C061575;
        Thu, 14 Jan 2021 14:37:31 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id r9so14486238ioo.7;
        Thu, 14 Jan 2021 14:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4qLi4Dg+g0R8VVN/tPzeo2VYp9du8E2CQ9jumM2kylY=;
        b=NtqJtobesGpygwwHl27SLj7KgMDYD0qtl1D5q8Nmm2wV3x8Ucca6+xgsshGaup/SNQ
         aG7ZxHs8AK37B2SX+ZKtWjTaZ2ux9jKIqo9UglY86v5u+ormp/fjckWHn5fOcKUjCrkG
         oWPEGNe4ggbEXV/MkouOsZh1nd/WLTAF++ifhve+NaZ2GJOs3pK46HhbxhRVkI8UuDzc
         gF4PrmfODCHNmGOeFfz0+vyAefyKXE8wCk6gbspznmeD3IQYi+0TuooHr+Oj82jacfLP
         OkmYREy+giTCsaJWXiZJtexkPbmi4+vmy0Jro9BFH9Xoe5i2nlpqMUcotF0namByg8wN
         UQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4qLi4Dg+g0R8VVN/tPzeo2VYp9du8E2CQ9jumM2kylY=;
        b=FrL2uWqOPCPXfunY2RgJR/HfTqByuW/HZjPbX0UtAGJYuQsR47hU9ORXyNugW0u8tK
         k/pwgS/s/KOulnwSUy3VQOz8wtyN5OzztbjIEriYQJSFNfNm0wWwkV90G7XxFixCekEt
         ZS3eDCZCCK2Si8vU9aDNjhdBzY80ezQHIzXuNRDqntNWq9BMLMt3WKEplVsDEJ/wEQJN
         xwK8wBdbCuRG3B8TUuONwtYbKHxoZJcdeQllreaI+TQh5ofJ/2n/4nrh9reUWD1WQnFz
         xpchhM0vLJ5wns7lSZpt8Ygaa9LwL9ht22SUmLErc8nFwV6Q/IshS+g67Ib38Tvfh1Xe
         5uCw==
X-Gm-Message-State: AOAM531ddyKlytlKFexXygPcqDlXwE+bHlAmTK0PahSLAHWG293xCGVy
        5jhDVxByAkms27xvE09nvANhjxoHiSBVvmkHgzT6bt/VZrw=
X-Google-Smtp-Source: ABdhPJxAE3niWU3lMdhyD6iZZ//AvuDx07evfAw+VuR6wmjklOvnVeCLdNX4LfeC8wYdvKKrdETMSGGhrNGKnwhmnFU=
X-Received: by 2002:a05:6e02:1b8b:: with SMTP id h11mr8628774ili.32.1610663850911;
 Thu, 14 Jan 2021 14:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 14 Jan 2021 15:37:20 -0700
Message-ID: <CAOCk7NoVts21FjhhLtZp-0Xdw6-BnrKio_-tuZBRsgapsUdwfw@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 14, 2021 at 3:13 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> The GPU IOMMU depends on this clock and the hypervisor will crash
> the SoC if this clock gets disabled because the secure contexts
> that have been set on this IOMMU by the bootloader will become
> unaccessible (or they get reset).
> Mark this clock as critical to avoid this issue when the Adreno
> GPU is enabled.
>

You should go review the last attempt to do this -
https://lkml.org/lkml/2019/12/17/881
