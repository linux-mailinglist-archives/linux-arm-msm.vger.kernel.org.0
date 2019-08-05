Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A2381261
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 08:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfHEGgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 02:36:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34534 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfHEGgE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 02:36:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A7DDB609EF; Mon,  5 Aug 2019 06:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564986962;
        bh=YC2f6yFf1lfzAzxrNyThP9hnT7M2waYwm0V2lbnwG+k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AqaQUUtyzRJgU+mTAS/0v+OHG88X7PTtqPDVvQX74crxwzwLDiWtawHJCPUpsalvS
         tkoCMEESi5pTQTpHz5zRoNCifc6Y5GOCf/PioxydkmlKoBzGmI4cqZ4zFqwAnUeza7
         1TIX+SIDbai1nLP15CP1HdUlUSM6N/5vcdBnG8Lo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 13F4C607F4;
        Mon,  5 Aug 2019 06:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564986962;
        bh=YC2f6yFf1lfzAzxrNyThP9hnT7M2waYwm0V2lbnwG+k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AqaQUUtyzRJgU+mTAS/0v+OHG88X7PTtqPDVvQX74crxwzwLDiWtawHJCPUpsalvS
         tkoCMEESi5pTQTpHz5zRoNCifc6Y5GOCf/PioxydkmlKoBzGmI4cqZ4zFqwAnUeza7
         1TIX+SIDbai1nLP15CP1HdUlUSM6N/5vcdBnG8Lo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13F4C607F4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f45.google.com with SMTP id i11so14099639edq.0;
        Sun, 04 Aug 2019 23:36:01 -0700 (PDT)
X-Gm-Message-State: APjAAAXHGSuaYr/ZnvFmgP/lPaCZoFdm5xtdqk4ycNQPUucRr0H0SzOs
        PPc+OyL1+dNYoJc8Yj6rPY9pALkuWkVLL2/uQGA=
X-Google-Smtp-Source: APXvYqzPksVYGcY/a/wzEqdo2nZvczPNPjOJlXU65BxpS+6SbY8+DTD0LVavKq6NF48znuF0Z+//UbXWxAdeCA0WcIo=
X-Received: by 2002:a17:906:7013:: with SMTP id n19mr116074017ejj.65.1564986960796;
 Sun, 04 Aug 2019 23:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190710112924.17724-1-vivek.gautam@codeaurora.org>
In-Reply-To: <20190710112924.17724-1-vivek.gautam@codeaurora.org>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Mon, 5 Aug 2019 12:05:49 +0530
X-Gmail-Original-Message-ID: <CAFp+6iGF50aoGUumGFPuNTDsV-F5c1y_qSvqqcLuzapRzH7HVA@mail.gmail.com>
Message-ID: <CAFp+6iGF50aoGUumGFPuNTDsV-F5c1y_qSvqqcLuzapRzH7HVA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: sdm845: Add device node for Last level
 cache controller
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "robh+dt" <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Wed, Jul 10, 2019 at 5:09 PM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
>
> From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>
> Last level cache (aka. system cache) controller provides control
> over the last level cache present on SDM845. This cache lies after
> the memory noc, right before the DDR.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 4babff5f19b5..314241a99290 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1275,6 +1275,13 @@
>                         };
>                 };
>
> +               cache-controller@1100000 {
> +                       compatible = "qcom,sdm845-llcc";
> +                       reg = <0 0x1100000 0 0x200000>, <0 0x1300000 0 0x50000>;
> +                       reg-names = "llcc_base", "llcc_broadcast_base";
> +                       interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
> +               };

Gentle ping. Are you planning to pick this?

Thanks
Vivek
[snip]

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
