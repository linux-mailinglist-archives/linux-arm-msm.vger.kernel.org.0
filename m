Return-Path: <linux-arm-msm+bounces-15177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE52888C10F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 12:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62DD42E4BF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 11:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CDD59B6F;
	Tue, 26 Mar 2024 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/E902rc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB255E58
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711453489; cv=none; b=RrhdNNwHJ4tDHErSqfo9aRPzDgX+Ku2mHDW3kx6dDnmd5ae8jU8Ek3AVUWhuJ9TQ6K5xsfmey0+hq0BOFTbnGrubuK7etqpGwnN+DGSTBluD46fvr5A61q+LB9kJCBOAIc4SKWywgvDlNHQ27BNVvv3nzREj/+bTPoQ13pXQL9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711453489; c=relaxed/simple;
	bh=TPWhwv+KRlzro9i+G8q+7WgX8bFtID9eaqSCRuZ9k0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZVuHsruRdiiwSPIMglZh2cZyvLtJB9Y+A1KoKzpKHuxDf20OLyMSRime5j32dDu6CiLAl55xdu9RNkNfebwoQB3Y8nIGLyAllW9+7y6K6I6A4jXl+PtSanst/am0tVz5v+qIf6YiORl6Uj5Y6GySoCT2ZNrsioV93Kd4qm9usY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/E902rc; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc71031680so4767057276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 04:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711453487; x=1712058287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BfBBobQhbSAjaX8cbUm1iPx6XRVWHf0Hxnofb3snX04=;
        b=e/E902rcoK6lKu76/5fKrq/W/yEWigitVZNzjK6KLES4JbcBg+jH4dTqaYpuyk8b1g
         bl+mb1KeIpFlVBNzr9Ufkznbo1zERhHC7hLS8HpUfk5X/0Sh681Dblt3Pw7dvtKwShUy
         k9zeJJGjvj77LKeWW5j6xgN/akL27HLHeKGDrEcscYKKr8KqObit7cNmDkHhIEu8l+FN
         qpdgcQpgD78hD5GwIPZ8DDRUzpS/ETzEK4m3Fh/tCZOwJJSDffk+M55B3kSxhd14PBlm
         ExKGFOJUq2upRiGaAURoBO0L3zfTz3NOALakp+baVXYqsm7ZXOSclh7IWmjx1aW3yTuU
         SpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711453487; x=1712058287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfBBobQhbSAjaX8cbUm1iPx6XRVWHf0Hxnofb3snX04=;
        b=ZonKbKy/fmGOmsV6C59nWFgHsMFcG+3YK1BCpKIKYtB5dTykVjTO7O3FzjaPJAWHzo
         AiT2n5iA4kluX4RwM1E4h1T5Cfl8MroYqmGCeKB93QY4DpwTizs5OVpV5bKWlxCbaqvs
         l7h3vtedLd+jiu3AywfzTI+ZaKqPVpTwpxtVg/WPey6dbP4fpxWG9L50v4/b71B63waI
         RsgGLlcIeEQSasswIRFlq8dXNYXXHhGcgO3n7J4yN+2bickk4ViCyMzzK2oOOcHAaqCD
         0zBZBVlN2cv6k7TblYElJ/vXi7lwe9xX6+4PzFv3soyAF3SUJ4hifLJHY5xxQiIKwD5u
         Ek5g==
X-Forwarded-Encrypted: i=1; AJvYcCWAuTbZEXiNMB7A0hrYKjsjH2mVYVDhK6VWNeezlR9uDjjbECpPyLZbajHOv0oLht4M5AwXz6diOBJT00QMCpCVNjjZt2REWKlobTaRjw==
X-Gm-Message-State: AOJu0YytCcqveLoLdLYyiuKByrcZASfsAxcg6vQCNlZfeVUz8+HvWhFA
	fUT30VIHNgqJQ89uDfRDDbH872OsrH/HF72i2dc19RwQ3+WcF1Kl6FFq29MXDPO8hPoF8OSW+7q
	P24x8bvNYlKELSn9jQPC0/G5ufhLPyDq11t9E/g==
