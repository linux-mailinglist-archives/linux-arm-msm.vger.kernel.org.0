Return-Path: <linux-arm-msm+bounces-59565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8CAC50FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 16:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E6383BF744
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 14:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78905241670;
	Tue, 27 May 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gppu5jNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A0527603F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356541; cv=none; b=r//bMsWWHCKIXOMSWHb8jTdjXwOvARjvGzkaA21Qi+e0DaZvSQ8HAUlpBY7JJYMGIw4TtCB/F/gtLtrIKOX8WO1bev9xW8SF64oQIoSq55V3A1CQV1ovoNfCRzsncvtKQi+ISF+2trhpN/DC8EB2PjMKPw+/xbOfxA4v400GqTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356541; c=relaxed/simple;
	bh=cja1fI2Ef3oVRN3ln1uZZNmEEcLeGhxoGld828CPx80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvRlQ8LNogw6WVVgnEhOKkETlBOvCSZMJS0epLc10vU4CAug78r2DaY/fjCiXx5iNq6+1l2cqoAwuvno+6CxShI5NkMKr+atbzv9BVRo1TWPzzDiMLMo0qeh2BxCeNzuJdil38H6ltzjBrtP7O+A5AATWOtlCDHVQKu9uS/PIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gppu5jNf; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7da099de49so2074509276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748356538; x=1748961338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yj61DsrMeMWCwZPL0JbzQgDWQkQXCn/QcX+T8FgoNzQ=;
        b=gppu5jNf2tTteko0A2hnZRb21e0x49h8H+edeAHqKMTmxyi35oRffTzpmHAgZb4sz5
         3bKDCkh9/J3JksVFbk02DyKqoiR0qz2bkjKZcBqmapA4mlkoFO1nZYd2QqZm4RDl7ShA
         0GkWJh0KHthlP1p2+7lEbax5WJbifxyfHw0pm0Pc0+JRlSXomSGf2SfnkhEftM31NrGh
         /MnySOBpbASRfLisvx/r1gLDzk+ChFSjTE2lDe68xK5hzmx0gPi6fcUs0rVp4ZCrzF38
         nNC41fTWiKcoXQjtBcvbSq+BGo7pmzzv/lOJoKIZT0gyZ7cTPwM1hlb/5CaTm6QK5VRd
         bzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748356538; x=1748961338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj61DsrMeMWCwZPL0JbzQgDWQkQXCn/QcX+T8FgoNzQ=;
        b=J4TTqP22Z1xRg2jMTjmq4zOhmk2ExgJQy6npGXs7bBrwMRinrcWvHts8+DLEQrn+qs
         rC8sQkH/BVpVuHK2FKhXR3G4WCMcvmoH7rJ1QDFTZClmvu52r1jOH3SSABsek3peIC9m
         csWBEKK050L5PlQ2z/HGXYjVs7dPYcFvApZY1nXnJPEFwVZe2ukFdtxsUvEHLSt0qIB9
         vYMoQPFztosZHD1XcWpzgg65lJ7MAo7zG+dz8MEB1iSIiS6LsByGTXYANoejsaFxHyWd
         b8Hi62dXrw7eDGItVb/hV4KJKr57wRLpRxtRpnekIwrNSzvPmLvpF0zgp0Giw1GnMMAY
         Bz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHeEs2H7ltUHecdAaCkyf9vgrVg060Nx3NrDRhQEqOskoteVaEaAiITLQs+ny6T3pffdkU458l7jAZmHeY@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1QDk2vyn1DfmAeWSEXNuLj9MDqtMexPulRXcZYEVhmPEVWqe
	ZzoQ+BBNcvBVmGRk6CkMv2y2PMzrRBk1HJ2iC2nbxLyG+Xo524eQTRve1iC/qnGYKtqB1Fxmqw6
	Lb1lMp92c7Fs0u+Ouo4qIwf0ILnTYtHraVJhG+zFs0Q==
X-Gm-Gg: ASbGncvImJRUEvYBgcMsWU9EVWCjJIN/yZmu4ovqBCnDN+aIsa0iwN5UdsPLIqrMGG9
	wmKDFqqFGAuAgeAJ/+1/tcICU6bdfA8G7jSljaM6DhqnUrMz+8m6obZzDpmeuapgfS96oJ7c/Lh
	OvYAnM6hIm3ldHuETG3F9aXFatuX2JOc4mJQ==
X-Google-Smtp-Source: AGHT+IEza78A9ENnR5O8Dofyx/Pw9tLHJHiZMGvlW4NPAPac1rNHq3hR3Ihr49/HMPreqV7/1zrs+KoKNzJJUGDnh9A=
X-Received: by 2002:a05:6902:100f:b0:e7d:c9f4:ed80 with SMTP id
 3f1490d57ef6-e7dc9f4ef2bmr2892226276.34.1748356538436; Tue, 27 May 2025
 07:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com> <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
In-Reply-To: <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 May 2025 16:35:02 +0200
X-Gm-Features: AX0GCFuCVqmDKFBGxj-r9MWTg0HcX-1n2QZgpIUWBloETdc9Q6k3WIWR9wYHE2g
Message-ID: <CAPDyKFoKh6KLtn6-Rvttt9zKh2fk7T28t_jC7KC8peYE+RkL5Q@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] Add level shifter support for qualcomm SOC's
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sarthak Garg <quic_sartgarg@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, 
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 20:25, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/23/25 12:57 PM, Sarthak Garg wrote:
> > Add level shifter support for qualcomm SOC's.
> >
> > - Changed from v1
> >     - As suggested by Krzysztof Kozlowski redesigned logic to use
> >     compatible property for adding this level shifter support.
> >     - Addressed Adrian Hunter comments on V1 with resepect to
> >       checkpatch.
> >     - Cleared the bits first and then set bits in
> >       sdhci_msm_execute_tuning as suggested by Adrian Hunter.
> >     - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
> >       as suggested by Adrian Hunter.
>
> During internal review I suggested we could introduce a generic quirk,
> perhaps called "max-hs-frequency" which would update this
> currently-constant value:
>
> ---------------- drivers/mmc/core/sd.c ----------------
> if (status[13] & SD_MODE_HIGH_SPEED)
>         card->sw_caps.hs_max_dtr = HIGH_SPEED_MAX_DTR;
> -------------------------------------------------------
>
> (50 MHz)
>
> which I believe is where it comes from

I agree that a DT property for the mmc controller would make sense.

Although, this seems limited to SD UHS-I speed modes, so perhaps
"max-sd-uhs-frequency" would be a better name for it?

Kind regards
Uffe

