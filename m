Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076307B33E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 15:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbjI2Nlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 09:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233400AbjI2Nlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 09:41:49 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3291AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 06:41:45 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-533df112914so13435964a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695994904; x=1696599704; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJoYmFRIe+RZCfOkQfBp0KCRM2jWqK/EXH4FGkhcIDQ=;
        b=OgwoGfdE37BlElKKWimDIUOWPTg/ijZxAA+zYKUbrI1WB60tScS/WbWoiDq1I/Iyg0
         fy3G99rJjmnS5oI0OsL2QdO7jK2qbHqh7CHHIP7SjsgZYijKDtdbnBtCOKyhl9N01IwZ
         KnjM28FTINA3KeYOD9JqhCLgQNLuRTcIrdqITrLNA5j0t8XHLmSfABUh0nNlAtdWIEYN
         iwMab6rOUFvls6u1rrQH33nsL8gWNXYSkod7DhGs2ZmATCWY9Df8M7i9OIVi2AkrziZV
         Y7OKpqBJ1Zuot4adeZDgrwpu0wjZOK3Mz6wEg+fZmbceKNXQZRRKcfPDYhFiceqpw7VA
         sbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994904; x=1696599704;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJoYmFRIe+RZCfOkQfBp0KCRM2jWqK/EXH4FGkhcIDQ=;
        b=fGtCOM3kEPtCoRo6wmeV7obiUy7vbyBbdL10moqxdS5gZjXLVhuZ8AFmHlfbhr1vcp
         D8s3PD86nLXRmFfsnDdJErIjYZ0GEUU00E/bjHBvlJkBQvZOqA++NHC+Vqo2plom/1Lw
         W/849G5lf7BR1iVJjLSDWLOCvxBFykfyw29491D214GJ5GqO37hmGym6/7/P7ubFURme
         zLeIM65FWnuBsiAeO2b/WyOpqMNt7Aw3y24qAimKBUVugZSOXesyArFHobOrGRO8uaMx
         zJRiZPRo0yQPRAB7Lq0e6D6v1EpIocYDEBobasPZe5TGYb8TqKzTHp8DNBvP1hrQuire
         DrwQ==
X-Gm-Message-State: AOJu0YybLY47GhsCIBgaczHrFxF48Y9YdWVtpusDRFX9h4KMiOUEkgCp
        w7lpvmHEpdpwkHHF/bBUCxq77g==
X-Google-Smtp-Source: AGHT+IFvqdi7WSBS4qbFiMpFp6n6en80RTIKym9YcKxklvBr9G0fovRfLJsVZmf09Ope8f7XXrSMng==
X-Received: by 2002:a05:6402:b3a:b0:51d:f5bd:5a88 with SMTP id bo26-20020a0564020b3a00b0051df5bd5a88mr3527607edb.38.1695994904285;
        Fri, 29 Sep 2023 06:41:44 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l14-20020aa7cace000000b0053331f9094dsm11185505edt.52.2023.09.29.06.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 06:41:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 29 Sep 2023 15:41:43 +0200
Message-Id: <CVVG0MQU36EB.17OPE15SGM0HX@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 busses
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Loic Poulain" <loic.poulain@linaro.org>,
        "Robert Foss" <rfoss@kernel.org>,
        "Andi Shyti" <andi.shyti@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.15.2
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
 <20230929-sc7280-cci-v1-3-16c7d386f062@fairphone.com>
 <02eb9847-62ea-e453-0745-6f6ff46f3ad0@linaro.org>
In-Reply-To: <02eb9847-62ea-e453-0745-6f6ff46f3ad0@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri Sep 29, 2023 at 3:36 PM CEST, Konrad Dybcio wrote:
>
>
> On 9/29/23 10:01, Luca Weiss wrote:
> > Enable the CCI busses where sensors are connected to.
> >=20
> > Not covered here is the regulator used for pull-up on the I2C busses.
> > This would be pm8008_l6 (L6P).
> Does it make sense to enable non-functional hw then? Or is it on by defau=
lt?

Without the out-of-tree pm8008 driver you cannot talk to any hardware on
the i2c busses there, so.. I guess you have a point?

A little bird told me this week they're working on a new revision for
pm8008 so hopefully this is coming at some point.

>
> Konrad

