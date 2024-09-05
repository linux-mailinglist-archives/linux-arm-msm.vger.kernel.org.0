Return-Path: <linux-arm-msm+bounces-30868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241ED96D5A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A6F286721
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 10:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2018119882C;
	Thu,  5 Sep 2024 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="UYQzLG1Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6722719413B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725531399; cv=none; b=OVky6WCBjUvLPVOF3M0s8XILzGTHd68xgR8qai1gkruQGtOnQgqHFn/y190+WZ8yVvVeKUQZTJqFVjehMOl0O/StTxI7OOZ6iqyO2UqPT00wXMYY6X7tAuaGnZ3ezCIkQcW1cTC7ftzupVNmu02eZ6CMTgp1cHRRSMe89wvhBjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725531399; c=relaxed/simple;
	bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVMiBF+0msMiAljeBuI/15eso2eU4tX85OcgdGeISd/EXY5DdI3MGKE3ujRmgaBmtkJhMH+lZiojNuZLjKo3N8TqmPoA/jihwXyYAOXRWX22codoDZYJUKOklYPe70aIjmev9qmFzuzshF2RmbaM4P8ablU7mySzATOV7vXC9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=UYQzLG1Q; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e1a819488e3so641619276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1725531395; x=1726136195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
        b=UYQzLG1QisgvNJEIC8/eI3znrXkyViMVCWCVEUViKF5e19PlVRf4UzXoOAm8gS0cJk
         rX61+3RdZ3wGcPQJSKbMIAjfTZkMNCiXOjFEpKzWYhW2eCgDw7ydIsCJPpU1Tpyh5Ln6
         mLY965zl+xccCJVqgVMZQA+1k4havzizImXF3vozWXyjj7sMdZGm1tRVewINlRCXdqfs
         9WjBHp/QULdL8UAtb3ZvwGeSEJMl5/h2/sgfjekCOPVyPDekbbd3x+QF56f4EVIp+3le
         p3xsmEq681joQg9HmMYRveCVwxnQV2tZETwi49yPhgUg7WMa9CANBbvhw/x5Gi3fP1C9
         HFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725531395; x=1726136195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
        b=XBNWsKxhsVrlckTPQFycDiRf2QnhvZFq8IOOnDq5jhlPkcS7g2Jm+F0s048exqsQ0N
         cKlOG4yqsZ90v+8OdXC0o25zOq4eQVvVyhc0yRZdRJ9nqhLinQoqbP7AJFyNEdheinQQ
         QJBxyVLCNQVjPwCu4qFjzFzg4KiyrhoAhdB9byVezy6Epu3rh3V1QjkPTlTiGVQVOOfP
         WlCQwNwI+IgOusdamVMn8vQPTba3LvQGL6L6ws0toVtZANzj081wY0ASoHtFsEZbwpSd
         /1QPO8KiiH3OiZbeHQ5OitgtoG++Pj5QgTloly/m9UxLGVohgfrCdDdHt2CpGy4tDxZe
         md4g==
X-Forwarded-Encrypted: i=1; AJvYcCVnsjhqgYB4aFXHQlE244cFCxrGRoVUxW/gIWyZtTP5Aw+JtVyl2E5KdmVPya6xMvcL9YSmkwtl1zAJopcg@vger.kernel.org
X-Gm-Message-State: AOJu0YxKR1uSDlcRHLQfiuKGZM43+sG0xIEDytdPQyceiNYvQdza6A/2
	Uq6zBUbVRRz60gwYPpRDG11AWqGBDK75Q0/jhFzlf6JicZojMUOa+hzPj2ntAlC58c8qs/GomSA
	m4GJTDIVXJ/32UYKAgr8Z9nKl2zKmDiVx82+PkQ==
X-Google-Smtp-Source: AGHT+IHOAa2WnFWM0m3QmtHGwmSzixacJsCBpWRBvguStq1YD37bVLj0/P6F5Iapvjw7xs8jP/X43ydPbq380G1rQQ4=
X-Received: by 2002:a05:6902:1547:b0:e1d:1b8a:ac4 with SMTP id
 3f1490d57ef6-e1d1b8a0cbemr3960625276.11.1725531395247; Thu, 05 Sep 2024
 03:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905093935.2780632-1-vignesh.raman@collabora.com>
In-Reply-To: <20240905093935.2780632-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Sep 2024 11:16:23 +0100
Message-ID: <CAPj87rPCctE=iJKfQXR-PJdUHR+5f-t2bRA5Daq2fzUTNekzcg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: uprev IGT and deqp-runner
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vignesh,

On Thu, 5 Sept 2024 at 10:41, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Uprev IGT to the latest version and deqp-runner
> to v0.20.0. Also update expectation files.

Thanks! This is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

