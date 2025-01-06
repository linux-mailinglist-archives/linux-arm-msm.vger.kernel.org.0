Return-Path: <linux-arm-msm+bounces-44050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D745EA032D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 23:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DF3B1885B0A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 22:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6901E008B;
	Mon,  6 Jan 2025 22:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oM7QdZ+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8811E009A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 22:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736203260; cv=none; b=pZA4tc0rctKEnDQBjEvKHu86DJClLB1iRr/qlSYKLGOcIQSaxnD9jiV8T7DEUoRMJqz8IGnDBvgRfnaDkM5OLnaaWn1gyzkbzPiRfDTKqXW6uQnHEumcFoVH6J5BwmX7pm8VjsKPl06XOlgFO5PcLWfwUZIpfYZHrWad3aC83gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736203260; c=relaxed/simple;
	bh=aYm4URDEQO/lzotOzZp2mj5H89M0Pd2jmDgyB7Kq3gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjRlsafGMfpnWuRW9P1AerpU61hhGO1GndfluWPA9ayTJHJzyKut0cb8LavSeNIHPx2+VeIKo6KPZVC0WvK8lhtu9b3vF1WnTbsTVCSDeraLXV6HMcS1q6m2BUNTMrex0CPdbBaxB0lt2gP3ncUd5G12YsxHwjsl2jSPVcia0zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oM7QdZ+Y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso2440601666b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 14:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736203255; x=1736808055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5di1ZJTIkSt/0vjsQI3NGZHRVROu2YShhixW2NJYijg=;
        b=oM7QdZ+YV5QeTJr9lkr4vbOTJt7RBeB4ifzoy9tSphFg19YMhstLIv6dz7k3J/BI68
         Wz7dLyn4V1+wo2Ngbm7eFzJ/MBd2G3AJtPNkcBVkyI0ggmiTJSRUU7hMlnkq5p63f2Fk
         aW4f4zeYLeJC11WSiGb0xzFl8yHhdigig1WAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736203255; x=1736808055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5di1ZJTIkSt/0vjsQI3NGZHRVROu2YShhixW2NJYijg=;
        b=kyCleKhAm5OrPxolE6M07KUMVfUq9Hk1nE3F0BpnLsHTdDh7sP8c+Pr3PsmAGTbSRN
         J6Ipm5EcjM9rKu1rWSeajTEb7et9ssXZeAZ5C/fXRrOuxxDwxetcHdKz4K6+6h8ODV6f
         whtXRQ0lsMLX44b+1lqxst5WrwWflgs6BI6uwhFlwVogPh3rYUdY3Oc8W5bUS5gh1h9H
         JOMZCB7DDSTOQ4xnaxss6QKLgFmAGLc651sSlbZ34gdFR2pn48BV/nxyc8CdijSopzqZ
         34+QOMlA2GJqvpEnbOLC8/f6H/cChz/0MLG6qjSFuY8EB35SKvnZ58rkUZPH21f7DBLb
         OrCw==
X-Forwarded-Encrypted: i=1; AJvYcCUg7ebAPMGGIfnwFu156cDoQMA5nl2nbjB8dse0Wcftc/9KF/rejyv1F1TZauuZPtP6gDPKjBYrNMmGJpcg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ar6+DtGtTIWz53+TTAxjBR9/I3RgtUAnLR41RAw5goDnNwxk
	fXj63X+Y+6YMdD2Qk1cf0+evqTCMftRrsrNtIAVgvtFuR5Uc1W0KAZPpCZ0/w940SqlPNxi8s5H
	vFQ==
X-Gm-Gg: ASbGncsxleOP7QUbXVci0raPbQWMo3uECiq4iAPAn66RsCA+FWXtGyuIqlXDphiQJ8a
	Bl+djheDaCfhvsvqseVnE/zmOuF8kHIieDh9R47nC/Rff/76zw8cnAL9IqjCt3IMyoh01bj/nQs
	gAp1gH04Mrr/DID06BdA3nbgfDlGoKX/mcdfKD15AVk2drKCeZSp6KLBX16dGczWR3k+tt9IRX2
	0Xp9ECHJkuYiaXjy24+s9ijm/JONVfRA2YkShsJcYBQDkXV1qf8iScMBxAlqqcDgmoeBaCQCPDF
	o1t3AHeapgAWm6Ijv1Sa
