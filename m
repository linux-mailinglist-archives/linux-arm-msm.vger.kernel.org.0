Return-Path: <linux-arm-msm+bounces-3924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8793380A1DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B87801C20916
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA12E1A293;
	Fri,  8 Dec 2023 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y1p4CXX3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8761728
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:11:11 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5d77a1163faso14600317b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702033870; x=1702638670; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ/xpupr9bHbhk+XXvEulWb5mVWg/ARpa/Sw0R7vnGo=;
        b=y1p4CXX3oCOynLvmW4ZYlnuEuOa9EICRyoR0x5E0WkEy7iWmrxUM+G37FaIv/BCWXI
         e0yXaM5QGy7w3rr8hmsz2am2dIfOYfX3Jx4+aQLJa0nCeEA42l7uzuCtU1b6sgYhvZly
         rTH8iPTQnt4/bhOeyDl0wyo7kFE816a+tkR6TLQSRw43O/qDX8HaBhD2dtOG1qgILkFV
         XtEuwdNpVAyO/JNh5Xut3QOJ0fLF4Kq/M9DMWiwpSZALDJgK+kBmadzAKmLBmOcCNvG7
         3XySMP/FUT+p9V5kKh6fSHkidJ2xKkJ2sq/MqA2/0Ze24qqclKKf/prftuc7S5xCVe/V
         S4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702033870; x=1702638670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQ/xpupr9bHbhk+XXvEulWb5mVWg/ARpa/Sw0R7vnGo=;
        b=Zv+pq0s363B5OsPJ546JVRH4eh6T5InGf7wejF22w66uwfTxxw020vdKyuJsLXRkZb
         CqA0y0Aqd30QnGQm0Ht5Oa3W6z/tugsUksFzK4tSrH4JRioS3TDrD9REiY8HIlf68Z88
         wDMqLc4+2kJ/nnhs5ZwXO2OHxzfsCv+0QzF7zFi8VDJnLRjw3zUb69RctQMuqU0Ry3cx
         ciuGDBOBPJ1SUBXSGDqHymF6Ua8RIlQE8OSpd2ZXQvDS7IrIEgL42qMDNPyvhqC1LF0x
         lvaJ7NzphXPBFXgVChF3XPmwF/fXZRwDWysxUJGeQpY/6IoYZnXuPK+TyEby3UTaIW3Y
         hrJA==
X-Gm-Message-State: AOJu0YzfQm6OF1/q3Z5m5C/ifLo8K4zuBIGXh1DWZHpCyscePQ+tTmPr
	8fX4Bey7uBXuUwbplcO8hYbrFedHhFYsqRNIID01mGA6eVuJedIf
X-Google-Smtp-Source: AGHT+IFVa2cDPG9X0rerhkAjoKB34/4e59kPEje3jf8VcVLSmkZc/nmWR6L9pWN+tEKxMowY8xPF4d8fr/hhEsiGCws=
X-Received: by 2002:a0d:dd08:0:b0:5d7:1940:3f02 with SMTP id
 g8-20020a0ddd08000000b005d719403f02mr365229ywe.51.1702033870154; Fri, 08 Dec
 2023 03:11:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
 <ZXLWiVJYWdlwOBou@hovoldconsulting.com> <CAA8EJpp-BsabZB3FXnFsWZBNbF7keCrOKPPg3Qb7MzE3puMFeg@mail.gmail.com>
 <ZXL5jvDHr-MuxMoz@hovoldconsulting.com>
In-Reply-To: <ZXL5jvDHr-MuxMoz@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:10:59 +0200
Message-ID: <CAA8EJpoG-qg24wV953Xd9KQ957gpJVHc20Te2cYQWfs9imC63w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several
 Qualcomm platforms
To: Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 13:09, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Dec 08, 2023 at 12:58:29PM +0200, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 10:39, Johan Hovold <johan@kernel.org> wrote:
> > >
> > > On Wed, Oct 25, 2023 at 02:49:28PM +0300, Dmitry Baryshkov wrote:
> > > > The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
> > > > Submitting UCSI_GET_PDOS command for partners which do not actually
> > > > support PD and do not have PDOs causes firmware to crash, preventing
> > > > further UCSI activity. Firmware on newer platforms have fixed this
> > > > issue. In order to still be able to use UCSI functionality on the
> > > > mentioned platforms (e.g. to be able to handle USB role switching),
> > > > apply a workaround that completely shortcuts UCSI_GET_PDOS command for
> > > > the USB-C partner.
> > > >
> > > > This has been tested on sm8350 only, but should apply to other
> > > > platforms. I did not enable UCSI for sc8180x yet, it has slightly
> > > > different implementation, which I'd like to get tested first.
> > >
> > > Has no one tested this on sc8280xp/x13s before merging?
> > >
> > > I see a bunch of errors with this series applied to 6.7-rc4:
> > >
> > > [   11.999960] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > [   12.000430] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
> > > [   17.120515] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > [   17.124204] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> > > [   23.264792] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > [   23.264953] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> >
> > Can you please post previous messages or is the first timeout the
> > first error from ucsi?
>
> These are all the ucsi messages in the log (dmesg | grep ucsi).
>
> The first error is sometimes GET_CONNECTOR_STATUS failed (-95) instead:

Ack, thank you. This is pending on my side together with the UCSI
glink / altmode rework. I hope to have patches for that closer to the
NY.

>
> [    9.012421] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-95)
> [   14.047379] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> [   14.050708] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> [   20.192382] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> [   20.192542] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
>
> I see that one if I boot with only the charger connected, the later -110
> timeouts go away if I disconnect my r8152 ethernet adapter.
>
> Johan



-- 
With best wishes
Dmitry

