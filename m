Return-Path: <linux-arm-msm+bounces-48272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E4A38BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 722E3188FFC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EA6235C16;
	Mon, 17 Feb 2025 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zbYoOUtK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7C137C35
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739818880; cv=none; b=MD2jipsISIj9hSnehCYqCW3K4WylvofVNSGAnfeLjoXnVWrwJMPofEUEmDp/P69t38vOEufrIYLv2YMmnnXMJJQO7kBzdeYna8dwZVnCy4XpDM+vD9y+pHIv7mia7OkoOhHD6jGHcVN7TKVTCXyMECSZwb0whynO0k/6EhrbMIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739818880; c=relaxed/simple;
	bh=GGGBr9WGpE2jvMig9xuvonpC/5Zk9WOwH7Grjs4yC7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvCmrWf892NiccHwVnUrXhFYM7vH1cIm7ugu4IY1DooYVwyHiVMzl3NFKN9bI+SmXZdcIy06ZDsvmGBwzY6bKTAearUfcVft1rUjX4sSw0fq2cho6eRfviWSe4TDxjb3nStKdcW6aGxHpWtkXDP1nEjV04OnaDBW4Ls2F+DPYUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zbYoOUtK; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-309311e7b39so21482321fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739818876; x=1740423676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3KVpMc6HL6H0IbUiBn0TVnYFjN3Gop2XIWiyOAEOilM=;
        b=zbYoOUtKbI1POvmMZt1kGo37UPR4/Wv81KdV1DO1EMjY4rDiJEbIy2JnSnLX5n6F4+
         CL8WUULLFt5QeA149gY5d/YEOT0l7Av4f/NbyYx6kY6JvmKiknJbSFtWOe+bOKleii1I
         PjMVUvDjkHetaVsJ8WyEiZrEKfnVnMAbeZJpbbh5J65k631SIW+qOckO8uoRIVO7BMeJ
         iDBQUji0XGcsMFNbQfROISNsymFY2LqE08V91eTptV6PueyBYNmzZT4kJa5gE0Z1o8oP
         yYNs4bYZ+vRxrk+GHFRDAwAiKaXkqcJ4p7Ko/YtuGNGolGRdNqY2COc1dqWiXcaKN88Y
         Z2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739818876; x=1740423676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KVpMc6HL6H0IbUiBn0TVnYFjN3Gop2XIWiyOAEOilM=;
        b=KSOIzdQs3CxkbOkRnvFvNBbUuwOfAEdko+mmBqmR2wId/qXvdxRIlVItQ4TufLSbe1
         5DAJ1AQUuqAwJNS8AxxZWsNGu2Zl8skvZJlnfSGTOGVNVenNpnsZUyk8JMbmpfMyYkZa
         t2rMKXKEIohh1b6ivWRTFJAA00ycWzm+7FHlITKz/b45pv1BUHylGK+Pr5hJB2GXLuJ/
         oIiTNvG5a66onFTNY5wNbdJwDL8Qiman8ME04OJskF9dsvcK4HrNOEZkFcLaEt+5cFNc
         TlZaHUswl0CADg3PCPZShYdw4mygHxMERyYhfRy2F7RS2O2rUqNknyumKCDYGYAjaeaM
         uqqg==
X-Forwarded-Encrypted: i=1; AJvYcCW4OM6aCn3CE6RC8Fx6aSRVtMTlwbru/LlOXg/CKLohT0ZWd/hKMyXErnj++zosvnQtYNaaRhFFD1QNC4hV@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGTQvbxEryiZseW7kc5JmzyrjSW2H3SkPlJzEMhkaH56ZNHtz
	JI+FCyqxvrjom8RAaXv0CeqR2BFI8+RGK9HFFdNow9cTz/mBvndN18jUdLZq40A=
X-Gm-Gg: ASbGncuI9injEhbwFYL7mCvN4P6HqeMrKKqWXmJ06oWFZjRCt8ZMej/mt8mEFto7sGX
	iCBLZkEGSZoic4UMtcvo6pKKsIntIZXy7UngPJn1w4tMQdWUIU1acaZiOtjr4JaskODLeEMWrM6
	2LGG4yk5l69ywaCsSHVaTlR+CelaxzzKJoru0qAK8qWa037bMx+JlCKUcaeAGo0GhZfuZ/6Rp10
	l0lDAFox6J1TIlSGGubNn5HtDFFJKWqjXVeVVB/fmgPD/BG8QvgqpO64DMMB0eXbt7DhQsvt1Fo
	IhY2tWeIbShqYp1ovCOB+ofA0PUHyc10z73uysw3lCZ+FhnToSM7kp0i/LCYBZU3WBynWDI=
X-Google-Smtp-Source: AGHT+IHOqzXihtG/q/MOUu/ObVGRxR4vcEqAKB3UjZpWusxSGj7tDYpn5jPIEX0hDh+XE6pxaNtc0Q==
X-Received: by 2002:a2e:8895:0:b0:300:33b1:f0cc with SMTP id 38308e7fff4ca-30927afef0dmr28520491fa.34.1739818875993;
        Mon, 17 Feb 2025 11:01:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a27206f15sm7247121fa.61.2025.02.17.11.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:01:15 -0800 (PST)
Date: Mon, 17 Feb 2025 21:01:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 10/16] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
Message-ID: <fqmt5h24asj36odjx6bdgc5qjoeqwgpmrrsqq642ss6l3tsnmy@wh52uxkzudvv>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-10-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-10-d201dcdda6a4@linaro.org>

On Mon, Feb 17, 2025 at 05:41:31PM +0100, Krzysztof Kozlowski wrote:
> MDSS/MDP v12 comes with new bits in flush registers (e.g.
> MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

