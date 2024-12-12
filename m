Return-Path: <linux-arm-msm+bounces-41679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8689EE162
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 09:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A084281B60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A191D259496;
	Thu, 12 Dec 2024 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/SajMyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9804209F4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733992555; cv=none; b=q8Hl4am2VYmyWda4Q+NlR9MwzaRBvPew+mRK5Zy6hU72kOaci+dOmAtBACW/fMLeGV8TWKIw4ZMUIy+CDDujpLh2qWxUVh7MBprcdNuoqwzKq3zpe9LUaIhRE4TvVdGqyDl7FYX40UYX80o3taTyybp4BUHDbfaiIpxxhaOvnDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733992555; c=relaxed/simple;
	bh=db21H7IafGfU4Ba/14Fg/cH0FVaLE8UamDcWqR572lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8RUwDvi2GOzu/MVH4mSWWAmSJlwnEog4uFt6lbgvDSNLcReGRxWRcSCUtavd1KAnlN/+iQQa5cdbvopmWbMkAJib7Pgi0NAdAP6yCrfId368IsLDtZ0zMjSqcznwN3IwVj8AfiE3nqr+acz4kK0o0NA8VYyF563PGIEaENa5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/SajMyU; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ef4084df4cso2534627b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733992553; x=1734597353; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4TkY39P+vlg/i8AAoYjstBMabSFiAC3xgwzVs9yVaM=;
        b=w/SajMyU2L08kq2PLeiUMRYe8HHPifJ0FsjwkixkVaaxCZRP/Ajdttkc3ybGnZy0bD
         voIXCy9qmx0DIFibhRpZw2Ddf+dugcu7jnbJar1Sjh5tYXaKig3N0wtVvZLviJ6JLvxp
         f8/9j4eeGWOXlfL2o7HmnaTTAO25icq1/VSo3m8PDowhfY9SXmvg0HFNAabDqYtw2yb5
         P+9fYkqVGNWQx9d93opGoqDCmyFsfG5nzhneG+RC18WTgf9wjmCjBDOSLmtRQwgbUAU1
         cytB1qhJ0mr4ahAsYavC0TRLvcVtd40T6TCOrQ78/PF2zvf9fc+NZtFTjMxzwOZabMEm
         qfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733992553; x=1734597353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4TkY39P+vlg/i8AAoYjstBMabSFiAC3xgwzVs9yVaM=;
        b=pzmHxCYhMqTL0U50+WdcK8Y/R4QDEu06Rksm/D/qtrZFUDezuaBGRdFOubanvpcGJZ
         weR2QYAbAvjl25OGozTf3AO2o0BnT6KG4kuoUBD42KZabIT1p3yi3NSkv5sQa0TcSYl1
         ZMVk7ouHiBMrzKegG1vXRsT4PUOQz9yOF+yasJEwN7khqKwKITA4cXYmUufuQnLfLLhm
         jo1thO84F+lWEl8gAUKA4dg6mTNICXmPEHAXWHBBMfT2WwuVWYYD7lzsEsfcelLA0zpB
         syL2VpQGULHc0JIexcgGAl3nJbzMs1MiOHtCrLFeaoiiSHBku3Dg/KDHQo/AFIJp8ymd
         WGaA==
X-Forwarded-Encrypted: i=1; AJvYcCVgPFY69Zo68/NLTcLNbOYXdjrgQDqGhmn5aVQHMS+ppwrMBX/Ho4lO+f023CLRCVkuCEDXQJgi3aNHx6au@vger.kernel.org
X-Gm-Message-State: AOJu0YysT2RK+p+otoR+dkQ6kGuI2Y8HH+iqcT1ZJHTA25WI1hcqRzAh
	QpAvEQDKueTZzSgk7g7FSWYyBwXa0q8JVv2zVNH+0/NdnCKkMP6xScg27gxOI18mQolQQPzD6CF
	gnKjaGhr5qidpqBFfK22X1EOeRaCV3lVDfAOiKA==
X-Gm-Gg: ASbGncusBElAK+t6woqrwi278CmKsdRPc8xpbsK8F0UmyyyJ3Xf+yu9E0M4Q2T6xaM0
	t1Q1YapBc0Gq5bwLSThqG8IWLJ+hAcYEXJs8iyA==
X-Google-Smtp-Source: AGHT+IFvM81bKMQZqpQKs+yV21MrdBwomhfPghfgIQlB2pFu3Zgm60ERVrllI9akG7YY9Pn8fdWh1yxbF0Os2FhnUdY=
X-Received: by 2002:a05:690c:4c06:b0:6ef:710d:db34 with SMTP id
 00721157ae682-6f198a3b42emr18316177b3.5.1733992552697; Thu, 12 Dec 2024
 00:35:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com> <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com> <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
 <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
 <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com> <magmzevx4cisi5s2ytdtzsqr6klrt6wot6cex3zpxugjspdwyt@qpooycw4b2bs>
 <41f0ebb2-02b9-a83d-6a7d-3dd03fccb687@quicinc.com> <cjbdqixxxu2zrgkakcb44jnkeoktwc3vmtqauejnxjxtycqtnp@7cthmlpy5qx3>
 <a730c66a-3969-3101-1ebe-88baf6184d2e@quicinc.com> <a589d8b2-5d2e-c13d-9251-c18e1040407a@quicinc.com>
