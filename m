Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980EC77D4EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 23:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238663AbjHOVKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 17:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240099AbjHOVKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 17:10:18 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D178DAB
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 14:10:17 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5234f46c6f9so7740601a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692133816; x=1692738616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odcIHJD4i6qYxkYpkq/m/nPdbOE2fx/8seyThbI753E=;
        b=Tczz3TY/kGP72kTzjNPXeeQoWBFAubsuqrat2wNyGuk8PZsCvwWHujB9x8YcPRWgfq
         /pi7HKSeQkGQ2V/tH89LpVNBdrqHMjEXi4c2MMS338I/LYXIvRCYNgts8fLz3MId9ff0
         xLigj7m9JWjJkns4BSxzU39pdk6FhSY9DZ8E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692133816; x=1692738616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odcIHJD4i6qYxkYpkq/m/nPdbOE2fx/8seyThbI753E=;
        b=ZmIiJVpkWGi8CTnYY3r3vIFDCnUpi6Yb/EKT1mVQrcBrFwt1ellgQ0wF1xs4juQC1O
         +F7X1WPTHHg43dgnPmcd1En5wL9yQn7wpAVbfBzSEW56msHco08pBNwd8IijngHAX/M7
         4FPb5c+3bFM4nzrubABE1pBuv3OduWmPZpqSe8qkx05SjtYbS2kMdLs7sSFPmlkqURpQ
         9iOsO/pfY18dS2m8+VJAqRTpD+VeGpwKl3gDc8GmYG2XCgOMKCv/Xc+fT5oGD8wXhxki
         cLAdmAzIraAeIH0QXy4lDME+l6m0QZNilptSuNxhBFl0A4hOv59Y54hOGL2xppzW5vNP
         rK1A==
X-Gm-Message-State: AOJu0YyVBBuwnMYDiIYXrAexj4fZJkWRTHVwzt8gQLFbGHeYH4mONTry
        hYNmFhW2Ci8lnq7gq7K07wVVHUb+/XXSOeMC2CHLtmJk
X-Google-Smtp-Source: AGHT+IGDBOEjExqdtGqOHKRoM5VOiJD19t3XLhNMm4NvjpjQdgP+MC3lOn7f5ejlXZRTjJ05wQ0oZw==
X-Received: by 2002:a50:ec8b:0:b0:522:3ef1:b10 with SMTP id e11-20020a50ec8b000000b005223ef10b10mr28694edr.6.1692133815759;
        Tue, 15 Aug 2023 14:10:15 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id t22-20020a05640203d600b0052544bca116sm4690737edw.13.2023.08.15.14.10.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 14:10:15 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so3926a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 14:10:15 -0700 (PDT)
X-Received: by 2002:a50:8a9e:0:b0:523:caae:d6ee with SMTP id
 j30-20020a508a9e000000b00523caaed6eemr38206edj.2.1692133814851; Tue, 15 Aug
 2023 14:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230809064908.193739-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230809144516.v3.1.I7a950de49ec24b957e90d7fe7abd5f2f5f2e24c3@changeid>
In-Reply-To: <20230809144516.v3.1.I7a950de49ec24b957e90d7fe7abd5f2f5f2e24c3@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Aug 2023 14:10:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKTdaQgH4Cf2OCV9Uy6APjxfP8Pz+1-uWAcLC2PphYnw@mail.gmail.com>
Message-ID: <CAD=FV=WKTdaQgH4Cf2OCV9Uy6APjxfP8Pz+1-uWAcLC2PphYnw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: add sc7180-lazor board bindings
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 8, 2023 at 11:49=E2=80=AFPM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Introduce more sc7180-lazor sku and board version configuration,
> add no-eSIM SKU 10 for Lazor, no-eSIM SKU 15 and 18 for Limozeen,
> add new board version 10 for audio codec ALC5682i-VS.
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.googl=
e.com>
> ---
>
> Changes in v3:
> - correct corresponding of new board and new sku
>
> Changes in v2:
> - add new entry rev9 with Parade bridge chip
> - correct newly create dts files
>
>  .../devicetree/bindings/arm/qcom.yaml         | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Make sure you also pick up Krzysztof's review from v2, which I think
he'd be fine with you carrying forward even though there were small
changes between v2 and v3:

https://lore.kernel.org/r/55d4090f-d2f3-ffb2-cc6f-a13222f14e47@linaro.org
