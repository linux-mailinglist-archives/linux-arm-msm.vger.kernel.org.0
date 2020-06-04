Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8244F1EE325
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 13:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgFDLQe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 07:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgFDLQe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 07:16:34 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42814C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 04:16:34 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y11so2055567plt.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 04:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DEKbfIfXEu9wF9Z0rkW5J6S6e0LP/FIn5jqzqOD5wDs=;
        b=J5RJ6b1svg73OcukZzTb62hfadQTam8cpOe6CX7zl/Yqm9toweh+CzSVUszQVZxgHc
         MrzJlzQHPZiB/HszI+VdlKy0lFN8QKlDyAJ3lMMe45FqOCuMua5MMXQT/dYiM298BrDS
         PwTgQO5xtayqQSu3nBzYBqxLzKEoVkKZOC5iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DEKbfIfXEu9wF9Z0rkW5J6S6e0LP/FIn5jqzqOD5wDs=;
        b=d+Hvg5Dfcyz6FKRjCoOYHSUyXfQ36KGB9ou5+kZjZp6oR4PAqphVU547Adno2dvaUN
         s76bcqO0Bonc7dk0MsE562mfBP7EP7gPlEh2yqrJvkkWIgP5K2UitcFrwmhtsEmXkE9T
         0LXbT32/0DVd2FApJ1XUUBDxU99xm4o3aCZUllvWZ6pbwRpWMBu7BzXmU0GHYt7MzYUg
         1UxsrJa+IMJWjx1pJQLRQ1q4YqD8Ef9EgnsHDKxztjQlqk8lElAKDylGWXteaL0EuVT7
         vRwQox9zjZlDMe56/+QHGAWjdGqzMxX0ksapMIks7G9kV5Os+ww+vNWwLk8LC1iC+nnC
         P2dw==
X-Gm-Message-State: AOAM530DHAmNe8V4wig12X1BH/xj186eb2dgxXbxKLQIrDv9mHkb8ajO
        FEcQTj2ztjWGFYv0mvq3hA2kQ/fuAM4=
X-Google-Smtp-Source: ABdhPJxCCivBhK/hg9K6wT5AEXVQ71u0Uha04pdnmjNrV/7G1HqPOOjkbI98CsYtuP81QhefKr6diQ==
X-Received: by 2002:a17:902:aa48:: with SMTP id c8mr4478787plr.128.1591269393407;
        Thu, 04 Jun 2020 04:16:33 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a19sm4510338pfd.165.2020.06.04.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 04:16:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d9ccf188-4f00-d3ac-ba0f-73f06c087553@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-3-git-send-email-sanm@codeaurora.org> <159120577830.69627.13288547914742515702@swboyd.mtv.corp.google.com> <d9ccf188-4f00-d3ac-ba0f-73f06c087553@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3 driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram (Temp) <sanm@codeaurora.org>
Date:   Thu, 04 Jun 2020 04:16:31 -0700
Message-ID: <159126939154.69627.13027312816468830595@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (Temp) (2020-06-04 02:43:09)
>=20
> On 6/3/2020 11:06 PM, Stephen Boyd wrote:
> > Quoting Sandeep Maheswaram (2020-03-31 22:15:43)
> >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom=
.c
> >> index 1dfd024..d33ae86 100644
> >> --- a/drivers/usb/dwc3/dwc3-qcom.c
> >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> >> @@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qc=
om)
> >>          return 0;
> >>   }
> >>  =20
> >> +
> >> +/**
> >> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> >> + * @qcom:                      Pointer to the concerned usb core.
> >> + *
> >> + */
> >> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> >> +{
> >> +       struct device *dev =3D qcom->dev;
> >> +       int ret;
> >> +
> >> +       if (!device_is_bound(&qcom->dwc3->dev))
> >> +               return -EPROBE_DEFER;
> > How is this supposed to work? I see that this was added in an earlier
> > revision of this patch series but there isn't any mention of why
> > device_is_bound() is used here. It would be great if there was a comment
> > detailing why this is necessary. It sounds like maximum_speed is
> > important?
> >
> > Furthermore, dwc3_qcom_interconnect_init() is called by
> > dwc3_qcom_probe() which is the function that registers the device for
> > qcom->dwc3->dev. If that device doesn't probe between the time it is
> > registered by dwc3_qcom_probe() and this function is called then we'll
> > fail dwc3_qcom_probe() with -EPROBE_DEFER. And that will remove the
> > qcom->dwc3->dev device from the platform bus because we call
> > of_platform_depopulate() on the error path of dwc3_qcom_probe().
> >
> > So isn't this whole thing racy and can potentially lead us to a driver
> > probe loop where the wrapper (dwc3_qcom) and the core (dwc3) are probing
> > and we're trying to time it just right so that driver for dwc3 binds
> > before we setup interconnects? I don't know if dwc3 can communicate to
> > the wrapper but that would be more of a direct way to do this. Or maybe
> > the wrapper should try to read the DT property for maximum speed and
> > fallback to a worst case high bandwidth value if it can't figure it out
> > itself without help from dwc3 core.
> >
> This was added in V4 to address comments from Matthias in V3
>=20
> https://patchwork.kernel.org/patch/11148587/
>=20

Yes, that why I said:

"I see that this was added in an earlier
 revision of this patch series but there isn't any mention of why
 device_is_bound() is used here. It would be great if there was a comment
 detailing why this is necessary. It sounds like maximum_speed is
 important?"

Can you please respond to the rest of my email?
