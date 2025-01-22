Return-Path: <linux-arm-msm+bounces-45814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6BA193DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0370B1889915
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 14:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2771213E8E;
	Wed, 22 Jan 2025 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGpI+0IO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1441B17C220;
	Wed, 22 Jan 2025 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737556179; cv=none; b=eXW1wn99RGVmY2X938bBL45/7cHDABM/Z/dP1KHoDm9gDMB6HZgG5+SB5NyAP+szrTzTwsKNxiCxkJJSH/DexDHu00c3Uh7BIPlw/+Nsql1gwIo5Lm6tz6VNBrRykgRU2lsTzNFi5u5X/oxIHb92eWGiAJe0GLtdSxlmNTUOXQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737556179; c=relaxed/simple;
	bh=FJ71RCuC645zjdFS0sVBz5BusmjrMIbp473vgauFj8A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lLRWz5KSdbnZHW5EHbnS+dJO8LP70yKx2C4q5IKFcSTroSGkvLfyGeqJ/MmGseJ/gn9mLzUQkSB5Kqa4lNoZGkgQqR9QV+TUr3NNssmBdHP2h2JuJ3nFASc31L7BSuC+Vx7ms67PmuzpOxRw04g/Kwb6gXDnQqRtIXBy74TYxx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGpI+0IO; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso12182551a12.0;
        Wed, 22 Jan 2025 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737556176; x=1738160976; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJ71RCuC645zjdFS0sVBz5BusmjrMIbp473vgauFj8A=;
        b=jGpI+0IOvLy3Yk4AgVHLeNBQy7IXclo1eK8l60W3w0Wo45XKYc5MMz8WaDNxfGYO72
         chJSvWsA6CazgJ7AjTPtqBfVAUd875fgE9zu52W6EdyJYW1OrzORFW/cyJFyjh8bhQ4+
         v2a3b154u0mB4X9BQnK5z5DYOaDBtITTCnNkbUATuADglk+wAWSmRlPdFFSoc16IevQ7
         NH4/0xN6/rUPi5b8SAzfhsoH4F77OlEUMb5wiLX2uB8+SXF7jYrdMHIy4rYYMMCC6DQu
         h3KK3eEk7wyh2JK7SPuu0kfv0wJ+HqW0Pu4Un+HNzqV3zo/DcbVtmb3hJTnOkN5TJln3
         e9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737556176; x=1738160976;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ71RCuC645zjdFS0sVBz5BusmjrMIbp473vgauFj8A=;
        b=BvNVgaKPtxHMlD0LohvYV2aRT6yNR4jxqcGRETLlHsyX8n7Gywi5ddAg8wnUmzuNjI
         DJp42daD4+im1N2kkFbLudh0dG6903Zz8lUitKPDabLePwXhILaIsgkveykOyQyLNZFn
         6siAGwSnMKEG1wpsNxJuvebU3SvBlCAWXy5G8q9eu2IGw//bElETobV4++tb5au75mK3
         8XmIGyBRlu5uXZGtCXEIlSWOWo7wZFKbSOGpCc1VWfkOmU78om9xvkLVFIgW0H6aCHu3
         eIgQthzHyNwft5J5QKQ/d4dR5Aj2l/czm+CROqRHfzLIe7C9gi8Gths8sX/BFGl4BayF
         QlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw7EJbZNVgKqJNqJgMCdHnP6xEw+m+QZmV3u0f9hGvaBm99vvl1kCpwqiElxxIS72hHz4zRArhOBNOXQ==@vger.kernel.org, AJvYcCW7Rn46SH2pI4ibtbZQHposoWmjRJgLTW1cq2cUQyy8hNMvcknPn2XfyJ2E3hcxRxr562kmpcN85I8KyLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjIRmDkmRksAS2gXV2g+K4SK2O3seQDHO8zRzkMt0YQbG7GxGj
	HBfRtne6TuCUjIN9nUrFMBq0AgrfLinWRDs1Wo8Wq+wkGBIg9Z8q
X-Gm-Gg: ASbGncvgJ7bK2qdMhXjMGlgZbjjRLNdym2g5+LFD/kZ2Rk6P8LOgkvBmgVldMxWflwC
	TRZE0gnqPZazvX2YC60E+qRQxZYi/6fAzwWgHl2DZtlCZZ0o+guldUP5cWCZJ5AgCWkInc8R8tQ
	zEigpyK38p782Z7VbMS5uWh7JHZdntQ1Bif7Y3jO5i7Xl6XildLYZ02+tuP+kE5nsEoAat9fwvc
	nGtAPjGqNeZJk4kBbw5BZMl9plH4N9buitnnJsfhN2BszAUp0Atqspv74n/pq+IU8wrv4eP
X-Google-Smtp-Source: AGHT+IGcLLdM2B2vb+RiH5a3wW/jtMn7brkQYw6myTx1CQTCq4yS9QtL7EZ7Old5hnSv3UNB+Wl0Iw==
X-Received: by 2002:a05:6402:40c9:b0:5d0:214b:96b0 with SMTP id 4fb4d7f45d1cf-5db7d2e2f66mr19371358a12.1.1737556175874;
        Wed, 22 Jan 2025 06:29:35 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db736428e3sm8514452a12.14.2025.01.22.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:29:34 -0800 (PST)
Message-ID: <c493756f7ce5aee8a9a6856473c8d61a1128f2c6.camel@gmail.com>
Subject: Re: [PATCH v2 2/8] scsi: ufs: qcom: Pass target_freq to clk scale
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
Date: Wed, 22 Jan 2025 15:29:32 +0100
In-Reply-To: <20250122100214.489749-3-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
	 <20250122100214.489749-3-quic_ziqichen@quicinc.com>
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
> Instead of only two frequencies, If OPP V2 is used, the UFS devfreq
> clock
> scaling may scale the clock among multiple frequencies. In the case
> of
> scaling up, the devfreq may decide to scale the clock to an
> intermidiate
> freq base on load, but the clock scale up pre change operation uses
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

Reviewed-by: Bean Huo <beanhuo@micron.com>

