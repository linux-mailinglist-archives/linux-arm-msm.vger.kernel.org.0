Return-Path: <linux-arm-msm+bounces-7828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83E836CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 18:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6AF61F270BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 17:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3062263502;
	Mon, 22 Jan 2024 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="obWIDtWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29163507
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705939477; cv=none; b=Xa+zTzkxiHqczUq8yS1vNq0ZqU4GUEUM2SMxVladqqG9vCRz/B5h3XCX1EIKEKgqd2AOObYnzOt+fd7ngoS3MAXgBDGDkuF0r8+dCKSOlP/9c5SxUcnyDp6NyUV1MLdV3M50wpdz0cTkh4RGWByXWwh76ivCU4G2RXeJfonKyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705939477; c=relaxed/simple;
	bh=Q6N6CZVxZjtA5zVfPfZPWiC1r2ruLWfffi1O8KzvX0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkJnTE4H6Mc3TYjWpJhehENoTqyo3YR1cF0kDdpXOhJ22zcIPynJTWojUWb781OcTk8yctnnmVcpAJIaylNaaiAydRcuYpNc2FxraBGVgJpU6FNCYgFC7mSTPc25ZuU78DypYFHhrPOEkdpct/bfLkFI/mtApU/S7tPYBSV6AlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=obWIDtWS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a308e6824ccso57235066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 08:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705939473; x=1706544273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6N6CZVxZjtA5zVfPfZPWiC1r2ruLWfffi1O8KzvX0c=;
        b=obWIDtWSM+85vEjipuSNhNMB6Y/Flncj5M2Bec2vyWFeJBNEFuuARoQUL31HCiWvhB
         iJef7RnTiq5PNQagl7efewOlP2vrJxsdBoHPkE4ZQxwJbkDR6rt5+h6sbhG+EMBOS6jI
         guh2IbfsvhDa+YNkZ7TiN4ZLhd+Rw5QrnPfNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705939473; x=1706544273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6N6CZVxZjtA5zVfPfZPWiC1r2ruLWfffi1O8KzvX0c=;
        b=tI55u5xb5v56DqaRdcOsP84bhg464SHgZxHn+YXD8SzZC7MMIzykOYFW6AT/tC5qic
         ZOS6WBCP+ETcbTE8QuRlceMpxyBd/z96hIaJuMBE4CuCa+iRz8ZwkkKcwE11+bqq7DfF
         f8Ckg/4cZEeeOnRM1HUwcWPbdrVMg8kh8mK/B8M1s67pLCaS3eswoWowpuPDKA58MFE0
         5qM+jbJIhFRzjjDgWX1EX+PehXdMpOX9VP/Y4RqlQnU9VMvuiIxmQYw8h4qxmq5UlNGn
         KzG393g9kFqH0/gudHmLPnxqtzDz0LApbpqxTYt2PCqMkT/pZvX2qywfb+McTEBNzkxF
         M8Qg==
X-Gm-Message-State: AOJu0YwRhc2nbyaYHhnY86dFboEaJfBCnrz/J4knlB+GjiUKwsrkvbLN
	g2i6RIOQlcn8CwipoHO87R8BMzsetMQl6BUttFZrrq0UtrR/ZlzC9S/+zmQjAjpEgzS0Ha8Ofj5
	kEA==
X-Google-Smtp-Source: AGHT+IGmxFi2QqNjChpcgWHU1mJnKQsjjbzQ/076YdfUSu0Q1YJ2sczt0M3snMeHgAPiWjTys7ZyRw==
X-Received: by 2002:a17:906:5acc:b0:a2e:adb7:7bf8 with SMTP id x12-20020a1709065acc00b00a2eadb77bf8mr1857732ejs.147.1705939473357;
        Mon, 22 Jan 2024 08:04:33 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id o18-20020a170906359200b00a2bf9b00508sm13649654ejb.141.2024.01.22.08.04.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 08:04:32 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e865bccb4so83545e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 08:04:32 -0800 (PST)
X-Received: by 2002:a05:600c:5188:b0:40d:5fee:130 with SMTP id
 fa8-20020a05600c518800b0040d5fee0130mr317861wmb.5.1705939472071; Mon, 22 Jan
 2024 08:04:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104101735.48694-1-laura.nao@collabora.com> <20240122151450.60234-1-laura.nao@collabora.com>
In-Reply-To: <20240122151450.60234-1-laura.nao@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jan 2024 08:04:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uyc-70pr6Em7WHOP9nnNVG-_zcf8awzZ3gJ1fq7feGxw@mail.gmail.com>
Message-ID: <CAD=FV=Uyc-70pr6Em7WHOP9nnNVG-_zcf8awzZ3gJ1fq7feGxw@mail.gmail.com>
Subject: Re: sc7180 kernel hang with linux-next
To: Laura Nao <laura.nao@collabora.com>
Cc: cros-qcom-dts-watchers@chromium.org, dmitry.baryshkov@linaro.org, 
	kernel@collabora.com, konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
	swboyd@chromium.org, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 22, 2024 at 7:14=E2=80=AFAM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On 1/4/24 11:17, Laura Nao wrote:
> >
> > Yes, I'll try to bisect this through KernelCI and report back.
> >
>
> KernelCI has not bisected this regression yet. However, upon further
> investigation I noticed the kernel was getting consistently stuck while
> disabling the display clocks (namely disp_cc_mdss_pclk0_clk ) and booted
> consistently without issues after adding clk_ignore_unused to the
> cmdline.
>
> The kernel configuration used by KernelCI had CONFIG_SC_DISPCC_7180=3Dy ;
> setting CONFIG_SC_DISPCC_7180=3Dm fixed the issue as the display clock
> controller is being initialized a bit later in the boot.
>
> We're going to set CONFIG_SC_DISPCC_7180=3Dm in the configuration used by
> KernelCI and monitor the results for a while, I'll report back to
> confirm whether the issue is still present or not.

Ick. I wonder if this is related to the issue that Stephen filed:
https://issuetracker.google.com/issues/319956935

