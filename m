Return-Path: <linux-arm-msm+bounces-25614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1892B6A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD1D1F237DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C36A158DB7;
	Tue,  9 Jul 2024 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLwlrZRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B93E158A32
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523720; cv=none; b=KFQoxjBnDMQrDNoeuIvxxlNr898IugZCg6mIn4nLAdRezMFlzFoGnrnS37nWWwR6wZyw4RaTzJgSVn/tw2GLSuq+HRxgLSqSduAaLC4Ki8upQR1w6UpWI9jEmWnqELsD7s3iSdBebirD3I23DRRm8ZVDISi5LKPSor/u/wxmCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523720; c=relaxed/simple;
	bh=cfcx6G8p3T8pC/pq4nZ7H1nIBaEARkP7ojw1BAnGFG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1ulkZEEPIGEmaIwW1WaiMz4tdh8GyVN5fUZSl7tWXmS4wylvdTADQaOdDa13gAeA25KLvfKHyZWienpbgDyRur9EaTVqkbXTy/QGcDEMnGrC2WfITBRFkCWcZIKmDi1ay14Pj6XoDjqsVi6MKpGl0G24lP0irmPbwn5+Pw7iUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLwlrZRf; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfef5980a69so5195638276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720523716; x=1721128516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GlQ34hWtefyEDU5dsZPE3mnjpMGOHGSvbEad+DgwTis=;
        b=WLwlrZRfXU4/nkeYYua6LJKjOR9j4k+LedhjrmnEGz4M/+dV19iIxybeISAeA8qJoK
         P6jcZmhyq9kePrlntRFttCA4scxKtfd+nFnsTs2NrZVWybHVQw72WMRI6cLL1A0Csipm
         DT8JvrgdEVM6MWBzIypKAM4r/1M/2Jh2d2bpgBcChRHJSm0EgYUv4LKoacc95mn5egx3
         PWFXILVWfQy38jrebqaxMoBCDRUB24V4OXnP+SJ6NYrlt7zvzOl6j2kfldwlWOsFTEwL
         2hft1E0HJSMb1GMeLhYTM2VndH5DFHWGganGRdIy+3BSiH0OSc0QTAb9/I5XYmyexh3F
         tUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523716; x=1721128516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlQ34hWtefyEDU5dsZPE3mnjpMGOHGSvbEad+DgwTis=;
        b=DkBGsxVI11oSB4jCBRM/wkDyJSwVe+Nf+XnjvaDES60ZSqtE++yHtKY0bXEe8+W3kE
         b++yoROcqmby8mmVNN/sbH787X69s5seiPwjFVR9Jkxg9JZhCClCpl4T9D3tSh6oX4Vd
         N87gOb1Jxf3ohYW5sE9NkC8RvyWNRZOnpQm6XBYcrBXaN6ls4LeMCQ0hacMZGuOpvs/G
         XJh1sghTDxnCQlO2uwRFJB7i/s/1otGv3o3yoQVDYDsu+eodHpX9pJQm3zlKaBCgLo8Z
         bmM+MZqT1H1ExB+4eRjEmJHqWuy64sKjpCMZ1f12nfNkBOIGR1XFPm3phS4e3rkT1Bvu
         SupQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB7hOb/zJek9ADQ0+KjqHmP1PrvvqkOjtTRXm3VT6yrDT7/9rehWgpD6nsPxwn2KHe9MjJdSv1Yv4d+JrPMx+H05gPd707rB9Ws8VHSA==
X-Gm-Message-State: AOJu0YxLFR7i/9/h58L5A2mFiNHnJF0BFeDyznai71oBYB2oNNAp5Gky
	z6rk1L9WmDaoNyfs8CClYIBA1nCatUZNHUo9tik4EM6QJFxinicbw7Ud7VFYc9MVQ725x2ds5hz
	rJF7UlqTOIw/Z3Kh087YTxX98R534GXHp6fH2OA==
X-Google-Smtp-Source: AGHT+IEgeYpQ++Ei1107Pb2oobiMNHnFYl3Xkll12Nu66YXrsXqO+F2PEVXSr3dncViJMvsjSPSuVJafM5bdiPbCO3c=
X-Received: by 2002:a81:9142:0:b0:643:9333:9836 with SMTP id
 00721157ae682-658f09c9102mr24651797b3.38.1720523716323; Tue, 09 Jul 2024
 04:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624044809.17751-1-quic_jkona@quicinc.com> <jgokew5qc5oxjlxvmawgkzfve4eov2shfz2ke5l4nisnidetko@ylcp4iesj3mg>
