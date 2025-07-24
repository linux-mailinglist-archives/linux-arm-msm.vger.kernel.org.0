Return-Path: <linux-arm-msm+bounces-66480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6678B10711
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A24481CE5889
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB55257AC1;
	Thu, 24 Jul 2025 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/lAKvXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E2257435
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350924; cv=none; b=pUIvXuKwHQKAJ1/ITeIaIZyLx6j2imT6RSOjBdloRG2iCGaLv/BsEiQO9CoV6mOKgIiTffX128KJ1wyQQzXvMOcPAMia1zhaGuZ0Rcds8VKv9dfQhA5EmJrzCFWS8xjvEr446DlOFmvPSaLeR+6mHUfrV45A3yuaWJHuF/WjvW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350924; c=relaxed/simple;
	bh=ttx1sn8LRJJ7tFRoMIFeaQa8OLFqq3HWpSLFnn0BMsM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIslGlIEv7gfLJq7PNOlcP24uJ0q5+LR1l2jN1VQaPLllrvFfptLoSsDCfU16lAFYqBTzeCZEI9zRemr2W97riA12g1wJO0dr0qn4MvQC/JbmQO8ix3/82OAJt/mEhbtlicLbkHUOwxV2e0tZXhoGltquHC7E0api15tZ6+ixk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/lAKvXk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso5184385e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753350921; x=1753955721; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ttx1sn8LRJJ7tFRoMIFeaQa8OLFqq3HWpSLFnn0BMsM=;
        b=e/lAKvXkgPfr3bvUnr7si/NEmjRxLq234D/1igBvzqyxZSAp7LjD41+/EyuFiK1qsE
         spfey5/tseazXT1fzkU6DbqSH6kAas5II5RWTezbZVkMrXh5h/ovDK4HKHTc+1qTXHuF
         PE23IBBtK4yWG4C+dSMr9B+gH163HtDIsrxzD1Q2Qep12Sof8gHvo4VtKcvWz24IoWSL
         xS7XhRBK7RV7dhK95Ka0VIQppag42yQm12cKbatIwRb1hThmqwaolYRAf8rULNeSKlIe
         dgnxah8N3NaYL3h0D20AOyYUx2Cb2DVhL1xMHkWawadacToNkn7zCe1ETZMSVLT3rDfD
         aDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350921; x=1753955721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttx1sn8LRJJ7tFRoMIFeaQa8OLFqq3HWpSLFnn0BMsM=;
        b=V7X3o08YBDeu9OTHSngavGj1iT6Tnaujm/H/qJdWA9EolG19GPizAXo+9kmSv9asnC
         hiIouHkgQ9Zp298/s7GiGdBes6Pxcm3I1HPQu/qA0Qc6Gi2tasydWbxaa2p/9czrLr2k
         nNs8ZLvVhurZBxgEtnHcPnmBHMA0etfAeThuVjlXrsBYcNtOeWC8THYS5LwBKiFSXdRm
         /nbZ1MfqW7khx/YTV4aV9Chitd65CIafTmVOaL/+UKFCtUC8Zq72D2mut1GGXDmqcE/h
         FHbf0f9PWXIarl5RGh/Jj4M0JvIeEooCiw259Y8IdHeJ6M9vo8E8A3/1aGHOjhfeiMxw
         ealA==
X-Forwarded-Encrypted: i=1; AJvYcCU6uJfuVZ0Nazbs6iOI5CAPTGzr3WMfA/NwShYYACjxN/4y9jcDNRr6V5izbyJtSM274/sKb5KviW4jbdfE@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnXed7v7AKD0FCEytlECssubF0LEXW8MQXtsxJKw4l+Hlyzzv
	QJfUqgNpOJtyWvi7d02Tearium45bzz9l2RlkPl/nkewYKp72xLyC5t2mkWOhXfh1e4=
X-Gm-Gg: ASbGnctT8Q4wcQaVgw38rh6fBuWYfoG8swjXAYHgyZU8P1KDiElwn2BQktQNWwyKztn
	ZVoWr2ZMk+iveA7O2QNMRjx7HpUDUT65X0+5LoRYnmuzEq+R+A4dwBDn6Kef1YeJerZbsyEDP0T
	HLxJpBbxXZNxjeiRyTv8+5uTlkMqWlCGzpuFPiy6QmlqFg4/xMlZRQEa1NHOu3dh96TsT9PE2/o
	aOlKhZkJP093LYOK58pM/U6f0vJylP294Kc8yoiumU+6kWeC9BoTljCJHADiow+mzfvkkrU0R1M
	O7fNj4UGZgvXVr5sMmqu6JdEZVz2Ts3s36KyvFw7gd/NYGgXLZuurM43OsAHY03lGYcDoki1tAB
	j3rZ0Wac9JzEPsdTy//DKkq6Odw==
X-Google-Smtp-Source: AGHT+IFV7Jhqi3f7BMO1Zhr2G2rdE07bHjsE7MXYjkCsg5wMsHZGyAO9YBqYnRTTTcCErgswHUlrzQ==
X-Received: by 2002:a05:6000:22ca:b0:3b7:6804:9362 with SMTP id ffacd0b85a97d-3b768eedffbmr5348368f8f.26.1753350921106;
        Thu, 24 Jul 2025 02:55:21 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054c4c7sm13946445e9.12.2025.07.24.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:55:20 -0700 (PDT)
Message-ID: <059e02cfed79d51b1efd398822d98eafd4cbf5fb.camel@linaro.org>
Subject: Re: [PATCH RFT v3 3/3] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Avri
 Altman	 <avri.altman@wdc.com>, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"	
 <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Griffin
	 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 24 Jul 2025 10:55:19 +0100
In-Reply-To: <f6573ba6fcb43f0c41239be728905fa2e936961e.camel@linaro.org>
References: 
	<20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
		 <20250407-topic-ufs-use-threaded-irq-v3-3-08bee980f71e@linaro.org>
		 <1e06161bf49a3a88c4ea2e7a406815be56114c4f.camel@linaro.org>
		 <68631d36-6bb2-4389-99c1-288a63c82779@acm.org>
	 <f6573ba6fcb43f0c41239be728905fa2e936961e.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-07-22 at 10:22 +0100, Andr=C3=A9 Draszik wrote:
> On Mon, 2025-07-21 at 08:28 -0700, Bart Van Assche wrote:
> > On 7/21/25 5:04 AM, Andr=C3=A9 Draszik wrote:
> > > I don't know much about UFS at this stage, but could the code simply
> > > check for the controller version and revert to original behaviour
> > > if < v4? Any thoughts on such a change?
> >=20
> > I'm not sure that's the best possible solution. A more elegant solution
> > could be to remove the "if (!hba->mcq_enabled || !hba->mcq_esi_enabled)=
"
> > check, to restrict the number of commands completed by=20
> > ufshcd_transfer_req_compl() and only to return IRQ_WAKE_THREAD if more
> > commands are pending than a certain threshold.
>=20
> Thanks Bart. I'll try that instead,

I went with a time limit instead of counting the requests in the end,
because that should be more deterministic:

https://lore.kernel.org/r/20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.=
org


Cheers,
Andre'

