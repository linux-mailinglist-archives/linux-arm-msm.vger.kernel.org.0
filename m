Return-Path: <linux-arm-msm+bounces-21898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6308FE4BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2584283018
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A162E639;
	Thu,  6 Jun 2024 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rtyqaBTM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB5194C8D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671277; cv=none; b=kVHsF7Y2398/3/M1zZmMMMtUQNwoy45XvXpM1nBvJeLVtyjwzOhYNHkNSwzpUxgM/x26ocq5B7Ek7flmuPhg2AJ4fgMibzi9FwsNUpxfPMm0MiivhvqiQ5OJ/HIRsd0QIMla9b1goj2t/flpNDDa8ZozkDJR3u2rR9iGJ6zO6Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671277; c=relaxed/simple;
	bh=bDtMSsjCrJv2kaYS9z4BBdUYh74RR91gmQdy0rI8Xg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPLXb2OghGxNGWzr1Jc/pb1ziTd8XSXBbNk8h26xvDM1DZWdP1quExxtenBN1jCiekMRyZ1Le+pExEA70K7xUg3uPmVkToRNAZ5gyfWEkarQyccnHK/7YA6ZuR7ZwkQhKtj9TSmscrwrNw+kmzvdsVGcBBsk2+f+cTFySfULRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rtyqaBTM; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfa7790b11aso848734276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717671275; x=1718276075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SsGwWh0yCq6rqI6nRsTk0y057hD2XpDmpnkIc4MhpBo=;
        b=rtyqaBTMEaEoXpaj6cxcBSSgyN8YCZhT4Vahc0GxNrO/op44lkUb2ORz5d1sdXjLLY
         zmhwLc4jHuf52hLTfeDRfwoTZlxQyU8fcRfRbD3Of+2OIoPAyQon0HhnfUUAe4726lN+
         RKFNtWEF+s1rYeNYJdHYREECcz9NC8ksndpY1oPAihsefMbeJ2EPDhB3AJBQ3NltMp0A
         QIUV9Bul0KD+AXyq+TGcq4gk0pstjhOKK8uDztxCso3c0KjU7vCuD/pid5IjYZGoiQEP
         vo8xYvTV5tPEq6sX1wpL81iN8GrnWOerQGnJMpw7pM9mDFsEn8mPfsEumnNjU+KEtPyW
         b2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717671275; x=1718276075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsGwWh0yCq6rqI6nRsTk0y057hD2XpDmpnkIc4MhpBo=;
        b=ZS1tuz5kHluRakRfNWeLwgEWM1gvb2MTemffx0yRz+nHVf92s0sQTJyXjaf+VNJ/cJ
         8uOiKoOLKJiyHq3bk2TYKT+/4vBWHUL9xrKeQUsIJFY/ZzMIXqHTkXv2K4UOpPAXIuEd
         QD49ElRNF07ZmQtEO6GM1E45/LNTSRyn9qjYcDtjSABFYdZ+NqS1p+zTNJ2I4ACoftSC
         HX7Ner7MEvoBG7MqB6GeIltbOFNzBs4vcL6sOnJmPmTIyZcXbbdAEZlS1qv2MSmd//Dy
         0VUCCZMVgPIABWpgFwInovGDZCD2B80KWDfMFJdNy9asL7He2aWIFYuNNvEUcxlX9Apg
         xPOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRbVd/A5SgcwjdmLQzjukGD/wtXEyAHFBePvZRP7fEBldFjjTbcpyABilpWBxJK94Rt43po9QV7GL82bzPnO639THN+ZQ+mDyQsi7fyA==
X-Gm-Message-State: AOJu0Yy18jlR5z03tmQpsstbmraYbvfiNJyaEDiaba0KJb1jbw5T6X8t
	UOaFGhrOQtAgMstMqQMFRmAfWgXy9BLnXhRx7CNk3VrDEDeqfMwroDQCuXu/hmxl5HF3VxAI0Px
	Jd2tDsKnmFYIyjmm9G4HGkynh5jedmwWAieXeZQ==
