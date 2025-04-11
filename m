Return-Path: <linux-arm-msm+bounces-54041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F8A8621F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 17:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15F384A0214
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C259120E33F;
	Fri, 11 Apr 2025 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxId31xc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD12AD14;
	Fri, 11 Apr 2025 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386143; cv=none; b=ighlB7Ri/kTHIF0QO2cbVcJuvbimMNt+uzZ0YjXSoOO/ha4K0fHrcOUZC3QqMmzeJgznRpIeu0eGb2wK4xc6EdqfVlXsNOe+zp6seHxVBrwJyDvywcSRxr7Cj75dRg0JB+8OEc6Q65/zvLF8xGN+V3Pa6afN5rLY/ziez3zJzdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386143; c=relaxed/simple;
	bh=It2VnWFeoAs2/AO81MkBMka6daEY9+eiPuA3+Nx/GX0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WXCQUY/4Pb+fUjNW0hsU1bDoMsizkJK05l0ZCEGjFAv1lLt+5o7337AoXH4r2wR9j16f4/aqSoot3Aajis2YoggCss7p7xNxifaBMe09gVC/pnBSVRqgX/bbz70g79NZ8dNN8l3R+GAzxgfapLQkbM++GeVxJjwtIlgxTlE4998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxId31xc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so4348651a12.1;
        Fri, 11 Apr 2025 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744386140; x=1744990940; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=It2VnWFeoAs2/AO81MkBMka6daEY9+eiPuA3+Nx/GX0=;
        b=MxId31xcG0nNt8Oys25Ykt0MDpra0f1aO9oT1Uz1oKyfrU5xDroiKxkqP4eAS+ncWO
         KV28v08+R/PHe+Be+qWFn9wg9byjtaO72z5fTXs87acZvHm0NRl5sVomM+c6k70i2kp/
         woyNsDDTOA5AEvg7c7vLVsbi30TWJhPtfTC/EziYR0vj7GIExbuofcByAXvmAEk751x9
         T3RH+YgimOpsxWtyZsZ3cPVMyCsRZbCB1sfcKPY8Y2QPTaqxoRnfIJyTPzMcAlksjPr7
         6dnpO8lUPC8r6LuRV9eRrkNFYOPYyGeBJ6OZxG4jTn+mLVgviIxSRUbzpCA32TTYd+/I
         W8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386140; x=1744990940;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=It2VnWFeoAs2/AO81MkBMka6daEY9+eiPuA3+Nx/GX0=;
        b=WP+QZe5V+uj3KUAvBnJMB+7cZmJFGMZ+63WENbD6V6toF5gGxZdhWTnQljOb2y3FYe
         +lHZv7qeYr+rMa4pJdSDMigI5mmbjC8qA8G3vozwreLqOyrwMK+gQWh0LnWs63+arlu5
         XRsfIrje1BLlPBS6QOGgXLD3LRPct22t3F4kYaEjx/9xX8frNLSAfS53vdLiYr4QdFGv
         E6190ZTLUImNWij3lfasmK3yCXguIWTsP/vakTL5IB8ikIVsGxDrUSLO8Iqt/b6+QXEt
         gJeV3voG4eEW1IZsQkGm9Al2AAu+V0EmD0EZ2pvw5yM8VvaNTW2JsIWr3NQpwP+XiLX+
         VG8w==
X-Forwarded-Encrypted: i=1; AJvYcCUemsTugXoJ58B3zrq1dhk50VdJk1zc8lLlD5MFdjP4Geat5OcBkAUvRLnUwec48mGJhMBSwF3ChATAsOuk@vger.kernel.org, AJvYcCWOy4RgrwdVaybF/kZcnnkGPA596+o23cohMthl4ThEit7doIvvbDiTe2NxZepEP+3jJ0L9GILp6HGMANUX@vger.kernel.org, AJvYcCXTgjbO06ie7MYC6SltNZZeSdow/5xHHu7PnvXo5dJ2hnFIDvSJgwMUrtHQtfclUxiPucZASeU9+burNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiCCIMaPC74yEMR4UinVT3Gj+YMb8tds47qS2EJ88h42nIbfyA
	HwvcXTx/BC/4Pz6IWCe6Tquu/d84CTdMIxNx8B3SdW29PeaJJUej
X-Gm-Gg: ASbGncvbPd1DL7sS4ZXzCwFMfEPS9xDzLuPjEXwsmlFf9Pn9BwaGKjT0TtOGQYjf4qa
	ci3u366eX2dum772XOW/fInFdRAzCkgGP9f8/VAqNaoUWJmnGGlAEwp+OONtOdSDeJfViwzI3D+
	3pOwS/oj+elOWgA+7M1ysciddfDOSA9z50UsjufJbOjoGvARJcZM+ZIHX6WgDXjpjKL/+FINwIx
	V/0VPK9r0Fh2d5eSC/CpUST0NVrUuge0uiBg3nnppBZFWogkOwr90XeYqMtnUdQCsCoOOJiwvqt
	6CM8RAasZVFaF2x+V7wfMgyHF2L3Z78PJPuk6vrkWLY=
X-Google-Smtp-Source: AGHT+IEtSIaJ3H+ZraLLFCodD6/LDQvZtvBke+gPK1x5t3vsMCHDWRB4OCz2umhxenATOBcALBtRxA==
X-Received: by 2002:a17:907:1b03:b0:ac4:493:403 with SMTP id a640c23a62f3a-acad36a5b29mr264461366b.37.1744386140056;
        Fri, 11 Apr 2025 08:42:20 -0700 (PDT)
Received: from [10.176.234.34] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3d8fsm464863166b.106.2025.04.11.08.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:42:19 -0700 (PDT)
Message-ID: <995f5cd137d0b0b82a1d253cc081fe9e145738c5.camel@gmail.com>
Subject: Re: [PATCH V3 2/2] scsi: ufs: introduce quirk to extend
 PA_HIBERN8TIME for UFS devices
From: Bean Huo <huobean@gmail.com>
To: Manish Pandey <quic_mapa@quicinc.com>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	 <martin.petersen@oracle.com>, Manivannan Sadhasivam
	 <manivannan.sadhasivam@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com, 
 quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com,
 quic_cang@quicinc.com,  quic_nguyenb@quicinc.com
Date: Fri, 11 Apr 2025 17:42:17 +0200
In-Reply-To: <20250411121630.21330-3-quic_mapa@quicinc.com>
References: <20250411121630.21330-1-quic_mapa@quicinc.com>
	 <20250411121630.21330-3-quic_mapa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-11 at 17:46 +0530, Manish Pandey wrote:
> Samsung UFS devices require additional time in hibern8 mode before
> exiting,
> beyond the negotiated handshaking phase between the host and device.
> Introduce a quirk to increase the PA_HIBERN8TIME parameter by 100 =C2=B5s=
,
> a value derived from experiments, to ensure a properhibernation
> process.
>=20
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>


Reviewed-by: Bean Huo <beanhuo@micron.com>

