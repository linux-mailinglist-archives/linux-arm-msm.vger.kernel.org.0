Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA0C1563F34
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Jul 2022 11:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbiGBJO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 05:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbiGBJO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 05:14:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DC61CFC1
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 02:14:55 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y16so7514574lfb.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=NX2NmIaWgrskjfwPJH+7yMKeoSNDxO/zb36W7GTg75M=;
        b=pu2ix/i+k5uolnHDEBn6kZnkuLnF4NeaaM+ZpyppZrf7Zgd/85OD3FZigHNQ9dIB0o
         pmOmwF36aC6RcEfT1eKb/P6jZbozidunmpXoOy/ybTARrqqtl6OlWaXH2h5xvS9zpOE/
         7tkgMRKx+Fp+tZgpMecP8RQ24O/3lXm+YYsDgtcb7fLNfDIpZGJuzir7ZHG24tenoQ0U
         k6z8RfPP7eJutpyCX/LiSpDEgsgkzLVgHwYiqCMzdM2D7KKwDC42R8k9ld22UnrEXDDV
         Q2dkFUtIvt0lFSmxuBV4FkEWBAl6sJquJuRbvfiN0407Tj9L8DmHArsU5prG4AIk8fMy
         82Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=NX2NmIaWgrskjfwPJH+7yMKeoSNDxO/zb36W7GTg75M=;
        b=B2lkVjS/HXTDiv6tSdFfNms93wqeGe/Pzo+wy5SSNnYL4st7PYC1umihOHiov2KgWV
         OtvDYZge6ANOVfsK0cyRJzn1wzL2e06NK0opUQZ5B9kEgOprMik3v9Vo5ZcoAKkOWClW
         zr6R8uvZ7kH+ZbAcd3+8T/ckjJnbQLGMo32D1j2BIlpTkoOCfaDhj8c42W9CavWaxP49
         RV5Vt+zHbrNamKxQQKcmEHbfbstIX8AaF5ZZIGQMbX76O2IBDo/+KrWxIpqpQkogBDcq
         CuoF5W2X82on6wP/w+qjAvc7NPSAA8jJILXhyf0qk+zdufxrAO2KJtQEwZrYVMbeIX/h
         4AtQ==
X-Gm-Message-State: AJIora/fod9XSsL/fPEY2bb6OP0RryRD+l24Qs166Twov/WR0dDhMvEj
        zkNvYy9DHb2DhU+/47wdLaPfiA==
X-Google-Smtp-Source: AGRyM1u8086xoEnBAP3OVsJWQwmjG3MRrPwGtRAoyXEQ1eafmLxrh0cmKXcVLuR+5tkB7s3NQLJ4Pg==
X-Received: by 2002:a05:6512:3d86:b0:47f:9adc:cc27 with SMTP id k6-20020a0565123d8600b0047f9adccc27mr11622450lfv.608.1656753293613;
        Sat, 02 Jul 2022 02:14:53 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.203])
        by smtp.gmail.com with ESMTPSA id s6-20020ac25fa6000000b0047fbf4c8bdfsm3806073lfe.143.2022.07.02.02.14.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Jul 2022 02:14:53 -0700 (PDT)
Date:   Sat, 02 Jul 2022 12:14:48 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC:     linux-mmc <linux-mmc@vger.kernel.org>,
        Bhupesh Sharma <bhupesh.linux@gmail.com>,
        "Gross, Andy" <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/1=5D_dt-bindings=3A_mmc=3A_sd?= =?US-ASCII?Q?hci-msm=3A_Fix_issues_in_yaml_bindings?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAL_JsqLxXLFjre9h2dyoUJ=f0+pueUhSYezx_5bZ2SdpDt29xw@mail.gmail.com>
References: <20220514220116.1008254-1-bhupesh.sharma@linaro.org> <CAL_JsqLxXLFjre9h2dyoUJ=f0+pueUhSYezx_5bZ2SdpDt29xw@mail.gmail.com>
Message-ID: <D42FBBDC-A6BA-4374-A726-061A4478D4C7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2 July 2022 01:06:48 GMT+03:00, Rob Herring <robh@kernel=2Eorg> wrote:
>On Sat, May 14, 2022 at 4:01 PM Bhupesh Sharma
><bhupesh=2Esharma@linaro=2Eorg> wrote:
>>
>> Rob pointed some remaining issues in the sdhci-msm yaml
>> bindings (via [1])=2E
>>
>> Fix the same by first using the 'mmc-controller=2Eyaml' as
>> 'ref' and thereafter also fix the issues reported by
>> 'make dtbs_check' check=2E
>>
>> [1]=2E https://lore=2Ekernel=2Eorg/linux-arm-msm/YnLmNCwNfoqZln12@robh=
=2Eat=2Ekernel=2Eorg/
>>
>> Fixes: a45537723f4b ("dt-bindings: mmc: sdhci-msm: Convert bindings to =
yaml")
>> Cc: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>> Cc: Rob Herring <robh@kernel=2Eorg>
>> Cc: Ulf Hansson <ulf=2Ehansson@linaro=2Eorg>
>> Signed-off-by: Bhupesh Sharma <bhupesh=2Esharma@linaro=2Eorg>
>> ---
>> -> This patch uses the dts changes sent (here: https://lore=2Ekernel=2E=
org/linux-arm-msm/20220514215424=2E1007718-1-bhupesh=2Esharma@linaro=2Eorg/=
), for fixing the dtbs_check errors=2E
>> -> This patch is rebased on 'linux-next/master'
>>
>>  =2E=2E=2E/devicetree/bindings/mmc/sdhci-msm=2Eyaml    | 52 +++++++++++=
+++++---
>>  1 file changed, 44 insertions(+), 8 deletions(-)
>
>There's another issue with this applied:
>
>Documentation/devicetree/bindings/mmc/sdhci-msm=2Eexample=2Edtb:
>mmc@8804000: Unevaluated properties are not allowed
>('operating-points-v2' was unexpected)
>
>Should just need a 'operating-points-v2: true' line=2E
>
>This won't show up until a fix for 'unevaluatedProperties' handling is
>applied=2E But first I need all the issues fixed=2E

Could you please add a dt-validate (?) argument so that we can validate ne=
w schemas with unevaluatedProperties working as expected, while keeping def=
ault behaviour intact (while it gets sorted out)?


>
>Rob

--=20
With best wishes
Dmitry