X-Google-Smtp-Source: AGHT+IFNLc+ltFH+0wN5wuytvpqw2EAoAJhel8QWVAOCP2hKprtdqvCTgve/Lftj00d2VatyWyXAnLPPIUsw+VbvyMY=
X-Received: by 2002:a25:8012:0:b0:df7:887b:abfb with SMTP id
 3f1490d57ef6-dfaca9ba7demr5236764276.15.1717671274604; Thu, 06 Jun 2024
 03:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
 <20240529100926.3166325-5-quic_tengfan@quicinc.com> <s5gt3p6zsd5ebrkop4dhd33tykln33f6ahu3pibymecxsmakyd@lg5wfgec6dat>
 <205de8b7-507f-45c9-83ce-6eceb1466cb2@quicinc.com> <CAA8EJpqFq=6YFcUpjdkKikN54iQ76i8Rk_z+mLH1Tt0zFFmciQ@mail.gmail.com>
 <89c5c663-df8a-43d4-91b3-0a84b0c9a324@quicinc.com> <CAA8EJpoBi+iWeZz3JLQkRXCTP-9xnCV1hGAGr8J37W=GUd5CPw@mail.gmail.com>
 <783099ed-e19b-4313-bc92-e0cddee09203@quicinc.com>
In-Reply-To: <783099ed-e19b-4313-bc92-e0cddee09203@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jun 2024 13:54:22 +0300
Message-ID: <CAA8EJprgUB-JicFzJGmtwXufunEu1J5HvsDZea3+1OEkq14Jpw@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
To: Tingwei Zhang <quic_tingweiz@quicinc.com>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com, 
	Qiang Yu <quic_qianyu@quicinc.com>, Ziyue Zhang <quic_ziyuzhan@quicinc.com>, 
	quic_chenlei@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Jun 2024 at 12:27, Tingwei Zhang <quic_tingweiz@quicinc.com> wrote:
