Return-Path: <linux-arm-msm+bounces-3485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7952E80614D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 23:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36155281E1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 22:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B576FCEF;
	Tue,  5 Dec 2023 22:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XZ050uQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EEA122
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 14:04:26 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9f62fca3bso45999181fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 14:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701813861; x=1702418661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5alETUhzLBA8tnENs+ZYtrYNqu05J/iFPPwE+W2F73g=;
        b=XZ050uQxQ6YfUtloUNmPnLDxvfsLj9e8T1Ueu50PKVkR/ciR4ZRPg8G9YdwFj6L4Mu
         zszP/gsr7CrkcmzCEuhuTOKNF2ZX1R4D6MSEbiECnua79okv23Y/97gviL6rn5cftY1Z
         yQ99cmEMKbWBjICGhO/K7kJgB9/9Fja7CPgdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813861; x=1702418661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5alETUhzLBA8tnENs+ZYtrYNqu05J/iFPPwE+W2F73g=;
        b=coGBYjRWNhzSKHmWvbCy2OVY0OqyyslE40xNBxrB9hBYyoxMbDteKmFJvn6MS5mAs/
         5c/rX3wO2ywd1jP3C142+rI5OoDhCKyBSoCoxHe0MyASkEA+bXyL5lADCK7Pc2odnio9
         3NA67tRnLkkPYr4zJGb7CIOfts7qWTiOZAztACG0uodrjyqIepUP/K4+n5rRUjZR41J6
         q/dRNcPjqVgP1uLgTr/4Dz70/fGabB3QHuYwFLFWuFsPFayt+yfuFlUghd2+kv0KWHlq
         /iIpITtq2l+tbY7Jdd8aODbbB0xaG/8jWF/jUpB4d4J/bfLKUmk3h+1kVIMskwQCHmUG
         WAfw==
X-Gm-Message-State: AOJu0Yx8uLsIkU2+g5Zt/DItdOnb8k1lBtGWUZy3yN57XIfhHo+WiJGj
	P9r1KMcY8qljJquDEMHqFe927yT4DORewcVd5erPdB3J
X-Google-Smtp-Source: AGHT+IFd5QrGz4VkNgnZ8ywX9R91xmiv3R/r0pYEXbZRkXBRoNey+GF4CO1xiP/r68m4jLcrCm+sXg==
X-Received: by 2002:a2e:9586:0:b0:2c9:f734:7021 with SMTP id w6-20020a2e9586000000b002c9f7347021mr2674265ljh.3.1701813861603;
        Tue, 05 Dec 2023 14:04:21 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id g5-20020a170906198500b009c5c5c2c5a4sm7286916ejd.219.2023.12.05.14.04.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 14:04:21 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b51e26a7aso6345e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 14:04:21 -0800 (PST)
X-Received: by 2002:a05:600c:4e8d:b0:40b:33aa:a2b9 with SMTP id
 f13-20020a05600c4e8d00b0040b33aaa2b9mr25903wmq.4.1701813858451; Tue, 05 Dec
 2023 14:04:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103105712.1159213-1-quic_adhudase@quicinc.com>
 <20231103193345.GY3553829@hu-bjorande-lv.qualcomm.com> <5e83d947-c77f-9318-4a4c-377a8304b8fd@quicinc.com>
 <CAE-0n50HwE+gNYotYXduer3b=O+c3ZWLC_8gEmpo0KQmtzmNvQ@mail.gmail.com>
 <d1e3adb5-b179-a119-fc0c-f92c2b84c7c2@quicinc.com> <SN4PR0201MB8806AF236D696E15CDC6400CF9A9A@SN4PR0201MB8806.namprd02.prod.outlook.com>
 <CAE-0n50kf82BLXPAAUN+kba9osA-gEetm96tS7aRVzUUNHbCgQ@mail.gmail.com>
In-Reply-To: <CAE-0n50kf82BLXPAAUN+kba9osA-gEetm96tS7aRVzUUNHbCgQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 14:04:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7pjg=vfrkZg4i=YaKpoNT+_hX_3tgDz8VQiH+OquOTQ@mail.gmail.com>
Message-ID: <CAD=FV=W7pjg=vfrkZg4i=YaKpoNT+_hX_3tgDz8VQiH+OquOTQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc: Fix dis_cap_alloc and retain_on_pc configuration
To: Stephen Boyd <swboyd@chromium.org>
Cc: Atul Dhudase <quic_adhudase@quicinc.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Mukesh Ojha <quic_mojha@quicinc.com>, "agross@kernel.org" <agross@kernel.org>, 
	"andersson@kernel.org" <andersson@kernel.org>, 
	"konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>, "isaacm@codeaurora.org" <isaacm@codeaurora.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 9, 2023 at 12:34=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Atul Dhudase (QUIC) (2023-11-07 07:27:54)
> > Hi,
> >
> > On 11/7/2023 6:46 PM, Mukesh Ojha wrote:
> > > On 11/7/2023 3:25 AM, Stephen Boyd wrote:
> > > > Quoting Mukesh Ojha (2023-11-05 22:54:28)
> > > >>
> > > >>
> > > >> On 11/4/2023 1:03 AM, Bjorn Andersson wrote:
> > > >>> On Fri, Nov 03, 2023 at 04:27:12PM +0530, Atul Dhudase wrote:
> > > >>>> While programming dis_cap_alloc and retain_on_pc, set a bit
> > > >>>> corresponding to a specific SCID without disturbing the
> > > >>>> previously configured bits.
> > > >>>>
> > > >>>
> > > >>> As far as I can see, the only invocation of
> > > >>> _qcom_llcc_cfg_program() comes from qcom_llcc_cfg_program(), whic=
h
> > > >>> is only called once, from qcom_llcc_probe(), and here also seems
> > > >>> to only be the single write to these two registers.
> > > >>
> > > >> It does not look to be single write but the write is for each slic=
e
> > > >> in the same register which was overriding other slices values.
> > > >
> > > > Can you add that detail to the commit text? What's the seriousness
> > > > of the issue? Why should it be backported to stable? Is something
> > > > seriously broken because a slice configuration is overwritten? Does
> > > > it mean that some allocation made in a slice is being lost over
> > > > power collapse (pc) when it shouldn't be?
> > >
> > > @Atul will update the commit text as per suggestion.
> > >
> > > And yes, without this change, retention feature will not work properl=
y.
> > >
> > > -Mukesh
> >
> > Does this commit text make sense? If so, I will update patch accordingl=
y.
> >
> > When configuring capacity based allocation and power collapse retention=
, writing to the same register for each slice caused overwriting of the val=
ues for other slices, leading to misconfiguration for majority of the slice=
s.
> > To address this, only modify the bits associated with each slice while =
retaining the values of the remaining bits, as they were prior to the Linux=
 configuration.
>
> This commit text doesn't say what, if anything, is broken. Does it save
> power when it didn't before? Why is it critical to backport this to
> stable kernels? Was the driver overwriting other bits in this register
> that were critical to power, performance, or correctness? Or was
> everything working out because the last slice to be written was the only
> important one?

Whatever happened to this patch? It seemed like it might be important
and it never landed. I guess the only thing that was blocking it from
landing was some commit text that explained _why_ it was important and
that never got written.

I guess Bjorn was also worried that any bits that weren't updated by
the kernel would now be left in their default state (however the
bootloader left them). It would be good to indicate in the commit text
if that matters and what is in those other bits.


-Doug

