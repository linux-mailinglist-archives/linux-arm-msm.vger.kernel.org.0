Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3480E10EE1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 18:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbfLBRZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 12:25:12 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38198 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727460AbfLBRZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 12:25:12 -0500
Received: by mail-ed1-f66.google.com with SMTP id s10so70505edi.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 09:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J4O+42nj6WQtkwHnnTH5d0eFBz+C+RtcRMNzjQPHoew=;
        b=WbvO0vrU3iLgkCZOVFkeNk8+EtfxGKZIs2TOMVgcT4/Yr9RiY2FWk6c6p6wxZHUOgy
         frt6S/bZQZP28mR9gk4PKxqlOXrF+AIrkLaBds4UhQgDHLzGacs+nzAtjen0bvMJLUS2
         //2X5BADD9zdBDvLl4w9Hj5U3RyCoG4JfHXTJ9oTALx4blDCh/4MoJaFLMFvTbDMqrrA
         DjLgmQ8pT+LnGyxojhRh3ce2Pmcq+HQ71MfMqekwAuxM9/2FoVbzOqkINmJ0kwzwgCy2
         LJx/pH0Ea+uKIFLAVmBKz3Hdi2tcb7OQ6RDfdu1gWP4EZK2ZNyvWKTX509kc5lDFqFVU
         BhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J4O+42nj6WQtkwHnnTH5d0eFBz+C+RtcRMNzjQPHoew=;
        b=karKJH3yaCD2gi2TCtbV5MV0Tn2wwRQgDR/cjiLbvVQksJn+/eflzSuZIeOWdIe6po
         jp0RYr2StYmTbt3mRCVH+pCvTnBF0rRRgMaRJVLhBE03bv2CskhlRlUgEAU4C42Tli2g
         hZdcd1U9Yg0AkrBA3shlf55vxN0YjcJgUv9I61k0ZTZdG8DP80pd/Rggwa4nyEqaGozB
         ZNNoGblKbYPAiPf77R7+Gc5Ypk96QfctNCk81MRt6h9CvL4rXu5stSEYe4qjJ6jWtytX
         qSbOMiTBo6ffQlXfUfynR7oED7OSp9Y1fbuV0TibEOSjFzPfuOeF4nNvOzsFTrsPzyzz
         YNTw==
X-Gm-Message-State: APjAAAWB2LheWOwsgnAhadau+/oKBC03/Bzwe8Y0smgtymkpPzE1fq1B
        rEtQ0RImxWhnQw6pmviyLuk7pKG00YHCES/IntGTLA==
X-Google-Smtp-Source: APXvYqx5V6lcPZTuomJqSKHNoDS1xVBXbozw8XA0Yrx/or1UCBJOYYlgrxI+az9vy26AV3H/ghuLvYZ21BhR5JtOBxk=
X-Received: by 2002:a50:f313:: with SMTP id p19mr22833392edm.57.1575307510378;
 Mon, 02 Dec 2019 09:25:10 -0800 (PST)
MIME-Version: 1.0
References: <0101016eb61a0601-14bd7732-c07c-4674-899f-0e570c145195-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016eb61a0601-14bd7732-c07c-4674-899f-0e570c145195-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 2 Dec 2019 09:24:59 -0800
Message-ID: <CAF6AEGtMXOjZPG1_EwdwBGp7TOVrXwBKo6eG-ryT_-OhxrfQWg@mail.gmail.com>
Subject: Re: [PATCH] rnndb: Add GBIF registers for a6xx GPU
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 28, 2019 at 11:41 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> Add GBIF register definitions required to implement a618
> GPU revision
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

thanks, I've pushed the xml to envytools

BR,
-R

> ---
>  rnndb/adreno/a6xx.xml | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/rnndb/adreno/a6xx.xml b/rnndb/adreno/a6xx.xml
> index 747f071..2d2063a 100644
> --- a/rnndb/adreno/a6xx.xml
> +++ b/rnndb/adreno/a6xx.xml
> @@ -1748,6 +1748,32 @@ to upconvert to 32b float internally?
>         <reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1"/>
>         <reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2"/>
>
> +       <!-- GBIF registers -->
> +       <reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
> +       <reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>
> +       <reg32 offset="0x3c04" name="GBIF_QSB_SIDE1"/>
> +       <reg32 offset="0x3c05" name="GBIF_QSB_SIDE2"/>
> +       <reg32 offset="0x3c06" name="GBIF_QSB_SIDE3"/>
> +       <reg32 offset="0x3c45" name="GBIF_HALT"/>
> +       <reg32 offset="0x3c46" name="GBIF_HALT_ACK"/>
> +
> +       <reg32 offset="0x3cc0" name="GBIF_PERF_PWR_CNT_EN"/>
> +       <reg32 offset="0x3cc2" name="GBIF_PERF_CNT_SEL"/>
> +       <reg32 offset="0x3cc3" name="GBIF_PERF_PWR_CNT_SEL"/>
> +       <reg32 offset="0x3cc4" name="GBIF_PERF_CNT_LOW0"/>
> +       <reg32 offset="0x3cc5" name="GBIF_PERF_CNT_LOW1"/>
> +       <reg32 offset="0x3cc6" name="GBIF_PERF_CNT_LOW2"/>
> +       <reg32 offset="0x3cc7" name="GBIF_PERF_CNT_LOW3"/>
> +       <reg32 offset="0x3cc8" name="GBIF_PERF_CNT_HIGH0"/>
> +       <reg32 offset="0x3cc9" name="GBIF_PERF_CNT_HIGH1"/>
> +       <reg32 offset="0x3cca" name="GBIF_PERF_CNT_HIGH2"/>
> +       <reg32 offset="0x3ccb" name="GBIF_PERF_CNT_HIGH3"/>
> +       <reg32 offset="0x3ccc" name="GBIF_PWR_CNT_LOW0"/>
> +       <reg32 offset="0x3ccd" name="GBIF_PWR_CNT_LOW1"/>
> +       <reg32 offset="0x3cce" name="GBIF_PWR_CNT_LOW2"/>
> +       <reg32 offset="0x3ccf" name="GBIF_PWR_CNT_HIGH0"/>
> +       <reg32 offset="0x3cd0" name="GBIF_PWR_CNT_HIGH1"/>
> +       <reg32 offset="0x3cd1" name="GBIF_PWR_CNT_HIGH2"/>
>         <!-- move/rename these.. -->
>
>         <reg32 offset="0x88d4" name="RB_WINDOW_OFFSET2" type="adreno_reg_xy"/>
> --
> 1.9.1
>