>
> On 6/3/2024 3:52 PM, Dmitry Baryshkov wrote:
> > On Mon, 3 Jun 2024 at 10:38, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/31/2024 4:38 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 31 May 2024 at 11:35, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 5/29/2024 11:18 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, May 29, 2024 at 06:09:26PM +0800, Tengfei Fan wrote:
> >>>>>> Add AIM300 AIoT Carrier board DTS support, including usb, UART, PCIe,
> >>>>>> I2C functions support.
> >>>>>> Here is a diagram of AIM300 AIoT Carrie Board and SoM
> >>>>>>     +--------------------------------------------------+
> >>>>>>     |             AIM300 AIOT Carrier Board            |
> >>>>>>     |                                                  |
> >>>>>>     |           +-----------------+                    |
> >>>>>>     |power----->| Fixed regulator |---------+          |
> >>>>>>     |           +-----------------+         |          |
> >>>>>>     |                                       |          |
> >>>>>>     |                                       v VPH_PWR  |
> >>>>>>     | +----------------------------------------------+ |
> >>>>>>     | |                          AIM300 SOM |        | |
> >>>>>>     | |                                     |VPH_PWR | |
> >>>>>>     | |                                     v        | |
> >>>>>>     | |   +-------+       +--------+     +------+    | |
> >>>>>>     | |   | UFS   |       | QCS8550|     |PMIC  |    | |
> >>>>>>     | |   +-------+       +--------+     +------+    | |
> >>>>>>     | |                                              | |
> >>>>>>     | +----------------------------------------------+ |
> >>>>>>     |                                                  |
> >>>>>>     |                    +----+          +------+      |
> >>>>>>     |                    |USB |          | UART |      |
> >>>>>>     |                    +----+          +------+      |
> >>>>>>     +--------------------------------------------------+
> >>>>>>
> >>>>>> Co-developed-by: Qiang Yu <quic_qianyu@quicinc.com>
> >>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> >>>>>> Co-developed-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> >>>>>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> >>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> >>>>>> ---
> >>>>>>     arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >>>>>>     .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 322 ++++++++++++++++++
> >>>>>>     2 files changed, 323 insertions(+)
> >>>>>>     create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
> >>>>>
> >>>>> [trimmed]
> >>>>>
> >>>>>> +&remoteproc_adsp {
> >>>>>> +    firmware-name = "qcom/qcs8550/adsp.mbn",
> >>>>>> +                    "qcom/qcs8550/adsp_dtbs.elf";
> >>>>>
> >>>>> Please excuse me, I think I missed those on the previous run.
> >>>>>
> >>>>> adsp_dtb.mbn
> >>>>
> >>>> Currently, waht we have released is adsp_dtbs.elf. If we modify it to
> >>>> adsp_dtb.mbn, it may cause the ADSP functionality can not boot normally.
> >>>
> >>> Released where? linux-firmware doesn't have such a file. And the modem
> >>> partition most likely has a different path for it anyway.
> >>
> >> Firmware releases can be obtained from
> >> https://qpm-git.qualcomm.com/home2/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git
> >> after users sign up for free accounts on both
> >> https://qpm-git.qualcomm.com and https://chipmaster2.qti.qualcomm.com.
> >
> > I'm getting 403 when accessing qpm-git (both with my Linaro
> > credentials and with gmail ones).
> > If I try to git-clone the URL you've provided, I'm getting "Not found"
> > when using a gmail account and CURL error when using Linaro
> > createntials.
> >
> > error: RPC failed; HTTP 302 curl 22 The requested URL returned error: 302
> >
> > Not to mention that the URL wasn't mentioned anywhere beforehand. So I
> > can hardly call that 'released'
> >
> Hi Dmitry,
>
> Let me elabarote the way to get access to firmware of aim300.
>
> Visit the website Qualcomm used to release software which is
> chipcode.qti.qualcomm.com.
> Use sign up to create a Qualcomm ID with email you have.
> Login with your Qualcomm ID. Search for Qualcomm_Linux.SPF.1.0.
> This is Qualcomm Linux release. Select
> qualcomm-linux-spf-1-0_test_device_public. You should be able to find
> the firmware release. You need to agree PKLA license during this process.
>
> After that, you can edit ~/.netrc to add your username and password
> which you just create as Qualcomm ID to chipmaster2.qti.qualcomm.com and
> qpm-git.qualcomm.com.
> git clone
> https://qpm-git.qualcomm.com/home2/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git

Cloning into 'qualcomm-linux-spf-1-0_test_device_public'...
Username for 'https://chipmaster2.qti.qualcomm.com': dbaryshkov@gmail.com
Password for 'https://dbaryshkov@gmail.com@chipmaster2.qti.qualcomm.com':
warning: redirecting to
https://chipmaster2.qti.qualcomm.com/home/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git/
error: RPC failed; HTTP 302 curl 22 The requested URL returned error: 302
fatal: the remote end hung up unexpectedly


> Firmware package is under
> qualcomm-linux-spf-1-0_test_device_public/QCM8550.LE.2.0/common/build/ufs/bin/QCS8550_fw.zip.

The licence file is not present inside the repository. So after
clicking through it it I have no way to check the terms of the
licence.

> Unzip this file. Firmware is under QCS8550_fw/lib/firmware/qcom/qcs8550/

Is there anything specific to qcs8550 vs sm8550? If not, it should go
to firmware/qcom/sm8550/ instead.

However, back to the original question. We are looking for the
unification of the firmware names, not for the further diversions of
them. Few weeks ago we got another ping from arm-soc maintainers to
stop including firmware-names into the DT files. From my point of
view, no matter what file name was used in the binary release, please
use adsp_dtb.mbn for upstream submission.

> >>
> >>>
> >>>>
> >>>>>
> >>>>>> +    status = "okay";
> >>>>>> +};
> >>>>>> +
> >>>>>> +&remoteproc_cdsp {
> >>>>>> +    firmware-name = "qcom/qcs8550/cdsp.mbn",
> >>>>>> +                    "qcom/qcs8550/cdsp_dtbs.elf";
> >>>>>
> >>>>> cdsp_dtb.mbn
> >>>>
> >>>> CDSP also as above ADSP.


-- 
With best wishes
Dmitry

