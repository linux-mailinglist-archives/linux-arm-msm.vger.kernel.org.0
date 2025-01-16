Return-Path: <linux-arm-msm+bounces-45276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C298FA13C0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4869E3A7E88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B40B22B5AD;
	Thu, 16 Jan 2025 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnZ9Cyox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A5322ACCA
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737037342; cv=none; b=YjKpdFTkQW6FQVjXiMyLOlMc1A9qUj0bzgzAnhMtUsxhy2lo2kZwDokqvIY70M0Gip/bX5lAhwsyOuBUyBM3ufxbsiqvwgU7D+yTNRSNa+jzEa17UBgESCun1BNwHaRlxvBmAX0hRtU6iYr4NVld3qGTk4AzZhrmP7d+IkiSdwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737037342; c=relaxed/simple;
	bh=+7L/qGdBRIVleR/hUP0pgpJptC5AqE806U4t6SXu4KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3cxeqMFOMT6ZraQ1abDuk8QtkdURB/h8CzxUbu8wjWOYb8jSfJXPQwOksmzDSvdzMfKb9XoKVnmWw4q1uXqyRRGcnHe6WtjS2IMLfpzUhwXkh0pKcDjFMx9BLbpMZCtawVlieMkABuGs0qlaKGEVjF/KPre/YwDfwIj5m/rfsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnZ9Cyox; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so1549102276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 06:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737037338; x=1737642138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbuGDZY9OMcPNxDGGBghCFG72kiSYqjW874tNYrUfyE=;
        b=LnZ9Cyox7DHYQ9tLmXSCT+OgqQ7aWWot993+n9LG+DfshHdEMXfOeoB7ahE0yYKlkg
         wCfql2MWrMnybDdM2HzOfvHYZfyHdqhq7o6ud1EswtMRBRz6vh16WdGwfg8MFTUkBVnH
         Sb46kQp7H+swTIgrCsMzcgefoGBJysNC0nNapySzOuZUux4t3pCP2Mfo5DN0hDSk0Gwi
         l22Y15UAegFr5PUQMPQJ08gnrafIwKRM+EV7xXZ/5xtQrEO87u3xJTL8WJdllkfYeeZB
         yVcqM0rO/xn8gRF1dbW2OUdtDWagyXsdovLXC6vAGns2f79kZU9n54+iGOUWZ15CxMj2
         NCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737037338; x=1737642138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbuGDZY9OMcPNxDGGBghCFG72kiSYqjW874tNYrUfyE=;
        b=CY1Z8Jn/ajY2wrdZRok4y/n4lJPW2iLtQMAUALA5gXCFhQfVbsRV9li1MBLu0DxsZL
         g2k/NN8tiIJa2VgD+1tLhP29Kd7M44AlBE8vO00VwISJTAPnQvTIZ9C8TLYCu6mxcrLF
         AdLFSe7+qmdYMPWspBP6dUyBh2tCqCNHlH+kbltm7ELWCWsvh/R/PpWbauSxn3ET1EuO
         Vs+WJOjIJ3k/JAJvtGaDBUcx69xINJV9ORz9WgkKV6Sp28mwF2ejSznB+BMPABpsHCIo
         owL/OiD/qPsP22mA4mH6sDc54yOVo6Dp95BmmOUmoRopGMUI9393aEOr4F7OZYxLhLez
         YH/w==
X-Forwarded-Encrypted: i=1; AJvYcCUA7YydBUKCWVlYuF5oT2gs3lHFWGKclqHZJaLShRQNu28UHLfgGTHW1qX7iJiHww7eqATMjp3eyS9uHlAm@vger.kernel.org
X-Gm-Message-State: AOJu0YzWOzsvrp/bXGMjz+MiasSvf+BP3b5/XVK8Sr6AmjyrEcjnUKm9
	FB6FYstxIGa4qrEL8RaAHMYMgZawZyog40ELIxJXyB7Ewcrlg+jELmIK3WAjzo+OcOFLm8sALcZ
	XnRSMjcfUcF5VxZta5144bzkR2PL2U7R4dn763jTU0SnPLyG9p/zW38z1
X-Gm-Gg: ASbGnctfzRHD9yqHbW0/HjnWXXumBfm2+kq6G/JMnlAjABHy8VKL0v3fwNrQcDN1bL4
	ZaPvBGgcLPkZVV9o5J+GdYiYiiBnSDo0S+ObNgA==
X-Google-Smtp-Source: AGHT+IHpVHqUtQvPALKWxgEbVerYIcWLhBHU/N9iKLPyTQmVZmgA6sC1QD/jrIZf+QH/2MqpX2ZsNueHigREXGRNnaY=
X-Received: by 2002:a05:6902:2e0e:b0:e56:c350:5977 with SMTP id
 3f1490d57ef6-e56c350607emr18592868276.49.1737037338327; Thu, 16 Jan 2025
 06:22:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
 <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
In-Reply-To: <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 22:22:07 +0800
X-Gm-Features: AbW1kvbNYMvnvklmfvw1tMEdJlgZxWihb_2YnyoIX0fWNnPoBLq0Dgu08ZgKo4I
Message-ID: <CABymUCPn=u8jr_OTFwB-WBjj2nNgBeTyH5b=PvF5vLrDhCxr3Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:26:03PM +0800, Jun Nie wrote:
> > Support SSPP assignment for quad-pipe case with unified method.
> > The first 2 pipes can share a set of mixer config and enable
> > multi-rect mode if condition is met. It is also the case for
> > the later 2 pipes.
>
> Missing problem description.

Is this OK?
    SSPP are assigned for 2 pipes at most with current implementation,
    while 4 pipes are required in quad-pipe usage case with involving
    configuration of 2 stages. Assign SSPPs for pipes of a stage in a
    loop with unified method. The first 2 pipes can shar a set of mixer
    config and enable multi-rect mode if condition is met. It is also the
    case for the later 2 pipes.

>
> Also, shouldn't this patch come before the previous one?
>
Yeah, it is reasonable to prepare the assignment capability, then
enable the plane splitting into 4 pipes. It does not hurt actually
because quad-pipe is not enabled in data structure side.
Will reverse the sequence in next version anyway.

Jun

