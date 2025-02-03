Return-Path: <linux-arm-msm+bounces-46723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6D2A256A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 11:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE53C3A70DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 10:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEFE20100C;
	Mon,  3 Feb 2025 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv9lXAka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F97201004;
	Mon,  3 Feb 2025 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738577385; cv=none; b=H9nBOgIRlgzwu2anYtOaF+ACmmxOhRZ4C6W4V4l0vk4UWaSdScy7AIwvXvVVz/GAyxcAHBzgP1l4DMyYmvbiMRdBtEG/YyFZULm//GnzVrEim0JnXUGrBTH40nQgio1tCEBy1Cc9j+Y+FtRUOrdFt/NYi8pF9nH2yYjwApG5sOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738577385; c=relaxed/simple;
	bh=Nd1Ay0Mlr85rYMZcME74NHXWLV9glYt1e9wDGHVrdtw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sjl6HyWJbtswS7tEuqCZrTYyDZPuMiZVV+YDOBlSk7KBQlCEwevHBY/Bc/25cQ+477Fe2tVbNR//YE37NN0/svCLa2/MZG+Y19ikGZsyVtiH8VwA+ZWLykE12BnO/h+6G36qHuyFYbRk8bUZIo531P6QGXhOgC63t5TvB4uw7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv9lXAka; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso28451905e9.3;
        Mon, 03 Feb 2025 02:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738577382; x=1739182182; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0wt7JSKDlV4+ZNNqkz8FD6wvQEU9AEy+YGNZJ8/Nc1Y=;
        b=Kv9lXAka2+ZA8a6G6J529+AH8nbK0rFr/ReVexgFTUYhrerDJzcgBVcZTxEKsAwznm
         3mFQ27RT0xCVohR/Z6tY/98kDLzb4GHnNT27GqtiF9kKGtGt/BdUWEqkEtkZzAcFMwQu
         OAFZI3xp/SBUmFYiHpxzoQiZfbJ+VJAdWfVeyCbk+S3dsNVOAXZ0c+htVTUCH2H1GLKs
         VIAvBBndrofstQdBo5XNNqv1F00hy5dhB7aKdgKXPLUsCk/dTnK5RUMYWhsEZSCrCtw2
         EsSXMkGhPajKYuu3A/WV/pMUXboM60pAw2UFoR9S/pec1ls2WtuSQi0ili45yNe5G4S3
         Acrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738577382; x=1739182182;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wt7JSKDlV4+ZNNqkz8FD6wvQEU9AEy+YGNZJ8/Nc1Y=;
        b=JQpN2qNuZgdsuZ7p2qtZt0iorbuMl1ZGHVyUFP5zvpI/Rz4xXXF/iQkSe17KNpfyCb
         zJ+bvF2olPA9KoLKaGbfZ/RrgOIhgBFlzab83QxVZVjVjOiYo6DUe4viD86fKlXVIN8/
         KRJv85YhTMlSN6AffDUbGRP1OKsGpyPRjl5ZUn3/c1OabnMLT87Oyg/Yy5D+07iOM8rQ
         p5EJHSgd1tKlbYf2ghcHnWQHX2xxiqfhLf8a0GJoDH8IRQj3hh5252W6OkR3+HHyYikT
         SDjKyDR5v22LchHu/UIa8IlD4YALSdL3Ny1Shp9WYcMWGk3hWctAyz9iH7A5iPMvEgxL
         JkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBA3b+TW7e9iVAmrS8i06L7Ph+hclQWy1b+Lj2ilG0uQz/fpwM/E+PZodJJDbFBAy+rlqcDlkupgoH1LA=@vger.kernel.org, AJvYcCXayr+LHJDSLGguzlqAo26fB1jHGqC8iuVD0mm3lsJDeLkihe2xcVKe2Q4APnSsobFiNuAuhzxQScu9sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaMjK3CHnYq0629/HslbOWYWq3PtG0GUTq4SoFgqfONXmHqedB
	dTxgvVMDVV7wkmi8CptueaYKzv0CF4fwNDrNX7XRsa2gfxrGxzQt
X-Gm-Gg: ASbGncsG2DSlz1cgwYepTNIlXPaEy22zxc3lEs25bsxU7jWtses34GX2e208VXk5kNH
	pAVkd+M+VS4T+la8OEKs9QNxRU3c6RDqzxeAO46BjMtfjHRITILlGbWtIhbp4JS3DWS5dCTmB3v
	66mjCC3v/ps+UYUXiqL0z1qYWZiZ8JbJWJJ8A8yDrOkjGfcX4xbaSObncJjl+f6/O+lvHaG4+no
	zMC+5kLE1oytA6COKDv24mJ/gHcgxnBYafPfk/L3vplghvQY2mSgZnZZ2j9Z/MgmzEo6pE1c3a+
	likpXK8JPuMjYaCT5g==
X-Google-Smtp-Source: AGHT+IHID4d3u5dDIsuLvGqBj4HlSCpSQbwPU0kn5uIl4ZpOsW2e0R9AvzhgOpWJnHKkJcGEqO+ong==
X-Received: by 2002:a5d:47a8:0:b0:38b:f3f4:5801 with SMTP id ffacd0b85a97d-38c51932062mr14451528f8f.7.1738577382375;
        Mon, 03 Feb 2025 02:09:42 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf555sm12471800f8f.97.2025.02.03.02.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:09:41 -0800 (PST)
Message-ID: <1261f1eea417ea93a9abf4cc0bd8ad285eeebb36.camel@gmail.com>
Subject: Re: [PATCH v3 2/8] scsi: ufs: qcom: Pass target_freq to clk scale
 pre and post change
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Manivannan
	Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, open list
	 <linux-kernel@vger.kernel.org>
Date: Mon, 03 Feb 2025 11:09:39 +0100
In-Reply-To: <20250203081109.1614395-3-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
	 <20250203081109.1614395-3-quic_ziqichen@quicinc.com>
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
> From: Can Guo <quic_cang@quicinc.com>
>=20
> Instead of only two frequencies, if OPP V2 is used, the UFS devfreq
> clock
> scaling may scale the clock among multiple frequencies. In the case
> of
> scaling up, the devfreq may decide to scale the clock to an
> intermediate
> freq base on load,=C2=A0
=09
       based on load


> but the clock scale up pre change operation uses
> settings for the max clock freq unconditionally. Fix it by passing
> the
> target_freq to clock scale up pre change so that the correct settings
> for
> the target_freq can be used.
>=20
> In the case of scaling down, the clock scale down post change
> operation
> is doing fine, because it reads the actual clock rate to tell freq,
> but to
> keep symmetry with clock scale up pre change operation, just use the
> target_freq instead of reading clock rate.
>=20
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>


agaion, no logic change, add my review tag:

Reviewed-by: Bean Huo <beanhuo@micron.com>

