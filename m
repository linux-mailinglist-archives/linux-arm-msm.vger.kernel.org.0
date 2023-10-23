Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714227D430E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 01:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjJWXIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 19:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjJWXIr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 19:08:47 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28B1BD
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 16:08:45 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59e88a28b98so32829307b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698102525; x=1698707325; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7q7uM7/5nANy1ke32gOriqsBEknknlJIz/6awHfnbE=;
        b=Tgs9ewT4vJuzLgby3I0PD77fUXYX4AemNo7aMH0TRIth2HmUoDklfmYpmru0frRZCd
         oyhoHm/ozVGoWJA07YFQGma6Yl6KNU+zAJUe9a7x5YsKrkyLXqI3HDuP5emHpiYV9JQR
         uNLnchSHbIjGp0zMYt4Wsu5xOKF64mU6cLWB9KdIX4h2OhaRqxLRFaMiOzt+sHJ+eeZQ
         ynpux6B1TsuVyR3RSy4VB3pswI6r9EpdHaUKgsMePmoh9mbaxMuARMDnt7M7EXa6zTMb
         0nAZ+dQRDievduQLsxv5kbcPJSUBpXyya7qOvWIzVFaaG0ImugA6Fz6ttGvbyjO2zae4
         5TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698102525; x=1698707325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7q7uM7/5nANy1ke32gOriqsBEknknlJIz/6awHfnbE=;
        b=mgjMiYOkTShMbPEc4zktluccgjjsBMY2u/hTnp25RwTNpjsRYdgHwn+pKcntAI8aVb
         D1OaUgFIAOLFANc/3ftfNJdtdn7v4Gnch8AtZLYQV0NgAsNM5YF9aPXgZOGZ6KkfbK9+
         cyTK2mpazTuWj6OU/7VwZLBwJgJjCkV2xVZOtrUQ7Ifvql2RrNTyxYTyNLMM24lSrxcP
         MUzV+yDbsoLWZmFqFSiacAHtciJwV7KW89UW7BWamZm12GDrJEfUvOHiTtX4OiNmUdYo
         4wkUUD1gqeJaP1XXYBs2UP1P/nHoZt7lT5zWiXqSDVtH7PkgiyZMrzuAV3ZoUqdGKSO+
         PjdA==
X-Gm-Message-State: AOJu0Yxxm01/phLrwCY/VyKyDr1Qr9fu8arZ7+AsyC3OBsfWSb+UuU9J
        qCke1iuatFpUzDjdFU1oZFQUKsaRMJbuBtmyEio3EyoOGQ8D5mVfE64=
X-Google-Smtp-Source: AGHT+IF1UD1RP4wHymGVEkrmy7gPP2LYwDNQpg1Hhpm7M7ZCxzFvzznpj294sUDK2yY8mp7MdFhj7sdD6YOT/1NZ76k=
X-Received: by 2002:a0d:d881:0:b0:5a7:fbac:4ffe with SMTP id
 a123-20020a0dd881000000b005a7fbac4ffemr14251409ywe.22.1698102524920; Mon, 23
 Oct 2023 16:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
 <20231023215327.695720-2-dmitry.baryshkov@linaro.org> <20231023224715.GN3553829@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231023224715.GN3553829@hu-bjorande-lv.qualcomm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Oct 2023 02:08:33 +0300
Message-ID: <CAA8EJppen6Ebmv_fjdrHoUXRsFFH5TZonKck=bRDKgXTTWOxoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Oct 2023 at 01:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Tue, Oct 24, 2023 at 12:47:26AM +0300, Dmitry Baryshkov wrote:
> > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > easy way to recover from it. Since we have no easy way to determine
> > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > such platforms. This allows us to enable UCSI support on such devices.
> >
>
> Really nice to see this. Thanks.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c       | 3 +++
> >  drivers/usb/typec/ucsi/ucsi.h       | 3 +++
> >  drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index 61b64558f96c..5392ec698959 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
> >       u64 command;
> >       int ret;
> >
> > +     if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> > +             return 0;
> > +
> >       command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
> >       command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
> >       command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > index 474315a72c77..6478016d5cb8 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -317,6 +317,9 @@ struct ucsi {
> >  #define EVENT_PENDING        0
> >  #define COMMAND_PENDING      1
> >  #define ACK_PENDING  2
> > +
> > +     unsigned long quirks;
> > +#define UCSI_NO_PARTNER_PDOS BIT(0)  /* Don't read partner's PDOs */
> >  };
> >
> >  #define UCSI_MAX_SVID                5
> > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > index db6e248f8208..5c159e7b2b65 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > @@ -327,6 +327,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
> >       if (ret)
> >               return ret;
> >
> > +     ucsi->ucsi->quirks = id->driver_data;
> > +
> >       ucsi_set_drvdata(ucsi->ucsi, ucsi);
> >
> >       device_for_each_child_node(dev, fwnode) {
> > @@ -379,6 +381,7 @@ static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
> >
> >  static const struct auxiliary_device_id pmic_glink_ucsi_id_table[] = {
> >       { .name = "pmic_glink.ucsi", },
> > +     { .name = "pmic_glink.ucsi-no-pdos", .driver_data = UCSI_NO_PARTNER_PDOS, },
>
> In altmode and battmgr drivers we apply quirks based on the compatible
> of the pmic_glink of_node.

... and I can't say that I like that. In typical drivers we perform
driver tuning by looking at the device's data (e.g. by using
of_device_is_compatible or by of_device_get_match_data. Checking the
parent device seems like breaking the layering.
But if you insist, I can follow that approach.

>
> Could we do the same here, instead of mixing the two schemes?
>
> Regards,
> Bjorn
>
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(auxiliary, pmic_glink_ucsi_id_table);
> > --
> > 2.42.0
> >



-- 
With best wishes
Dmitry
