Return-Path: <linux-arm-msm+bounces-82603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC9CC71AA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 02:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EE98A349DD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 01:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FB0244684;
	Thu, 20 Nov 2025 01:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DeZ8W3M4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8D0259C94
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763601094; cv=none; b=HiITCz0RKfdqdDes8d4eyKqpZib6FtfEIZBEVjGRGdIO/ZNwHZpVNLzBrT1F4LRkry4qPIbLDyIuWP/ooF/e/gztBWHqj0FV+lm3+tygHdYVx5OB6BHIhx2+bH31Z++OS+VLVbknt6Dw6OYdyt/+yG3Ik+AT6jlfPtiD7vqf3uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763601094; c=relaxed/simple;
	bh=HNKStvuc0XB3JshjhPWn5gZkIa6YpjmT/QSv6jmE+eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IuVLMhXlRo6c5j+a8ogXsICuabLHKrBmcjG4qjAZHKbxB7HBEfllbPyyczpOkMrp7ILWr8RQqBfaeh2qiUE/wXvs/4qXhY6GuCIDUaRXsndaCfDGrbIhkXaNPCpq2qw3I5WL02FmA1ZxsyQSwSeshII6okAVdfWtoWj3vfxZ5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DeZ8W3M4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b737502f77bso51905366b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 17:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763601090; x=1764205890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNKStvuc0XB3JshjhPWn5gZkIa6YpjmT/QSv6jmE+eg=;
        b=DeZ8W3M4gQr75dWQDWkVwLFFHPLeuU809qlvkGdOB3bAJKwleybWzYVKv/UYxerEmL
         /fyiAwoWiFAsLYvKH25D5QR4vUkfzqWJQjaEbZi3dyzdJ+ez3QDWT7tAo89rfdVJAO0K
         8eEOYyvCpezDxwHiqli/jlTfvtHl5GZHO8kxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763601090; x=1764205890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HNKStvuc0XB3JshjhPWn5gZkIa6YpjmT/QSv6jmE+eg=;
        b=NiaRDokB8wSNaPuDK67eY4wiMsWzlBryb/H3VQxbUdzqx0J6A95eYdVMXuK2AnvFv1
         /FSVqKxxNSw7Oz75jvCRN4r5esx7HcKgOp5ErAcCxIpUHUzkumAmoYWkB7aWdAOxKf12
         stefhGxUVbDi147Meq5ou7WkH2axscuGA0BKfmV8rP0EF4JZGyDXdbCoHUAzUObXCrM8
         rmm8BDaqOt2lSKVuTv2Mj1/1gRpzuDBoBSOiolQ6ascTkkYUgT7KwLoZzRGuBMtCIhhn
         U5qp6rgAFEJvSBXVO5dCFMbBAqk97/Q+A99SIoLlqirVock9t/PVq3FwAjeJa52KUhrV
         YMog==
X-Forwarded-Encrypted: i=1; AJvYcCWlpDHZ7kNolxse7mdSoPGEnAaoMjeBgfimmq/zNtaegx9uxtVMnxA1XfijMe/eprppegV3WN/Ps3kwhxzh@vger.kernel.org
X-Gm-Message-State: AOJu0YwloiRTPkGGFZwUP+DFUhElDyDRVz6higwpJwKE28uBnr8qhfLC
	0k6aZCUVrYkxKVqdwqyyNZumMauDNIfu6+B5m96VO/EEqRWXNQ4H9SvenwZ1/Rka4o3uEBN9SR/
	Qo7RIfJ0k
X-Gm-Gg: ASbGncsR1CBKqjOkUExTNT6+af7JN8SYlrgAVtGxtQHRzAESsheVCn0BiKPPTQaejGB
	cR1b8Q0yynZOfBxm8hPuD4X7LmfI+clE/mpgaSzt//JVg3JGRJ+7oIdmv7nyBb6iiN/FtkCoy1m
	fl1PoKzuqZZ6hiTlbEwldnJgPCjNjxHjQKP6W5Yc4cdmXwi1Y9TxbdIG0KJE83tl84oJVJEwJnO
	z35wq9YRC7y53WgKex3Tb1uQAe/UngrfCbLnozFo/3mVqyIZ+ZRUONdQnV1xNR3W1ov1y8y9aJh
	+liXWKWSIphaE/NCZKnbs9bdByS1zAmXfFMNP5ONpWDmdyQBY0ctpf8DWrqnESx0Qqho3YD4sKb
	VzFIniLgSmpwib/rSus1bnYQoR+r/ahwDg0jvhebor1EhE8Y82fsIyIi85h+jx2u8PGskvdp+bu
	bLlW4F9mAeZF/8QHTCkmJVcgJRHzDcP4G3g9QGvezgcbuDz4xR1ZgR2PytvyAARBTmoGwW2Q8=
X-Google-Smtp-Source: AGHT+IH8akQ9vxpcxTSoZD3ubEcTc/o1Meb2jb2U5I6mvR9hwFpQ8rztKPPSzJZhbEFE/hMSIf/pkg==
X-Received: by 2002:a17:906:dc91:b0:b73:59b0:34d6 with SMTP id a640c23a62f3a-b7654f66a19mr114825366b.33.1763601090399;
        Wed, 19 Nov 2025 17:11:30 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655029543sm75799066b.61.2025.11.19.17.11.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 17:11:30 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b739b3fc2a0so50754966b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 17:11:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWML5o3Y3LEFiJYbgHk8boXwrH9f0tzyryvlsDkn0gVsFrZm+3RG+uw6u634kAPdt3A03I4/AccqPPzJqc@vger.kernel.org
X-Received: by 2002:a05:600c:3ba8:b0:475:dd7f:f6cd with SMTP id
 5b1f17b1804b1-477b8d8eec1mr10748455e9.35.1763600661833; Wed, 19 Nov 2025
 17:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz> <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
 <d81b0e70-5e3f-4e33-a268-e8b903904e9b@oss.qualcomm.com> <d9c91625-a829-474f-9fda-5e39342bb4af@ixit.cz>
 <96673da0-d8be-4b82-9e8c-2263f752881c@oss.qualcomm.com>
In-Reply-To: <96673da0-d8be-4b82-9e8c-2263f752881c@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 17:04:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VrB8FycxF+SFpP0-LBuRh00q6ecQ14fJj5fBKcFqsdCA@mail.gmail.com>
X-Gm-Features: AWmQ_bmyj5sGx4tyY9L7h2oSdpAiPgC3_696WJh5bzTVt6VHuCNSI8LWrwUfgrE
Message-ID: <CAD=FV=VrB8FycxF+SFpP0-LBuRh00q6ecQ14fJj5fBKcFqsdCA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
	Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 18, 2025 at 5:41=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> > Yes, there is only one firmware, which crosshatch has different, but al=
l listed in the initial bringup are used for both.
> >
> > To add, crosshatch was somehow not that popular device, so as I've been=
 suggested in u-boot discussion, I would love to keep blueline everywhere.
> >
> > One exception is LineageOS kernels, where they go by name crosshatch, b=
ut again for the both phones.
>
> Google seems to suggest crosshatch is the 'base'
>
> https://android.googlesource.com/device/google/crosshatch/+/refs/heads/ma=
in
>
> Ultimately if none of the Googlers (hello +Doug) care that much, it's up
> to you to choose

I haven't dug into this patch series and don't personally know a lot
of the history of older Pixel code names before ~Pixel 6, but in
general I wouldn't expect Google to have much of an opinion about
Pixel 3 support upstream. I'd say leaving it up to the people doing
the work sounds good to me. :-)

-Doug

