Return-Path: <linux-arm-msm+bounces-15148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B38588BF3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 11:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C35C1C2BB93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 10:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA126773D;
	Tue, 26 Mar 2024 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bEgOKATE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386994D9FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711448587; cv=none; b=ZaWYaFvSpKIE8RsejSwosS4g5xHKXmAHuoJuW9AGOiBcswjUCM5d1EZ8PplExaASEtDBXfCuCS+pOGaRQGvWMa3tSe5K6vnzHQg3dM6AeVTFmCG9X21P+ggbfvMVtZPg7pknIXdZ0c/5bXzGJZkV2HQLv3LFXq5/4/usn1WcJuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711448587; c=relaxed/simple;
	bh=0IMne5VBa+58VtuzJy8j+olboFvZILX2uTItPkJtrOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FssAY5f2AE5YdldBd6szf5W7YxnO0s8SL+DDU44PP8xcMNcq/rLeEXvuzyMtN05AkLsHnIO+w+ZEsBWkbicrUBibp1ieIp9S+RZcmLyrvFz8KsBCVb7DV6titPJOcLi3Jw80A7elYby80pv/JGTBMDrown3t66rlb3wc02qHye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bEgOKATE; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so4883210276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 03:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711448585; x=1712053385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Coz5QHcwkc4vvJyKILt3BgtloDsW9YU/fidz3bPl5fI=;
        b=bEgOKATEUmCwFyAj0sc4Qh04jJA3MiukpC4IWsTj9K0I3hCy5cOJDzlKYRC8ogOjs+
         6UyVpmhmhWbyTnjZ8Xsh5aTxivPgkgHqlgW2u7h23pyBSVmC0pzZ0AAwCVXolNiWhQlQ
         GZT158YdoRODnoiFcy6ixnS7KMfzDYjggL0NdX49BAyX25fV4QaeMioTcmEVG0tR5dNr
         CG+jg9oPTngAKYsms3BEVj/fkj45DH1Dlzovhx5rr4hlCLf/MiLs41ShxLj3bY7o0Dld
         bh0wUxew239+fMt1944m6IYgtsunJJChnYpN+c27GXDsm5+Gx8yOdWoig+7GuAMgbjR2
         Y+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711448585; x=1712053385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Coz5QHcwkc4vvJyKILt3BgtloDsW9YU/fidz3bPl5fI=;
        b=xUD/+WFL5wBtm88v/WKWIbvYfw+MnrQTHyTJYxsiwNiww2pjaOK/yS66tMrwc3+0in
         DJveMPJhRse2QkFZu9wb+OcfKnluUkGn/azIud5wL7aZDDEn2l8yl0KMwUkAjqXoX3y1
         GmEeuxx4UZ1ycIqxGW1Ad//wkhF6DnwpRea4OsTmgC0TBZI9MlbnKZ12RIy10W4VOFd4
         djSIeOHR/cdOOa0D1qE/ZZRxaxdHGDcqNgPcJY2BLAu/mCebUn5139AC5QqovfIunu05
         w76mKob7+CCZz/VYKrT3cHjlVsOez0r3u76b7F2q/KWQ1zIFWnKL0kJzxA4RJ6WhzP+q
         uFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPighHPLn/igl/mgBmINtmAOdoe/YlS0lqZ9hcundQ5RBkHufI7wMPjZIzCf6SZiN0JOpCW8dx3Hrcrz5rfHH+t1bw1K5ctv8ZTtawRw==
X-Gm-Message-State: AOJu0YwkQJJ7HsyTC5J62VUFY+ekzcZ95BITs7AiGZ/QQBvyn2vBD5Ng
	EuO8cHGPzL6Ubd0GADhBskISYRDMkdOhgZHcTcZMgbQHZrUbWBwr+hY2PYoX6gdhsPQogd2G6pB
	l70aZglvGfERO2IaiDfvBpxD/mhqLoxAMXoJY8Q==
X-Google-Smtp-Source: AGHT+IHzeL7j+Lap+SUend6NOhzvfZN+ev2xsTWYhqeCohIsS3abfKm94TKmLelfb7+6rCNqB5JgwttmAh38+nk8EuU=
X-Received: by 2002:a25:abef:0:b0:dcb:f7a0:b031 with SMTP id
 v102-20020a25abef000000b00dcbf7a0b031mr487313ybi.50.1711448585041; Tue, 26
 Mar 2024 03:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <Zf12vSHvDiFTufLE@hovoldconsulting.com> <CAA8EJprAzy41pn7RMtRgbA-3MO8LoMf8UXQqJ3hD-SzHS_=AOg@mail.gmail.com>
 <ZgKKPyLUr8qoMi9t@hovoldconsulting.com>
In-Reply-To: <ZgKKPyLUr8qoMi9t@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 12:22:53 +0200
Message-ID: <CAA8EJpqwYrskXMLyyYwW_4e-NXPPS0+MGbumEvXXNwj0p1u12A@mail.gmail.com>
Subject: Re: [PATCH 0/7] usb: typec: ucsi: fix several issues manifesting on
 Qualcomm platforms
To: Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 10:41, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Mar 25, 2024 at 10:56:21PM +0200, Dmitry Baryshkov wrote:
> > On Fri, 22 Mar 2024 at 14:16, Johan Hovold <johan@kernel.org> wrote:
>
> > > I just gave this series a quick spin on my X13s and it seems there are
> > > still some issues that needs to be resolved before merging at least the
> > > final patch in this series:
> > >
> > > [    7.786167] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > > [    7.786445] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > > [    7.883493] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > > [    7.883614] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > > [    7.905194] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > > [    7.905295] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > > [    7.913340] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > > [    7.913409] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> >
> > I have traced what is causing these messages. During UCSI startup the
> > ucsi_register_port() function queries for PDOs associated with the
> > on-board USB-C port. This is allowed by the spec. Qualcomm firmware
> > detects that there is no PD-device connected and instead of returning
> > corresponding set of PDOs returns Eerror Indicator set to 1b but then
> > it returns zero error status in response to GET_ERROR_STATUS, causing
> > "unknown error 0" code. I have checked the PPM, it doesn't even have
> > the code to set the error status properly in this case (not to mention
> > that asking for device's PDOs should not be an error, unless the
> > command is inappropriate for the target.
> >
> > Thus said, I think the driver is behaving correctly. Granted that
> > these messages are harmless, we can ignore them for now. I'll later
> > check if we can update PD information for the device's ports when PD
> > device is attached. I have verified that once the PD device is
> > attached, corresponding GET_PDOS command returns correct set of PD
> > objects. Ccurrently the driver registers usb_power_delivery devices,
> > but with neither source nor sink set of capabilities.
> >
> > An alternative option is to drop patches 4 and 5, keeping
> > 'NO_PARTNER_PDOS' quirk equivalent to 'don't send GET_PDOS at all'.
> > However I'd like to abstain from this option, since it doesn't allow
> > us to check PD capabilities of the attached device.
> >
> > Heikki, Johan, WDYT?
>
> Whatever you do, you need to suppress those errors above before enabling
> anything more on sc8280xp (e.g. even if it means adding a quirk to the
> driver).

Why? The errors are legitimate.


-- 
With best wishes
Dmitry