In-Reply-To: <jgokew5qc5oxjlxvmawgkzfve4eov2shfz2ke5l4nisnidetko@ylcp4iesj3mg>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 Jul 2024 13:14:40 +0200
Message-ID: <CAPDyKFqjw6i_fbgQQ_BaSgGN6FMtJShh1g-qZxOxGw4+JZM-oA@mail.gmail.com>
Subject: Re: [PATCH V7 0/5] Add control for switching back and forth to HW control
To: Bjorn Andersson <andersson@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 05:11, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Jun 24, 2024 at 10:18:04AM GMT, Jagadeesh Kona wrote:
> > This series adds support for dev_pm_genpd_set_hwmode() and dev_pm_genpd_get_hwmode() APIs
> > and support in gdsc genpd provider drivers to register respective callbacks and a venus
> > consumer driver example using above API to switch the power domain(GDSC) to HW/SW modes
> > dynamically at runtime.
> >
>
> Ulf, I discussed the concerns I had with Taniya and I think this looks
> good. Please pick the gdsc/clock patches through the pmdomain tree.
>
> Regards,
> Bjorn

The series applied for next, thanks!

Kind regards
Uffe


>
> > Changes in V7:
> > - [PATCH 3/5]: Updated the comment description in gdsc_set_hwmode as per V6 review comments
> > - Added R-By tags received on V6
> > - Link to V6: https://lore.kernel.org/all/20240619141413.7983-1-quic_jkona@quicinc.com/
> >
> > Changes in V6:
> > - [PATCH 3/5]: Added details for 1usec delay in gdsc_set_hwmode()
> > - [PATCH 4/5]: Updated commit text
> > - Added R-By and T-By tags received on V5 RESEND
> > - Link to V5 RESEND: https://lore.kernel.org/all/20240413152013.22307-1-quic_jkona@quicinc.com/
> > - Link to V5: https://lore.kernel.org/all/20240315111046.22136-1-quic_jkona@quicinc.com/
> >
> > Changes in V5:
> > - Updated 1st patch as per V4 review comments to synchronize the initial HW mode state by
> >   invoking ->get_hwmode_dev()callback in genpd_add_device()
> > - With above change, SW cached hwmode will contain correct value initially, and it will be
> >   updated everytime mode is changed in set_hwmode, hence updated dev_pm_genpd_get_hwmode()
> >   to just return SW cached hwmode in 1st patch
> > - Updated commit text for 1st, 3rd, 4th and 5th patches
> > - Updated 3rd and 5th patches as per review comments received on V4 series
> > - Added R-By tags received in older series to 1st and 2nd patches
> > - Link to V4: https://lore.kernel.org/all/20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org/
> >
> > Changes in V4:
> >  - Re-worded 1st patch commit message, as per Bjorn's suggestion, and added
> >    Dmitry's R-b tag
> >  - Added Bjorn's and Dmitry's R-b tags to the 2nd patch
> >  - Re-worded 3rd patch commit message, to better explain the HW_CTRL_TRIGGER flag.
> >  - Added mode transition delay when setting mode for GDSC
> >  - Added status polling if GDSSC is enabled when transitioning from HW to SW
> >  - Re-worded 4th patch commit message to better explain why the
> >    HW_CTRL_TRIGGER needs to be used instead
> >  - Drop changes to SC7180, SDM845 and SM8550 video CC drivers, as only
> >    SC7280 and SM8250 have been tested so far. More platforms (with v6 venus)
> >    will be added eventually.
> >  - Call genpd set_hwmode API only for v6 and dropped the vcodec_pmdomains_hwctrl.
> >  - Re-worded 5th patch commit message accordingly.
> >  - Link to V3: https://lore.kernel.org/lkml/20230823114528.3677667-1-abel.vesa@linaro.org/
> >
> > Changes in V3:
> >  - 5th patch has been squashed in the 4th one
> >  - Link to V2: https://lore.kernel.org/lkml/20230816145741.1472721-1-abel.vesa@linaro.org/
> >
> > Changes in V2:
> >  - patch for printing domain HW-managed mode in the summary
> >  - patch that adds one consumer (venus)
> >  - patch for gdsc with new (different) flag
> >  - patch for videocc GDSC provider to update flags
> >  - Link to V1: https://lore.kernel.org/all/20230628105652.1670316-1-abel.vesa@linaro.org/
> >
> > Abel Vesa (1):
> >   PM: domains: Add the domain HW-managed mode to the summary
> >
> > Jagadeesh Kona (3):
> >   clk: qcom: gdsc: Add set and get hwmode callbacks to switch GDSC mode
> >   clk: qcom: videocc: Use HW_CTRL_TRIGGER for SM8250, SC7280 vcodec
> >     GDSC's
> >   venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on
> >     V6
> >
> > Ulf Hansson (1):
> >   PM: domains: Allow devices attached to genpd to be managed by HW
> >
> >  drivers/clk/qcom/gdsc.c                       | 41 ++++++++++
> >  drivers/clk/qcom/gdsc.h                       |  1 +
> >  drivers/clk/qcom/videocc-sc7280.c             |  2 +-
> >  drivers/clk/qcom/videocc-sm8250.c             |  4 +-
> >  .../media/platform/qcom/venus/pm_helpers.c    | 39 ++++++----
> >  drivers/pmdomain/core.c                       | 78 ++++++++++++++++++-
> >  include/linux/pm_domain.h                     | 17 ++++
> >  7 files changed, 161 insertions(+), 21 deletions(-)
> >
> > --
> > 2.43.0
> >

