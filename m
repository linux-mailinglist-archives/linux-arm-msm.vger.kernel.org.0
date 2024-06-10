Return-Path: <linux-arm-msm+bounces-22185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7BE9020C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 13:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED2DAB26996
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31FA7E58C;
	Mon, 10 Jun 2024 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/VUPn2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B97FBBA;
	Mon, 10 Jun 2024 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718020487; cv=none; b=RESOmOlaj04Y6fQADaaKFtHWDjQQLJOUY37yPKFUpDmi/1y16XzoTSdSgIoSnHeG1BlTG3sbNVXF6bBRr3SEgDQT3OGGuBDk5kwEtzClga8yoD6Khe0gMqPY1txBT32FLbJKJs2CTf95cqOWE2ftlYfeLid3sgx8OOjsBg+Qw5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718020487; c=relaxed/simple;
	bh=tFsn0x0/FBObqd/qWDmm4Ac4v94Ee73lutcAqjDJ56c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtXAJ8pvr6qqe240RP/f3SlaieQJo11zDaw90wri4u/yrZXA1aebcVq4wirzGvd/Svjzp2fsYtT8sW1S2Vzlf0qPgXmZK1Yowf4URYg6d5vfT32Sq6j+ZyxB77YXpjVP5mcmh8J5RB5Db7s1xcbBVEv8sITe1iKaeZgO+3uRR58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/VUPn2X; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a626919d19dso951781666b.0;
        Mon, 10 Jun 2024 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718020484; x=1718625284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFsn0x0/FBObqd/qWDmm4Ac4v94Ee73lutcAqjDJ56c=;
        b=G/VUPn2XG2q/33H5H8X95CvxqKDw50XgJ/QxCnRRiqMXpCXc4Or+gwknBvpBW2Ptiz
         E0Gs4/NpGHxAneQAlYYcY9XrPv2rNTsuVa8FGXV4cMgQgOJSJi+U60G/T9tAEwxZPTuF
         VchwBiSG4mVT2atbpNnSV1pRjuGUuQRVBGMbnNMU86Ijb2V7hwjCbTN5p5Zyls/pRc86
         t6d2YzHNRKg7C7baZ5au+J5fKTVGIN+VFfUG9nvpfveQPerUFZfla0J4ddl+U/silfC9
         7tvgWXKqCEYq36bCRvL5/1YOtGJnwHda+ZmZ9Ek0GIWW88vA/cuWBxxNNXo2piwIYgfo
         XOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718020484; x=1718625284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFsn0x0/FBObqd/qWDmm4Ac4v94Ee73lutcAqjDJ56c=;
        b=acuU2x9gNya+l5hZ/8fpk0e1ne7NNivp/cxTby728Kpm5ddwZ3TikYurl394dsmtCE
         EmOqb4QDyyDMz2K31F1SJhAST3S2N6zGXf9fyVhSuKgETxOr8ZaOtH41Qs0XLYo3sMuS
         JHsfWMdUUukyUNvfqBw2nSbcEWG6Hhqy2BDynvjG/XYvHGXTTOP5zDD2f7BXlfCZbFEh
         bbPQFmsXpKuFDBo/CauamIQj6O70047HdVZyhH1WGsIGR55HdJoKKn2V9zLZMFWlNOEj
         wn7wkdneYHb+3H1B3K+il2KqFNE4gLKBkln624Lb08Tew0zIPrZiF1doNKEuu9EMnJ4p
         6AHg==
X-Forwarded-Encrypted: i=1; AJvYcCVEvnIcakfxr9lDwEL6qoVqXyWhkIPXqoba2S/P5LAGVBg/fpd8yc2vrJ8hRaeGrLXL6Z9WWJESwv5rLBP1EPikFiHJAR4Sm5d63QVhRrDp3WFoJtoJF1GG159ASVH01niIjlrG57zal68e6M9bvzOD5cJ0fRYuHEsOXUlBVe0Qancm34aYiJ45NTmJ/g==
X-Gm-Message-State: AOJu0Yw51ExoT2iT9FPqsFMJVDdX2cy1r79wduaubl1bS3sMuKUyHJ0A
	/iqoi/wIK2ag4gqxHivQoroge9BzZnIBYiL5usBD632ON+jtlpJTlxWkMgrIK72NpI8g+8xyKil
	FU1SPMqh5HAItuITpqSOIsrsl390=
X-Google-Smtp-Source: AGHT+IE2khVru4e8G4r78+VGQCZHUL1FvNUobqQ6rFka8hb4rGTSgOypy2uF7tpyhfYFbf2i7vAxHLN2y4c3YWAEFkA=
X-Received: by 2002:a17:906:f1ca:b0:a6e:7720:7e39 with SMTP id
 a640c23a62f3a-a6e772086a4mr597115166b.8.1718020483971; Mon, 10 Jun 2024
 04:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>
In-Reply-To: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jun 2024 14:54:07 +0300
Message-ID: <CAHp75Vc1Ld6NFwFnjFDFbYScsQExg13MoXXwCCXoU_2Rw6ChfQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andy@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 5:21=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On x86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gp=
io.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/timberdale.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/ssbi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/intel_soc_p=
mic_bxtwc.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
>
> This includes mfd-core.c and vexpress-sysreg.c which, although they
> did not produce a warning with the x86 allmodconfig configuration, may
> cause this warning with other configurations.

Acked-by: Andy Shevchenko <andy@kernel.org> # for Intel Broxton PMIC

--=20
With Best Regards,
Andy Shevchenko

