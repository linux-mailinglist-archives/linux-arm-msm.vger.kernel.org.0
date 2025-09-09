Return-Path: <linux-arm-msm+bounces-72873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E9B506E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 22:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B8C57A9344
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 20:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDA23054F0;
	Tue,  9 Sep 2025 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvlNrdGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275F91FE44A;
	Tue,  9 Sep 2025 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757449345; cv=none; b=qbdwFiQqxBWopsvQstym85nnBR7etSILnPmpEpMw69EWsWCRaJBl7c0NfBP2fP07H9BU+1TeNDzLYBPispdK2CPnDj7QxfuFdlO1Lai+b5rlCcGWPdJMpVSmNa1dRpRxaKJuWhOYobiRfkilo7hv8jo4lnxfZcAXxJ/gv03XE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757449345; c=relaxed/simple;
	bh=ID6pc4ieMZRwL9bHUbpq0RM92o7os70kNlOhQTkWy1o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=AlcgdQPEOiQmxj5mft/JnbRSmCXWyJ+bV/3FPkq1cVWfHXBPIAymbho+qQ3Ct1kvDFpp/lmo7qO3JDH2MHcbB9RvGVONePryvOlVEbU7V/+02CIDzyUfJz+xr3n7NrkHqJ+RBrdKUSVSkHztOPZS70eKD9GF9S2ktXJ9MnYj/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvlNrdGE; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52eb6872bd2so2671251137.3;
        Tue, 09 Sep 2025 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757449343; x=1758054143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ID6pc4ieMZRwL9bHUbpq0RM92o7os70kNlOhQTkWy1o=;
        b=PvlNrdGEYdSQn0pu9fbcgf2ReYuMsEsvIoSdtdvZoVf7KmpIaQYBybGMOjhmYamuFs
         X6uJn2fanbtGP/VwChwHa50GC/LVC6gDpJtvmkLg9+bYI9OwPo1DisYuZ1FhPdMvk8GR
         2QZjuN91tEjytinDW7H7z8ZRXsWvWF17AIUPEp8AwS4im7wMQfOxbvR4497WLuhj9eqZ
         L8YXCSPRmN2puBK5u1sGM63oRzITThB4dniHvCD6sjlcxtQzNXuM/917w8lprL35Xzt2
         ZTquaYWoCwHdtNjjr3S2VjycO1gHArR0qhDzSo5+mFjJQwjNClJx/Kpg7lpFdg99iUdh
         DLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757449343; x=1758054143;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ID6pc4ieMZRwL9bHUbpq0RM92o7os70kNlOhQTkWy1o=;
        b=ibrvGQ/2m3BcEwx92xl5P3N4rwh+lXpscYGI/KaidgwR8F5/pvjGifxFcgdHFiez0W
         WfE8E6MNdigZZlU+ocTx9QIT7qwrnot9IIZ/foPe+sZSGcoS0jSAoiGzUINRkGd8K6H4
         ieXU1i/P5jLSzkEsYChcbUnbEe4UE9vEKmTfAUL6BprAbHQTVvKYuU4A7hO2GmOuwmC9
         k5GCEzn0HOxB1+e3CvVPOaKGRayVrkS2gHVYlklDGHtlahhlLJrlIEKqG22qYKinfH2b
         lxa/lb0SPlFyjRFLfQnt/Fwt3rmiYyqYMR5d6KK94/zTVLAvKJtXHf7C1ItEoKvHU5dx
         St7A==
X-Forwarded-Encrypted: i=1; AJvYcCW3iXbyNU7MFWHMj8ZtyjlTmM7cVOC7Wfu8tbzwYEJp7sM/gaPoWiWjC4TRMS8IjRkEEWc9rumHK3X2A51D@vger.kernel.org, AJvYcCX5IIv1GJsh3X7w4Qtr4wlPKJaoexQ7lleRc1DS8p4bJFV6ZB0Fw95dqijTnSWd2BuTpptNQGDCNeRt@vger.kernel.org
X-Gm-Message-State: AOJu0YzxbWDGor2xMKTjquMLgcPQLF+br5jAsICg2tYL+fZ0SyEY2hoR
	K5LkJjsYxG1ICn1w0/MJ28tu4l8s5jRtI1XTL5RgT4lwgZ0SmyzxrORCbr45nTSn
X-Gm-Gg: ASbGnctY5rQzZ5TuXre78g4toD2fUcKM+2h9kHbGru3vYfI6U8dJQ/k7coRb2hqfvGs
	usociNnPGkRl9jdP7+xTycCEaBszEYJHra+ONpgknFPehzNzalAnn64loBx5ebzcCaXxOfQQcnD
	ADMlmuXj7/s5hXKHsVPAZdqS+MijAVOILSCqJOmG4fKi43Xct87m+jJ+ciDLRjT7iYv1YVkGEV9
	JIuqwfxOg2S47JYHQx7CqpCo1zGsLmZgRaAJJOsUwe9HARoA5mW0KRHBsiR4Sq5BCldyrk5qlOU
	rR98tIxC42ZPKrwtKAo6XoPE6KGvt7SazByzohYG4NxObBCOp3IPg+YfCjTAh7duLLmj0wb6GPB
	ntgq0fTT9HCtXLN3puiNpaaTFDPp9hL5Cb6rbltMODTE=
X-Google-Smtp-Source: AGHT+IET0cEihoPzYDrli9hVnvOSOkquH6jtJx5NYH/GU0N8fQUT9tj3olQPNw7rngs0uDi4EVYuzQ==
X-Received: by 2002:a05:6102:3586:b0:537:f1db:7694 with SMTP id ada2fe7eead31-53d100706d0mr3965895137.15.1757449342913;
        Tue, 09 Sep 2025 13:22:22 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:18:93c:9509:7066:6bc:183f:9270])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8982751bf54sm8612711241.21.2025.09.09.13.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 13:22:22 -0700 (PDT)
Date: Tue, 09 Sep 2025 17:22:17 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/3=5D_arm64=3A_dts=3A_qcom=3A_sm82?=
 =?US-ASCII?Q?50-samsung-r8q=3A_Move_common_parts_to_dtsi?=
User-Agent: Thunderbird for Android
In-Reply-To: <9e1e68e9-8bf1-4529-a2c0-3ecb2474d8d1@oss.qualcomm.com>
References: <20250905190931.27481-1-ghatto404@gmail.com> <20250905190931.27481-2-ghatto404@gmail.com> <9e1e68e9-8bf1-4529-a2c0-3ecb2474d8d1@oss.qualcomm.com>
Message-ID: <8155F2C9-1E99-457E-B4C8-9C9081D679B1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 8, 2025 1:00:29 PM GMT-03:00, Konrad Dybcio <konrad=2Edybcio@=
oss=2Equalcomm=2Ecom> wrote:
>On 9/5/25 9:09 PM, Eric Gon=C3=A7alves wrote:
>> Move common parts of the device tree to a separate dtsi in preparation =
for
>> adding other Samsung devices from the S20, Tab S7 or Note 20 families,
>> creating sm8250-samsung-common=2Edtsi=2E Also add support for UFS, USB =
and
>> GPIO keys=2E
>>=20
>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>> ---
>
>FWIW next time try:
>
>git config diff=2ErenameLimit 999999
>
>so that moving code around will hopefully generate a smaller diff
>
>Reviewed-by: Konrad Dybcio <konrad=2Edybcio@oss=2Equalcomm=2Ecom>
>
>Konrad
will do, thanks!

