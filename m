Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9660C6AC0D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 14:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbjCFN1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 08:27:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjCFN1T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 08:27:19 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21782A6C4
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 05:27:18 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id l24so6391836uac.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 05:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678109238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uMYoG5gt/tHm6sieDe35y2+2ZMf8+X/ZXBI1Ip8XME=;
        b=lnJbZyBQ1pjxSzk8duyKbVS5VadOBX9vFp3NvssZYVP0FS8t8zWX9aoRZFXkhIbXAV
         HiCOZrmCdWQvVWBMHG4jkACPp+jDNfY/KYJD7g9rj3T+KdaiFinwynvt0NwuGESk3YlX
         lq9oZe0h1t4iNDne4vW+gNEAqAoqCcmS+JGVI6DmjCPCBXBKW5L3HC0qwtT2+SWLHSLM
         zQuvQDVCFPhm9nLCpc8UtWpw6UYY9dy6uTVKQdjhVYSoDYizPdGa8NsnsOfmKnyUFuKL
         0HGJYSyXKs1qzDMHAb1rONA3ezGdp9ObZeK9jOHgcOGKGI9UTWWga8WfQ6ywejtaGkZt
         jo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678109238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uMYoG5gt/tHm6sieDe35y2+2ZMf8+X/ZXBI1Ip8XME=;
        b=YbZvE0QVgXJMQJEldozUbr7up0+4f6jW9TNj46r2NrzKXwiP69NzS4aXAv+RMqVv0A
         WcYyCaCsIpOxibIBG3R7y5iDOFMc407u2iiGT4Sy6dCG8vRNg1VYm+UVjUKDKMYP88my
         Nrys1BnQ/Pw9xUMIqFSX2vOM9/2GBzlhizUp3+LojCUtoXsPpHPQV9nDa3qzHkLrlLQk
         m0jIrVZmucPDWis1nrYZaA3QXeT0b6ELK8xLAQkJfKeCgB40TNE5083d8unKpTGycc+R
         qodEejqccBY6B6xc14G5q0rXs16qoMwqc6gkPIEu0gQORE689AokAFtLhcmftd8PblAQ
         C/bg==
X-Gm-Message-State: AO0yUKV4oOSts1cqQ05Iybc/AF6uqQ2SVomptTMKu8IMoKqkgjDCcIcF
        cjSvWZPIhxN98VBpMqY8WHfrpAvmLFMyhO19loocYw==
X-Google-Smtp-Source: AK7set8HzRghz6cpJ32KM3ORISHaeVG+xP4GaClXIjSSAFyQ5RIZcxeMnW59LyZlNV+yTszpqKwb7mvve14Yal5IWQY=
X-Received: by 2002:ab0:4a12:0:b0:68a:8f33:9567 with SMTP id
 q18-20020ab04a12000000b0068a8f339567mr6537481uae.2.1678109237930; Mon, 06 Mar
 2023 05:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20230209095753.447347-1-brgl@bgdev.pl>
In-Reply-To: <20230209095753.447347-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 14:27:07 +0100
Message-ID: <CAMRc=MfAMF6OaCsKAKj6GqhX=Zift9dVDgtK80Djocawb5u3fA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm: qcom: sa8775p: add socinfo support
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 9, 2023 at 10:57=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This series adds support for qcom-socinfo for SA8775P SoCs.
>
> v1 -> v2:
> - fix ordering of socinfo defines
> - fix the commit subject line for patch 2/3
> - collect the Ack from Krzysztof
>
> Bartosz Golaszewski (3):
>   soc: qcom: smem: update max processor count
>   dt-bindings: arm: qcom: add the SoC ID for SA8775P
>   soc: qcom: socinfo: add support for SA8775P
>
>  drivers/soc/qcom/smem.c            | 2 +-
>  drivers/soc/qcom/socinfo.c         | 1 +
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> --
> 2.37.2
>

Bjorn,

Looks like this is ready to go, so gentle ping.

Bart
