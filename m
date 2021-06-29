Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E3B3B74E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 17:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhF2PMU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 11:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234733AbhF2PMN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 11:12:13 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5D4C061787
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:09:45 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id e20so8477690ual.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eJWr50Fry6uqoXk5lAjjCSrJTgyONGyHsCCbDexeDq4=;
        b=DLvBDwVyXAlPrIUgIvyEic31ZBj6Sp22bOELuvFgTjEUBQqIw/Fa7ts6n75a1yLfkX
         KKZOYkym+HPzR+l9YXMji2RFwqC+Rh8KhZ+pf5RTk/x2ozy1BKRzB/fmY1SdaI5cdEMg
         gZaJeQL5d8VZCI70wvgMsHjvdqlRn8ThId20UKT+Ut+BTRH9MVaQrksnIT92QPGE9xag
         OwytA3lEzflmTH2j5mDWZIitGJ3l5oPLuWz1kBZgBFRIdPgbC8nciKO11f/MtOpKrs+e
         FdqlP/ZvPOlef6khjaqMXwwSlDhhu0YrsRFnnVV0KdYqcbBFkL7FKKXZh3pImMbzUEip
         sCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eJWr50Fry6uqoXk5lAjjCSrJTgyONGyHsCCbDexeDq4=;
        b=SG+sljVHIKxMS6nHCLf4HLVweXBoz6ubDo8FAxUKg1TxLm0DPfmpBiQH8aiM/NwnPG
         cLX3WMSZzADkHkzG7m+rt8r6/EHYjhIUi3EgvWCkAtzyMcvp77N1Wj6Kk8dCq2SjD27m
         W0kjcDK7nZwqUKuP4uraU1ghN+YXeoCTXC4cFzoteFxrBjFiHFwMfTcaefBoTxEpUhw4
         XRFlqwxxfHMiB5Kn/44k3vp3Y/C/GvHGII9gyEbj0qj/e9/JlYAt47UjmNE/C8cvnJxD
         mOoChGwvmKRcTamke9RoP1yEFKeamTVrveb55eA+39WOFlM8I7sUaZ+Mw2014l0nwcMB
         EBag==
X-Gm-Message-State: AOAM5301ls0bEsBqVRxvaLu3Kdao87E5HB5LeILKxDYt90dcoBYVZG72
        CZtqj3yPgPCIYymkHfKXSKRYemSrzOIIrsDNwpungg==
X-Google-Smtp-Source: ABdhPJwxY4PW9KTJxYlpxoGoFSVzhCv4CAjIidf+1e1lhepu3gpgu5ty1cMhJ26lN/c5Hd/vVTH2ib0gNLc0GhUbJQA=
X-Received: by 2002:ab0:3043:: with SMTP id x3mr27495431ual.15.1624979384489;
 Tue, 29 Jun 2021 08:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <1623835207-29462-1-git-send-email-sbhanu@codeaurora.org>
In-Reply-To: <1623835207-29462-1-git-send-email-sbhanu@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 29 Jun 2021 17:09:06 +0200
Message-ID: <CAPDyKFqzGxO4HyEhuVCa6NGxwtkO1sO+7X8GXjQgiOO3HENimw@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: mmc: sdhci-msm: Add compatible string for sc7280
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, okukatla@codeaurora.org,
        djakov@kernel.org, cang@codeaurora.org,
        Pradeep P V K <pragalla@codeaurora.org>,
        nitirawa@codeaurora.org, linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Jun 2021 at 11:20, Shaik Sajida Bhanu <sbhanu@codeaurora.org> wrote:
>
> Add sc7280 SoC specific compatible strings for qcom-sdhci controller.
>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>

Queued up for v5.15 (temporary on the devel branch), thanks!

Kind regards
Uffe


> ---
>
> Changes since V1:
>         - Modified commit subject line.
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 4c7fa6a..365c3fc 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -19,6 +19,7 @@ Required properties:
>                 "qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
>                 "qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
>                 "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> +               "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
>                 "qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
>                 "qcom,sdx55-sdhci", "qcom,sdhci-msm-v5";
>                 "qcom,sm8250-sdhci", "qcom,sdhci-msm-v5"
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
