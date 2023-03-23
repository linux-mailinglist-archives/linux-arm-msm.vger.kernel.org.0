Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93B336C72BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 23:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjCWWJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 18:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjCWWJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 18:09:00 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215EA12041
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 15:08:59 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-53d277c1834so419732837b3.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679609337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApAT3jYclJ6tuM4Ar5bjYfOiqAXLl2HW8ed0MpHOtvE=;
        b=m+DwhZDVXHVwX1qyHNU6dFSrO+1jD/zZCGm2dvuoW5IfwY9tr6P8LFAPbJ6Rxyt3Ok
         TMeMcfOV49NreKzQuP+//Bx0exsKnTczPf5DFinUDHfqyuLt57npsZT/GYgdtNGyqVSz
         t1ZQ7QUftT1/vUwsrJcIQ+zb7c/GXOwRAyfXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679609337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApAT3jYclJ6tuM4Ar5bjYfOiqAXLl2HW8ed0MpHOtvE=;
        b=VzHLknarFwgrJ1KjugTtLPW+iCeH5OeaWj3/iDcv0eN3jcVRS7Zf2Zb9Y5Fx5kkwQf
         MAju20YdF1mZcv8XG0Ucg696f+ryyQ7k2qVmaVcr3bsLsyWQTNDmTCq21KVN/sQ7+gwD
         qMhozWzKssk6ZmCkZoPlFUHnBJguvqpaOPYNiRs5t+LPu09+6lHwy9c3MMfLQO/88dRi
         eAC5QkdH8PptEir30NZq8rC7NmQ9OdO5MWkTK8kxTsIcvZ1HokgwRcx69f31mnjc0+gX
         31CfKlGpqCLhVUVm8czfqK3N8nMaSboTZCoEnGXXMbkrm1tuwCk//mt18WW6SiIYzAnF
         O/Ng==
X-Gm-Message-State: AAQBX9eZc+0RW8J47XVZowQ6RwdSpgBEHDFwm02YowJzui7qnDWRCz18
        cA5+AYjlEWO/PFfBn/OLUt+3eCJLaBsuVX348lM=
X-Google-Smtp-Source: AKy350ayUY+GDtBHTUgTVx4FXDE3XtR0NDmXJ4uaQ3qRMMBJZDb/NSN8CsmrR+ILhp0Ldk6CepyT7A==
X-Received: by 2002:a81:6dd7:0:b0:545:6368:45d4 with SMTP id i206-20020a816dd7000000b00545636845d4mr256697ywc.0.1679609337127;
        Thu, 23 Mar 2023 15:08:57 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id m1-20020a81ae01000000b00545a08184b2sm70160ywh.66.2023.03.23.15.08.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 15:08:56 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5456249756bso256277b3.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 15:08:56 -0700 (PDT)
X-Received: by 2002:a81:b387:0:b0:545:5f92:f7ee with SMTP id
 r129-20020a81b387000000b005455f92f7eemr53774ywh.2.1679609335803; Thu, 23 Mar
 2023 15:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230323220529eucas1p12e5e1bbe2a31fe775cd9e6244f9282ce@eucas1p1.samsung.com>
 <20230323220518.3247530-1-m.szyprowski@samsung.com>
In-Reply-To: <20230323220518.3247530-1-m.szyprowski@samsung.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 23 Mar 2023 15:08:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WfREMuL6Z-aseAWPKXqpkutPofrWGy4ySH-WgbTHC-fg@mail.gmail.com>
Message-ID: <CAD=FV=WfREMuL6Z-aseAWPKXqpkutPofrWGy4ySH-WgbTHC-fg@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 23, 2023 at 3:05=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Restore synchronous probing for 'qcom,pm8150-rpmh-regulators' because
> otherwise the UFSHC device is not properly initialized on QRB5165-RB5
> board.
>
> Fixes: ed6962cc3e05 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for driver=
s between 4.14 and 4.19")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I don't object to this patch landing temporarily, but can you provide
any more details, please? On Qualcomm Chromebooks I'm not seeing any
issues with RPMH regulators probing asynchronously, so I can only
assume that there's a bug in the UFSHC driver that's being tickled.

-Doug
