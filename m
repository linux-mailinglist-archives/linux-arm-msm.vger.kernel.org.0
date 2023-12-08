Return-Path: <linux-arm-msm+bounces-3920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35280A1A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995701C20A0E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7340F199DC;
	Fri,  8 Dec 2023 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/uljyOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B166610EB
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 02:58:41 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-db99bad7745so1975366276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 02:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702033121; x=1702637921; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n824Ftg11UPisnyIKvYMC1JirpgMCOSKCW7k95zzQZg=;
        b=m/uljyOEXZ68Sk32sdTKWY3YXQ2CZqwYJNq/wvnLDw7cFeVHq/z/DAQNtBNcAFTr21
         UQR+qvE76kVu4OqZr/Fmc4w7ezT6+r9q98vJxYv46c1PY2DtmFqQZSce4I7k28prx6a+
         jfinsfvVWL7Bb7vfobeWOcsVhn/3fJn0a3gsBYBCHJsU1f+KfGMxX6/7pPRwcKyQNGeA
         gAqDObnK7btvBEUdo8/e891O6uQQXB3AzUS05ccnu1PX0LDf32LWQTcg7vlOqR2/W7IZ
         A/RcTdP6PFd9W1uWUG75H7GJVvnoEWkFgfhVTvGu1TqNmP3CVjc2SWa/jIwEdPge5//1
         mTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702033121; x=1702637921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n824Ftg11UPisnyIKvYMC1JirpgMCOSKCW7k95zzQZg=;
        b=PTbe4VOhQWywmAf3q0Edk7qWbWr+10bZSpi6Pr+mOTXfZlbACUubhV8+BECqa7PbD7
         UmQBv4lm6zO0JY0bobnwMHFZwfo9Qd3CrpOFT+BEYHufbZdNXOeWyuV3tduyaKS6BYNB
         tzvyxH22qqQNdTbEwucMTfZ9G7tWz8MoN2A7ZBlu2zcYboykHUxKMa92AjS4jEFyj95D
         9RqWxjKCdCFjOb/ST3nsDE5MtPGPIfwUgKmg7GhclkUTkgEIahI3PQqngCTmIBrg0IpS
         zwleHCQw00s1cITxqSonJcxFjuyJOpI2aErYpvNlQQHRMElUl5QITTqEBnMMn6whiPQv
         v1wQ==
X-Gm-Message-State: AOJu0Yyn8+n/S6Zs6DPj9zRUfySDXj6Sy9arq+rr8CXmNSX+ygG5+hCQ
	rFDiJq1umeRVDwK4v8bEEPyz82QYCCuU4lDJzqoxI+3VIdxZGF74
X-Google-Smtp-Source: AGHT+IFjl1ZA5+CtMPebumjje2haB/qInHtbPFouMk9AUcPRIxZ675HV+Aqc7XjsUnqVCDSXsuJ/YEGa83H+ZxipcgA=
X-Received: by 2002:a25:98c2:0:b0:da0:cbea:dabe with SMTP id
 m2-20020a2598c2000000b00da0cbeadabemr3476770ybo.35.1702033120868; Fri, 08 Dec
 2023 02:58:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org> <ZXLWiVJYWdlwOBou@hovoldconsulting.com>
In-Reply-To: <ZXLWiVJYWdlwOBou@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 12:58:29 +0200
Message-ID: <CAA8EJpp-BsabZB3FXnFsWZBNbF7keCrOKPPg3Qb7MzE3puMFeg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several
 Qualcomm platforms
To: Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 10:39, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Oct 25, 2023 at 02:49:28PM +0300, Dmitry Baryshkov wrote:
> > The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
> > Submitting UCSI_GET_PDOS command for partners which do not actually
> > support PD and do not have PDOs causes firmware to crash, preventing
> > further UCSI activity. Firmware on newer platforms have fixed this
> > issue. In order to still be able to use UCSI functionality on the
> > mentioned platforms (e.g. to be able to handle USB role switching),
> > apply a workaround that completely shortcuts UCSI_GET_PDOS command for
> > the USB-C partner.
> >
> > This has been tested on sm8350 only, but should apply to other
> > platforms. I did not enable UCSI for sc8180x yet, it has slightly
> > different implementation, which I'd like to get tested first.
>
> Has no one tested this on sc8280xp/x13s before merging?
>
> I see a bunch of errors with this series applied to 6.7-rc4:
>
> [   11.999960] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> [   12.000430] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
> [   17.120515] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> [   17.124204] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> [   23.264792] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> [   23.264953] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)

Can you please post previous messages or is the first timeout the
first error from ucsi?

>
> Is it just broken or am I missing some undocumented dependency that is
> only in linux-next?
>
> Johan



-- 
With best wishes
Dmitry

