Return-Path: <linux-arm-msm+bounces-31016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1096E31E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 21:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCFEB28A435
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 19:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3F618D658;
	Thu,  5 Sep 2024 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AyqePELt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30C13D638
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 19:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725564370; cv=none; b=aZE7bveTqYOku+PQutzkWhEWaB9yiffwD9tSlYEoRtegs6DDvwz4qvITM/f9uds1CEd9aW7Ykf6iiMwGEQv1Y55ugjLjD6oFO9WxVMm9MsXLDkI+tm7Y26yeapajZrgD7h5tbroERrgY26jLwx/1H03yojn/nvN6Iq8Jk1a4h9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725564370; c=relaxed/simple;
	bh=4vFgpfjtK/VPxsidTa6Wqh8BttFa+LZ9dcLOGbtAg+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2zEvBa0rsQKBzif1+D8Msn8BJHXJlDuL1+XMMf74f2cEVarYk8Thi7ACts+KV0K59dlZABLAzcAC1iCY0kqGhqNRtZstHqjZqsiQ1p1rH5Q35glBPGstoHcUNIBDrKyMXClLoaZb8Kb2UHIeC5HaEIULWoQDb+/izOowTZCzps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AyqePELt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so1425379e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 12:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725564367; x=1726169167; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AfdgWA6UT2GtWVGKnYj43Nhc62Fa+aN7xUtJY8n+FcM=;
        b=AyqePELtPBVkXLdmbe2+vIkks0G4IaG15ZtJx+so9etcU/hFmCyBrwJpyQPLNrvcg4
         adVyooykzATbi2SUK1WVA3Qc17yWrwKiORHlGP6c0d8no8wXzdA5/73cPeb2Gg/EGmrw
         n24Nf4VwjAO9XyQEgkQbyulxd1L7FwiLh/dwWyoPBG3JgHaQNllZYgls/9kGK5k4jllu
         2u5gfEvXA49VPcrz2w7tFAVryqzry33e9GFzgSQg5To8J17YVkEL1/mQyLEukaORoSKw
         agx20RmErQFVzDCNUf8djyXN9sgd/mz5l6XIJZvDYaC65sawCiE1L7iKgVyhHmxi/Peh
         GF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725564367; x=1726169167;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AfdgWA6UT2GtWVGKnYj43Nhc62Fa+aN7xUtJY8n+FcM=;
        b=AF8EphR4n576uFVjQcbk/dN0WllGgm+pDLPlePPkyUApguf+K4THWLd/fJwRTc8oD4
         UX4sO55BYg0U5hYVoGyD3HsNEasX7nVshCEeAeuu1IqUStNbcEddQ5+FFH38M/jw3Htw
         jJAQuUYngvM5DJKHz1wR+VdwgCczk7q30SBwGgT1tV4t35bF0CQBLZmjjJZ3l9OJOwdf
         7chLLTgBAwCLxlEQDKZqOdQWXbY8eXTrQiL8DdGOrkRN8Je1/MtfifXLQ44xIM5ia3DM
         0LcgtiueLaX6IuXkIBWyvjNruaNEc4XPzp2++SJTgw4W84elMxjpAnsO+/5cj2rqopFa
         xv6w==
X-Forwarded-Encrypted: i=1; AJvYcCUN+W7eH2h6SwNAq2LAeuMwnbMGGvGSSNO8rhH3aEYhLITLsmJ2xxoYMqdN8vP43sVHrRSPHOK6QN/1dc5O@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEUvIDoucPA2PnxxK6ENNxLhqjIJ5SR1mFyPV18KOpTurAzZg
	wNISbRWBm3MoyAp7syePkqmyCA8FahLWBDSPkQGeA70JzxRCCX7S6yiHqFG6k0k=
X-Google-Smtp-Source: AGHT+IE2fxMk2SRrimdpexKNR4pqV1tl7BFlXZEtFft8Q7Xh+w/oKhS2oWrK6zsk64nUQBat8Or6bQ==
X-Received: by 2002:a05:6512:a92:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-536587a79efmr18414e87.3.1725564366348;
        Thu, 05 Sep 2024 12:26:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408593e0sm2681160e87.303.2024.09.05.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 12:26:05 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:26:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
 <87v7zagcyf.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7zagcyf.fsf@kernel.org>

On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:
> Konrad Dybcio <konradybcio@kernel.org> writes:
> 
> > On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
> >> On Thu, Sep 5, 2024 at 2:56 PM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> >>>
> >>>>>
> >>>>> As you are going to post another revision, please also add
> >>>>>
> >>>>> qcom,ath11k-calibration-variant
> >>>>>
> >>>>
> >>>> I had it in earlier revisions. The only one we could add here would be
> >>>> the one from X13s as QCom has not yet released the data for the CRD.
> >>>> Johan and Konrad were against adding this here if it doesn't refer to
> >>>> the correct one so I dropped it.
> >>>
> >>> As Kalle usually merges data with some delay it's not infrequent to
> >>> have DTS which names calibration variant, but board-2.bin doesn't have
> >>> corresponding data. The driver safely falls back to the data without
> >>> variant if it can find it. Als  usually it's us who supply the
> >>> calibration name.
> >>>
> >> 
> >> Johan, Konrad,
> >> 
> >> What do you think? Do we know the exact name and should I add it or
> >> should we wait until it's in board-2.bin?
> >
> > If we can agree on the string identifier with Kalle in advance, we can
> > add it even before the boardfile drops
> 
> There have not been really any naming rules for the variant string, it
> just needs to be unique so that it doesn't conflict with other variant
> strings. What have you been thinking?

QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (following
marketing name). Or maybe QTI_ instead of QC_. WDYT?

> 
> But please Cc the ath11k list for anything ath11k related, adding it
> now.
> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
With best wishes
Dmitry

