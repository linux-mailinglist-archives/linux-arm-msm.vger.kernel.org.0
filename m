Return-Path: <linux-arm-msm+bounces-61272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E2AD95C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2574817E886
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AAD22370A;
	Fri, 13 Jun 2025 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEAR26wY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1FA220F47;
	Fri, 13 Jun 2025 19:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843921; cv=none; b=LoYSTVAMJHFpyarrTX/3zCKtTaliFXM9fZiW/TGtNUr5D6C/YZfQdpiF2XVyuxKH1F7yXwTCHLnKs7C/FqLmRfKH89G4+uYqbz298Da0x2+7zxEc7Nz6AWhWant7Wy7uPF/gxc9wgvi3rHT+u+u1dVtZmAqPYJeGGxYgULPfsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843921; c=relaxed/simple;
	bh=Yh7CDMY7zhVuwkLIdCkcnqO9gsEcVQzTOnr84L42C7s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GaeW3g2Jgjqt3AR8dlks/Rz0bzd4ggFYM4iXAd7hlYz/+aqRH3nr84aLh0qjQS/tiVMakc8nhnIZ0u+D8CaW63trF4L+s1o0kzvr+W8I27r2hXKrzb9BYksW24eTgbEFFMEIQol+ZljyBxI9AXt188SauxSgD0Os8kHFm14MWYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEAR26wY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so6473755a12.0;
        Fri, 13 Jun 2025 12:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843918; x=1750448718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yh7CDMY7zhVuwkLIdCkcnqO9gsEcVQzTOnr84L42C7s=;
        b=YEAR26wYwCMkVVGcZaEg2tytzguot0VT8pBeIoq0ZcolvNcdM6mMtp+wwWgSAiJ3PW
         +2+M0f1q8ZC+uTxDWnuq6w51KkQo+cJ3K+BPZnDRaaXbWp9F5u9tkyxm5bOMp5UPs40p
         HLdTS14vmpa/ualvLvvw5obuLxDEKNMHzTovDrVNJSqDOtlNr4QBwQPZH0HqBETIKWz6
         O+0JFsldbipfLH7Iz89cpNIAuvfDdlUXknINOfw0BLpide3m+LGsg0VxHZhRPSsot+58
         HVsu7ao93ZljPkqKf2Ku5XxMBomc4Bx2AqMcfQzY1i7NGjRR80k0j3S4JfrcseP53zGW
         RHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843918; x=1750448718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yh7CDMY7zhVuwkLIdCkcnqO9gsEcVQzTOnr84L42C7s=;
        b=a8TKgmUR1rTyH5NcHV9HkYSIFeubrpWqDXqyDxgAtQn0YTeb7iJh7d+ajAPeJIijFC
         TNVSRu+h5K7Hc8zMq47sgHG4OW2kITey6y+QSgQqlCgjj3HStubkHGZW8e/cuwwTfUQQ
         TEJBz29+Hx+FiE7vDaVoRubSF8q/bjYqalqnrUahwh/Y1SD/y7wGfIz2qHEHo6Gj4hLg
         bCfVatqzfBcDCxJf7D3HnV35QF8DPbIR+kLTCycsaOX+6syXthhQ/byZwOE3ULXnD7t7
         zFrUia3IEDPSGDy7+pnjAjT8kmY2OGkmBI0N/C9clWHiZiMMwd3rmof1SXDDy6djhIJ0
         i3kg==