X-Google-Smtp-Source: AGHT+IHgJ+2Z4tBToKgzCM6H96f+1vGy2x/uYPjlq5NeeaQfvJx4hHVUNfX9IV/9ME+0yeHEYufa0g==
X-Received: by 2002:a17:907:6ea6:b0:aa6:8bb4:503b with SMTP id a640c23a62f3a-aac345f3545mr6150055866b.55.1736203255246;
        Mon, 06 Jan 2025 14:40:55 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895372sm2293198766b.58.2025.01.06.14.40.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 14:40:52 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso148154945e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 14:40:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVYnoLigEq1sek/+zJE+wIudOcFT5tPC3hPwyQe8QTJIcRw/TfVyQFsivlz8P/EyhVyzpTfhF6CdeTRFEI@vger.kernel.org
X-Received: by 2002:a05:6512:23a2:b0:542:1b86:7c1f with SMTP id
 2adb3069b0e04-54229522934mr18141915e87.4.1736202783870; Mon, 06 Jan 2025
 14:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219205426.2275508-1-dianders@chromium.org> <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
In-Reply-To: <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jan 2025 14:32:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U6t42VNFSY3Jk1XUk+O=B8VnhioQxOHMv86ZH0BqLJQQ@mail.gmail.com>
X-Gm-Features: AbW1kvYZAqrZVb37fi_gK8pn1DP2gA1RSqPKabqLChsYVb9JJqj2V46xz1vb8Rw
Message-ID: <CAD=FV=U6t42VNFSY3Jk1XUk+O=B8VnhioQxOHMv86ZH0BqLJQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>, Julius Werner <jwerner@chromium.org>, 
	bjorn.andersson@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 19, 2024 at 12:54=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> @@ -916,9 +932,8 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_m=
itigation_state(void)
>         }
>  }
>
> -static bool is_spectre_bhb_fw_affected(int scope)
> +static bool is_spectre_bhb_fw_affected(void)
>  {
> -       static bool system_affected;
>         enum mitigation_state fw_state;
>         bool has_smccc =3D arm_smccc_1_1_get_conduit() !=3D SMCCC_CONDUIT=
_NONE;
>         static const struct midr_range spectre_bhb_firmware_mitigated_lis=
t[] =3D {
> @@ -929,16 +944,8 @@ static bool is_spectre_bhb_fw_affected(int scope)
>         bool cpu_in_list =3D is_midr_in_range_list(read_cpuid_id(),
>                                          spectre_bhb_firmware_mitigated_l=
ist);
>
> -       if (scope !=3D SCOPE_LOCAL_CPU)
> -               return system_affected;
> -
>         fw_state =3D spectre_bhb_get_cpu_fw_mitigation_state();
> -       if (cpu_in_list || (has_smccc && fw_state =3D=3D SPECTRE_MITIGATE=
D)) {
> -               system_affected =3D true;
> -               return true;
> -       }
> -
> -       return false;
> +       return cpu_in_list || (has_smccc && fw_state =3D=3D SPECTRE_MITIG=
ATED);

Upon looking at this again, I realized that I can fully get rid of
`cpu_in_list` here and the whole `spectre_bhb_firmware_mitigated_list`
variable. After my patch there's only one caller to this function and
it only cares whether the firmware call can be used to mitigate, so I
can rename this function to has_spectre_bhb_fw_mitigation() and
simplify it and the caller.

I'll plan to spin this in the next day or two and also include the
proper loop value for Kryo-400 cores, since I've got that now.

I'll plan to keep Julius's review tag unless told not to.

-Doug