X-Google-Smtp-Source: AGHT+IGV/IldNegl7UYglh8OXyeCtrfkDEESctYYnN7ssFWk68NS2pWqE1mYEGrxWJii7Mh94ms6U2padYaxYpTntPM=
X-Received: by 2002:a25:ac8e:0:b0:dc6:d6f6:cc13 with SMTP id
 x14-20020a25ac8e000000b00dc6d6f6cc13mr7595962ybi.20.1711453487051; Tue, 26
 Mar 2024 04:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <Zf12vSHvDiFTufLE@hovoldconsulting.com> <CAA8EJprAzy41pn7RMtRgbA-3MO8LoMf8UXQqJ3hD-SzHS_=AOg@mail.gmail.com>
 <ZgKKPyLUr8qoMi9t@hovoldconsulting.com> <CAA8EJpqwYrskXMLyyYwW_4e-NXPPS0+MGbumEvXXNwj0p1u12A@mail.gmail.com>
In-Reply-To: <CAA8EJpqwYrskXMLyyYwW_4e-NXPPS0+MGbumEvXXNwj0p1u12A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 13:44:35 +0200
Message-ID: <CAA8EJpoUwcyEkQJoX2X0tnbXZQ3F=HbcWuhsiyRdSqypyqRHNQ@mail.gmail.com>
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

On Tue, 26 Mar 2024 at 12:22, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 26 Mar 2024 at 10:41, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Mar 25, 2024 at 10:56:21PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, 22 Mar 2024 at 14:16, Johan Hovold <johan@kernel.org> wrote:
> >
> > > > I just gave this series a quick spin on my X13s and it seems there are
> > > > still some issues that needs to be resolved before merging at least the
> > > > final patch in this series:
> > > >
> > > > [    7.786167] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > > > [    7.786445] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > > > [    7.883493] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > > > [    7.883614] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > > > [    7.905194] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > > > [    7.905295] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > > > [    7.913340] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> > > > [    7.913409] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> > >
> > > I have traced what is causing these messages. During UCSI startup the
> > > ucsi_register_port() function queries for PDOs associated with the
> > > on-board USB-C port. This is allowed by the spec. Qualcomm firmware
> > > detects that there is no PD-device connected and instead of returning
> > > corresponding set of PDOs returns Eerror Indicator set to 1b but then
> > > it returns zero error status in response to GET_ERROR_STATUS, causing
> > > "unknown error 0" code. I have checked the PPM, it doesn't even have
> > > the code to set the error status properly in this case (not to mention
> > > that asking for device's PDOs should not be an error, unless the
> > > command is inappropriate for the target.
> > >
> > > Thus said, I think the driver is behaving correctly. Granted that
> > > these messages are harmless, we can ignore them for now. I'll later
> > > check if we can update PD information for the device's ports when PD
> > > device is attached. I have verified that once the PD device is
> > > attached, corresponding GET_PDOS command returns correct set of PD
> > > objects. Ccurrently the driver registers usb_power_delivery devices,
> > > but with neither source nor sink set of capabilities.
> > >
> > > An alternative option is to drop patches 4 and 5, keeping
> > > 'NO_PARTNER_PDOS' quirk equivalent to 'don't send GET_PDOS at all'.
> > > However I'd like to abstain from this option, since it doesn't allow
> > > us to check PD capabilities of the attached device.
> > >
> > > Heikki, Johan, WDYT?
> >
> > Whatever you do, you need to suppress those errors above before enabling
> > anything more on sc8280xp (e.g. even if it means adding a quirk to the
> > driver).
>
> Why? The errors are legitimate.

Just to expand my answer. We have the 'driver should be quiet by
default' policy. Which usually means that there should be no 'foo
registered' or 'foo bound' messages if everything goes smooth. We do
not have 'don't warn about manufacturer issues' or 'don't barf if
firmware returns an error' kind of requirements. We can be nicer and
skip something if we know that it may return an error. But we don't
have to.


--
With best wishes
Dmitry