X-Forwarded-Encrypted: i=1; AJvYcCV6A6ihPTvg4I67/lpT55jDouyJoe2Id1ERmL6krUDRUkmZV40P+6mD8iAAIYhAXwldjGimTAvUo4Vw@vger.kernel.org, AJvYcCWBrvzGBR78cE+5+s5pmtGAqc7NfYD5f4ZxDyrh6k0A0ueDgttgjBFLFaOi1H5iNiWzbt/owDHyeuT34agkFg==@vger.kernel.org, AJvYcCX1Nl3H4qLYdnj9mmR3ykjJNSZxyZvZXwPL00mY0xu5CdzZLClNkkJg7VMxoJRxxwyZHPiDRyQs6/ezHRkX@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPWTaHJTUudOV114TVy6hdSVj5RT8wTuax0jdzWhkdKbsbqJc
	bRV7JLMI1PzJvgDjm3VZc1J60hKNxTCIf1yykJzanR5sJP1P8Cf3VC77
X-Gm-Gg: ASbGncuTYDznEMQBB7vXEc6RFVeK1L0hwOz5vciEeCpbIHNvbA273MR0Jgx5uj4oYNf
	ScfzJFSsM59BSgToHJLYHGQWlvL403QKL3P1Kyv6e4l+HZirDUJqBx5kpz/5C9LT/Y76sFCfCzr
	HNKx2nJEFaSqDC+qKg1plXKWcmaoal497mw8LIcyi5xWZnKB+bwMmZ38r8pr4m6y2YRa8YaWX9w
	sXsUErfisoXKss5x7dI1GWtr/fHlp6Elt5i3gyvG9WffnTOvVX2HxmV+dEHk2+ZiqlnDwKVztic
	ln6e6oYYRiIV1c9FpGOFfrlX15AnfTnkiMhNJxn9xJ2KrlnntPnN6DQTxj+HPy6dH/1vmUMVBXk
	=
X-Google-Smtp-Source: AGHT+IF6z6qUjSoRJkdCpZJ9gUQ+bcq/eU0vQiN2mvd8PVrsm86gtKRwcAsm8FThCuyMb+x13CdxpA==
X-Received: by 2002:a17:907:3c90:b0:ade:3413:8792 with SMTP id a640c23a62f3a-adf9c02dc6dmr94078666b.8.1749843917916;
        Fri, 13 Jun 2025 12:45:17 -0700 (PDT)
Received: from ainazi.localnet ([2001:9e8:1ad:9f00:925:9e86:49c5:c55f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe907sm176790666b.93.2025.06.13.12.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:45:17 -0700 (PDT)
From: Shinjo Park <peremen@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: qcom: pm8921: add vibrator device node
Date: Fri, 13 Jun 2025 21:45:16 +0200
Message-ID: <5021407.31r3eYUQgx@ainazi>
In-Reply-To: <6bd88bc5-c1b4-4ae9-b631-93b208e9862f@oss.qualcomm.com>
References:
 <20250613194004.19390-1-peremen@gmail.com>
 <6bd88bc5-c1b4-4ae9-b631-93b208e9862f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi all,

I am very sorry for annoying through multiple messages, I mistook the SMTP=
=20
result code as "failure" while it was successful.=20

Best,
Shinjo

2025=EB=85=84 6=EC=9B=94 13=EC=9D=BC =EA=B8=88=EC=9A=94=EC=9D=BC =EC=98=A4=
=ED=9B=84 9=EC=8B=9C 41=EB=B6=84 33=EC=B4=88 =EC=A4=91=EB=B6=80=EC=9C=A0=EB=
=9F=BD =ED=95=98=EA=B3=84 =ED=91=9C=EC=A4=80=EC=8B=9C=EC=97=90 Konrad Dybci=
o =EB=8B=98=EC=9D=B4 =EC=93=B4 =EA=B8=80:
> On 6/13/25 9:40 PM, Shinjo Park wrote:
> > Use the same definition as pm8058.dtsi. Since vibrator is used only by
> > some devices, disable it by default and let it be enabled explicitly.
> >=20
> > Signed-off-by: Shinjo Park <peremen@gmail.com>
> > ---
>=20
> This is the third time I receive this patch within 5 minutes - please
> check https://lore.kernel.org/linux-arm-msm/ to make sure your emails
> reached the outside world
>=20
> Konrad





