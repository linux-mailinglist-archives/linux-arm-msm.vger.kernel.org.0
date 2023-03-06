Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F816AC0DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 14:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjCFN2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 08:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjCFN2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 08:28:16 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98C9A5CC
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 05:28:14 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id o6so9065669vsq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678109294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j35GhvY7E7mzlkVrpReZp4vmk4NhI+cSNe2C9lnbMoM=;
        b=Cp7BGW2N/LitFxqVU0zIZGZILOHZKB5Hvtr9iEjBuWniKsqU1k02YRbolBhvP7HDQE
         vs5qjVYboTS6hRewp+GpDsbFnjRJ9jobZGRo/yVj3spASRMY0GKBKayHcvFYtX/JceVv
         4PS5emrLyPMC5w3TOFoJreAcdbY4izRJg3OnoMb9uzXp1TnKANHVSydfPEN8cQbqI+Yr
         +5UIItPm1lXasKejcowYm6yRQ6ReQapZEjFhEpHVuPxoQyZwzNZJzr9OxlFR32FaozlP
         x0xbQcO0TxBT8qmhhqFr1Q2ohLXWKsWOxlZkRuBU3RunlIdeu7xSBhiFnxe0OtTwU+8E
         4bVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678109294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j35GhvY7E7mzlkVrpReZp4vmk4NhI+cSNe2C9lnbMoM=;
        b=pEfVTpanIX16tb4Kvb6eA4RFZxjwKx5TZ0RdYZ1NW5bIUN+rIv9G4yjqv2uVD/0b2k
         qQxjyu3fGzRDT8p7eBwPZ7FqxsFSI0tSKulvn8ATEyAeFRxK6pPBxVs+O5XpSS/C04Wp
         Hx0Bvt2mZD7RVze5uxg/uq4WiOS66N7OzulC6BIaZgBxWSZnCH6v2Eqiog/DwynHFOJ9
         ZTR4KSEdeWbuiPJmnjqQrg9CljdIfYJCLaAQKrXMVjdLUCetgsoaqiOohmxdlJQK2DTA
         p37UWXO/GMx3/6FLviEfHYwaVf6L1D9zDCaFfg09BVc3maI7QhRMIg1zfgtnBnluMWY5
         fdTg==
X-Gm-Message-State: AO0yUKWACjYt91h0nskFDqQCY9Uu1VsbRMWdCDkMiVFSoB/T2/sTG/fD
        8ticNkZjUM/y+gjqIk/W+QjWQqKWpZQUYpGMDCe37w==
X-Google-Smtp-Source: AK7set8kNbHwEPOA1Fk3J4jAhX7ozG8BFymribiYfNd6DXqK9NHPT2EhYPXCEenbaKo/fN1CQBSrkfPcKfIiS92DHQ4=
X-Received: by 2002:a67:7305:0:b0:411:c666:583b with SMTP id
 o5-20020a677305000000b00411c666583bmr7328571vsc.5.1678109293921; Mon, 06 Mar
 2023 05:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20230216125257.112300-1-brgl@bgdev.pl>
In-Reply-To: <20230216125257.112300-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 14:28:03 +0100
Message-ID: <CAMRc=MeBCuJ6eiAVXmHkpHz6KsogdcaPym5nabncmebpJR75FA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] arm64: dts: qcom: sa8775p-ride: enable relevant
 QUPv3 IPs
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 16, 2023 at 1:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This enables the QUPv3 interfaces that are exposed on the sa8775p-ride
> board: I2C, SPI and the Bluetooth and GNSS UART ports.
>
> v2 -> v3:
> - fix the interrupt number for uart12
> - replace underscores with hyphens in DT node names (although make dtbs_c=
heck
>   does not raise warnings about this)
> - rearrange the commits so that they're more fine-grained with separate
>   patches for adding nodes to dtsi and enabling them for the board
>
> v1 -> v2:
> - uart17 is the Bluetooth port, not GNSS
> - add uart12 for GNSS too in that case
>
> Bartosz Golaszewski (9):
>   arm64: dts: qcom: sa8775p: add the QUPv3 #2 node
>   arm64: dts: qcom: sa8775p-ride: enable QUPv3 #2
>   arm64: dts: qcom: sa8775p: add the i2c18 node
>   arm64: dts: qcom: sa8775p-ride: enable i2c18
>   arm64: dts: qcom: sa8775p: add the spi16 node
>   arm64: dts: qcom: sa8775p-ride: enable the SPI node
>   arm64: dts: qcom: sa8775p: add high-speed UART nodes
>   arm64: dts: qcom: sa8775p-ride: enable the GNSS UART port
>   arm64: dts: qcom: sa8775p-ride: enable the BT UART port
>
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 100 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi     |  86 +++++++++++++++++++
>  2 files changed, 186 insertions(+)
>
> --
> 2.37.2
>

Konrad, Krzysztof et al,

It's been over two weeks, could you please take a look and let me know
if this is good to go?

Thanks,
Bartosz
