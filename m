Return-Path: <linux-arm-msm+bounces-91964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGCaBNvyhGkF7AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 20:43:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F03EF6EA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 20:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 094613014C23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 19:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FC3329C5F;
	Thu,  5 Feb 2026 19:43:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF31237180
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 19:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770320599; cv=none; b=YIbSBW90SpkTQT0THOChY3YIKBYFaALi1YA9K5MPFxnqb0FO7gJYDigu3P82WGJiAPFGjgGeEbSfEPHTr+DwfP+D7RBTMfXJMAHerwdrL3JK8PY/eVfZia/hIeUo8u24oMGDQN+z00a+Sddrqj5wYSz2FN3FHDzNJjASZughRfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770320599; c=relaxed/simple;
	bh=NADkIUPSPYJ6eoj468PahRViRu/F/G/7pnep2BZi9j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyuYJJ749ZU8B5VfF6M9fbZfwjPURzE8HVsNgpeZ0DORtU+Awtv8gT/ALk/FhH5KVQFj3pU34xBC1xi0s7dXnZ0wAgX8iiQ8chu5YolxXzuaFH6KBj3FHXp7HQiZMgsIp74aDWphNtv1yP3IHFapMSlXWjzu8Yu0GmU1fpSog+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c5386f1c9fso171170185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 11:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770320598; x=1770925398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NADkIUPSPYJ6eoj468PahRViRu/F/G/7pnep2BZi9j0=;
        b=mI/SIozv0RZbHGm5zHJbrUWyqAxNZgF/799oEMyqkUBR1MzdOyO9nYNPtzEVdcYfhY
         9WHLYjwY2RBwnGs40B5+xso0RZRR3g09Od+jxLwhbvuUfucXt+rrRwYjvdrPbq5NYgmO
         nEKuY4vuO+mBh2YXsJB0Q00rvHnjlkG0QbtcXxC6nPDhFXTt5MNisZSb4pELToOFiro8
         yibr+dl9hY5y+GpEsG1fJxgUDA1NnltyId3dTt4MCrgolSQjt6PySI/w+w9dmawjclkA
         UufWwQUp359vGalMxYqPKHvFQEcxakj5JXnyWc3pMJsP4Q87XB/pgdIyC8tqIT7VQILa
         QhfA==
X-Forwarded-Encrypted: i=1; AJvYcCXgFyZFpy8NXdLBp1jaNUjzSNqmpYYG/Z/wSN//9mOtm2gmNmFyTpB/Fjw3YTn/we8q1xdHFbdmEYT9kk6m@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2B/NOgzEnsEa7RXmDqvY20y2Xrc22pPAmywJiaGIBjuswLojG
	BBbyIPqnjXvY7ajC7/V0J53CRAaiZL/39bhCOsWg9XMCyKytiynE2v0AL9qPoxHx
X-Gm-Gg: AZuq6aIw2FKV4AAjGb8lLYoVG4il4A9IpQiA7USzvY7p55TVoKFhv0orwPeXsM/EpYm
	OiEucb/svMgiW41WSD+kQRHDxlzRaSq6dX4Q/ICqvvTpKzdE+xtzt2RUnJBdkUGSiMYcO0OVDrQ
	K5FyVsiBf5ODP/VHnopHBwDPz0FGjxVKmPpGcbMZPFkwPUaJ/Ig7UW8iv5gUhAgtieirhcdhnIK
	cwVfFBEkaUhUmRWglLAmJID/0Y7Tl1rjRNhdVHPtXtUzrvi/FfeAMHOLiiGljFRjr/lcCMS9kD4
	xkpbmXsMzpXSfYPWasqRTYm14u576pxDoojYU/I10YnmjZwL4qzwYCc3V0fdfJvETTFoXBOw0rc
	6NRcZuYmekMPyLJ9MhaUnDG4IsMFjVYryEO3O7dj+MrMcv8bVwppiFHeWZFX5y6IISifh8LOOi0
	ZFyXMWr179ARbYMTZnhuoedmjvYm7SRRiJlYqaQQMtVQArsw==
X-Received: by 2002:a05:620a:7010:b0:8c6:e1ff:8cfa with SMTP id af79cd13be357-8caf1307e4fmr28895685a.60.1770320598374;
        Thu, 05 Feb 2026 11:43:18 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cafa3bf628sm4832285a.48.2026.02.05.11.43.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 11:43:18 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c7199e7f79so169292785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 11:43:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCDP66UaGTenf8vybad87XHe6I+DUagqLPSTY9wXpmBK6jGd1tW2IFaMf+wy9gP4IX0dM7gZXj3m/DdUVW@vger.kernel.org
X-Received: by 2002:a05:690e:24c2:b0:649:40ff:2933 with SMTP id
 956f58d0204a3-649f21b2ef0mr353888d50.97.1770320199620; Thu, 05 Feb 2026
 11:36:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com> <20260205-calm-aboriginal-mastiff-b07eb3@quoll>
In-Reply-To: <20260205-calm-aboriginal-mastiff-b07eb3@quoll>
From: Roger Shimizu <rosh@debian.org>
Date: Thu, 5 Feb 2026 11:36:28 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEm-A8mDS=6V3h=2gHOhtM39q+bR79sSFhDTvbEJbDJRWA@mail.gmail.com>
X-Gm-Features: AZwV_QjZObttSH7jw-q62i4ilWQ9P8pUKpyBFPt_sGdKcdebjL-CU0t2EfBq4Fc
Message-ID: <CAEQ9gEm-A8mDS=6V3h=2gHOhtM39q+bR79sSFhDTvbEJbDJRWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI
 Port B
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongyang Zhao <hongyang.zhao@thundersoft.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91964-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,thundersoft.com:email]
X-Rspamd-Queue-Id: 4F03EF6EA1
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 5:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Jan 28, 2026 at 07:15:47PM +0800, Hongyang Zhao wrote:
> > The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
> > Port B. Update the devicetree to use port@1 which corresponds to
> > Port B input on the LT9611.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
>
> Where did this happen?
>
> https://lore.kernel.org/all/?q=3Df%3Arosh%40debian.org
>
> And again, v1 was completely different so how pre-v1-internal-review
> could be applied to this v2?
>
> Honestly, initial guidance is useful but continuous development behind
> the closed doors is not.

FYI. v2 was updated per review feedback, which is public:
https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org=
/

-Roger

