Return-Path: <linux-arm-msm+bounces-77380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A264BDE63E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 929F45007AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2C5326D49;
	Wed, 15 Oct 2025 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="kv9LPWaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052A617A2EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760529874; cv=none; b=EfvrjwvHe1GBeo5Kg2fqsCPuhd8OjoNiDpYFGu+nS6Ff3fzAwVSa3QYdIe52Tx/GXKRPkKATdmoE/WgmD1PVA98GKaijCEk+VNsRAQSwZ2QxsbSzcfTrBaADlg2lt1amIRWIyOcBcZoAtsjxEXAPOFBpxfBJi1HMaNeaVyMw4fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760529874; c=relaxed/simple;
	bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hxk43ItziFPt5hWa/9uivJK050Nm87Vk1e7B43oyW0znuRdKPd1+rKUTVPNzwWmtp+HJipNVWURw1jvcyBqqK9e3ttBSCpt2rSQKx0TKN+jNTZmrTt1cmsunZ6rAo/No1SsIilto/Cv/tgQdpZ3Clf+Yh8fbZOl/iTqI+w4d3GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=kv9LPWaA; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-856cbf74c4aso1238755885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1760529871; x=1761134671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
        b=kv9LPWaACrhzDP5vfRvqjBapHVNw4VWvPePvx0fBJXIly7iCZVYR7sBVR7mrKtuXhb
         D+NkMSd3HveDEfLth2lwAYtTKspKR0+8cW2+TlTAWzASlyfOc73zTYGNGs9sONvPfIJz
         MO9opReUZQPNjtyBJe0dCrn2ELS30qyN2tYcvFPDvIgun2v23owx4m6SjRYL8PUNgnPA
         Jxsriswu2/tuyra3IH5u9Yj6h40a8eTWWxL+xJ406gEONH8uzwrSN+kxOXfMXou4vC8y
         3frZSKARvrft6tTdjvSA/yi3Le2+nxiJTbfAXzCQOis6VpZo5Wzjyvg7mxQ4YUr6m/el
         5vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760529871; x=1761134671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
        b=q/HQCdMu/Tu6exXC9tv15j3jajn4ClOGLxgLa3CI9tAmeaWpC4e7L/vcSkMuyGgWVL
         5yzm5YVmG1/oASSqNK9UrFzvl2kxHSQLqJjjWq2z1pLfQqZmIgD6/68kfVhEGcQAfYZS
         azeWa2MQ66rghJzb5ZtQahxlJxrt+r5bjJ+ac2SBLw4kqcSZImQ7v2CcPxHJLsiEJpp4
         Yi9IO6pKVZDvOPMnBKwOp+AXwyQW3SAW3IYQ/FomtTJfGFlMF5SwL3rKUTItR9Huh+da
         IFU+hK578Rpv/BGf9tNlhcbmvt+fZRcxnaKb2GI81uT/Xtmj1qRgQhj1BISuAfqObnO4
         zIgA==
X-Forwarded-Encrypted: i=1; AJvYcCVGOek7UfwXkOHdvJLKipH6PQH9eqmmZw7Y1v1EfJfqYnkHUIaVoeApDcn4YhS0t3umCxXjqV8fxBOT7rVB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19aKkYqY/8PkMwER1yPy7aC9Mpf0EJzFYTSU+IJp3mnxzIT2Q
	sxmMWjk1gHRKkEaymsLelpw8rhDdPj6xf0D3oFwT4Ld67OKvU2aTQotMqjdaJ6+nKBldzJIbkAw
	FD9orkQLPwzkqqr9g49QOr0JsM5nZK5UMqG2JtCf7Iw==
X-Gm-Gg: ASbGncs4Rl3wIKTYhn7K7o1DvMExuQ9o+XI3rQ9CovR+eCq17vBRBEWY5NnErrjef2v
	C/cebJ8ilJII2Y5qHYfGlUR9efU5yjdzIXowp+dSX328Z4DiYQHb9/mAG+NMHT0iH7L9CHu54EF
	P2jri9NVT0DT/A2fIYgVfbkcDWOQdziRfEyz2Lz/Ma+DXdNTRlgE6HS9Tfu6FpmKy+zVrlrqKXO
	ZJfCi6NHdXGK0QVBUh1yuaQR8S5pGzvjA==
X-Google-Smtp-Source: AGHT+IGsy4ghNUujV8ICs5xCd3l4JFRIFi1WBGAyKhaZaEA9CMFYjjgZCN0vS1WL/9stf48sqTR9sa0kj6mJ0PU2Rkg=
X-Received: by 2002:a05:620a:800b:b0:85b:5fdf:69ef with SMTP id
 af79cd13be357-883524cb7c1mr3776426285a.30.1760529870781; Wed, 15 Oct 2025
 05:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013060212.14583-1-vignesh.raman@collabora.com>
In-Reply-To: <20251013060212.14583-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 13:04:18 +0100
X-Gm-Features: AS18NWBrg_BqO2tS4RN_x8d2btqMDE8us2R2sNEBkP2IYKjicDOGCIjh3Jp7IkM
Message-ID: <CAPj87rPDppYBRuQ99mh=VqrsSErGKcw-ZRY+zPuGrDj77G5k6Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: disable broken MR check in sanity job
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vignesh,

On Mon, 13 Oct 2025 at 07:02, Vignesh Raman <vignesh.raman@collabora.com> w=
rote:
> GitLab recently changed the required permissions for the
> are-developers-allowed-to-push-to-my-MR check:
> https://gitlab.freedesktop.org/freedesktop/ci-templates/-/issues/81
>
> Until that=E2=80=99s resolved, disable the check - it=E2=80=99s mostly ob=
solete anyway.
>
> Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37782

Thanks for fixing this.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

