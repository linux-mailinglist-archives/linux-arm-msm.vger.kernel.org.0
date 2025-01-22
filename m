Return-Path: <linux-arm-msm+bounces-45835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC6A19547
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01E5B1880878
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1D9153824;
	Wed, 22 Jan 2025 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJhKX/y8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCB6EED8;
	Wed, 22 Jan 2025 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737559844; cv=none; b=f+M5jH9D21BEO3KJrO1WFugEVSpY8BHxl4uB3aYHWiofzVrUgCkIc6hRYsLhqbWB/gw2uvVU5lqMTkIq+4RU4frwnNLGj+CeHBBhzqCUx9iEQeZuYYnOLdr6n1CUQc6f00nU95aXS1bKkzUwR6NuVz8yIpf7BEe6MhJNic0psGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737559844; c=relaxed/simple;
	bh=S15uzAAAqP5rA2jQWjYpQsN681b2HmQTqE9bXAl6hPs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uo7gc4qmfvB3s6mOg3jigr2PG9Augv+WpscBo/TS6gTHuGIM1HUl5aCiGPSHt/9KojzUw3zeE2rhLz/smrFkMsEnna+Yy2GYbXVvUQ/3jmcXDVcCK1QhjFUtm5PqNw/PgccRbK5ja9a049hbB3mPp1sL4178IdvQRLa5nrRlhj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJhKX/y8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so1075862066b.0;
        Wed, 22 Jan 2025 07:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737559841; x=1738164641; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S15uzAAAqP5rA2jQWjYpQsN681b2HmQTqE9bXAl6hPs=;
        b=dJhKX/y8PaVr52dfDY/Q2JxqxiPlefoNLW3DJmulfhz3Pv5Zj9nzv2cY/ziScDuFh4
         jb93ynKNJ1AsMogJbKi0Y2NWXRANiQSq/Kj/ByBbWoZJ6AiKCpQ8FvumucjmX4k/7EtO
         i9LOhT7E/FcfbXxxL8hwLug6IEfIy2h3eo52mOxOiZJlMsDjHJubK1wH+r1ns+3BtmOv
         6+D3B1/LvMdi6plnxo4jVAMfNaVQpMFKPUcoqCZxdX5kXuk6B0yyBdh17nie+LotWGVJ
         Er57mcfwA0fT/7kyawr2cV9F6X6R0+3sWSngKNdsqlvDWbyQVPackkzED8nFUPrBsEHD
         9+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737559841; x=1738164641;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S15uzAAAqP5rA2jQWjYpQsN681b2HmQTqE9bXAl6hPs=;
        b=SesmOE//rJN41QlX1MH/5labvyNTLtKVQdaPrZIls6a0A5ZdlX+MYRf9xf95ImGAb0
         N0THbujPBqnsLnLbqvKJ3TQXRWwLSvZQwjMs6bCzyqatZmzqe9J6qH3N8Z6/IAgVgsII
         RELWt6Ky6ftSHZJpcGGzaGgJCDgGfv9jMmTaO9DiZebmcYxeGjTB7N36eO8chqQtCtgd
         n8Fkv2sp+2VGN3AvX3P71lQGpd1qrNO066jqR726M319aWJ3diKvpT0xm4XdoA1hiRII
         pW/gbKkARTzxNdVd6FSaiHliUREpJ867ydnWcQpleGXbRPEu7AQpBpzKrzA3rtCknjHC
         +e9g==
X-Forwarded-Encrypted: i=1; AJvYcCU8dFGcpJs6uNQGRrBYc5j9gFReNJ9pDmFpR7Jx8xYa/VjJuqCUM4uOhF7e1RvVaGcT09Jeaib3hXP6t6Y=@vger.kernel.org, AJvYcCWT/n0Ii9fzCDrducdfPBjou5clg/x51GCb0TpyNatjZ7r7rNLlrWB5+wu4C0Nx2JFDoK4fuLMd2VDLLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7Q/j+tT++8EAV4T2UzMiYriY/wyN4SyGI+GWLMhkGQX2KY+9
	EMs89cw2apofCCaQ01aZEVIWjLLy3QzuqVhIBbMj13isQQ66igtm
X-Gm-Gg: ASbGncvm4Odld6yZBlwRY9ApZXtDFUVceazAJ2fAhMqL+C/DkQLuPpsoi8EuvPJ6T3K
	md/k+TCgFztsGQHj5hjkoNY72x6O87vafg5nZm6xz1fFGB5hF3vqdDNk3PwxdsR9QpBlLMFrp9d
	MSmHi+IENv5/EA0ka9nvGbDaWUIVSPU72ytqnxHfwPW+ackQs8gXkZ8oLZ1VpV0XyOaczCXDuDM
	BXWBlr5ECbh7R+eSH46Xn2gGTAXAfQE0L2iEpK0rWP3F2cVJUO/AIzcsRQ+L+496DIeD/GC
X-Google-Smtp-Source: AGHT+IFLDI2xNX6J+pzyb9IaPyORMnCXhEOOoj4DwOs+Iarbw4IEqG/U48whIQtK7zQG2CqjULdJSQ==
X-Received: by 2002:a05:6402:1ed4:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5db7d30092amr45990846a12.17.1737559840959;
        Wed, 22 Jan 2025 07:30:40 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c75baesm922292966b.1.2025.01.22.07.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:30:40 -0800 (PST)
Message-ID: <84951628fd2823c60727cd67992cd035acb53e17.camel@gmail.com>
Subject: Re: [PATCH v2 3/8] scsi: ufs: core: Add a vops to map clock
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
Date: Wed, 22 Jan 2025 16:30:38 +0100
In-Reply-To: <20250122100214.489749-4-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
	 <20250122100214.489749-4-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-01-22 at 18:02 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> Add a vops to map UFS host controller clock frequencies to the
> maximum
> supported UFS high speed gear speeds. During clock scaling, we can
> map the
> target clock frequency, demanded by devfreq, to the maximum supported
> gear
> speed, so that devfreq can scale the gear to the highest gear speed
> supported at the target clock frequency, instead of just scaling
> up/down
> the gear between the min and max gear speeds.
>=20
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

