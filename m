Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77E27D5B93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 21:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbjJXTgZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 15:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbjJXTgZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 15:36:25 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D34FC4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 12:36:23 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7ac4c3666so48487147b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698176182; x=1698780982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yN+Wf2NuwWiaWpprU1X7bPdQESj4q04Rji0QOi3oDmc=;
        b=U8ttJK7AUXJ1DvDG4cw1ziUAGI4yP7UFW/19ffOyEGmd2HrSM1yF4+NwsE9BYCyxpM
         LB2S82Gb0eDx/9WiVAeezce63SvIaBhNqk3Kjyaa9lQAcFBjtb/J8jRnLTTgw0gxUYrl
         dzENr9F+ncAR3zH7p5VmhNF56+U8wLZx92NdetoWl/qTV9gSPinsjy0up5S97goxQ0s5
         qUn4iMFNakiJ2AFYAVwnJoRnY86pDCL0vbLmsVCwJAqAKLKoDUVk0oGouIyHPG0kMEbh
         UJmiToYzxhqlE0WAsjophc4WjN4dUyexX908i84gi+85FAWRdoVqDYzVtsUQ1DNcbDJs
         h9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698176182; x=1698780982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yN+Wf2NuwWiaWpprU1X7bPdQESj4q04Rji0QOi3oDmc=;
        b=YCeKpd/zi19/nmKP0VW1h/ZbGF1IYRwlUWaVBWranOzod+bKSrcutrKfiUnReHbIsJ
         eJdfjSBt/LmHVCVD4x1P/41zdyW8bax1bHZNlopCSRRhVyZtZafawsay2xHwFVfeeKJj
         2mKSzT6ANjbQapDpQZjjEDCgAY9aIpw9RoFYobO2ls9k3gui6Ak2VQ78mxC2icNPIxZz
         DiGdIOqpofiAcCgUS1mhjWAzMf0aNww/F7cDBPsQxbm122k1tp3b4rLAHHFdZO8JwbGx
         Y2ECbvVXL7LmaiyIl9zsmjJ2Gb+9MXur9tdbxZocDrptBa5Sn6hCfUMHTHVs+Na/5W6C
         WhHA==
X-Gm-Message-State: AOJu0Yx1ozexXUgaUar5c4IdTVJbcTiNI512/sHvuqKh0UGdkUqciDDi
        Bdqx2NsCyXifRqh9a3LYzOrI28gwCeFRToezCZ5i1g==
X-Google-Smtp-Source: AGHT+IGtr0fhiXl/0CLP/O6U3SCGARIB9eohRsUR2F9MhSlodiLJvLFCzT6VhoSTe/sEnmvUwWN3nBU8ut5SiQeiSUs=
X-Received: by 2002:a81:784f:0:b0:5a7:b900:a373 with SMTP id
 t76-20020a81784f000000b005a7b900a373mr13750313ywc.0.1698176182458; Tue, 24
 Oct 2023 12:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
 <20231023215327.695720-2-dmitry.baryshkov@linaro.org> <20231023224715.GN3553829@hu-bjorande-lv.qualcomm.com>
 <CAA8EJppen6Ebmv_fjdrHoUXRsFFH5TZonKck=bRDKgXTTWOxoQ@mail.gmail.com> <20231024164254.GP3553829@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231024164254.GP3553829@hu-bjorande-lv.qualcomm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Oct 2023 22:36:11 +0300
Message-ID: <CAA8EJpqFa6QJXcr9+n3xrCKN00D9K9wsvEFp5bQsxdb1iFyFGQ@mail.gmail.com>
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Oct 2023 at 19:42, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Tue, Oct 24, 2023 at 02:08:33AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 24 Oct 2023 at 01:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > >
> > > On Tue, Oct 24, 2023 at 12:47:26AM +0300, Dmitry Baryshkov wrote:
> > > > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > > > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > > > easy way to recover from it. Since we have no easy way to determine
> > > > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > > > such platforms. This allows us to enable UCSI support on such devices.
> > > >
> > >
> > > Really nice to see this. Thanks.
> > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/usb/typec/ucsi/ucsi.c       | 3 +++
> > > >  drivers/usb/typec/ucsi/ucsi.h       | 3 +++
> > > >  drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
> > > >  3 files changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > > index 61b64558f96c..5392ec698959 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > @@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
> > > >       u64 command;
> > > >       int ret;
> > > >
> > > > +     if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> > > > +             return 0;
> > > > +
> > > >       command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
> > > >       command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
> > > >       command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > > > index 474315a72c77..6478016d5cb8 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > > @@ -317,6 +317,9 @@ struct ucsi {
> > > >  #define EVENT_PENDING        0
> > > >  #define COMMAND_PENDING      1
> > > >  #define ACK_PENDING  2
> > > > +
> > > > +     unsigned long quirks;
> > > > +#define UCSI_NO_PARTNER_PDOS BIT(0)  /* Don't read partner's PDOs */
> > > >  };
> > > >
> > > >  #define UCSI_MAX_SVID                5
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > index db6e248f8208..5c159e7b2b65 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > @@ -327,6 +327,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > +     ucsi->ucsi->quirks = id->driver_data;
> > > > +
> > > >       ucsi_set_drvdata(ucsi->ucsi, ucsi);
> > > >
> > > >       device_for_each_child_node(dev, fwnode) {
> > > > @@ -379,6 +381,7 @@ static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
> > > >
> > > >  static const struct auxiliary_device_id pmic_glink_ucsi_id_table[] = {
> > > >       { .name = "pmic_glink.ucsi", },
> > > > +     { .name = "pmic_glink.ucsi-no-pdos", .driver_data = UCSI_NO_PARTNER_PDOS, },
> > >
> > > In altmode and battmgr drivers we apply quirks based on the compatible
> > > of the pmic_glink of_node.
> >
> > ... and I can't say that I like that. In typical drivers we perform
> > driver tuning by looking at the device's data (e.g. by using
> > of_device_is_compatible or by of_device_get_match_data. Checking the
> > parent device seems like breaking the layering.
>
> It felt like it was the cleaner option of the two when I did it. I think
> there was some variation of quirks which made me feel this would grow
> large - but I might misremember things now.
>
> > But if you insist, I can follow that approach.
>
> I insist that we should use the same mechanism of dealing with the
> quirks across the three parts, and following the existing approach
> doesn't seem too unreasonable...

Ack, let me send v2 and hope for the best from USB maintainers then.


-- 
With best wishes
Dmitry
