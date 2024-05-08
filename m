Return-Path: <linux-arm-msm+bounces-19546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 821AE8C0765
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24FC128444C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213E4286AE;
	Wed,  8 May 2024 22:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hgKBO+1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F617C79
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715208091; cv=none; b=E2sjnc2biVp9pHfUdZPdJEj6PxqjDeLMC+mexl4U7wUNlVbx/gqs4iO1YMO1cHnYV5EZ/LEL9xOyx6zqagnwseyem06lGZjhsLTE8ypn1EXDoS1O3ZMB8R4hH9I+kZWDJegdQNqWzcSGT2eix6/bKOM2gxJNd83EuzFFDfT8UKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715208091; c=relaxed/simple;
	bh=URL+ux74FcLHKQ/ZvQJboYQjgTPCQONFknkyVXoRCOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bp/lh6jmTy7icPAJaUyGUlKPISwDFyhscCcDglu8o+qoMM2fHOuACm6lMgDfVsmNikN37G8O/yfz1I3rOxmch3/SAiyC64kkzOWDG0vKNUee2eUmrp66TII4N73FB6NRsvesdpwMAtrikdKE5rSdWy1YaOdGwY7wzC41FBtQ3qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hgKBO+1t; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51fdc9af005so289011e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 15:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715208087; x=1715812887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwxEO1i5UPI2XEISzMMX9ftGaU8p/mPogEOhXcQuJ0Q=;
        b=hgKBO+1tGl2fxpcNnBBbDNubCZZvb3OxUzfSUAf2iIOMinZMNB5c/UPYlNsn1DG2cU
         oEI0wqNgDArVov6Y3bb/2rps46By51BOlhtgARgSzQDGx2Am6Z+2G2/ZHoVLMjnRibzp
         0wBBtghE61ynB7CQNrl3BXeDwIqqsSxG3XrzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715208087; x=1715812887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwxEO1i5UPI2XEISzMMX9ftGaU8p/mPogEOhXcQuJ0Q=;
        b=NOpZJTpCwYXQcWk+zCsuUM1wX3aEhxCIhOSzuOf0WXzQACv2iTvyfTttKU5HVWKP7f
         q8V0gg4u+IRikdx6tH9UM89RYA51mVy3c++CsABckc9RmKZGoTIAbiAAAEtHlYvPk/KN
         CiFPP1d17U9AfoLuAbcztZqiKfpYmipHZ0o3M/MffZ23ULAF7K1xqEld02r/N0QCbB7o
         VKFZGzpwUxBlh5/uIHRiH+fWaI4LOO5BrLjyEPt/7QqVRxSMIWXM5nvI0h2IfvaxNpxJ
         jMx1bd2Z2iMl1B9xeoSa0hjpPj96j+nbf95L3tLX2smeYFuwMvujbped2b2M47NPFd65
         WWCA==
X-Forwarded-Encrypted: i=1; AJvYcCU1BgFD4JqmZKxzuoN2oNaSz5sEjekHlJargdufQwvm2SshNJ0M6G7rutxZksuxiDw9ZcxgBVQOnrs4+oGvXiibpvxGjPZR991HGNoF9w==
X-Gm-Message-State: AOJu0YwKveUtsLscfvZ3GSKpVdPM6wAbOo+R4mrYCiA1ovqbXZxwKlvN
	P+6jlElHyVpB0neFcu4aQ8kV9UYgfeHg9fb4H7g4au+0EE/PU6zUT4MI2w2IGwKXBP+9JVyS11W
	Veg==
X-Google-Smtp-Source: AGHT+IEA92nb/dyO7Xme9PC2m8gucohsot7cbAA1nVHOp3ty7LS/WxQnsiQNsYJ6eVSzY0Dnf1Xrxg==
X-Received: by 2002:ac2:5bc7:0:b0:51f:6ab6:9e5b with SMTP id 2adb3069b0e04-5217c7605e0mr3080676e87.36.1715208086902;
        Wed, 08 May 2024 15:41:26 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7f32sm8130066b.106.2024.05.08.15.41.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 15:41:26 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41b48daaaf4so33875e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 15:41:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS3QoxtiJwl1eAZPKLlW55jDYZ88fytK6xc4UAycwLods+CwZFl3exGMfio8RbaKocGJq24ur/HmlZpWJyDimSy15UwxEOqsU7YpkCng==
X-Received: by 2002:a05:600c:b5a:b0:41b:e416:1073 with SMTP id
 5b1f17b1804b1-41fc27b0e81mr775855e9.0.1715208085721; Wed, 08 May 2024
 15:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org> <20240503-fd-fix-lxml-v2-1-f80a60ce21a1@linaro.org>
In-Reply-To: <20240503-fd-fix-lxml-v2-1-f80a60ce21a1@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 15:41:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnpS-=CookKxzFM8og9WCSEMxfESmfTYH811438qg4ng@mail.gmail.com>
Message-ID: <CAD=FV=XnpS-=CookKxzFM8og9WCSEMxfESmfTYH811438qg4ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/gen_header: allow skipping the validation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Helen Koike <helen.koike@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 3, 2024 at 11:15=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> @@ -941,6 +948,7 @@ def main():
>         parser =3D argparse.ArgumentParser()
>         parser.add_argument('--rnn', type=3Dstr, required=3DTrue)
>         parser.add_argument('--xml', type=3Dstr, required=3DTrue)
> +       parser.add_argument('--validate', action=3Dargparse.BooleanOption=
alAction)

FWIW, the above (argparse.BooleanOptionalAction) appears to be a
python 3.9 thing. My own build environment happens to have python3
default to python 3.8 and thus I get a build error related to this. I
have no idea what the kernel usually assumes for a baseline, but
others might get build errors too. I don't even see python listed in:

https://docs.kernel.org/process/changes.html

...in any case, if it's easy to change this to not require python3.9
that would at least help for my build environment. :-P

-Doug

