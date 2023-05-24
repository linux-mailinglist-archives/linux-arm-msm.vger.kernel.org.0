Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E861470FC2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 19:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjEXRFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 13:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbjEXRE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 13:04:59 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4493CBB
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:04:58 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso486076a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684947896; x=1687539896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSiv7FiHooBNjd2z6gDTYmV/eBkw3m7qogP3ovVg02M=;
        b=bTJWFVNfL0LR+7cnof9Ti/AGAveHyq2f/71xtfmDw7GPIjSh4TPU072xBxh88jdmWS
         Di2XWUmUIBuF5XeTeoyvxC42mmXR+ygfj2Bd1icYRdQELDmZdbq+sVcCYUSyPukb4/r5
         E1ESJNdljwM8F51fA+UkfN0/sqAcq/g8yAJPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684947896; x=1687539896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSiv7FiHooBNjd2z6gDTYmV/eBkw3m7qogP3ovVg02M=;
        b=lSFiPKXBvo6g6g04Y0EcmRXxURbW/YKk86EvUwniC6AZgZOiy3qb6bjLgOYDN4ce9r
         vcbh4UWpeJgNZlVAsv5Sj39gM1Rthdw0752CojwQOUioHoe+bOADIdt8leW/3P5WsQaq
         uriiKMbYcv+SvjnrMpIN6TNwICfQWCXHPj19ay7Ir5lwbfHkjOSNjada8ipGGao2qH1v
         tjQdbO0m7e6iSQPgtfJwxO9HkYLt+LvKHAXtS+io+cm5LSsWepKFBf/o76zK1S05suqA
         /cy7YfZo0wTrWdc3oUgEFW+Y3J5Zb/b4Zj9qiV761DbYQTof/GwIjxFDEhCmoZaZwXxM
         NTnw==
X-Gm-Message-State: AC+VfDw2Yxe4ntnAepaV8tNXvyY18HxIQ3lecfqqjoM9yW597V+svJmi
        GXwKUPMXYc7J4D7QYaDCWtRhzBjnkpBA6g77lJo=
X-Google-Smtp-Source: ACHHUZ43JZKdTPcMVYnFv4Wd74McH8KawPnMdLbo3l6nXL20D0YMxwlCmxsmlJQFxZBouh/9PNPPhw==
X-Received: by 2002:a17:903:2343:b0:1ab:109e:a553 with SMTP id c3-20020a170903234300b001ab109ea553mr22833276plh.62.1684947896586;
        Wed, 24 May 2023 10:04:56 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902694c00b001aaeaa27dd5sm6685586plt.252.2023.05.24.10.04.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 10:04:56 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1a950b982d4so5945ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 10:04:56 -0700 (PDT)
X-Received: by 2002:a05:6e02:156b:b0:32e:561d:b42d with SMTP id
 k11-20020a056e02156b00b0032e561db42dmr271821ilu.16.1684947875310; Wed, 24 May
 2023 10:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid> <646e391f.810a0220.214ce.d680@mx.google.com>
In-Reply-To: <646e391f.810a0220.214ce.d680@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 May 2023 10:04:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEeeRopigfbSa3mU1aHyr_ZZCnqR94FEn7YTeiDDJ-YQ@mail.gmail.com>
Message-ID: <CAD=FV=WEeeRopigfbSa3mU1aHyr_ZZCnqR94FEn7YTeiDDJ-YQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/panel: Check for already prepared/enabled in drm_panel
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, hsinyi@google.com,
        devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 24, 2023 at 9:19=E2=80=AFAM Chris Morgan <macroalpha82@gmail.co=
m> wrote:
>
> Thank you for looking into this more. It's one of the last QOL bugs
> for some devices I'm working on, even if the end result is no big
> deal (the other QOL bug involves a WARN on probing a rotated panel).

Glad it'll be helpful!

For the WARN on probing a rotated panel I thought there was some
progress on that front. Commit e3ea1806e4ad ("drm/bridge: panel: Set
orientation on panel_bridge connector") or commit 15b9ca1641f0 ("drm:
Config orientation property if panel provides it") didn't help you?
