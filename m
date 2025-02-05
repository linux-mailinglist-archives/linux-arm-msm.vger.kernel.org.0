Return-Path: <linux-arm-msm+bounces-46982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC23A29A92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 21:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4CD1693CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 20:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51F31E0DE4;
	Wed,  5 Feb 2025 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Db4qn0Ya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28669F510;
	Wed,  5 Feb 2025 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785791; cv=none; b=tV5SvFfZ6t5J6EzwADDe4LNrQcx3HMOm6kvhwbRTTtenul1Z4JDdqoGK26upPfiosCBIPYuAORb8YlVfBrqulAqcMkx4CDqsxKrW1z1PKh3Vdn3nlqnILBcXOz+UeFRMruOASu6A5NP5dBQuHdzOKjMafHPmovKib4Ec+UKpIvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785791; c=relaxed/simple;
	bh=wVsbPjzV6rdMCOh+/jqwKAwstIunHKGQ095pUiYGHjk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lb36ENG7YWmb6Crv6SN3lDvhAlruNWm81jV/7JJ+wSoo+aNizSyYJGWc7OLEg1gyf5akTRO3iPIfjICx85qwulfRjxxHLA85HlHOLoeHF/j/4o5nqQGFyzCA3rO3APy5Ez4hp14FW4BYxQJtF+iCJFRukDR8krVhErQgdiE+dGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Db4qn0Ya; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dae9a0566so53167f8f.3;
        Wed, 05 Feb 2025 12:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738785788; x=1739390588; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wVsbPjzV6rdMCOh+/jqwKAwstIunHKGQ095pUiYGHjk=;
        b=Db4qn0YavtSVGIvfmsZ5tN7WZchm2+iWYjnFQQKZBbxNqVD3LI9zNtlbsZ25w4ABVy
         gygMHj02f5hnC4c2N5e8a3Q2uKeRUL+wgyyQamOr5iOuXcv+qKj51Z4uw/1n6q35kHMv
         A5wvQGyHEfPvHXibQpaYU2TzMESUiZEW6d4O6zb8iG22NfpgL8j0zgk4/e14ZmoWq/xM
         oRzz5ThCJ58hT49UcMJcPlMXV2N3RiZCVKwEI6J0eWqFGSXM31z20lfro3ABfy3iYJ3l
         SbgY0h1L/eyvVSBFWrAZ8qRnNcPV8evaaIG6tM7/NM8WqS1cagiVHuHSUG5nXpqaqXla
         qTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785788; x=1739390588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVsbPjzV6rdMCOh+/jqwKAwstIunHKGQ095pUiYGHjk=;
        b=MEiL2Su5vrf0yZ4XUOWKaogLl59iiCBrMOBuUsgM3dZajiHiGvmHJwJkJYfW5Lw3LW
         2iOapM1k5K1RfUiq1uZxAWFmyWPVMnrQeXP8bYsGejz22Z9IvsiSQaJzPz3cZ2XOSmyS
         8SWTBd4DX3TiTOUPF7vOyDVuzm2qnwEqvrT+0QHgjSHIPGTqDrzsRZElyKK58V9lp3DG
         b/Ni/OftAKA4dBaEPnw4RP7E6EvQtcgUqfz24pxv8ouXW8zgQthxYCYV8h5ubrdRrQqV
         BQ2bWkCk/FIVpyrsiZ03JaL0Bc7+/4ZBX2VywGwPxolnKfpeGOIGPy0Adq6Cyxav/q1q
         2PCw==
X-Forwarded-Encrypted: i=1; AJvYcCVBkGniDlRwATziD5o3cvM3MKNzfHjdQgO4k3JYuf6XldNghvCGdK86yM9rFSoC/OzBplrlLCbHd53hu6g=@vger.kernel.org, AJvYcCW1yJEWr2Z8oGqedWJ+a4kA0nIfDABFrYQnZxQZAlVSJyveXcBQtTlqrcGxto6siCJI8gGD0eiQbr//UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCOThBQ2Ljfw26UOtTdmiaJo16TFKVap7aLVbQE1VXNhmJlNk
	br9BZZ1DZa2mSuyZB2WodbKSCZlnRAKxjVDLqgdSQ7TgjTfoKpKr
X-Gm-Gg: ASbGncsYaVUu6bJ5pZZ+KBe/PpTdXjMFc6y9CvOvf6GXulwe5WF8FPK6Ngf8XakT6V/
	wNF51pkSH8NGclZreQCWr70pxlgNQWTrzKxsxjUidG9F1vaQoBSJjTHdo7S3JSToA3lREEN+Iwd
	fQXiII3wzt4echho/tUe/6LphIQysIdVw91OJUe5GzbENlS/bFYDMdl2pX8LYaQ2DTRL9yzSzZ7
	K6ngkfumubFoHrLE1AW0cK3eH83IpT4v4ZgVkOiqk8l4GSG7sKCNL+o9VE2olZ7dv4hlbB7H2XV
	OKwm4aBnnXXFKsmeiw==
X-Google-Smtp-Source: AGHT+IHxPzC3OWRfQeyfRl+BFKwKx2W9NJBPhGCMgXrYywkQduJXE3rv389ml5v5uL9pAQDVgOrSZQ==
X-Received: by 2002:a5d:6912:0:b0:38d:ae82:e5ed with SMTP id ffacd0b85a97d-38db4938882mr2717304f8f.51.1738785788239;
        Wed, 05 Feb 2025 12:03:08 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38db0e2f479sm4558397f8f.57.2025.02.05.12.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:03:07 -0800 (PST)
Message-ID: <20655da3044d03777d85d97d1ca82b68a4c54056.camel@gmail.com>
Subject: Re: [PATCH v3 7/8] scsi: ufs: core: Toggle Write Booster during
 clock scaling base on gear speed
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Peter Wang
 <peter.wang@mediatek.com>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Andrew Halaney <ahalaney@redhat.com>,
 Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>, open
 list <linux-kernel@vger.kernel.org>
Date: Wed, 05 Feb 2025 21:03:06 +0100
In-Reply-To: <20250203081109.1614395-8-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
	 <20250203081109.1614395-8-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!hba->clk_scaling.wb_gea=
r)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0hba->clk_scaling.wb_gear =3D UFS_HS_G3;
> > +

Hi Ziqi,=20

Initializes wb_gear to UFS_HS_G3, mabye add comments in the commit why.


Reviewed-by: Bean Huo <beanhuo@micron.com>

