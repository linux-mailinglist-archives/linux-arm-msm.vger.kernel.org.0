Return-Path: <linux-arm-msm+bounces-39949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFA9E0CCF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 21:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC069282919
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F90D1DE4F0;
	Mon,  2 Dec 2024 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fI7EW2TP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862C1DDC20;
	Mon,  2 Dec 2024 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733170253; cv=none; b=aYnhnLAVxdV/vVK9YWJR30bhQ5Dl4Kq5S7H8hCd742SFIbYhI4Xfvt1Y/f+DPG5mPhrQ4Njbo86f0Ott0ndGr8JVMpMiiUaDfBcCTtZotSAvSG1H7Q3YT4twqIzunZABuIrWQBH0c/COy0vwGUkP7ellhw2f6IpwBHqCtjtuv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733170253; c=relaxed/simple;
	bh=kNAArB6LXbmcmOSOjq556NG1kqXhHNqGalvtL/IhDHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeOljY5iRbdEcfab1leQBwVcqPhBvoEq/UKfp4kcv4uO+GYIBZ1Z4x8T231i8AeRrJfyYFGwK2+JkoSQaqs9FIdX0cXQKvVOmO4/0rDuVTsx0yOiOV10SGHuJzyIAGbYDV9mMHBITHTqP8qlEEf1ikHv9f1jaFSQ9hXggFND7RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fI7EW2TP; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29e52a97a90so1109519fac.0;
        Mon, 02 Dec 2024 12:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733170250; x=1733775050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS9Dy4ucuDnqg2UcVFwM0HWcmP9VnKvl7vCv+YPwtCE=;
        b=fI7EW2TPeenPTBvGJtJNsyHcBxAbrHWk2ocxSkw2FwiMe8c02nLPjLV3CM6+epmDMV
         dBqV81lPYxe1T9B/iu3HJrgFjrYIFuCu+Z9ApQkpLG++3z9XGPWwvD0LnwMayUmiKLaS
         t6NEprVt/8WjeU7Wk5bbboA2kDD00ffTsBqoz83u+X4f5s4x0VIxnJofUlkacKKOCrZ5
         9jq4H3Uhn4sThvjS5mHjXn9yL/opCNOmYDraau0sYVLqdHX3OhQZkC1LirwpKFwfZJ3o
         10KQuQGbZMFKUMafJq4jI7Ru7mkEtipJeUAJV1MuZ/jRQgGUhwwDaaoDrL2wwdLgSUzh
         7H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733170250; x=1733775050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS9Dy4ucuDnqg2UcVFwM0HWcmP9VnKvl7vCv+YPwtCE=;
        b=n5TVOxnCM3HOcJG+JGwAPsByhPonaymqz6WCsc7+9zpzZi3h6jKVpSzk/mmJuHHidp
         /e8X/5q+Th6h0WdZ7rq1ecxAxb60etaJfLjKnEEcM+iZ/cV8Vi6ZvEr3J0FRcKPbqZHm
         lpTIeohR0RXh+U36G281oIkXMJ1aebHu6vK0FSeXnIIX0V5S6EvyxT4htPqggpfUTnmt
         18BXVjMtFmhGTYDWNHsT3Tou95ceqKVSLgixB6L4ufk6+iu6LX4Zyc192LLQ+EBv/MCf
         ZI8ExCETyWOnhAcX1upETFxvgy1AOYlVd3UCLtk2JrdWbTj2tgxfBGLckkBM7GLzGwfH
         mlEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7jKcHIZVq4JdZ1Ec+uXRkOgxH4Xhdz3pNxrrBrPzcwdOl/PPAsQSpAtNdLtoVjWwkotOfz7b6fNAn@vger.kernel.org, AJvYcCVox9GZMxZZKfcBcOGAGljH5USyOLZ59/0aHwslYmsHoMG+1GkHZWShTD/F66X4nkPeegxW4qLQuvPqNZsI@vger.kernel.org, AJvYcCVwHLwVEogPrYW9ApEz0EnuA5CBepLZvhaZ3FWUuYxA9rJ98OJnni1VmuzKoot1ElGo8nmB62dMjih1TfyGeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS8SK43k/XCjjpWBWRe0ATvM68zj864ARcmWU5+bR1Qtmtg8vC
	p78SX+6XSfV+z+ID9Q4DgfwhVD+/aX64rTrwXrMkPPRI/GA7VfFthVEPZNKnr1+HwY4NtDUtiP/
	OoQvFqj9Y6xL3YlGyN14r6nwgOKxBWNvg+pM=
X-Gm-Gg: ASbGnct+pNpadmk0Zxl2DSa/bjAcuW548E7MmN9+bojueLsxL4yKM3IcntB9mYDerYu
	6PnDwa17hf41UlmnU9KfgIWAj0fHPig==
