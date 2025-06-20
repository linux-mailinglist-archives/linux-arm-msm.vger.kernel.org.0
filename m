Return-Path: <linux-arm-msm+bounces-61874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156E4AE1681
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 10:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B328F5A4FD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 08:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B5126E6EF;
	Fri, 20 Jun 2025 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q9xiXWaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D524EAA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408756; cv=none; b=NRrELppRv4ET0/gsYdiHqh79bU3gVFZnHVXARZEHsEEXtq5TSlAKMTjwSvQqZz0irapSdqj8KgI/om/FqpwDMjKlQKgyA4J7lN7IJ43f50/K5j9xtXnRw3mjevtZPyqDziVkp0jmWROvwQ24JaWXB1bDqAJ/opQOwJM5Bgkzuhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408756; c=relaxed/simple;
	bh=nW0F0O/hWqw37ehBTiHOaKNVn3q7ZPdsEdlHH98mdbM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TiL10YpdPY3HQJcd7l9pCfzcr/xK/gIoQ85504A99nxwb3/hw41TrpeFIuMdcN/DbSQGkTMht/LksE+ebJnelo2GeLKNr2ISSufoqapdL2/ZQQVkgFu6f4A7nnHUhp95Yd22Deb+FmRt4XQuDokalgURTPSwJmq7AMwGJ+oH39I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q9xiXWaU; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad1b94382b8so303282566b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750408752; x=1751013552; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V7zu0Kxpdwv0OZSUsLSOjM7ZQH3dEZE86mrHpx7mAI=;
        b=Q9xiXWaUVze6+3GxmnW8BlyGUQCfzbUuMCDHKuvU9se1IwGuIfLyzdveR2kcLu5Udn
         xBSlTM/JaO96BhWAbE4WYr2MzkknDj7NFwNZ2zqGVcLOp/JB36tJ1uLmtYDTErgwTidQ
         tmkldF6E1bTWV2zSrIeiJu4laeHtsAUdhr5m6QIb1kvRJRQZ3JVSofIYgf9SHw/kI2xL
         CMS4nO7AooBQ7lStCAXLR5+YaZU7pbcEqyFHcgmdWD7q02R3NrB5xVaYsSIsTDlxilP5
         js3OU1+BWZL55bsKeeTa9P5GHHvs1qfsewrTSmYhY6/psnV8azoc1lj+Mkd2G/oUHxpo
         Xsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408752; x=1751013552;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6V7zu0Kxpdwv0OZSUsLSOjM7ZQH3dEZE86mrHpx7mAI=;
        b=dSGV94bcuGwg28bFH7+K5V/FIQv6xkLO19N493d3jqoPyZ75a8HMGnR9D2sgsGiG9x
         NfbxEhf0ApmoCJVA1HeHynm7+5fa0TnuQtBZUUaZEcMeOLI2v0/ZRiKeDTwBaTdGO3eD
         XjacHfiobYaYZOs1C9D4PYWP5wtIzwkOmad3KixzXjP+jE+04DCzfKbF8IE1JIojk2Ma
         pVVoSYyVFApmCpCTB8mVU2zGXVeQzN0SpkojwNlhmnxArPk1WaAZC2Yx42Ppmz1adnBq
         Jl0GCXxNNsq6bzipYsu9nho2PpWFw/3YMWEhhsu1qBZfZ8jEgAN5QveEbbNpxqLyV+NF
         od2Q==
X-Gm-Message-State: AOJu0YwwvhRR0CFFJiSv89ob3gr3CPnqF2yT93X16hHjiMdpcjIrk1GS
	s1c5LRFz/IyBdIf2W6NXcVSvFP+FdKnnReH65LqxokEpRuBwk6DC1mdsCsH1wmX+aw8=
X-Gm-Gg: ASbGnctN8OWG0aDF4Gx85uHk+lnQHC6Znbutk1WIH/vHtY/le1ELvn3coQc17mY9Qb7
	walDBG2yOoIytpiStkzJaBCnYtD8xbpgzlalDj5+L5K+KbvpSEnQujbGRgO05JH7z+4RoUcjHMR
	3/3D2UuJ7Q/+MgNJfmV4+2uhEeVczf+vK02ZKtBKnp3gXfnY8drK8w6XCOVoxhOdkN/I/Y47kbE
	oGCYubtVJ9KVU4VRHO4f7AvHuVFCCbEaMbeB9ZJNUTF/Zzd2h32mvh0QlmWSVnHPV7v/wTf+kjK
	HLLhUadzYMVCbxXyoQzZWpw0ZFFClrr3rwtDBB2+SjdX+/IvL9M0Dk+0rQ/c4cg7qzrkPf3bTFw
	JXx6laGxH8/6KbWKG8szgMBhGe0VT0bM=
X-Google-Smtp-Source: AGHT+IHnn+pgrcY80rrdIAItBJEQnsl8DLBgDjOptwBLYFl+zdmUZHUQXrI9nz0s+HIckaBRB9p+5A==
X-Received: by 2002:a17:907:9816:b0:ad5:55db:e413 with SMTP id a640c23a62f3a-ae057a284e5mr172285466b.26.1750408751642;
        Fri, 20 Jun 2025 01:39:11 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e36sm123747666b.120.2025.06.20.01.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 10:39:10 +0200
