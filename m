Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061DA69789D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 10:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbjBOJGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 04:06:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbjBOJF6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 04:05:58 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827DD29E12
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 01:05:57 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id bx25so2017578uab.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 01:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OK/Q/phuym1TfWPA1EBQC/91tXucWH+AbkqODxHd+vc=;
        b=Ydmn7Xt5AYbZObMFlW/egeupY8qPMzmU1xlPaTedIdTaL5Ez0/yWJhFZIZ3aZXVvBg
         nrdrAeik9VNFA7h2ki1EPQFikgu49LxPMUrmcd9F3sk+RrseVz/RFPOZ+kBo7dNxht+x
         rDzU1+l1Utv8dlBbRI7I4zC/8valm/1auAciZ3SPUXpkbG4qqTC2zryrFlsI30ZyDoNb
         wwfQYAEcjhFIVA+gSJqxHHOAiXNw1CeHIVi+0x9ECY46y7uQgA+OE+de9whr1yFj55dx
         VDtys2BsD8LgZj4BWBOZZp5NWoxwPD7vM9EtdzOp1NkeWr8TEGQ6+9w9SkdQgovZef92
         GU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OK/Q/phuym1TfWPA1EBQC/91tXucWH+AbkqODxHd+vc=;
        b=wiBMJF4cEB7CDCwT8OmKdhf2LL5Foc+JrKyNY58NZpEcYCV1l8l1HSyKUvy4CNf7+w
         lhzP7zwm1+QduUvcRhl6FX4R+B59jqngbHsB1J6mXK0VWRgukTWB43R84b6T72/lQQ8L
         MohPyTN4IHm57BghXyDBGM0ClAx94wLZL/UQwEy2QnVw8nlYUXJzX/KCd4TyxHXXUYix
         FNt+USablv73q/j3/5daYl5nLB8PT2smNtY91O9qT4Up61KyiCCvit8TqIgwJ6FWCSRn
         YB26WXhxKnBuW9QLrjP2jYS8RgNTpSltXSBMgORKXjk3tjey2CKcdB9xbriy0DbOHba7
         exdg==
X-Gm-Message-State: AO0yUKXIlPNGWoy7K844ZT1oqDTXWYHNaQOTqG6+xPS8dc0ydVs7lAo3
        0UgYJA2V2OP1Gs64wyCuen6FAXUFSsgVhYJX5otiCA==
X-Google-Smtp-Source: AK7set/IPQ3wITuV5FFkFXqZdGFftAn+e/QA1ZQpZsxkd41HqT4E0+lCOoPrmpxpG6MkxmVXzPQcZEQxKrYNFzi4IsE=
X-Received: by 2002:ab0:654d:0:b0:68a:7054:58a6 with SMTP id
 x13-20020ab0654d000000b0068a705458a6mr184058uap.22.1676451956432; Wed, 15 Feb
 2023 01:05:56 -0800 (PST)
MIME-Version: 1.0
References: <20230214155715.451130-1-brgl@bgdev.pl> <602b1c64-db73-b6e3-020c-f2b24085a986@quicinc.com>
In-Reply-To: <602b1c64-db73-b6e3-020c-f2b24085a986@quicinc.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Feb 2023 10:05:45 +0100
Message-ID: <CAMRc=McUOSZiW8nRO-o32y0XL4i+LCF2Z380QX0uDgv2J=cuZA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sa8775p-ride: enable relevant QUPv3 IPs
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 15, 2023 at 8:06 AM Shazad Hussain
<quic_shazhuss@quicinc.com> wrote:
>
>
>
> On 2/14/2023 9:27 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This enables the QUPv3 interfaces that are exposed on the sa8775p-ride
> > board: I2C, SPI and the GNSS UART.
> >
> > Bartosz Golaszewski (3):
> >    arm64: dts: qcom: sa8775p: add the i2c node for sa8775p-ride
> >    arm64: dts: qcom: sa8775p: add the SPI node for sa8775p-ride
> >    arm64: dts: qcom: sa8775p: add the GNSS high-speed UART for
>
> Hi Bartosz,
> This instance is for BT HS UART , not for GNSS.
> For GNSS we have uart12 (0x00A94000).
>

Thanks, I'll rectify it in v2.

Bart
