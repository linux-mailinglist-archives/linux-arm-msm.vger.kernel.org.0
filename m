Return-Path: <linux-arm-msm+bounces-56329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9499AA53DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 20:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4344A7A298C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 18:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9707270557;
	Wed, 30 Apr 2025 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuqcxUiG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B9226C3A9;
	Wed, 30 Apr 2025 18:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038467; cv=none; b=UyIoNXTJRet8VuwomZOwlqTsReseHS4cnUME8ULrGTXuYFNHWJEeX/ZNcmCOrNSARY9/nwCayEWSflFJ+79sFM+ViIleKCj7X1MoDq+rj+BAvjDHE2pX2eueko6JOpOZ4stpiw66l5ypjrPp7kEPgvpo9T/CVrztoJ3gD7k7zCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038467; c=relaxed/simple;
	bh=dO5xtNhi2RZ6dwIbWLUIYOG3mwkQ1Mbn9K6tUJsApy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vz8+Pm1h9tAWvN3jdUYhXThZTzuMAIuewAQCFJEFApaKrcvQZgfNqOGVJH/45GW++MfHY7Rprj8Lr5J2+AcAZwWihPXh2BK16907B5oGmQ6Z0Tssda6+Hh747LAwjpBKfNMeYWxEg/QoJ2nxncuzrz7ZxnujgUdz9R4nr4398HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuqcxUiG; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so896465ab.3;
        Wed, 30 Apr 2025 11:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746038465; x=1746643265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yQROOQ/8z6J39sRh6FPaOmwmRuzULCDCO82suAr8rs=;
        b=NuqcxUiGU0liRIqu6uI3eBo4T5tEAomJooHSGjhVbU+EE+V+M2tJgp3G0ynqU/jDVE
         drm5PNH0AF+rzEikSNzYlaLJ+MusFOZvU4pLrk4gEMLNZIQEiRC29WGuE4C4EDYOe3+p
         8FZ8lno3c9/gYAM+qDC5szKK53hv80iwBiSiKtS4ZEKJ4dcD/BqrAQJYAztVzwlhHn5X
         O31GL1DQZ4c41bW7YlbAmTk/NGJ6F2wa2QUV4UjWqsAFWj8fdKedq0xvF/BUHsqIscXb
         F54W5sBLmm+9rxpkQjE/mOMHwhhang7mUhRgsgkiF4rDhjmGrwYmW07zyIra/PDF/gzV
         ZIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038465; x=1746643265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yQROOQ/8z6J39sRh6FPaOmwmRuzULCDCO82suAr8rs=;
        b=Iu6qDS+jsbwqLIFi2fJ2bKZ7n39PlDrh8OcI3aUaLkK+PSZt0i2xPny9WU8cyDv7Qh
         IqS278py0eq6jBLcWO1sJoNFqc/fMrTUg/SJePsbsl0vBdGlSj8HGdZtio26jaKK6GK8
         NNr6kh3tjifbIH6Ms2XIVzBmR8MvVua8DLN+fB5B2EjFxg9CbjAdFwdK+qarPeRsVauN
         ChF+mu0IrU/3lm2U6l+f2GybOSyBVibhafUlRtb7dLaTNkXCd5N9YleZd7fRucb2vUpv
         XGqjajK/TF4BajhzrB8i2rZJ2SPlWvDpnQFvYc5K6UIioku2htPtNTF2q8VjmC949mXQ
         TqWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5dPo7VaogOwzGH/gvvOmHZt+1pabxBQIAS+s1e2Kpzi1yn1PIy5XBXn0UtWl80dIYlDU/VlFoNSrnSyI2@vger.kernel.org, AJvYcCV9eWRfE9Woml8QthN87eguwlIjz8Peci5WNqIPHRw+GaXC/pAq3cCwAxYsSurnGt5HcrZTb7ZZEU3l@vger.kernel.org, AJvYcCVPiGRsXASthKYfUNIrCPqCs/3t6+EdJ08wZInykAOCQuPiH+qb8todhvAyTJFRO51vj9L9ZuIL1anccinmOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzADStVcfeC0+771Pa1RnheYymZEH4azfh3LC8WUi8d0jFOzHjs
	84sSWcPIx9tXq+dLRBW3zMaPnD/nJkv+9dUvDlVe7yUl6ICHwMbca/w5V8A+C1mZ3UeLw+OpDHL
	fE4VzSP+21d/pEmm88801UCHVmek=
X-Gm-Gg: ASbGncsDi1oGiyVPJkKk/lG0HG5dquVmJc71HAJf1qvcIuXtG1lYAZrnWmsOELBfnoX
	SUKpYDpqhIz8ddXIPCx7zfIIWtdZdBgw3l6R7t8gDRgNUGL1/2V24ze2/F3W6eVEZ4dkSCt4ENY
	AbNTL8jcfpWYRKUUqwXL0KFz0L4sajkRL3Vxv0DklTSA52pKAeNG2p/RZ0
X-Google-Smtp-Source: AGHT+IFTdYx2S7PP1ynBVe1/hJjTgkjcofHeE73M1127jD1qw/zLNvWGom/8dxEIbGmOMMDuyfAlou5W4HGP5Ex5D8w=
X-Received: by 2002:a05:6e02:1a89:b0:3d8:1fe7:4439 with SMTP id
 e9e14a558f8ab-3d967ffec05mr40542955ab.17.1746038465168; Wed, 30 Apr 2025
 11:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com> <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com> <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
 <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi> <f1fcf9fb-3be2-4097-a372-a76bfba6043e@oss.qualcomm.com>
In-Reply-To: <f1fcf9fb-3be2-4097-a372-a76bfba6043e@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 30 Apr 2025 11:40:53 -0700
X-Gm-Features: ATxdqUFWSHnqCPWBHWWul9jKnD6RyuizSS6isEVI5YuIqPMbYwvAOXoUXQvDslk
Message-ID: <CAF6AEGvGEshZbSmmLZMXGiCjRdDJLa7EKN-gviw4oxcapMKN+Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <quic_jiezh@quicinc.com>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 3:39=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/29/25 2:17 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
> >> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> >>> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
> >>>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
> >>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>
> >>>>> Add gpu and gmu nodes for qcs8300 chipset.
> >>>>>
> >>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +         gmu: gmu@3d6a000 {
> >>>>> +                 compatible =3D "qcom,adreno-gmu-623.0", "qcom,adr=
eno-gmu";
> >>>>> +                 reg =3D <0x0 0x03d6a000 0x0 0x34000>,
> >>>>
> >>>> size =3D 0x26000 so that it doesn't leak into GPU_CC
> >>>
> >>> We dump GPUCC regs into snapshot!
> >>
> >> Right, that's bad.. the dt heuristics are such that each region
> >> is mapped by a single device that it belongs to, with some rare
> >> exceptions..
> >
> > It has been like this for most (all?) GMU / GPUCC generations.
>
> Eeeeh fine, let's keep it here and fix it the next time (tm)

Maybe it would be reasonable to add a comment about this _somewhere_?
(Bindings doc?)  I feel like this confusion has come up before.  Maybe
it is a bit "ugly" but since gmu is directly banging on gpucc, it
doesn't seem completely inappropriate.

BR,
-R

