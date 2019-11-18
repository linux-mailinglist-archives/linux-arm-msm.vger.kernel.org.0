Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD417100E8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 23:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfKRWEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 17:04:47 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:36856 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKRWEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 17:04:47 -0500
Received: by mail-il1-f193.google.com with SMTP id s75so17557484ilc.3;
        Mon, 18 Nov 2019 14:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KDsvR2sL7bSH7kZiX7UcdBRnHGb+awlt0qFDCAIcGxM=;
        b=HX45CgBlnJdAkHhOzZUD6Z/to8eGGgvuyxGUx6A+xKdKlMyK0+C3KgxBPNriOe6HJV
         OSeYPt3ij2N1sSGCJ0sQVrJxBSR5Fl8Ko6kR60HZJTm/aAS8bf79dLQJY+HbuCSClWAG
         9FNMSW9h5MYtbhb5KfSGqXD7ikVVct3I1kuP5ecUix1GVrAwQdQdVJErThZLvwRCwED5
         EAtykxqdp26QwHfIF/7W3Ed11FVNXi++x6JrXDK48eZf1/mSDL2Wit56H9k5t1sn/TpV
         zPYTFcTn13w9Sp8yPwahAAuGWScKyrMXBm6RYgc7FgHicQ4yjfBB23jG+T3tlgclXWjp
         dcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KDsvR2sL7bSH7kZiX7UcdBRnHGb+awlt0qFDCAIcGxM=;
        b=lrBh5iiCtn3rMkMpyx/slBJvMSmqEzH9LxwG8IinJQAPnT4MIygqonTPSPjwSnlbPQ
         T51Z+ffu2nmxk9zg7V9LR0OKkJRc9H0+qt7tCJDNhpnzR0WVVsc41eTSKuzkhmsUGh/H
         1/eB8BZgzV2EPGf8/ZRgy7lrd3WEDsOcat3RKHNiNKGuiMFcGVnQMNwXef9rD1NaUOzg
         AKe1KQSPhM1q2c/hgx3nd8ucHPWYavfu479IULXxhEDb5Al4RlDUsXYMzPqVVJVFJR1J
         HlsRjL5fs3ELKY+LFbCa8BD1/dq0n/vExutjL+x3PFabCAOO0taUoXnI1u2J9BkIcldN
         kfMA==
X-Gm-Message-State: APjAAAUm94hvxAh0BQWmoUVz58t62kTvNL0xeHfIZ9gA6LbYHhSKyfgf
        bu0obm+RXUMrxUwc4maOAS2Ur+S3xUvdch7odNE=
X-Google-Smtp-Source: APXvYqwghzyuYz+8hSjz6z09L1nyxU02x+KJAZe5bCF3MTaio6iWizMnhgXwT2UaPdV1jky+G4W1ErgVbCLhmQ/i+Zg=
X-Received: by 2002:a05:6e02:c91:: with SMTP id b17mr17595173ile.33.1574114686674;
 Mon, 18 Nov 2019 14:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20191118214250.14002-1-sibis@codeaurora.org> <0101016e807915dc-5f8701fd-5c4a-45a5-a9ee-9e4d8700a3fa-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e807915dc-5f8701fd-5c4a-45a5-a9ee-9e4d8700a3fa-000000@us-west-2.amazonses.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 18 Nov 2019 15:04:35 -0700
Message-ID: <CAOCk7NogQY3Vjo+cL5_0anVO=K1LfTqG69b8AGi9HQsTMEsCug@mail.gmail.com>
Subject: Re: [PATCH 13/16] arm64: dts: qcom: msm8998: Update reserved memory map
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mark Rutland <mark.rutland@arm.com>, p.zabel@pengutronix.de,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 18, 2019 at 2:45 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Update existing and add missing regions to the reserved memory map, as
> described in version 7.1
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 62 ++++++++++++++++++++++++---
>  1 file changed, 55 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index fc7838ea9a010..707673e3cf28a 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -28,8 +28,13 @@
>                 #size-cells = <2>;
>                 ranges;
>
> -               memory@85800000 {
> -                       reg = <0x0 0x85800000 0x0 0x800000>;
> +               hyp_mem: memory@85800000 {
> +                       reg = <0x0 0x85800000 0x0 0x600000>;
> +                       no-map;
> +               };
> +
> +               xbl_mem: memory@85e00000 {

Are we ever going to use this label?

> +                       reg = <0x0 0x85e00000 0x0 0x100000>;
>                         no-map;
>                 };
>
> @@ -38,21 +43,64 @@
>                         no-map;
>                 };
>
> -               memory@86200000 {
> +               tz_mem: memory@86200000 {

Again, are we ever going to use this?

>                         reg = <0x0 0x86200000 0x0 0x2d00000>;
>                         no-map;
>                 };
>
> -               rmtfs {
> +               rmtfs_mem: memory@88f00000 {
>                         compatible = "qcom,rmtfs-mem";
> -
> -                       size = <0x0 0x200000>;
> -                       alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
> +                       reg = <0x0 0x88f00000 0x0 0x200000>;

This seems to overlap with a defined region in the memory map.
0x9fa00000 seems to be a better address.

>                         no-map;
>
>                         qcom,client-id = <1>;
>                         qcom,vmid = <15>;
>                 };
> +
> +               spss_mem: memory@8ab00000 {
> +                       reg = <0x0 0x8ab00000 0x0 0x700000>;
> +                       no-map;
> +               };
> +
> +               adsp_mem: memory@8b200000 {
> +                       reg = <0x0 0x8b200000 0x0 0x1a00000>;
> +                       no-map;
> +               };
> +
> +               mpss_mem: memory@8cc00000 {
> +                       reg = <0x0 0x8cc00000 0x0 0x7000000>;
> +                       no-map;
> +               };
> +
> +               venus_mem: memory@93c00000 {
> +                       reg = <0x0 0x93c00000 0x0 0x500000>;
> +                       no-map;
> +               };
> +
> +               mba_mem: memory@94100000 {
> +                       reg = <0x0 0x94100000 0x0 0x200000>;
> +                       no-map;
> +               };
> +
> +               slpi_mem: memory@94300000 {
> +                       reg = <0x0 0x94300000 0x0 0xf00000>;
> +                       no-map;
> +               };
> +
> +               ipa_fw_mem: memory@95200000 {
> +                       reg = <0x0 0x95200000 0x0 0x10000>;
> +                       no-map;
> +               };
> +
> +               ipa_gsi_mem: memory@95210000 {
> +                       reg = <0x0 0x95210000 0x0 0x5000>;
> +                       no-map;
> +               };
> +
> +               gpu_mem: memory@95215000 {
> +                       reg = <0x0 0x95215000 0x0 0x1000>;

This is the wrong size for the zap region.

> +                       no-map;
> +               };
>         };
>
>         clocks {
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