X-Google-Smtp-Source: AGHT+IFya8i4PUGx866RBB7MZODgNmFkVstPcLxqtKAb3QCr4N3dx7U6bFp9oMkKybjvmsO4+EHWRAa5EYLiZdgyv7M=
X-Received: by 2002:a05:6358:5bcf:b0:1c3:8f64:add6 with SMTP id
 e5c5f4694b2df-1cab15a65f5mr1137617355d.3.1733170250390; Mon, 02 Dec 2024
 12:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-3-5445365d3052@gmail.com>
 <33e14868-e6ee-45ca-b36c-c553e0dcfbef@oss.qualcomm.com> <CABTCjFCTggnU7UvqcKYq53iRLACBxWE7C1TKRi7dr42o-=0Mqg@mail.gmail.com>
 <df3e3989-f588-4e53-b6f3-bf8c36330911@oss.qualcomm.com>
In-Reply-To: <df3e3989-f588-4e53-b6f3-bf8c36330911@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 2 Dec 2024 23:10:39 +0300
Message-ID: <CABTCjFAMLOmUrr5+spyWJb_XFmwqC_wE94cHLLRrUeVZGJkJrQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 2 =D0=B4=D0=B5=D0=BA. 2024=E2=80=AF=D0=B3. =D0=B2 18:09, Konr=
ad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 2.12.2024 2:41 PM, Dzmitry Sankouski wrote:
> > =D1=81=D0=B1, 26 =D0=BE=D0=BA=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 13:41,=
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
> >>
> >> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> >>> Usb regulator was wrongly pointed to vreg_l1a_0p875.
> >>> However, on starqltechn it's powered from vreg_l5a_0p8.
> >>>
> >>> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial devi=
ce tree for starqltechn")
> >>> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> >>>
> >>> ---
> >>
> >> I really really doubt that the supplies for on-SoC PHYs were altered,
> >> given these regulators are assigned based on their specific characteri=
stics
> >>
> >
> > From rooted android system from klabit87 on starqltechn:
> >
> > ```
> > starqltechn:/ # cat /proc/cpuinfo | grep Hardware
> > Hardware        : Qualcomm Technologies, Inc SDM845
> > starqltechn:/ # uname -a
> > Linux localhost 4.9.186-klabitV6.5 #1 SMP PREEMPT Thu Dec 10 19:42:53
> > CST 2020 aarch64
> > starqltechn:/ # cat
> > /sys/kernel/debug/regulator/soc:rpmh-regulator-ldoa1-pm8998_l1/consumer=
s
> > Device-Supply                    EN    Min_uV   Max_uV  load_uA
> > ae90000.qcom,dp_display-vdda-0p9 N     880000   880000        0
> > 1d87000.ufsphy_mem-vdda-phy      Y     880000   880000    62900
> > ae96400.qcom,mdss_dsi_phy0-vdda-0p9 N          0        0        0
> > ae94400.qcom,mdss_dsi_phy0-vdda-0p9 Y     880000   880000    36000
> > 1c00000.qcom,pcie-vreg-0.9       Y     880000   880000    24000
> > pm8998_l1                        N          0        0        0
> > starqltechn:/ # cat
> > /sys/kernel/debug/regulator/soc:rpmh-regulator-ldoa5-pm8998_l5/consumer=
s
> > Device-Supply                    EN    Min_uV   Max_uV  load_uA
> > ae90000.qcom,dp_display-vdda-usb1-ss-core N          0        0        =
0
> > 88e2000.qusb-vdd                 Y     800000   800000        0
> > 88e8000.ssphy-vdd                Y     800000   800000        0
> > pm8998_l5                        N          0        0        0
> > ```
> >
> > I also downloaded kernel source from Samsung, to check its dts,
> > and it also powers qusb@88e2000 and ssphy@88e8000 from 'pm8998_l5' regu=
lator.
>
> Interesting.. could you try to forcefully shut down L5A (I doubt you'll
> be able to do so with L1A given it powers so much digital logic), or
> set its regulator-min&max-microvolt to a way-too-low voltage (vmin
> seems to be 312000)?
>
> You should then be able to tell fairly easily, depending on whether usb2
> still works after a replug
>

Usb doesn't worked in such experiment:
Here's the log:
```
[    3.541733] ldo5: Setting 312000-312000uV
......
[    3.808224] dwc3 a600000.usb: Adding to iommu group 5
[    3.823116] qcom-qmp-combo-phy 88e8000.phy: phy initialization timed-out
[    3.824323] phy phy-88e8000.phy.0: phy init failed --> -110
[    3.825916] dwc3 a600000.usb: error -ETIMEDOUT: failed to initialize cor=
e
[    3.827208] dwc3 a600000.usb: probe with driver dwc3 failed with error -=
110
[    3.828548] probe of a600000.usb returned 110 after 20399 usecs
```

