Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E037DC22C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 22:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbjJ3Vz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 17:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjJ3Vz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 17:55:27 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1327F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 14:55:23 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso277879466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 14:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698702921; x=1699307721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqyNfPUEzQcC86GGtCQWWD8Oa22hZLdjLYhI8L84gmY=;
        b=Z+TZIdGnee1piytDqsY41R1RIdmPMgLYRTVpjoSsCrtHnILekgQ4N15jH0Urqd9LJF
         SDTlTCKZP1ODgjqNn2XZP2rVabzDu27CHMM+TXPWTTprByzOcfvxS64LA70As498Wm/3
         O2KqVj4n6rUfVFBtwnEn+9uFpUtqn+audgbCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698702921; x=1699307721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqyNfPUEzQcC86GGtCQWWD8Oa22hZLdjLYhI8L84gmY=;
        b=NOvb+/WVL/P4ucu7uvqYBUHrhoAaHaTr+6CtYFNs0ppjX/iHyRe56G/YHWmdnOQ3As
         pD5UA7RP9zeMYI/gLX2Q28j+ESBkXh/i6MBPtYfvW3d/gmH4yPVLp2jNlFRdc5L/PQOq
         Jcr2JO7Rmpp+rP2vd0XEMGST7M6zCpnNcX/62arpy6KG7lJVpPv17TI+TjW5zPmYqAZZ
         +mJajonoj9Q2HGmIr6h11bTZjPes6acERKEjDUrWFKUW9w34bFFTTLWp69i39hddio1x
         RX5bjGk9p4hIsRKBM/QKT9qW9BjPJPVUYMPDGuByunR9qxmlqdlUfyCBZgivjjl5LjZ6
         CT7Q==
X-Gm-Message-State: AOJu0YzMC1wFdX6hDeiO1c3694bfiSvtbSqgcqHl0ZqyMhx5RNpv3WXD
        otyA15rayPrXei7NqBBBPBcUndWu5w7N9GoHb4wPjfce
X-Google-Smtp-Source: AGHT+IFgQsWFTA3oJdM9aPPzKAlW/qscPToyH6vO84niKw86iRE57FoR1mCEo0VTqDW+ZvBTVMenVg==
X-Received: by 2002:a17:907:783:b0:9ae:5253:175b with SMTP id xd3-20020a170907078300b009ae5253175bmr10187038ejb.34.1698702921509;
        Mon, 30 Oct 2023 14:55:21 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id d24-20020a170906041800b009adc7733f98sm6590077eja.97.2023.10.30.14.55.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 14:55:20 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40853f2e93eso8935e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 14:55:20 -0700 (PDT)
X-Received: by 2002:a05:600c:3c9b:b0:3f7:3e85:36a with SMTP id
 bg27-20020a05600c3c9b00b003f73e85036amr20721wmb.7.1698702920586; Mon, 30 Oct
 2023 14:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231027-aspire1-sound-v1-0-5ff3cf8b5701@trvn.ru>
 <20231027-aspire1-sound-v1-1-5ff3cf8b5701@trvn.ru> <d6b63a3c-d171-4b6b-b222-8c619d90f51b@linaro.org>
In-Reply-To: <d6b63a3c-d171-4b6b-b222-8c619d90f51b@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Oct 2023 14:55:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UigovpD_s89j6V7MhCXOVHVVXLRtH3XGEHtcHKbwVgBA@mail.gmail.com>
Message-ID: <CAD=FV=UigovpD_s89j6V7MhCXOVHVVXLRtH3XGEHtcHKbwVgBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: acer-aspire1: Enable RTC
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Nikita Travkin <nikita@trvn.ru>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Oct 30, 2023 at 2:47=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 27.10.2023 16:42, Nikita Travkin wrote:
> > pm6150 has a read-only RTC that can be used to keep the time with some
> > extra userspace tools. Enable it.
> >
> > Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> kinda unsure why it'd ever be disabled
>
> Konrad

FWIW we don't use the PMIC RTC in Chrome boards. I can't quite
remember why, but I _think_ that the power lines aren't hooked up to
the PMIC to keep power on for the board's lowest power states.
Instead we use the RTC that's on the EC (Embedded Controller).

-Doug
