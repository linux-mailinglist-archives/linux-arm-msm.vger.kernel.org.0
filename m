Return-Path: <linux-arm-msm+bounces-42371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854F9F38F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02F2D16915E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB3620629F;
	Mon, 16 Dec 2024 18:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K9+GZXRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C95206F0B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734373744; cv=none; b=hvehP0DiNqXuETo78efLR1iIQ5AR01oXVUT1K/1Bip3j5lpqIfAJkfglkKk1cGio3xHVECyu/1fneuK1V5UFVPybNEIkj08DfFaqZ9N5KDpDkm151d2bErd2OVcO4nNh/PTwm8q2CvKc/qwaGQabYaRwbVR/uy5ijTXjqnIwUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734373744; c=relaxed/simple;
	bh=/TIlSRQ7ahuGDkgFihn78l4akEjGDGdpYykjVXL65kQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDaMz21JAhnVu1Lo+ZtbnTM+Hx4okfPtcc6xemQIy4Tip3BDjKSxm5HUU/dydscJwNIvNAB7MFV0D7R/1zjnI5wsv7UaFCmsz8sAeSgSsCCbxgQZdMVzvXbr8gpoECFTWLapoGWcUF91WsgJBpPLT84uZVRoGv3i1sf/KBeiu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K9+GZXRM; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6eff5f99de4so49385807b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 10:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734373742; x=1734978542; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TIlSRQ7ahuGDkgFihn78l4akEjGDGdpYykjVXL65kQ=;
        b=K9+GZXRMMQYZkdnH8nQsmphmmr4vjoiai6PTK5NGYoz9rWt5wHUl79cV6XG0UmDJg0
         +XfpkGlqBVScNPAn1hWwERQTYNyu+Ae844n2Lk4sXjjWCJDf9iBrVp4m7xF3i86Osrpz
         f0jUL6x603Hy5jZc0SUI4xj/qRa/cRA952dj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734373742; x=1734978542;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TIlSRQ7ahuGDkgFihn78l4akEjGDGdpYykjVXL65kQ=;
        b=Ui1l5NJAcQUUG1SVHGGUYsURMbkB2guetR8aVTcsAG5qCiGUrfQTQhR2VJwGkHpWCa
         XKWqvjtciGEym0eNdiDcExUj8/EOVlMI7R7zEh34p3Rt6Opswz5iUj4iZS5qYPmUKWP8
         gYKM2t02UcmkoTBlI+wTu45ng3dex/OKyOuVUr9aIx0B7EnIpF+Xh+GDNl15tKSn7pWG
         X4kKvYac4IZiD9rUSO+ReqsPR3W8nRZOeJ5DasUZEBGZbS18kQTyq11e/cd5ybGCf4mT
         hehTJuMnmv3Sj7qkM7cDfwzphPUvoVO02IU0dN3KrDBxiwV06pQPT9RhOln5OR6+x5OJ
         xgPg==
X-Forwarded-Encrypted: i=1; AJvYcCVS8IMOh5O5GbtRRNPZKneCgt1OWDowjmC1dkrFOvDwui8hZvUlT6uiGffJuT3bfDmUm2wyzEt/sxo1GccD@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYcuN1fog+frTXCy9Pz+mjy7MLbuoo0fkOSwouDOevYMMHmGv
	jYfcyF3Bko4PZmsP9dPaRmYqstgCk42tcfuERFyH/NvBg4oeS/OmJqof3P2x3+mugmea9JxWyzs
	klWQMK4Bv/+pDfELFkEeeiMYoNhaKhAgZe8da
X-Gm-Gg: ASbGnct0TnUHVOadJ05EwlgOdyrga0rOjwnACAdAqDVzqkXjPaSb40ZM5/eFZrWMhce
	NghjpsRNKT8WRiJhKbUjgaFKyx/eGrHkjs3ABBDnqdMogwmMAvmh5dp+rpOzaNG+ESA==
X-Google-Smtp-Source: AGHT+IFQ80scUMo8d9IxWp5aJ4xwNtnqqvy6ffJBkw26JRJsHSxXxD+1I6D1JK6A0t7aCTHue6+bvR9ehNx3WdpmehA=
X-Received: by 2002:a05:690c:b15:b0:6ee:5cf9:f898 with SMTP id
 00721157ae682-6f279b75052mr120990327b3.33.1734373742393; Mon, 16 Dec 2024
 10:29:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 12:29:01 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org> <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 12:29:01 -0600
Message-ID: <CAE-0n52S3k01eueL_GZ4Dk359x879EDiOJ7zHK_BduM3bkJVOQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] drm/msm/dp: stop passing panel to msm_dp_audio_get()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-15 14:44:10)
> The dp_audio module doesn't make any use of the passed DP panel
> instance. Drop the argument.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor

