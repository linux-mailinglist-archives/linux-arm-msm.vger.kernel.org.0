Return-Path: <linux-arm-msm+bounces-20225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F339A8CC153
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 14:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DF73B20C07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8473D824AC;
	Wed, 22 May 2024 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G+g9r04c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12180130A53
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 12:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716381355; cv=none; b=N9TPCao/dzAaMgM80cM/rvXw+Xj0gi926L/iOFEqn87aQEZWIApnTcFtHbLESCq2OLEoGmJGf29+4NgWloYSd2hRlXEp/woqliYH+Au2yzh36dCNmkOCuzddXdaJw/welIeHS/ENqA87CCKOnOwX3NGD1HGdw1KuD7tetcOEQaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716381355; c=relaxed/simple;
	bh=bdxw+Q0XGRmuFjdwhmwLig3zIBnPf0qvOWQa/FwvDVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5lpNJgxNeNE4lbR1UomWz8sTD+USfvop86wQ2/Hqi2rRIPqi2ZyPMGfOam/Ak4BC/6s/Emb5kLup7r9g5l9WXbHHYxpRfGZZy0X4jwSxP+QnjBXcvEHyFlNZfzwAvZRR3u8xZA0qmCwAJR+3pdw88CNQHrdddY9Zk39FT+ZMIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G+g9r04c; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7f7809ae952so269738241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 05:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716381353; x=1716986153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iVUa+HtknJVyE1LRWMYlqdPQQktkEpm5BV1SvyrxPpw=;
        b=G+g9r04cREdl5z12Gz9Nn2L6dhr/aoORGeUfIEXqFrndPS2PzfOp/22D5hJZUFxc1C
         gcxgXddPBKjLTd+es9g6izUuGjUoP31zbbrJkenV1/ygzFpiJu1KVMfP6yN4WU2/zowT
         WOtqfZ37gjiEFL0XNc6G3n1QOPXHkQdaPXub4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716381353; x=1716986153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVUa+HtknJVyE1LRWMYlqdPQQktkEpm5BV1SvyrxPpw=;
        b=DC/FYnYGLAqdFnCIhIqofZuGlGk2g+ovaz3mjkE+dtg5T3uGFbQxtUkb3vQZDVN6sk
         tCOniSVYk6LCq0957RXP8C5g9Z/PwgE5TsGfBMYR1UN9qROU8yH5Cs/0qwv8zNGfUNqW
         SsYGmHNscg5ed84WTa/d8yY8TsWHl4sZni68HBd8YcQEEBWdQvy392nVmKEEC1ogtcoc
         tCTMXIMqutjHDFX5cULG/VyV5Z/ocCJkbrDZNCvHKh2L6J/G30xAaLr7VC7WTgjx73LJ
         NEGSRwU2bQn3mpZ0ohX3WGUw0r5d6efZiXq+1CUrwkZZqwSZCu1Bgwllq9hxmZy8TITs
         tbkg==
X-Forwarded-Encrypted: i=1; AJvYcCWE1edj0eHZ66b8Kren5deKt9xM9MpyrHWcf07pvJ2HfXwEbHB1leAdH5GlZ95Q8dvFenUP+peymX4GsWnXEwKngjuBlgnUw0GT22Barw==
X-Gm-Message-State: AOJu0YypaMR98mmrCR0p5JBqxOuZ/dBkDjZE3huMotNnAlbgx0Q6WeZz
	BL6OES1TO1wbiBJD5JLTzX16WBRUflvb5nK4iMX10Tg8SCx9Vo7liAcn0PzhB3dVsSGppXs148g
	jQg==
X-Google-Smtp-Source: AGHT+IHG+WbZmRghygomi+v/M1beXsi9keC/bq5JfEiK8rSAjM6D8eTGrXII7euS1MMwuDhgfTwCyg==
X-Received: by 2002:a05:6102:c92:b0:47c:3477:b4a1 with SMTP id ada2fe7eead31-4890a2760bfmr1742441137.15.1716381352722;
        Wed, 22 May 2024 05:35:52 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8031baa6e7dsm113421241.33.2024.05.22.05.35.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 05:35:52 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7f7809ae952so269734241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 05:35:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9GbYTBRpf3exVtJBekCoGRTgt0DH4H5Wm0Y1dPij75qANEZZivC7DAD0K4xFPC0Erlcuvk48DbIGrps56OEGrCpvIr4WxdZ/SQ8hdzA==
X-Received: by 2002:a25:dc8f:0:b0:de6:1534:e0ec with SMTP id
 3f1490d57ef6-df4e0a760e3mr2044809276.13.1716380915690; Wed, 22 May 2024
 05:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-9-7aea262cf065@chromium.org> <5eec6d69-badd-46f8-9da6-a578d5f7c3ba@linaro.org>
 <0e6ad5e7-ab20-495c-aa76-77531a53d459@linaro.org>
In-Reply-To: <0e6ad5e7-ab20-495c-aa76-77531a53d459@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 May 2024 14:28:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCuQtND+jbAAv0UYmtgO9g95qshY=HZVnyuraC0Ud_cD_g@mail.gmail.com>
Message-ID: <CANiDSCuQtND+jbAAv0UYmtgO9g95qshY=HZVnyuraC0Ud_cD_g@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] media: venus: Remove unused structs
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

Thanks for your review

On Fri, 10 May 2024 at 01:56, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/05/2024 00:35, Bryan O'Donoghue wrote:
> > I think these structures should just have the "[1] -> []" conversion
> > done and be retained instead.
>
> They won't have the same sizeof() then so ignore that thought.
>
> I still would suggest dropping the `something[1]` in favour of
> `something` because these structures document the protocol between host
> and firmware and therefore are useful even if unused in the code.

The structures will be in the git log for the rest of the days. So if
someone has to use them, they can recover them from there.

Right now, they are not used and they are triggering a warning. I
would argue that untested code is broken code.

I'd rather remove the code.


>
> ---
> bod



-- 
Ricardo Ribalda

