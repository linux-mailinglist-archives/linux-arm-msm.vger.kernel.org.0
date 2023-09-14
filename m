Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724DC7A11E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 01:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjINXhx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 19:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjINXhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 19:37:53 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84CA1FE8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:37:48 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a21b6d105cso192338266b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694734666; x=1695339466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUQ7K1Uj3M2Ku8c5LZFJY/v14ESPAzqXsk3sQ7d9n6g=;
        b=NlPDxEu4vgoUUPb/PZgTe/yE4dJpWrVZo5Zud7HsaYLLMqDIqZCOlwkC7NUf0/LGOl
         CvH99b1NuCsTPaRvo/cmNR5gJTMvdMP3iMsLEwIke5297JsI3umIWgrhLEWh3CEOfaPy
         5NC2Du6w6iFRylTSrEUn5iAEqXYs9ErZuTreQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694734666; x=1695339466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUQ7K1Uj3M2Ku8c5LZFJY/v14ESPAzqXsk3sQ7d9n6g=;
        b=pu15OZEC4Zd21sFs5neco5gdjOOJQ8y8DNJDF3tNPDig+N669Cs3JRhqaBAVgsS9Ux
         RZq+oaPRN4ICiXl0b3a1RSGuIr8PpLqxNret7Z8aOkFWAo+M7scWJSabIPXrD4dgYLGx
         wqc9cHGJNMnll54Vd78tCFUdJRxYYR7EgKCyxk0X7Kw4WV8PhdACySoY+/KUFdiHml7a
         vm9i9xiS8EYJSjSsIfgBpR6/ekl9hvXWJHbHs2FcAxF1z6WmVsb4olNCt/s9UnkXyxm6
         tjWOjY8HL+4clSqfUX8WhvwNG2EAUW3oUZYIT+DGSZQlR9SCD8HvxryOglumlTpBPpxW
         Ak1g==
X-Gm-Message-State: AOJu0Yz9yS4xt2zObJKICFCtLMj+Q2pv/GD0ZCq0qqV0CFTMtFu80jiM
        itjMuDxYJs39epTv20Jfu6tAX/cwpHX7u/1K7Kbq2w==
X-Google-Smtp-Source: AGHT+IG5G4swdQVqyJ+uCYHHBdM5yzpqZZdufybflD+34napO/97DaexOPvY4nXZ7Ehn0FdfOGH3jw==
X-Received: by 2002:a17:906:10cd:b0:9a1:ea01:35b1 with SMTP id v13-20020a17090610cd00b009a1ea0135b1mr2554ejv.62.1694734665812;
        Thu, 14 Sep 2023 16:37:45 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id dx9-20020a170906a84900b009ad7fc17b2asm1606559ejb.224.2023.09.14.16.37.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 16:37:45 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4009fdc224dso15185e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 16:37:45 -0700 (PDT)
X-Received: by 2002:a05:600c:6027:b0:3fe:eb42:7ec with SMTP id
 az39-20020a05600c602700b003feeb4207ecmr35638wmb.1.1694734664702; Thu, 14 Sep
 2023 16:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230816112143.1.I7227efd47e0dc42b6ff243bd22aa1a3e01923220@changeid>
In-Reply-To: <20230816112143.1.I7227efd47e0dc42b6ff243bd22aa1a3e01923220@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Sep 2023 16:37:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4jmFcZRP0HoyOFbsBwahvsC8xiTkgQX6FhisVw8ubNg@mail.gmail.com>
Message-ID: <CAD=FV=U4jmFcZRP0HoyOFbsBwahvsC8xiTkgQX6FhisVw8ubNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Move trogdor rt5682s bits
 to a fragment
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Wed, Aug 16, 2023 at 11:23=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> Several trogdor boards have moved from the older rt5862i to the newer
> rt5862s, at least on newer revisions of boards. Let's get rid of the
> dts duplication across boards and promote this to a fragment.
>
> Note: The old boards used to override the "compatible" in the "sound"
> node with the exact same thing that was in "sc7180-trogdor.dtsi"
> ("google,sc7180-trogdor"). I got rid of that.
>
> This is validated to produce the same result when taking the dtbs
> generated by the kernel build and then doing:
>
>   for dtb in *trogdor*.dtb; do
>     dtc -I dtb -O dts $dtb -o out/$dtb.dts;
>   done
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  .../boot/dts/qcom/sc7180-trogdor-kingoftown.dts | 13 +------------
>  .../dts/qcom/sc7180-trogdor-pazquel360.dtsi     | 13 +------------
>  .../dts/qcom/sc7180-trogdor-rt5682s-sku.dtsi    | 17 +++++++++++++++++
>  ...180-trogdor-wormdingler-rev1-boe-rt5682s.dts | 13 +------------
>  ...180-trogdor-wormdingler-rev1-inx-rt5682s.dts | 13 +------------
>  5 files changed, 21 insertions(+), 48 deletions(-)

If you agree, it would be a wonderful time to land this patch now.
Please let me know if there is anything outstanding you want me to
change.

NOTE: if it were me, I'd land _just_ patch #1 in this series (AKA
${SUBJECT} patch) and skip patch #2. I don't mattery a ton either way,
but it seemed like Konrad agreed with me that the benefits of patch #2
were questionable and, unless someone loves it, I vote for less churn
instead of more churn. :-P

-Doug