In-Reply-To: <a589d8b2-5d2e-c13d-9251-c18e1040407a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:35:43 +0200
Message-ID: <CAA8EJpoyBdm=w9_atgTaibscOWoL6tUt95Yet7oKcKUtkDy_rg@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 10:22, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 12/2/2024 8:51 PM, Vikash Garodia wrote:
> >
> > On 12/2/2024 8:41 PM, Dmitry Baryshkov wrote:
> >> On Mon, Dec 02, 2024 at 06:20:40PM +0530, Vikash Garodia wrote:
> >>>
> >>> On 12/2/2024 6:16 PM, Dmitry Baryshkov wrote:
> >>>> On Mon, Dec 02, 2024 at 05:30:55PM +0530, Vikash Garodia wrote:
> >>>>> Hi Dmitry,
> >>>>>
> >>>>> On 11/29/2024 8:05 PM, Dmitry Baryshkov wrote:
> >>>>>> On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> >>>>>>> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> >>>>>>>>
> >>>>>>>> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>>>>>>>>>> Hello
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> ----------------------------------------------------------------
> >>>>>>>>>>>>>>> Renjiang Han (1):
> >>>>>>>>>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> WHENCE                      |   1 +
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Could you please be more specific, what is the difference between the
> >>>>>>>>>>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>>>>>>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>>>>>>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>>>>>>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>>>>>>>>>
> >>>>>>>>>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>>>>>>>>>> use v5 signatures?
> >>>>>>>>>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>>>>>>>>>> far i have seen 2 categories in signing version for video bins, either default
> >>>>>>>>>>> or v6 specific tool.
> >>>>>>>>>>
> >>>>>>>>>> Can firmware / security engineers actually advice us on using v5
> >>>>>>>>>> firmware signatures with QCS615 _and_ with older platforms?
> >>>>>>>>>> Existing venus-5.4/venus.mbn uses v3
> >>>>>>>>>
> >>>>>>>>> Vikash, any updates on this topic? Would it be possible to have a single
> >>>>>>>>> FW image with just v5 signatures?
> >>>>>>>> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> >>>>>>>> the signing requirements across different SOCs, hopefully will be able to add
> >>>>>>>> something on this by then.
> >>>>>>
> >>>>>> It's been more than a week since the last email. Are there any updates?
> >>>>>> I'd really like to get this sorted out before next linux-firmware
> >>>>>> release, otherwise we'll be stuck with these names for the foreseeable
> >>>>>> future.
> >>>>> I have been chasing both the firmware and security folks to align on this. So
> >>>>> far the updates are that one is signed MBNv5 and other with MBNV6, hence leading
> >>>>
> >>>> I think the existing firmware uses v3, not v5.
> >>>>
> >>>> 00001000  00 00 00 00 03 00 00 00  00 00 00 00 28 00 a0 0f  |............(...|
> >>>>
> >>>>
> >>>>> to different set of binaries. These MBN versions of signing is defined at SOC
> >>>>> level and depends on secure boot libraries used in that SOC.
> >>>>> At the same time, there is an experiment to check if SC7180 can be signed with
> >>>>> version used for QCS615 i.e MBNV6.
> >>>>
> >>>> Thanks! Are you trying that without updating the whole bootloader stack? I
> >>>> think some of SC7180 devices might be EOL'd, so it might be hard to get
> >>>> FW/bootloader updates.
> >>> Just the firmware part, by signing it with qcs615 way, as an experiment
> >>> suggested by security folks.
> >>
> >> Ok, that doesn't sound like a lengthy experiment: resign the FW, boot
> >> the laptop, caboom or not caboom. If I remember correctly the file that
> >> you've pushed even lists sc7180 as allowed.
> > its used only for qcs615.
> some good news, we could now have qcs615 firmware as common for both qcs615 as
> well as sc7180. A PR would be raised to updated 5.4/venus.mbn and at the same
> time to delete 5.4/venus_s6.mbn.

Note, 5.4/venus_s6.mbn has been included into December release, so
ideally you have to provide backwards compatible link (unless
maintainers allow you to skip one).

>
> Regards,
> Vikash
> >>
> >>>
> >>>>> One query here - given that qcs615 only loads the venus_s6.mbn variant, and it
> >>>>> is not enabled yet (patches in review) for video, we should be good if we
> >>>>> conclude the firmware part before accepting the qcs615 enablement patches ?
> >>>>
> >>>> Good question. I think that depends on linux-firmware maintainer's
> >>>> opinion.
> >>>>
> >>



-- 
With best wishes
Dmitry

