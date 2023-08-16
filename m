Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D295677E707
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 18:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344975AbjHPQzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 12:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345024AbjHPQyu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 12:54:50 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AC2273A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 09:54:45 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5255ce77d70so5078058a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 09:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692204882; x=1692809682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gm1Xm6qKtBBHwZRiPDqXkb0hB+xtLzUrT5ZrlkndbII=;
        b=dQDnG/N7VZdwLw1DTTaT5B5WAJfpsva5wbgd+rqRpn+WOWdKkh8H5rP16JLyH23euY
         NG+JbR76x+DWsyHfriSqSML3lAja+p3e7d7EhkUo9gDXBeWI1wEL5ksge7gnznPHpcdH
         zBxq38ZAat1KQ9pK2TfoRrxsraRLSJ/YQnlI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692204882; x=1692809682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm1Xm6qKtBBHwZRiPDqXkb0hB+xtLzUrT5ZrlkndbII=;
        b=RrXub6nPu0OxmjDSsJkl1QEOw9+plJHD64iMPF1p6ArfIxjPXGvUa4w96sCkI7yoQ6
         X5qayx1By6piW9DDLvV8ThZPsLpobZeD8DffToJvN3W/wkL7UH32NDfZUe3kx1+5WR84
         +3VpysxRXtnp9Y25CGfWxkl5t/ZYRuf8cq8aN773oSm6bp/5b5auW6g5x5KPCK/hP1PA
         wurA1CjmjESNTIdF/rfEdvYtZZZGo1bb0yCpgtI5PYBwV3dDAfRLTZaUndp9Xcq5yHeR
         taWyqX6/Svb8q8IHs7xFLc/xvUlz/hRBl6GQMnr8e3pC5nmf4u4qOErXpbuDtYHhbaLz
         DxmQ==
X-Gm-Message-State: AOJu0YzM8kGq47NXoKaRcQf2OAbtnfdQjADZ8AtoigIH9oR4AsPwrnGb
        zDuoI/ajOaGapzkFXuT0vr7ze6fAeyBdmHrnNmUwOuxN
X-Google-Smtp-Source: AGHT+IENRD9S99H9rfymN0R/kvpTvMP7zroBVyvm8hywRiGOj8sUa4i6Pg/7iTiAFarhTXeMZvmM9A==
X-Received: by 2002:a17:906:cb16:b0:99b:e6ec:752c with SMTP id lk22-20020a170906cb1600b0099be6ec752cmr1906604ejb.70.1692204882123;
        Wed, 16 Aug 2023 09:54:42 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id o19-20020a170906359300b00997c1d125fasm8774658ejb.170.2023.08.16.09.54.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:54:41 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fe1e44fd2bso3365e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 09:54:41 -0700 (PDT)
X-Received: by 2002:a05:600c:5024:b0:3f6:f4b:d4a6 with SMTP id
 n36-20020a05600c502400b003f60f4bd4a6mr218wmr.7.1692204880839; Wed, 16 Aug
 2023 09:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230816060042.13110-1-krzysztof.kozlowski@linaro.org> <3a4bb4c3-ccbe-45a1-a7e9-ee3d31f73c9a@linaro.org>
In-Reply-To: <3a4bb4c3-ccbe-45a1-a7e9-ee3d31f73c9a@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 16 Aug 2023 09:54:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V+W9qDXeHSDbRWC_dkPm5Ygwi_LG0Bu8k5dZ9UbxoPGA@mail.gmail.com>
Message-ID: <CAD=FV=V+W9qDXeHSDbRWC_dkPm5Ygwi_LG0Bu8k5dZ9UbxoPGA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: drop unsupported qcom,adsp-bypass-mode
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 16, 2023 at 4:41=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 16.08.2023 08:00, Krzysztof Kozlowski wrote:
> > LPASS LPI pin controller node binding does not allow
> > qcom,adsp-bypass-mode property:
> >
> >   sc7280-herobrine-crd.dtb: pinctrl@33c0000: 'qcom,adsp-bypass-mode' do=
es not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
> >
> > Fixes: 32d4541abe0f ("arm64: dts: qcom: sc7280: add lpass lpi pin contr=
oller node")
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> Looks like it was never picked up
>
> https://lore.kernel.org/linux-arm-msm/20230714-topic-lpass_lpi_cleanup-v1=
-3-dc18b5bd14f7@linaro.org/
>
> Konrad

Yeah, it seems like picking up Konrad's is better. If nothing else,
the "Fixes" tag in ${SUBJECT} is wrong. This property was actually
valid/required on older kernels IIRC.

-Doug
