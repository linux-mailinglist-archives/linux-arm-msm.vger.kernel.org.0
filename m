Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4DC395961
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 13:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbhEaLDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 07:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhEaLDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 07:03:54 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192CFC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 04:02:14 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id k5so6412833pjj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QsELI27GjNc4NgcPcTg5v1GNDYXdqqvGuLPnw7Bko8A=;
        b=tUtBmNg2kSJt9L9AgAc5YafyHRJUCsdA7sWm1cN27mwyiXxIy+/zdfOvZeFEsPGFaA
         7x5tcvIBtBHn3JABLuLySnMmVwIU+eSmJMnZEA0I03NdAGLxmmi86Tb1dRKXEXom7NZs
         k8Qq5WmzETj4Yl+OFm7/+NngJLmkGS/iy2nNJ9TxkrA4m88bb56pUUyllpcrIcw5157d
         3gLJNz3g1ToUAyctQkDH3pGdnah3E2J6DosXYsITP/EIve7absVPa2WuFQDD8Tn5qTE5
         6l4kJVoQfN7mm+IQEvrddiu9U0f7xuzGsTY90gbI3yylxXntsBKLrPNXRJbFSTeO3aqS
         6P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QsELI27GjNc4NgcPcTg5v1GNDYXdqqvGuLPnw7Bko8A=;
        b=p/36yitVsbVqsgG1XnTruk+WdTcpcNXASrr98PzEc64qMIHHz0sS8GHJsvtSiX+7v1
         QODCqiS7ZaasiyppgJVVcgz+IiQAuQet6b1Jqq8V5YeGAovFjWkXFppGjYht8CVSuc61
         cEtfFe2A/hnvQeLhBc/Wx0OLPkQDSX3/upWVIUH1TAjvXuEM1Qu2xnuRQi6+RZ6g3BmJ
         XVxgFPZnJwWOVi37TrMXlWwA3YoUZSYzE4J3nWZl+fM9tzxSFoCICyrQeEKZap0pmao+
         LGY33yTQdwyeWPBkzugJgJPdFKgdDEwfbD17HYVhuIoqmdN9NZIJH/nPKU0VefQPxZhj
         bFDg==
X-Gm-Message-State: AOAM532BiIdrv9A2WhAeckzu6RTZh2Q5xjOc5JSHT9Onk+LXeB1hL5ux
        mxtIA1HYqx9wsF41tBhVF6ZiV25/xN4Ifcv1RIM7IQ==
X-Google-Smtp-Source: ABdhPJxdoulYKZIj6Zk1rtX5m5VjRTJF0CKo8ZLK6tIQvW1A82V/meISoXXpGRipbegu/yGpUke2FP0x6fjQnw85GAs=
X-Received: by 2002:a17:90a:43a6:: with SMTP id r35mr10476573pjg.222.1622458933671;
 Mon, 31 May 2021 04:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-11-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-11-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 31 May 2021 13:02:02 +0200
Message-ID: <CAG3jFysr7O7PrPOk0FjkL+1RsgZn0-xLmEoXyuoetLyiqFJD6A@mail.gmail.com>
Subject: Re: [PATCH 10/17] media: camss: remove vdda-csiN from sdm845 resources
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> This isn't used and only works because devm_regulator_get() returns a dummy
> regulator.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ef100d5f7763..c08d6d6f6f90 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -542,7 +542,7 @@ static const struct resources csiphy_res_845[] = {
>  static const struct resources csid_res_845[] = {
>         /* CSID0 */
>         {
> -               .regulator = { "vdda-csi0" },
> +               .regulator = { NULL },
>                 .clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>                                 "soc_ahb", "vfe0", "vfe0_src",
>                                 "vfe0_cphy_rx", "csi0",
> @@ -562,7 +562,7 @@ static const struct resources csid_res_845[] = {
>
>         /* CSID1 */
>         {
> -               .regulator = { "vdda-csi1" },
> +               .regulator = { NULL },
>                 .clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>                                 "soc_ahb", "vfe1", "vfe1_src",
>                                 "vfe1_cphy_rx", "csi1",
> @@ -582,7 +582,7 @@ static const struct resources csid_res_845[] = {
>
>         /* CSID2 */
>         {
> -               .regulator = { "vdda-csi2" },
> +               .regulator = { NULL },
>                 .clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>                                 "soc_ahb", "vfe_lite", "vfe_lite_src",
>                                 "vfe_lite_cphy_rx", "csi2",

Reviewed-by: Robert Foss <robert.foss@linaro.org>
