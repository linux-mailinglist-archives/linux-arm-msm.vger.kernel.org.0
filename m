Return-Path: <linux-arm-msm+bounces-46743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A754A25A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D408D3A774B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 12:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CC8204C09;
	Mon,  3 Feb 2025 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1iOGLtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C355D204590;
	Mon,  3 Feb 2025 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587344; cv=none; b=N9oPDzdrp3p8mhucU6TC89rkrNYgqQL3nDToADYf5iCHYqbYl0It77ELdUave8RCTxaI9mqY+X72gLW9o5j0pT9NN5nq9IoCIXCxzOmsc7+FfPS3rFuTTCoVXWNdEYwkRlDn5K1PZC2lMqEnNKYPQ4WZWa25XCQ0/Tk59GXfzTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587344; c=relaxed/simple;
	bh=bs8Tqd0CFF96NXsDeU5iUh1wpxnut02IrBS8m9fe34g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OKwepnGmmhbhAYSppSVLA0kp+CM4Zd6dNTJmTjoHFiA5Ht4RYyIPOPCwmSogIwRTHZk2gN9u7S2Q7Ik4JvBORLPlxQCZNbwRM2TzwJPXY7TL1EGv95OxlpiWbHkVneVIdFJ9v7EffRkP5eyIU/RI7nGW24oqkjIvPmGuyChIGCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1iOGLtS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38be3bfb045so3583545f8f.0;
        Mon, 03 Feb 2025 04:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738587341; x=1739192141; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bs8Tqd0CFF96NXsDeU5iUh1wpxnut02IrBS8m9fe34g=;
        b=Q1iOGLtS01vs8TdSmUSndmb1P2/Q9OAZM6IJssJUzE3rZ9gaU3gBzQl/duhWJWvLaL
         hluAt9XVGUoFfdcLIAfLQewEkncSURMuRw6apjdlDYM+c7OSQoctldSOEIxswvQHJD06
         UtDgjVfb2sOSLuZJOEKhPCwO0V/boMGVGmp8PL4MQpZWQTb/he7TpyisyCCUDcxP+29Q
         jrUk1/rR1HyitIqxYete6VpQrw+pRSsrnL6HE88J45mcfSp9AiYUUcb2zo1qmMm5D7FE
         fNdMnhbRJibhRafU8TCn5jzmgrVkJFkIZb9T3rlXri/LYubSf54xCBrYrLW5ZJM97OSc
         ep6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587341; x=1739192141;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bs8Tqd0CFF96NXsDeU5iUh1wpxnut02IrBS8m9fe34g=;
        b=KieC8xV0lX4TdO5xJDSY7Xggu1p/xMVz5dBDw2I0JDP8Urw3mlSXCFm2b3+DV7z2r8
         jmrFPTCs8p2rUfgPchJ7yMeEZooT47DsucGfEZe8vk+ER/ts3gw8P45GQBJMnokYwwWR
         2EjItaHDrwnKwsMQmupZZ/Z8A+sC3JGCKIP41wpvVvTJmADr8RA0XlT+PuyKZDk0Q6RE
         0B0RnR9BJi1m8GbdxsfmTRjF/IANN/1ydgd7sRmhYdzjysZrVK9rXnD6OqK7aNqOEeFz
         sWEPVT1T4W+B/9EMqcYbYHApeMmdtx29lkgsB2fZFroiye4vF0TiTLeY/TDhI059wAPu
         3O0A==
X-Forwarded-Encrypted: i=1; AJvYcCVVI/LX82lNPiaY2dN71wpfqb+S4CCIxJDiJOQK75u8DgJxoMv3RqhSVdnaUfVeugWuV9LOCj2kcFqoxao=@vger.kernel.org, AJvYcCVr1acTjDUz2Aq37DjIDYWuAsmZ+j9wMg2Wc+v9sQmwE69B1eRKVuM8eaTekFGoeczuWZxMiR4rvK98Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwkBDI2Lkm9pJD8kCgWef5EqlDl2zBHIQbxzsIpj3wTM3tZKOV
	DrM9tKp97z0KHULHnoC2t4nzLIKCQLLGO5GGEwqW5J78OgcjHnZH
X-Gm-Gg: ASbGncu/ZSm+YvdO9ag2qrTUdUROPvngWqqqAqPtg50dVyn3ZKbVF5AkV6iugWGlaPP
	hZLuy3zUlLPGxkrqGEBRDLWbQwKkeTwlodg6gL3Exjvc8gd3O1Ttcq1GBLZE48g6w2VRWCdju1+
	7uL+R/3AiVvuRcoYjchgQxjCxWFjH5Wv5UzIHNL4xl2V8cxvGsj7zzLUtQsoYKf5I0/B+mdwj38
	3uOf38HEpCo9wtRmAsnnO0BwZOZEzFE/vvD9sVrkpi50S7yg0OPZ53DFfMBo44c0qMHFnI+l75r
	EUDaaOCt0SLkPLcBVA==
X-Google-Smtp-Source: AGHT+IEEJalytdX0QUtX6yL5bhNnoqVYfs8Qe+QO+eMTH0COVjkeIsK1vfCC60j4oez4kuL/EbEqwQ==
X-Received: by 2002:a5d:47c3:0:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38c5a9bf70dmr15142010f8f.27.1738587340616;
        Mon, 03 Feb 2025 04:55:40 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec7f1sm12481772f8f.9.2025.02.03.04.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:55:40 -0800 (PST)
Message-ID: <21d0a62a4f7f17304d81449e75c345f1e47948ae.camel@gmail.com>
Subject: Re: [PATCH v3 3/8] scsi: ufs: core: Add a vop to map clock
 frequency to gear speed
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
 <manivannan.sadhasivam@linaro.org>, Eric Biggers <ebiggers@google.com>,
 Minwoo Im <minwoo.im@samsung.com>,  open list <linux-kernel@vger.kernel.org>
Date: Mon, 03 Feb 2025 13:55:38 +0100
In-Reply-To: <20250203081109.1614395-4-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
	 <20250203081109.1614395-4-quic_ziqichen@quicinc.com>
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
> Add a vop to map UFS host controller clock frequencies to the maximum
> supported UFS high speed gear speeds.=20

From the code, seems it is not "maximum" gear, it is corresponding UFS
Gear.

> During clock scaling, we canmap thetarget clock frequency, demanded
> by devfreq, to the maximum supported gear
> speed, so that devfreq can scale the gear to the highest gear speed
> supported at the target clock frequency, instead of just scaling
> up/down
> the gear between the min and max gear speeds.
>=20
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reveiwed-by: Bean Huo <beanhuo@micron.com>