Message-Id: <DAR846ZKJENY.KINMYGVYAY97@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 09/11] power: supply: qcom_smbx: add smb5 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Sebastian Reichel"
 <sre@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>

Hi Casey!

Adding a note here, I also plan to look into what (if any) changes are
necessary for this to work on PMI632 (which is the PMIC for
sdm632/msm8953 Fairphone 3) since that's also SMB5.

On Thu Jun 19, 2025 at 4:55 PM CEST, Casey Connolly wrote:
> Introduce support for the SMB5 charger found on pm8150b and other more
> modern Qualcomm SoCs.
>
> SMB5 is largely similar to SMB2, with a few register differences. The
> main difference is the new Type-C hardware block which some registers
> are moved to.
>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_smbx.c | 367 +++++++++++++++++++++++++++++++++=
------
>  1 file changed, 314 insertions(+), 53 deletions(-)

<snip>

> +/* Bits 2:0 match PMI8998 TYPE_C_INTRPT_ENB_SOFTWARE_CTRL */
> +#define SMB5_TYPE_C_MODE_CFG				0x544
> +#define SMB5_EN_TRY_SNK_BIT				BIT(4)
> +#define SMB5_EN_SNK_ONLY_BIT				BIT(1)
> +
> +#define SMB5_TYPEC_TYPE_C_VCONN_CONTROL			0x546
> +#define SMB5_VCONN_EN_ORIENTATION_BIT			BIT(2)
> +#define SMB5_VCONN_EN_VALUE_BIT				BIT(1)
> +#define SMB5_VCONN_EN_SRC_BIT				BIT(0)
> +
> +
> +#define SMB5_TYPE_C_DEBUG_ACCESS_SINK			0x54a
> +#define SMB5_TYPEC_DEBUG_ACCESS_SINK_MASK		GENMASK(4, 0)
> +
> +#define SMB5_DEBUG_ACCESS_SRC_CFG			0x54C
> +#define SMB5_EN_UNORIENTED_DEBUG_ACCESS_SRC_BIT	BIT(0)
> +
> +#define SMB5_TYPE_C_EXIT_STATE_CFG			0x550
> +#define SMB5_BYPASS_VSAFE0V_DURING_ROLE_SWAP_BIT	BIT(3)
> +#define SMB5_SEL_SRC_UPPER_REF_BIT			BIT(2)
> +#define SMB5_EXIT_SNK_BASED_ON_CC_BIT			BIT(0)

<snip>

>  /* Init sequence derived from vendor downstream driver */
> -static const struct smb_init_register smb_init_seq[] =3D {
> -	{ .addr =3D AICL_RERUN_TIME_CFG, .mask =3D AICL_RERUN_TIME_MASK, .val =
=3D 0 },
> +static const struct smb_init_register smb5_init_seq[] =3D {
> +	{ .addr =3D USBIN_CMD_IL, .mask =3D USBIN_SUSPEND_BIT, .val =3D 0 },
> +	/*
> +	 * By default configure us as an upstream facing port
> +	 * FIXME: This will be handled by the type-c driver
> +	 */
> +	{ .addr =3D SMB5_TYPE_C_MODE_CFG,
> +	  .mask =3D SMB5_EN_TRY_SNK_BIT | SMB5_EN_SNK_ONLY_BIT,
> +	  .val =3D SMB5_EN_TRY_SNK_BIT },

Since there's already a driver for the Type-C in pm8150b and pm7250b,
can we remove this? Or is additional plumbing between the two drivers
necessary to make this work? Maybe Bryan can also jump in here.

Regards
Luca

> +	{ .addr =3D SMB5_TYPEC_TYPE_C_VCONN_CONTROL,
> +	  .mask =3D SMB5_VCONN_EN_ORIENTATION_BIT | SMB5_VCONN_EN_SRC_BIT |
> +		  SMB5_VCONN_EN_VALUE_BIT,
> +	  .val =3D SMB2_VCONN_EN_SRC_BIT },
> +	{ .addr =3D SMB5_DEBUG_ACCESS_SRC_CFG,
> +	  .mask =3D SMB5_EN_UNORIENTED_DEBUG_ACCESS_SRC_BIT,
> +	  .val =3D SMB5_EN_UNORIENTED_DEBUG_ACCESS_SRC_BIT },
> +	{ .addr =3D SMB5_TYPE_C_EXIT_STATE_CFG,
> +	  .mask =3D SMB5_SEL_SRC_UPPER_REF_BIT,
> +	  .val =3D SMB5_SEL_SRC_UPPER_REF_BIT },
> +	/*
> +	 * Disable Type-C factory mode and stay in Attached.SRC state when VCON=
N
> +	 * over-current happens
> +	 */
> +	{ .addr =3D TYPE_C_CFG,
> +	  .mask =3D APSD_START_ON_CC_BIT,
> +	  .val =3D 0 },
> +	{ .addr =3D SMB5_TYPE_C_DEBUG_ACCESS_SINK,
> +	  .mask =3D SMB5_TYPEC_DEBUG_ACCESS_SINK_MASK,
> +	  .val =3D 0x17 },

