Return-Path: <linux-arm-msm+bounces-36926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A065E9BB3D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21E3AB2B4B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AEB1AF4EE;
	Mon,  4 Nov 2024 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHPl7Yko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078BA18F2F0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730720111; cv=none; b=dJ/1fVuVzksxixugkDtl1GmTQ1Xa4bwKmVCpXSHCMMreXVL8Bdj8jc1kSXOts95xQfgTnkfWs2sjKUAUsnusNzt7VaH1UP7K0/UcHM2gJAGYH02g7z1sKAazcV9T3oz8m6F/hZsxPUf2JL/VNNJSwjVz/6K/jkTSkj/ptESfB/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730720111; c=relaxed/simple;
	bh=v7y3fY03KoFpdy9AC7A0PLBPjDMIEf1ClFKqwm812L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgdO07nDd43chCpTwxnMn0yh2kD89FOCFRJJkv8S4DKpMFCRaT6/kB+SThp6/PHG+J0mSps11SG9MtzBKWaqoaMtXFvAlhX+5+w0mX4txo670fj74gCVQvCQdkodbVc2wUn8tNqfjDyoTwEGo9ltpmpOv1iFA3k+n8d7CU0mohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHPl7Yko; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e3cdbc25a0so43821107b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730720109; x=1731324909; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U+q526szksjV4oUTdEUzEItSXwLxa3VoCkmyV8G7Sbw=;
        b=HHPl7YkoOdIFXuSUv5MM75eq7FWRoPgYAlBG7WJs3d/CLM1gLxW4u6i1dbDD46VBWK
         yTzjf+9PXWRwgeIP7gDyxXXF2sou9R3C1RlusxOXonneMM/cgYK+x5mRZQRoG140yFkI
         Fb+vKGRab6SyG0zAUACZeM78t84hSZuInJS45bqANScWhU23W0JofEjoZOEcCucha8dq
         NGO0E4dtazCPRnIPbuR2vjyT2KQrVMffKY4HjHeR+fQC32eIIGdIirHO2u/AW4+dhY7n
         P/dO9qFWPyXvju4KpQm9ijEOE0tqm0rVlqdn/0V7wxFb+tFYXCDoRLJk79OQnnSaMUp7
         ZB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730720109; x=1731324909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+q526szksjV4oUTdEUzEItSXwLxa3VoCkmyV8G7Sbw=;
        b=OR5GxB9i9yp0orvorvQWluH0TBFkp+X1Hr/6ODO6ffCbMh8I3lekjywa6DI/rteqTw
         +B3gGWj4dyz9fRhFAPSQg3uc+gpBwzftxFSSi4BSHdPCVU2myGFG1TFAKIODav7/NEUw
         ptfB4Lhu/mhXuOYLj8Xz2NaFfQB/CuHvob8rGiNDXGK7IHANt57v1WcbD+PgDeMH24x9
         YUK9o/+3DrTnNfgrZcxy0Mksv21ibhh/yNObcP4vEwqBVD0m4+oX7xmIhce8B5fJUE56
         q/o1rOBLMBOeLATN01AyCA5Af80TY8p41Po4oq6VwyTwywWg7n9Hnj/+cBtLl4JWJuhz
         254A==
X-Forwarded-Encrypted: i=1; AJvYcCU0Eby5AxeNdBgYDPAS09SbnqoqQVL09mKhDp6wCapXFIfMrsRIlHIZD2+3gCdGUR00FaMCIi5Zp5X1ohJ8@vger.kernel.org
X-Gm-Message-State: AOJu0YwsD0/b8SXBlI0D0gUgkjAf4K6xfEHkQpJuc8LdGjbd/UR3uyx2
	/rHfh7olUss23TQYfstZjqjEOn9zoStdCzmRTE+lgTPK9uULcL8G75UkYprUi0ef31G4BW5rRTC
	rDYfpfLFpg3c9KWHvDf32GkW60YeF2LJ2MeIUIEnD04o6qK9TDkk=
X-Google-Smtp-Source: AGHT+IG/P2mRXyw/LNVggtIlhZam9RfjN+tz6hskDj9CnkjlIOHIK1FW4HU1XswdomDcaoi15YZfNPFVGYESfvaEO6c=
X-Received: by 2002:a05:690c:4d01:b0:6e3:2b5e:918f with SMTP id
 00721157ae682-6ea64c12827mr124473837b3.44.1730720109012; Mon, 04 Nov 2024
 03:35:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org>
 <20241103-rework-qseecom-v1-2-1d75d4eedc1e@linaro.org> <02171841-acd3-4f26-987d-1376caf11481@oss.qualcomm.com>
In-Reply-To: <02171841-acd3-4f26-987d-1376caf11481@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Nov 2024 11:34:57 +0000
Message-ID: <CAA8EJpqwY+kuOV1xu4vw8pC5AFhpK+J7P9mnyLeHfaf=CJkRMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: scm: rework QSEECOM allowlist
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Nov 2024 at 11:24, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3.11.2024 4:37 PM, Dmitry Baryshkov wrote:
> > Listing individual machines in qcom_scm_qseecom_allowlist doesn't scale.
> > Allow it to function as allow and disallow list at the same time by the
> > means of the match->data and list the SoC families instead of devices.
> >
> > In case a particular device has buggy or incompatible firmware user
> > still can disable QSEECOM by specifying qcom_scm.qseecom=off kernel
> > param and (in the longer term) adding machine-specific entry to the
> > qcom_scm_qseecom_allowlist table.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 37 ++++++++++++++++++++-----------------
> >  1 file changed, 20 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 9fed03d0a4b7e5709edf2db9a58b5326301008b4..6f70fbb0ddfbf88542ff2b3ed2bc372c2f3ce9eb 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -1743,28 +1743,23 @@ module_param(qseecom, charp, 0);
> >
> >  /*
> >   * We do not yet support re-entrant calls via the qseecom interface. To prevent
> > - * any potential issues with this, only allow validated machines for now. Users
> > + * any potential issues with this, only allow validated platforms for now. Users
> >   * still can manually enable or disable it via the qcom_scm.qseecom modparam.
> > + *
> > + * To disable QSEECOM for a particular machine, add compatible entry and set
>                                                        ^ a
>
> > + * data to (void *)false.
> >   */
> >  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
> > -     { .compatible = "dell,xps13-9345" },
> > -     { .compatible = "lenovo,flex-5g" },
> > -     { .compatible = "lenovo,thinkpad-t14s" },
> > -     { .compatible = "lenovo,thinkpad-x13s", },
> > -     { .compatible = "lenovo,yoga-slim7x" },
> > -     { .compatible = "microsoft,arcata", },
> > -     { .compatible = "microsoft,romulus13", },
> > -     { .compatible = "microsoft,romulus15", },
> > -     { .compatible = "qcom,sc8180x-primus" },
> > -     { .compatible = "qcom,x1e80100-crd" },
> > -     { .compatible = "qcom,x1e80100-qcp" },
> > +     { .compatible = "qcom,sc8180x", .data = (void *)true },
> > +     { .compatible = "qcom,sc8280xp", .data = (void *)true },
> > +     { .compatible = "qcom,x1e80100", .data = (void *)true },
> >       { }
> >  };
>
> + Steev I think you had some unhappy machine
>
> And maybe 8180 Primus?

I don't think I understand this comment, could you please explain?

-- 
With best wishes
Dmitry

