Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB346C536B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 19:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjCVSPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 14:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCVSP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 14:15:29 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D407264A81
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:15:23 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id jl13so12715282qvb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679508921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6E9eFLmm6ygcs6kDLNjXTtbQ9rYQAmNSLK7F6Ytjeo=;
        b=m4vSWntEg2ZoxWKxicPTMF/nFx6Xjvf6X97Bazqxn+ZvOrc5xR/nWb1X0yaZXKjnAG
         fbDcYRx6sVzFha5lhgNSyKBQ+jajzSmtjTvh6kQ6Swo5pfAJJs+HBNw47kiOyXIEA0IQ
         XzkxVb/CU2WWreTMWYUUFA6lYn7AwooiD/Iq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679508921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6E9eFLmm6ygcs6kDLNjXTtbQ9rYQAmNSLK7F6Ytjeo=;
        b=Qxh4N1+nzwbKzWonqstY0Un4vxdEA8+D3xWJfF8fn6sEtcPbretjWOgmE3HL/k1VwN
         5K4P5b/VncsiIbEwv2Uyd+AScvmuJ2KdmJBE7EkCGKzewidO8c/Ax6Hgd91fnRksK4Hm
         gdg/WNgqK9DieUZ9t+WdPTUcSO1oOLjUjPqNkodGwyjLOUF0EmymyUAec2YX+YvEftqA
         5aStdxBedlA2GTNa4o/y4lt19DimrcljFXUbH1PhqKsJ/ZSt8ppsvVIc2OUvk8su6SVF
         E0rFpqoFi8dYWNEo1HUvkGdtpejdWBEsB9Z0QyN4scQptC974sw/TU3u9AR7FzUqVyRJ
         fDyQ==
X-Gm-Message-State: AO0yUKUtwGovXXJJvRtBE60VXnUy90YLTXvR4PZDvIOMkEYkygrZGUbT
        7QTBiWDP7eWCzjHb3iwK2saAw6fh5JQT6gUH3Q8=
X-Google-Smtp-Source: AK7set/EJHdLUHhgMhhszTbYIolmbnh9c6pYyt0MW0ipi6MM8aKUsy7D9KMnxBKAHDHLplr/cJuvsg==
X-Received: by 2002:ad4:5ca7:0:b0:557:a5c5:7e01 with SMTP id q7-20020ad45ca7000000b00557a5c57e01mr5051234qvh.25.1679508921396;
        Wed, 22 Mar 2023 11:15:21 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id a72-20020ae9e84b000000b00745a3b63569sm11734412qkg.107.2023.03.22.11.15.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:15:20 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id b18so3040120ybp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:15:20 -0700 (PDT)
X-Received: by 2002:a05:6902:124a:b0:b69:fab9:de60 with SMTP id
 t10-20020a056902124a00b00b69fab9de60mr540062ybu.0.1679508920292; Wed, 22 Mar
 2023 11:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230217155838.848403-1-krzysztof.kozlowski@linaro.org> <20230217155838.848403-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217155838.848403-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Mar 2023 11:15:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7-abQsE5s6Tbz9B22ZXT_yRFii55cUF2LR81BSVnbVg@mail.gmail.com>
Message-ID: <CAD=FV=X7-abQsE5s6Tbz9B22ZXT_yRFii55cUF2LR81BSVnbVg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: align RPMh regulator nodes
 with bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Feb 17, 2023 at 7:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Device node names should be generic and bindings expect certain pattern
> for RPMh regulator nodes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I was fixing these in other boards, but missed SC7280. Previous
> (applied) set:
> https://lore.kernel.org/r/20230127114347.235963-4-krzysztof.kozlowski@lin=
aro.org
> ---
>  arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts        | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts           | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi          | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi        | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
