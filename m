Return-Path: <linux-arm-msm+bounces-77859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF89BEC7E6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 06:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 425E14E18C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 04:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BD626B96A;
	Sat, 18 Oct 2025 04:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aW3+E4dH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE59264617
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760763320; cv=none; b=JFAazrIyq64Id26wIT0o1iaj9xjmWBlM9P4gLGrfIIrQnXsVjjJxXlcI85POEJDox2Az/TVbP5Nh6FzWFRmWzFb6en8WkB9fpUkVWqwUZwGYrxKgs0+ybAJyB89pwOmfTWIxHhkWesRaO046g4ConPBpW2shAh8UsquupUhw1l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760763320; c=relaxed/simple;
	bh=ylW2XE//NO5FaS2GRo3y6bDQ5bXrKLQ1fYi38QPF9Mg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GWfWsYHFw6pv8pTeZ2uCkQc6BS/H7//7ZDyQxcfbNqvrJO4ee7vT1qza/Ug9UHTczlTWbdse1xU62RK0LSGgZawsaLNOA7dZ9Lws8SMnyuP+NMXcs7DmBuBqXb2T49wyKGNfW1TwmA/4C6TZo24KPbUjq3MvHebJh1f072HEIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aW3+E4dH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-427091cd4fdso700196f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 21:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760763316; x=1761368116; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lev9x6dFfmdCM6nU9lvB+aId3gAOWip6By2m8dIzqR0=;
        b=aW3+E4dHSrakor4dnozLsjQIlv8RN/iSsLbT3RO9FZxm/6x8ysPes4d74J9PQ0bQX0
         0D1Ntro1d7gW9B69OndpZw0CwIIG6xm+xNVWKWPpVMgirzCGTtBZf5Y7V0vbMcp5iS/C
         93Iy7KOOrg9g4nEjFnKyY/M59KXTlee0CaVwYUPhERI0o/e53pnu7wvRVoHLd74bi6pW
         J1EggmDni+0Ws3Igh9uniwfjuomlsUs/g76O4uJgBnx66AdtTt3v+6v5+hJAul+8q6LD
         Jbns83QWDNe4Ay8YrQDyDuj2qYMbPGYSsfiz9VnebaeGptMzFyMaylCFGnK8C/prL84u
         gIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760763316; x=1761368116;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lev9x6dFfmdCM6nU9lvB+aId3gAOWip6By2m8dIzqR0=;
        b=TExMia9JNLTknnZ9znhweSL9skvQSieReWHpbFdmu/irvv88W01v+GB+xd7L3o5PaN
         kBp/58QRmiDnkvLfP1btYMwVO42PJDruoj6vgEIA+qBBE418OuMuoX1V/MKDE3vPzRu9
         jcxfyBJ62JTGQVnr+a30YSDgXifKOE1cf5L5MGJsM7IFxM5Kph1A+pn/D5Ht5bFi8Gzp
         8OSjdYOieliv2pcXJZND/1m+g159uPobqOcpjnl6avBdD9qb6cDeePkVVPiObvwvPSJ1
         hJM6V7OTdWuVSw234YxqA+DJ+PmVBsdIf18XbfHAcmIcTRT22cLXu0pc/20TWwS62gJP
         J0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpE1qlhn8qBs8NQ7dktaRkYU9xc6ReG+PzKZ/IXQP5hiHSE1o/iSqx7XgpsmTgee7n8+5G4M3+/NHbH9/@vger.kernel.org
X-Gm-Message-State: AOJu0YyXZtMFC5hFNGcxu93Lpwyi/wmGFJNJkzWRSVSmwo01hgV/tSd0
	7WCWfTtUayuop0SI5lhJ4vffkp+FK+5CaBWRT1Pei9gKeE87y2GnKnS6WTlMtXEpOnU=
X-Gm-Gg: ASbGncveR3UMlgbbRFAKXOjdLWk9MmKC5YoPvsbvIK18UZM+0G8h73ZtkoDLj1UVOMC
	7ARgH+rgacLcVUDnTSzDrzSkrLYI2m4GpLvtFipZUkkBUWF0W1y4F537FG1ucY0VEq7XWD/2S30
	MAZqoYlw445qdx1A+fq8di11bQmGwljBU62y8Wf/dKKeh1qtaTtE7n8t0uxtF966EJws4eCfxYx
	upXDwi2v5xV5yu9AC3/JUblWZ1/blJtGDmiawvyVUK2Q1r+8mbtQ1PdauuGgICSp9DYf2Mu/SjS
	xbYxgnuyYyg3UlA6Z1utUQ+f0A2XInwv3kpgnVke6nn6gup8Z0seG0QGU8RfSlbYmkk5WYHed85
	5LF68pNbtR1PCDLff/yP6epHtNpQ9sZOMYgBBGwpIpONIPTAzpHsyEpgrlgrGjYHlPU8JSx/NrM
	0BP2JkokRDLbWCMQ==
X-Google-Smtp-Source: AGHT+IGQ2PwsTgBVhX4BIKplCiN6Fm8dEPVQVzbBaqOMGQ2re1g52F54o1ZfdXxv+FuOtuW57XJ50A==
X-Received: by 2002:a05:6000:188e:b0:428:3c66:a022 with SMTP id ffacd0b85a97d-4283c66a3a1mr577628f8f.40.1760763316335;
        Fri, 17 Oct 2025 21:55:16 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:a618:4d7b:922:a98f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm2706026f8f.24.2025.10.17.21.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 21:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Oct 2025 05:55:14 +0100
Message-Id: <DDL6I3XL46VX.XHDZ5GTAJK09@linaro.org>
Cc: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srini@kernel.org>, <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/9] ASoC: qcom: q6dsp: fixes and updates
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> This patchset has 4 fixes and some enhancements to the Elite DSP driver
> support.
> Fixes includes=20
> 	- setting correct flags for expected behaviour of appl_ptr
> 	- fix closing of copp instances
> 	- fix buffer alignment.
> 	- fix state checks before closing asm stream
> Enhancements include:
> 	- adding q6asm_get_hw_pointer and ack callback support
>
> There is another set of updates comming soon, which will add support
> for early memory mapping and few more modules support in audioreach.
>
> Srinivas Kandagatla (9):
>   ASoC: qcom: q6apm-dai: set flags to reflect correct operation of
>     appl_ptr
>   ASoC: qcom: q6adm: the the copp device only during last instance
>   ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
>   ASoC: qcom: q6asm-dai: perform correct state check before closing
>   ASoC: qcom: q6asm: handle the responses after closing
>   ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp
>     under-runs
>   ASoC: qcom: q6asm: add q6asm_get_hw_pointer
>   ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
>   ASoC: qcom: q6asm: set runtime correctly for each stream

I am currently testing this series, so far looks good but
I'd like to test it on one more different board.
I'll also have few minor comments later.

Thanks,
Alexey

